# EventHandler

[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
class EventHandler : StaticEventHandler play version("2.4");

<!-- api-definition -->
Event handlers handle events on a per-game or per-map level. This
means that they are registered when you start a new game or map, and
un-register when you finish the game or map. This is unlike
[StaticEventHandler], which registers when the engine is started, and
un-registers when it exits.

All of the virtual functions on EventHandler have empty
implementations by default, so you only need to override the events
your event handler needs to override.

See [StaticEventHandler] for more information on the events that can
be overridden on this type.

<!-- api-class-methods -->
#-
clearscope static [StaticEventHandler] {Find}(class\<StaticEventHandler> type)

This is exactly the same as the function on [StaticEventHandler].
-#

#-
clearscope static void {SendNetworkEvent}(string name, int arg1 = 0, int arg2 = 0, int arg3 = 0)

Sends a network event with no activator.
-#
