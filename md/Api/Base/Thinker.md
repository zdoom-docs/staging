# Thinker

[TICRATE]: Object.md#memb-TICRATE

[EStatNums]: Thinker/EStatNums.md
[LevelLocals]: ../Level/LevelLocals.md
[Object]: Object.md

<!-- api-declaration -->
class Thinker : Object play;

<!-- api-definition -->
A class representing any object in the game that runs logic every game
tic, i.e., "thinks." Most classes derive from Thinker, directly or
indirectly. The order of which thinkers run is defined by [stat
numbers][EStatNums].

<!-- api-sub-types -->
* [EStatNums]

<!-- api-class-methods -->
#-
static clearScope int {Tics2Seconds}(int tics)

Roughly converts a number of tics to an integral amount of seconds.
Equivalent to dividing `tics` by [Object].[TICRATE].
-#

<!-- api-instance-methods -->
#-
void {ChangeStatNum}(Thinker.[EStatNums] stat)

Changes the [statnum][EStatNums] of this thinker.
-#

#-
virtual void {PostBeginPlay}()

Called at the very end of this Thinker's initialization.
-#

#-
virtual void {Tick}()

Called every game tic. The order between this thinker's [Tick] and
every other thinker in the same statnum *is unspecified*. It is not
nondeterministic.
-#

<!-- api-members -->
#-
[LevelLocals] {Level}

The local variables for the level this thinker is in.
-#
