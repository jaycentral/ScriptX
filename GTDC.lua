local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Autofarm GUI",
	LoadingTitle = "Loading...",
	LoadingSubtitle = "by ScriptX",
	ConfigurationSaving = {
		Enabled = false
	}
})

local Tab = Window:CreateTab("Main", 4483362458)

local Label = Tab:CreateButton({
	Name = "discord.gg/r6RtmpxdDT",
	Callback = function() end
})

local PlainsToggle = Tab:CreateToggle({
	Name = "Plains Farm 🍅🍍",
	CurrentValue = false,
	Flag = "PlainsFarmToggle",
	Callback = function(state)
		if state then
			getgenv().loopfarm = true
			while getgenv().loopfarm do
				local args = {"dif_easy"}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceDifficultyVote"):InvokeServer(unpack(args))

				local args1 = {
					"unit_tomato_plant",
					{
						Valid = true,
						Rotation = 180,
						CF = CFrame.new(-332.16180419921875, 62.845054626464844, -106.08424377441406, -1, 0, -8.742277657347586e-08, 0, 1, 0, 8.742277657347586e-08, 0, -1),
						Position = Vector3.new(-332.16180419921875, 62.845054626464844, -106.08424377441406)
					}
				}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args1))

				local args2 = {
					"unit_pineapple",
					{
						Valid = true,
						Rotation = 180,
						CF = CFrame.new(-332.2293701171875, 62.845054626464844, -113.29612731933594, -1, 0, -8.742277657347586e-08, 0, 1, 0, 8.742277657347586e-08, 0, -1),
						Position = Vector3.new(-332.2293701171875, 62.845054626464844, -113.29612731933594)
					}
				}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args2))

				local args3 = {116}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("UpgradeUnit"):InvokeServer(unpack(args3))

				local args4 = {111}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("UpgradeUnit"):InvokeServer(unpack(args4))

				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("RestartGame"):InvokeServer()

				wait(5)
			end
		else
			getgenv().loopfarm = false
		end
	end,
})

local TropicalToggle = Tab:CreateToggle({
	Name = "Tropical Farm 🌾🌴",
	CurrentValue = false,
	Flag = "TropicalFarmToggle",
	Callback = function(state)
		if state then
			getgenv().tropicalfarm = true
			while getgenv().tropicalfarm do
				local args1 = {"dif_impossible"}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceDifficultyVote"):InvokeServer(unpack(args1))

				local args2 = {"dif_impossible"}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceDifficultyVote"):InvokeServer(unpack(args2))

				local placeArgs = {
					"unit_farmer_npc",
					{
						Valid = true,
						Rotation = 180,
						CF = CFrame.new(-66.24742126464844, -28.983240127563477, 125.21807861328125, -1, 0, -8.742277657347586e-08, 0, 1, 0, 8.742277657347586e-08, 0, -1),
						Position = Vector3.new(-66.24742126464844, -28.983240127563477, 125.21807861328125)
					}
				}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceUnit"):InvokeServer(unpack(placeArgs))

				local args3 = {1}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("UpgradeUnit"):InvokeServer(unpack(args3))

				local args4 = {2}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("ChangeTickSpeed"):InvokeServer(unpack(args4))

				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("RestartGame"):InvokeServer()

				-- Float character a few feet above placement location
				local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.CFrame = CFrame.new(-66.24742126464844, -28.983240127563477 + 5, 125.21807861328125)
				end

				wait(5)
			end
		else
			getgenv().tropicalfarm = false
		end
	end,
})

local AntiAFKToggle = Tab:CreateToggle({
	Name = "Anti AFK",
	CurrentValue = false,
	Flag = "AntiAFKToggle",
	Callback = function(state)
		if state then
			getgenv().antiafk = true
			while getgenv().antiafk do
				virtualuser = game:service'VirtualUser'
				game:service'Players'.LocalPlayer.Idled:connect(function()
					virtualuser:CaptureController()
					virtualuser:ClickButton2(Vector2.new())
				end)
				wait(10)
			end
		else
			getgenv().antiafk = false
		end
	end,
})

Rayfield:LoadConfiguration()
