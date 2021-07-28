# DrawTextureTags

[mapinfo gameinfo]: ../../Data/MapInfo.md#gameinfo

[Font]: Font.md
[Shape2D]: Shape2D.md

<!-- api-declaration -->
struct Screen clearScope;

<!-- api-definition -->
Tagged functions for drawing textures to the screen.

### Internal Variables

#### VirtualWidth, VirtualHeight

The target resolution to transform into a coordinate space.

[VirtualWidth]: #virtualwidth-virtualheight
[VirtualHeight]: #virtualwidth-virtualheight

#### CleanMode

After all arguments are parsed, the [`CleanMode`] internal variable is
used along with [`VirtualWidth`]/[`VirtualHeight`] to determine how to
finally transform positions.

[CleanMode]: #cleanmode

<!-- api-variants -->

#-
{DTA_BASE}

(={`bool use`}=) Sets [`CleanMode`] to perform no position scaling.
-#

#-
{DTA_CLEAN}

(={`bool use`}=) Scales all positions by ={`[Clean] * [Fac]`}=. See
the documentation for those variables for more information.
-#

#-
{DTA_CLEANNOMOVE}

(={`bool use`}=) Scales the destination width and height by
={`[Clean] * [Fac]`}=.
-#

#-
{DTA_CLEANNOMOVE_1}

(={`bool use`}=) Scales the destination width and height by
={`[Clean] * [Fac_1]`}=.
-#

#-
{DTA_FULLSCREEN}

(={`bool use`}=) Sets the X and Y positions to 0. (Yes, really, this
is all it does.)
-#

#-
{DTA_HUDRULES}

(={`int type`}=) Scales all positions by the current status bar's
scaling rules.
-#

#-
{DTA_HUDRULESC}

{{#include ../../Labels/Internal.md}} Scales all positions by the
current status bar's scaling rules and centers the X position.
-#

#### Pre-sets

These essentially just set [`CleanMode`] and some other stuff.

#-
{DTA_320X200}

(={`bool use`}=) Sets [`CleanMode`] to [`DTA_BASE`] and the virtual
width/height to 320/200. Note that 320x200 does not scale properly to
the screen, as it must be 320x240 to do so.
-#

### DrawTexture Arguments

Here is a list of tags and their respective arguments which may be
used with [`DrawTexture`]:

{DTA_ALPHACHANNEL}

={`bool use`}= Does nothing unless `DTA_FILLCOLOR` is used and the render style is unspecified, in which case it will set the render style to "shaded" if `use` is `true`.
{DTA_ALPHA}

={`double alpha`}= Sets the alpha of the drawn texture to `alpha`.
{DTA_BOTTOM320X200}

={`bool use`}= Same as `DTA_320X200`, but also enables position transformation as if a call to `VirtualToRealCoords` with `vbottom` to `true`. Note that this is the only way to actually set this, but it may be overridden by following arguments to effectively toggle only this flag.
{DTA_CENTERBOTTOMOFFSET}

={`bool use`}= Same as `DTA_CENTERBOTTOMOFFSET`, but the Y offset is aligned to the bottom instead of the center.
{DTA_CENTEROFFSET}

={`bool use`}= Overrides the texture's X and Y offsets, centering them between the texture's height and width if `use` is `true`.
{DTA_CLIPBOTTOM}
{DTA_CLIPTOP}

={`int length`}= Sets the vertical clipping for the texture.
{DTA_CLIPLEFT}
{DTA_CLIPRIGHT}

={`int length`}= Sets the horizontal clipping for the texture.
{DTA_COLOROVERLAY}

={`color cr`}= Multiplies `cr` with the texture. Alpha determines the intensity of this overlay. Applied before render styles.
{DTA_COLOR}

={`color cr`}= Multiplies `cr` with the texture. Applied after render styles change the color.
{DTA_DESATURATE}

={`int amount`}= Desaturates the texture by `amount` (range 0-255.)
{DTA_DESTHEIGHTF}
{DTA_DESTWIDTHF}

={`double size`}= Same as `DTA_DESTHEIGHT`/`DTA_DESTWIDTH`, but with decimal arguments.
{DTA_DESTHEIGHT}
{DTA_DESTWIDTH}

={`int size`}= Sets the resulting width or height on screen of the texture and sets `CleanMode` to `DTA_BASE`.
{DTA_FILLCOLOR}

={`color cr`}= Sets the render style to "stencil" if one is not specified and the fill color to `cr`.
{DTA_FLIPX}
{DTA_FLIPY}

={`bool use`}= Flips the X or Y position if `use` is `true`.
{DTA_KEEPRATIO}

={`bool on`}= Enables aspect ratio correction if `on` is `true`.
{DTA_LEFTOFFSETF}
{DTA_TOPOFFSETF}

={`double ofs`}= Same as `DTA_LEFTOFFSET`/`DTA_TOPOFFSETF`, but with decimal arguments.
{DTA_LEFTOFFSET}
{DTA_TOPOFFSET}

={`int ofs`}= Overrides the texture's X or Y offset.
{DTA_LEGACYRENDERSTYLE}

={`int style`}= Overrides the render style. Note that there is also a `DTA_RENDERSTYLE` which cannot be used because the engine does not expose `FRenderStyle` yet.
{DTA_MASKED}

={`bool on`}= Turns the texture fully opaque (no alpha mask) if `on` is `false`. Default value is on.
{DTA_SRCHEIGHT}
{DTA_SRCWIDTH}

={`int size`}= Sets the width or height of the source image. Will cut the texture if lower than the original size. If the size is larger than the original, it will cause UV clamping, repeating the pixels at the image borders.
{DTA_SRCX}
{DTA_SRCY}

={`int pos`}= Sets the X or Y on the source image to start the texture at. Texture wrapping will cause a UV clamping effect, repeating the pixels at the image borders.
{DTA_TRANSLATIONINDEX}

={`int index`}= Remaps colors in the destination texture with translation table `index`.
{DTA_VIRTUALHEIGHTF}
{DTA_VIRTUALWIDTHF}

={`double size`}= Same as `DTA_VIRTUALHEIGHT`/`DTA_VIRTUALWIDTH`, but with decimal arguments.
{DTA_VIRTUALHEIGHT}
{DTA_VIRTUALWIDTH}

={`int size`}= Sets the virtual width or height to `size`.
{DTA_WINDOWLEFTF}
{DTA_WINDOWRIGHTF}

={`double size`}= Same as `DTA_WINDOWLEFT`/`DTA_WINDOWRIGHT`, but with decimal arguments.
{DTA_WINDOWLEFT}
{DTA_WINDOWRIGHT}

={`int size`}= Crops `size` pixels from the left or right.
