# Member Declarations

Member declarations define data within a structure or class that can
be accessed either within methods of the object or its derived
classes, or indirectly from instances of it with the member access
operator.

<dl class="syn"><dt>MemberDeclaration</dt><dd>

[MemberDeclarationFlag]* [Type] [VariableName] (`,` [VariableName])*
`;`

</dd></dl>

<!-- toc -->

## Member Declaration Flags

| Keyword      | Description
| :------      | :--
| `deprecated` | If accessed, a script warning will occur on load if the archive version is greater than the version specified, with the optional reason specified in the message.
| `internal`   | Member is only writable from the base resource archive. *Version 3.4.0 and newer.*
| `latent`     | Does nothing. Purpose unknown.
| `meta`       | Member is read-only static class data. Only really useful on actors, since these can be set via properties on them.
| `native`     | Member is from the engine. Only usable internally.
| `play`       | Member has Play scope.
| `private`    | Member is not visible to any class but this one.
| `protected`  | Member is not visible to any class but this one and any descendants of it.
| `readOnly`   | Member is not writable, but is part of instances, rather than static class data.
| `transient`  | Member is not saved into save games. Required for unserializable objects and recommended for UI context objects.
| `ui`         | Member has UI scope.
| `version`    | Restricted to ZScript version `ver` or higher.

<dl class="syn"><dt>MemberDeclarationFlag</dt><dd>

* `deprecated` `(` [StringLiteral] (`,` [StringLiteral])? `)`
* `internal`
* `latent`
* `meta`
* `native`
* `play`
* `private`
* `protected`
* `readOnly`
* `transient`
* `ui`
* `version` `(` [StringLiteral] `)`

</dd></dl>

## Examples

### Member Declarations

```zsc
// An integer. Visible to and modifiable by everything.
int m_MyCoolInt;
```

```zsc
// Three separate integers, defined short-hand.
int m_CoolInt1, m_CoolInt2, m_CoolInt3;
```

```zsc
// Ten integers in one variable.
int[10] m_CoolIntArray;
```

```zsc
// Can only be seen by this type.
private int m_CoolPrivateInt;
```

```zsc
// Read-only; part of the class data, can only be seen by descendant types.
protected meta int m_CoolMetaInt;
```

[StringLiteral]: Fundamentals.md#string-literals
[Type]: Types.md#types
[VariableName]: Types.md#variable-names

[MemberDeclarationFlag]: #member-declaration-flags
