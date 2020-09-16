# PlayerClass

[mapinfo gameinfo]: ../../Data/MapInfo.md#gameinfo
[keyconf]: ../../Data/KeyConf.md

[Actor]: ../Base/Actor.md

<!-- api-declaration -->
struct PlayerClass clearscope;

<!-- api-definition -->
A player class as defined in either [MAPINFO GameInfo] or [KEYCONF].

<!-- api-instance-methods -->
#-
bool {CheckSkin}(int skin)

Checks if `skin` is in `Skins`.
-#

#-
void {EnumColorsets}(out array\<int> data)

{{#include ../../Labels/Todo.md}}
-#

#-
name {GetColorsetName}(int setnum)

{{#include ../../Labels/Todo.md}}
-#

<!-- api-members -->
#-
uint {Flags}

Not currently implemented correctly, `PCF_NOMENU` does not exist in
ZScript, but its value is `1` if you need to check for that.
-#

#-
array\<int> {Skins}

Skin indices available to this player class.
-#

#-
class\<[Actor]> {Type}

The class type reference for this player class.
-#
