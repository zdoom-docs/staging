# Top-Level

Full ZScript files are referred to as "translation units." This
terminology comes from the C standard, and refers simply to the
entirety of a ZScript source file. ZScript files are searched for in
lumps named `zscript` with any extension, including none. The standard
extension is `.zs`, but `.zsc`, `.zc` and `.txt` are common as well.

<div class=toc>
<!-- toc -->
</div>

## Translation Units

The base translation unit `zscript` may start with a version
directive, then followed by any number of top-level definitions and
`#include` directives. Included translation units may not have version
directives.

All keywords and identifiers in ZScript are case insensitive.

<dl class="syn"><dt>TranslationUnit</dt><dd>

[VersionDirective]? [TopLevelDefinition]*

</dd></dl>

## Version Directives

A version directive may be placed at the very beginning of a ZScript
file. The version directive describes the ZScript version to use. By
default ZScript is version 2.3, the original ZScript specification.
This old version is not supported by this documentation and it is
highly encouraged to always use the latest version of ZScript. The
minimum version supported by this documentation is 3.0.

<dl class="syn"><dt>VersionDirective</dt><dd>

`version` [StringLiteral]

</dd></dl>

## Top-level Definitions

A ZScript file can have one of several things at the top level of the
file, following a version directive.

<dl class="syn"><dt>TopLevelDefinition</dt><dd>

* [ClassDefinition]
* [StructureDefinition]
* [EnumerationDefinition]
* [ConstantDefinition]
* [IncludeDirective]

</dd></dl>

## Include Directives

Include directives include other files to be processed by the ZScript
compiler, allowing you to organize and separate code into different
files.

Note that included files will conflict with other mods. If two mods
have a file named `zscript/MyCoolClasses.zsc` and both include it,
expecting to get different files, the engine will fail to load with a
script error.

To avoid this, it is suggested to place your ZScript code under a
uniquely named sub-folder.

<dl class="syn"><dt>IncludeDirective</dt><dd>

`#include` [StringLiteral]

</dd></dl>

## Examples

### Version Directives

```csharp
version "4.3.3"
```

### Include Directives

```csharp
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

[ClassDefinition]: Classes.md#class-definitions
[ConstantDefinition]: Constants.md#constant-definitions
[EnumerationDefinition]: Enumerations.md#enumeration-definitions
[StringLiteral]: Fundamentals.md#string-literals
[StructureDefinition]: Structures.md#structure-definitions

[IncludeDirective]: #include-directives
[TopLevelDefinition]: #top-level-definitions
[VersionDirective]: #version-directives
