from struct import unpack
from game.world.opcode_handling.HandlerValidator import HandlerValidator
from utils.GuidUtils import GuidUtils
from utils.constants.MiscCodes import HighGuid
from game.world.managers.maps.MapManager import MapManager
from utils.Logger import Logger


class QuestGiverChooseRewardHandler(object):

    @staticmethod
    def handle(world_session, socket, reader):
        # Validate world session.
        player_mgr, res = HandlerValidator.validate_session(world_session, reader.opcode)
        if not player_mgr:
            return res

        if len(reader.data) >= 16:  # Avoid handling empty quest giver choose reward packet.
            guid, quest_id, item_choice = unpack('<Q2I', reader.data[:16])
            high_guid = GuidUtils.extract_high_guid(guid)
            is_item = False

            quest_giver = None
            if high_guid == HighGuid.HIGHGUID_UNIT:
                quest_giver = MapManager.get_surrounding_unit_by_guid(player_mgr, guid)
            elif high_guid == HighGuid.HIGHGUID_GAMEOBJECT:
                quest_giver = MapManager.get_surrounding_gameobject_by_guid(player_mgr, guid)
            elif high_guid == HighGuid.HIGHGUID_ITEM:
                is_item = True
                quest_giver = player_mgr.inventory.get_item_by_guid(guid)

            if not quest_giver:
                Logger.error(f'Error in CMSG_QUESTGIVER_CHOOSE_REWARD, could not find quest giver with guid: {guid}.')
                return 0
            if not is_item and player_mgr.is_hostile_to(quest_giver):
                Logger.warning(f'Error in CMSG_QUESTGIVER_CHOOSE_REWARD, quest giver with guid: {guid} is hostile.')
                return 0

            player_mgr.quest_manager.handle_choose_reward(quest_giver, quest_id, item_choice)
        return 0
