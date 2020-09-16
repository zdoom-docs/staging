# WorldEvent

[WorldLightning]: StaticEventHandler.md#mthd-WorldLightning
[WorldLineActivated]: StaticEventHandler.md#mthd-WorldLineActivated
[WorldLineDamaged]: StaticEventHandler.md#mthd-WorldLineDamaged
[WorldLinePreActivated]: StaticEventHandler.md#mthd-WorldLinePreActivated
[WorldLoaded]: StaticEventHandler.md#mthd-WorldLoaded
[WorldSectorDamaged]: StaticEventHandler.md#mthd-WorldSectorDamaged
[WorldThingDamaged]: StaticEventHandler.md#mthd-WorldThingDamaged
[WorldThingDestroyed]: StaticEventHandler.md#mthd-WorldThingDestroyed
[WorldThingDied]: StaticEventHandler.md#mthd-WorldThingDied
[WorldThingRevived]: StaticEventHandler.md#mthd-WorldThingRevived
[WorldThingSpawned]: StaticEventHandler.md#mthd-WorldThingSpawned
[WorldUnloaded]: StaticEventHandler.md#mthd-WorldUnloaded

[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct WorldEvent play version("2.4");

<!-- api-definition -->
The information for a [StaticEventHandler].[WorldLightning],
[StaticEventHandler].[WorldLineActivated],
[StaticEventHandler].[WorldLineDamaged],
[StaticEventHandler].[WorldLinePreActivated],
[StaticEventHandler].[WorldLoaded],
[StaticEventHandler].[WorldSectorDamaged],
[StaticEventHandler].[WorldThingDamaged],
[StaticEventHandler].[WorldThingDestroyed],
[StaticEventHandler].[WorldThingDied],
[StaticEventHandler].[WorldThingRevived],
[StaticEventHandler].[WorldThingSpawned], or
[StaticEventHandler].[WorldUnloaded] event.

<!-- api-members -->
### [WorldLoaded], [WorldUnloaded]
#-
readOnly bool {IsSaveGame}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly bool {IsReopen}

{{#include ../../Labels/Todo.md}}
-#

### [WorldThingDamaged], [WorldThingDestroyed], [WorldThingDied], [WorldThingRevived], [WorldThingSpawned]
#-
readOnly Actor {Thing}

{{#include ../../Labels/Todo.md}}
-#

#### [WorldThingDied]
#-
readOnly Actor {Inflictor}

{{#include ../../Labels/Todo.md}}
-#

#### [WorldThingDamaged]
#-
readOnly int {Damage}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly Actor {DamageSource}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly Name {DamageType}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly EDmgFlags {DamageFlags}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly double {DamageAngle}

{{#include ../../Labels/Todo.md}}
-#

### [WorldLineActivated], [WorldLinePreActivated]
#-
readOnly Line {ActivatedLine}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly int {ActivationType}

{{#include ../../Labels/Todo.md}}
-#

#-
bool {ShouldActivate}

{{#include ../../Labels/Todo.md}}
-#

### [WorldLineDamaged], [WorldSectorDamaged]
#-
readOnly SectorPart {DamageSectorPart}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly Line {DamageLine}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly Sector {DamageSector}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly int {DamageLineSide}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly vector3 {DamagePosition}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly bool {DamageIsRadius}

{{#include ../../Labels/Todo.md}}
-#

#-
int {NewDamage}

{{#include ../../Labels/Todo.md}}
-#
