local ACS = { 
	["positions"] = { 
		["Left"] = { 
			["Position"] 	= { 0, 0, 0 },
			["Orientation"] = { 0, 0, 0 },
		},
		["Right"] = { 
			["Position"] 	= { 0, 0, 0 },
			["Orientation"] = { 0, 0, 0 },
		},
		["Back"] = { 
			["Position"] 	= { 0, 0, 0 },
			["Orientation"] = { 0, 0, 0 },
		},
		["Front"] = { 
			["Position"] 	= { 0, 0, 0 },
			["Orientation"] = { 0, 0, 0 },
		},
	}
}

ACS.__index = ACS

function ACS.SetPositions(x)
	local self = {
		positions = x
	}
	setmetatable(self, ACS)
	return self
end

function ACS:RemoveAvatar(Model)
	assert(Model:IsA("Model") and Model.PrimaryPart, "Model must be a valid Player Model")

	if Model then
		local HumanoidRootPart = Model:WaitForChild("HumanoidRootPart")

		HumanoidRootPart.Anchored = true
		HumanoidRootPart.CFrame = CFrame.new(-100000,-100000,-100000) * CFrame.Angles(0,0,0)
	end

end

function ACS:AddAvatar(Model, Location)
	assert(Model:IsA("Model") and Model.PrimaryPart, "Model must be a valid Player Model")
	assert(type(Location) == "string", "Value must be a valid string")

	if Model then
		local HumanoidRootPart = Model.PrimaryPart
		if Location then
			HumanoidRootPart.CFrame = CFrame.new(unpack(self.positions[Location].Position))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(self.positions[Location].Orientation[1]), math.rad(self.positions[Location].Orientation[2]), math.rad(self.positions[Location].Orientation[3])))
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
