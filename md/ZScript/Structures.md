# Structure Definitions

A structure is an object type that does not inherit from Object and is
not always &mdash; though occasionally is &mdash; a reference type,
unlike classes. Structures marked as `native` are passed by-reference
to and from the engine in an implicit pseudo-type `Pointer<T>`, and
`null` can be passed in their place. Also note that this means the
engine can return `null` structures. User defined structures cannot be
passed as arguments or returned normally.

Structures are preferred for basic compound data types that do not
need to be instanced and are often used as a way of generalizing code.

Structures are subject to [object scoping].

<dl class="syn"><dt>StructureDefinition</dt><dd>

`struct` [Identifier] [StructureFlag]* `{` [StructureContent]* `}`
`;`?

</dd></dl>

<!-- toc -->

## Structure Flags

| Keyword      | Description
| :------      | :----------
| `clearScope` | Structure has Data scope. Default.
| `native`     | Structure is from the engine. Only usable internally.
| `play`       | Structure has Play scope.
| `ui`         | Structure has UI scope.
| `version`    | Restricted to the given ZScript version or higher.

<dl class="syn"><dt>StructureFlag</dt><dd>

* `clearScope`
* `native`
* `play`
* `ui`
* `version` `(` [StringLiteral] `)`

</dd></dl>

## Structure Contents

<dl class="syn"><dt>StructureContent</dt><dd>

* [MemberDeclaration]
* [MethodDefinition]
* [EnumerationDefinition]
* [ConstantDefinition]

</dd></dl>

## Examples

### Structure Definitions

```zsc
// Simple structure.
struct MyCoolStructure
{
	int X;
	int Y;
	int Z;
}
```

[object scoping]: ../Concepts/ObjectScoping.md

[ConstantDefinition]: Constants.md#constant-definitions
[EnumerationDefinition]: Enumerations.md#enumeration-definitions
[Identifier]: Fundamentals.md#identifiers
[MemberDeclaration]: Members.md#member-declarations
[MethodDefinition]: Methods.md#method-definitions
[StringLiteral]: Fundamentals.md#string-literals

[StructureContent]: #structure-contents
[StructureFlag]: #structure-flags
