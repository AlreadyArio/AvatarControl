local ACS = {
	Status = {
		Success = "Success",
		Error = "Error",
		Return = "Return"
	},

	Positions = {
		Front = {-25.5, 5, 34.5},
		FrontOR = {0, 0, 0},

		Back = {-25.5, 5, 42.5},
		BackOR = {0,0,0},

		Left = {-20, 5, 38.5},
		LeftOR = {0, 40, 0},

		Right = {-32.5, 5, 40},
		RightOR = {0, -20, 0}
	},
}

function ACS:RemoveAvatar(Model)
	assert(Model:IsA("Model") and Model.PrimaryPart, "Model must be a valid Player Model")

	if Model then
		local HumanoidRootPart = Model:WaitForChild("HumanoidRootPart")

		HumanoidRootPart.CFrame = CFrame.new(-100000,-100000,-100000) * CFrame.Angles(0,0,0)
		HumanoidRootPart.Anchored = true
	end

end

function ACS:AddAvatar(Model, Location)
	assert(Model:IsA("Model") and Model.PrimaryPart, "Model must be a valid Player Model")
	assert(type(Location) == "string", "Value must be a valid string")
	assert(Location == "Front" or Location == "Back" or Location == "Left" or Location == "Right", "Input must be a valid location type")

	if Model then
		local HumanoidRootPart = Model.PrimaryPart

		if Location then
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions[Location]))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions[Location.."OR"][1]), math.rad(ACS.Positions[Location.."OR"][2]), math.rad(ACS.Positions[Location.."OR"][3])))
		end
	end
	
end

function ACS:PlayAvatarAnimation(Model, SpeedTrue, SpeedFalse, Bool)
	assert(Model:IsA("Model") and Model.PrimaryPart, "Model must be a valid Player Model")
	assert(type(SpeedFalse) == "number" and type(SpeedTrue) == "number" , "Value must be a valid number")
	assert(type(Bool) == "boolean" or Bool == nil , "Value must be a valid boolean")

	local AnimationsFolder = Model:FindFirstChild("Animations")
	local Humanoid = Model:FindFirstChild("Humanoid")

	local Idle = AnimationsFolder.Idle
	local Playing = AnimationsFolder.Playing

	local LoadedPlaying = Humanoid:LoadAnimation(Playing)
	local LoadedIdle = Humanoid:LoadAnimation(Idle)

	if Bool then
		LoadedIdle.Looped = false
		LoadedIdle:Stop()
		LoadedPlaying:AdjustSpeed(SpeedTrue)
		LoadedPlaying.Looped = true
		LoadedPlaying:Play()
	else
		LoadedPlaying.Looped = false
		LoadedPlaying:Stop()
		LoadedIdle:AdjustSpeed(SpeedFalse)
		LoadedIdle.Looped = true
		LoadedIdle:Play()
	end
	
end

return ACS
