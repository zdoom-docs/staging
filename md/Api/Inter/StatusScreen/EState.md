# EState

[StatusScreen]: ../StatusScreen.md

<!-- api-declaration -->
enum StatusScreen.EState;

<!-- api-definition -->
Each of the possible states for [`StatusScreen`]s.

<!-- api-variants -->
#-
[StatusScreen].{STATCOUNT}

The state where statistics are counted and displayed.
-#

#-
[StatusScreen].{SHOWNEXTLOC}

The state where the next map is shown as `ENTERING (map name)`, and in
episodic maps, the world map.
-#

#-
[StatusScreen].{NOSTATE}

The state at the very end of this process, where the last frame is
drawn and the intermission is exited.
-#

#-
[StatusScreen].{LEAVINGINTERMISSION}

The state which is used only to signify that all stages are done and
the status screen has been exited.
-#
