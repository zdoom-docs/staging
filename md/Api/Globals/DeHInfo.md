# DeHInfo

[dehacked]: ../Data/DeHackEd.md

<!-- api-declaration -->
struct DeHInfo clearScope;

<!-- api-definition -->
Static [DeHackEd] information.

<!-- api-members -->
#-
readOnly int {BfgCells}

The amount of ammunition [`StateProvider.A_FireBfg`] will deplete.
Default is 40.
-#

#-
readOnly int {BlueAc}

Multiple of 100 for [`BlueArmor`]'s [`Armor.SaveAmount`]. Default is 2
for 200 armor.
-#

#-
readOnly double {ExplosionAlpha}

For actors with the [`bDEHEXPLOSION`] flag, the alpha to set the actor
to on explosion.
-#

#-
readOnly uint8 {ExplosionStyle}

For actors with the [`bDEHEXPLOSION`] flag, the render style to be
applied on explosion.
-#

#-
readOnly int {MaxHealth}

{{#include ../../Labels/Todo.md}}
-#

#-
readOnly int {MaxSoulSphere}

The [`Inventory.MaxAmount`] for [`SoulSphere`]. Default is 200.
-#

#-
readOnly int {NoAutoFreeze}

Overrides generic freezing deaths if not zero, making all actors act
as if they had the [`bNOICEDEATH`] flag.
-#
