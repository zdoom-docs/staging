# Enumeration Definitions

An enumeration is a list of named numbers. By default they decay to
the type `int`, but the default decay type can be set manually.

<dl class="syn"><dt>EnumerationDefinition</dt><dd>

`enum` [Identifier] (`:` [IntegerType])? `{` [EnumeratorList] `,`? `}`
`;`?

</dd></dl>

<!-- toc -->

## Enumerator Lists

<dl class="syn"><dt>EnumeratorList</dt><dd>

* [Enumerator]
* [EnumeratorList] `,` [Enumerator]

</dd></dl>

## Enumerators

Enumerators can either be incremental &mdash; from the last
enumerator, or 0 if there is none &mdash; or explicitly set.

<dl class="syn"><dt>Enumerator</dt><dd>

[Identifier] (`=` [ConstantExpression])?

</dd></dl>

## Examples

### Enumeration Definitions

```zsc
// Basic enumeration.
enum MyCoolEnum
{
	A_THING, // Has value int(0) ...
	BEES, // ... 1 ...
	CALCIUM, // ... 2 ...
	DEXTROSE, // ... and 3.
}
```

```zsc
// Less trivial example.
enum MyCoolerEnum : int16
{
	A = 500, // Has value int16(500),
	B, // 501,
	C = 200,
	D, // 201,
	E, // and 202.
}
```

[ConstantExpression]: Expressions.md#constant-expressions
[Identifier]: Fundamentals.md#identifiers
[IntegerType]: Types.md#integer-types

[EnumeratorList]: #enumerator-lists
[Enumerator]: #enumerators
