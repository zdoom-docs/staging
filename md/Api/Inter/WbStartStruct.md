# WbStartStruct

[MAXPLAYERS]: ../Globals.md#memb-MAXPLAYERS
[StatusScreen]: StatusScreen.md
[WbPlayerStruct]: WbPlayerStruct.md

<!-- api-declaration -->
struct WbStartStruct clearScope version("2.4");

<!-- api-definition -->
Information passed into the [`StatusScreen`] class when an intermission starts.

<!-- api-members -->
### Player

#-
[WbPlayerStruct]\[[MAXPLAYERS]\] {Plyr}

The player structure for each player.
-#

#-
int {PNum}

The index of the player to show stats for.
-#

### Map

#-
int {Finished_Ep}

The cluster of the finished map, minus one.
-#

#-
int {Next_Ep}

The cluster of the next map, minus one.
-#

#-
string {Current}

The name of the map that was finished.
-#

#-
string {Next}

The name of the next map.
-#

#-
string {NextName}

The printable name of the next map.
-#

#-
string {ThisName}

The printable name of the map that was finished.
-#

#-
string {NextAuthor}

The author of the next map.
-#

#-
string {ThisAuthor}

The author of the map that was finished.
-#

#-
textureId {LName0}

Texture ID of the level name of the map that was finished.
-#

#-
textureId {LName1}

Texture ID of the level name of the map being entered.
-#

### Statistics

#-
int {MaxFrags}

Unknown purpose, not actually used by any part of the engine.
-#

#-
int {MaxItems}

The maximum number of acquired items in the map.
-#

#-
int {MaxKills}

The maximum number of killed monsters in the map.
-#

#-
int {MaxSecret}

The maximum number of found secrets in the map.
-#

#-
int {ParTime}

The par time of the map, in tics.
-#

#-
int {SuckTime}

The suck time of the map, in minutes.
-#

#-
int {TotalTime}

The total time for the whole game, in tics.
-#
