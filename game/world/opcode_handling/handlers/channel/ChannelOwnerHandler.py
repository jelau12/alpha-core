from network.packet.PacketReader import *
from game.world.managers.objects.ChannelManager import ChannelManager
from game.world.WorldSessionStateHandler import WorldSessionStateHandler
from game.world.managers.ChatManager import ChatManager


class ChannelOwnerHandler(object):

    @staticmethod
    def handle(world_session, socket, reader):
        channel = PacketReader.read_string(reader.data, 0).strip()
        ChannelManager.get_owner(channel, world_session.player_mgr)
        return 0

    @staticmethod
    def handle_set_owner(world_session, socket, reader):
        channel = PacketReader.read_string(reader.data, 0).strip()
        offset = len(channel) + 1
        has_player = len(reader.data) == offset + 1
        player_name = '' if has_player else PacketReader.read_string(reader.data, offset, 0).strip()[:-1]
        target_player_mgr = WorldSessionStateHandler.find_player_by_name(player_name)

        if target_player_mgr:
            ChannelManager.set_owner(channel, world_session.player_mgr, target_player_mgr)
        else:
            ChatManager.send_system_message(world_session, f'No player named [{player_name}] is currently playing.')
        return 0