from game.world.managers.objects.units.ai.CreatureAI import CreatureAI


class CritterAI(CreatureAI):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    # override
    def permissible(self, creature):
        pass

    # override
    def damage_taken(self, attacker, damage):
        pass

    # override
    def spell_hit(self, caster, spell_entry):
        pass

    # override
    def update_ai(self, elapsed):
        pass

