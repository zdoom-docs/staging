# UiEvent

[UiProcess]: StaticEventHandler.md#mthd-UiProcess

[EGuiEvent]: UiEvent/EGuiEvent.md
[ESpecialGuiKeys]: UiEvent/ESpecialGuiKeys.md
[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct UiEvent ui version("2.4");

<!-- api-definition -->
The information for a [StaticEventHandler].[UiProcess] event.

<!-- api-sub-types -->
* [EGuiEvent]
* [ESpecialGuiKeys]

<!-- api-members -->
#-
readOnly [EGuiEvent] {Type}

The kind of UI event this is.
-#

#-
readOnly string {KeyString}

The character code for this event as a string, if it is used and can
be represented as one.
-#

#-
readOnly int {KeyChar}

The character code for this event as an integer, if it is used and can
be represented as one. This value may also be one of
UiEvent.[ESpecialGuiKeys].
-#

#-
readOnly int {MouseX}

The horizontal mouse position differential[^delta] for mouse events.
-#

#-
readOnly int {MouseY}

The vertical mouse position differential[^delta] for mouse events.
-#

#-
readOnly bool {IsShift}

`true` if the "shift" key was held down during this event.
-#

#-
readOnly bool {IsCtrl}

`true` if the "control" key was held down during this event.
-#

#-
readOnly bool {IsAlt}

`true` if the "alt" key was held down during this event.
-#

<!-- api-footer -->
[^delta]: The difference between the last known position and the current position.
