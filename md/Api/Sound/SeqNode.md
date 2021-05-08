# SeqNode

[ESeqType]: SeqNode/ESeqType.md

[SNDSEQ]: ../../Data/SndSeq.md

<!-- api-declaration -->
class SeqNode : Object clearScope;

<!-- api-definition -->
A [SNDSEQ] node.

<!-- api-sub-types -->
ESeqType,

<!-- api-class-methods -->
#-
void {AddChoice}(int seqnum, SeqNode.[ESeqType] type)
bool {AreModesSame}(name n, int mode1)
bool {AreModesSameID}(int sequence, SeqNode.[ESeqType] type, int mode1)
name {GetSequenceName}()

{{#include ../../Labels/Todo.md}}
-#

<!-- api-instance-methods -->
#-
static name {GetSequenceSlot}(int sequence, SeqNode.[ESeqType] type)
static void {MarkPrecacheSounds}(int sequence, SeqNode.[ESeqType] type)

{{#include ../../Labels/Todo.md}}
-#
