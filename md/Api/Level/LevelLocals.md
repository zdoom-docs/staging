# LevelLocals

[SeqType]: Sector.md#memb-SeqType

[MapInfo]: ../../Data/MapInfo.md

<!-- api-declaration -->
struct LevelLocals clearScope;

<!-- api-definition -->
A structure of all the relevant data for a single level.

<!-- toc -->

<!-- api-sub-types -->
EUdmf,

<!-- api-class-methods -->
#-
static void {MakeScreenShot}()
static void {MakeAutoSave}()
deprecated("3.8") static void {RemoveAllBots}(bool fromList)
deprecated("3.8") static bool {IsPointInMap}(vector3 p)

{{#include ../../Labels/Todo.md}}
-#

<!-- api-instance-methods -->
#-
string {GetUdmfString}([EUdmf] type, int index, name key)
int {GetUdmfInt}([EUdmf] type, int index, name key)
double {GetUdmfFloat}([EUdmf] type, int index, name key)
play int {ExecuteSpecial}(int special, [Actor] activator, [Line] lineDef, bool lineSide, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0, int arg5 = 0)
void {GiveSecret}([Actor] activator, bool printMsg = true, bool playSound = true)
void {StartSlideshow}(name whichOne = 'none')
void {WorldDone}()
ui vector2 {GetAutoMapPosition}()
void {SetInterMusic}(string nextMap)
string {FormatMapName}(int mapNameColor)
bool {IsJumpingAllowed}() const
bool {IsCrouchingAllowed}() const
bool {IsFreeLookAllowed}() const
void {StartIntermission}(name type, int state) const
play [SpotState] {GetSpotState}(bool create = true)
int {FindUniqueTId}(int start = 0, int limit = 0)
uint {GetSkyBoxPortal}([Actor] actor)
void {ReplaceTextures}(string from, string to, int flags)
[HealthGroup] {FindHealthGroup}(int id)
vector3, int {PickDeathmatchStart}()
vector3, int {PickPlayerStart}(int pNum, int flags = 0)
int {IsFrozen}() const
void {SetFrozen}(bool on)
[Sector] {PointInSector}(vector2 p) const
bool {IsPointInLevel}(vector3 p) const
vector2 {Vec2Diff}(vector2 v1, vector2 v2) const
vector3 {Vec3Diff}(vector3 v1, vector3 v2) const
vector3 {SphericalCoords}(vector3 viewPoint, vector3 targetPos, vector2 viewAngles = (0.0, 0.0), bool absolute = false) const
vector2 {Vec2Offset}(vector2 pos, vector2 dir, bool absolute = false) const
vector3 {Vec2OffsetZ}(vector2 pos, vector2 dir, double atZ, bool absolute = false) const
vector3 {Vec3Offset}(vector3 pos, vector3 dir, bool absolute = false) const
string {GetChecksum}() const
void {ChangeSky}(textureId sky1, textureId sky2)
[SectorTagIterator] {CreateSectorTagIterator}(int tag, [Line] defLine = null)
[LineIdIterator] {CreateLineIdIterator}(int tag)
[ActorIterator] {CreateActorIterator}(int tid, class<[Actor]\> type = "Actor")
string {TimeFormatted}(bool totals = false)
play bool {CreateCeiling}([Sector] sec, [Ceiling].[ECeiling] type, [Line] ln, double speed, double speed2, double height = 0.0, int crush = -1, int silent = 0, int change = 0, [Ceiling].[ECrushMode] crushMode = [Ceiling].[CRUSHDOOM])
play bool {CreateFloor}([Sector] sec, [Floor].[EFloor] type, [Line] ln, double speed, double height = 0.0, int crush = -1, int change = 0, bool crushMode = false, bool hereticLower = false)
void {ExitLevel}(int position, bool keepFacing)
void {SecretExitLevel}(int position)
void {ChangeLevel}(string levelName, int position = 0, int flags = 0, int skill = -1)

{{#include ../../Labels/Todo.md}}
-#

<!-- api-members -->
### Map Data

#-
array<[Sector]> {Sectors}
array<[Line]> {Lines}
array<[Side]> {Sides}
readOnly array<[Vertex]> {Vertexes}

{{#include ../../Labels/Todo.md}}
-#

#### Sequencing

#-
readOnly int {LevelNum}
readOnly string {MapName}
readOnly int {Cluster}
readOnly int {MapType}
readOnly int {ClusterFlags}

{{#include ../../Labels/Todo.md}}
-#

#### Meta-data

#-
readOnly string {LevelName}
readOnly string {AuthorName}

{{#include ../../Labels/Todo.md}}
-#

### Music

#-
readOnly string {Music}
readOnly int {MusicOrder}
readOnly float {MusicVolume}

{{#include ../../Labels/Todo.md}}
-#

### Visuals

#-
readOnly string {F1Pic}
readOnly textureId {SkyTexture1}
readOnly textureId {SkyTexture2}
float {SkySpeed1}
float {SkySpeed2}
readOnly int {FogDensity}
readOnly int {OutsideFogDensity}
readOnly int {SkyFog}
readOnly float {PixelStretch}

{{#include ../../Labels/Todo.md}}
-#

### Gameplay

#-
readOnly bool {ActOwnSpecial}
readOnly bool {AllowRespawn}
readOnly bool {CheckSwitchRange}
readOnly bool {Infinite_Flight}
readOnly bool {KeepFullInventory}
readOnly bool {MissilesActivateImpact}
readOnly bool {MonsterFallingDamage}
readOnly bool {MonstersTeleFrag}
readOnly bool {NoInventoryBar}
readOnly bool {NoMonsters}
readOnly bool {No_Dlg_Freeze}
readOnly bool {PolyGrind}
readOnly bool {RemoveItems}
readOnly double {TeamDamage}
play int {AirSupply}
bool {AllMap}
deprecated("3.8") bool {Frozen}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly bool {SndSeqTotalCtrl}

Sets all sectors' [`SeqType`] to `-1`. Set by the *NoAutoSequences*
flag in [MapInfo].
-#

#### Physics

#-
play double {Gravity}
play double {AirControl}
play double {AirFriction}
readOnly int {CompatFlags}
readOnly int {CompatFlags2}

{{#include ../../Labels/Todo.md}}
-#

#### Statistics

#-
int {Total_Secrets}
int {Found_Secrets}
int {Total_Items}
int {Found_Items}
int {Total_Monsters}
int {Killed_Monsters}

{{#include ../../Labels/Todo.md}}
-#

### Time

#-
readOnly int {Time}
readOnly int {MapTime}
readOnly int {TotalTime}
readOnly int {StartTime}
readOnly int {ParTime}
readOnly int {SuckTime}

{{#include ../../Labels/Todo.md}}
-#

### Transitions

#-
string {NextMap}
string {NextSecretMap}
name {DeathSequence}

{{#include ../../Labels/Todo.md}}
-#

<!-- api-constants -->
#-
const int {CLUSTER_HUB}

{{#include ../../Labels/Todo.md}}
-#
