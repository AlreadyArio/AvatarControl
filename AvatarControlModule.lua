-- PlayMusic index of what each song for instrument needs Line 31 Reference



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



	Instruments = {


		["Singer"] = {


			Idle = "rbxassetid://6539543263",


			Playing = "rbxassetid://6539372582",


		},


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


			{"Singer", game.Workspace.Musicians.Singer, "Front"},


			{"Saxophone", game.Workspace.Musicians.Saxophone, "Right"},


			{"Cello", game.Workspace.Musicians.Cello, "Left"},


		}


	}



}



local function PlayInstrumentAnimation(Humanoid, Playing, Idle, SpeedTrue, SpeedFalse, Bool)



	local LoadedPlaying = Humanoid:LoadAnimation(Playing)


	local LoadedIdle = Humanoid:LoadAnimation(Idle)



	if Bool then


		LoadedPlaying:Play()


		LoadedPlaying.Looped = true


		LoadedIdle:Stop()


		LoadedPlaying:AdjustSpeed(SpeedTrue)


	else


		LoadedPlaying:Stop()


		LoadedIdle:Play()


		LoadedIdle.Looped = true


		LoadedPlaying:AdjustSpeed(SpeedFalse)


	end


end



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


		local HumanoidRootPart = Model.PrimaryPart



		if Location then


			HumanoidRootPart.CFrame = CFrame.new(unpack(ACS.Positions[Location]))


			Model:SetPrimaryPartCFrame(Model.PrimaryPart.CFrame * CFrame.Angles(math.rad(ACS.Positions[Location.."OR"][1]), math.rad(ACS.Positions[Location.."OR"][2]), math.rad(ACS.Positions[Location.."OR"][3])))


		end


	end



end



function ACS:PlayAvatarAnimation(Instrument, Bool)


	assert(Instrument == "Cello" or Instrument == "Saxophone" or Instrument == "Singer", "Input must be a valid instrument type")



	local Model = game.Workspace.Musicians:FindFirstChild(Instrument)


	local AnimationsFolder = Model:FindFirstChild("Animations")


	local Humanoid = Model:FindFirstChild("Humanoid")



	local Idle = AnimationsFolder.Idle


	local Playing = AnimationsFolder.Playing



	Idle.AnimationId = ACS.Instruments[Instrument].Idle


	Playing.AnimationId = ACS.Instruments[Instrument].Playing



	local LoadedPlaying = Humanoid:LoadAnimation(Playing)


	local LoadedIdle = Humanoid:LoadAnimation(Idle)



	if Bool then


		PlayInstrumentAnimation(Humanoid, Playing, Idle, 1, 0.4, true)


	else


		PlayInstrumentAnimation(Humanoid, Playing, Idle, 1, 0.4, false)


	end


end



function ACS:PlayMusic(Song, AnimationDelay, AnimationSpeed)



	if Song then


		ACS:AddAvatar(ACS.Songs[Song][2][2], ACS.Songs[Song][2][3])


		ACS:PlayAvatarAnimation(ACS.Songs[Song][2][1], false)


		wait(4)


		ACS:PlayAvatarAnimation(ACS.Songs[Song][2][1], true)


		wait(4)


		ACS:PlayAvatarAnimation(ACS.Songs[Song][2][1], false)



	end



end





return ACS


