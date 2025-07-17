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

				local args3 = {1}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("UpgradeUnit"):InvokeServer(unpack(args3))

				local args4 = {2}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("ChangeTickSpeed"):InvokeServer(unpack(args4))

				game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("RestartGame"):InvokeServer()

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
