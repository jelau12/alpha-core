from dataclasses import dataclass
from game.world.managers.abstractions.Vector import Vector


@dataclass
class PendingTeleportDataHolder:
    recovery_percentage: float
    origin_location: Vector
    origin_map: int
    destination_location: Vector
    destination_map: int
