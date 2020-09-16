# StringTable

[LANGUAGE]: ../../Data/Language.md

<!-- api-declaration -->
struct StringTable clearscope;

<!-- api-definition -->
The localized string table as defined by [LANGUAGE].

<!-- api-class-methods -->

#-
static string {Localize}(string val, bool prefixed = true)

{{#include ../../Labels/Nondeterministic.md}} Returns the localized
variant of `val`. If `prefixed` is `true`, the string is returned
as-is, unless it is prefixed with "`$`", where the "`$`" character
itself is ignored. Nondeterministic unless there is only one variant
of `val`. This is generally fine because this should only be used for
visual strings anyway.
-#
