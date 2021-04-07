from game.world.managers.objects.player.guild.GuildManager import GuildManager
from utils.constants.ObjectCodes import GuildCommandResults, GuildTypeCommand


class GuildDisbandHandler(object):

    @staticmethod
    def handle(world_session, socket, reader):
        player_mgr = world_session.player_mgr

        if not player_mgr.guild_manager:
            GuildManager.send_guild_command_result(player_mgr, GuildTypeCommand.GUILD_CREATE_S, '',
                                                   GuildCommandResults.GUILD_PLAYER_NOT_IN_GUILD)
        elif player_mgr != player_mgr.guild_manager.guild_master:
            GuildManager.send_guild_command_result(player_mgr, GuildTypeCommand.GUILD_FOUNDER_S, '', GuildCommandResults.GUILD_PERMISSIONS)
        else:
            player_mgr.guild_manager.disband()

        return 0
