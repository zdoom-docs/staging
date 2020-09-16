# LineIdIterator

[CreateLineIdIterator]: LevelLocals.md#mthd-CreateLineIdIterator

[LevelLocals]: LevelLocals.md

<!-- api-declaration -->
class LineIdIterator : Object clearscope;

<!-- api-definition -->
Iterates over line indices with a specified tag.

<!-- api-class-methods -->
#-
deprecated("3.8") static LineIdIterator {Create}(int tag)

{{#include ../../Labels/Legacy.md}} Use
[LevelLocals].[CreateLineIdIterator] instead.

Creates a new iterator over lines with tag `tag`.
-#

<!-- api-instance-methods -->
#-
int {Next}()

Returns the index of the current line and advances the iterator.
Returns `-1` when the list is exhausted.
-#
