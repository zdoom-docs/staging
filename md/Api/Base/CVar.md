# CVar

[cvarinfo]: ../../Data/CVarInfo.md
[cvar conversions]: ../../Concepts/CVars.md#conversions

[ECVarType]: CVar/ECVarType.md
[PlayerInfo]: ../Players/PlayerInfo.md

<!-- api-declaration -->
struct CVar clearScope;

<!-- api-definition -->
{{#include ../../Labels/Unserializable.md}}

A **C**onsole **Var**iable, either defined in [CVARINFO][cvarinfo] or
by the engine.

All Get and Set operations will work regardless of the real type of
the CVar, as [they are not "strongly" typed.][cvar conversions]

<!-- api-sub-types -->
* [ECVarType]

<!-- api-class-methods -->
#-
static CVar {FindCVar}(name n)

Returns a server CVar by name, or `null` if none is found.
-#

#-
static CVar {GetCVar}(name n, [PlayerInfo] player = null)

Returns a user or server CVar by name, with `player` as the user if
applicable, or `null` if none is found.
-#

<!-- api-instance-methods -->
### Getters

#-
bool {GetBool}()
double {GetFloat}()
int {GetInt}()
string {GetString}()

Returns a representation of the value of the CVar.
-#

#-
CVar.[ECVarType] {GetRealType}()

Returns the type of the CVar as it was defined.
-#

### Setters

Setters may only be used on mod-defined CVars.

#-
void {SetBool}(bool v)
void {SetFloat}(double v)
void {SetInt}(int v)
void {SetString}(string v)

Sets the CVar to `v`.
-#

#-
int {ResetToDefault}()

Resets the CVar to its default value and returns 0. The purpose of the
return is unknown.
-#
