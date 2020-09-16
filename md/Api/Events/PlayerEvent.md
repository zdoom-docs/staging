# PlayerEvent

[PlayerDied]: StaticEventHandler.md#mthd-PlayerDied
[PlayerDisconnected]: StaticEventHandler.md#mthd-PlayerDisconnected
[PlayerEntered]: StaticEventHandler.md#mthd-PlayerEntered
[PlayerRespawned]: StaticEventHandler.md#mthd-PlayerRespawned

[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct PlayerEvent play version("2.4");

<!-- api-definition -->
The information for a [StaticEventHandler].[PlayerEntered],
[StaticEventHandler].[PlayerRespawned],
[StaticEventHandler].[PlayerDied], or
[StaticEventHandler].[PlayerDisconnected] event.

<!-- api-members -->
#-
readOnly int {PlayerNumber}

The player who created this event.
-#

#-
readOnly bool {IsReturn}

`true` if this is a [StaticEventHandler].[PlayerEntered] event caused
by re-entering a hub level.
-#
