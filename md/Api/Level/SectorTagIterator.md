# SectorTagIterator

[CreateSectorTagIterator]: LevelLocals.md#mthd-CreateSectorTagIterator

[Line]: Line.md
[LevelLocals]: LevelLocals.md

<!-- api-declaration -->
class SectorTagIterator : Object clearScope;

<!-- api-definition -->
Iterates over sector indices with a specified tag.

<!-- api-class-methods -->
#-
deprecated("3.8") static SectorTagIterator {Create}(int tag, [Line] defLine = null)

{{#include ../../Labels/Legacy.md}} Use
[`LevelLocals.CreateSectorTagIterator`] instead.

Creates a new iterator over sectors with the tag `tag`, starting at
the back-sector of `defLine`, if it's not `null` and `tag` is 0.
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
