# Object

[byte angles]: ../../Concepts/Angles.md#byte-angles
[caching]: ../../Concepts/Caching.md
[format strings]: ../../Concepts/FormatStrings.md
[music ordering]: ../../Data/Music.md#ordering
[sounds]: ../../Data/Sounds.md

[Actor]: Actor.md
[EFSkillProperty]: EFSkillProperty.md
[ESkillProperty]: ESkillProperty.md
[ESoundFlags]: ESoundFlags.md
[LevelLocals]: LevelLocals.md
[PickDeathmatchStart]: LevelLocals.md#mthd-pickdeathmatchstart
[PickPlayerStart]: LevelLocals.md#mthd-pickplayerstart
[Thinker]: Thinker.md

<!-- api-declaration -->
class Object clearscope;

<!-- api-definition -->
The base class of all classes except itself.

<!-- api-class-methods -->
### Skills

#-
static string {G_SkillName}()

The name of the skill currently being played on.
-#

#-
static int {G_SkillPropertyInt}([ESkillProperty] p)

Returns a [skill property][ESkillProperty] as an integer.
-#

#-
static double {G_SkillPropertyFloat}([EFSkillProperty] p)

Returns a [skill property][ESkillProperty] as a float.
-#

### Sounds

#-
static void {MarkSound}(sound soundId)

Marks `soundId` to be [pre-cached][caching].
-#

#-
static void {S_StartSound}(sound soundId, [ESoundFlags] channel, [ESoundFlags] flags = 0, float volume = 1.0, float attenuation = ATTN_NORM, float pitch = 0.0, float startTime = 0.0)

Plays a [sound][sounds] with no source.
-#

#-
static void {S_PauseSound}(bool notMusic, bool notSfx)

Pauses music if `notMusic` is `false` and all game sounds if `notSfx`
is `false`. Used for instance in the time stop power-up.
-#

#-
static void {S_ResumeSound}(bool notSfx)

Resumes playing music and, if `notSfx` is `false`, all game sounds as
well.
-#

#-
static float {S_GetLength}(sound soundId)

{{#include ../../Labels/Nondeterministic.md}} Returns the length of a
sound in seconds. Potentially nondeterministic if all users in a
networked game are not using the same sounds.
-#

### Music

#-
static bool {S_ChangeMusic}(string musicName, int order = 0, bool looping = true, bool force = false)

Changes the music to `name`. If `name` is `"*"`, the music will be set
to the default music for this level. Will loop if `looping` is `true`.
`force` will force the music to play even if a playlist (from the
`playlist` console command) is playing. `order` determines the [music
ordering].
-#

#-
void {SetMusicVolume}(float volume)

Sets the volume of the music relative to the user's volume. Range is
0-1, inclusive.
-#

### Misc

#-
static uint {Bam}(double angle)

Returns a [byte angle][byte angles] of `angle`, equivalent to `angle *
(0x40000000 / 90.0)`.
-#

#-
static uint {MsTime}()

{{#include ../../Labels/Nondeterministic.md}} Returns the number of
milliseconds since the engine was started.
-#

#-
vararg static void {ThrowAbortException}(string fmt, ...)

Kills the VM and ends the game (without exiting) with a
[formatted][format strings] error.
-#

### Deprecated

{{#include ../../Labels/Legacy.md}}

#-
deprecated(\"3.8\") static vector3, int {G_PickDeathmatchStart}()

Use [LevelLocals].[PickDeathmatchStart] instead.
-#

#-
deprecated(\"3.8\") static vector3, int {G_PickPlayerStart}(int pNum, int flags = 0)

Use [LevelLocals].[PickPlayerStart] instead.
-#

#-
deprecated(\"4.3\") static void {S_Sound}(sound soundId, [ESoundFlags] channel, float volume = 1.0, float attenuation = ATTN_NORM, float pitch = 0.0)

Use [S_StartSound] instead.
-#

<!-- api-instance-methods -->
#-
class {GetClass}()

Returns the class type of this object.
-#

#-
string {GetClassName}()

Returns a string representation of the class type of this object.
-#

#-
class {GetParentClass}()

Returns the class type of this object's parent class.
-#

#-
virtualscope void {Destroy}()

Marks this object to be garbage collected. Do not use the object after
calling this. References to it will be invalidated.
-#

#-
virtual virtualscope void {OnDestroy}()

{{#include ../../Labels/Nondeterministic.md}} Called just before the
object is collected by the garbage collector. Nondeterministic unless
the object is linked into the thinker list, in which case it is
destroyed earlier in a deterministic setting. Not all [Thinker]s are
linked into this list, so be careful when overriding this. Any [Actor]
will generally be safe.
-#

<!-- api-constants -->
#-
const int {TICRATE}

The number of game tics in a second. Its value is always `35`.
-#

<!-- api-members -->
#-
bool {bDestroyed}

This object wants to be destroyed but has not yet been garbage collected.
-#
