# TexMan

[TryAny]: TexMan/EFlags.md#enum-TryAny
[ll-ReplaceTextures]: ../Level/LevelLocals.md#mthd-ReplaceTextures

[Actor]: ../Base/Actor.md
[LevelLocals]: ../Level/LevelLocals.md
[EFlags]: TexMan/EFlags.md
[ETexReplaceFlags]: TexMan/ETexReplaceFlags.md
[EUseTypes]: TexMan/EUseTypes.md

<!-- api-declaration -->
struct TexMan clearScope;

<!-- api-definition -->
The **Tex**ture **Man**ager is used for loading, finding, replacing and getting
information on textures.

<!-- api-sub-types -->
EFlags,
ETexReplaceFlags,
EUseTypes,

<!-- api-class-methods -->
#-
static textureId {CheckForTexture}(string name, TexMan.[EUseTypes] useType, TexMan.[EFlags] flags = TexMan.[TryAny])

Returns a `textureId` for the texture named `name`.
-#

#-
static int {CheckRealHeight}(textureId tex)

Returns the height in pixels of the texture down to the last scanline
which has actual pixel data. Note that this operation is extremely
slow and should be used sparingly.
-#

#-
static string {GetName}(textureId tex)

Returns the original name of a `textureId`.
-#

#-
static vector2 {GetScaledOffset}(textureId tex)

Returns the offsets for this texture used to display it (rather than
the original offsets.)
-#

#-
static vector2 {GetScaledSize}(textureId tex)

Returns the size used to display this texture (rather than the
physical size.)
-#

#-
static int, int {GetSize}(textureId tex)

Returns the width and height of a `textureId`.
-#

#-
static void {SetCameraToTexture}([Actor] viewPoint, string texture, double fov)

Sets the camera texture (as defined in `ANIMDEFS`) `texture` to the
viewpoint of `viewPoint` with a fov of `fov`.
-#

#-
static bool {OkForLocalization}(textureId patch, string textSubstitute)

{{#include ../../Labels/Todo.md}}
-#

#-
deprecated("3.8") static void {ReplaceTextures}(string from, string to, TexMan.[ETexReplaceFlags] flags)

{{#include ../../Labels/Legacy.md}} Use
[`LevelLocals.ReplaceTextures:ll-ReplaceTextures`] instead.

Replaces textures named `from` with `to` within the map.
-#
