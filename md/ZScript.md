# ZScript Language

ZScript is a scripting language that has sprung from the ceasing of
ZDoom and the subsequent reprisal of GZDoom as mainline. It is similar
to Java, though it has many deficiencies, oddities and other such
issues. Despite this, it is still the most powerful Doom modding tool
since plainly editing the source code.

This documentation serves as an introduction to and informal
specification of the ZScript language from a programmer's viewpoint.
It should also be useful for non-programmers looking for specifics on
the inner workings of the language and more information on the
functions and properties provided to it.

ZScript runs in a virtual machine much like ACS, although because it
is *not* compiled to bytecode and uses an object-oriented structure,
the virtual machine is far more complex, and also therefore quite a
bit slower. ZScript may only be read from source files by the engine,
which has several benefits as well as detriments.

## Reading This Document

This document's syntax definitions are written to be easy to read but
still close enough to a formal syntax that, for instance, someone
writing a parser could do so off of this document. Here is a legend
describing all syntax element spellings:

| Spelling | Meaning
| :------- | :------
| `Symbol` | Any symbol in `monospace` is spelled as-is.
| Syntax | Any syntax definition defined by this document.
| * | A syntax element of which there may be any amount of.
| + | A syntax element of which there may be one or more of.
| ? | An optional element, which may be omitted.
| {N} | A syntax element of which there may be exactly N amount of.
| {N..M} | A syntax element of which there may be between N and M of, inclusive.
| (Element) | A sequence of elements that may have modifiers such as * or + applied to them.
| List items or "," | Alternatives available for this element.

Some example syntax definitions would be:

<dl class="syn"><dt>ExampleElement</dt><dd>

`keyword` SomeKeyword (`,` SomeKeyword)? `;`

</dd><dt>SomeKeyword</dt><dd>

* `example`
* `example2`
* `example3`

</dd></dl>

Which would mean, in a ZScript file, you could write things like:

```csharp
keyword example;
keyword example2, example3;
```
