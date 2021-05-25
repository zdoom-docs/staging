# string

[format strings]: ../../Concepts/FormatStrings.md

[replace charat]: #replacing-charat
[replace charcodeat]: #replacing-charcodeat

[EmptyTokenType]: ../Base/EmptyTokenType.md
[TOK_KEEPEMPTY]: ../Base/EmptyTokenType.md#enum-TOK_KEEPEMPTY

<!-- api-definition -->
Strings have many methods attached to them for manipulating text.

A string is composed of *bytes* which make up *characters*. Every
character is at least one byte, but a character may also be more than
one byte. The traditional ASCII characters are all single bytes.
Characters are also refered to as *code points* or *unicode
characters*.

<!-- api-class-methods -->
#-
static varArg string {Format}(string format, ...)

Creates a string using a [format string] and any amount of arguments.
-#

#-
static int {CharLower}(int ch)

Returns the lowercase version of `ch`.
-#

#-
static int {CharUpper}(int ch)

Returns the uppercase version of `ch`.
-#

<!-- api-instance-methods -->
### Querying

#-
uint {Length}() const

Returns the number of bytes in this string.
-#

#-
int {CodePointCount}() const

Returns the number of characters in this string.
-#

#-
int, int {GetNextCodePoint}(int pos) const

Returns the next character from the byte `pos` onwards, and the byte
position of the next character.
-#

#-
int {ByteAt}(int pos) const

Returns the byte at `pos` as an integer.
-#

#-
int {IndexOf}(string substr, int startIndex = 0) const

Returns the first index of `substr` starting from the left at `start`.
-#

#-
int {RightIndexOf}(string substr, int endIndex = int.Max) const

Returns the first index of `substr` starting from the right at `end`.
-#

### Copy Modification

#-
string {Filter}()

Replaces escape sequences in a string with escaped characters as a new
string.
-#

#-
string {Left}(int len) const

Returns the first `len` bytes as a new string.
-#

#-
string {Mid}(int pos = 0, int len = int.Max) const

Returns `len` bytes starting at `pos` as a new string.
-#

#-
string {MakeUpper}() const

Converts all characters in the string to uppercase and returns the new
string.
-#

#-
string {MakeLower}() const

Converts all characters in the string to lowercase and returns the new
string.
-#

#-
void {Split}(out array\<string> tokens, string delimiter, [EmptyTokenType] keepEmpty = [TOK_KEEPEMPTY]) const

Splits the string by each delimiter into tokens. `keepEmpty` describes
whether the function should keep or discard empty strings found while
splitting.
-#

### In-Place Modification

#-
varArg void {AppendFormat}(string format, ...)

Works like [`Format`], but appends the result to the string.
-#

#-
void {Remove}(int index, int amount)

Removes `amount` bytes starting at `index` in-place.
-#

void {Replace}(string pattern, string replacement)

Replaces all instances of `pattern` with `replacement` in-place.
-#

#-
void {Truncate}(int newlen)

Truncates the string to `len` bytes in-place.
-#

#-
void {AppendCharacter}(int ch)

Appends `ch` to the end of the string in-place.
-#

#-
void {DeleteLastCharacter}()

Deletes the last character of the string in-place.
-#

### Conversions

#-
double {ToDouble}() const

Interprets the string as a double precision floating point number.
-#

#-
int {ToInt}(int base = 0) const

Interprets the string as a base `base` integer, guessing the base if
it is `0`.
-#

### Deprecated

{{#include ../../Labels/Legacy.md}}

#-
deprecated("4.1") void {ToLower}()

Converts all bytes in the string to lowercase in-place. Use
[`MakeLower`] instead.
-#

#-
deprecated("4.1") void {ToUpper}()

Converts all bytes in the string to uppercase in-place. Use
[`MakeUpper`] instead.
-#

#-
deprecated("4.1") string {CharAt}(int pos) const

Returns the byte at `pos` as a new string. Use [`CodePointCount`] and
[`GetNextCodePoint`] instead. An example of replacing `CharAt` is
available [below.][replace charat]
-#

#-
deprecated("4.1") int {CharCodeAt}(int pos) const

Returns the byte at `pos` as an integer. Use either [`ByteAt`] or
[`CodePointCount`] and [`GetNextCodePoint`] instead. If you
specifically want one byte from the string, use [`ByteAt`]. Otherwise,
if you want one *character*, use [`CodePointCount`] and
[`GetNextCodePoint`]. An example of replacing `CharCodeAt` is
available [below.][replace charcodeat]
-#

#-
deprecated("3.5.1") int {LastIndexOf}(string substr, int endIndex = int.Max) const

Broken. Use [`RightIndexOf`] instead.
-#

<!-- api-footer -->
#### Replacing CharAt

```zsc
// Old code:
if(str.Length() < 3)
	return;

string theThirdCharacter = str.CharAt(2);

// New code:
int leftIndex = -1, rightIndex = -1;

for(int i = 0, j = 0, n = str.CodePointCount(); i < n; j++)
{
	int code;

	[code, i] = str.GetNextCodePoint(i);

	if(j == 2)
		leftIndex = i;
	else if(j == 3)
	{
		rightIndex = i;
		break;
	}
}

if(leftIndex == -1)
	return;

if(rightIndex == -1)
	rightIndex = str.Length() - leftIndex;

string theThirdCharacter = str.Mid(leftIndex, rightIndex - leftIndex);
```

#### Replacing CharCodeAt

```zsc
// Old code:
if(str.Length() < 3)
	return;

int theThirdCharacter = str.CharCodeAt(2);

// New code:
int theThirdCharacter = -1;

for(int i = 0, j = 0, n = str.CodePointCount(); i < n; j++)
{
	int code;

	[code, i] = str.GetNextCodePoint(i);

	if(j == 2)
	{
		theThirdCharacter = code;
		break;
	}
}

if(theThirdCharacter == -1)
	return;
```
