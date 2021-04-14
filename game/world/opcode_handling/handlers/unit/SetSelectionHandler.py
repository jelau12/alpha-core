from struct import unpack


class SetSelectionHandler(object):

    @staticmethod
    def handle(world_session, socket, reader):
        if len(reader.data) >= 8:  # Avoid handling empty set selection packet
            guid = unpack('<Q', reader.data[:8])[0]
            if world_session.player_mgr:
                if world_session.player_mgr.current_selection != guid:
                    world_session.player_mgr.send_melee_attack_stop(guid) #why? should be handled on update attack tick
                    world_session.player_mgr.set_current_selection(guid)

        return 0
