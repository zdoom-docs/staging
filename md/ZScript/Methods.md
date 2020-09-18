# Method Definitions

Method definitions define functions within a structure or class that
can be accessed directly within either other methods of the object or
its derived classes, or indirectly from instances of it with the
member access operator.

Methods marked as `virtual` may have their functionality overridden by
derived classes, and in those overrides one can use the `Super`
keyword to call the parent function.

If `const` is placed after the function signature and before the
function body, the method will not be allowed to modify any members in
the object instance it's being called on.

The keyword `void` can be used in place of the return type (or type
list) to have a method which does not have any return value.
Similarly, one can place `void` where the argument list might be,
although this is redundant as having no argument list at all is
allowed.

Arguments of methods may only be of certain types due to technical
limitations. See the type table for a list of which are usable and
which are not.

All methods which are not `static` have an implicit `self` parameter
which refers to this object, although if you wish to refer to a member
of `self`, you do not need to reference it directly, as it is already
implicitly in scope.

<dl class="syn"><dt>MethodDefinition</dt><dd>

[MethodDeclarationFlag]* [Type] (`,` [Type])* [Identifier] `(`
[MethodArgumentListOrVoid]? `)` `const`? `{` [Statement]* `}`

</dd></dl>

<div class=toc>
<!-- toc -->
</div>

## Method Argument Lists

Method arguments must all have a name and type, and optionally the
last arguments in the list may have a default value, <span
class="label purple">3.3.0+</span> unless the function is marked
`override`.

<dl class="syn"><dt>MethodArgumentList</dt><dd>

* [Type] [VariableName] (`,` [MethodArgumentList])*
* [Type] [VariableName] `=` [ConstantExpression] (`,`
  [MethodArgumentList])*

</dd><dt>MethodArgumentListOrVoid</dt><dd>

* [MethodArgumentList]
* `void`

</dd></dl>

## Method Declaration Flags

| Keyword        | Description
| :------        | :----------
| `action`       | Method may have implicit `invoker` and `stateinfo` parameters.
| `clearScope`   | Method has Data scope.
| `deprecated`   | If accessed, a script warning will occur on load if the archive version is greater than `ver`, with the reason `reason` specified in the message.
| `final`        | Virtual method cannot be further overridden from derived classes.
| `native`       | Method is from the engine. Only usable internally.
| `override`     | Method is overriding a base class' virtual method.
| `play`         | Method has Play scope.
| `private`      | Method is not visible to any class but this one.
| `protected`    | Method is not visible to any class but this one and any descendants of it.
| `static`       | Function is not a method, but a global function without a `self` pointer.
| `ui`           | Method has UI scope.
| `vararg`       | Method doesn't type-check arguments after `...`. Only usable internally.
| `version`      | Restricted to ZScript version `ver` or higher.
| `virtual`      | Method can be overridden in derived classes.
| `virtualScope` | Method has scope of the type of the object it's being called on.

<dl class="syn"><dt>MethodDeclarationFlag</dt><dd>

* `action` (`(` [ActionScope] (`,` [ActionScope])* `)`)?
* `clearScope`
* `deprecated` `(` [StringLiteral] (`,` [StringLiteral])? `)`
* `final`
* `native`
* `override`
* `play`
* `private`
* `protected`
* `static`
* `ui`
* `vararg`
* `version` `(` [StringLiteral] `)`
* `virtual`
* `virtualScope`

</dd></dl>

### Action Scopes

ZScript includes an extra method type for descendents of `Actor`
called *actions*, which are intended to be run from actor states and
give extra information to the function. Action functions change the
meaning of the `self` parameter and may pass in `invoker` and
`stateinfo` parameters as well. `stateinfo` refers to the `State`
which this action was called from.

Action functions may have any amount of scopes. Actor scope and
un-scoped action functions do not have `invoker` or `stateinfo`
parameters and as such are not often useful.

Here are charts for the meanings of the `self` and `invoker`
parameters under each scope. Scopes lower down on the chart override
the meanings of scopes above them:

| Scope     | `self`
| -----     | ------
| None      | The actor this function operates on, ambiguous in some contexts
| `actor`   | The actor itself
| `item`    | Context-dependent. The item itself when it exists in-world, but the owner of the item when used as part of a state chain.
| `overlay` | Context-dependent. The actor itself when it exists in-world, but the owner of the PSprite when it is being used as one.
| `weapon`  | Same as `overlay`, but `self` is allowed to be any subclass of Actor rather than just a subclass of the defining class

| Scope     | `invoker`
| -----     | ---------
| None      | Not available
| `actor`   | Not available
| `item`    | The item itself
| `overlay` | Context-dependent. The actor itself when it exists in-world, but the PSprite's `caller` field when it is being used as one. In most cases this field should be set to the actor that defined the action function, but it can be changed by user code.
| `weapon`  | Same as `overlay`

<dl class="syn"><dt>ActionScope</dt><dd>

* `actor`
* `item`
* `overlay`
* `weapon`

</dd></dl>

## Examples

### Method argument lists

```csharp
// With the function:
void DoSomething(int one, int two, int a = 0, int b = 0) {}

// One could do the following:
DoSomething(4, 5);
DoSomething(5, 6, 7);
DoSomething(6, 7, 8, 9);

// Or using named default arguments,
DoSomething(5, 6, a: 7);

// Equivalent to:
DoSomething(5, 6, 7);

// And more examples:
DoSomething(6, 7, b: 8);
DoSomething(7, 8, a: 9, b: 10);
DoSomething(7, 8, 9, 10);
```

[^1]: {{#include ../Labels/Todo.md}} Sometimes. In some contexts, the
`self` pointer will not be ambiguous.

[ConstantExpression]: Expressions.md#constant-expressions
[Identifier]: Fundamentals.md#identifiers
[Statement]: Statements.md#statements
[StringLiteral]: Fundamentals.md#string-literals
[Type]: Types.md#types
[VariableName]: Types.md#variable-names

[ActionScope]: #action-scopes
[MethodArgumentListOrVoid]: #method-argument-lists
[MethodArgumentList]: #method-argument-lists
[MethodDeclarationFlag]: #method-declaration-flags
