# EStatNums

[ActorMover]: ../../MapFuncs/ActorMover.md
[BossBrain]: ../../Doom/BossBrain.md
[Inventory]: ../../Inventory/Inventory.md
[MapMarker]: ../../MapFuncs/MapMarker.md
[PlayerPawn]: ../../Players/PlayerPawn.md
[SpecialSpot]: ../../MapFuncs/SpecialSpot.md
[Thinker]: ../Thinker.md

<!-- api-declaration -->
enum Thinker.EStatNums;

<!-- api-definition -->
All thinkers are grouped by their "stat" number, or "statnum," which
specifies the ordering of which thinkers are run, first to last. There
are [`Thinker.MAX_STATNUM`] stat numbers total, 20 of which are not
used by the engine and may be used for any purpose.

<!-- api-variants -->
#-
[Thinker].{MAX_STATNUM}

The number of statnums available to the engine.
-#

### Users

#-
[Thinker].{STAT_USER_MAX}
[Thinker].{STAT_USER}

The user-defined stat numbers begin at [`Thinker.STAT_USER`] and end
at [`Thinker.STAT_USER_MAX`]. Do not attempt to use normal integers as
stat numbers *except as relative to these two*.
-#

### Non-Thinking

Thinkers which do not think and are elided from many checks.

#-
[Thinker].{STAT_INFO}

Info queue used by [`SpecialSpot`] and its descendants.
-#

#-
[Thinker].{STAT_DECAL}

Decals that cannot be deleted.
-#

#-
[Thinker].{STAT_AUTODECAL}

Decals that can be deleted (were not placed by the map.)
-#

#-
[Thinker].{STAT_CORPSEPOINTER}

An entry in Hexen's corpse queue.
-#

#-
[Thinker].{STAT_TRAVELLING}

Any actor travelling between maps in a hub.
-#

#-
[Thinker].{STAT_STATIC}

Thinkers persistent across maps.
-#

### Thinking

Thinkers which do think and are subject to many checks.

#-
[Thinker].{STAT_FIRST_THINKING}

The first thinking statnum. This is equivalent to
[`Thinker.STAT_SCROLLER`].
-#

#-
[Thinker].{STAT_SCROLLER}

Texture scrollers and carriers.
-#

#-
[Thinker].{STAT_PLAYER}

All [`PlayerPawn`] actors.
-#

#-
[Thinker].{STAT_BOSSTARGET}

[`BossBrain`] targets.
-#

#-
[Thinker].{STAT_LIGHTNING}

Lightning as used by Hexen.
-#

#-
[Thinker].{STAT_DECALTHINKER}

Decal animators.
-#

#-
[Thinker].{STAT_INVENTORY}

All [`Inventory`] items.
-#

#-
[Thinker].{STAT_LIGHT}

Sector lighting thinkers.
-#

#-
[Thinker].{STAT_LIGHTTRANSFER}

Sector lighting transfer thinkers.
-#

#-
[Thinker].{STAT_EARTHQUAKE}

Quake effects.
-#

#-
[Thinker].{STAT_MAPMARKER}

All [`MapMarker`] actors.
-#

#-
[Thinker].{STAT_DLIGHT}

Dynamic lights.
-#

#-
[Thinker].{STAT_USER}

The first available user-defined statnum.
-#

#-
[Thinker].{STAT_USER}

The last available user-defined statnum.
-#

#-
[Thinker].{STAT_DEFAULT}

Anything not in any other category. Most actors go here.
-#

#-
[Thinker].{STAT_SECTOREFFECT}

Sector effects that cause floor or ceiling movement.
-#

#-
[Thinker].{STAT_ACTORMOVER}

All [`ActorMover`] actors.
-#

#-
[Thinker].{STAT_SCRIPTS}

The ACS VM.
-#

#-
[Thinker].{STAT_BOT}

All bot logic. This is not bound to their actor.
-#
