# ReplacedEvent

[CheckReplacee]: StaticEventHandler.md#mthd-CheckReplacee

[Actor]: ../Base/Actor.md
[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct ReplacedEvent clearScope version("3.7");

<!-- api-definition -->
The information for a [`StaticEventHandler.CheckReplacee`] event. You
can mutate the variables in this event to change the result of
replacement checking.

<!-- api-members -->
#-
class\<[Actor]> {Replacee}

The actor class which is being replaced. Modify this to change what
the resulting replacee class ends up being.
-#

#-
readOnly class\<[Actor]> {Replacement}

What to replace it with. This class type is already effected by skill
and actor definition replacements, so it may be useful to read it.
-#

#-
bool {IsFinal}

If `true`, the engine will not attempt to continue going down the
replacement chain, and will directly replace the actor with
[`Replacee`].
-#
