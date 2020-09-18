# Vector3

<!-- api-definition -->
The `vector3` built-in type.

<!-- api-instance-methods -->
#-
double {Length}() const

Returns the length (magnitude) of the vector.
-#

#-
vector2 {Unit}() const

Returns a normalized vector. Equivalent to `vec / vec.Length()`.
-#

<!-- api-members -->
#-
double {X}
double {Y}
double {Z}

The X, Y, and Z components of this vector.
-#

#-
vector2 {XY}

The [X] and [Y] components of this vector as a vector2.
-#
