# WbPlayerStruct

[MAXPLAYERS]: ../Globals.md#memb-MAXPLAYERS
[StatusScreen]: StatusScreen.md

<!-- api-declaration -->
struct WbPlayerStruct clearScope version("2.4");

<!-- api-definition -->
Information for each individual player for a [`StatusScreen`].

<!-- api-members -->
#-
int {SItems}

The number of items this player acquired.
-#

#-
int {SKills}

The number of monsters this player killed.
-#

#-
int {SSecret}

The number of secrets this player found.
-#

#-
int {STime}

The time this player finished the level at, in tics. (This is the same
for all players.)
-#

#-
int {FragCount}

The total amount of frags this player scored against all players.
-#

#-
int[[MAXPLAYERS]\] {Frags}

The number of frags this player scored against each other player.
-#
