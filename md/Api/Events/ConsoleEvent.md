# ConsoleEvent

[ConsoleProcess]: StaticEventHandler.md#mthd-ConsoleProcess
[NetworkProcess]: StaticEventHandler.md#mthd-NetworkProcess
[SendNetworkEvent]: StaticEventHandler.md#mthd-SendNetworkEvent

[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct ConsoleEvent clearscope version("2.4");

<!-- api-definition -->
The information for a [StaticEventHandler].[ConsoleProcess] or
[StaticEventHandler].[NetworkProcess] event.

<!-- api-members -->
#-
readOnly int {Player}

The player who created this event, or `-1` if there was no activator.
This will always be positive for [StaticEventHandler].[NetworkProcess]
events and always `-1` for [StaticEventHandler].[ConsoleProcess]
events.
-#

#-
readOnly string {Name}

The name as provided to [StaticEventHandler].[SendNetworkEvent]. Use
this to distinguish between event types. It is favorable to prefix
names with the name of your mod or game so that it will not
potentially conflict with other mods.
-#

#-
readOnly int[3] {Args}

The arguments as provided to [StaticEventHandler].[SendNetworkEvent].
-#

#-
readOnly bool {IsManual}

`true` if this event was created manually, for instance through a
console command.
-#
