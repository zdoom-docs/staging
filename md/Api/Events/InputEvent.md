# InputEvent

[InputProcess]: StaticEventHandler.md#mthd-InputProcess
[Type_KeyDown]: InputEvent/EGenericEvent.md#enum-Type_KeyDown
[Type_KeyUp]: InputEvent/EGenericEvent.md#enum-Type_KeyUp
[Type_Mouse]: InputEvent/EGenericEvent.md#enum-Type_Mouse

[EDoomInputKeys]: InputEvent/EDoomInputKeys.md
[EGenericEvent]: InputEvent/EGenericEvent.md
[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct InputEvent play version("2.4");

<!-- api-definition -->
The information for a [StaticEventHandler].[InputProcess] event.

<!-- api-sub-types -->
* [EDoomInputKeys]
* [EGenericEvent]

<!-- api-members -->
#-
readOnly [EGenericEvent] {Type}

The kind of input event this is.
-#

#-
readOnly [EDoomInputKeys] {KeyScan}

The key-code for InputEvent.[Type_KeyDown], InputEvent.[Type_KeyUp],
and InputEvent.[Type_Mouse] events.
-#

#-
readOnly string {KeyString}

The character code for [KeyScan] as a string, if it is used and can be
represented as one.
-#

#-
readOnly int {KeyChar}

The character code for [KeyScan] as an integer, if it is used and can
be represented as one.
-#

#-
readOnly int {MouseX}

The horizontal mouse position differential[^delta] for
InputEvent.[Type_Mouse].
-#

#-
readOnly int {MouseY}

The vertical mouse position differential[^delta] for
InputEvent.[Type_Mouse].
-#

<!-- api-definition -->
[^delta]: The difference between the last known position and the current position.
