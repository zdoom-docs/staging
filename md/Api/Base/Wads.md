# Wads

[virtual file system]: ../../Concepts/Vfs.md

[ANYNAMESPACE]: Wads/FindLumpNamespace.md#memb-anynamespace
[FindLumpNamespace]: Wads/FindLumpNamespace.md
[GLOBALNAMESPACE]: Wads/FindLumpNamespace.md#memb-globalnamespace
[WadNamespace]: Wads/WadNamespace.md

<!-- api-declaration -->
struct Wads clearscope;

<!-- api-definition -->
The Wads group of functions allow you to access the [virtual file
system] by reading from loaded archives. Note that all archive
operations are {{#include ../../Labels/Nondeterministic.md}} unless
all users have the exact same files loaded. This is generally fine
even if they are not exactly the same, but be careful to not do things
which may collide with what another mod is doing.

<!-- api-sub-types -->
* [FindLumpNamespace]
* [WadNamespace]

<!-- api-class-methods -->
#-
static int {CheckNumForFullName}(string name)

Returns the handle of the first file named `name`, matching only the
full path to it, including the extension, or `-1` if the file was not
found. Only works with files defined in resource archives.
-#

#-
static int {CheckNumForName}(string name, Wads.[WadNamespace] ns, int wadnum = -1, bool exact = false)

Returns the handle of the first lump named `name` within namespace
`ns`. If `wadnum` is not `-1`, then it signifies, if `exact` is false,
the number of the last archive to search in, or the only archive to
search in if `exact` is `true`.

Note there is currently no way to actually *get* the number of an
archive, even the current one. The only guarantee is that archive `0`
will be the base archive (`gzdoom.pk3`.)
-#

#-
static int {FindLump}(string name, int startlump = 0, Wads.[FindLumpNamespace] ns = Wads.[GLOBALNAMESPACE])

Returns the handle of the first lump named `name` starting at
`startlump` (where `0` indicates the first lump) in either the global
namespace or any namespace (based on `ns`.) Returns `-1` if there are
no lumps with that name left. This function can be used in a loop to
find all lumps with a specified name.
-#

#-
static string {ReadLump}(int lump)

Reads the whole contents of `lump` into a string and returns the
result. If `lump` is not valid, returns an empty string. Note that
binary lumps can be loaded this way and the string's length will be
correct according to the lump's size even if null characters are
present in the lump.
-#

#-
static int {GetNumLumps}()

Returns the number of files throughout the entire loaded virtual file
system.
-#

#-
static string {GetLumpName}(int lump)

Returns the shortened 8-character name of the lump.
-#

#-
static string {GetLumpFullName}(int lump)

Returns the full name of the lump, or the short name if one does not
exist.
-#

#-
static Wads.[WadNamespace] {GetLumpNamespace}(int lump)

Returns the namespace this lump is in.
-#
