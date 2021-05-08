# EPlayerState

[DropWeapon]: PlayerPawn.md#mthd-DropWeapon
[PlayerDied]: ../Events/StaticEventHandler.md#mthd-PlayerDied
[ResetAirSupply]: PlayerPawn.md#mthd-ResetAirSupply

[PlayerPawn]: PlayerPawn.md
[StaticEventHandler]: ../Events/StaticEventHandler.md

<!-- api-declaration -->
enum EPlayerState;

<!-- api-definition -->
The current state of the player.

<!-- api-variants -->
#-
{PST_DEAD}

Set when the player dies, right before [`PlayerPawn.DropWeapon`] and
right after [`StaticEventHandler.PlayerDied`].
-#

#-
{PST_ENTER}

Set when the player is first entering the game, up until the state is
set to [`PST_LIVE`].
-#

#-
{PST_GONE}

Set when the player has left the game.
-#

#-
{PST_LIVE}

Set when the player is spawned, right before
[`PlayerPawn.ResetAirSupply`].
-#

#-
{PST_REBORN}

Set when the player is respawning, up until the state is set to
[`PST_LIVE`].
-#
