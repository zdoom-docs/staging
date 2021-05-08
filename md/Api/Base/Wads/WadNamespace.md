# WadNamespace

[acs]: ../../../Acs.md
[color maps]: ../../../Data/BoomColorMap.md
[filter]: ../../../Concepts/Filters.md
[flat]: ../../../Data/Graphics.md#flats
[graphics]: ../../../Data/Graphics.md
[highres textures]: ../../../Data/HiResTex.md
[music]: ../../../Data/Music.md
[patch]: ../../../Data/Graphics.md#patches
[skin]: ../../../Concepts/Skins.md
[sound]: ../../../Data/Sounds.md
[sprite]: ../../../Data/Graphics.md#sprites
[texture]: ../../../Data/Graphics.md#textures
[voices]: ../../../Data/Voices.md
[voxels]: ../../../Data/Voxels.md

[Wads]: Wads.md

<!-- api-declaration -->
enum Wads.WadNamespace;

<!-- api-definition -->
This enumeration describes all of the archive namespaces used by the
engine. Here is a table of their paths and markers:

| Name              | Resource path | Wad file marker |
| ----              | ------------- | --------------- |
| [`NS_ACSLIBRARY`]   | `/acs`        | `A`             |
| [`NS_COLORMAPS`]    | `/colormaps`  | `C`             |
| [`NS_FLATS`]        | `/flats`      | `FF`            |
| [`NS_GLOBAL`]       | `/`           | None            |
| [`NS_GRAPHICS`]     | `/graphics`   | None            |
| [`NS_HIRES`]        | `/hires`      | `HI`            |
| [`NS_MUSIC`]        | `/music`      | None            |
| [`NS_NEWTEXTURES`]  | `/textures`   | `TX`            |
| [`NS_PATCHES`]      | `/patches`    | None            |
| [`NS_SOUNDS`]       | `/sounds`     | None            |
| [`NS_SPRITES`]      | `/sprites`    | `S`/`SS`        |
| [`NS_STRIFEVOICES`] | `/voices`     | `V`             |
| [`NS_VOXELS`]       | `/voxels`     | `VX`            |

<!-- api-variants -->
#-
[Wads].{NS_ACSLIBRARY}

[ACS] libraries.
-#

#-
[Wads].{NS_BLOODMISC}

{{#include ../../../Labels/Legacy.md}} Unused.
-#

#-
[Wads].{NS_BLOODRAW}

{{#include ../../../Labels/Legacy.md}} Blood RAW format sounds. Found
only in RFF files.
-#

#-
[Wads].{NS_BLOODSFX}

{{#include ../../../Labels/Legacy.md}} Blood SFX format sounds. Found
only in RFF files.
-#

#-
[Wads].{NS_COLORMAPS}

BOOM [color maps].
-#

#-
[Wads].{NS_FLATS}

[Flat] textures.
-#

#-
[Wads].{NS_GLOBAL}

The global namespace, which is the root of any archive.
-#

#-
[Wads].{NS_GRAPHICS}

Miscellaneous [graphics].
-#

#-
[Wads].{NS_HIDDEN}

Used for [filter]ed files that did not match this game.
-#

#-
[Wads].{NS_HIRES}

{{#include ../../../Labels/Legacy.md}} Deprecated [high-resolution
textures][highres textures].
-#

#-
[Wads].{NS_MUSIC}

[Music] files.
-#

#-
[Wads].{NS_NEWTEXTURES}

Generic [texture] files, usable as [patch]es or [flat]s.
-#

#-
[Wads].{NS_PATCHES}

Texture [patch]es.
-#

#-
[Wads].{NS_SOUNDS}

[Sound] files.
-#

#-
[Wads].{NS_SPRITES}

[Sprite] files.
-#

#-
[Wads].{NS_STRIFEVOICES}

Strife [voice] files.
-#

#-
[Wads].{NS_VOXELS}

Volumetric pixel ([voxel]) models.
-#

#-
[Wads].{NS_SPECIALZIPDIRECTORY}

Denotes the start of the specialized resource archive folder
namespaces, which are normally under [`NS_GLOBAL`].
-#

#-
[Wads].{NS_FIRSTSKIN}

{{#include ../../../Labels/Internal.md}} Used as part of the [skin]
hack.
-#
