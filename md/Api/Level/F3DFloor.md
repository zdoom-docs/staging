# F3DFloor

[EF3DFloorFlags]: F3DFloor/F3DFloorFlags.md
[Line]: Line.md
[SecPlane]: SecPlane.md
[Sector]: Sector.md

<!-- api-declaration -->
struct F3DFloor play;

<!-- api-definition -->
Describes a 3D floor.

<!-- api-sub-types -->
* [EF3DFloorFlags]

<!-- api-instance-methods -->
#-
textureId {GetTexture}(int position)
-#

<!-- api-members -->
#-
readOnly [SecPlane] {Bottom}

The bottom plane of this floor.
-#

#-
readOnly [SecPlane] {Top}

The top plane of this floor.
-#

#-
readOnly [EF3DFloorFlags] {Flags}

The flags for this floor.
-#

#-
readOnly [Line] {Master}

The control line used for this floor.
-#

#-
readOnly [Sector] {Model}

The control sector used for this floor.
-#

#-
readOnly [Sector] {Target}

The actual sector used for this floor.
-#

#-
readOnly int {Alpha}

The transparency of the floor, out of 255.
-#
