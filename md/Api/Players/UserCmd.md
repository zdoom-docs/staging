# UserCmd

[mapinfo gameinfo]: ../../Data/MapInfo.md#gameinfo

[EButtons]: EButtons.md
[PlayerPawn]: PlayerPawn.md

<!-- api-declaration -->
struct UserCmd clearScope;

<!-- api-definition -->
A networked command packet to be handled each frame by [the
player][PlayerPawn].

<!-- api-members -->
#-
[EButtons] {Buttons}

The buttons currently held down by the player at the time of this
command.
-#

#-
int16 {Pitch}
int16 {Yaw}
int16 {Roll}

16-bit fixed-point representations of the player's current view
angles. -32767 being the minimum angle, and 32767 being the maximum
angle. -32768 is reserved for [`Pitch`] signifying the view will be
centered.
-#

#-
int16 {ForwardMove}
int16 {SideMove}
int16 {UpMove}

16-bit fixed-point representations of the player's current movement
speeds. The normal values for these depend on the game, and are
specified in [MAPINFO GameInfo].
-#
