# array\<T>

<!-- api-definition -->
The built-in dynamic-size array type.

<!-- api-instance-methods -->
#-
uint {Size}() const

Returns the number of elements in the array.
-#

#-
void {Copy}(array\<T> other)

Copies all of the elements of `other` into this array, doing nothing
to the original array.
-#

#-
void {Move}(array\<T> other)

Moves all of the elements of `other` into this array, emptying the
original array completely.
-#

#-
void {Append}(array\<T> other)

Appends the elements of `other` to this array, copying them.
-#

#-
uint {Find}(T item) const

Returns the index of the first element matching `item`, or [`Size`] if
no matches are found.
-#

#-
uint {Push}(T item)

Inserts an element at the end of the array.
-#

#-
bool {Pop}()

Removes the last element in the array. Returns `false` if nothing was
removed.
-#

#-
void {Delete}(uint index, int deleteCount = 1)

Deletes `deleteCount` elements at `index`, moving elements back if
necessary.
-#

#-
void {Insert}(uint index, T item)

Inserts an element at `index`. If `index` is beyond the bounds of the
array, it will initialize the leading elements to their null value.
-#

#-
void {ShrinkToFit}()

Shrinks the internal array to the [`Size`] of the array.
-#

#-
void {Grow}(uint amount)

Grows the internal array's capacity so that it can fit at least
`amount` more elements.
-#

#-
void {Resize}(uint amount)

Resizes the internal array to `amount`, potentially removing elements.
-#

#-
uint {Reserve}(uint amount)

Grows the internal array's capacity by exactly `amount` more elements.
-#

#-
uint {Max}() const

Returns the size of the internal array.
-#

#-
void {Clear}()

Removes all elements in the array.
-#
