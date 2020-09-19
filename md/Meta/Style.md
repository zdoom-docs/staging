# Style

This is a style guide for the ZScript documentation to encourage
best-practice coding with it, focused on clarity and consistency of
formatting. It is also intended to be a general style guide for
writing new code, but this purpose is ancillary and can be ignored.
Within the abstract of each component of style will be rationale for
choices made.

<!-- toc -->

## Capitalization Conventions

ZScript is case insensitive, however this guide aims to give a way to
consistently capitalize all identifiers in the language. Due to case
insensitivity, it may be difficult to apply these guidelines to real
code, but nonetheless a consistent capitalization style should be
followed. Do note that you must not rely on case differences in
identifiers due to this.

Capitalize the first letter of each word in an identifier. Acronyms
are considered whole words, so for instance prefer `XmlWidget` over
`XMLWidget` and `IoStream` over `IOStream`. Acronyms of one character
also count, so prefer `PrintF` over `Printf`.

For identifiers of parameter names and local scope variables do not
capitalize the first word. In these cases, prefer `xmlWidget` over
`XmlWidget` or `ioStream` over `IOStream`. The same for acronyms of
one character, so `typeF` over `TypeF` or `nChars` over `NChars`.
(Note that the former two are malformed names, however. See the "Word
Choice" section for more information.)

Constants (declared with `const`, `static const`, or `enum`) must be
all uppercase, and must separate words with underscores.

Argument names in base archive methods may be renamed, but arguments
with defaults may not be renamed as they are part of the API. Their
capitalization may be changed accordingly, however.

Flags will have the `b` prefix lowercase regardless of context, as
will members with the `m_` prefix. Flags are not to be treated as
constants, so always prefer `bNoAutoFire` to `bNOAUTOFIRE`.

### Rationale

It is not imperative here to reason for or against case insensitivity.
Code within this style is to be written as uniformly as possible,
therefore capitalization is also to be uniform. It is the user's
choice whether to follow this rule or not, but for authors of this
documentation the only reason to treat code as if it were case
sensitive is consistency.

This style of acronym capitalization has been chosen so as to defer to
prior art, primarily C#'s standard, which has been in use for over a
decade now. The purpose of not capitalizing acronyms is to make it
more natural to read them where normally they are forced to be next to
other capitalized words.

Not capitalizing the first word of parameter and local scope variables
is also decided by deferring to prior art. The majority of programming
style guides written advocate for this. The purpose in ZScript is
primarily moot due to case insensitivity, but we apply these rules to
make reading easier and more consistent with most other programming
languages that have existed.

Capitalizing constants and enumerations is an artifact of the way they
are declared in ZDoom, and also in the original Linux Doom source
code. This is extended to static arrays for consistency.

Flags were capitalized in Linux Doom due to being constants, and
internally within ZDoom they are still constants, but due to the style
of ZScript using full capitalization appears inconsistent.

## Word Choice

In new identifiers, do not add underscores anywhere within the
identifier, unless explicitly stated in this style guide or necessary
because of unmodifiable code (such as that in GZDoom's base archive.)
Do not use Hungarian notation.

Do not use keywords or types as names except for the identifier
`name`. Do not, for instance, declare `string Class;`, even though the
language will allow you to do so, although `string Name;` is fine.

It is generally favorable to use shortened terminology, for instance
`CanMoveZ` instead of `CanMoveVertically`. Try to make names readable
in English, however: `CanThrowItem` instead of `ThrowableItem`.

In the same vein, use abbreviations where conventional, but avoid them
where unnecessary. Prefer `GetMobj` to `GetMapObject` but also
`GetAngle` to `GetAng`.

### Rationale

The forbidding of underscores and Hungarian notation are in accordance
with ZDoom's coding style. These choices are also present in other
prior art, but the main deciding factor is that of the engine itself.

The usage of most keywords in variable names is allowed in ZScript
because the parser considers most identifiers to be contextual. In
many contexts, keywords are allowed in places they shouldn't be by
most standards. Besides the precedence of prior art, it appears that
the engine itself also avoids using this relaxation of context.

The engine and this style do, however, allow use of the identifier
`name` in variables and members because it is a frequently used word.

Shortened terminology such as abbreviations or contractions are
favored due to long-standing conventions within ZDoom's source code.
This is also historically relevant because of engines such as Unreal
Engine which ZDoom takes inspiration from. Common terminology which
may be shortened can be found on [the Doom Wiki.][2]

[2]: https://doomwiki.org/wiki/Category:Doom_engine

## Naming Type Members

Always name methods with verbs or verb phrases, such as "`Split`" or
"`CompareTo`." Always try to make names forward compatible, i.e. such
that they will likely not conflict with new functions when they are
added to the engine. In mods, this can even involve prefixing method
names with one unique to the mod. Avoid violent words such as `Die`,
`Destroy`, `Kill`, except where literally applicable. Prefer for
instance `Stop`, `Drop`, `Halt`.

Always name members with nouns, noun phrases or adjectives. Boolean
values should often be prefixed with `Is`, `Has`, `Can`, and other
existential present-tense verbs. All members of class types should be
prefixed with `m_`, despite rules against Hungarian notation and
underscores. Try to name members productively rather than vaguely,
instead of `RefInt` write `ReferenceCount`.

### Rationale

Forwards compatibility is necessary primarily in mods. In this
documentation it should be taken into account when writing example
code, often when writing examples that involve inheriting from a class
in the engine. ZScript will hard error on load if there is more than
one definition of a function, so it is necessary to never have a
conflict in names, including capitalization-wise.

The purpose of avoiding violent words in method names is to not
needlessly invoke potentially uncomfortable or triggering imagery. In
much of the base class code, it is literally the action being taken,
as Doom is indeed a violent game. In these cases it is entirely normal
to use such verbs. An example of when this is entirely wasteful is
ZDoom's garbage collector (which is exposed with different naming
conventions) in which the flag for objects marked for finalization
upon the next collection cycle is named `EuthanizeMe`. This kind of
wording is certainly jocular and potentially amusing, but a 'funny'
name such as this serves no real purpose, and could easily be
re-worded to prevent potential discomfort.

Members are prefixed with `m_` in order to defuse potential clashes
with local variables, since case sensitivity cannot defuse them. The
alternative to this is to prefix all member variable accesses with
`self.`. However, this is potentially excessive and is not entirely
productive in writing short and readable examples. This also provides
a layer of forward compatibility, as ZDoom does not use `m_` prefixes
anywhere within its code. For the opposite reason, as structure types
cannot inherit, there is no need to prefix their members, and so this
prefix is omitted within them.

## Layout Conventions

Use hardware tabs with a width of 3 characters for indentation. Indent
at each block, but do not indent `case` labels. Align all code to 80
columns. Align all markdown to 80 columns, except where impossible.

Write only one statement or declaration per line, except in the case
of multiple-assignment operations, in which case pairing all of the
related declarations and the statement on the same line is allowed as
long as it does not exceed 80 columns.

Always add one blank line between separate method definitions, and
between member declarations and member definitions. Add one blank line
between local variable declarations and statements, unless specified
otherwise. Add one blank line between conditional statements, except
the `else` block of an `if` statement.

Do not place a space before the parentheses of a conditional or loop
statement such as `if` or `for`. Always write `if()` and not `if ()`.

Always place opening braces on their own line. Using braces is not
necessary when there is a single sub-statement, for instance with
`if(x) y = z;`.

### Rationale

The convention of 3 spaces for indentation comes from [Eternity
Engine's style guideline.][1] There is no other reason for this
decision, other than it is pleasing to the eye while not being
excessive. Hardware tabs are used instead of spaces in order to allow
for user configuration, increasing accessibility. The indentation and
blank line rules are generally the same as the majority of C-like
language style guidelines.

Alignment to 80 columns is for the purpose of reading the raw
documentation text under standard size Linux terminals. This is
useful, for instance, when reading diff files under the `git` console
client. This guideline can generally be ignored outside of this
documentation.

Writing multiple-assignment operations all on one line serves the
purpose of grouping all of the relevant information together. In most
languages with multiple assignment, you are able to do the declaration
and assignment in one line, so this crudely mirrors a more well
implemented language syntax.

Placing opening braces on their own line greatly increases code
readability, especially for people hard of sight. Other styles make it
easy to confuse where a block begins and create a less clear visual
line between the start and end. The purpose of this is to increase
readability of this documentation, and not to make code look more
pleasing.

[1]: https://github.com/team-eternity/eternity/blob/master/docs/ee_style_guide.md

## Commenting Conventions

Do not use block comments, except for the purpose of example or code
that will intentionally not work.

Comments may be placed anywhere except at the end of the opening line
of a conditional or loop statement, the opening brace of a block, or
the ending brace of a block.

Always use proper case and punctuation when writing comments.

Always put one space between the comment delimiter and comment text.

### Rationale

Block comments are mostly an adage of old programming languages made
to be printed on paper. In modern times they are most useful for
commenting out large blocks of code. They are rather clumsy to format
well, and so single-line comments are to be used instead of them. One
could argue that if a consistent formatting style was added, this
would not be a problem. However, it is generally easier and more
readable to just use line comments.

## Language Guidelines

Use `let` declarations when the type of the object will be obvious
from what it is assigned. Do not use `let` if it is not made clear by
the following text what the type will be, or where it is necessary to
proclaim the type to make reading easier.

Do not use integer types except for `int`, except in examples.
Similarly, do not use float types except for `double` except in
examples.

No restrictions are placed on the usage of parentheses. Always place
spaces between the operands of binary expressions (`1 + 1`) but never
unary expressions (`-5`.)

Do not place semicolons at the end of `enum` or `struct` definitions.
However, always place a comma at the end of the last variant in an
enumeration.

### Rationale

Integer and floating-point types other than `int` and `double` are
primarily for internal use. They can be used by user types, but often
it is unnecessary, and can be harmful.

Placing semicolons at the end of top-level items is not meant to be
used by end users. Its main purpose is to make ZScript easier to port
from C++. On the other hand, placing a comma at the end of the last
enumeration in a set is a common practice.
