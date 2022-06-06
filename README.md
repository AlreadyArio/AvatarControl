<h1 align="center">
  <a>AvatarControl</a> - <em>control</em> NPC characters
</h1>

<p align="center">
  Makes playing animations and positioning NPCs easier in a customizable way, <br/>
  with great performance and small code footprint.
  <br>
  <strong>Roblox</strong> ⚡ <strong>Lua</strong> ⚡ <strong>Object Oriented</strong> ⚡ <strong>Module</strong>
<p>

<h3 align="center">
  👉 <a href="https://www.roblox.com/library/7591266511/Avatar-Control-Module">Get Model</a> 👈
</h3>



## Installation

### Usage
Place these lines before any other code which is (or will be) using *AvatarControl*
```lua
local AvatarControl = require(...)

local ACS = AvatarControl.new(...)
```

### Create a folder within the NPC called ``Animations``
![image](https://user-images.githubusercontent.com/55791489/172245685-41a0cebb-9cb7-4f05-abc2-d06c8ca23a2d.png)
> Don't forget to add an idle animation inside the Animations Folder

### Defining Positions

```lua
local ACS = AvatarControl.new({
  ["Left"] = { 
    ["Position"]    = { 0, 0, 0 },
    ["Orientation"] = { 0, 0, 0 },
  },
  ["Right"] = { 
    ["Position"]    = { 0, 0, 0 },
    ["Orientation"] = { 0, 0, 0 },
  },
  ["Back"] = { 
    ["Position"]    = { 0, 0, 0 },
    ["Orientation"] = { 0, 0, 0 },
  },
  ["Front"] = { 
    ["Position"]    = { 0, 0, 0 },
    ["Orientation"] = { 0, 0, 0 },
  },
})
```

## Functions
Currently these are all the functions:
```lua
ACS:AddAvatar(Model, Position) --// Positions the NPC to the positions defined.
ACS:RemoveAvatar(Model) --// Changes the position from the NPC to void.
ACS:PlayAvatarAnimation(Model, PlayingAnimationSpeed, IdleAnimationSpeed, Bool) --// Plays animation on the NPC
```
> **1.** Make sure to define your `Position` as defined in `AvatarControl.new(...)` <br/>
> **2.** The `Bool` value for the `PlayAvatarAnimation` function will define if the NPC is idle or not.
