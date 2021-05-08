# Types

ZScript has several categories of types: Integer types, floating-point
(fractional) types, strings, vectors, names, classes, et al. There are
a wide variety of ways to use these types, as well as a wide variety
of places they are used.

Types determine what kind of value an object stores, how it acts
within an expression, etc. All objects, constants and enumerations
have a type. Argument lists use types to ensure a function is used
properly.

Most basic types have methods attached to them, and both integer and
floating-point type names have symbols accessible from them. See the
API section for more information.

There is one additional type, `void`, which resolves to `None`. If a
class is named `None`, `void` objects will actually work. It is
unknown why this exists, and is likely an implementation error.

<dl class="syn"><dt>Type</dt><dd>

* [NumericType]
* [StringType]
* [NameType]
* [BooleanType]
* [IntegerLikeReferenceType]
* [StringLikeReferenceType]
* [ColorType]
* [VectorType]
* [FixedArrayType]
* [DynamicArrayType]
* [MapType]
* [ClassReferenceType]
* [NativePointerType]
* [ReadOnlyType]
* [InstanceType]
* `void`

</dd></dl>

<!-- toc -->

## Numeric Types

Numeric types include integer and floating-point numbers.

<dl class="syn"><dt>NumericType</dt><dd>

* [FloatingPointType]
* [IntegerType]

</dd></dl>

### Integer Types

Integer types are basic integral numbers. They include:

| Type     | Argument | Bits | Lowest value   | Highest value |
| :---     | :------: | :--: | -----------:   | :------------ |
| `int`    | OK       | 32   | -2,147,483,648 | 2,147,483,647 |
| `uint`   | OK       | 32   | 0              | 4,294,967,296 |
| `int16`  | No       | 16   | -32,768        | 32,767        |
| `uint16` | No       | 16   | 0              | 65,535        |
| `int8`   | No       | 8    | -128           | 127           |
| `uint8`  | No       | 8    | 0              | 255           |

Some types have aliases as well:

| Type     | Alias of |
| :---     | :------- |
| `sbyte`  | `int8`   |
| `byte`   | `uint8`  |
| `short`  | `int16`  |
| `ushort` | `uint16` |

<dl class="syn"><dt>IntegerType</dt><dd>

* `byte`
* `int16`
* `int8`
* `int`
* `sbyte`
* `short`
* `uint16`
* `uint8`
* `uint`
* `ushort`

</dd></dl>

### Floating-Point Types

Floating-point types hold exponents, generally represented as regular
decimal numbers with a fraction. There are four such types available
to ZScript.

Note that `float32` is not implemented correctly, and thus is
unusable. Additionally, `float` is 32 bits as a member variable, but
64 bits elsewhere.

| Type      | Argument | Bits     |
| :---      | :------: | :--:     |
| `double`  | OK       | 64       |
| `float`   | OK       | 32 or 64 |
| `float64` | OK       | 64       |
| `float32` | No       | 32       |

<dl class="syn"><dt>FloatingPointType</dt><dd>

* `double`
* `float`
* `float64`
* `float32`

</dd></dl>

## String Types

The `string` type is a mutable, garbage-collected string reference
type. Strings are not structures or classes, however there are methods
attached to the type, detailed in the API section.

Strings are usable as arguments.

<dl class="syn"><dt>StringType</dt><dd>

`string`

</dd></dl>

## Name Types

The `name` type is an indexed string. While their contents are the
same as a string, their actual value is merely an integer which can be
compared far quicker than a string. Names are used for many internal
purposes such as damage type names. Strings are implicitly cast to
names.

Names can be converted to `int` with an explicit cast, and the
negative of `int(name())` may be used to create an integer
representation of a string usable by action specials, most prominently
`Acs_NamedExecute`.

Names are usable as arguments.

<dl class="syn"><dt>NameType</dt><dd>

`name`

</dd></dl>

## Boolean Types

Booleans hold one of two values: `true` or `false`.

Booleans are usable as arguments.

<dl class="syn"><dt>BooleanType</dt><dd>

`bool`

</dd></dl>

## Integer-like Reference Types

There are multiple types that act similarly to integers, but are
distinct types.

Integer-like references are usable as arguments.

<dl class="syn"><dt>IntegerLikeReferenceType</dt><dd>

* `spriteId`
* `textureId`

</dd></dl>

## String-like Reference Types

There are multiple types that act similarly to strings, but are
distinct types. Strings will implicitly convert to these types.

String-like references are usable as arguments.

<dl class="syn"><dt>StringLikeReferenceType</dt><dd>

* `sound`
* `stateLabel`

</dd></dl>

## Color Types

The `color` type can be converted from a string using the `X11RGB`
lump or a hex color in the format `#RRGGBB` or `#RGB`.

Colors are usable as arguments.

<dl class="syn"><dt>ColorType</dt><dd>

`color`

</dd></dl>

## Vector Types

There are two vector types in ZScript, `vector2` and `vector3`, which
hold two and three members, respectively. Their members can be
accessed through `X`, `Y`, and for `vector3`, `Z`. `vector3` can
additionally get the X and Y components as a `vector2` with `XY`.

Vectors can use many operators and even have special ones to
themselves. See the Expressions and Operators section for more
information.

Vectors are usable as arguments.

<dl class="syn"><dt>VectorType</dt><dd>

* `vector2`
* `vector3`

</dd></dl>

## Fixed Array Types

Fixed arrays hold `size` number of `Type` elements, which can be
accessed with the array access operator.

Multi-dimensional arrays are also supported. The dimensions of
multi-dimensional arrays will be backwards (right to left instead of
left to right) if the version of the archive is lower than 3.7.2.

Note that this kind of type can also be declared in variable names
themselves.

Fixed arrays are **not** usable as arguments.

<dl class="syn"><dt>FixedArrayType</dt><dd>

[Identifier] (`[` [ConstantExpression]? `]`)+

</dd></dl>

## Dynamic Array Types

Dynamic arrays hold an arbitrary number of `Type` elements, which can
be accessed with the array access operator.

Dynamic arrays do not have their lifetime scoped to their current
block, so the following code will result in an array with 5 elements:

```zsc
for(int i = 0; i < 5; i++)
{
	array<int> a;
	a.Push(0);
}
```

Dynamic arrays also cannot store most types. Here is a list of types
they can hold:

* Class Instance
* Class Reference
* `double`
* `float`
* `int16`
* `int8`
* `int`
* `string`
* `uint16`
* `uint8`
* `uint`

Dynamic arrays are usable as arguments.

<dl class="syn"><dt>DynamicArrayType</dt><dd>

`array` `<` [Type] `>`

</dd></dl>

## Map Types

Maps are not yet implemented, but exist in syntax.

Maps are **not** usable as arguments.

<dl class="syn"><dt>MapType</dt><dd>

`map` `<` [Type] `,` [Type] `>`

</dd></dl>

## Class Reference Types

Class references are used to describe a concrete *type* rather than an
object. They can be restrained to descendants of a type. Strings are
implicitly cast to class references.

Class references are usable as arguments.

<dl class="syn"><dt>ClassReferenceType</dt><dd>

* `class`
* `class` `<` [Type] `>`

</dd></dl>

## Native Pointer Types

Types prefixed with `@` are native pointers to objects, as opposed to
objects placed directly in the structure's data. This is not usable in
user code. There is also a `voidPtr` type that is usable in user code,
which refers to a real memory address.

Native pointers are usable as arguments.

<dl class="syn"><dt>NativePointerType</dt><dd>

* `@` [Type]
* `voidPtr`

</dd></dl>

## Read-only Types

A read-only type, as its name implies, may only be read from, and is
effectively immutable. Do note that this is separate from the member
declaration flag, and in member declarations `readOnly int` and
`readOnly<int>` are equivalent, however elsewhere this is not the
case.

Read-only objects are usable as arguments.

<dl class="syn"><dt>ReadOnlyType</dt><dd>

`readOnly` `<` [Type] `>`

</dd></dl>

## Instance Types

Any other identifier used as a type will resolve to a class, structure
or enumeration instance.

An instance type that is nested within another type can be accessed
through a similar syntax to member access. If the nested type is
prefixed with a `.` it will always be from global namespace, otherwise
it will be from the current namespace.

| Type                      | Argument |
| :---                      | :------: |
| Class Instance            | OK       |
| Enumeration Instance      | OK       |
| Native Structure Instance | OK       |
| Normal Structure Instance | No       |

<dl class="syn"><dt>InstanceType</dt><dd>

`.`? [Identifier] (`.` [Identifier])*

</dd></dl>

## Variable Names

Variable names can have an array's size on them, instead of on the
type, or none at all for normal variables.

<dl class="syn"><dt>VariableType</dt><dd>

[Identifier] (`[` [ConstantExpression]? `]`)*

</dd></dl>

[ConstantExpression]: Expressions.md#constant-expressions
[Identifier]: Fundamentals.md#identifiers

[BooleanType]: #boolean-types
[ClassReferenceType]: #class-reference-types
[ColorType]: #color-types
[DynamicArrayType]: #dynamic-array-types
[FixedArrayType]: #fixed-array-types
[FloatingPointType]: #floating-point-types
[InstanceType]: #instance-types
[IntegerLikeReferenceType]: #integer-like-reference-types
[IntegerType]: #integer-types
[MapType]: #map-types
[NameType]: #name-types
[NativePointerType]: #native-pointer-types
[NumericType]: #numeric-types
[ReadOnlyType]: #read-only-types
[StringLikeReferenceType]: #string-like-reference-types
[StringType]: #string-types
[Type]: #types
[VectorType]: #vector-types
