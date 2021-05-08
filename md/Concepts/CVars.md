# CVars

{{#include ../Labels/Todo.md}}

## Conversions

### Into `bool`

| From     | Into
| :---     | :---
| `bool`   | No change
| `float`  | `false` if `0.0`
| `int`    | `false` if `0`
| `string` | `true` if value is `"true"`, `false` if `"false"`, or `false` if string converted to integer is `0` or invalid
| `color`  | `false` if `#000000`

### Into `float`

| From     | Into
| :---     | :---
| `bool`   | `1.0` or `0.0`
| `float`  | No change
| `int`    | No change
| `string` | Value returned by [`strtod`]
| `color`  | Integer value with no change

### Into `int`

| From     | Into
| :---     | :---
| `bool`   | `1` or `0`
| `float`  | Value rounded down
| `int`    | No change
| `string` | `1` if the value is `"true"`, `0` if `"false"`, or value returned by [`strtoll`]
| `color`  | RRGGBB octet pair as an integer

### Into `string`

| From     | Into
| :---     | :---
| `bool`   | `"true"` or `"false"`
| `float`  | Value [formatted][format strings] with `%H`
| `int`    | Value [formatted][format strings] with `%i`
| `string` | No change
| `color`  | "RR GG BB" octet pair

[format strings]: FormatStrings.md
[strtod]: https://en.cppreference.com/w/cpp/string/byte/strtof
[strtoll]: https://en.cppreference.com/w/cpp/string/byte/strtol
