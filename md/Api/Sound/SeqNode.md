# SeqNode

[ESeqType]: SeqNode/ESeqType.md

[SNDSEQ]: ../../Data/SndSeq.md

<!-- api-declaration -->
class SeqNode : Object clearscope;

<!-- api-definition -->
A [SNDSEQ] node.

<!-- api-sub-types -->
* [ESeqType]

<!-- api-class-methods -->
#-
void {AddChoice}(int seqnum, SeqNode.[ESeqType] type)

{{#include ../../Labels/Todo.md}}
-#

#-
bool {AreModesSame}(name n, int mode1)

{{#include ../../Labels/Todo.md}}
-#

#-
bool {AreModesSameID}(int sequence, SeqNode.[ESeqType] type, int mode1)

{{#include ../../Labels/Todo.md}}
-#

#-
name {GetSequenceName}()

{{#include ../../Labels/Todo.md}}
-#

<!-- api-instance-methods -->
#-
static name {GetSequenceSlot}(int sequence, SeqNode.[ESeqType] type)

{{#include ../../Labels/Todo.md}}
-#

#-
static void {MarkPrecacheSounds}(int sequence, SeqNode.[ESeqType] type)

{{#include ../../Labels/Todo.md}}
-#
