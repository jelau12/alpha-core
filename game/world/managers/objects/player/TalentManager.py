from struct import pack
from typing import Optional
from database.dbc.DbcModels import SkillLineAbility, Spell

from database.dbc.DbcDatabaseManager import DbcDatabaseManager
from database.world.WorldDatabaseManager import WorldDatabaseManager, TrainerTemplate
from network.packet.PacketWriter import PacketWriter, OpCode
from utils.constants.MiscCodes import TrainerServices, TrainerTypes
from utils.constants.SpellCodes import SpellTargetMask

TALENT_SKILL_ID = 3
# Weapon, Attribute, Slayer, Magic, Defensive
SKILL_LINE_TALENT_IDS: list[int] = [222, 230, 231, 233, 234]
TALENT_SPELL_IDS: list[TrainerTemplate] = WorldDatabaseManager.TrainerSpellHolder.trainer_talents_get_all()


class TalentManager(object):
    def __init__(self, player_mgr):
        self.player_mgr = player_mgr

    @staticmethod
    def get_talent_cost_by_id(spell_id: int) -> int:
        spell_rank: int = DbcDatabaseManager.SpellHolder.spell_get_rank_by_id(spell_id)

        # TODO Below statement is not 100% correct, but works -for now- since we lack more data.
        # We do know that Rank 1 cost 10 TP and Rank 2 cost 15 TP (https://i.imgur.com/eFi3cf4.jpg),
        # so we assume each rank cost 5 TP more.
        talent_points_cost: int = 10 + ((spell_rank - 1) * 5)
        return talent_points_cost

    def apply_talent_auras(self):
        skill_line_abilities: list[SkillLineAbility] = DbcDatabaseManager.skill_line_ability_get_by_skill_lines(
            SKILL_LINE_TALENT_IDS)

        for ability in skill_line_abilities:
            if not ability.Spell:
                continue

            spell = DbcDatabaseManager.SpellHolder.spell_get_by_id(ability.Spell)

            if ability.Spell in self.player_mgr.spell_manager.spells:
                self.player_mgr.spell_manager.start_spell_cast(spell, self.player_mgr, self.player_mgr, SpellTargetMask.SELF)

    # We want to apply each aura immediately after training, not just after relogging. 
    # However, we don't want to try to apply all of them each time.
    def apply_talent_aura(self, talent_spell_id: int):
        spell: Spell = DbcDatabaseManager.SpellHolder.spell_get_by_id(talent_spell_id)

        if talent_spell_id in self.player_mgr.spell_manager.spells:
            self.player_mgr.spell_manager.start_spell_cast(spell, self.player_mgr, self.player_mgr, SpellTargetMask.SELF)

    def send_talent_list(self):
        talent_bytes: bytes = b''
        talent_count: int = 0

        for training_spell in TALENT_SPELL_IDS:
            spell: Optional[SkillLineAbility] = DbcDatabaseManager.SpellHolder.spell_get_by_id(training_spell.playerspell)
            spell_rank: int = DbcDatabaseManager.SpellHolder.spell_get_rank_by_spell(spell)
            skill_line_ability = DbcDatabaseManager.SkillLineAbilityHolder.skill_line_ability_get_by_spell(spell.ID)

            if spell.ID in self.player_mgr.spell_manager.spells:
                status = TrainerServices.TRAINER_SERVICE_USED
            else:
                if skill_line_ability.custom_PrecededBySpell in self.player_mgr.spell_manager.spells and spell_rank > 1:
                    status = TrainerServices.TRAINER_SERVICE_AVAILABLE
                elif spell_rank == 1:
                    status = TrainerServices.TRAINER_SERVICE_AVAILABLE
                else:
                    status = TrainerServices.TRAINER_SERVICE_UNAVAILABLE
            
            talent_points_cost = TalentManager.get_talent_cost_by_id(training_spell.playerspell)
            data = pack(
                '<IBI3B6I',
                training_spell.playerspell,  # Spell id
                status,  # Status
                0,  # Cost
                talent_points_cost,  # Talent Point Cost
                0,  # Skill Point Cost
                spell.BaseLevel,  # Required Level
                0,  # Required Skill Line
                0,  # Required Skill Rank
                0,  # Required Skill Step
                skill_line_ability.custom_PrecededBySpell,  # Required Ability (1)
                0,  # Required Ability (2)
                0  # Required Ability (3)
            )
            talent_bytes += data
            talent_count += 1

        data = pack('<Q2I', self.player_mgr.guid, TrainerTypes.TRAINER_TYPE_TALENTS, talent_count) + talent_bytes
        self.player_mgr.session.enqueue_packet(PacketWriter.get_packet(OpCode.SMSG_TRAINER_LIST, data))
