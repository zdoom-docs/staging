# float types

<!-- api-definition -->
Floating-point types, i.e. `float`, `double`, etc.

<!-- api-constants -->
#-
T {Min_Normal}

The lowest value representable by the type.
-#

#-
T {Min_Denormal}

The lowest positive subnormal value of the type.
-#

#-
T {Max}

The highest (non-infinity) value representable by the type.
-#

#-
T {Epsilon}

The smallest positive value representable by the type.
-#

#-
T {NaN}

The Not-a-Number value of the type.
-#

#-
T {Infinity}

The infinity value of the type.
-#

#-
int {Dig}

The number of decimal digits guaranteed to be preserved when
converting between text to this type and back.
-#

#-
int {Min_Exp}

The minimum negative base-2 exponent that produces a normal float.
-#

#-
int {Max_Exp}

The maximum positive base-2 exponent that produces a normal float.
-#

#-
int {Mant_Dig}

The number of bits representing the *mantissa* portion of the float,
i.e. the number of bits that can be represented without precision
loss.
-#

#-
int {Min_10_Exp}

The minimum negative base-10 exponent that produces a normal float.
-#

#-
int {Max_10_Exp}

The maximum positive base-10 exponent that produces a normal float.
-#
