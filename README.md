![Version: 1.0](https://img.shields.io/badge/Version-1.0-blue?style=for-the-badge)
# ACS - Avatar Control Module
Avatar Control System is an easy control system for NPCs to easily;\
play animations and control positions
<br>

- Get the ACS module from [Roblox library](https://www.roblox.com/library/7591266511/Avatar-Control-Module).
- See some [examples](github.ryur.md).

<br>

## API

#### Methods
|`<void>` ACS:AddAvatar(`<Model>`, `<Position>`)|
|:-|
|● ***Positions the model to a specific position and orientation.*** <br> ● *`Position` must be one of the following: `Front`, `Back`, `Left`, `Right`* <br> ● *`Model` must by a Model Instance with a PrimaryPart*|

|`<void>` ACS:RemoveAvatar(`<Model>`)|
|:-|
|● *Removes the model from sight* <br> ● *`Model` must by a Model Instance with a PrimaryPart*|
|Note: This does not destroy the model. It only sets the positions to `-10000,-10000,-10000`|

|`<void>` ACS:PlayAvatarAnimation(`<Model>`, `<AnimationSpeedPlaying>`, `<AnimationSpeedIdle>`, `<Bool>`)|
|:-|
|● *Plays an Animation on the model*  <br> ● *`Model` must be a Model Instance with a Humanoid* <br> ● *`AnimationSpeedPlaying` the speed of the Playing animation in the avatar*  <br> ● *`AnimationSpeedIdle` the speed of the Idle animation in the avatar* <br> ● *`Bool` must be a boolean value*|
