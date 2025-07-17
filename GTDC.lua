local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Garden Tower Defense Central",
	LoadingTitle = "Join our discord!",
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

local Toggle = Tab:CreateToggle({
	Name = "Start Autofarm Loop",
	CurrentValue = false,
	Flag = "AutoFarmToggle",
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
