# FColorMap

<!-- api-declaration -->
struct FColorMap clearScope;

<!-- api-definition -->
Describes the coloring of a sector.

<!-- api-members -->
#-
uint8 {BlendFactor}

The blend factor for Legacy-style color maps.
-#

#-
uint8 {Desaturation}

How much to desaturate colors in this sector.
-#

#-
color {FadeColor}

The color of fog in this sector. None if all components are 0.
-#

#-
color {LightColor}

The color of the sector. Default if all components are 0.
-#
