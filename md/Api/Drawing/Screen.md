# Screen

[mapinfo gameinfo]: ../../Data/MapInfo.md#gameinfo

[Font]: Font.md
[Shape2D]: Shape2D.md

<!-- api-declaration -->
struct Screen clearScope;

<!-- api-definition -->
Functions for drawing various things to the screen.

Note: There are no longer any fully paletted renderers in GZDoom as of
version 3.5. Alternate palette index parameters are generally ignored
now.

<!-- api-class-methods -->
### Drawing Functions

These functions may only be called in a drawing function, or they will
either crash the game with an exception, or have no result.

#-
static vararg void {DrawChar}([Font] font, int cr, double x, double y, int character, ...)

The same as `DrawTexture`, but draws the texture of character code
`character` from `font`. The output color may be modified by the font
color `cr`.
-#

#-
static vararg void {DrawShape}(textureId tex, bool animate, [Shape2D] s, ...)

{{#include ../../Labels/Todo.md}}
-#

#-
static vararg void {DrawText}([Font] font, int cr, double x, double y, string text, ...)

{{#include ../../Labels/Todo.md}}
-#

#-
static vararg void {DrawTexture}(textureId tex, bool animate, double x, double y, ...)

Draws texture `tex`, possibly animated by the animation ticker if
`animate` is `true`, at horizontal position `x` and vertical position
`y`. See [this section][DrawTexture Arguments] for information on the
available arguments.
-#

#-
static void {DrawFrame}(int x, int y, int w, int h)

Draws a frame around a rectangle at `x y` of `w h` size in screen
coordinates, using the border graphics as defined in [MAPINFO
GameInfo].
-#

#-
static void {DrawLine}(int x0, int y0, int x1, int y1, color cr, int alpha = 255)

Draws a one pixel wide line from `x0 y0` to `x1 y1` in screen
coordinates of color `cr` with alpha `alpha` (range 0-255.)
-#

#-
static void {DrawThickLine}(int x0, int y0, int x1, int y1, double thickness, color cr, int alpha = 255)

Draws a `thickness` pixel wide line from `x0 y0` to `x1 y1` in screen
coordinates of color `cr` with alpha `alpha` (range 0-255.)
-#

#-
static void {Clear}(int left, int top, int right, int bottom, color cr, int palColor = -1)

Draws a rectangle from `top left` to `bottom right` in screen
coordinates of `cr` color. Does not support translucent colors.
`palColor` is a palette index to use as a color in paletted renderers
or `-1` for automatic conversion from the given RGB color.
-#

#-
static void {Dim}(color cr, double amount, int x, int y, int w, int h)

Draws a rectangle at `x y` of `w h` size in screen coordinates of `cr`
color. Does not support translucent colors, but `amount` may be used
to specify the translucency in a range of 0-1 inclusive.
-#

#-
static void {SetClipRect}(int x, int y, int w, int h)

Sets the clipping rectangle to restrict further drawing to the region
starting at `x y` of size `w h` in screen coordinates.
-#

#-
static ui void {DrawHudTexture}(textureId tex, double x, double y)

{{#include ../../Labels/Legacy.md}} A left-over function that was
accidentally kept in 2.4.
-#

### User Information Functions

{{#include ../../Labels/Nondeterministic.md}} These functions rely on
the client's screen information and will not be consistent if you
attempt to query them in the playsim.

#-
static double {GetAspectRatio}()

Returns the aspect ratio of the screen.
-#

#-
static int {GetHeight}()

Returns the height of the screen.
-#

#-
static int {GetWidth}()

Returns the width of the screen.
-#

#-
static void {ClearClipRect}()

Clears the clipping rectangle if there is one.
-#

#-
static int, int, int, int {GetClipRect}()

Returns the clipping rectangle's `x`/`y`/`w`/`h`.
-#

#-
static int, int, int, int {GetViewWindow}()

Returns the 3D viewing window, which may be smaller than the screen
size with any given `screenblocks` setting.
-#

### Miscellaneous Functions

#-
static color {PaletteColor}(int index)

Returns a `color` for a given palette index.
-#

#-
static vector2, vector2 {VirtualToRealCoords}(vector2 pos, vector2 size, vector2 vSize, bool vBottom = false, bool handleAspect = true)

Converts virtual coordinates `pos` from virtual coordinate space
`vSize` to screen coordinate space `size`, possibly accounting for
aspect ratio differences if `handleAspect` is true. If the ratio is
5:4, `vBottom` will account for the higher-than-wide conversion by
repositioning vertically.
-#

<!-- api-footer -->
## Drawing Function Arguments

### CleanMode

After all arguments are parsed, the "`CleanMode`" internal variable is
used along with the specified virtual width/height to determine how to
finally transform positions. `CleanMode` may be one of the following:

| Name                | Description
| ----                | -----------
| `DTA_BASE`          | No position scaling is performed.
| `DTA_CLEAN`         | Scales all positions by `Clean*Fac`. See the documentation for those variables for more information.
| `DTA_CLEANNOMOVE`   | Scales the destination width and height by `Clean*Fac`.
| `DTA_CLEANNOMOVE_1` | Scales the destination width and height by `Clean*Fac_1`.
| `DTA_FULLSCREEN`    | Sets the X and Y positions to `0`. (Yes, really, this is all it does.)
| `DTA_HUDRULES`      | Scales all positions by the current status bar's scaling rules.
| `DTA_HUDRULESC`     | Scales all positions by the current status bar's scaling rules and centers the X position.

### DrawTexture Arguments

Here is a list of tags and their respective arguments which may be
used with [DrawTexture]:

| Name                                      | Arguments      | Description
| ----                                      | ---------      | -----------
| `DTA_320X200`                             | `bool use`     | Sets `CleanMode` to `DTA_BASE` and the virtual width/height to `320`/`200` if `use` is `true`. Note that 320x200 does not scale properly to the screen as it must be 320x240 to do so.
| `DTA_ALPHACHANNEL`                        | `bool use`     | Does nothing unless `DTA_FILLCOLOR` is used and the render style is unspecified, in which case it will set the render style to "shaded" if `use` is `true`.
| `DTA_ALPHA`                               | `double alpha` | Sets the alpha of the drawn texture to `alpha`.
| `DTA_BOTTOM320X200`                       | `bool use`     | Same as `DTA_320X200`, but also enables position transformation as if a call to `VirtualToRealCoords` with `vbottom` to `true`. Note that this is the only way to actually set this, but it may be overridden by following arguments to effectively toggle only this flag.
| `DTA_CENTERBOTTOMOFFSET`                  | `bool use`     | Same as `DTA_CENTERBOTTOMOFFSET`, but the Y offset is aligned to the bottom instead of the center.
| `DTA_CENTEROFFSET`                        | `bool use`     | Overrides the texture's X and Y offsets, centering them between the texture's height and width if `use` is `true`.
| `DTA_CLEANNOMOVE1`                        | `bool use`     | Sets `CleanMode` to `DTA_CLEANNOMOVE1` if `use` is `true`.
| `DTA_CLEANNOMOVE`                         | `bool use`     | Sets `CleanMode` to `DTA_CLEANNOMOVE` if `use` is `true`.
| `DTA_CLEAN`                               | `bool use`     | Sets `CleanMode` to `DTA_CLEAN` if `use` is `true`.
| `DTA_CLIPBOTTOM`, `DTA_CLIPTOP`           | `int length`   | Sets the vertical clipping for the texture.
| `DTA_CLIPLEFT`, `DTA_CLIPRIGHT`           | `int length`   | Sets the horizontal clipping for the texture.
| `DTA_COLOROVERLAY`                        | `color cr`     | Multiplies `cr` with the texture. Alpha determines the intensity of this overlay. Applied before render styles.
| `DTA_COLOR`                               | `color cr`     | Multiplies `cr` with the texture. Applied after render styles change the color.
| `DTA_DESATURATE`                          | `int amount`   | Desaturates the texture by `amount` (range 0-255.)
| `DTA_DESTHEIGHTF`, `DTA_DESTWIDTHF`       | `double size`  | Same as `DTA_DESTHEIGHT`/`DTA_DESTWIDTH`, but with decimal arguments.
| `DTA_DESTHEIGHT`, `DTA_DESTWIDTH`         | `int size`     | Sets the resulting width or height on screen of the texture and sets `CleanMode` to `DTA_BASE`.
| `DTA_FILLCOLOR`                           | `color cr`     | Sets the render style to "stencil" if one is not specified and the fill color to `cr`.
| `DTA_FLIPX`, `DTA_FLIPY`                  | `bool use`     | Flips the X or Y position if `use` is `true`.
| `DTA_FULLSCREEN`                          | `bool use`     | Sets `CleanMode` to `DTA_FULLSCREEN` and the virtual width and height to the display size of the texture.
| `DTA_HUDRULES`                            | `int type`     | Sets `CleanMode` to `DTA_HUDRULESC` if `type` is `BaseStatusBar.HUD_HORIZCENTER`, or `DTA_HUDRULES` if it is `BaseStatusBar.HUD_NORMAL`.
| `DTA_KEEPRATIO`                           | `bool on`      | Enables aspect ratio correction if `on` is `true`.
| `DTA_LEFTOFFSETF`, `DTA_TOPOFFSETF`       | `double ofs`   | Same as `DTA_LEFTOFFSET`/`DTA_TOPOFFSETF`, but with decimal arguments.
| `DTA_LEFTOFFSET`, `DTA_TOPOFFSET`         | `int ofs`      | Overrides the texture's X or Y offset.
| `DTA_LEGACYRENDERSTYLE`                   | `int style`    | Overrides the render style. Note that there is also a `DTA_RENDERSTYLE` which cannot be used because the engine does not expose `FRenderStyle` yet.
| `DTA_MASKED`                              | `bool on`      | Turns the texture fully opaque (no alpha mask) if `on` is `false`. Default value is on.
| `DTA_SRCHEIGHT`, `DTA_SRCWIDTH`           | `int size`     | Sets the width or height of the source image. Will cut the texture if lower than the original size. If the size is larger than the original, it will cause UV clamping, repeating the pixels at the image borders.
| `DTA_SRCX`, `DTA_SRCY`                    | `int pos`      | Sets the X or Y on the source image to start the texture at. Texture wrapping will cause a UV clamping effect, repeating the pixels at the image borders.
| `DTA_TRANSLATIONINDEX`                    | `int index`    | Remaps colors in the destination texture with translation table `index`.
| `DTA_VIRTUALHEIGHTF`, `DTA_VIRTUALWIDTHF` | `double size`  | Same as `DTA_VIRTUALHEIGHT`/`DTA_VIRTUALWIDTH`, but with decimal arguments.
| `DTA_VIRTUALHEIGHT`, `DTA_VIRTUALWIDTH`   | `int size`     | Sets the virtual width or height to `size`.
| `DTA_WINDOWLEFTF`, `DTA_WINDOWRIGHTF`     | `double size`  | Same as `DTA_WINDOWLEFT`/`DTA_WINDOWRIGHT`, but with decimal arguments.
| `DTA_WINDOWLEFT`, `DTA_WINDOWRIGHT`       | `int size`     | Crops `size` pixels from the left or right.
