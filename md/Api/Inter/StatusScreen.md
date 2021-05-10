# StatusScreen

[CR_UNTRANSLATED]: ../Drawing/Font/EColorRange.md#enum-CR_UNTRANSLATED
[ESpState]: StatusScreen/ESpState.md
[EState]: StatusScreen/EState.md
[FSMODE_SCALETOFIT43]: ../Drawing/EScaleMode.md#enum-FSMODE_SCALETOFIT43
[Font]: ../Drawing/Font.md
[FragCount]: WbPlayerStruct.md#memb-FragCount
[GS_INTERMISSION]: ../Base/EGameState.md#memb-GS_INTERMISSION
[GameState]: ../Globals.md#memb-GameState
[InterBackground]: InterBackground.md
[LEAVINGINTERMISSION]: StatusScreen/EState.md#enum-LEAVINGINTERMISSION
[LevelLocals]: ../Level/LevelLocals.md
[MAXPLAYERS]: ../Globals.md#memb-MAXPLAYERS
[NOSTATE]: StatusScreen/EState.md#enum-NOSTATE
[PNum]: WbStartStruct.md#memb-PNum
[PatchInfo]: PatchInfo.md
[PlayerInfo]: ../Players/PlayerInfo.md
[Plyr]: WbStartStruct.md#memb-Plyr
[SHOWNEXTLOC]: StatusScreen/EState.md#enum-SHOWNEXTLOC
[STATCOUNT]: StatusScreen/EState.md#enum-STATCOUNT
[S_StartSound]: ../Base/Object.md#mthd-S_StartSound
[StatusScreen]: #statusscreen
[WbPlayerStruct]: WbPlayerStruct.md
[WbStartStruct]: WbStartStruct.md
[WorldDone]: ../Level/LevelLocals.md#mthd-WorldDone

[mapinfo gameinfo]: ../../Data/MapInfo.md#gameinfo

<!-- api-declaration -->
class StatusScreen abstract play version("2.5");

<!-- api-definition -->
The base class for intermission status screens. Any status screen used
by [MAPINFO GameInfo] must be derived from this class.

<!-- api-sub-types -->
ESpState,
EState,

<!-- api-class-methods -->

#-
static int, int, int {GetPlayerWidths}()
static color {GetRowColor}([PlayerInfo] player, bool highlight)
static void {GetSortedPlayers}(in out array\<int> sorted, bool teamPlay)

{{#include ../../Labels/Todo.md}}
-#

#-
static void {PlaySound}(sound snd)

Plays a UI sound at full volume using [`S_StartSound`].
-#

<!-- api-instance-methods -->

#-
void {SetSize}(int width, int height, int wrapW = -1, int scaleMode = [FSMODE_SCALETOFIT43])
int {DrawCharPatch}([Font] fnt, int charCode, int x, int y, int translation = [Font].[CR_UNTRANSLATED], bool noMove = false)
void {DrawTexture}(textureId tex, double x, double y, bool noMove = false)
void {DrawText}([Font] fnt, int color, double x, double y, string s, bool noMove = false, bool shadow = false)
int {DrawName}(int y, textureId tex, string levelName)
int {DrawAuthor}(int y, string levelName)
deprecated("3.8") int {DrawPatchText}(int y, [PatchInfo] pInfo, string stringName)
int {DrawPatchOrText}(int y, [PatchInfo] pinfo, textureId patch, string stringName)
virtual int {DrawLf}()
virtual int {DrawEl}()
int {DrawNum}([Font] fnt, int x, int y, int n, int digits, bool leadingZeros = true, int translation = [Font].[CR_UNTRANSLATED], bool noMove = false)
void {DrawPercent}([Font] fnt, int x, int y, int p, int b, bool show_Total = true, int color = [Font].[CR_UNTRANSLATED], bool noMove = false)
void {DrawTimeFont}([Font] printFont, int x, int y, int t, int color)
void {DrawTime}(int x, int y, int t, bool no_Sucks = false)
void {DrawTextScaled}([Font] fnt, double x, double y, string text, double scale, int translation = [Font].[CR_UNTRANSLATED])
void {DrawNumScaled}([Font] fnt, int x, int y, double scale, int n, int digits, int translation = [Font].[CR_UNTRANSLATED])
void {DrawPercentScaled}([Font] fnt, int x, int y, int p, int b, double scale, bool show_Total = true, int color = [Font].[CR_UNTRANSLATED])
void {DrawTimeScaled}([Font] fnt, int x, int y, int t, double scale, int color = [Font].[CR_UNTRANSLATED])
bool {AutoSkip}()

{{#include ../../Labels/Todo.md}}
-#

#-
virtual void {Drawer}()

Called by `WI_Drawer`, which is called every frame when [`GameState`]
is [`GS_INTERMISSION`].
-#

#-
virtual void {End}()

Called when the intermission should end. Default behaviour is to set
[`CurState`] to [`StatusScreen.LEAVINGINTERMISSION`] and remove bots
in death-match. Generally, [`LevelLocals.WorldDone`] should be called
directly after this.
-#

#-
virtual void {Start}([WbStartStruct] wbs)

Called by `WI_Start` after the [`WbStartStruct`] is populated, sounds
are stopped and the screen blend is set to black. Sets up initial
values and runs [`InitStats`].
-#

#-
virtual void {StartMusic}()

Called in the first tic by [`Ticker`] to set the intermission music.
-#

#-
virtual void {Ticker}()

Called by `WI_Ticker`, which is called every game tic when
[`GameState`] is [`GS_INTERMISSION`].
-#

#-
protected virtual void {DrawNoState}()

Called by `Drawer` when [`CurState`] is [`StatusScreen.NOSTATE`] or
any other non-state.
-#

#-
protected virtual void {DrawShowNextLoc}()

Called by [`Drawer`] when [`CurState`] is [`StatusScreen.SHOWNEXTLOC`]
and, by default, [`DrawNoState`] after setting [`Snl_PointerOn`] to
`true`.
-#

#-
protected virtual void {DrawStats}()

Called by [`Drawer`] directly after drawing the animated background
when [`CurState`] is [`StatusScreen.STATCOUNT`].
-#

#-
protected virtual void {InitNoState}()

Called by [`UpdateShowNextLoc`] to initiate the
[`StatusScreen.NOSTATE`] stage.
-#

#-
protected virtual void {InitShowNextLoc}()

Called by [`UpdateStats`] to initiate the [`StatusScreen.SHOWNEXTLOC`]
stage.
-#

#-
protected virtual void {InitStats}()

Called by [`Start`] to initiate the [`StatusScreen.STATCOUNT`] stage.
-#

#-
protected virtual void {UpdateNoState}()

Called by [`Ticker`] when [`CurState`] is [`StatusScreen.NOSTATE`] or
any other non-state. Exits the intermission by calling [`End`] and
[`LevelLocals.WorldDone`] when appropriate.
-#

#-
protected virtual void {UpdateShowNextLoc}()

Called by [`Ticker`] when [`CurState`] is
[`StatusScreen.SHOWNEXTLOC`]. Runs [`InitNoState`] when appropriate
and alternates [`Snl_PointerOn`].
-#

#-
protected virtual void {UpdateStats}()

Called by [`Ticker`] when [`CurState`] is [`StatusScreen.STATCOUNT`].
Runs [`InitShowNextLoc`] when appropriate.
-#

#-
protected void {CheckForAccelerate}()

Updates the values of [`AccelerateStage`] and [`PlayerReady`]
according to each player's inputs.
-#

#-
protected int {FragSum}(int playerNum)

Returns the number of frags player `playerNum` has accumulated against
all currently in-game players. This is different from
[`WbPlayerStruct.FragCount`] because it is counted dynamically, i.e.
if a player leaves the count will be changed. This is only useful for
game modes where frags do not count as score.
-#

<!-- api-members -->
#-
[InterBackground] {Bg}

The background for this intermission, set by [`Start`] with the
initial [`WbStartStruct`] object.
-#

#-
int {AccelerateStage}

Used to signify to the current stage that it should go quicker or be
skipped entirely.
-#

#-
bool[[MAXPLAYERS]\] {PlayerReady}

Used in networked games to signify when each player is ready to
continue to the next map. Set by [`CheckForAccelerate`].
-#

#-
int {Me}

The value of [`Wbs.PNum`] when [`Start`] was called. Usually not
changed, so essentially equivalent to [`Wbs.PNum`].
-#

#-
int {BCnt}

{{#include ../../Labels/Todo.md}}
-#

#-
int {CurState}

The current stage the intermission is in.
-#

#-
[WbStartStruct] {Wbs}

The [`WbStartStruct`] passed to this class via the [`Start`] function.
-#

#-
[WbPlayerStruct]\[[MAXPLAYERS]\] {Plrs}

The value of [`Wbs.Plyr`] when [`Start`] was called. Usually not
changed, so essentially equivalent to [`Wbs.Plyr`].
-#

#-
int {OtherKills}
int {Cnt}
int {Cnt_OtherKills}
int[[MAXPLAYERS]\] {Cnt_Kills}
int[[MAXPLAYERS]\] {Cnt_Items}
int[[MAXPLAYERS]\] {Cnt_Secret}
int[[MAXPLAYERS]\] {Cnt_Frags}
int[[MAXPLAYERS]\] {Cnt_Deaths}
int {Cnt_Time}
int {Cnt_Total_Time}
int {Cnt_Par}
int {Cnt_Pause}
int {Total_Frags}
int {Total_Deaths}
bool {NoAutoStartMap}
int {DoFrags}
int {Ng_State}
float {ShadowAlpha}
[PatchInfo] {MapName}
[PatchInfo] {Finished}
[PatchInfo] {Entering}
[PatchInfo] {Content}
[PatchInfo] {Author}

{{#include ../../Labels/Todo.md}}
-#

#-
textureId {P_Secret}

The "SECRET" (default `WISCRT2`) graphic.
-#

#-
textureId {Kills}

The "KILLS" (default `WIOSTK`) graphic.
-#

#-
textureId {Secret}

The "SCRT" (default `WIOSTS`) graphic.
-#

#-
textureId {Items}

The "ITEMS" (default `WIOSTI`) graphic.
-#

#-
textureId {TimePic}

The "TIME" (default `WITIME`) graphic.
-#

#-
textureId {Par}

The "PAR" (default `WIPAR`) graphic.
-#

#-
textureId {Sucks}

The "SUCKS" (default `WISUCKS`) graphic.
-#

#-
textureId {FinishedPatch}
textureId {EnteringPatch}
string[2\] {LNameTexts}
string[2\] {AuthorTexts}
bool {Snl_PointerOn}
int[[MAXPLAYERS]\] {Player_Deaths}

{{#include ../../Labels/Todo.md}}
-#

#-
int {Sp_State}

Used in single-player status screens during the [`StatusScreen.STATCOUNT`] stage
for indicating the current round of statistics to count up.
-#

#-
int {CWidth}
int {CHeight}
int {ScaleMode}
int {WrapWidth}
int {ScaleFactorX}
int {ScaleFactorY}

{{#include ../../Labels/Todo.md}}
-#

<!-- api-constants -->
#-
const int {TITLEY}

The Y position (in 320x200 pixels) to draw the top of the "finished"
and "entering" text. Used by [`DrawEl`] and [`DrawLf`].
-#

#-
const int {SP_STATSX}
const int {SP_STATSY}
const int {SP_TIMEX}
const int {SP_TIMEY}
const int {NG_STATSY}
const int {SHOWNEXTLOCDELAY}

{{#include ../../Labels/Todo.md}}
-#

<!-- EOF -->
