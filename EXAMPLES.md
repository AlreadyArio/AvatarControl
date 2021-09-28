## Musician Example

<br>

Adds musician and plays the animation after a time period:
```
!local ACS = require(script.Parent.ModuleScript)
local Musicians = game.Workspace.Musicians

ACS:AddAvatar(Musicians.Cello, "Front")
wait(4)
ACS:PlayAvatarAnimation("Cello")
```
