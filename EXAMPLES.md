## Musician Example

<br>

Adds musician and plays the animation after 4 seconds:
```
local ACS = require(script.Parent.ModuleScript)
local Musicians = game.Workspace.Musicians

ACS:AddAvatar(Musicians.Cello, "Front")
wait(4)
ACS:PlayAvatarAnimation("Cello")
```
