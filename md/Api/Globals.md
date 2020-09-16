# Globals

[dehacked]: ../Data/DeHackEd.md
[language]: ../Data/Language.md
[mapinfo gameinfo]: ../Data/MapInfo.md#gameinfo

[NumericType]: ../ZScript/Types.md#numeric-types

[BeginPlay]: Base/Actor.md#mthd-BeginPlay

[Actor]: Base/Actor.md
[DeHInfo]: Base/DeHInfo.md
[EGameAction]: Base/EGameAction.md
[EGameState]: Base/EGameState.md
[EMenuState]: Menus/Menu/EMenuState.md
[Font]: Drawing/Font.md
[GameInfoStruct]: Base/GameInfoStruct.md
[KeyBindings]: Base/KeyBindings.md
[Menu]: Menus/Menu.md
[Object]: Base/Object.md
[PlayerClass]: Players/PlayerClass.md
[PlayerInfo]: Players/PlayerInfo.md
[PlayerSkin]: Players/PlayerSkin.md
[Team]: Players/Team.md

<!-- api-definition -->
These functions and variables are accessible from any context.

<!-- api-instance-methods -->
### Class Handling

#-
[Object] {New}(class typeName = ThisClass)

Typically spelled lowercase as a keyword (`new`.) Creates an object
with the specified type. Defaults to using the class of the calling
object.
-#

#-
[Actor] {GetDefaultByType}(class\<[Actor]> typeName)

{{#include ../Labels/Unserializable.md}} Returns an object containing
the default values for each member of the [Actor] type provided as
they would be set in [Actor].[BeginPlay]. The returned object is a
pseudo-object which is stored only in-memory.
-#

### Math

#-
[NumericType] {Abs}([NumericType] n)

Returns `|n|` (absolute of `n`.)
-#

#-
double {ACos}(double n)

Returns the arc-cosine of `n`.
-#

#-
double {ASin}(double n)

Returns the arc-sine of `n`.
-#

#-
double {ATan}(double n)

Returns the arc-tangent of `n`.
-#

#-
double {ATan2}(double y, double x)

Returns the arc-tangent of `y / x` using the arguments' signs to
determine the correct quadrant.
-#

#-
double {Ceil}(double n)

Returns the integral portion of `n`, rounded up.
-#

#-
[NumericType] {Clamp}([NumericType] n, [NumericType] minimum, [NumericType] maximum)

Returns `n` if `n` is more than `minimum` and less than `maximum`, or
either of those values if it is not.
-#

#-
double {Cos}(double n)

Returns the cosine of `n`.
-#

#-
double {CosH}(double n)

Returns the hyperbolic cosine of `n`.
-#

#-
double {Exp}(double n)

Returns the natural exponent of `n`. Note that there is a `**` binary
operator for exponentation, which is generally more useful.
-#

#-
double {Floor}(double n)

Returns the integral portion of `n`, rounded down.
-#

#-
double {Log}(double n)

Returns the natural logarithm of `n`.
-#

#-
double {Log10}(double n)

Returns the common (base 10) logarithm of `n`. This is most useful for
calculating the number of decimal digits in a number.
-#

#-
[NumericType] {Max}([NumericType] n, [NumericType] maximum)

Returns `n` if `n` is less than `maximum`, or `maximum` if it is not.
-#

#-
[NumericType] {Min}([NumericType] n, [NumericType] minimum)

Returns `n` if `n` is more than `minimum`, or `minimum` if it is not.
-#

#-
double {Sin}(double n)

Returns the sine of `n`.
-#

#-
double {SqRt}(double n)

Returns the square root of `n`.
-#

#-
double {Tan}(double n)

Returns the tangent of `n`.
-#

#-
double {TanH}(double n)

Returns the hyperbolic tangent of `n`.
-#

#-
double {VectorAngle}(double x, double y)

Equivalent to `ATan2(y, x)`.
-#

### Random Number Generation

All of these functions may have `[Identifier]` between the function
name and argument list to specify a named RNG table to use. This
special syntax applies only to these functions. An example would be:

```csharp
int myRandomNumber = Random[MyCoolRng](50, 100);
```

#-
double {FRandom}(double min, double max)

Returns a random `double` between `min` and `max`.
-#

#-
double {FRandomPick}(double ...)

Returns one of the arguments provided randomly.
-#

#-
int {Random}(int min = 0, int max = 255)

Returns a random `int` between `min` and `max`.
-#

#-
int {Random2}(uint mask = uint.Max)

Returns a random `int` between `-mask` and `mask`. `mask` is used as a
bit mask, so it is recommended to use a value of one less than a power
of two (i.e. 3, 7, 15, 31, 63, 127, 255...)
-#

#-
int {RandomPick}(int ...)

Returns one of the arguments provided randomly.
-#

#-
void {SetRandomSeed}(uint num)

Sets the seed of the RNG table to `num`.
-#

<!-- api-members -->
### Definitions

#-
readOnly array\<class> {AllClasses}

Every class registered to the engine.
-#

#-
readOnly array\<class\<[Actor]> > {AllActorClasses}

Every [Actor]-derived class registered to the engine.
-#

#-
readOnly array\<[PlayerClass]> {PlayerClasses}

Every [PlayerClass] registered to the engine.
-#

#-
readOnly array\<[PlayerSkin]> {PlayerSkins}

Every [PlayerSkin] registered to the engine.
-#

#-
readOnly array\<[Team]> {Teams}

Every [Team] registered to the engine.
-#

### Players

#-
play [PlayerInfo]\[[MAXPLAYERS]] {Players}

The [PlayerInfo] for each player. These may be invalid data if the
corresponding entry in [PlayerInGame] is not `true`.
-#

#-
readOnly bool\[[MAXPLAYERS]] {PlayerInGame}

The status of each player as a boolean. If `false` then the
corresponding player is not in-game.
-#

#-
[KeyBindings] {AutomapBindings}

{{#include ../Labels/Todo.md}}
-#

#-
[KeyBindings] {Bindings}

{{#include ../Labels/Todo.md}}
-#

### Game Information

#-
readOnly bool {MultiPlayer}

Whether the game is running in multi-player or not. Does not
necessarily mean there is network communication happening.
-#

#-
readOnly ui bool {NetGame}

Whether the game is running in non-local multi-player or not. Must be
a networked game with more than one player to be true.
-#

#-
readOnly bool {DemoPlayback}

Whether the game is actually a demo playing or not.
-#

### Client State

All data scope globals here are {{#include
../Labels/Nondeterministic.md}} because they rely on the client
despite being accessible from non-UI scope.

#-
readOnly int {ConsolePlayer}

Index of the player running the client.
-#

#-
readOnly bool {AutoMapActive}

Whether the auto-map is visible for the current player.
-#

#-
int {ValidCount}

{{#include ../Labels/Internal.md}} The number of line segments to be
drawn in the scene.
-#

#-
ui [Menu].[EMenuState] {MenuActive}

The current global menu state.
-#

#-
int {LocalViewPitch}

{{#include ../Labels/Internal.md}} The pitch angle (in degrees) of
[ConsolePlayer]'s view.
-#

### Game State

#-
readOnly [EGameAction] {GameAction}

The current game action.
-#

#-
readOnly [EGameState] {GameState}

The current game state.
-#

#-
readOnly int {GameTic}

The current game tick.
-#

#-
deprecated("3.8") readOnly bool {GlobalFreeze}

{{#include ../Labels/Legacy.md}} Indicates whether all actors are
frozen or not.
-#

### Static Game Information

#-
play [DeHInfo] {DeH}

Static [DeHackEd] information.
-#

#-
readOnly [GameInfoStruct] {GameInfo}

Static information from [MAPINFO GameInfo].
-#

#-
readOnly [Weapon] {Wp_NoChange}

A non-weapon that denotes the weapon the player is holding should not
be swapped for another weapon.
-#

### Static Client Information

#-
readOnly textureId {SkyFlatNum}

The `textureId` of the sky texture.
-#

#-
readOnly [Font] {SmallFont}

The small font for the current game.
-#

#-
readOnly [Font] {SmallFont2}

The small font for strife status bars.
-#

#-
readOnly [Font] {BigFont}

The big font for the current game.
-#

#-
readOnly [Font] {ConFont}

The console font for the current game.
-#

#-
readOnly [Font] {IntermissionFont}

The intermission font for the current game.
-#

#-
readOnly [Font] {NewConsoleFont}

The universal unicode small font used by the console.
-#

#-
readOnly [Font] {NewSmallFont}

The universal unicode small font used by most things in the engine.
-#

#-
readOnly [Font] {OriginalSmallFont}

The small font defined by the IWAD.
-#

#-
readOnly [Font] {OriginalBigFont}

The big font defined by the IWAD.
-#

#-
readOnly [Font] {AlternativeSmallFont}

If the [language] defines `USE_GENERIC_FONT` as a non-zero value, this
font will be defined as either [SmallFont], [OriginalSmallFont], or
[NewSmallFont] (in that order) depending on which is complete.
-#

<!-- api-constants -->
#-
const int {MAXPLAYERS}

The maximum amount of players allowed in a networked game.
-#
