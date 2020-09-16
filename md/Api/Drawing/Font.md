# Font

[ascender]: https://en.wikipedia.org/wiki/Ascender_(typography)
[localized]: ../Base/StringTable.md
[text colors]: ../../Concepts/TextColors.md

[BrokenLines]: BrokenLines.md
[EColorRange]: Font/EColorRange.md

<!-- api-declaration -->
struct Font clearscope;

<!-- api-definition -->
{{#include ../../Labels/Unserializable.md}}

A set of character graphics used to visually represent strings of
text.

<!-- api-sub-types -->
* [EColorRange]

<!-- api-class-methods -->
#-
static Font {FindFont}(name fontName)

Gets a font by name without loading it.
-#

#-
static int {FindFontColor}(name color)

Returns the color range number for a named color. This is mainly
useful for user-defined [text colors], as they will also return a valid
number with this function.
-#

#-
static Font {GetFont}(name fontName)

Gets a font by name, loading it if it doesn't exist.
-#

<!-- api-instance-methods -->
#-
bool {CanPrint}(string text)

Returns `true` if all characters in `text` are printable (i.e.
whitespace, [color escapes][text colors], and valid characters in the
font.)
-#

#-
double {GetBottomAlignOffset}(int code)

Returns the baseline for the character `code`.
-#

#-
int {GetCharWidth}(int code)

Returns the width in pixels of a character code.
-#

#-
string {GetCursor}()

Returns the string used as a blinking cursor graphic for this font.
-#

#-
int {GetDisplacement}()

Returns the largest vertical displacement (offset) in pixels of all
characters in the font.
-#

#-
int {GetHeight}()

Returns the line height in pixels of the font.
-#

#-
int {GetMaxAscender}(string text)

Gets the maximum [ascender] for the first line in `text` (or the
[localized] version of `text` if it begins with `$`.)
-#

#-
int {StringWidth}(string text)

Returns the width in pixels of the string. This returns specifically
the width of the largest line in the string.
-#

#-
[BrokenLines] {BreakLines}(string text, int maxLen)

Breaks `text` up into a [BrokenLines] structure according to the
screen and clip region, as well as appropriately accounting for a
maximum width in pixels of `maxLen`.
-#

<!-- api-constants -->
#-
const string {TEXTCOLOR_BRICK}
const string {TEXTCOLOR_TAN}
const string {TEXTCOLOR_GRAY}
const string {TEXTCOLOR_GREY}
const string {TEXTCOLOR_GREEN}
const string {TEXTCOLOR_BROWN}
const string {TEXTCOLOR_GOLD}
const string {TEXTCOLOR_RED}
const string {TEXTCOLOR_BLUE}
const string {TEXTCOLOR_ORANGE}
const string {TEXTCOLOR_WHITE}
const string {TEXTCOLOR_YELLOW}
const string {TEXTCOLOR_UNTRANSLATED}
const string {TEXTCOLOR_BLACK}
const string {TEXTCOLOR_LIGHTBLUE}
const string {TEXTCOLOR_CREAM}
const string {TEXTCOLOR_OLIVE}
const string {TEXTCOLOR_DARKGREEN}
const string {TEXTCOLOR_DARKRED}
const string {TEXTCOLOR_DARKBROWN}
const string {TEXTCOLOR_PURPLE}
const string {TEXTCOLOR_DARKGRAY}
const string {TEXTCOLOR_CYAN}
const string {TEXTCOLOR_ICE}
const string {TEXTCOLOR_FIRE}
const string {TEXTCOLOR_SAPPHIRE}
const string {TEXTCOLOR_TEAL}
const string {TEXTCOLOR_NORMAL}
const string {TEXTCOLOR_BOLD}
const string {TEXTCOLOR_CHAT}
const string {TEXTCOLOR_TEAMCHAT}

Each of the default [text color escapes][text colors].
-#
