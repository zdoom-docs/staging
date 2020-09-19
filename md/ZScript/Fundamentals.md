# Fundamentals

These are the fundamental building blocks of ZScript. Included here
are basic syntax elements such as [Identifier]s, and atoms, also known
as [Literal]s.

<!-- toc -->

## Lexical Elements

### Character Types

<dl class="syn"><dt>NewLine</dt><dd>

`\n`

</dd><dt>EOF</dt><dd>

*End of the file*.

</dd><dt>Whitespace</dt><dd>

[NewLine], `` ``, `\t`, `\v`, `\f`, `\r`, [EOF]

</dd><dt>AnyCharacter</dt><dd>

*Any Unicode code-point*.

</dd><dt>Character</dt><dd>

`!`, `"`, `#`, `$`, `%`, `&`, `'`, `(`, `)`, `*`, `+`, `,`, `-`, `.`,
`/`, `0` ... `9`, `:`, `;`, `<`, `=`, `>`, `?`, `@`, `A` ... `Z`, `[`,
`\`, `]`, `^`, `_`, <code>\`</code>, `a` ... `z`, `{`, `|`, `}`, `~`

</dd><dt>Base8Character</dt><dd>

`0` ... `7`

</dd><dt>Base10Character</dt><dd>

`0` ... `9`

</dd><dt>Base16Character</dt><dd>

`a` ... `f`, `A` ... `F`, `0` ... `9`

</dd><dt>Base16Prefix</dt><dd>

`x`, `X`

</dd><dt>IdentifierStartCharacter</dt><dd>

`a` ... `z`, `A` ... `Z`, `_`

</dd><dt>IdentifierCharacter</dt><dd>

* [IdentifierStartCharacter]
* `0` ... `9`

</dd></dl>

### Identifiers

Identifiers are a sequence of contiguous characters that must be
delimited by [Whitespace] or non-identifier characters.

<dl class="syn"><dt>Identifier</dt><dd>

[IdentifierStartCharacter] [IdentifierCharacter]*

</dd></dl>

### Tokens

All text in a file is lexically scanned into *tokens*. Each token is
delimited by either [Whitespace] or another [Token]. For instance:
`> >>=` will parse into two tokens, but `>>>=` will parse into one.
Inversely, `.....` will parse into `...` and then `..`, but `.. ...`
will parse into `..` and `...`. [Identifier]s and [Keyword]s must be
delimited by [Whitespace] or non-[IdentifierCharacter]s.

<dl class="syn"><dt>Token</dt><dd>

* [BlockComment]
* [LineComment]
* [RegionComment]
* [Keyword]
* [Identifier]
* [IntegerLiteral]
* [FloatingPointLiteral]
* [StringLiteral]
* [NameLiteral]
* [Symbol]

</dd></dl>

#### Comments

<dl class="syn"><dt>LineComment</dt><dd>

`//` [AnyCharacter]* [NewLine]

</dd><dt>BlockComment</dt><dd>

`/*` [AnyCharacter]* `*/`

</dd><dt>RegionComment</dt><dd>

* `#region` [AnyCharacter]* [NewLine]
* `#endRegion` [AnyCharacter]* [NewLine]

</dd></dl>

#### Keywords

<dl class="syn"><dt>Keyword</dt><dd>

`break`, `case`, `const`, `continue`, `default`, `do`, `else`, `for`,
`goto`, `if`, `return`, `switch`, `until`, `volatile`, `while`,
`bool`, `float`, `double`, `char`, `byte`, `sbyte`, `short`, `ushort`,
`int8`, `uint8`, `int16`, `uint16`, `int`, `uint`, `long`, `ulong`,
`void`, `struct`, `class`, `mixin`, `enum`, `name`, `string`, `sound`,
`state`, `color`, `vector2`, `vector3`, `map`, `array`, `in`,
`sizeOf`, `alignOf`, `abstract`, `forEach`, `true`, `false`, `none`,
`auto`, `property`, `native`, `var`, `out`, `static`, `transient`,
`final`, `extend`, `protected`, `private`, `dot`, `cross`, `virtual`,
`override`, `vararg`, `ui`, `play`, `clearScope`, `virtualScope`,
`super`, `stop`, `null`, `is`, `replaces`, `states`, `meta`,
`deprecated`, `version`, `version`, `action`, `#include`, `readOnly`,
<span class="label purple">3.4.0+</span> `internal`, <span
class="label purple">3.7.0+</span> `flagDef`

</dd></dl>

#### Symbols

<dl class="syn"><dt>Symbol</dt><dd>

`..`, `...`, `>>>=`, `>>=`, `<<=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`,
`^=`, `|=`, `>>>`, `>>`, `<<`, `++`, `--`, `&&`, `||`, `<=`, `>=`,
`==`, `!=`, `~==`, `<>=`, `**`, `::`, `->`, `;`, `{`, `}`, `,`, `:`,
`=`, `(`, `)`, `[`, `]`, `.`, `&`, `!`, `~`, `-`, `+`, `*`, `/`, `%`,
`<`, `>`, `^`, `|`, `?`, `#`, `@`

</dd></dl>

## Literals

Much like C or most other programming languages, ZScript has object
literals, including string literals, integer literals, float literals,
name literals, boolean literals, and the null pointer.

<dl class="syn"><dt>Literal</dt><dd>

* [StringLiteral]
* [StringLikeLiteral]
* [NameLiteral]
* [IntegerLiteral]
* [FloatingPointLiteral]
* [BooleanLiteral]
* [NullLiteral]

</dd></dl>

### String Literals

String literals contain text data, and are encoded in UTF-8.

String literals, like C, will be concatenated when put directly next
to each other. For example, `"text 1" "text 2"` will be parsed as a
single string literal `"text 1text 2"`.

<dl class="syn"><dt>StringLiteral</dt><dd>

`"` [StringCharacter]* `"`

</dd><dt>StringCharacter</dt><dd>

* [StringLiteralEscape]
* [AnyCharacter]

</dd></dl>

#### String Literal Escapes

String literals have character escapes, which are formed with a
backslash and a sequence of characters.

| Spelling | Output
| :------- | :-----
| `\"`     | A literal `"`.
| `\\`     | A literal `\`.
| `\a`     | Byte `0x07` (`BEL` - bell, anachronism.)
| `\b`     | Byte `0x08` (`BS` - backspace, anachronism.)
| `\c`     | Byte `0x1c` (`TEXTCOLOR_ESCAPE`.)
| `\f`     | Byte `0x0c` (`FF` - form feed, anachronism.)
| `\n`     | Byte `0x0a` (`LF` - new line.)
| `\t`     | Byte `0x09` (`HT` - tab.)
| `\r`     | Byte `0x0d` (`CR` - return.)
| `\v`     | Byte `0x0b` (`VT` - vertical tab, anachronism.)
| `\?`     | A literal `?` (obsolete anachronism.)
| `\xnn`   | Byte `0xnn` (hexadecimal.)
| `\nnn`   | Byte `0nnn` (octal.)

To quote [cppreference][octal], "of the octal escape sequences, `\0`
is the most useful because it represents the terminating null
character in null-terminated strings."

<dl class="syn"><dt>StringLiteralEscape</dt><dd>

* `\"`
* `\\`
* `\a`
* `\b`
* `\c`
* `\f`
* `\n`
* `\t`
* `\r`
* `\v`
* `\?`
* `\` [Base16Prefix] [Base16Character]{1..2}
* `\` [Base8Character]{1..3}
* `\` [NewLine]

</dd></dl>

### String-Like Literals

There are several types which have literals lexically the same as
[StringLiteral]s, but contextually are different.

<dl class="syn"><dt>StringLikeLiteral</dt><dd>

* [ClassReferenceLiteral]
* [FontLiteral]
* [SoundLiteral]

</dd><dt>ClassReferenceLiteral</dt><dd>

[StringLiteral]

</dd><dt>FontLiteral</dt><dd>

[StringLiteral]

</dd><dt>SoundLiteral</dt><dd>

[StringLiteral]

</dd></dl>

### Name Literals

Name literals are similar to string literals, though they use
apostrophes instead of quote marks.

They do not concatenate like string literals, and do not have
character escapes.

<dl class="syn"><dt>NameLiteral</dt><dd>

`'` [NameCharacter] `'`

</dd><dt>NameCharacter</dt><dd>

* `\'`
* [AnyCharacter]

</dd></dl>

### Integer Literals

Integer literals are formed similarly to C. They may take one of three
forms, and are typed `uint` or `int` based on whether there is a `u`
at the end or not.

The parser also supports an optional `l`/`L` suffix as in C, though it
does not actually do anything, and it is advised you do not use it for
potential forward compatibility purposes.

Integer literals can be in the basic base-10/decimal form,
base-16/hexadecimal form (which may use upper- or lower-case decimals
and `0x` prefix,) and base-8/octal form.

<dl class="syn"><dt>IntegerLiteral</dt><dd>

* `0` [Base8Character]+ [IntegerSuffix]{0..2}
* [Base10Character]+ [IntegerSuffix]{0..2}
* `0` [Base16Prefix] [Base16Character]+ [IntegerSuffix]{0..2}

</dd><dt>IntegerSuffix</dt><dd>

`u`, `U`, `l`, `L`

</dd></dl>

### Floating-Point Literals

Float literals, much like integer literals, are formed similarly to C,
but they do not support hex-float notation. Float literals do support
exponent notation.

The parser supports an optional `f`/`F` suffix as in C, though it does
not actually do anything, and it is advised you do not use it for
potential forward compatibility purposes.

<dl class="syn"><dt>FloatingPointLiteral</dt><dd>

* [Base10Character]+ [Exponent] [FloatSuffix]?
* [Base10Character]* `.` [Base10Character]+ [Exponent]? [FloatSuffix]?
* [Base10Character]+ `.` [Base10Character]* [Exponent]? [FloatSuffix]?

</dd><dt>ExponentPrefix</dt><dd>

`e`, `E`

</dd><dt>ExponentSign</dt><dd>

`-`, `+`

</dd><dt>Exponent</dt><dd>

[ExponentPrefix] [ExponentSign]? [Base10Character]+

</dd><dt>FloatSuffix</dt><dd>

`f`, `F`

</dd></dl>

### Boolean Literals

The two boolean literals are spelled `false` and `true`, and much like
C, can decay to the integer literals `0` and `1`.

<dl class="syn"><dt>BooleanLiteral</dt><dd>

* `false`
* `true`

</dd></dl>

### Null Literals

The null pointer literal is spelled `null` and represents an object
that does not exist in memory. Like C, it is not equivalent to the
integer literal `0`, and is more similar to C++'s `nullptr`.

<dl class="syn"><dt>NullLiteral</dt><dd>

`null`

</dd></dl>

[octal]: https://en.cppreference.com/w/cpp/language/escape

[AnyCharacter]: #character-types
[Base10Character]: #character-types
[Base16Character]: #character-types
[Base16Prefix]: #character-types
[Base8Character]: #character-types
[BlockComment]: #comments
[BooleanLiteral]: #boolean-literals
[ClassReferenceLiteral]: #string-like-literals
[EOF]: #character-types
[ExponentPrefix]: #floating-point-literals
[ExponentSign]: #floating-point-literals
[Exponent]: #floating-point-literals
[FloatSuffix]: #floating-point-literals
[FloatingPointLiteral]: #floating-point-literals
[FontLiteral]: #font-literals
[IdentifierCharacter]: #character-types
[IdentifierStartCharacter]: #character-types
[Identifier]: #identifiers
[IntegerLiteral]: #integer-literals
[IntegerSuffix]: #integer-literals
[Keyword]: #keywords
[LineComment]: #comments
[Literal]: #literals
[NameCharacter]: #name-literals
[NameLiteral]: #name-literals
[NewLine]: #character-types
[NullLiteral]: #null-literals
[RegionComment]: #comments
[SoundLiteral]: #sound-literals
[StringCharacter]: #string-literals
[StringLikeLiteral]: #string-like-literals
[StringLiteralEscape]: #string-literal-escapes
[StringLiteral]: #string-literals
[Symbol]: #symbols
[Token]: #tokens
[Whitespace]: #character-types
