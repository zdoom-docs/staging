# Class Definitions

A class defines an object type within ZScript, and is most of what
you'll be creating within the language.

All classes inherit from other classes. The base class can be set
within the class header, but if it is not the class will automatically
inherit from `Object`.

Classes are subject to [object scoping]. They are also implicitly
reference values, and therefore can be null.

`new` is used to instantiate a new instance of a class.

Classes that inherit from Actor can replace other actors when spawned
in maps, and can also be used freely in DECORATE.

The rest of the translation unit can be used as class content. Note
that with this syntax you cannot use include directives afterward.

If the class is defined within the same archive as the current file,
then one can continue a class definition by using `extend`.

<dl class="syn"><dt>ClassDefinition</dt><dd>

* [ClassHeader] `{` [ClassContent]* `}`
* [ClassHeader] `;` [ClassContent]*

</dd><dt>ClassHeader</dt><dd>

* `class` [Identifier] (`:` [Identifier]) [ClassDefinitionFlag]*
* `extend` `class` [Identifier]

</dd></dl>

<!-- toc -->

## Class Definition Flags

| Keyword    | Description
| :------    | :--
| `abstract` | Cannot be instantiated with `new`.
| `native`   | Class is from the engine. Only usable internally.
| `play`     | Class has Play scope.
| `replaces` | Replaces another class with this class. Only works with descendants of `Actor`.
| `ui`       | Class has UI scope.
| `version`  | Restricted to ZScript version `ver` or higher.

<dl class="syn"><dt>ClassDefinitionFlags</dt><dd>

* `abstract`
* `native`
* `play`
* `replaces` [Identifier]
* `ui`
* `version` `(` [StringLiteral] `)`

</dd></dl>

## Class Contents

<dl class="syn"><dt>ClassContent</dt><dd>

* [ConstantDefinition]
* [DefaultBlock]
* [EnumerationDefinition]
* [FlagDefinition]
* [MemberDeclaration]
* [MethodDefinition]
* [PropertyDefinition]
* [StateBlock]
* [StructureDefinition]

</dd></dl>

## Property Definitions

Property definitions are used within classes to define defaultable
attributes on `Actor`s. They are not valid on classes not derived from
`Actor`.

When registered, a property will be available in the `default` block
as `ClassName.PropertyName`. Properties can be given multiple members
to initialize.

Properties defined in ZScript are usable from DECORATE.

<dl class="syn"><dt>PropertyDefinition</dt><dd>

`property` [Identifier] `:` [Identifier] (`,` [Identifier])* `;`

</dd></dl>

## Flag Definitions

<span class="label purple">3.7.0+</span>

Flag definitions are used within classes to define defaultable boolean
flags on actors. They are not valid on classes not derived from Actor.

When registered, a flag will be available in the `default` block as
`ClassName.FlagName`, as well as a member as `bFlagName`.

Each flag operates on a singular bit of any integer member of the
class. The integer must be exactly 32 bits, though if it is signed or
not does not matter. This means each backing integer can hold exactly
32 flags each (assuming no duplicated flags,) and more will require
another one to be added. (Internally, the `Actor` flags are currently
up to over 8 backing integers.)

A flag's backing integer may not be `meta`, although it may be
`readOnly`, `private`, or any other access modifier. The generated
flag member will be publicly visible regardless of the backing
integer's visibility.

Flags defined in ZScript are usable from DECORATE.

<dl class="syn"><dt>FlagDefinition</dt><dd>

`flagDef` [Identifier] `:` [Identifier] `,` [IntegerLiteral] `;`

</dd></dl>

## Default Blocks

Default blocks are used on classes derived from Actor to create an
overridable list of defaults to properties, allowing for swift
creation of flexible actor types.

In DECORATE, this is everything that isn't in the `states` block, but
in ZScript, for syntax flexibility purposes, it must be enclosed in a
block with `default` at the beginning.

<dl class="syn"><dt>DefaultBlock</dt><dd>

`default` `{` [DefaultDefinition]* `}`

</dd><dt>DefaultDefinition</dt><dd>

* [DefaultFlag]
* [DefaultProperty]

</dd><dt>DefaultFlag</dt><dd>

+ [Identifier] `;`?
- [Identifier] `;`?

</dd><dt>DefaultProperty</dt><dd>

* [Identifier] (`.` [Identifier])? [ConstantExpression] `;`
* [DefaultSpecialProperty] `;`
* `DamageFunction` [Expression] `;`

</dd></dl>

### Default Special Properties

There are several special properties which add pre-defined flag sets
onto the actor:

| Keyword      | Description
| :------      | :--
| `ClearFlags` | Clears all flags except `ARGSDEFINED`.
| `Monster`    | Adds the flags `SHOOTABLE COUNTKILL SOLID PUSHWALL MCROSS PASSMOBJ ISMONSTER CANUSEWALLS`.
| `Projectile` | Adds the flags `NOBLOCKMAP NOGRAVITY DROPOFF MISSILE IMPACT PCROSS NOTELEPORT`, and if the game is Heretic or Hexen, `BLOODSPLATTER`.

<dl class="syn"><dt>DefaultSpecialProperty</dt><dd>

* `ClearFlags`
* `Monster`
* `Projectile`

</dd></dl>

## State Blocks

These are the same as DECORATE, but states that do not have function
blocks require terminating semicolons. Double quotes around `#` and
`-` are no longer required. State blocks can be subject to [action
scoping] if explicitly specified.

<dl class="syn"><dt>StateBlock</dt><dd>

`states` (`(` [ActionScope] (`,` [ActionScope])* `)`)? `{`
[StateDefinition] `}`

</dd><dt>StateDefinition</dt><dd>

* [Identifier] `:`
* [Character]{4} [Character]+ [StateTime] [StateOption]* [StateFunction]

</dd><dt>StateTime</dt><dd>

* [IntegerLiteral]
* `random` `(` [IntegerLiteral] `,` [IntegerLiteral] `)`

</dd><dt>StateOption</dt><dd>

* `bright`
* `fast`
* `slow`
* `noDelay`
* `canRaise`
* `offset` `(` [IntegerLiteral] `,` [IntegerLiteral] `)`
* `light` `(` [StringLiteral] (`,` [StringLiteral])* `)`

</dd></dl>

### State Functions

You may attach no action function to the state. You can also attach a
function with the specified arguments, or create an anonymous action
function and attach it.

<dl class="syn"><dt>StateFunction</dt><dd>

* `;`
* [Identifier] `(` [ArgumentList]? `)` `;`
* `{` [Statement]* `}`

</dd></dl>

## Examples

### Class Headers

```csharp
// Automatically inherits Object, similar to the "actor" keyword in DECORATE.
class MyCoolObject
{
}
```

```csharp
// Equivalent to the above.
class MyCoolObjectExplicit : Object
{
}
```

```csharp
// Has "Play" scope.
class MyCoolScopedObject play
{
}
```

```csharp
// Inherits Thinker and can override functions on it.
class MyCoolThinker : Thinker
{
}
```

```csharp
// Some actor.
class OtherActor : Actor
{
}
```

```csharp
// Replaces "OtherActor."
class MyCoolActor : Actor replaces OtherActor
{
}
```

```csharp
// Can only be inherited.
class MyCoolInterface abstract
{
}
```

### Class Definitions

```csharp
// Basic class definition with a member variable and member function.
class BasicClass
{
	// "m_Thing" is attached to any "instance" of BasicClass.
	int m_Thing;

	// Changes "m_Thing" to 500 on an instance of BasicClass.
	void ChangeThing()
	{
		m_Thing = 500;
	}
}
```

```csharp
// Alternate syntax usage.
// This class spans from this point to the end of the file.
class TheWholeFileIsAClassOhNo;

int m_MyMember;

// End of file, end of class.
```

### Property Definitions

```csharp
// A class with some properties.
class MyCoolActor : Actor
{
	// You can set defined properties in a "default" block like in DECORATE.
	// This will also be available in DECORATE code that inherits your class!
	default
	{
		MyCoolActor.MyCoolMember 5000;
		MyCoolActor.MyCoolMemberList 501, 502;
	}

	// Declare some members.
	int m_MyCoolMember;
	int m_CoolMember1, m_CoolMember2;

	// Declare some properties attached to our members.
	property MyCoolMember: m_MyCoolMember;
	property MyCoolMemberList: m_CoolMember1, m_CoolMember2;
}
```

### Flag Definitions

```csharp
// A class with some flags.
class MyCoolActorWithFlags : Actor
{
	// You can set defined flag in a "default" block like in DECORATE.
	// This will also be available in DECORATE code that inherits your class!
	// Hey, those sentences sounded familiar...
	default
	{
		+MyCoolActorWithFlags.ThisOneIsOn
		-MyCoolActorWithFlags.ThisOneIsOff
	}

	// Declare a flag field for all of the flags. This can hold up to 32 flags.
	int m_Flags;

	// Declare the flags, one at a time...
	flagDef ThisOneIsOn: m_Flags, 0;
	flagDef ThisOneIsOff: m_Flags, 1;
	flagDef ThisOneAliasesOn: m_Flags, 0;

	// Unnecessary, since you can just access it directly, but this demonstrates
	// how declared flags can be used in methods.
	bool CheckIfOnIsOn()
	{
		return bThisOneIsOn;
	}
}
```

[action scoping]: ../Concepts/ActionScoping.md
[object scoping]: ../Concepts/ObjectScoping.md

[ActionScope]: Methods.md#action-scopes
[ArgumentList]: Expressions.md#argument-lists
[Character]: Fundamentals.md#character-types
[ConstantDefinition]: Constants.md#constant-definitions
[ConstantExpression]: Expressions.md#constant-expressions
[EnumerationDefinition]: Enumerations.md#enumeration-definitions
[Expression]: Expressions.md#expressions
[Identifier]: Fundamentals.md#identifiers
[IntegerLiteral]: Fundamentals.md#integer-literals
[MemberDeclaration]: Members.md#member-declarations
[MethodDefinition]: Methods.md#method-definitions
[Statement]: Statements.md#statements
[StringLiteral]: Fundamentals.md#string-literals
[StructureDefinition]: Structures.md#structure-definitions

[ClassContent]: #class-contents
[ClassDefinitionFlag]: #class-definition-flags
[ClassHeader]: #class-definitions
[DefaultBlock]: #default-blocks
[DefaultDefinition]: #default-blocks
[DefaultFlag]: #default-blocks
[DefaultProperty]: #default-blocks
[DefaultSpecialProperty]: #default-special-properties
[FlagDefinition]: #flag-definitions
[PropertyDefinition]: #property-definitions
[StateBlock]: #state-blocks
[StateDefinition]: #state-blocks
[StateFunction]: #state-functions
[StateOption]: #state-blocks
[StateTime]: #state-blocks
