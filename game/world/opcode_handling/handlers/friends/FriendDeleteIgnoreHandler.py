from network.packet.PacketReader import *
from network.packet.PacketWriter import *
from utils.constants.MiscCodes import FriendResults


class FriendDeleteIgnoreHandler(object):

    @staticmethod
    def handle(world_session, socket, reader):
        if len(reader.data) >= 8:  # Avoid handling empty friend delete ignore packet.
            guid = unpack('<Q', reader.data[:8])[0]
            world_session.player_mgr.friends_manager.remove_ignore(guid)

        return 0
