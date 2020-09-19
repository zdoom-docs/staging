# Statements

All functions are made up of a list of statements enclosed with left
and right braces, which in and of itself is a statement called a
*compound statement*, or *block*.

<dl class="syn"><dt>Statement</dt><dd>

* [CompoundStatement]
* [ConditionalStatement]
* [FlowStatement]
* [ExpressionStatement]
* [LocalVariableStatement]
* [LoopStatement]
* [MultiAssignmentStatement]
* [NullStatement]
* [StaticArrayDefinition]
* [SwitchStatement]

</dd></dl>

<!-- toc -->

## Compound Statements

Note that the statement list is zero or more, so an empty compound
statement `{}` is entirely valid.

<dl class="syn"><dt>CompoundStatement</dt><dd>

`{` [Statement]* `}`

</dd></dl>

## Expression Statements

An expression statement is the single most common type of statement in
just about any programming language. In ZScript, exactly like C and
C++, an expression statement is simply formed with any expression
followed by a semicolon. Function calls and variable assignments are
expressions, for instance, so it is quite clear why they are common.

<dl class="syn"><dt>ExpressionStatement</dt><dd>

[Expression] `;`

</dd></dl>

## Conditional Statements

A conditional statement will, conditionally, choose a statement (or
none) to execute. They work the same as in C, C++, and ACS.

<dl class="syn"><dt>ConditionalStatement</dt><dd>

`if` `(` [Expression] `)` [Statement] (`else` [Statement])?

</dd></dl>

## Switch Statements

A switch statement takes an expression of integer or name type and
selects a labeled statement to run. They work the same as in C, C++,
and ACS.

<dl class="syn"><dt>SwitchStatement</dt><dd>

`switch` `(` [Expression] `)` [Statement]

</dd></dl>

## Loop Statements

ZScript has five loop statements: `for`, `while`, `until`, `do while`
and `do until`. `for`, `while` and `do while` work the same as in C,
C++ and ACS, and `until` and `do until` do the inverse of `while` and
`do while`.

<dl class="syn"><dt>LoopStatement</dt><dd>

* [ForLoopStatement]
* [WhileLoopStatement]
* [DoWhileLoopStatement]

</dd></dl>

### For Loop Statements

The `for` loop takes a limited statement and two optional expressions:
The statement for when the loop begins (which is scoped to the loop,)
one expression for checking if the loop should break, and one which is
executed every time the loop iterates.

<dl class="syn"><dt>ForLoopStatement</dt><dd>

`for` `(` [ForLoopInitializer]? `;` [Expression]? `;` [Expression]?
`)` [Statement]

</dd><dt>ForLoopInitializer</dt><dd>

* [Expression]
* [LocalVariableStatement]

</dd></dl>

### While Loop Statements

The `while` loop simply takes one expression for checking if the loop
should break, equivalent to `for(; x;)`.

The `until` loop is equivalent to `while(!x)`.

<dl class="syn"><dt>WhileLoopStatement</dt><dd>

* `while` `(` [Expression] `)` [Statement]
* `until` `(` [Expression] `)` [Statement]

</dd></dl>

### Do While Loop Statements

`do while` and `do until` will only check the expression after the
first iteration is complete. Unlike C, you don't need a semicolon
after one.

<dl class="syn"><dt>DoWhileLoopStatement</dt><dd>

* `do` [Statement] `while` `(` [Expression] `)`
* `do` [Statement] `until` `(` [Expression] `)`

</dd></dl>

## Flow Statements

As in C, there are three control flow statements that manipulate where
the program will execute statements next, which are available
contextually. They are `continue`, `break` and `return`.

<dl class="syn"><dt>FlowStatement</dt><dd>

* [ContinueFlowStatement]
* [BreakFlowStatement]
* [ReturnFlowStatement]

</dd></dl>

### Continue Flow Statements

`continue` is available in loop statements and will continue to the
next iteration immediately.

<dl class="syn"><dt>ContinueFlowStatement</dt><dd>

`continue` `;`

</dd></dl>

### Break Flow Statements

`break` is available in loop statements and switch statements, and
will break out of the containing statement early.

<dl class="syn"><dt>BreakFlowStatement</dt><dd>

`break` `;`

</dd></dl>

### Return Flow Statements

`return` is available in functions. If the function does not return
any values, it may have no expressions, and will simply exit the
function early. If the function does return values, it takes a
comma-separated list for each expression returned.

<dl class="syn"><dt>ReturnFlowStatement</dt><dd>

`return` ([Expression] (`,` [Expression])*)? `;`

</dd></dl>

## Local Variable Statements

Local variable statements are formed in one of 2 ways. The `let`
keyword can be used to automatically determine the type of the
variable from the initializer, while the regular syntax uses an
explicit type, and initialization is optional.

<dl class="syn"><dt>LocalVariableStatement</dt><dd>

* `let` [Identifier] `=` [Expression] `;`
* [Type] [LocalVariableInitializer] (`,`
  [LocalVariableInitializer])* `;`

</dd><dt>LocalVariableInitializer</dt><dd>

* [VariableName]
* [VariableName] `=` [Expression]

</dd></dl>

## Multi-Assignment Statements

Expressions or functions that return multiple values can be assigned
into multiple variables.

<dl class="syn"><dt>MultiAssignmentStatement</dt><dd>

`[` [Expression] (`,` [Expression])* `]` `=` [Expression] `;`

</dd></dl>

## Null Statements

A null statement does nothing. It is similar to an empty compound
statement.

<dl class="syn"><dt>NullStatement</dt><dd>

`;`

</dd></dl>

## Examples

### Expression Statements

```csharp
// Some basic expressions.
MyCoolFunction(5, 4);
m_MyCoolMember = 500;
```

```csharp
// Does nothing, of course, but valid.
5 * 5;
```

### Conditional Statements

```csharp
// Simple conditional.
if(a)
	B();
```

```csharp
// Simple conditional, with else statement and a block.
if(a)
{
	B();
	c = d;
}
else
	e = f;
```

### Switch Statements

```csharp
// A switch demonstrating fall-through and default cases.
switch(a)
{
case 500:
	Console.PrintF("a is 500");
	break;
case 501:
	Console.PrintF("a is 501");
	// Falls through to the next case.
case 502:
	Console.PrintF("a is 501 or 502");
	break;
default:
	Console.PrintF("not sure what a is!");
	// "break" is implied here.
}
```

### Flow Statements

```csharp
// Use of "continue."
for(int i = 0; i < 50; i++)
{
	// Don't do anything when "i" is 25.
	if(i == 25)
		continue;

	DoThing(i);
}
```

```csharp
// Use of "break."
for(int i = 0; i < 50; i++)
{
	// "break" when "i" is 25.
	if(i == 25)
		break;

	DoThing(i);
}
```

```csharp
// Use of `return` in various contexts.
void ReturnsNothing()
{
	// Exit early if "m_Thing" isn't 50.
	if(m_Thing != 50)
		return;

	DoThing(m_Thing);
}
```

```csharp
int ReturnsInt()
{
	// "m_Thing" is 50, so return 50.
	if(m_Thing == 50)
		return 50;

	// Must have a return, eventually.
	return 0;
}
```

```csharp
int, int ReturnsTwoInts()
{
	// Returns 1 and 2.
	return 1, 2;
}
```

### Multi-Assignment Statements

```csharp
// Getting the actor out of "A_SpawnItemEx."
Actor mo; bool spawned; [spawned, mo] = A_SpawnItemEx("MyCoolActor");
```

[Expression]: Expressions.md#expressions
[Identifier]: Fundamentals.md#identifiers
[StaticArrayDefinition]: Constants.md#static-array-definitions
[Type]: Types.md#types
[VariableName]: Types.md#variable-names

[BreakFlowStatement]: #break-flow-statements
[CompoundStatement]: #compound-statements
[ConditionalStatement]: #conditional-statements
[ContinueFlowStatement]: #continue-flow-statements
[DoWhileLoopStatement]: #do-while-loop-statements
[ExpressionStatement]: #expression-statements
[FlowStatement]: #flow-statements
[ForLoopInitializer]: #for-loop-statements
[ForLoopStatement]: #for-loop-statements
[LocalVariableInitializer]: #local-variable-statements
[LocalVariableStatement]: #local-variable-statements
[LoopStatement]: #loop-statements
[MultiAssignmentStatement]: #multi-assignment-statements
[NullStatement]: #null-statements
[ReturnFlowStatement]: #return-flow-statements
[Statement]: #statements
[SwitchStatement]: #switch-statements
[WhileLoopStatement]: #while-loop-statements
