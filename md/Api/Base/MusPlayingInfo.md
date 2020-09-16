# MusPlayingInfo

[music ordering]: ../../Data/Music.md#ordering

<!-- api-declaration -->
struct MusPlayingInfo clearScope;

<!-- api-definition -->
Information about music that is playing.

<!-- api-members -->
#-
string {Name}

The file or lump name of the music playing.
-#

#-
int {BaseOrder}

The selected [music ordering] of the song.
-#

#-
bool {Loop}

If the song will loop or not.
-#
