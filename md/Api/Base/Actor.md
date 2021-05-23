# Actor

[AAPTR_DEFAULT]: EPointerFlags.md#enum-AAPTR_DEFAULT
[AAPTR_MASTER]: EPointerFlags.md#enum-AAPTR_MASTER
[AAPTR_PLAYER1]: EPointerFlags.md#enum-AAPTR_PLAYER1
[AAPTR_TARGET]: EPointerFlags.md#enum-AAPTR_TARGET
[ATTN_NORM]: ../Globals.md#memb-ATTN_NORM
[Actor]: #actor
[CHAN_BODY]: ESoundFlags.md#enum-CHAN_BODY
[CHAN_VOICE]: ESoundFlags.md#enum-CHAN_VOICE
[FCheckPosition]: FCheckPosition.md
[FLAG_NO_CHANGE]: ../Globals.md#memb-FLAG_NO_CHANGE
[FLineTraceData]: FLineTraceData.md
[FRailParams]: FRailParams.md
[FTranslatedLineTarget]: FTranslatedLineTarget.md
[HR_SHADOW]: ../Globals.md#memb-HR_SHADOW
[HX_SHADOW]: ../Globals.md#memb-HX_SHADOW
[Inventory]: ../Inventory/Inventory.md
[Lightning]: ../Hexen/Lightning.md
[Line]: ../Level/Line.md
[LinkContext]: LinkContext.md
[LookExParams]: LookExParams.md
[NO_REPLACE]: EReplace.md#enum-NO_REPLACE
[Object]: Object.md
[PSP_WEAPON]: ../Weapons/EPspLayers.md#enum-PSP_WEAPON
[PlayerInfo]: ../Players/PlayerInfo.md
[PlayerPawn]: ../Players/PlayerPawn.md
[RADF_HURTSOURCE]: RadiusDamageFlags.md#enum-RADF_HURTSOURCE
[RSF_FOG]: ERespawnFlags.md#enum-RSF_FOG
[Sector]: ../Level/Sector.md
[SeqNode]: ../Sound/SeqNode.md
[SpecialSpot]: ../MapFuncs/SpecialSpot.md
[State]: State.md
[TICRATE]: Object.md#memb-TICRATE
[TerrainDef]: ../Level/TerrainDef.md
[Thinker]: Thinker.md

[decals]: ../../Concepts/Decals.md
[default state usage]: DefaultStateUsage.md
[legacy render style]: ../../Concepts/RenderStyle.md
[translatable string]: ../../Concepts/Localization.md
[translation string]: ../../Concepts/Translation.md

<!-- api-declaration -->
class Actor : Thinker

<!-- api-definition -->
A [`Thinker`] capable of existing within 3D space.

<!-- toc -->

<!-- api-class-methods -->
### Pure Functions

#-
clearScope static double {DeltaAngle}(double a1, double a2)
clearScope static double {AbsAngle}(double a1, double a2)
clearScope static vector2 {AngleToVector}(double angle, double length = 1.0)
clearScope static vector2 {RotateVector}(vector2 vec, double angle)
clearScope static double {Normalize180}(double angle)
clearScope static double {BobSin}(double fb)
clearScope static double {GetDefaultSpeed}(class<[Actor]\> type)
clearScope static bool {InStateSequence}([State] newState, [State] baseState)

{{#include ../../Labels/Todo.md}}
-#

### Play Functions

#-
static class<[Actor]\> {GetReplacement}(class<[Actor]\> cls)
static class<[Actor]\> {GetReplacee}(class<[Actor]\> cls)
static class<[Actor]\> {GetSpawnableType}(int spawnNum)
static int {GetSpriteIndex}(name sprite)
static int {ApplyDamageFactors}(class<[Inventory]\> itemClass, name damageType, int damage, int defDamage)
static [Actor] {Spawn}(class<[Actor]\> type, vector3 pos = (0.0, 0.0, 0.0), int replace = [NO_REPLACE])

{{#include ../../Labels/Todo.md}}
-#

### Deprecated

#-
deprecated("3.8") static int {FindUniqueTId}(int start = 0, int limit = 0)

{{#include ../../Labels/Legacy.md}} {{#include ../../Labels/Todo.md}}
-#

<!-- api-instance-methods -->
### Pure Functions

#-
clearScope bool {IsFrozen}() const
clearScope int {GetRenderStyle}() const
clearScope bool {CheckKeys}(int lockNum, bool remote, bool quiet = false)
clearScope string {GetTag}(string defStr = "") const
clearScope double {GetBobOffset}(double frac = 0.0) const
clearScope bool {IsTeammate}([Actor] other) const
clearScope int {PlayerNumber}() const
clearScope vector3 {PosRelative}([Sector] sec) const
clearScope int {SpawnHealth}() const
clearScope double {Distance2D}([Actor] other) const
clearScope double {Distance3D}([Actor] other) const
clearScope double {Distance2DSquared}([Actor] other) const
clearScope double {Distance3DSquared}([Actor] other) const
clearScope [Actor] {GetPointer}(int aaPtr)
clearScope bool {CountsAsKill}() const
clearscope [State] {FindState}(stateLabel st, bool exact = false) const
clearScope double {AngleTo}([Actor] target, bool absolute = false) const
clearScope vector2 {Vec2To}([Actor] other) const
clearScope vector3 {Vec3To}([Actor] other) const
clearScope vector3 {Vec3Offset}(double x, double y, double z, bool absolute = false) const
clearScope vector2 {Vec2Offset}(double x, double y, bool absolute = false) const
clearScope vector3 {Vec2OffsetZ}(double x, double y, double atZ, bool absolute = false) const
clearScope vector3 {Vec3Angle}(double length, double angle, double z = 0.0, bool absolute = false) const
clearScope vector2 {Vec2Angle}(double length, double angle, bool absolute = false) const
clearScope bool {IsFriend}([Actor] other) const
clearScope bool {IsHostile}([Actor] other) const
clearScope [DropItem] {GetDropItems}() const
clearScope double {DistanceBySpeed}([Actor] other, double speed) const
clearScope double {GetCameraHeight}() const
clearScope double {GetGravity}() const
clearScope int {GetLevelSpawnTime}() const
clearScope int {GetAge}() const
clearScope double {AccuracyFactor}() const
clearScope [Inventory] {FindInventory}(class<[Inventory]\> itemType, bool subClass = false) const
clearScope int {GetSpawnHealth}() const
clearScope bool {IsActorPlayingSound}(int channel, sound snd = 0)

{{#include ../../Labels/Todo.md}}
-#

### Play Functions

#-
void {A_Light}(int extraLight)
void {A_ClearTarget}()
void {A_ChangeLinkFlags}(int blockMap = [FLAG_NO_CHANGE], int sector = [FLAG_NO_CHANGE])
void {A_Die}(name damageType = 'none')
void {A_Face}([Actor] faceTo, double max_Turn = 0.0, double max_Pitch = 270.0, double ang_Offset = 0.0, double pitch_Offset = 0.0, int flags = 0, double z_Ofs = 0.0)
bool {A_LineEffect}(int boomSpecial = 0, int tag = 0)
void {A_MonsterRail}()
void {A_Pain}()
void {A_NoBlocking}(bool drop = true)
void {A_Chase}(stateLabel melee = '_a_chase_default', stateLabel missile = '_a_chase_default', int flags = 0)
void {A_VileChase}()
bool {A_CheckForResurrection}()
void {A_BossDeath}()
void {A_FastChase}()
void {A_PlayerScream}()
void {A_CheckTerrain}()
void {A_Wander}(int flags = 0)
void {A_WolfAttack}(int flags = 0, sound whatToPlay = "weapons/pistol", double snipe = 1.0, int maxDamage = 64, int blockSize = 128, int pointBlank = 2, int longRange = 4, double runSpeed = 160.0, class<[Actor]\> puffType = "BulletPuff")
clearScope void {A_StartSound}(sound whatToPlay, int slot = [CHAN_BODY], int flags = 0, double volume = 1.0, double attenuation = [ATTN_NORM], double pitch = 0.0, double startTime = 0.0)
void {A_SoundVolume}(int slot, double volume)
void {A_SoundPitch}(int slot, double pitch)
void {A_StopSound}(int slot = [CHAN_VOICE])
void {A_StopAllSounds}()
void {A_StopSounds}(int chanMin, int chanMax)
void {A_SeekerMissile}(int threshold, int turnMax, int flags = 0, int chance = 50, int distance = 10)
action [State] {A_Jump}(int chance, stateLabel label, ...)
[Actor] {A_SpawnProjectile}(class<[Actor]\> missileType, double spawnHeight = 32.0, double spawnOfs_Xy = 0.0, double angle = 0.0, int flags = 0, double pitch = 0.0, int ptr = [AAPTR_TARGET])
void {A_CustomRailgun}(int damage, int spawnOfs_Xy = 0, color color1 = 0, color color2 = 0, int flags = 0, int aim = 0, double maxDiff = 0, class<[Actor]\> puffType = "BulletPuff", double spread_Xy = 0, double spread_Z = 0, double range = 0, int duration = 0, double sparsity = 1.0, double driftSpeed = 1.0, class<[Actor]\> spawnClass = null, double spawnOfs_Z = 0, int spiralOffset = 270, int limit = 0, double velEffect = 3.0)
void {A_SetRenderStyle}(double alpha, int style)
void {A_FadeIn}(double reduce = 0.1, int flags = 0)
void {A_FadeOut}(double reduce = 0.1, int flags = 1)
void {A_FadeTo}(double target, double amount = 0.1, int flags = 0)
void {A_SpawnParticle}(color color1, int flags = 0, int lifeTime = [Object].[TICRATE], double size = 1.0, double angle = 0.0, double xOff = 0.0, double yOff = 0.0, double zOff = 0.0, double velX = 0.0, double velY = 0.0, double velZ = 0.0, double accelX = 0.0, double accelY = 0.0, double accelZ = 0.0, double startAlphaF = 1.0, double fadeStepF = -1.0, double sizeStep = 0.0)
void {A_DropInventory}(class<[Inventory]\> itemType, int amount = -1)
void {A_SetBlend}(double color1, double alpha, int tics, color color2 = 0, double alpha2 = 0.0)
void {A_ChangeCountFlags}(int kill = [FLAG_NO_CHANGE], int item = [FLAG_NO_CHANGE], int secret = [FLAG_NO_CHANGE])
void {A_Weave}(int xSpeed, int ySpeed, double xDist, double yDist)
action [State], bool {A_Teleport}(stateLabel teleportState = null, class<[SpecialSpot]\> targetType = "BossSpot", class<[Actor]\> fogType = "TeleportFog", int flags = 0, double minDist = 128.0, double maxDist = 0.0, int ptr = [AAPTR_DEFAULT])
action [State], bool {A_Warp}(int ptr_Destination, double xOfs = 0.0, double yOfs = 0.0, double zOfs = 0.0, double angle = 0.0, int flags = 0, stateLabel success_State = null, double heightOffset = 0.0, double radiusOffset = 0.0, double pitch = 0.0)
[State] {A_MonsterReFire}(int chance, stateLabel label)
void {A_LookEx}(int flags = 0, double minSeeDist = 0.0, double maxSeeDist = 0.0, double maxHearDist = 0.0, double fov = 0.0, stateLabel label = null)
void {A_Recoil}(double xyVel)
int {A_RadiusGive}(class<[Inventory]\> itemType, double distance, int flags, int amount = 0, class<[Actor]\> filter = null, name species = 'None', double minDist = 0, int limit = 0)
void {A_CustomMeleeAttack}(int damage = 0, sound meleeSound = "", sound missSound = "", name damageType = 'none', bool bleed = true)
void {A_CustomComboAttack}(class<[Actor]\> missileType, double spawnHeight, int damage, sound meleeSound = "", name damageType = 'none', bool bleed = true)
void {A_Burst}(class<[Actor]\> chunkType)
void {A_RadiusDamageSelf}(int damage = 128, double distance = 128.0, int flags = 0, class<[Actor]\> flashType = null)
void {A_Respawn}(int flags = [RSF_FOG])
void {A_RestoreSpecialPosition}()
void {A_QueueCorpse}()
void {A_DequeueCorpse}()
void {A_SetAngle}(double angle = 0.0, int flags = 0, int ptr = [AAPTR_DEFAULT])
void {A_SetPitch}(double pitch, int flags = 0, int ptr = [AAPTR_DEFAULT])
void {A_SetRoll}(double roll, int flags = 0, int ptr = [AAPTR_DEFAULT])
void {A_SetViewAngle}(double angle = 0.0, int flags = 0, int ptr = [AAPTR_DEFAULT])
void {A_SetViewPitch}(double pitch, int flags = 0, int ptr = [AAPTR_DEFAULT])
void {A_SetViewRoll}(double roll, int flags = 0, int ptr = [AAPTR_DEFAULT])
void {A_QuakeEx}(int intensityX, int intensityY, int intensityZ, int duration, int damageRadius, int tremorRadius, sound sfx = "world/quake", int flags = 0, double mulWaveX = 1.0, double mulWaveY = 1.0, double mulWaveZ = 1.0, int fallOff = 0, int highPoint = 0, double rollIntensity = 0.0, double rollWave = 0.0)
action void {A_SetTics}(int ticks)
void {A_DamageChildren}(int amount, name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_DamageSiblings}(int amount, name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_KillChildren}(name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_KillSiblings}(name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_RemoveChildren}(bool removeAll = false, int flags = 0, class<[Actor]\> filter = null, name species = 'None')
void {A_RemoveSiblings}(bool removeAll = false, int flags = 0, class<[Actor]\> filter = null, name species = 'None')
void {A_Remove}(int removee, int flags = 0, class<[Actor]\> filter = null, name species = 'None')
bool {A_FaceMovementDirection}(double offset = 0, double angleLimit = 0.0, double pitchLimit = 0.0, int flags = 0, int ptr = [AAPTR_DEFAULT])
int {A_ClearOverlays}(int sStart = 0, int sStop = 0, bool safety = true)
bool {A_SetSize}(double newRadius = -1.0, double newHeight = -1.0, bool testPos = false)
void {A_SprayDecal}(string decalName, double dist = 172.0, vector3 offset = (0.0, 0.0, 0.0), vector3 direction = (0.0, 0.0, 0.0))
void {A_SetMugShotState}(string mugShot)
action bool {A_Overlay}(int layer, stateLabel start = null, bool noOverride = false)
action void {A_OverlayScale}(int layer, double wx = 1.0, double wy = 0.0, int flags = 0)
action void {A_OverlayRotate}(int layer, double degrees = 0, int flags = 0)
action void {A_OverlayPivot}(int layer, double wx = 0.5, double wy = 0.5, int flags = 0)
action void {A_OverlayPivotAlign}(int layer, int horizontalAlign, int verticalAlign)
action void {A_OverlayVertexOffset}(int layer, int index, double x, double y, int flags = 0)
action void {A_OverlayOffset}(int layer = [PSP_WEAPON], double wx = 0.0, double wy = 32.0, int flags = 0)
action void {A_OverlayFlags}(int layer, int flags, bool set)
action void {A_OverlayAlpha}(int layer, double alpha)
action void {A_OverlayRenderStyle}(int layer, int style)
action void {A_OverlayTranslation}(int layer, name translationName)
bool {A_AttachLightDef}(name lightId, name lightDef)
bool {A_AttachLight}(name lightId, int type, color lightColor, int radius1, int radius2, int flags = 0, vector3 ofs = (0.0, 0.0, 0.0), double param = 0.0, double spotI = 10.0, double spotO = 25.0, double spotP = 0.0)
bool {A_RemoveLight}(name lightId)
void {A_Scream}()
void {A_XScream}()
void {A_ActiveSound}()
void {A_CheckPlayerDone}()
action state {ResolveState}(stateLabel st)
action int {OverlayId}()
action double {OverlayX}(int layer = 0)
action double {OverlayY}(int layer = 0)
action double {OverlayAlpha}(int layer = 0)
double {GetZAt}(double px = 0, double py = 0, double angle = 0, int flags = 0, int pick_Pointer = [AAPTR_DEFAULT])
action void {SetCamera}([Actor] cam, bool revert = false)
bool {IsPointerEqual}(int ptrSelect1, int ptrSelect2)
ui void {DisplayNameTag}()
void {RemoveFromHash}()
void {ChangeTId}(int newTId)
void {SetShade}(color col)
protected void {CheckPortalTransition}(bool linked = true)
void {SetTag}(string defStr = "")
void {ClearCounters}()
bool {GiveBody}(int num, int max = 0)
bool {HitFloor}()
void {SetFriendPlayer}([PlayerInfo] player)
void {SoundAlert}([Actor] target, bool splash = false, double maxDist = 0.0)
void {ClearBounce}()
[TerrainDef] {GetFloorTerrain}()
bool {CheckLocalView}(int consolePlayer = -1)
bool {CheckNoDelay}()
bool {UpdateWaterLevel}(bool splash = true)
bool {IsZeroDamage}()
void {ClearInterpolation}()
void {RailAttack}([FRailParams] p)
void {HandleSpawnFlags}()
void {ExplodeMissile}([Line] lin = null, [Actor] target = null, bool onSky = false)
void {RestoreDamage}()
void {SetDamage}(int dmg)
void {SetOrigin}(vector3 newPos, bool moving)
void {SetXyz}(vector3 newPos)
double {BulletSlope}(out [FTranslatedLineTarget] pLineTarget = null, int aimFlags = 0)
void {CheckFakeFloorTriggers}(double oldZ, double oldZ_Has_ViewHeight = false)
bool {CheckFor3DFloorHit}(double z, bool trigger)
bool {CheckFor3DCeilingHit}(double z, bool trigger)
int {CheckMonsterUseSpecials}()
bool {CheckMissileSpawn}(double maxDist)
bool {CheckPosition}(vector2 pos, bool actorsOnly = false [FCheckPosition] tm = null)
bool {TestMobjLocation}()
[Actor] {SpawnMissile}([Actor] dest, class<[Actor]\> type, [Actor] owner = null)
[Actor] {SpawnMissileXyz}(vector3 pos, [Actor] dest, class<[Actor]\> type, bool checkSpawn = true, [Actor] owner = null)
[Actor] {SpawnMissileZ}(double z, [Actor] dest, class<[Actor]\> type)
[Actor] {SpawnMissileAngleZSpeed}(double z, class<[Actor]\> type, double angle, double vz, double speed, [Actor] owner = null, bool checkSpawn = true)
[Actor] {SpawnMissileZAimed}(double z, [Actor] dest, class<[Actor]\> type)
[Actor] {SpawnSubMissile}(class<[Actor]\> type, [Actor] target)
[Actor], [Actor] {SpawnPlayerMissile}(class<[Actor]\> type, double angle = 1e37, double x = 0, double pLineTarget = null, bool noFreeAim = false, bool noAutoAim = false, int aimFlags = 0)
void {SpawnTeleportFog}(vector3 pos, bool beforeTele, bool setTarget)
[Actor] {RoughMonsterSearch}(int distance, bool onlySeekable = false, bool frontOnly = false)
int {ApplyDamageFactor}(name damageType, int damage)
int {GetModifiedDamage}(name damageType, int damage, bool passive, [Actor] inflictor = null, [Actor] source = null, int flags = 0)
bool {CheckBossDeath}()
[Actor] {OldSpawnMissile}([Actor] dest, class<[Actor]\> type, [Actor] owner = null)
[Actor] {SpawnPuff}(class<[Actor]\> puffType, vector3 pos, double hitDir, double particleDir, int upDown, int flags = 0, [Actor] victim = null)
void {SpawnBlood}(vector3 pos, double dir, int damage)
void {BloodSplatter}(vector3 pos, double hitAngle, bool axe = false)
bool {HitWater}([Sector] sec, vector3 pos, bool checkAbove = false, bool alert = true, bool force = false)
void {PlaySpawnSound}([Actor] missile)
bool {Teleport}(vector3 pos, double angle, int flags)
void {TraceBleed}(int damage, [Actor] missile)
void {TraceBleedAngle}(int damage, double angle, double pitch)
void {SetIdle}(bool noFunction = false)
bool {CheckMeleeRange}()
bool {TriggerPainChance}(name mod, bool forcedPain = false)
void {PoisonMobj}([Actor] inflictor, [Actor] source, int damage, int duration, int period, name type)
double {AimLineAttack}(double angle, double distance, out [FTranslatedLineTarget] pLineTarget = null, double vRange = 0.0, int flags = 0, [Actor] target = null, [Actor] friender = null)
[Actor], int {LineAttack}(double angle, double distance, double pitch, int damage, name damageType, class<Actor\> puffType, int flags = 0, out [FTranslatedLineTarget] victim = null, double offsetZ = 0.0, double offsetForward = 0.0, double offsetSide = 0.0)
bool {LineTrace}(double angle, double distance, double pitch, int flags = 0, double offsetZ = 0.0, double offsetForward = 0.0, double offsetSide = 0.0, out [FLineTraceData] data = null)
bool {CheckSight}([Actor] target, int flags = 0)
bool {IsVisible}([Actor] other, bool allAround, [LookExParams] params = null)
bool {HitFriend}()
bool {MonsterMove}()
[SeqNode] {StartSoundSequenceId}(int sequence, int type, int modeNum, bool noStop = false)
[SeqNode] {StartSoundSequence}(name seqName, int modeNum)
void {StopSoundSequence}()
void {FindFloorCeiling}(int flags = 0)
double, double {GetFriction}()
bool, Actor {TestMobjZ}(bool quick = false)
bool {TryWalk}()
bool {TryMove}(vector newPos, int dropOff, bool missileCheck = false, [FCheckPosition] tm = null)
bool {CheckMove}(vector2 newPos, int flags = 0, [FCheckPosition] tm = null)
void {NewChaseDir}()
void {RandomChaseDir}()
bool {CheckMissileRange}()
bool {SetState}([State] st, bool noFunction = false)
bool {SetStateLabel}(stateLabel st, bool noFunction = false)
void {LinkToWorld}([LinkContext] ctx = null)
void {UnlinkFromWorld}(out [LinkContext] ctx = null)
bool {CanSeek}([Actor] target)
void {AddZ}(double zAdd, bool moving = true)
void {SetZ}(double z)
void {VelIntercept}([Actor] target, double speed = -1, bool aimPitch = true, bool oldVel = false)
void {VelFromAngle}(double speed = 1e37, double angle = 1e37)
void {AdjustFloorClip}()
void {CopyFriendliness}([Actor] other, bool changeTarget, bool resetHealth = true)
bool {LookForMonsters}()
bool {LookForTId}(bool allAround, [LookExParams] params = null)
bool {LookForEnemies}(bool allAround, [LookExParams] params = null)
bool {LookForPlayers}(bool allAround, [LookExParams] params = null)
bool {TeleportMove}(vector3 pos, bool teleFrag, bool modifyActor = true)
name {GetSpecies}()
void {PlayActiveSound}()
void {Howl}()
void {DrawSplash}(int count, double angle, int kind)
void {GiveSecret}(bool printMsg = true, bool playSound = true)
void {DoMissileDamage}([Actor] target)
protected void {DestroyAllInventory}()
[Inventory] {GiveInventoryType}(class<[Inventory]\> itemType)
bool {UsePuzzleItem}(int puzzleItemType)
bool {Warp}([Actor] dest, double xOfs = 0.0, double yOfs = 0.0, double zOfs = 0.0, double angle = 0.0, int flags = 0, double heightOffset = 0.0, double radiusOffset = 0.0, double pitch = 0.0)
[Actor] {SpawnMissileAngle}(class<[Actor]\> type, double angle, double vZ)
[Actor] {SpawnMissileAngleZ}(double z, class<[Actor]\> type, double angle, double vZ)
void {SpawnDirt}(double radius)
bool {SinkMobj}(double speed)
bool {RaiseMobj}(double speed)
[Actor] {AimTarget}()
void {RestoreRenderStyle}()
void {RaiseActor}([Actor] other, int flags = 0)
bool {CanRaise}()
void {Revive}()
int {GetRadiusDamage}([Actor] thing, int damage, int distance, int fullDmgDistance = 0, bool oldRadiusDmg = false)
int {RadiusAttack}([Actor] bombSource, int bombDamage, int bombDistance, name bombMod = 'none', int flags = [RADF_HURTSOURCE], int fullDamageDistance = 0, name species = 'None')
void {CopyBloodColor}([Actor] other)
int {ACS_NamedExecute}(name script, int mapNum = 0, int arg1 = 0, int arg2 = 0, int arg3 = 0)
int {ACS_NamedSuspend}(name script, int mapNum = 0)
int {ACS_NamedTerminate}(name script, int mapNum = 0)
int {ACS_NamedLockedExecute}(name script, int mapNum = 0, int arg1 = 0, int arg2 = 0, int lock = 0)
int {ACS_NamedLockedExecuteDoor}(name script, int mapNum = 0, int arg1 = 0, int arg2 = 0, int lock = 0)
int {ACS_NamedExecuteWithResult}(name script, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0)
int {ACS_NamedExecuteAlways}(name script, int mapNum = 0, int arg1 = 0, int arg2 = 0, int arg3 = 0)
int {ACS_ScriptCall}(name script, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0)

{{#include ../../Labels/Todo.md}}
-#

### Virtuals

#-
virtual void {MarkPrecacheSounds}()
virtual void {BeginPlay}()
virtual void {Activate}([Actor] activator)
virtual void {Deactivate}([Actor] activator)
virtual int {DoSpecialDamage}([Actor] target, int damage, name damageType)
virtual int {TakeSpecialDamage}([Actor] inflictor, [Actor] source, int damage, name damageType)
virtual void {Die}([Actor] source, [Actor] inflictor, int dmgFlags = 0, name meansOfDeath = 'none')
virtual bool {Slam}([Actor] victim)
virtual void {Touch}([Actor] toucher)
virtual bool {CanTouchItem}([Inventory] item)
virtual bool {CanCollideWith}([Actor] other, bool passive)
virtual bool {CanResurrect}([Actor] other, bool passive)
virtual bool {SpecialBlastHandling}([Actor] source, double strength)
virtual int {SpecialMissileHit}([Actor] victim)
virtual bool {Used}([Actor] user)
virtual class<[Actor]\> {GetBloodType}(int type)
virtual int {GetGibHealth}()
virtual double {GetDeathHeight}()
virtual string {GetObituary}([Actor] victim, [Actor] inflictor, name mod, bool playerAttack)
virtual int {OnDrain}([Actor] victim, int damage, name dmgType)
virtual bool {OnGiveSecret}(bool printMsg, bool playSound)
virtual bool {PreTeleport}(vector3 destPos, double destAngle, int flags)
virtual bool {PostTeleport}(vector3 destPos, double destAngle, int flags)
virtual bool {OkayToSwitchTarget}([Actor] other)
virtual bool {Grind}(bool items)
virtual int {DamageMobj}([Actor] inflictor, [Actor] source, int damage, name mod, int flags = 0, double angle = 0.0)
virtual clearScope int {GetMaxHealth}(bool withUpgrades = false) const
virtual bool {ShouldSpawn}()

{{#include ../../Labels/Todo.md}}
-#

### Decorate Compatibility

#-
void {A_Light0}()
void {A_Light1}()
void {A_Light2}()
void {A_LightInverse}()
void {A_SetMass}(int newMass)
void {A_SetInvulnerable}()
void {A_UnSetInvulnerable}()
void {A_SetReflective}()
void {A_UnSetReflective}()
void {A_SetReflectiveInvulnerable}()
void {A_UnSetReflectiveInvulnerable}()
void {A_SetShootable}()
void {A_UnSetShootable}()
void {A_NoGravity}()
void {A_Gravity}()
void {A_LowGravity}()
void {A_SetGravity}(double newGravity)
void {A_SetFloorClip}()
void {A_UnSetFloorClip}()
void {A_HideThing}()
void {A_UnHideThing}()
void {A_SetArg}(int arg, int val)
void {A_Turn}(double turn = 0.0)
void {A_SetDamageType}(name newDamageType)
void {A_SetSolid}()
void {A_UnSetSolid}()
void {A_SetFloat}()
void {A_UnSetFloat}()
void {A_SetFloatBobPhase}(int bob)
void {A_SetRipperLevel}(int level)
void {A_SetRipMin}(int minimum)
void {A_SetRipMax}(int maximum)
void {A_ScreamAndUnblock}()
void {A_ActiveAndUnblock}()
void {A_SetScale}(double scaleX, double scaleY = 0, int ptr = [AAPTR_DEFAULT], bool useZero = false)
void {A_SetSpeed}(double speed, int ptr = [AAPTR_DEFAULT])
void {A_SetFloatSpeed}(double speed, int ptr = [AAPTR_DEFAULT])
void {A_SetPainThreshold}(int threshold, int ptr = [AAPTR_DEFAULT])
bool {A_SetSpriteAngle}(double angle = 0, int ptr = [AAPTR_DEFAULT])
bool {A_SetSpriteRotation}(double angle = 0, int ptr = [AAPTR_DEFAULT])
deprecated("2.3") void {A_FaceConsolePlayer}(double maxTurnAngle = 0)
void {A_SetSpecial}(int spec, int arg0 = 0, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0)
void {A_FaceTarget}(double max_Turn = 0.0, double max_Pitch = 270.0, double ang_Offset = 0.0, double pitch_Offset = 0.0, int flags = 0, double z_Ofs = 0.0)
void {A_FaceTracer}(double max_Turn = 0.0, double max_Pitch = 270.0, double ang_Offset = 0.0, double pitch_Offset = 0.0, int flags = 0, double z_Ofs = 0.0)
void {A_FaceMaster}(double max_Turn = 0.0, double max_Pitch = 270.0, double ang_Offset = 0.0, double pitch_Offset = 0.0, int flags = 0, double z_Ofs = 0.0)
void {A_Fall}()
bool {A_CallSpecial}(int special, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0, int arg5 = 0)
void {A_Look}()
void {A_Look2}()
deprecated("2.3") void {A_BulletAttack}()
deprecated("4.3") clearScope void {A_PlaySound}(sound whatToPlay = "weapons/pistol", int slot = [CHAN_BODY], double volume = 1.0, bool looping = false, double attenuation = [ATTN_NORM], bool local = false, double pitch = 0.0)
deprecated("2.3") void {A_PlayWeaponSound}(sound whatToPlay)
deprecated("2.3") void {A_PlaySoundEx}(sound whatToPlay, name slot, bool looping = false, int attenuation = 0)
deprecated("2.3") void {A_StopSoundEx}(name slot)
void {A_Print}(string whatToPrint, double time = 0.0, name fontName = 'none')
void {A_PrintBold}(string whatToPrint, double time = 0.0, name fontName = 'none')
void {A_Log}(string whatToPrint, bool local = false)
void {A_LogInt}(int whatToPrint, bool local = false)
void {A_LogFloat}(double whatToPrint, bool local = false)
void {A_SetTranslucent}(double alpha, int style = 0)
void {A_SpawnDebris}(class<[Actor]\> spawnType, bool transfer_Translation = false, double mult_H = 1.0, double mult_V = 1.0)
void {A_ExtChase}(bool useMelee, bool useMissile, bool playActive = true, bool nightmareFast = false)
deprecated("2.3") void {A_ChangeFlag}(string flagName, bool value)
void {A_RaiseMaster}(int flags = 0)
void {A_RaiseChildren}(int flags = 0)
void {A_RaiseSiblings}(int flags = 0)
void {A_RaiseSelf}(int flags = 0)
void {A_CountdownArg}(int argNum, stateLabel targState = null)
void {A_ClearLastHeard}()
void {A_ClassBossHealth}()
deprecated("2.3") void {A_SetUserVar}(name varName, int value)
deprecated("2.3") void {A_SetUserArray}(name varName, int index, int value)
deprecated("2.3") void {A_SetUserVarFloat}(name varName, double value)
deprecated("2.3") void {A_SetUserArrayFloat}(name varName, int index, double value)
void {A_Quake}(int intensity, int duration, int damageRadius, int tremorRadius, sound sfx = "world/quake")
void {A_DamageSelf}(int amount, name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_DamageTarget}(int amount, name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_DamageMaster}(int amount, name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_DamageTracer}(int amount, name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_KillTarget}(name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_KillMaster}(name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_KillTracer}(name damageType = 'none', int flags = 0, class<[Actor]\> filter = null, name species = 'None', int src = [AAPTR_DEFAULT], int inflict = [AAPTR_DEFAULT])
void {A_RemoveTarget}(int flags = 0, class<[Actor]\> filter = null, name species = 'None')
void {A_RemoveMaster}(int flags = 0, class<[Actor]\> filter = null, name species = 'None')
void {A_RemoveTracer}(int flags = 0, class<[Actor]\> filter = null, name species = 'None')
void {A_SetTeleFog}(class<[Actor]\> oldPos, class<[Actor]\> newPos)
void {A_SwapTeleFog}()
void {A_SetHealth}(int health, int ptr = [AAPTR_DEFAULT])
void {A_ResetHealth}(int ptr = [AAPTR_DEFAULT])
void {A_SetSpecies}(name species, int ptr = [AAPTR_DEFAULT])
void {A_SetChaseThreshold}(int threshold, bool def = false, int ptr = [AAPTR_DEFAULT])
bool {A_CopySpriteFrame}(int from, int to, int flags = 0)
bool {A_SetVisibleRotation}(double angleStart = 0.0, double angleEnd = 0.0, double pitchStart = 0.0, double pitchEnd = 0.0, int flags = 0, int ptr = [AAPTR_DEFAULT])
void {A_SetTranslation}(name transName)
void {A_RearrangePointers}(int newTarget, int newMaster = [AAPTR_DEFAULT], int newTracer = [AAPTR_DEFAULT], int flags = 0)
void {A_TransferPointer}(int ptrSource, int ptrRecipient, int sourceField, int recipientField = [AAPTR_DEFAULT], int flags = 0)
void {A_CopyFriendliness}(int ptr_Source = [AAPTR_MASTER])
void {A_WeaponOffset}(double wx = 0.0, double wy = 32.0, int flags = 0)
double {GetCrouchFactor}(int ptr = [AAPTR_PLAYER1])
double {GetCVar}(string cVar)
double {GetCVarString}(string cVar)
int {GetPlayerInput}(int inputNum, int ptr = [AAPTR_DEFAULT])
int {CountProximity}(class<[Actor]\> className, double distance, int flags = 0, int ptr = [AAPTR_DEFAULT])
int {GetMissileDamage}(int mask, int add, int ptr = [AAPTR_DEFAULT])


{{#include ../../Labels/Legacy.md}} {{#include ../../Labels/Todo.md}}
-#

<!-- api-members -->
### World Attributes

#### Position
#-
readOnly vector3 {Pos}

The current position of the actor. If you want to set this, you can
use [`SetOrigin`].
-#

#-
vector3 {Prev}

The previous position of the actor.
-#

#-
vector3 {SpawnPoint}

The initial position of this actor when it first spawned.
-#

#-
readOnly int {WaterLevel}

The position of an actor relative to water. Possible values are:
* 0: Not in water at all
* 1: Less than half of the actor in water
* 2: Equal to or more than half of the actor in water
* 3: Entirely in water
-#

#### Dimensions
#-
double {Height}

The height of this actor, in map units.
-#

#-
readOnly double {Radius}

The horizontal size of this actor on both axes, in map units.
-#

#-
meta double {DeathHeight}
meta double {BurnHeight}

{{#include ../../Labels/Todo.md}}
-#

#### Movement
#-
vector3 {Vel}

The velocity of the actor in each direction, in map units per tic.
-#

#-
double {Speed}

The speed, in map units, at which this actor travels horizontally each
tic when moving. Potentially affected by inertia.
-#

#-
double {FloatSpeed}

The speed, in map units, at which this actor travels vertically (when
[`bFLOAT`] is applied) each tic when moving. Never affected by
inertia.
-#

#-
meta double {FastSpeed}

The [`Speed`] used with fast mode enabled.
-#

#### Physics
#-
int {Mass}
double {Gravity}
double {Friction}
double {FloorClip}
uint8 {WeaveIndexXy}
uint8 {WeaveIndexZ}
double {BounceFactor}
double {WallBounceFactor}
int {BounceCount}
double {DropOffZ}
double {MaxDropOffHeight}
double {MaxStepHeight}
double {MaxSlopeSteepness}

{{#include ../../Labels/Todo.md}}
-#

#### Angles
#-
double {Angle}

The *yaw* (horizontal) angle, in degrees, of the actor. This angle is
*visual* as well as functional if [`bSPRITEANGLE`] is not set.
-#

#-
double {Pitch}

The *pitch* (vertical) angle, in degrees, of the actor. This angle is
*visual* if the actor is a model and has the proper flag set, and
*functional* only under specific circumstances, such as if this is a
player, or if the actor has explicit handling for pitching.
-#

#-
double {Roll}

The *roll* (rotational) angle, in degrees, of the actor. This angle is
*visual* if the actor is a model and has the proper flag set, or if
[`bROLLSPRITE`] is set, and *functional* only under specific
circumstances, such as if this is a player, or if the actor has
explicit handling for pitching.
-#

#-
uint16 {SpawnAngle}

The initial *yaw* angle, in degrees, of the actor when it first
spawned.
-#

#### Sectors
#-
readOnly [Actor] {SNext}

The next actor in this sector, if any. *This list is deterministic,
but its order is unpredictable. Be careful when using this.*
-#

#-
[Sector] {CurSector}

The sector this actor resides within.
-#

#-
[Sector] {CeilingSector}
[Sector] {FloorSector}

{{#include ../../Labels/Todo.md}}
-#

#-
double {CeilingZ}
double {FloorZ}

The Z position of the ceiling/floor of the sector this actor is in.
-#

#-
textureId {CeilingPic}
textureId {FloorPic}

The texture of the ceiling/floor of the sector this actor is in.
-#

#-
int {FloorTerrain}

{{#include ../../Labels/Todo.md}}
-#

### Internal Attributes

#### States
#-
int {Tics}
readOnly [State] {CurState}
readOnly [State] {SpawnState}
readOnly [State] {SeeState}
[State] {MeleeState}
[State] {MissileState}

{{#include ../../Labels/Todo.md}}
-#

#### Visuals
#-
spriteId {Sprite}

The sprite this actor is using in the world.
-#

#-
uint8 {Frame}

The frame index for the [`Sprite`].
-#

#-
vector2 {SpriteOffset}

The offset (relative to the original offset) to apply to the world
sprite of this actor.
-#

#-
vector2 {Scale}

The visual scale on each axis. Values lower than 1 will be smaller,
higher than 1 bigger, and negatives will flip the sprite.
-#

#-
double {Alpha}

The opacity of the sprite. Values greater than 1 do nothing, values
closer to 0 increase the translucency, and 0 makes the sprite totally
invisible. The player's view sprite will have inverted color if the
[`PlayerPawn`] has an alpha of 0. The functionality of this member
differs between render styles.
-#

#-
readOnly color {FillColor}

The color to fill the sprite with in certain render modes.
-#

#-
textureId {PicNum}

If this is a non-null texture, overrides the sprite entirely, and
draws this texture as the actor's sprite. This works exactly the same
as any other sprite, but notably, supports animated textures.
-#

#-
double {RenderRadius}

{{#include ../../Labels/Todo.md}}
-#

#-
double {SpriteAngle}

The absolute angle for the sprite of this actor. Only does anything
when [`bSPRITEANGLE`] is `true`.
-#

#-
double {SpriteRotation}

An angle to offset the visual rotation of the sprite of this actor.
Works without [`bSPRITEANGLE`], as this is relative.
-#

#-
uint {Translation}
float {VisibleStartAngle}
float {VisibleStartPitch}
float {VisibleEndAngle}
float {VisibleEndPitch}
uint8 {FloatBobPhase}
double {FloatBobStrength}
double {StealthAlpha}
int {RenderHidden}
int {RenderRequired}
readOnly color {BloodColor}
readOnly int {BloodTranslation}
meta name {BloodType}
meta name {BloodType2}
meta name {BloodType3}

{{#include ../../Labels/Todo.md}}
-#

#-
voidPtr {DecalGenerator}

{{#include ../../Labels/Internal.md}} The generator for [decals] used
by this actor. This is currently an un-exposed API and must not be
touched.
-#

#-
uint8 {FountainColor}

{{#include ../../Labels/Todo.md}}
-#

#### Players
#-
[PlayerInfo] {Player}

The player information for this actor, if it is a player actor.
-#

#-
double {CameraHeight}
double {CameraFov}
double {ViewAngle}
double {ViewPitch}
double {ViewRoll}

{{#include ../../Labels/Todo.md}}
-#

#### Inventory
#-
[Inventory] {Inv}

{{#include ../../Labels/Todo.md}}
-#

#### Sounds
#-
sound {AttackSound}
sound {DeathSound}
sound {SeeSound}
sound {PainSound}
sound {ActiveSound}
sound {UseSound}
sound {BounceSound}
sound {WallBounceSound}
sound {CrushPainSound}
meta sound {HowlSound}
meta sound {MeleeSound}

{{#include ../../Labels/Todo.md}}
-#

### Interactions

#### Attacking
#-
int {ReactionTime}
int {Threshold}
int {DefThreshold}
double {MeleeRange}
double {MeleeThreshold}
uint8 {MinMissileChance}
double {MaxTargetRange}
meta double {MissileHeight}
meta name {MissileName}

{{#include ../../Labels/Todo.md}}
-#

#### Damaging
#-
int {Damage}

The amount of damage a projectile might do. Doesn't always apply.
-#

#-
int {RipperLevel}
int {RipLevelMin}
int {RipLevelMax}
name {DamageType}
name {DamageTypeReceived}
int {ProjectileKickBack}
double {ProjectilePassHeight}
int {PoisonDamage}
name {PoisonDamageType}
int {PoisonDuration}
int {PoisonPeriod}
int {PoisonDamageReceived}
name {PoisonDamageTypeReceived}
int {PoisonDurationReceived}
int {PoisonPeriodReceived}
[Actor] {Poisoner}
name {PainType}
name {DeathType}
double {DamageFactor}
double {DamageMultiply}
double {RadiusDamageFactor}
double {SelfDamageFactor}
meta bool {DontHurtShooter}
meta int {ExplosionRadius}
meta int {ExplosionDamage}
meta int {MeleeDamage}

{{#include ../../Labels/Todo.md}}
-#

#### Life and Death
#-
int {Health}

The health of this actor. Anything less than 1 represents something
dead.
-#

#-
int {StartHealth}

The initial health of this actor when it first spawned.
-#

#-
int16 {PainChance}
int {PainThreshold}
meta string {Obituary}
meta string {HitObituary}
meta int {GibHealth}

{{#include ../../Labels/Todo.md}}
-#

#### Actor Pointers
#-
[Actor] {Target}
[Actor] {Master}
[Actor] {Tracer}
[Actor] {LastHeard}
[Actor] {LastEnemy}
[Actor] {LastLookActor}

{{#include ../../Labels/Todo.md}}
-#

#### Identification
#-
int {TId}
int {TIdToHate}
name {Species}
int {DesignatedTeam}
readOnly int {SpawnTime}

{{#include ../../Labels/Todo.md}}
-#

#### Specials
#-
int {Special}
int[5\] {Args}
int {Special1}
int {Special2}
double {SpecialF1}
double {SpecialF2}
int {WeaponSpecial}
int {ActivationType}

{{#include ../../Labels/Todo.md}}
-#

#### Teleportation
#-
class<[Actor]\> {TeleFogSourceType}
class<[Actor]\> {TeleFogDestType}
-#

### Deprecated
#-
deprecated("2.3") readOnly double {X}
deprecated("2.3") readOnly double {Y}
deprecated("2.3") readOnly double {Z}
deprecated("2.3") readOnly double {VelX}
deprecated("2.3") readOnly double {VelY}
deprecated("2.3") readOnly double {VelZ}
deprecated("2.3") readOnly double {MomX}
deprecated("2.3") readOnly double {MomY}
deprecated("2.3") readOnly double {MomZ}
deprecated("2.3") double {ScaleX}
deprecated("2.3") double {ScaleY}

{{#include ../../Labels/Legacy.md}} These members are better
represented by [`Pos`], [`Vel`], and [`Scale`] respectively, and
should not be used in new code.
-#

### To-do
#-
uint {ThruBits}
uint8 {MoveDir}
int8 {VisDir}
int16 {MoveCount}
int16 {StrafeCount}
int {FastChaseStrafeCount}
uint16 {SkillRespawnCount}
int {Score}
int {Accuracy}
int {Stamina}
[Actor] {Alternative}
[Actor] {Goal}
int8 {LastLookPlayerNumber}
uint {SpawnFlags}
double {PushFactor}
int {LastPush}
int {LastBump}
[Actor] {BlockingMobj}
[Line] {BlockingLine}
[Sector] {Blocking3DFloor}
[Sector] {BlockingCeiling}
[Sector] {BlockingFloor}
uint8 {SmokeCounter}
uint8 {FriendPlayer}
int {WoundHealth}
readOnly int {FriendlySeeBlocks}

{{#include ../../Labels/Todo.md}}
-#

<!-- api-constants -->
#-
const int {DEFAULT_HEALTH}

The default [`Health`] value if not set.
-#

#-
const double {ONFLOORZ}

The minimum Z value possible.
-#

#-
const double {ONCEILINGZ}

The maximum Z value possible.
-#

#-
const double {STEEPSLOPE}

A ratio representing an unwalkable slope.
-#

#-
const double {FLOATRANDZ}

A special Z value that tells the engine to start the Z value at a
random value for floating objects.
-#

#-
const int {TELEFRAG_DAMAGE}

The amount of damage a tele-frag does.
-#

#-
const double {MINVEL}

The minimum notable velocity, after which velocity values will be
clamped to 0.
-#

#-
const int {LARGE_MASS}

{{#include ../../Labels/Internal.md}} A constant only used in
[`Lightning`]'s override of [`SpecialMissileHit`]. Ignore this
existing.
-#

#-
const double {ORIG_FRICTION}

The standard friction value.
-#

#-
const double {ORIG_FRICTION_FACTOR}

The standard friction value as a ratio.
-#

#-
const int {DEFMORPHTICS}

The amount of time it takes to un-morph.
-#

<!-- api-properties -->
#-
property {Accuracy}: [Accuracy]
property {Activation}: [ActivationType]
property {ActiveSound}: [ActiveSound]
property {Alpha}: [Alpha]
property {AttackSound}: [AttackSound]
property {BounceCount}: [BounceCount]
property {BounceFactor}: [BounceFactor]
property {BounceSound}: [BounceSound]
property {BurnHeight}: [BurnHeight]
property {CameraFov}: [CameraFov]
property {CameraHeight}: [CameraHeight]
property {CrushPainSound}: [CrushPainSound]
property {DamageMultiply}: [DamageMultiply]
property {DeathHeight}: [DeathHeight]
property {DeathSound}: [DeathSound]
property {DefThreshold}: [DefThreshold]
property {DesignatedTeam}: [DesignatedTeam]
property {DontHurtShooter}: [DontHurtShooter]
property {ExplosionDamage}: [ExplosionDamage]
property {ExplosionRadius}: [ExplosionRadius]
property {FastSpeed}: [FastSpeed]
property {FloatBobPhase}: [FloatBobPhase]
property {FloatBobStrength}: [FloatBobStrength]
property {FloatSpeed}: [FloatSpeed]
property {Friction}: [Friction]
property {FriendlySeeBlocks}: [FriendlySeeBlocks]
property {GibHealth}: [GibHealth]
property {Gravity}: [Gravity]
property {Health}: [Health]
property {Height}: [Height]
property {HitObituary}: [HitObituary]
property {HowlSound}: [HowlSound]
property {Mass}: [Mass]
property {MaxDropOffHeight}: [MaxDropOffHeight]
property {MaxSlopeSteepness}: [MaxSlopeSteepness]
property {MaxStepHeight}: [MaxStepHeight]
property {MaxTargetRange}: [MaxTargetRange]
property {MeleeDamage}: [MeleeDamage]
property {MeleeRange}: [MeleeRange]
property {MeleeSound}: [MeleeSound]
property {MeleeThreshold}: [MeleeThreshold]
property {MinMissileChance}: [MinMissileChance]
property {MissileHeight}: [MissileHeight]
property {MissileType}: [MissileName]
property {Obituary}: [Obituary]
property {PainSound}: [PainSound]
property {PainThreshold}: [PainThreshold]
property {PoisonDamageType}: [PoisonDamageType]
property {ProjectileKickBack}: [ProjectileKickBack]
property {ProjectilePassHeight}: [ProjectilePassHeight]
property {PushFactor}: [PushFactor]
property {RadiusDamageFactor}: [RadiusDamageFactor]
property {Radius}: [Radius]
property {ReactionTime}: [ReactionTime]
property {RenderHidden}: [RenderHidden]
property {RenderRadius}: [RenderRadius]
property {RenderRequired}: [RenderRequired]
property {RipLevelMax}: [RipLevelMax]
property {RipLevelMin}: [RipLevelMin]
property {RipperLevel}: [RipperLevel]
property {SeeSound}: [SeeSound]
property {SelfDamageFactor}: [SelfDamageFactor]
property {Species}: [Species]
property {Speed}: [Speed]
property {SpriteAngle}: [SpriteAngle]
property {SpriteRotation}: [SpriteRotation]
property {Stamina}: [Stamina]
property {StealthAlpha}: [StealthAlpha]
property {StencilColor}: [FillColor]
property {TeleFogDestType}: [TeleFogDestType]
property {TeleFogSourceType}: [TeleFogSourceType]
property {Threshold}: [Threshold]
property {ThruBits}: [ThruBits]
property {VSpeed}: [VelZ]
property {VisibleAngles}: [VisibleStartAngle], [VisibleEndAngle]
property {VisiblePitch}: [VisibleStartPitch], [VisibleEndPitch]
property {WallBounceFactor}: [WallBounceFactor]
property {WallBounceSound}: [WallBounceSound]
property {WeaveIndexXy}: [WeaveIndexXy]
property {WeaveIndexZ}: [WeaveIndexZ]
property {WoundHealth}: [WoundHealth]
property {XScale}: [ScaleX]
property {YScale}: [ScaleY]
-#

#-
property {PainChance}

Defines a pain chance, either:
* `PainChance Number;`

  The global pain chance.
* `PainChance "DamageType", Number;`

  A particular damage type's pain chance.
-#

#-
property {Damage}

The [`Damage`] value. This may be either:
* `Damage Number;`

  A static damage number.
* `Damage (Expression);`

  An expression to apply each time damage is done.
-#

#-
property {Scale}

Sets both [`XScale`] and [`YScale`] to the value provided.
-#

#-
property {Args}

Sets each of the [`Args`] values and sets [`bARGSDEFINED`].
-#

#-
property {BloodColor}

Sets both [`BloodColor`] and [`BloodTranslation`].
-#

#-
property {BloodType}

Sets each of the blood types. Besides the first [`BloodType`], the
other two are optional. If [`BloodType2`] is omitted, it's set to
[`BloodType`], and if [`BloodType3`] is omitted, it's set to
[`BloodType2`].
-#

#-
property {DamageType}
property {PainType}
property {DeathType}

Sets [`DamageType`], [`PainType`], and [`DeathType`] respectively. If
`"Normal"` is passed, in which case it's changed to `"None"`.
-#

#-
property {DamageFactor}

Defines a damage factor, either:
* `DamageFactor Number;`

  The global damage factor.
* `DamageFactor "DamageType", Number;`

  A particular damage type's damage factor. If the damage type is
  `"Normal"`, it's changed to `"None"`.
-#

#-
property {Decal}

Sets the [`DecalGenerator`] for this actor, based on its name in the
decal definitions table.
-#

#-
property {PoisonDamage}

Sets the poison damage parameters. Either:
* `PoisonDamage Number;`

  Sets [`PoisonDamage`] to the number provided and [`PoisonDuration`]
  to `int.Min`.
* `PoisonDamage Number, Number;`

  Sets [`PoisonDamage`] and [`PoisonDuration`] to the numbers
  provided, and sets [`PoisonPeriod`] to 0.
* `PoisonDamage Number, Number, Number;`

  Sets [`PoisonDamage`], [`PoisonDuration`], and [`PoisonPeriod`] to
  the numbers provided.
-#

#-
property {VisibleToTeam}

Sets [`VisibleToTeam`] to the number passed plus one.
-#

#### Internal Static Info

These properties set up information not normally visible to scripts.

#-
property {DropItem}

Adds a dropped item (see [`GetDropItems`]) to the actor, either:

* `DropItem "ItemType";`

  A dropped item with 255 (100%) probability, and an amount of -1.
* `DropItem "ItemType", Number;`

  Sets the probability manually, but keeps the amount at -1.
* `DropItem "ItemType", Number, Number;`

  Explicitly sets both the probability and amount.
-#

#-
property {DefaultStateUsage}

{{#include ../../Labels/Internal.md}} The [default state usage] of the
actor. Not to be used by user code.
-#

#-
property {Tag}

The *tag name* of the actor. This can potentially be a [translatable
string].
-#

#-
property {Translation}

The translation to apply to this actor, either:
* `Translation Number;`

  One of the hard-coded translations, between 0 and 6, inclusive.
* `Translation "TranslationString";`, `Translation
  "TranslationString", "TranslationString";`, etc.

  One or more [translation string]s to apply.
-#

#-
property {RenderStyle}

Sets the [legacy render style]. Possible values are:
* `"Add"`
* `"AddShaded"`
* `"AddStencil"`
* `"ColorAdd"`
* `"ColorBlend"`
* `"Fuzzy"`
* `"Multiply"`
* `"None"`
* `"Normal"`
* `"OptFuzzy"`
* `"Shaded"`
* `"Shadow"`
* `"SoulTrans"`
* `"Stencil"`
* `"Subtract"`
* `"Translucent"`

{{#include ../../Labels/Legacy.md}} The string may also be prefixed
with `Style_` for compatibility with old DECORATE.
-#

#-
property {BounceType}

Sets the bouncing behaviour of the actor. Possible values are:
* `"Classic"`
* `"Doom"`
* `"DoomCompat"`
* `"Grenade"`
* `"Heretic"`
* `"HereticCompat"`
* `"Hexen"`
* `"HexenCompat"`
* `"None"`
-#

#-
property {VisibleToPlayerClass}

Adds one or more player classes to the list of classes this is visible
to.
-#

#-
property {DistanceCheck}

Sets up a distance checking function that will make this actor not
render if the player's view is far enough away from it. You must pass
the name of an integer CVar to this property.
-#

#-
property {Game}

A filter for which game this can appear in. Possible values are:
* `"Any"`
* `"Chex"`
* `"Doom"`
* `"Heretic"`
* `"Hexen"`
* `"Raven"`
* `"Strife"`
-#

#-
property {SpawnId}

Sets the Spawn ID used by several systems to the number passed to this
property.
-#

#-
property {ConversationId}

Sets the Conversation ID used by the conversation system to the number
passed to this property. Two extra numbers may be specified that will
do absolutely nothing.
-#

#### Pseudo-properties

These properties don't take parameters and mutate the defaults.

#-
property {Skip_Super}

If this property is present on an actor, it will reset all `default`
values with the ones from this class. *This only works on sub-classes
with no additional members.*
-#

#-
property {ClearFlags}

If this property is present on an actor, it will clear all native
flags from the actor, except for [`bARGSDEFINED`]. *This does not
clear flags created by user code.*
-#

#-
property {Monster}

If this property is present on an actor, it sets the following flags:

* [`bACTIVATEMCROSS`]
* [`bCANPASS`]
* [`bCANPUSHWALLS`]
* [`bCANUSEWALLS`]
* [`bCOUNTKILL`]
* [`bISMONSTER`]
* [`bSHOOTABLE`]
* [`bSOLID`]
-#

#-
property {Projectile}

If this property is present on an actor, it sets the following flags:

* [`bACTIVATEIMPACT`]
* [`bACTIVATEPCROSS`]
* [`bDROPOFF`]
* [`bMISSILE`]
* [`bNOBLOCKMAP`]
* [`bNOGRAVITY`]
* [`bNOTELEPORT`]

If the game is Heretic or Hexen, then [`bBLOODSPLATTER`] is also set.
-#

#-
property {DefaultAlpha}

If this property is present on an actor, it will set the default
[`Alpha`] to [`HR_SHADOW`] or [`HX_SHADOW`], depending on if the game
is Heretic or not.
-#

#### Defaults

```zsc
default
{
	Alpha 1;
	BloodType "Blood", "BloodSplatter", "AxeBlood";
	BounceCount -1;
	BounceFactor 0.7;
	BurnHeight -1;
	CameraFov 90;
	CameraHeight int.Min;
	DamageFactor 1;
	DamageMultiply 1;
	DeathHeight -1;
	DeathType "Normal";
	DefThreshold 100;
	DefaultStateUsage SUF_ACTOR | SUF_OVERLAY;
	DesignatedTeam 255;
	ExplosionDamage 128;
	ExplosionRadius -1;
	FastSpeed -1;
	FloatBobPhase -1;
	FloatBobStrength 1;
	FloatSpeed 4;
	Friction 1;
	FriendlySeeBlocks 10;
	GibHealth int.Min;
	Gravity 1;
	Health DEFAULT_HEALTH;
	Height 16;
	HitObituary "";
	Mass 100;
	MaxDropOffHeight 24;
	MaxSlopeSteepness STEEPSLOPE;
	MaxStepHeight 24;
	MeleeDamage 0;
	MeleeRange 44;
	MeleeSound "";
	MinMissileChance 200;
	MissileHeight 32;
	Obituary "";
	PainType "Normal";
	PushFactor 0.25;
	Radius 20;
	RadiusDamageFactor 1;
	ReactionTime 8;
	RenderHidden 0;
	RenderRadius 0;
	RenderRequired 0;
	RenderStyle 'Normal';
	RipLevelMax 0;
	RipLevelMin 0;
	RipperLevel 0;
	Scale 1;
	SelfDamageFactor 1;
	SpriteAngle 0;
	SpriteRotation 0;
	StealthAlpha 0;
	StencilColor "Black";
	TleeFogDestType "TeleportFog";
	TleeFogSourceType "TeleportFog";
	VisibleAngles 0, 0;
	VisiblePitch 0, 0;
	WallBounceFactor 0.75;
	WeaveIndexXy 0;
	WeaveIndexZ 16;
	WoundHealth 6;
}
```

<!-- api-flags -->
[`Actor`] is the only class with native flag definitions, and they are
handled in one of three ways, which will be defined through
pseudo-code:
* `native` flag definitions are exposed as variables and in `default`
  blocks.
* `native internal` flag definitions are exposed as variables, but not
  in `default` blocks.
* `native deprecated` flag definitions are exposed in `default`
  blocks, but not as variables.

#-
flagDef {ARGSDEFINED}: native internal
flagDef {ARMED}: native internal
flagDef {AVOIDINGDROPOFF}: native internal
flagDef {BOSSCUBE}: native internal
flagDef {BOSSSPAWNED}: native internal
flagDef {CHASEGOAL}: native internal
flagDef {CRASHED}: native internal
flagDef {FALLING}: native internal
flagDef {FLYCHEAT}: native internal
flagDef {FLY}: native internal
flagDef {HANDLENODELAY}: native internal
flagDef {HUNTPLAYERS}: native internal
flagDef {INCHASE}: native internal
flagDef {INCONVERSATION}: native internal
flagDef {INTRYMOVE}: native internal
flagDef {KILLED}: native internal
flagDef {LINEDONE}: native internal
flagDef {NOHATEPLAYERS}: native internal
flagDef {NOSIGHTCHECK}: native internal
flagDef {ONMOBJ}: native internal
flagDef {RESPAWNINVUL}: native internal
flagDef {SCROLLMOVE}: native internal
flagDef {SHATTERING}: native internal
flagDef {UNMORPHED}: native internal
flagDef {VFRICTION}: native internal
flagDef {WARNBOT}: native internal
flagDef {ABSMASKANGLE}: native
flagDef {ABSMASKPITCH}: native
flagDef {ABSVIEWANGLES}: native
flagDef {ACTIVATEIMPACT}: native
flagDef {ACTIVATEMCROSS}: native
flagDef {ACTIVATEPCROSS}: native
flagDef {ACTLIKEBRIDGE}: native
flagDef {ADDITIVEPOISONDAMAGE}: native
flagDef {ADDITIVEPOISONDURATION}: native
flagDef {AIMREFLECT}: native
flagDef {ALLOWBOUNCEONACTORS}: native
flagDef {ALLOWPAIN}: native
flagDef {ALLOWPARTICLES}: native
flagDef {ALLOWTHRUBITS}: native
flagDef {ALLOWTHRUFLAGS}: native
flagDef {ALWAYSFAST}: native
flagDef {ALWAYSPUFF}: native
flagDef {ALWAYSRESPAWN}: native
flagDef {ALWAYSTELEFRAG}: native
flagDef {AMBUSH}: native
flagDef {AVOIDMELEE}: native
flagDef {BLASTED}: native
flagDef {BLOCKASPLAYER}: native
flagDef {BLOCKEDBYSOLIDACTORS}: native
flagDef {BLOODLESSIMPACT}: native
flagDef {BLOODSPLATTER}: native
flagDef {BOSSDEATH}: native
flagDef {BOSS}: native
flagDef {BOUNCEAUTOOFFFLOORONLY}: native
flagDef {BOUNCEAUTOOFF}: native
flagDef {BOUNCELIKEHERETIC}: native
flagDef {BOUNCEONACTORS}: native
flagDef {BOUNCEONCEILINGS}: native
flagDef {BOUNCEONFLOORS}: native
flagDef {BOUNCEONUNRIPPABLES}: native
flagDef {BOUNCEONWALLS}: native
flagDef {BRIGHT}: native
flagDef {BUDDHA}: native
flagDef {BUMPSPECIAL}: native
flagDef {CANBLAST}: native
flagDef {CANBOUNCEWATER}: native
flagDef {CANJUMP}: native
flagDef {CANNOTPUSH}: native
flagDef {CANPASS}: native
flagDef {CANPUSHWALLS}: native
flagDef {CANTLEAVEFLOORPIC}: native
flagDef {CANTSEEK}: native
flagDef {CANUSEWALLS}: native
flagDef {CAUSEPAIN}: native
flagDef {CEILINGHUGGER}: native
flagDef {CORPSE}: native
flagDef {COUNTITEM}: native
flagDef {COUNTKILL}: native
flagDef {COUNTSECRET}: native
flagDef {DEFLECT}: native
flagDef {DEHEXPLOSION}: native
flagDef {DOHARMSPECIES}: native
flagDef {DONTBLAST}: native
flagDef {DONTBOUNCEONSHOOTABLES}: native
flagDef {DONTBOUNCEONSKY}: native
flagDef {DONTCORPSE}: native
flagDef {DONTDRAIN}: native
flagDef {DONTFACETALKER}: native
flagDef {DONTFALL}: native
flagDef {DONTFLIP}: native
flagDef {DONTGIB}: native
flagDef {DONTHARMCLASS}: native
flagDef {DONTHARMSPECIES}: native
flagDef {DONTINTERPOLATE}: native
flagDef {DONTMORPH}: native
flagDef {DONTOVERLAP}: native
flagDef {DONTREFLECT}: native
flagDef {DONTRIP}: native
flagDef {DONTSEEKINVISIBLE}: native
flagDef {DONTSPLASH}: native
flagDef {DONTSQUASH}: native
flagDef {DONTTHRUST}: native
flagDef {DONTTRANSLATE}: native
flagDef {DORMANT}: native
flagDef {DROPOFF}: native
flagDef {DROPPED}: native
flagDef {EXPLOCOUNT}: native
flagDef {EXPLODEONWATER}: native
flagDef {EXTREMEDEATH}: native
flagDef {FALLDAMAGE}: native
flagDef {FIXMAPTHINGPOS}: native
flagDef {FLATSPRITE}: native
flagDef {FLOATBOB}: native
flagDef {FLOAT}: native
flagDef {FLOORCLIP}: native
flagDef {FLOORHUGGER}: native
flagDef {FOILBUDDHA}: native
flagDef {FOILINVUL}: native
flagDef {FORCEDECAL}: native
flagDef {FORCEINFIGHTING}: native
flagDef {FORCEPAIN}: native
flagDef {FORCERADIUSDMG}: native
flagDef {FORCEXYBILLBOARD}: native
flagDef {FORCEYBILLBOARD}: native
flagDef {FORCEZERORADIUSDMG}: native
flagDef {FRIENDLY}: native
flagDef {FRIGHTENED}: native
flagDef {FRIGHTENING}: native
flagDef {FULLVOLACTIVE}: native
flagDef {FULLVOLDEATH}: native
flagDef {GETOWNER}: native
flagDef {GHOST}: native
flagDef {GRENADETRAIL}: native
flagDef {HARMFRIENDS}: native
flagDef {HITMASTER}: native
flagDef {HITOWNER}: native
flagDef {HITTARGET}: native
flagDef {HITTRACER}: native
flagDef {ICECORPSE}: native
flagDef {ICESHATTER}: native
flagDef {INCOMBAT}: native
flagDef {INFLOAT}: native
flagDef {INTERPOLATEANGLES}: native
flagDef {INVISIBLE}: native
flagDef {INVULNERABLE}: native
flagDef {ISMONSTER}: native
flagDef {JUMPDOWN}: native
flagDef {JUSTATTACKED}: native
flagDef {JUSTHIT}: native
flagDef {LAXTELEFRAGDMG}: native
flagDef {LOOKALLAROUND}: native
flagDef {MASKROTATION}: native
flagDef {MBFBOUNCER}: native
flagDef {MIRRORREFLECT}: native
flagDef {MISSILEEVENMORE}: native
flagDef {MISSILEMORE}: native
flagDef {MISSILE}: native
flagDef {MOVEWITHSECTOR}: native
flagDef {MTHRUSPECIES}: native
flagDef {NEVERFAST}: native
flagDef {NEVERRESPAWN}: native
flagDef {NEVERTARGET}: native
flagDef {NOBLOCKMAP}: native
flagDef {NOBLOCKMONST}: native
flagDef {NOBLOODDECALS}: native
flagDef {NOBLOOD}: native
flagDef {NOBOSSRIP}: native
flagDef {NOBOUNCESOUND}: native
flagDef {NOCLIP}: native
flagDef {NODAMAGETHRUST}: native
flagDef {NODAMAGE}: native
flagDef {NODECAL}: native
flagDef {NODROPOFF}: native
flagDef {NOEXPLODEFLOOR}: native
flagDef {NOEXTREMEDEATH}: native
flagDef {NOFEAR}: native
flagDef {NOFORWARDFALL}: native
flagDef {NOFRICTIONBOUNCE}: native
flagDef {NOFRICTION}: native
flagDef {NOGRAVITY}: native
flagDef {NOICEDEATH}: native
flagDef {NOINFIGHTING}: native
flagDef {NOINFIGHTSPECIES}: native
flagDef {NOINTERACTION}: native
flagDef {NOKILLSCRIPTS}: native
flagDef {NOLIFTDROP}: native
flagDef {NOMENU}: native
flagDef {NONSHOOTABLE}: native
flagDef {NOPAIN}: native
flagDef {NORADIUSDMG}: native
flagDef {NOSECTOR}: native
flagDef {NOSHIELDREFLECT}: native
flagDef {NOSKIN}: native
flagDef {NOSPLASHALERT}: native
flagDef {NOTARGETSWITCH}: native
flagDef {NOTARGET}: native
flagDef {NOTAUTOAIMED}: native
flagDef {NOTDMATCH}: native
flagDef {NOTELEFRAG}: native
flagDef {NOTELEOTHER}: native
flagDef {NOTELEPORT}: native
flagDef {NOTELESTOMP}: native
flagDef {NOTIMEFREEZE}: native
flagDef {NOTONAUTOMAP}: native
flagDef {NOTRIGGER}: native
flagDef {NOVERTICALMELEERANGE}: native
flagDef {NOWALLBOUNCESND}: native
flagDef {OLDRADIUSDMG}: native
flagDef {PAINLESS}: native
flagDef {PICKUP}: native
flagDef {PIERCEARMOR}: native
flagDef {POISONALWAYS}: native
flagDef {PUFFGETSOWNER}: native
flagDef {PUFFONACTORS}: native
flagDef {PUSHABLE}: native
flagDef {QUICKTORETALIATE}: native
flagDef {RANDOMIZE}: native
flagDef {REFLECTIVE}: native
flagDef {RELATIVETOFLOOR}: native
flagDef {RETARGETAFTERSLAM}: native
flagDef {RIPPER}: native
flagDef {ROCKETTRAIL}: native
flagDef {ROLLCENTER}: native
flagDef {ROLLSPRITE}: native
flagDef {SCREENSEEKER}: native
flagDef {SEEINVISIBLE}: native
flagDef {SEEKERMISSILE}: native
flagDef {SEESDAGGERS}: native
flagDef {SHADOW}: native
flagDef {SHIELDREFLECT}: native
flagDef {SHOOTABLE}: native
flagDef {SKULLFLY}: native
flagDef {SKYEXPLODE}: native
flagDef {SLIDESONWALLS}: native
flagDef {SMASHABLE}: native
flagDef {SOLID}: native
flagDef {SPAWNCEILING}: native
flagDef {SPAWNFLOAT}: native
flagDef {SPAWNSOUNDSOURCE}: native
flagDef {SPECIALFIREDAMAGE}: native
flagDef {SPECIALFLOORCLIP}: native
flagDef {SPECIAL}: native
flagDef {SPECTRAL}: native
flagDef {SPRITEANGLE}: native
flagDef {SPRITEFLIP}: native
flagDef {STANDSTILL}: native
flagDef {STAYMORPHED}: native
flagDef {STEALTH}: native
flagDef {STEPMISSILE}: native
flagDef {STOPRAILS}: native
flagDef {STRIFEDAMAGE}: native
flagDef {SUMMONEDMONSTER}: native
flagDef {SYNCHRONIZED}: native
flagDef {TELEPORT}: native
flagDef {TELESTOMP}: native
flagDef {THRUACTORS}: native
flagDef {THRUGHOST}: native
flagDef {THRUREFLECT}: native
flagDef {THRUSPECIES}: native
flagDef {TOUCHY}: native
flagDef {USEBOUNCESTATE}: native
flagDef {USEKILLSCRIPTS}: native
flagDef {USESPECIAL}: native
flagDef {VISIBILITYPULSE}: native
flagDef {VULNERABLE}: native
flagDef {WALLSPRITE}: native
flagDef {WEAPONSPAWN}: native
flagDef {WINDTHRUST}: native
flagDef {XFLIP}: native
flagDef {YFLIP}: native
flagDef {ZDOOMTRANS}: native
flagDef {ALLOWCLIENTSPAWN}: native deprecated
flagDef {BASEARMOR}: native deprecated
flagDef {BASEHEALTH}: native deprecated
flagDef {BLUETEAM}: native deprecated
flagDef {CLIENTSIDEONLY}: native deprecated
flagDef {DONTHURTSPECIES}: native deprecated
flagDef {DONTIDENTIFYTARGET}: native deprecated
flagDef {DOOMBOUNCE}: native deprecated
flagDef {EXPLODEONDEATH}: native deprecated
flagDef {FASTER}: native deprecated
flagDef {FASTMELEE}: native deprecated
flagDef {FIREDAMAGE}: native deprecated
flagDef {FIRERESIST}: native deprecated
flagDef {HERETICBOUNCE}: native deprecated
flagDef {HEXENBOUNCE}: native deprecated
flagDef {ICEDAMAGE}: native deprecated
flagDef {LONGMELEERANGE}: native deprecated
flagDef {LOWGRAVITY}: native deprecated
flagDef {NODE}: native deprecated
flagDef {NONETID}: native deprecated
flagDef {QUARTERGRAVITY}: native deprecated
flagDef {REDTEAM}: native deprecated
flagDef {SCOREPILLAR}: native deprecated
flagDef {SERVERSIDEONLY}: native deprecated
flagDef {SHORTMISSILERANGE}: native deprecated
flagDef {SUPERARMOR}: native deprecated
flagDef {SUPERHEALTH}: native deprecated
flagDef {USESPECIAL}: native deprecated
flagDef {USESTBOUNCESOUND}: native deprecated

{{#include ../../Labels/Todo.md}}
-#

<!-- api-states -->
These states are available on every actor.

#{
states(Actor, Overlay, Weapon, Item)

#-
Spawn:
	TNT1 A -1;
	stop;

The default spawn state. Simply exists as an invisible object forever.
-#

#-
Null:
	TNT1 A 1;
	stop;

A state that will destroy this actor after one tick.
-#

#-
GenericFreezeDeath:
	#### # 5 A_GenericFreezeDeath;
	---- A 1 A_FreezeDeathChunks;
	wait;

A generic freeze death used by Hexen.
-#

#-
GenericCrush:
	POL5 A -1;
	stop;

A generic state for when a body is crushed.
-#
}#
