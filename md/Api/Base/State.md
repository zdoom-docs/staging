# State

[dehacked]: ../../Data/DeHackEd.md

[A_VileChase]: Actor.md#mthd-A_VileChase

[Actor]: Actor.md
[DefaultStateUsage]: DefaultStateUsage.md

<!-- api-declaration -->
struct State clearscope;

<!-- api-definition -->
Represents a state on an [Actor]. Data in State is read-only and is
copied as needed to its respective locations for modification, as it
is merely a view into the global constant state table.

<!-- api-instance-methods -->
#-
int {DistanceTo}(State other)

Returns the offset between this state and `other` in the global frame
table. Only works if both states are owned by the same actor.
-#

#-
bool {InStateSequence}(State base)

Returns `true` if this state is within a contiguous state sequence
beginning with `base`.
-#

#-
bool {ValidateSpriteFrame}()

Returns `true` if the sprite frame actually exists.
-#

#-
textureId, bool, vector2 {GetSpriteTexture}(int rotation, int skin = 0, vector2 scale = (0, 0))

Returns the texture, if the texture should be flipped horizontally,
and scaling of this state's sprite. Scaling will return `scale` unless
`skin` is nonzero. `skin` determines the player skin used.
-#
<!-- api-members -->
### Visuals
#-
readOnly uint8 {Frame}

The sprite frame of this state. The "A" frame is represented by "0,"
the "B" frame by "1," etc.
-#

#-
readOnly int {Sprite}

The sprite ID of this state.
-#

### Timings
#-
readOnly int16 {Tics}

The number of game tics this state lasts.
-#

#-
readOnly uint16 {TicRange}

The maximum amount of tics to add for random tic durations, or `0` if
the duration is not random. For example, `TNT1 A random(5, 7)` would
have a [Tics] value of `5` and a [TicRange] of `2`.
-#

### Data
#-
readOnly State {NextState}

A pointer to the next state in the global state table. **The next
state may not be in the same actor!** Be careful when using this.
-#

#-
readOnly int {Misc1}
readOnly int {Misc2}

{{#include ../../Labels/Legacy.md}} Primarily used in [DeHackEd]
compatibility.
-#

#-
readOnly [DefaultStateUsage] {UseFlags}

The action scope of this state.
-#

### Flags
#-
readOnly bool {bCanRaise}

State has the `canraise` option, allowing [Actor].[A_VileChase] to
target this actor for healing without entering an infinitely long
state.
-#

#-
readOnly bool {bDeHackEd}

State has been modified by [DeHackEd][dehacked].
-#

#-
readOnly bool {bFast}

State has the `fast` option, halving the duration when fast monsters
is enabled.
-#

#-
readOnly bool {bFullBright}

State has the `bright` option, making it fully bright regardless of
lighting conditions.
-#

#-
readOnly bool {bNoDelay}

State has the `nodelay` option, forcing the associated action function
to be run if the actor is in its first tic.
-#

#-
readOnly bool {bSameFrame}

State's frame is to be kept from the last frame used, i.e, is `#`.
-#

#-
readOnly bool {bSlow}

State has the `slow` option, doubling the duration when slow monsters
is enabled.
-#
