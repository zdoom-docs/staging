# Console

[acs]: ../../Acs.md
[format strings]: ../../Concepts/FormatStrings.md
[language]: ../../Data/Language.md

[Font]: Font.md
[GS_FULLCONSOLE]: ../Base/EGameState.md#memb-gs_fullconsole
[GameState]: ../Base/Globals.md#memb-gamestate
[PrintBold]: ../../Acs/Drawing/PrintBold.md
[Print]: ../../Acs/Drawing/Print.md
[msgmidcolor2]: ../../CVars.md#cvar-msgmidcolor2
[msgmidcolor]: ../../CVars.md#cvar-msgmidcolor

<!-- api-declaration -->
struct Console clearscope;

<!-- api-definition -->
Basic access to console functionality.

<!-- api-class-methods -->
#-
static void {HideConsole}()

Hides the console if it is open and [GameState] is not
[GS_FULLCONSOLE].
-#

#-
static void {MidPrint}([Font] font, string text, bool bold = false)

Prints `text` (possibly a [LANGUAGE] string if prefixed with `$`) in
`font` to the middle of the screen for 1½ seconds. Will print even if
the player is a spectator if `bold` is `true`. Uses the [msgmidcolor]
CVar for non-bold messages and [msgmidcolor2] for bold messages.

This is the function used internally by [ACS]' [Print] and [PrintBold]
functions.
-#

#-
static vararg void {PrintF}(string fmt, \...)

Prints a [formatted string][format strings] to the console.
-#
