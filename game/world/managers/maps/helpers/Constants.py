from enum import IntEnum

RESOLUTION_ZMAP = 256
RESOLUTION_LIQUIDS = 128
RESOLUTION_AREA_INFO = 16
ADT_SIZE = 533.3333
BLOCK_SIZE = 64


class MapType(IntEnum):
    INSTANCE = 0
    COMMON = 1
