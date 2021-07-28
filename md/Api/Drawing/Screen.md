# Screen

[mapinfo gameinfo]: ../../Data/MapInfo.md#gameinfo

[DrawTextureTags]: DrawTextureTags.md
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
static varArg void {DrawChar}([Font] font, int cr, double x, double y, int character, ...)

The same as `DrawTexture`, but draws the texture of character code
`character` from `font`. The output color may be modified by the font
color `cr`.
-#

#-
static varArg void {DrawShape}(textureId tex, bool animate, [Shape2D] s, ...)
static varArg void {DrawText}([Font] font, int cr, double x, double y, string text, ...)

{{#include ../../Labels/Todo.md}}
-#

#-
static varArg void {DrawTexture}(textureId tex, bool animate, double x, double y, ...)

Draws texture `tex`, possibly animated by the animation ticker if
`animate` is `true`, at horizontal position `x` and vertical position
`y`. See [`DrawTextureTags`] for information on the available
arguments.
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
