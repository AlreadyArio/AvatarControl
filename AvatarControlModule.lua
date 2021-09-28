-- PlayMusic index of what each song for instrument needs Line 31 Reference

local ACS = {
	Status = {
		Success = "Success",
		Error = "Error",
		Return = "Return"
	},
	
	Positions = {
		Front = {-20, 5, 38.5},
		FrontOR = {10, 40, 20},

		Back = {0,0,0},
		BackOR = {0,0,0},

		Left = {0,0,0},
		LeftOR = {0,0,0},

		Right = {0,0,0},
		RightOR = {0,0,0}
	},
	
	Instruments = {
		["Cello"] = {
			Idle = "rbxassetid://6536593350",
			Playing = "rbxassetid://6535911435",
		},
	},

	Songs = {
		["France de la fex"] = {
			"Cello", 
			"Guitar", 
			"Piano"
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
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions.Back)) * CFrame.Angles(unpack(ACS.Positions.BackOR))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions.FrontOR[1]), math.rad(ACS.Positions.FrontOR[2]), math.rad(ACS.Positions.FrontOR[3])))

		elseif Location == "Left" then
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions.Left)) * CFrame.Angles(unpack(ACS.Positions.LeftOR))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions.FrontOR[1]), math.rad(ACS.Positions.FrontOR[2]), math.rad(ACS.Positions.FrontOR[3])))

		elseif Location == "Right" then
			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions.Right)) * CFrame.Angles(unpack(ACS.Positions.RightOR))
			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions.FrontOR[1]), math.rad(ACS.Positions.FrontOR[2]), math.rad(ACS.Positions.FrontOR[3])))
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
		
	end
end



return ACS
