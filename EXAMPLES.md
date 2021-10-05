## Musician Example

<br>

Adds musician and plays the animation after a time period:
```local ACS = require(script.Parent.ModuleScript)
local Musicians = game.Workspace.Musicians

ACS:AddAvatar(Musicians.Cello, "Front")
wait(4)
ACS:PlayAvatarAnimation("Cello")
```

<br>
<br>

Loops the playing and idle animation:
```local AvatarControl = require(script.Parent.AvatarControlModule)
local Musicians = game.Workspace.Musicians

while wait(4) do
	AvatarControl:AddAvatar(Musicians.Cello, "Left")
	wait(4)
	AvatarControl:PlayAvatarAnimation(Musicians.Cello, 6, 3, true)
	wait(4)
	AvatarControl:PlayAvatarAnimation(Musicians.Cello, 0.4, 3, false)
	wait(4)
	AvatarControl:PlayAvatarAnimation(Musicians.Cello, 0.4, 3, true)
	wait(4)
	AvatarControl:PlayAvatarAnimation(Musicians.Cello, 0.4, 3, false)
end
```
