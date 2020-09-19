# Expressions

Expressions contain literals or other such *expressions* of objects,
including arithmetic and various conditions.

<dl class="syn"><dt>Expression</dt><dd>

* [PrimaryExpression]
* [PostfixExpression]
* [UnaryExpression]
* [BinaryExpression]
* [TernaryExpression]

</dd></dl>

<!-- toc -->

## Constant Expressions

Constant expressions are expressions that do not contain mutation of
state or function calls. We define them simply as expressions.

<dl class="syn"><dt>ConstantExpression</dt><dd>

[Expression]

</dd></dl>

## Primary Expressions

Primary expressions can be one of:

* An identifier for a constant or variable.
* The `super` keyword, which references the parent type.
* Any literal.
* A vector literal.
* An expression in parentheses.

<dl class="syn"><dt>PrimaryExpression</dt><dd>

* [Identifier]
* `super`
* [Literal]
* [VectorLiteralExpression]
* [ColorLiteralExpression]
* `(` [Expression] `)`

</dd></dl>

### Vector Literal Expressions

Vector literals are not under object literals as they are not
constants in the same manner as other literals, since they contain
expressions within them. As such, they are expressions, not proper
value-based literals.

Literals of `vector3` may be made by either grammar. In the former
grammar, the first expression (`X1`) must be a `vector2` and the
second (`X2`) must be a `double`. It will be equivalent to `(X1.X,
X1.Y, X2)`. In any other case, all expressions must be `double`.

<dl class="syn"><dt>VectorLiteralExpression</dt><dd>

* `(` [Expression] `,` [Expression] `)`
* `(` [Expression] `,` [Expression] `,` [Expression] `)`

</dd></dl>

### Color Literal Expressions

Much like vector literals, color literals are not "real" literals,
since they contain expressions. Color literals may be either RGB
(where alpha is implied to be maximum) or RGBA. The three (or four)
expressions must be `int`.

<dl class="syn"><dt>ColorLiteralExpression</dt><dd>

`color` `(` [Expression] `,` [Expression] `,` [Expression] (`,`
[Expression])? `)`

</dd></dl>

## Postfix Expressions

Postfix expressions are affixed at the end of an expression, and are
used for a large variety of things, although the actual amount of
postfix expressions is small.

The postfix expressions are:

* Function call.
* Type cast.
* Class type reference cast.
* Array access.
* Member access.
* Post-increment, which increments the object *after* the expression
  is evaluated.
* Post-decrement, which decrements the object *after* the expression
  is evaluated.

<dl class="syn"><dt>PostfixExpression</dt><dd>

* [Expression] `(` [ArgumentList]? `)`
* [Type] `(` [Expression] `)`
* `(` `class` `<` [Type] `>` `)` `(` [Expression] `)`
* [Expression] `[` [Expression] `]`
* [Expression] `.` [Identifier]
* [Expression] `++`
* [Expression] `--`

</dd></dl>

### Argument Lists

Function calls may name arguments which have defaults, possibly
skipping over other defaulted arguments. After the first named
defaultable argument, all other arguments must be named as well.

<dl class="syn"><dt>ArgumentList</dt><dd>

[Expression] (`,` [Expression])* (`,` [Identifier] `:` [Expression])*

</dd></dl>

## Unary Expressions

Unary expressions are affixed at the beginning of an expression. The
simplest example of a unary expression is the negation operator, `-`,
as in `-500`.

The unary expressions are:

* Negation.
* Logical negation.
* Pre-increment, which increments the object *before* the expression
  is evaluated.
* Pre-decrement, which decrements the object *before* the expression
  is evaluated.
* Bit-wise negation. Flips all bits in an integer.
* Affirmation. Doesn't actually do anything.
* Alignment of a type of an expression.
* Size of a type of an expression.

<dl class="syn"><dt>UnaryExpression</dt><dd>

* `-` [Expression]
* `!` [Expression]
* `++` [Expression]
* `--` [Expression]
* `~` [Expression]
* `+` [Expression]
* `alignOf` [Expression]
* `sizeOf` [Expression]

</dd></dl>

## Binary Expressions

Binary expressions operate on two expressions, and are the most common
kind of expression. They are used inline like regular math syntax,
i.e. `1 + 1`.

<dl class="syn"><dt>BinaryExpression</dt><dd>

* [ArithmeticExpression]
* [VectorExpression]
* [ConcatenationExpression]
* [ComparisonExpression]
* [LazyBooleanExpression]
* [TypeComparisonExpression]
* [SignedDifferenceExpression]
* [LogicalExpression]
* [ScopeExpression]
* [AssignmentExpression]

</dd></dl>

### Arithmetic Expressions

The arithmetic expressions are:

* Addition.
* Subtraction.
* Multiplication.
* Division quotient.
* Division remainder, also known as "modulus." Unlike C, this works on
  floats, too.
* Exponentation.
* Left bit-wise shift.
* Right bit-wise shift.
* Right unsigned bit-wise shift.

<dl class="syn"><dt>ArithmeticExpression</dt><dd>

* [Expression] `+` [Expression]
* [Expression] `-` [Expression]
* [Expression] `*` [Expression]
* [Expression] `/` [Expression]
* [Expression] `%` [Expression]
* [Expression] `**` [Expression]
* [Expression] `<<` [Expression]
* [Expression] `>>` [Expression]
* [Expression] `>>>` [Expression]

</dd></dl>

### Vector Expressions

The vector expressions are:

* Vector cross-product.
* Vector dot-product.

<dl class="syn"><dt>VectorExpression</dt><dd>

* [Expression] `cross` [Expression]
* [Expression] `dot` [Expression]

</dd></dl>

### Concatenation Expressions

Concatenation creates a string from two expressions.

The following basic types may be cast to strings through
concatenation:

* Only `int` and `uint` of [IntegerType]
* [FloatingPointType]
* [VectorType]
* [NameType]
* [StringLikeReferenceType] except `stateLabel`
* [ColorType]
* [IntegerLikeReferenceType]
* [NativePointerType]

<dl class="syn"><dt>ConcatenationExpression</dt><dd>

* [Expression] `..` [Expression]

</dd></dl>

### Comparison Expressions

The comparison expressions are:

* Less than.
* Greater than.
* Less than or equal.
* Greater than or equal.
* Equality.
* Inequality.
* Approximate equality. For strings, this is a case-insensitive
  comparison. For floats and vectors, this checks if the difference
  between the two expressions is smaller than ε.

<dl class="syn"><dt>ComparisonExpression</dt><dd>

* [Expression] `<` [Expression]
* [Expression] `>` [Expression]
* [Expression] `<=` [Expression]
* [Expression] `>=` [Expression]
* [Expression] `==` [Expression]
* [Expression] `!=` [Expression]
* [Expression] `~==` [Expression]

</dd></dl>

### Lazy Boolean Expressions

Lazy boolean expressions evaluate the left and right hand side
expressions separately.

The first, logical and, will only evaluate the right hand side if the
left hand side is `true`, and will evaluate to `true` if both
expressions are `true`.

The second, logical or, will only evaluate the right hand side if the
left hand side is `false`, and will evaluate to `true` if either
expression is `true`.

<dl class="syn"><dt>LazyBooleanExpression</dt><dd>

* [Expression] `&&` [Expression]
* [Expression] `||` [Expression]

</dd></dl>

### Type Comparison Expressions

Logical type equality. Will check if the type of the left hand side is
equal to or a descendant of the right hand side.

<dl class="syn"><dt>TypeComparisonExpression</dt><dd>

* [Expression] `is` [Expression]

</dd></dl>

### Signed Difference Expressions

Signed difference. Will return `-1` if the left hand side is lesser
than the right hand side, `0` if they are equal, and `1` if the left
hand side is greater than the right hand side.

<dl class="syn"><dt>SignedDifferenceExpression</dt><dd>

* [Expression] `<>=` [Expression]

</dd></dl>

### Logical Expressions

The logical expressions are:

* Bit-wise and.
* Bit-wise exclusive or.
* Bit-wise or.

<dl class="syn"><dt>LogicalExpression</dt><dd>

* [Expression] `&` [Expression]
* [Expression] `^` [Expression]
* [Expression] `|` [Expression]

</dd></dl>

### Scope Expressions

Not implemented. Will simply cause a compiler error.

<dl class="syn"><dt>ScopeExpression</dt><dd>

* [Expression] `::` [Expression]

</dd></dl>

### Assignment Expressions

Assignment expressions are a subset of binary expressions which *are
never constant expressions*. They assign a value to another value.

Besides the normal assignment operation, there are assignment
operations for assigning the result of arithmetic expressions and
logical expressions.

<dl class="syn"><dt>AssignmentExpression</dt><dd>

* [Expression] `=` [Expression]
* [Expression] `+=` [Expression]
* [Expression] `-=` [Expression]
* [Expression] `*=` [Expression]
* [Expression] `/=` [Expression]
* [Expression] `%=` [Expression]
* [Expression] `<<=` [Expression]
* [Expression] `>>=` [Expression]
* [Expression] `>>>=` [Expression]
* [Expression] `|=` [Expression]
* [Expression] `&=` [Expression]
* [Expression] `^=` [Expression]

</dd></dl>

## Ternary Expressions

The ternary expression will evaluate to the left hand side if the
expression is `true`, or the right hand side if it is `false`.

<dl class="syn"><dt>TernaryExpression</dt><dd>

[Expression] `?` [Expression] `:` [Expression]

</dd></dl>

[ColorType]: Types.md#color-types
[FloatingPointType]: Types.md#floating-point-types
[Identifier]: Fundamentals.md#identifiers
[IntegerLikeReferenceType]: Types.md#integer-like-reference-types
[IntegerType]: Types.md#integer-types
[Literal]: Fundamentals.md#literals
[NameType]: Types.md#name-types
[NativePointerType]: Types.md#native-pointer-types
[NativePointerType]: Types.md#native-pointer-types
[StringLikeReferenceType]: Types.md#string-like-reference-types
[Type]: Types.md#types
[VectorType]: Types.md#vector-types

[ArgumentList]: #argument-lists
[ArithmeticExpression]: #arithmetic-expressions
[AssignmentExpression]: #assignment-expressions
[BinaryExpression]: #binary-expressions
[ColorLiteralExpression]: #color-literal-expressions
[ComparisonExpression]: #comparison-expressions
[ConcatenationExpression]: #concatenation-expressions
[Expression]: #expressions
[LazyBooleanExpression]: #lazy-boolean-expressions
[LogicalExpression]: #logical-expressions
[PostfixExpression]: #postfix-expressions
[PrimaryExpression]: #primary-expressions
[ScopeExpression]: #scope-expressions
[SignedDifferenceExpression]: #signed-difference-expressions
[TernaryExpression]: #ternary-expressions
[TypeComparisonExpression]: #type-comparison-expressions
[UnaryExpression]: #unary-expressions
[VectorExpression]: #vector-expressions
[VectorLiteralExpression]: #vector-literal-expressions
