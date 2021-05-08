# PatchInfo

[GiFont]: ../Drawing/GiFont.md

<!-- api-declaration -->
struct PatchInfo play version("2.5")

<!-- api-definition -->
Either a patch or string depending on external configurations.

<!-- api-instance-methods -->
#-
void {Init}([GiFont] giFont)

Initializes `self` from the information in `giFont`.
-#

<!-- api-members -->
#-
int {MColor}

The color of the font, if this is a string.
-#

#-
Font {MFont}

The font, if this is a string, or a null font.
-#

#-
deprecated("3.8") textureId {MPatch}

{{#include ../../Labels/Legacy.md}} The patch, if this is a patch, or
an invalid texture. Ignored after 3.8.0.
-#
