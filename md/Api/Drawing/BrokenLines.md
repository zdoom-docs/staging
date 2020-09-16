# BrokenLines

<!-- api-declaration -->
class BrokenLines : Object clearScope;

<!-- api-definition -->
A container representing an array of lines of text that have been
broken up to fit the screen and clipping region.

<!-- api-instance-methods -->
#-
int {Count}()

Returns the amount of lines in this container.
-#

#-
string {StringAt}(int line)

Returns the text of line `line`.
-#

#-
int {StringWidth}(int line)

Returns the width in pixels of line `line`.
-#
