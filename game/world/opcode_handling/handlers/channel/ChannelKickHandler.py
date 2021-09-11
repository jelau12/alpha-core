from game.world.WorldSessionStateHandler import WorldSessionStateHandler
from game.world.managers.objects.units.player.ChannelManager import ChannelManager
from game.world.managers.objects.units.player.ChatManager import ChatManager
from network.packet.PacketReader import *


# Client does not route /kick properly for channels, need to use /script ChannelKick(channel "name" or index, "player")
class ChannelKickHandler(object):

    @staticmethod
    def handle(world_session, socket, reader):
        channel = PacketReader.read_string(reader.data, 0).strip().capitalize()
        offset = len(channel) + 1
        has_player = len(reader.data) == offset + 1
        player_name = '' if has_player else PacketReader.read_string(reader.data, offset, 0).strip()[:-1]

        target_player_mgr = WorldSessionStateHandler.find_player_by_name(player_name)
        if target_player_mgr:
            ChannelManager.kick_player(channel, world_session.player_mgr, target_player_mgr)
        else:
            ChatManager.send_system_message(world_session, f'No player named [{player_name}] is currently playing.')

        return 0
