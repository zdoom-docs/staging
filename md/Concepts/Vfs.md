# Virtual File System

Files of various kinds are loaded from *archives* into a structure of
*lumps* and *namespaces*.

*Archives* are any storage medium used for holding files. There are
two types of archive: *Wad archives* and *Resource archives*.

The term *lump* refers to any file object loaded from an archive which
has its name truncated to 8 characters and its extension stripped.
Each lump is put into a namespace, the structure of which depends on
the archive type.

The term *file* refers to any actual file within a real folder
structure.

Wad archives are traditional DOOM WAD files. You can find more about
them at [the Doom Wiki][wad files].

Archives which have real folder structures are referred to in this
document as *resource archives* or *resources*. Resource archives hold
lumps as well as files.

The currently supported resource archive file types include ZIP
(`.zip`, `.pk3`, `.pkz`), 7-Zip (`.7z`, `.pk7`), BUILD GRP (`.grp`),
Quake PAK (`.pak`), and folders. Blood RFF files are also supported,
but are essentially useless. Single files can also be loaded as
archives, containing only themselves.

In short:

* *Lump* refers to an object from any archive type with an 8 character
  filename, extension removed.
* *File* refers to fully qualified object from a resource archive,
  which can also be used as a lump through its truncated name if it is
  in the right namespace.
* *Archives* are real files or folders which hold *lumps* and
  optionally files.
* *Wad archives* are archives which hold only lumps, and use marker
  lumps for determining lump namespaces.
* *Resource archives* are archives with a folder structure for
  determining lump namespaces, and also store fully qualified paths
  for files.

[wad files]: https://doomwiki.org/wiki/WAD
