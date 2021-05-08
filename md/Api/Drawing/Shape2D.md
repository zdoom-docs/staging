# Shape2D

[C_VERTS]: Shape2D/EClearWhich.md#enum-C_VERTS
[C_COORDS]: Shape2D/EClearWhich.md#enum-C_COORDS
[C_INDICES]: Shape2D/EClearWhich.md#enum-C_INDICES

[EClearWhich]: Shape2D/EClearWhich.md
[Shape2DTransform]: Shape2DTransform.md

<!-- api-declaration -->
class Shape2D : Object clearScope;

<!-- api-definition -->
Represents an arbitrary polygonal 2D shape.

<!-- api-sub-types -->
EClearWhich,

<!-- api-instance-methods -->
#-
void {SetTransform}([Shape2DTransform] transform)

{{#include ../../Labels/Todo.md}}
-#

#-
void {Clear}(Shape2D.[EClearWhich] which = Shape2D.[C_VERTS] | Shape2D.[C_COORDS] | Shape2D.[C_INDICES])

Removes all of a certain type (or types of) data out of a shape.
-#

#-
void {PushCoord}(vector2 c)

Pushes a texture coordinate into the shape buffer.
-#

#-
void {PushTriangle}(int a, int b, int c)

Pushes the indices of a triangle into the shape buffer.
-#

#-
void {PushVertex}(vector2 v)

Pushes a vertex into the shape buffer.
-#
