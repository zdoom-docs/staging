# PlayerSkin

[skins]: ../../Data/Skins.md

[EPlayerGender]: EPlayerGender.md

<!-- api-declaration -->
struct PlayerSkin clearscope;

<!-- api-definition -->
A player skin as defined in [SKININFO or S_SKIN][skins].

<!-- api-members -->
#-
int {CrouchSprite}

The crouching sprite ID for this skin.
-#

#-
string {Face}

Prefix for statusbar face graphics.
-#

#-
[EPlayerGender] {Gender}

Default gender of the skin.
-#

#-
int {NameSpc}

If this skin was defined in S_SKIN, this is the lump ID of the marker itself.
-#

#-
bool {OtherGame}

The player skin is made for another game and needs to be color remapped
differently.
-#

#-
uint8 {Range0End}

The end index of the translation range to be used for changing the player
sprite's color.
-#

#-
uint8 {Range0Start}

The beginning index of the translation range to be used for changing the player
sprite's color.
-#

#-
vector2 {Scale}

The scaling factor used for the player sprite.
-#

#-
string {SkinName}

Name of the skin.
-#

#-
int {Sprite}

The sprite ID for this skin.
-#
