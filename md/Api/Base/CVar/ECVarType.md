# ECVarType

[CVar]: ../CVar.md

<!-- api-declaration -->
enum CVar.ECVarType;

<!-- api-definition -->
Each of the possible types for CVars.

<!-- api-variants -->
#-
[CVar].{CVAR_BOOL}

Boolean CVars.
-#

#-
[CVar].{CVAR_INT}

Integer CVars.
-#

#-
[CVar].{CVAR_FLOAT}

Floating-point CVars.
-#

#-
[CVar].{CVAR_STRING}

String CVars.
-#

#-
[CVar].{CVAR_COLOR}

Color CVars. These do not have accessor functions, and must be cast to
other types.
-#
