# ReplaceEvent

[CheckReplacement]: StaticEventHandler.md#mthd-CheckReplacement

[Actor]: ../Base/Actor.md
[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct ReplaceEvent clearscope version("2.4");

<!-- api-definition -->
The information for a [StaticEventHandler].[CheckReplacement] event.
You can mutate the variables in this event to change the result of
replacement checking.

<!-- api-members -->
#-
readOnly class\<[Actor]> {Replacee}

The actor class which is being replaced.
-#

#-
class\<[Actor]> {Replacement}

What to replace it with. This class type is already effected by skill
and actor definition replacements, so it may be useful to read it.
Modify this to change what the resulting replacement class ends up
being.
-#

#-
bool {IsFinal}

If `true`, the engine will not attempt to continue going down the
replacement chain, and will directly replace the actor with
[Replacement].
-#
