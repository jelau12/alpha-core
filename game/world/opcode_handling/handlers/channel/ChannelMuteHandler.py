from network.packet.PacketReader import *
from game.world.managers.objects.ChannelManager import ChannelManager
from game.world.WorldSessionStateHandler import WorldSessionStateHandler
from game.world.managers.ChatManager import ChatManager


class ChannelMuteHandler(object):

    @staticmethod
    def handle_mute(world_session, socket, reader):
        channel = PacketReader.read_string(reader.data, 0).strip()
        offset = len(channel) + 1
        has_player = len(reader.data) == offset + 1
        player_name = '' if has_player else PacketReader.read_string(reader.data, offset, 0).strip()[:-1]

        target_player_mgr = WorldSessionStateHandler.find_player_by_name(player_name)
        if target_player_mgr:
            ChannelManager.add_mute(channel, world_session.player_mgr, target_player_mgr)
        else:
            ChatManager.send_system_message(world_session, f'No player named [{player_name}] is currently playing.')

        return 0

    @staticmethod
    def handle_unmute(world_session, socket, reader):
        channel = PacketReader.read_string(reader.data, 0).strip()
        offset = len(channel) + 1
        has_player = len(reader.data) == offset + 1
        player_name = '' if has_player else PacketReader.read_string(reader.data, offset, 0).strip()[:-1]

        target_player_mgr = WorldSessionStateHandler.find_player_by_name(player_name)
        if target_player_mgr:
            ChannelManager.remove_mute(channel, world_session.player_mgr, target_player_mgr)
        else:
            ChatManager.send_system_message(world_session, f'No player named [{player_name}] is currently playing.')

        return 0