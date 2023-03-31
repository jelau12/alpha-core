from enum import IntEnum


class ConditionType(IntEnum):
    CONDITION_NOT = -3
    CONDITION_OR = -2
    CONDITION_AND = -1
    CONDITION_NONE = 0
    CONDITION_AURA = 1
    CONDITION_ITEM = 2
    CONDITION_ITEM_EQUIPPED = 3
    CONDITION_AREAID = 4
    CONDITION_REPUTATION_RANK_MIN = 5
    CONDITION_TEAM = 6
    CONDITION_SKILL = 7
    CONDITION_QUESTREWARDED = 8
    CONDITION_QUESTTAKEN = 9
    CONDITION_AD_COMMISSION_AURA = 10
    CONDITION_SAVED_VARIABLE = 11
    CONDITION_ACTIVE_GAME_EVENT = 12
    CONDITION_CANT_PATH_TO_VICTIM = 13
    CONDITION_RACE_CLASS = 14
    CONDITION_LEVEL = 15
    CONDITION_SOURCE_ENTRY = 16
    CONDITION_SPELL = 17
    CONDITION_INSTANCE_SCRIPT = 18
    CONDITION_QUESTAVAILABLE = 19
    CONDITION_NEARBY_CREATURE = 20
    CONDITION_NEARBY_GAMEOBJECT = 21
    CONDITION_QUEST_NONE = 22
    CONDITION_ITEM_WITH_BANK = 23
    CONDITION_WOW_PATCH = 24
    CONDITION_ESCORT = 25
    CONDITION_ACTIVE_HOLIDAY = 26
    CONDITION_GENDER = 27
    CONDITION_IS_PLAYER = 28
    CONDITION_SKILL_BELOW = 29
    CONDITION_REPUTATION_RANK_MAX = 30
    CONDITION_HAS_FLAG = 31
    CONDITION_LAST_WAYPOINT = 32
    CONDITION_MAPID = 33
    CONDITION_INSTANCE_DATA = 34
    CONDITION_MAP_EVENT_DATA = 35
    CONDITION_MAP_EVENT_ACTIVE = 36
    CONDITION_LINE_OF_SIGHT = 37
    CONDITION_DISTANCE_TO_TARGET = 38
    CONDITION_IS_MOVING = 39
    CONDITION_HAS_PET = 40
    CONDITION_HEALTH_PERCENT = 41
    CONDITION_MANA_PERCENT = 42
    CONDITION_IS_IN_COMBAT = 43
    CONDITION_IS_HOSTILE_TO = 44
    CONDITION_IS_IN_GROUP = 45
    CONDITION_IS_ALIVE = 46
    CONDITION_MAP_EVENT_TARGETS = 47
    CONDITION_OBJECT_IS_SPAWNED = 48
    CONDITION_OBJECT_LOOT_STATE = 49
    CONDITION_OBJECT_FIT_CONDITION = 50
    CONDITION_PVP_RANK = 51
    CONDITION_DB_GUID = 52
    CONDITION_LOCAL_TIME = 53
    CONDITION_DISTANCE_TO_POSITION = 54
    CONDITION_OBJECT_GO_STATE = 55
    CONDITION_NEARBY_PLAYER = 56
    CONDITION_CREATURE_GROUP_MEMBER = 57
    CONDITION_CREATURE_GROUP_DEAD = 58


class EscortConditionFlags(IntEnum):
    CF_ESCORT_SOURCE_DEAD = 0x1
    CF_ESCORT_TARGET_DEAD = 0x2

class ConditionFlags(IntEnum):
    CONDITION_FLAG_REVERSE_RESULT = 0x1
    CONDITION_FLAG_SWAP_TARGETS = 0x2