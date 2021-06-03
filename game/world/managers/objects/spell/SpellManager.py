import time
from struct import pack
from typing import Optional

from database.dbc.DbcDatabaseManager import DbcDatabaseManager
from database.realm.RealmDatabaseManager import RealmDatabaseManager, CharacterSpell
from database.world.WorldDatabaseManager import WorldDatabaseManager
from game.world.managers.maps.MapManager import MapManager
from game.world.managers.objects.spell.CastingSpell import CastingSpell
from game.world.managers.objects.spell.SpellEffectHandler import SpellEffectHandler
from network.packet.PacketWriter import PacketWriter, OpCode
from utils.constants.ItemCodes import InventoryError, InventoryTypes
from utils.constants.MiscCodes import ObjectTypes
from utils.constants.SpellCodes import SpellCheckCastResult, SpellCastStatus, \
    SpellMissReason, SpellTargetMask, SpellState, SpellAttributes, SpellCastFlags, SpellEffects
from utils.constants.UnitCodes import PowerTypes


class SpellManager(object):
    def __init__(self, unit_mgr):
        self.unit_mgr = unit_mgr
        self.spells = {}
        self.cooldowns = {}
        self.casting_spells = []

    def load_spells(self):
        for spell in RealmDatabaseManager.character_get_spells(self.unit_mgr.guid):
            self.spells[spell.spell] = spell

    def learn_spell(self, spell_id) -> bool:
        if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
            return False

        spell = DbcDatabaseManager.SpellHolder.spell_get_by_id(spell_id)
        if not spell:
            return False

        if spell_id in self.spells:
            return False

        db_spell = CharacterSpell()
        db_spell.guid = self.unit_mgr.guid
        db_spell.spell = spell_id
        RealmDatabaseManager.character_add_spell(db_spell)
        self.spells[spell_id] = db_spell

        data = pack('<H', spell_id)
        self.unit_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.SMSG_LEARNED_SPELL, data))
        # Teach skill required as well like in CharCreateHandler?
        return True

    def get_initial_spells(self, character=None) -> bytes:
        spell_buttons = RealmDatabaseManager.character_get_spell_buttons(character.guid) if character else dict()
        
        data = pack('<BH', 0, len(self.spells))
        for spell_id, spell in self.spells.items():
            index = spell_buttons[spell.spell] if spell.spell in spell_buttons else 0
            data += pack('<2h', spell.spell, index)
        data += pack('<H', 0)

        return PacketWriter.get_packet(OpCode.SMSG_INITIAL_SPELLS, data)

    def handle_cast_attempt(self, spell_id, caster, spell_target, target_mask):
        spell = DbcDatabaseManager.SpellHolder.spell_get_by_id(spell_id)
        if not spell or not spell_target:
            return

        self.start_spell_cast(spell, caster, spell_target, target_mask)

    def try_initialize_spell(self, spell, caster_obj, spell_target, target_mask, validate=True) -> Optional[CastingSpell]:
        spell = CastingSpell(spell, caster_obj, spell_target, target_mask)
        if not validate:
            return spell
        return spell if self.validate_cast(spell) else None

    def start_spell_cast(self, spell, caster_obj, spell_target, target_mask):
        #  TODO Spell priority and interrupting on recast - spells can be cast on top of eachother (best reproduced by channels, for example life drain)
        casting_spell = self.try_initialize_spell(spell, caster_obj, spell_target, target_mask)
        if not casting_spell:
            return

        if casting_spell.casts_on_swing():  # Handle swing ability queue and state
            queued_melee_ability = self.get_queued_melee_ability()
            if queued_melee_ability:
                self.remove_cast(queued_melee_ability, SpellCheckCastResult.SPELL_FAILED_DONT_REPORT)  # Only one melee ability can be queued

            casting_spell.cast_state = SpellState.SPELL_STATE_DELAYED  # Wait for next swing
            self.casting_spells.append(casting_spell)
            return

        self.casting_spells.append(casting_spell)
        casting_spell.cast_state = SpellState.SPELL_STATE_CASTING

        if not casting_spell.is_instant_cast():
            self.send_cast_start(casting_spell)
            return

        # Spell is instant, perform cast
        self.perform_spell_cast(casting_spell, False)

    def perform_spell_cast(self, casting_spell, validate=True):
        if validate and not self.validate_cast(casting_spell):
            self.remove_cast(casting_spell)
            return

        if not (casting_spell.initial_target_is_terrain() and casting_spell.is_channeled()):
            casting_spell.resolve_target_info_for_effects()  # Channeled, terrain-targeted spells will generate results during the channel. Ignore them for now.

        if casting_spell.cast_state == SpellState.SPELL_STATE_DELAYED:
            return  # Spell is in delayed state, do nothing for now

        self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_NO_ERROR)
        self.send_spell_go(casting_spell)

        travel_time = self.calculate_time_to_impact(casting_spell)

        if travel_time != 0:
            casting_spell.cast_state = SpellState.SPELL_STATE_DELAYED
            casting_spell.spell_delay_end_timestamp = time.time() + travel_time
            self.consume_resources_for_cast(casting_spell)  # Remove resources
            return

        if casting_spell.is_channeled():
            casting_spell.cast_state = SpellState.SPELL_STATE_CHANNELING
            self.handle_channel_start(casting_spell)
        else:
            self.apply_spell_effects(casting_spell, remove=True)  # Apply effects

        if not casting_spell.trigger_cooldown_on_remove():
            self.set_on_cooldown(casting_spell.spell_entry)

        self.consume_resources_for_cast(casting_spell)  # Remove resources - order matters for combo points

    def apply_spell_effects(self, casting_spell, targeted=True, remove=False):
        for effect in casting_spell.effects:
            # Effects that resolve targets in handler - ie. rain of fire, blizzard
            # TODO some spells are ground-targeted (at least scorch breath 5010) but don't use the terrain as the actual spell target
            # Use table for terrain-targeted implicit targets instead, check for effect type for now
            if effect.effect_aura:
                effect.effect_aura.initialize_period_timestamps()  # Initialize timestamps for effects with period

            if not targeted and effect.effect_type == SpellEffects.SPELL_EFFECT_PERSISTENT_AREA_AURA:
                SpellEffectHandler.apply_effect(casting_spell, effect, casting_spell.spell_caster, None)
                continue

            for target in effect.targets.get_final_effect_targets():
                info = casting_spell.unit_target_results[target.guid]
                # TODO deflection handling? Swap target/caster for now
                if info.result == SpellMissReason.MISS_REASON_DEFLECTED:
                    SpellEffectHandler.apply_effect(casting_spell, effect, info.target, casting_spell.spell_caster)
                elif info.result == SpellMissReason.MISS_REASON_NONE:
                    SpellEffectHandler.apply_effect(casting_spell, effect, casting_spell.spell_caster, info.target)

        if remove:
            self.remove_cast(casting_spell)


    def cast_queued_melee_ability(self, attack_type) -> bool:
        melee_ability = self.get_queued_melee_ability()

        if not melee_ability or not self.validate_cast(melee_ability):
            self.remove_cast(melee_ability)
            return False

        melee_ability.spell_attack_type = attack_type

        melee_ability.cast_state = SpellState.SPELL_STATE_CASTING
        self.perform_spell_cast(melee_ability, False)
        return True

    def get_queued_melee_ability(self) -> Optional[CastingSpell]:
        for casting_spell in self.casting_spells:
            if not casting_spell.casts_on_swing() or \
                    casting_spell.cast_state != SpellState.SPELL_STATE_DELAYED:
                continue
            return casting_spell
        return None

    has_moved = False

    def flag_as_moved(self):
        # TODO temporary way of handling this until movement data can be passed to update()
        if len(self.casting_spells) == 0:
            return
        self.has_moved = True

    def update(self, timestamp, elapsed):
        moved = self.has_moved
        self.has_moved = False  # Reset has_moved on every update

        for casting_spell in list(self.casting_spells):
            if casting_spell.casts_on_swing():  # spells cast on swing will be updated on call from attack handling
                continue
            cast_finished = casting_spell.cast_end_timestamp <= timestamp
            if casting_spell.cast_state == SpellState.SPELL_STATE_CHANNELING:  # Channel tick
                if cast_finished or moved:
                    self.handle_channel_end(casting_spell, interrupted=moved)
                    reason = SpellCheckCastResult.SPELL_FAILED_MOVING if moved else SpellCheckCastResult.SPELL_NO_ERROR
                    self.remove_cast(casting_spell, reason)
                    self.has_moved = False
                elif not moved:
                    self.handle_channel_tick(casting_spell, elapsed)
                continue

            if casting_spell.cast_state == SpellState.SPELL_STATE_CASTING:
                if cast_finished:
                    if not self.validate_cast(casting_spell):  # Spell finished casting, validate again
                        self.remove_cast(casting_spell)
                        return
                    self.perform_spell_cast(casting_spell)
                    if casting_spell.cast_state == SpellState.SPELL_STATE_FINISHED:  # Spell finished after perform (no impact delay)
                        self.remove_cast(casting_spell)
                elif moved:  # Spell has not finished casting, check movement
                    self.remove_cast(casting_spell, SpellCheckCastResult.SPELL_FAILED_MOVING)
                    self.has_moved = False
                    return

            if casting_spell.cast_state == SpellState.SPELL_STATE_DELAYED and \
                    cast_finished:  # Spell was cast already and impact delay is done
                self.apply_spell_effects(casting_spell, remove=True)

    def remove_cast(self, casting_spell, cast_result=SpellCheckCastResult.SPELL_NO_ERROR):
        if casting_spell not in self.casting_spells:
            return
        self.casting_spells.remove(casting_spell)
        if cast_result != SpellCheckCastResult.SPELL_NO_ERROR:
            self.send_cast_result(casting_spell.spell_entry.ID, cast_result)

    def calculate_time_to_impact(self, casting_spell) -> float:
        if casting_spell.spell_entry.Speed == 0:
            return 0

        travel_distance = casting_spell.range_entry.RangeMax
        if casting_spell.initial_target_is_unit_or_player():
            target_unit_location = casting_spell.initial_target.location
            travel_distance = casting_spell.spell_caster.location.distance(target_unit_location)

        return travel_distance / casting_spell.spell_entry.Speed

    def send_cast_start(self, casting_spell):
        data = [self.unit_mgr.guid, self.unit_mgr.guid,  # TODO Source (1st arg) can also be item
                casting_spell.spell_entry.ID, casting_spell.cast_flags, casting_spell.get_base_cast_time(),
                casting_spell.spell_target_mask]

        signature = '<2QIHiH'  # source, caster, ID, flags, delay .. (targets, opt. ammo displayID/inventorytype)

        if casting_spell.initial_target and casting_spell.spell_target_mask != SpellTargetMask.SELF:  # Some self-cast spells crash client if target is written
            target_info = casting_spell.get_initial_target_info()  # ([values], signature)
            data.extend(target_info[0])
            signature += target_info[1]

        if casting_spell.cast_flags & SpellCastFlags.CAST_FLAG_HAS_AMMO:
            signature += '2I'
            data.append(5996)  # TODO ammo display ID
            data.append(InventoryTypes.AMMO)  # TODO ammo inventorytype (thrown too)


        data = pack(signature, *data)
        MapManager.send_surrounding(PacketWriter.get_packet(OpCode.SMSG_SPELL_START, data), self.unit_mgr,
                                    include_self=self.unit_mgr.get_type() == ObjectTypes.TYPE_PLAYER)

    def handle_channel_start(self, casting_spell):
        if not casting_spell.is_channeled():
            return

        channel_end_timestamp = casting_spell.duration_entry.Duration/1000 + time.time()
        casting_spell.cast_end_timestamp = channel_end_timestamp  # Set the new timestamp for cast finish

        if casting_spell.initial_target_is_object():
            self.unit_mgr.set_channel_object(casting_spell.initial_target.guid)
            self.unit_mgr.set_channel_spell(casting_spell.spell_entry.ID)
            self.unit_mgr.set_dirty()

        for effect in casting_spell.effects:
            if not casting_spell.initial_target_is_terrain() or not effect.effect_aura or not effect.aura_period:  # Effects that will only resolve targets once
                casting_spell.resolve_target_info_for_effect(effect.effect_index)

        self.apply_spell_effects(casting_spell)

        if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
            return

        data = pack('<2I', casting_spell.spell_entry.ID, casting_spell.duration_entry.Duration)  # No channeled spells with duration per level
        self.unit_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.MSG_CHANNEL_START, data))  # SMSG?
        # TODO Channeling animations do not play

    def handle_channel_tick(self, casting_spell, elapsed):
        if not casting_spell.is_channeled():
            return

        if not casting_spell.initial_target_is_terrain():
            return

        # Refresh non-persistent targets and terrain-targeted auras for relevant effects
        for effect in casting_spell.effects:
            if not effect.effect_aura:
                continue

            effect.effect_aura.update(elapsed)

            if not effect.aura_period:
                continue  # Effects with no aura period will have persistent targets

            effect.targets.resolve_targets()  # Refresh targets

            # If the effect interval is due, send another spell_go packet. Not good, but shows ticks TODO hackfix for missing channeling effect
            if effect.effect_aura.is_past_next_period_timestamp():
                self.send_spell_go(casting_spell)
            self.apply_spell_effects(casting_spell, targeted=False)

        # Seems like sending updates speeds up channel? Does not play channeling effect either
        # remaining_time = casting_spell.cast_end_timestamp - time.time()
        # if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
        #     return
        # data = pack('<I', int(remaining_time*1000))  # *1000 for milliseconds
        # self.unit_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.MSG_CHANNEL_UPDATE, data))


    def handle_channel_end(self, casting_spell, interrupted):
        if not casting_spell.is_channeled():
            return

        # If channel is interrupted, all auras applied by the channel should be removed
        # If the auras of finished casts are removed as well, last ticks of channels may not happen. Death event should handle removal instead
        if interrupted:
            for miss_info in casting_spell.unit_target_results.values():  # Get the last effect application results
                miss_info.target.aura_manager.cancel_auras_by_spell_id(casting_spell.spell_entry.ID)  # Cancel effects from this aura

            if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
                return

        self.unit_mgr.set_channel_object(0)
        self.unit_mgr.set_channel_spell(0)
        self.unit_mgr.set_dirty()

        if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
            return

        data = pack('<I', 0)
        self.unit_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.MSG_CHANNEL_UPDATE, data))  # SMSG?
        self.send_spell_go(casting_spell)  # Play last tick animation TODO channeling effect hackfix

    def send_spell_go(self, casting_spell):
        data = [self.unit_mgr.guid, self.unit_mgr.guid,
                casting_spell.spell_entry.ID, casting_spell.cast_flags]

        signature = '<2QIH'  # source, caster, ID, flags .. (targets, ammo info)

        # Prepare target data
        results_by_type = {SpellMissReason.MISS_REASON_NONE: []}  # Hits need to be written first
        for target_guid, miss_info in casting_spell.unit_target_results.items():
            new_targets = results_by_type.get(miss_info.result, [])
            new_targets.append(target_guid)
            results_by_type[miss_info.result] = new_targets  # Sort targets by hit type for filling packet fields

        hit_count = len(results_by_type[SpellMissReason.MISS_REASON_NONE])
        miss_count = len(casting_spell.unit_target_results) - hit_count  # Subtract hits from all targets
        # Write targets, hits first
        for result, guids in results_by_type.items():
            if result == SpellMissReason.MISS_REASON_NONE:  # Hit count is written separately
                signature += 'B'
                data.append(hit_count)

            if result != SpellMissReason.MISS_REASON_NONE:  # Write reason for miss
                signature += 'B'
                data.append(result)

            if len(guids) > 0:  # Write targets if there are any
                signature += f'{len(guids)}Q'
            for target_guid in guids:
                data.append(target_guid)

            if result == SpellMissReason.MISS_REASON_NONE:  # Write miss count at the end of hits since it needs to be written even if none happen
                signature += 'B'
                data.append(miss_count)

        signature += 'H'  # SpellTargetMask
        data.append(casting_spell.spell_target_mask)

        if casting_spell.spell_target_mask != SpellTargetMask.SELF:  # Write target info - same as cast start
            target_info = casting_spell.get_initial_target_info()  # ([values], signature)
            data.extend(target_info[0])
            signature += target_info[1]

        packed = pack(signature, *data)
        MapManager.send_surrounding(PacketWriter.get_packet(OpCode.SMSG_SPELL_GO, packed), self.unit_mgr,
                                    include_self=self.unit_mgr.get_type() == ObjectTypes.TYPE_PLAYER)

    def set_on_cooldown(self, spell):
        if spell.RecoveryTime == 0:
            return
        self.cooldowns[spell.ID] = spell.RecoveryTime + time.time()

        if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
            return

        data = pack('<IQI', spell.ID, self.unit_mgr.guid, spell.RecoveryTime)
        self.unit_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.SMSG_SPELL_COOLDOWN, data))

    def remove_cooldown(self, spell):
        self.cooldowns.pop(spell.ID, None)

        if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
            return

        data = pack('<IQ', spell.ID, self.unit_mgr.guid)
        self.unit_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.SMSG_CLEAR_COOLDOWN, data))

    def is_on_cooldown(self, spell_id) -> bool:
        return spell_id in self.cooldowns

    def validate_cast(self, casting_spell) -> bool:
        if self.is_on_cooldown(casting_spell):
            self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_NOT_READY)
            return False

        if not casting_spell.spell_entry or casting_spell.spell_entry.ID not in self.spells:
            self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_NOT_KNOWN)
            return False

        if not self.unit_mgr.is_alive and \
                casting_spell.spell_entry.Attributes & SpellAttributes.SPELL_ATTR_ALLOW_CAST_WHILE_DEAD != SpellAttributes.SPELL_ATTR_ALLOW_CAST_WHILE_DEAD:
            self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_CASTER_DEAD)
            return False

        if not casting_spell.initial_target:
            self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_BAD_TARGETS)
            return False

        if casting_spell.initial_target_is_unit_or_player() and not casting_spell.initial_target.is_alive:  # TODO dead targets (resurrect)
            self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_TARGETS_DEAD)
            return False

        if not self.meets_casting_requisites(casting_spell):
            return False

        return True

    def meets_casting_requisites(self, casting_spell) -> bool:
        if casting_spell.spell_entry.PowerType != self.unit_mgr.power_type and casting_spell.spell_entry.ManaCost != 0:  # Doesn't have the correct power type
            self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_NO_POWER)
            return False

        if casting_spell.get_resource_cost() > self.unit_mgr.get_power_type_value():  # Doesn't have enough power
            self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_NO_POWER)
            return False

        # Player only checks
        if self.unit_mgr.get_type() == ObjectTypes.TYPE_PLAYER:
            # Check if player has required combo points
            if casting_spell.requires_combo_points() and \
                    (casting_spell.initial_target.guid != self.unit_mgr.combo_target or self.unit_mgr.combo_points == 0):  # Doesn't have required combo points
                self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_NO_COMBO_POINTS)
                return False

            # Check if player has required reagents
            for reagent_info, count in casting_spell.get_reagents():
                if reagent_info == 0:
                    break

                if self.unit_mgr.inventory.get_item_count(reagent_info) < count:
                    self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_REAGENTS)
                    return False

            # Check if player inventory has space left
            for item, count in casting_spell.get_conjured_items():
                if item == 0:
                    break

                item_template = WorldDatabaseManager.ItemTemplateHolder.item_template_get_by_entry(item)
                error = self.unit_mgr.inventory.can_store_item(item_template, count)
                if error != InventoryError.BAG_OK:
                    self.unit_mgr.inventory.send_equip_error(error)
                    self.send_cast_result(casting_spell.spell_entry.ID, SpellCheckCastResult.SPELL_FAILED_DONT_REPORT)
                    return False

        return True

    def consume_resources_for_cast(self, casting_spell):  # This method assumes that the reagents exist (meets_casting_requisites was run)
        power_type = casting_spell.spell_entry.PowerType
        cost = casting_spell.spell_entry.ManaCost
        new_power = self.unit_mgr.get_power_type_value() - cost
        if power_type == PowerTypes.TYPE_MANA:
            self.unit_mgr.set_mana(new_power)
        elif power_type == PowerTypes.TYPE_RAGE:
            self.unit_mgr.set_rage(new_power)
        elif power_type == PowerTypes.TYPE_FOCUS:
            self.unit_mgr.set_focus(new_power)
        elif power_type == PowerTypes.TYPE_ENERGY:
            self.unit_mgr.set_energy(new_power)

        if self.unit_mgr.get_type() == ObjectTypes.TYPE_PLAYER and \
                casting_spell.requires_combo_points():
            self.unit_mgr.remove_combo_points()
            self.unit_mgr.set_dirty()

        for reagent_info in casting_spell.get_reagents():  # Reagents
            if reagent_info[0] == 0:
                break
            self.unit_mgr.inventory.remove_items(reagent_info[0], reagent_info[1])

        self.unit_mgr.set_dirty()

    def send_cast_result(self, spell_id, error):
        # cast_status = SpellCastStatus.CAST_SUCCESS if error == SpellCheckCastResult.SPELL_CAST_OK else SpellCastStatus.CAST_FAILED  # TODO CAST_SUCCESS_KEEP_TRACKING

        if self.unit_mgr.get_type() != ObjectTypes.TYPE_PLAYER:
            return

        if error == SpellCheckCastResult.SPELL_NO_ERROR:
            data = pack('<IB', spell_id, SpellCastStatus.CAST_SUCCESS)
        else:
            data = pack('<I2B', spell_id, SpellCastStatus.CAST_FAILED, error)

        self.unit_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.SMSG_CAST_RESULT, data))
