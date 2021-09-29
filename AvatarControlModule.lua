-- PlayMusic index of what each song for instrument needs Line 31 Reference

local ACS = {
	Status = {
		Success = "Success",
		Error = "Error",
		Return = "Return"
	},

	Positions = {
		Front = {-20, 5, 38.5},
		FrontOR = {0, 40, 0},

		Back = {0,0,0},
		BackOR = {0,0,0},

		Left = {-20, 5, 38.5},
		LeftOR = {0, 40, 0},

		Right = {-32.5, 5, 40},
		RightOR = {0, -20, 0}
	},

	Instruments = {
		["Cello"] = {
			Idle = "rbxassetid://6536593350",
			Playing = "rbxassetid://6535911435",
		},

		["Saxophone"] = {
			Idle = "rbxassetid://6543999194",
			Playing = "rbxassetid://6543940416",
		},
	},

	Songs = {
		["France"] = {
			game.Workspace.Songs.France,
			{"Cello", game.Workspace.Musicians.Cello, "Left"},
			{"Saxophone", game.Workspace.Musicians.Saxophone, "Right"},
		}
	}

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
	assert(type(Location) == "string", "Input must be a valid string")
	assert(Location == "Front" or Location == "Back" or Location == "Left" or Location == "Right", "Input must be a valid location type")

	if Model then
		local HumanoidRootPart = Model:WaitForChild("HumanoidRootPart")

		if Location == "Front" then
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions.Front))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions.FrontOR[1]), math.rad(ACS.Positions.FrontOR[2]), math.rad(ACS.Positions.FrontOR[3])))

		elseif Location == "Back" then
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions.Back))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions.BackOR[1]), math.rad(ACS.Positions.BackOR[2]), math.rad(ACS.Positions.BackOR[3])))

		elseif Location == "Left" then
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions.Left))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions.LeftOR[1]), math.rad(ACS.Positions.LeftOR[2]), math.rad(ACS.Positions.LeftOR[3])))

		elseif Location == "Right" then
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions.Right))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions.RightOR[1]), math.rad(ACS.Positions.RightOR[2]), math.rad(ACS.Positions.RightOR[3])))
		end
	end

end

function ACS:PlayAvatarAnimation(Instrument)

	local Model = game.Workspace.Musicians:FindFirstChild(Instrument)

	if Instrument == "Cello" then

		local AnimationsFolder = Model:FindFirstChild("Animations")
		local Humanoid = Model:FindFirstChild("Humanoid")

		local Idle = AnimationsFolder.Idle
		local Playing = AnimationsFolder.Playing

		Idle.AnimationId = ACS.Instruments.Cello.Idle
		Playing.AnimationId = ACS.Instruments.Cello.Playing

		local LoadedPlaying = Humanoid:LoadAnimation(Playing)
		local LoadedIdle = Humanoid:LoadAnimation(Idle)

		LoadedPlaying:Play()
		LoadedIdle:Stop()
		LoadedPlaying:AdjustSpeed(0.4)

	elseif Instrument == "Saxophone" then

		local AnimationsFolder = Model:FindFirstChild("Animations")
		local Humanoid = Model:FindFirstChild("Humanoid")

		local Idle = AnimationsFolder.Idle
		local Playing = AnimationsFolder.Playing

		Idle.AnimationId = ACS.Instruments.Saxophone.Idle
		Playing.AnimationId = ACS.Instruments.Saxophone.Playing

		local LoadedPlaying = Humanoid:LoadAnimation(Playing)
		local LoadedIdle = Humanoid:LoadAnimation(Idle)

		LoadedPlaying:Play()
		LoadedIdle:Stop()
		LoadedPlaying:AdjustSpeed(0.4)

	end
end

-- IdleAvatarAnimation

function ACS:PlayMusic(Song)

	if Song == "France" then
		ACS:AddAvatar(ACS.Songs.France[2][2], ACS.Songs.France[2][3])
		ACS:AddAvatar(ACS.Songs.France[3][2], ACS.Songs.France[3][3])
		ACS:PlayAvatarAnimation(ACS.Songs.France[2][1])
		ACS:PlayAvatarAnimation(ACS.Songs.France[3][1])
		ACS.Songs.France[1]:Play()


	end

end



return ACS
