# Constant Definitions

Constants are simple named values. Constants are not assignable. Their
type is inferred from their value, so if you wish for them to have a
specific type, you must cast the value to that type.

<dl class="syn"><dt>ConstantDefinition</dt><dd>

* `const` [Identifier] `=` [ConstantExpression] `;`
* [StaticArrayDefinition]

</dd></dl>

<div class=toc>
<!-- toc -->
</div>

## Static Array Definitions

Similar to constants, static arrays are named values, but for an
array. Static arrays cannot be multi-dimensional, unlike normal
fixed arrays.

<dl class="syn"><dt>StaticArrayDefinition</dt><dd>

`static` `const` [Type] [VariableName] `=` `{` ([ConstantExpression]
(`,` [ConstantExpression])*)? `}` `;`

</dd></dl>

## Examples

### Constant Definitions

```csharp
// Making a regular integer constant.
const MY_COOL_NUMBER = 777;
```

```csharp
// Making an integer constant from a double.
const MY_COOL_NUMBER_FROM_BEYOND = int(777.7777);
```

### Static Array Definitions

```csharp
// Making an array of integers.
static const int MY_COOL_INTEGERS[] = { 0, 1, 2, 3 };
```

[ConstantExpression]: Expressions.md#constant-expressions
[Identifier]: Fundamentals.md#identifiers
[Type]: Types.md#types
[VariableName]: Types.md#variable-names

[StaticArrayDefinition]: #static-array-definitions
