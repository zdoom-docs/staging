# RenderEvent

[RenderOverlay]: StaticEventHandler.md#mthd-RenderOverlay
[RenderUnderlay]: StaticEventHandler.md#mthd-RenderOverlay

[Actor]: ../Base/Actor.md
[StaticEventHandler]: StaticEventHandler.md

<!-- api-declaration -->
struct RenderEvent ui version("2.4");

<!-- api-definition -->
The information for a [`StaticEventHandler.RenderOverlay`] or
[`StaticEventHandler.RenderUnderlay`] event.

<!-- api-members -->
#-
readOnly vector3 {ViewPos}

The position at which the camera is at.
-#

#-
readOnly double {ViewAngle}

The yaw angle of the camera.
-#

#-
readOnly double {ViewPitch}

The pitch angle of the camera.
-#

#-
readOnly double {ViewRoll}

The roll angle of the camera.
-#

#-
readOnly double {FracTic}

A value between 0 and 1 (exclusive) representing the time between the
last game tick and the next game tick. This is most useful for
interpolation, and you can add it to the current game tick to get the
real time at which this event has been called. Precision is not
specified.
-#

#-
readOnly [Actor] {Camera}

The actor which is acting as the camera for the player's view.
-#
