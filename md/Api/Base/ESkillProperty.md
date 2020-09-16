# ESkillProperty

[GameSkill]: ../../Acs/GameSkill.md
[sv_cheats]: ../../CVars.md#cvar-sv_cheats

[BossBrain]: ../Doom/BossBrain.md
[BossTarget]: ../Doom/BossTarget.md
[HealthPickup]: ../Inventory/HealthPickup.md
[Object]: Object.md

[A_BrainSpit]: ../Doom/BossBrain.md#mthd-A_BrainSpit
[G_SkillPropertyInt]: Object.md#mthd-G_SkillPropertyInt

<!-- api-declaration -->
enum ESkillProperty;

<!-- api-definition -->
All of the properties that can be returned by
[Object].[G_SkillPropertyInt].

<!-- api-variants -->
#-
{SKILLP_ACSRETURN}

The number returned by the [GameSkill] ACS function.
-#

#-
{SKILLP_AUTOUSEHEALTH}

If not `0`, [HealthPickup] items are automatically used by the player.
-#

#-
{SKILLP_DISABLECHEATS}

If not `0`, cheating is disabled unless [sv_cheats] is enabled.
-#

#-
{SKILLP_EASYBOSSBRAIN}

Makes [BossBrain].[A_BrainSpit] skip this amount of [BossTarget]s.
-#

#-
{SKILLP_FASTMONSTERS}

If not `0`, fast monsters is enabled.
-#

#-
{SKILLP_INFIGHT}

If `1`, *total infighting* mode is enabled. If `0`, infighting is
enabled. If `-1`, *no infighting* mode is enabled.
-#

#-
{SKILLP_NOPAIN}

If not `0`, monsters will not enter pain states.
-#

#-
{SKILLP_PLAYERRESPAWN}

If not `0`, players can respawn.
-#

#-
{SKILLP_RESPAWN}

The timer for respawning monsters, or `0` if monsters do not respawn.
-#

#-
{SKILLP_RESPAWNLIMIT}

The number of times a monster may respawn if [SKILLP_RESPAWN] allows
them to.
-#

#-
{SKILLP_SLOWMONSTERS}

If not `0`, slow monsters is enabled.
-#

#-
{SKILLP_SPAWNFILTER}

The spawn filter used to disable certain actors from being placed in
the map.
-#
