# textureId

<!-- api-definition -->
Texture IDs can be explicitly converted to integers, but not the other
way around. You can add and subtract integers with a `textureId`,
however. (This only works with the integer on the right hand side.)

<!-- api-instance-methods -->
#-
bool {Exists}() const

Checks if the texture exists within the texture manager at all.
-#

#-
bool {IsNull}() const

Checks if the texture is the null index `0`.
-#

#-
bool {IsValid}() const

Checks if the texture index is not the invalid index `-1`.
-#

#-
void {SetInvalid}()

Sets the texture index to `-1`.
-#

#-
void {SetNull}()

Sets the texture index to `0`.
-#

<!-- api-footer -->
## Zero-Initializing

The proper way to zero-initialize a textureId is:

```
textureId tex;
tex.SetNull();
```
