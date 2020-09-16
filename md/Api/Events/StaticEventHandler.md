# StaticEventHandler

[resurrect]: ../../ConsoleCommands.md#ccmd-resurrect

[DamageMobj]: ../Base/Actor.md#mthd-DamageMobj
[Die]: ../Base/Actor.md#mthd-Die
[DrawTopStuff]: ../Ui/BaseStatusBar.md#mthd-DrawTopStuff
[GetDeathHeight]: ../Base/Actor.md#mthd-GetDeathHeight
[MorphedDeath]: ../Base/Actor.md#mthd-MorphedDeath
[OnDestroy]: ../Base/Object.md#mthd-OnDestroy
[OnRespawn]: ../Players/PlayerPawn.md#mthd-OnRespawn
[OwnerDied]: ../Inventory.md#mthd-OwnerDied
[PostBeginPlay]: ../Base/Thinker.md#mthd-PostBeginPlay

[Actor]: ../Base/Actor.md
[BaseStatusBar]: ../Ui/BaseStatusBar.md
[ConsoleEvent]: ConsoleEvent.md
[EventHandler]: EventHandler.md
[HudMessage]: ../Ui/HudMessage.md
[InputEvent]: InputEvent.md
[Inventory]: ../Inventory.md
[Object]: ../Base/Object.md
[PlayerEvent]: PlayerEvent.md
[PlayerPawn]: ../Players/PlayerPawn.md
[RenderEvent]: RenderEvent.md
[ReplaceEvent]: ReplaceEvent.md
[ReplacedEvent]: ReplacedEvent.md
[Screen]: ../Drawing/Screen.md
[Thinker]: ../Base/Thinker.md
[UiEvent]: UiEvent.md
[WorldEvent]: WorldEvent.md

<!-- api-declaration -->
class StaticEventHandler : Object play version("2.4");

<!-- api-definition -->
Static event handlers handle events on a per-instance level. This
means that they are registered when you start GZDoom, and un-register
when you exit GZDoom. This is unlike [EventHandler], which registers
when a new game or map is started, and un-registers when it ends.

All of the virtual functions on StaticEventHandler have empty
implementations by default, so you only need to override the events
your event handler needs to override.

Differences in virtual function behaviour are listed in the
[EventHandler] documentation.

{{#include ../../Labels/Nondeterministic.md}} Because static event
handlers are per-instance rather than per-game, care should be taken
to make sure that variables kept in a static event handler don't
interact with the game directly, or it will act nondeterministically
and cause a desync.

<!-- api-class-methods -->
#-
clearscope static StaticEventHandler {Find}(class\<StaticEventHandler> type)

Finds and returns the static event handler with the type `type` if it
is registered, or `null` if it does not exist.
-#

<!-- api-instance-methods -->
#-
virtual void {OnRegister}()

Called when this type is registered. This is where you should call
[SetOrder] and set [IsUiProcessor] and [RequireMouse].
-#

#-
virtual void {OnUnregister}()

Called when this type is un-registered. With static event handlerss,
this is called when the engine shuts down, so it isn't particularly
useful.
-#

#-
virtual void {WorldLoaded}([WorldEvent] e)

Called directly after the status bar is attached to the player and
after ReOpen ACS scripts are called, just before the display is
flushed and auto-save is done.
-#

#-
virtual void {WorldUnloaded}([WorldEvent] e)

Called directly after Unloading ACS scripts, just before the level
is changed.
-#

#-
virtual void {WorldThingSpawned}([WorldEvent] e)

Called directly after [Thinker].[PostBeginPlay].
-#

#-
virtual void {WorldThingDied}([WorldEvent] e)

Called after [Actor].[MorphedDeath], [Inventory].[OwnerDied], and the
target is set to the damage source, just before Kill ACS scripts are
called and the rest of the death handling is done.
-#

#-
virtual void {WorldThingRevived}([WorldEvent] e)

Called when an actor is revived, after everything is finished.
-#

#-
virtual void {WorldThingDamaged}([WorldEvent] e)

Called directly directly after [Actor].[DamageMobj] finishes, or
directly before [Actor].[Die].
-#

#-
virtual void {WorldThingDestroyed}([WorldEvent] e)

Called at the beginning of [Object].[OnDestroy] on [Actor]s.
-#

#-
virtual void {WorldLinePreActivated}([WorldEvent] e)

Called directly after a line is tested for activation, before any
other activation specials are called (such as checking for keys,
executing the line special, etc.)
-#

#-
virtual void {WorldLineActivated}([WorldEvent] e)

Called directly after a line's special is executed, if it succeeded,
before any other handling (such as changing a switch's texture) is
completed.
-#

#-
virtual void {WorldSectorDamaged}([WorldEvent] e)

Called when a sector is damaged if it has any health groups, before
any other handling is done.
-#

#-
virtual void {WorldLineDamaged}([WorldEvent] e)

Called when a line is damaged if it has any health groups, before any
other handling is done.
-#

#-
virtual void {WorldLightning}([WorldEvent] e)

Called when lightning strikes, directly after the sound is played,
just before Lightning ACS scripts are called.
-#

#-
virtual void {WorldTick}()

Called on every world tick, after interpolators are updated, world
freeze is updated, sight counters are reset, particles have run their
thinkers, and players have run their thinkers, just before the status
bar is ticked, the level ticks, thinkers are ticked, and the level
time is updated. This is not called when the game is paused, and its
execution is entirely deterministic regardless of how this event
handler is applied.
-#

#-
virtual ui void {RenderOverlay}([RenderEvent] e)

Despite the name, this is actually run on the status bar, specifically
in [BaseStatusBar].[DrawTopStuff]. It is run after [HudMessage]s are
drawn and power-ups are drawn, just before the log is drawn. You may
use [Screen] functions in this function.
-#

#-
virtual ui void {RenderUnderlay}([RenderEvent] e)

Despite the name, this is actually run on the status bar, specifically
in the currently-not-exposed [BaseStatusBar].DrawBottomStuff. It is
run just before [HudMessage]s are drawn. You may use [Screen]
functions in this function.
-#

#-
virtual void {PlayerEntered}([PlayerEvent] e)

Called during level load when each player enters the game, after the
camera is set but just before Return ACS scripts are called.
-#

#-
virtual void {PlayerRespawned}([PlayerEvent] e)

Called when a player spawns, directly after the teleport fog is
spanwed and just before Respawn ACS scripts are called. Also called
similarly at the end of the [PlayerPawn].[OnRespawn] function, for
example when the [resurrect] cheat is used.
-#

#-
virtual void {PlayerDied}([PlayerEvent] e)

Called after [WorldThingDied] and [Actor].[GetDeathHeight], and after
the actor's thing special is activated, when the obituary has been
displayed, just before Death ACS scripts have been called.
-#

#-
virtual void {PlayerDisconnected}([PlayerEvent] e)

Called when a bot is removed and when a player disconnects from the game, just
before `DISCONNECT` ACS scripts are called.
-#

#-
virtual ui bool {UiProcess}([UiEvent] e)

Called only if [IsUiProcessor] is `true`. Called when a GUI event is
dispatched by the engine, for example when the UI is active and the
player has pressed a key or moved the mouse. Mouse movements will only
be captured if [RequireMouse] is `true`. Because this interacts
directly with the OS it is not part of the game simulation, therefore
has UI scope and must dispatch commands to the game as networked
events. If the return value is `true`, the function will block any
further handlers from processing this event, essentially "eating" it.
If the return value is `false`, other handlers will continue to be
called as normal.
-#

#-
virtual ui void {UiTick}()

Despite what it may seem, this function is actually called
deterministically within the game loop, just before the level is
ticked and after the player's network commands are created. Despite
this, it is UI scope, so it should be used to process UI code.
-#

#-
virtual ui void {PostUiTick}()

Similar to [UiTick], this is also deterministic, but called after all
other tickers.
-#

#-
virtual ui bool {InputProcess}([InputEvent] e)

The same as [UiProcess], but this is only called when inputs are being
directed to the game, rather than to the GUI. All of the same
restrictions apply to this as they do to [UiProcess], and the return
value acts the same.
-#

#-
virtual ui void {ConsoleProcess}([ConsoleEvent] e)

Called when network events which have no player activator are
received.
-#

#-
virtual void {NetworkProcess}([ConsoleEvent] e)

Called when network events which have a player activator are received.
-#

#-
virtual void {CheckReplacement}([ReplaceEvent] e)

Called during actor replacement, after skill replacement is done, but
before any other replacement (such as actor replacements done in
ZScript actor definitions.)
-#

#-
virtual void {CheckReplacee}([ReplacedEvent] e)

Called during actor replacement, essentially allowing one to implement
a custom function to replace the `replaces ActorType` class flag with
another class when an actor is spawned. This is useful particularly
for boss monsters that have hard-coded death sequences that the player
may want to replace with a random actor.
-#

#-
virtual void {NewGame}()

Called on a new game, directly after level data is reset and right
before the level is set up.
-#

#-
void {SetOrder}(int order)

Sets the ordering of this event handler, which can be read from
[Order].
-#

<!-- api-members -->
#-
readOnly int {Order}

The arbitrary ordering of this event handler relative to other ones.
Event handlers with lower ordering numbers have their functions
executed first. You can set this variable with [SetOrder].
-#

#-
bool {IsUiProcessor}

If `true`, GUI events will be sent to this event handler through
[UiProcess]. This is mainly for optimization purposes.
-#

#-
bool {RequireMouse}

If `true`, mouse events will be sent to this event handler through
[InputProcess] and/or [UiProcess]. This is mainly for optimization
purposes.
-#
