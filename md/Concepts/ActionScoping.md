# Action Scoping

On classes derived from [`Actor`], states and methods can be scoped to
a certain subset of uses. This is mainly to differentiate actions
which take place in inventory items and weapons, and actions which
take place in the actual game map, for disambiguating the `self`
pointer usage. The available scopes are:

| Name      | Description                                   |
| ----      | -----------                                   |
| `actor`   | Actions are called from an actual map object. |
| `item`    | Actions are called from an inventory item.    |
| `overlay` | Actions are called from a weapon overlay.     |
| `weapon`  | Actions are called from a weapon.             |

These can be defined either in the `states` block header as-is,
{{#include ../Labels/Internal.md}} or with [`Actor`]'s
[`DefaultStateUsage`] property.

[Actor]: ../Api/Base/Actor.md
[DefaultStateUsage]: ../Api/Base/Actor.md#prop-DefaultStateUsage
