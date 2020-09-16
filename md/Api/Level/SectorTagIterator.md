# SectorTagIterator

[CreateSectorTagIterator]: LevelLocals.md#mthd-CreateSectorTagIterator

[Line]: Line.md
[LevelLocals]: LevelLocals.md

<!-- api-declaration -->
class SectorTagIterator : Object clearscope;

<!-- api-definition -->
Iterates over sector indices with a specified tag.

<!-- api-class-methods -->
#-
deprecated("3.8") static SectorTagIterator {Create}(int tag, [Line] defLine = null)

{{#include ../../Labels/Legacy.md}} Use
[LevelLocals].[CreateSectorTagIterator] instead.

Creates a new iterator over sectors with tag `tag`. {{#include
../../Labels/Todo.md}} I can't find where `defLine` is actually used.
It is a mystery.
-#

<!-- api-instance-methods -->
#-
int {Next}()

Returns the index of the current sector and advances the iterator.
Returns `-1` when the list is exhausted.
-#

#-
int {NextCompat}(bool compat, int secnum)

If `compat` is `false`, acts exactly as `Next`. Otherwise, returns the
index of the current sector and advances the iterator in a manner
compatible with Doom's stair builders.
-#
