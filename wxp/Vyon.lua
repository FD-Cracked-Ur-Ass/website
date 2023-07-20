local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MainEvent = ReplicatedStorage.MainEvent
local Heartbeat = game:GetService("RunService").Heartbeat
do local oldFunc = nil
    oldFunc = hookfunction(MainEvent.FireServer, newcclosure(function(Event, ...)
        local args = {...}
        if args[1] == "CHECKER_1" or args[1] == "TeleportDetect" or args[1] == "OneMoreTime" then
            return nil
        end
        return oldFunc(Event, ...)
    end))
    Heartbeat:Connect(function()
    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart
    if root then
        for i, v in pairs(getconnections(root:GetPropertyChangedSignal("CFrame"))) do
            v:Disable()
        end
    end
end)
local function added(char)
    while true do
        if not char then
            return
        end
        Heartbeat:Wait()
        for i, v in pairs(char:GetChildren()) do
            if v:IsA("Script") and v:FindFirstChildOfClass("LocalScript") then
                v:FindFirstChildOfClass("LocalScript").Source = "AC"
                return
            end
        end
    end
end
if game.Players.LocalPlayer.Character then
    added(game.Players.LocalPlayer.Character)
end
game.Players.LocalPlayer.CharacterAdded:Connect(added)
end

local function SendNotification(Title, Message)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = Title,
        Text = Message
    })
end

local Library = loadstring(game:HttpGet("https://fourdevils.gq/wxp/PepsiEdited.lua"))()
local Wait = Library.subs.Wait

local Vyon = Library:CreateWindow({
    Name = "｜Vyon｜V1.0｜",
    Themeable = {
    Info = "@bleedoutnigga/wxp"
    }
})

local MainTab = Vyon:CreateTab({
    Name = "｜Main｜"
})

local MiscTab = Vyon:CreateTab({
    Name = "｜Misc｜"
})

local SilentSection = MainTab:CreateSection({
    Name = "Silent"
})

local StrafeSection = MainTab:CreateSection({
    Name = "Strafe"
})

local SilentVisualsSection = MainTab:CreateSection({
    Name = "Silent Visuals",
    Side = "Right"
})

local MovementSection = MiscTab:CreateSection({
    Name = "Movement"
})

local AntiSection = MiscTab:CreateSection({
    Name = "Anti-Aim"
})

local AutoBuySection = MiscTab:CreateSection({
    Name = "Auto Buy",
    Side = "Right"
})

local SilentEnabled = false
local Silent = false
SilentSection:AddToggle({
    Name = "Enabled",
    Flag = "Silent_Enabled",
    Callback = function(BoolValue)
        SilentEnabled = BoolValue
    end
})

local SilentKeybind = "q"
SilentSection:AddDropdown({
    Name = "Silent Keybind",
    Flag = "Silent_Keybind",
    List = {"q","e","c","z","x","b","v"},
    Callback = function(DropdownValue)
        SilentKeybind = DropdownValue
    end
})

local SilentPrediction = 0.13
SilentSection:AddTextbox({
    Name = "Prediction",
    Flag = "Silent_Prediction",
    Value = 0.13,
    Callback = function(TextValue)
        SilentPrediction = TextValue
    end
})

local SilentAutoPrediction = false
SilentSection:AddToggle({
    Name = "Auto Prediction",
    Flag = "Silent_Auto_Prediction",
    Callback = function(BoolValue)
        SilentAutoPrediction = BoolValue
    end
})

local SilentHitPart = "HumanoidRootPart"
SilentSection:AddDropdown({
    Name = "Hit Part",
    Flag = "Silent_Hit_Part",
    List = {"HumanoidRootPart","Head","UpperTorso","LowerTorso"},
    Callback = function(DropdownValue)
        SilentHitPart = DropdownValue
    end
})

local SilentResolver = false
SilentSection:AddToggle({
    Name = "Resolver",
    Flag = "Silent_Resolver",
    Keybind = 1,
    Callback = function(BoolValue)
        SilentResolver = BoolValue
    end
})

local DownCheck = false
SilentSection:AddToggle({
    Name = "Down Check",
    Flag = "Down_Check",
    Callback = function(BoolValue)
        DownCheck = BoolValue
    end
})

local SilentNotifications = false
SilentSection:AddToggle({
    Name = "Notifications",
    Flag = "Silent_Notifications",
    Callback = function(BoolValue)
        SilentNotifications = BoolValue
    end
})

local TargetStrafe = false
StrafeSection:AddToggle({
    Name = "Strafe",
    Flag = "Target_Strafe",
    Keybind = 1,
    Callback = function(BoolValue)
        TargetStrafe = BoolValue
    end
})

local StrafeSpeed = 20
StrafeSection:AddSlider({
    Name = "Strafe Speed",
    Flag = "Strafe_Speed",
    Value = 3,
    Min = 1,
    Max = 10,
    Callback = function(SliderValue)
        StrafeSpeed = SliderValue
    end
})

local StrafeDistance = 5
StrafeSection:AddSlider({
    Name = "Strafe Distance",
    Flag = "Strafe_Distance",
    Value = 15,
    Min = 1,
    Max = 30,
    Callback = function(SliderValue)
        StrafeDistance = SliderValue
    end
})

local StrafeHeight = 1
StrafeSection:AddSlider({
    Name = "Strafe Height",
    Flag = "Strafe_Height",
    Value = 1,
    Min = 1,
    Max = 30,
    Callback = function(SliderValue)
        StrafeHeight = SliderValue
    end
})

local SilentTracer = false
SilentVisualsSection:AddToggle({
    Name = "Tracer",
    Flag = "Silent_Tracer",
    Callback = function(BoolValue)
        SilentTracer = BoolValue
    end
})

local TracerTransparency = 0
SilentVisualsSection:AddSlider({
    Name = "Tracer Transparency",
    Flag = "Tracer_Transparency",
    Value = 0,
    Precise = 1,
    Min = 0,
    Max = 1,
    Callback = function(SliderValue)
        TracerTransparency = SliderValue
    end
})

local TracerThickness = 3
SilentVisualsSection:AddSlider({
    Name = "Tracer Thickness",
    Flag = "Tracer_Thickness",
    Value = 3,
    Precise = 1,
    Min = 1,
    Max = 5,
    Callback = function(SliderValue)
        TracerTransparency = SliderValue
    end
})

local TracerColor = Color3.fromRGB(83, 22, 149)
SilentVisualsSection:AddColorpicker({
    Name = "Tracer Color",
    Flag = "Tracer_Color",
    Value = Color3.fromRGB(83, 22, 149),
    Callback = function(Color)
        TracerColor = Color
    end
})

local SilentBox = false
SilentVisualsSection:AddToggle({
    Name = "Box",
    Flag = "Silent_Box",
    Callback = function(BoolValue)
        SilentBox = BoolValue
    end
})

local BoxTransparency = 0
SilentVisualsSection:AddSlider({
    Name = "Box Transparency",
    Flag = "Box_Transparency",
    Value = 0,
    Precise = 1,
    Min = 0,
    Max = 1,
    Callback = function(SliderValue)
        BoxTransparency = SliderValue
    end
})

local BoxSize = 5
SilentVisualsSection:AddSlider({
    Name = "Box Size",
    Flag = "Box_Size",
    Value = 5,
    Precise = 1,
    Min = 1,
    Max = 15,
    Callback = function(SliderValue)
        BoxSize = SliderValue
    end
})

local BoxColor = Color3.fromRGB(83, 22, 149)
SilentVisualsSection:AddColorpicker({
    Name = "Box Color",
    Flag = "Box_Color",
    Value = Color3.fromRGB(83, 22, 149),
    Callback = function(Color)
        BoxColor = Color
    end
})

local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Client = Players.LocalPlayer
local Character = Client.Character
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
local Line = Drawing.new("Line")
local Plr

function FindClosestPlayer()
    local ClosestDistance, ClosestPlayer = math.huge, nil;
    for _, Player in next, game:GetService("Players"):GetPlayers() do
        local DownChecking = Player.Character:WaitForChild("BodyEffects")["K.O"].Value == false
        if Player ~= LocalPlayer then
            local Character = Player.Character
            if DownCheck == false then
                if Character then
                    local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
                    if IsVisibleOnViewPort then
                        local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                        if Distance < ClosestDistance then
                            ClosestPlayer = Player
                            ClosestDistance = Distance
                        end
                    end
                end
            elseif DownCheck == true then
                if Character and DownChecking then
                    local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
                    if IsVisibleOnViewPort then
                        local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                        if Distance < ClosestDistance then
                            ClosestPlayer = Player
                            ClosestDistance = Distance
                        end
                    end
                end
            end
        end
    end
    return ClosestPlayer, ClosestDistance
end

Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (SilentKeybind) then
        if SilentEnabled == true then
            if Silent == true then
                Plr = FindClosestPlayer()
                Silent = false
                if SilentNotifications == true then
                    SendNotification("Vyon", "Unlocked")
                end
                elseif Silent == false then
                    Plr = FindClosestPlayer()
                    Silent = true
                if SilentNotifications == true then
                    SendNotification("Vyon", "Locked: " .. tostring(Plr.Character.Humanoid.DisplayName))
                end
            end
        end
    end
end)

if SilentAutoPrediction == true then
    pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    split = string.split(pingvalue,'(')
    ping = tonumber(split[1])
    if ping < 130 then
        SilentPrediction = 0.151
    elseif ping < 125 then
        SilentPrediction = 0.149
    elseif ping < 110 then
        SilentPrediction = 0.140
    elseif ping < 105 then
        SilentPrediction = 0.133
    elseif ping < 90 then
        SilentPrediction = 0.130
    elseif ping < 80 then
        SilentPrediction = 0.128
    elseif ping < 70 then
        SilentPrediction = 0.1230
    elseif ping < 60 then
        SilentPrediction = 0.1229
    elseif ping < 50 then
        SilentPrediction = 0.1225
    elseif ping < 40 then
        SilentPrediction = 0.1256
    end
end

local i = 0
RunService.RenderStepped:Connect(function(FramesPerSecond)
    if Silent == true and TargetStrafe == true then
        i = i + FramesPerSecond / StrafeSpeed % 1
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position) * CFrame.Angles(0, 2 * math.pi * i, 0) * CFrame.new(0, StrafeHeight, StrafeDistance)
    end
end)

local PlaceBox = Instance.new("Part", game.Workspace) 
PlaceBox.Shape = Enum.PartType.Block
PlaceBox.Material = Enum.Material.SmoothPlastic
spawn(function()
    PlaceBox.Anchored = true
    PlaceBox.CanCollide = false
    PlaceBox.Size = Vector3.new(BoxSize, BoxSize, BoxSize)
    PlaceBox.Transparency = BoxTransparency
end)
RunService.Heartbeat:connect(function()
    if Silent == true then
        local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position)
        Line.Color = TracerColor
        Line.Transparency = TracerTransparency
        Line.Thickness = TracerThickness
        Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
        Line.To = Vector2.new(Vector.X, Vector.Y)
        if SilentTracer == true then
            Line.Visible = true
        end
    elseif Silent == false then
        Line.Visible = false
    end
end)

RunService.RenderStepped:Connect(function()
    if Silent == true and SilentBox == true then
        PlaceBox.CFrame = Plr.Character.HumanoidRootPart.CFrame
        PlaceBox.Size = Vector3.new(BoxSize, BoxSize, BoxSize)
        PlaceBox.Transparency = BoxTransparency
        PlaceBox.Color = BoxColor
    else
        PlaceBox.CFrame = CFrame.new(0, 9999, 0)
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = { ... }
    if Silent and SilentEnabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        if SilentResolver == true then
            args[3] = Plr.Character[SilentHitPart].Position + (Plr.Character.Humanoid.MoveDirection * SilentPrediction * 19.64285714289)
        elseif SilentResolver == false then
            args[3] = Plr.Character[SilentHitPart].Position + (Plr.Character[SilentHitPart].Velocity * SilentPrediction)
        end
        return old(unpack(args))
    end
    return old(...)
end)

local CFrameSpeed1 = false
MovementSection:AddToggle({
    Name = "CFrame Speed",
    Flag = "CFrame_Speed",
    Keybind = 1,
    Callback = function(BoolValue)
        CFrameSpeed1 = BoolValue
    end
})

local CFrameSpeed2 = 2
MovementSection:AddSlider({
    Name = "Speed",
    Flag = "Speed_CFrame",
    Value = 2,
    Precise = 1,
    Min = 0,
    Max = 10,
    Callback = function(SliderValue)
        CFrameSpeed2 = SliderValue
    end
})

game:GetService("RunService").Heartbeat:Connect(function()
    if CFrameSpeed1 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * CFrameSpeed2
    end
end)

local mt = getrawmetatable(game)
local old = mt.__newindex
local Plr = game.Players.LocalPlayer
local bad, otherbad = {"BodyPosition", "BodyVelocity", "BodyGyro"}, {"HumanoidRootPart", "UpperTorso"}
setreadonly(mt, false)
local oldie
oldie = hookfunc(Instance.new, newcclosure(function(e, i, ...) 
    if i and table.find(bad, e) and table.find(otherbad, tostring(i)) and i.Parent == Plr.Character then
        print("reparented")
        return oldie(e, Plr.Character.LowerTorso, ...)
    end
    return oldie(e, i, ...)
end))
mt.__newindex = newcclosure(function(t, i, v)
    if Plr.Character and table.find(bad, t.ClassName) and i == "Parent" and (table.find(otherbad, tostring(v)) and v.Parent == Plr.Character) then
        print("reparented")
        return old(t, i, Plr.Character.LowerTorso)
    end
    return old(t, i, v)
end)
setreadonly(mt, true)

local FlySpeed = 1
local Flying = false
local QEfly = true
local vehicleflyspeed = 3
local IYMouse = game.Players.LocalPlayer:GetMouse()
function sFLY(vfly)
	repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until IYMouse
	local T = game.Players.LocalPlayer.Character.LowerTorso
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 5
	local function FLY()
		Flying = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
				if not vfly and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not Flying
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	IYMouse.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if vfly then
				CONTROL.F = vehicleflyspeed
			else
				CONTROL.F = FlySpeed
			end
		elseif KEY:lower() == 's' then
			if vfly then
				CONTROL.B = - vehicleflyspeed
			else
				CONTROL.B = - FlySpeed
			end
		elseif KEY:lower() == 'a' then
			if vfly then
				CONTROL.L = - vehicleflyspeed
			else
				CONTROL.L = - FlySpeed
			end
		elseif KEY:lower() == 'd' then 
			if vfly then
				CONTROL.R = vehicleflyspeed
			else
				CONTROL.R = FlySpeed
			end
		elseif QEfly and KEY:lower() == 'e' then
			if vfly then
				CONTROL.Q = vehicleflyspeed*2
			else
				CONTROL.Q = FlySpeed*2
			end
		elseif QEfly and KEY:lower() == 'q' then
			if vfly then
				CONTROL.E = -vehicleflyspeed*2
			else
				CONTROL.E = -FlySpeed*2
			end
		end
	end)
	IYMouse.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end
function NOFLY()
	Flying = false
	game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end
function fly()
    NOFLY()
    wait()
    sFLY()
end

local Flight = false
MovementSection:AddToggle({
    Name = "Fly",
    Flag = "Fly",
    Keybind = 1,
    Callback = function(BoolValue)
        local Flight = BoolValue
        if Flight == true then
            fly()
            Flight = false
        elseif Flight == false then
            NOFLY()
            Flight = true
        end
    end
})

MovementSection:AddSlider({
    Name = "Speed",
    Flag = "Fly_Speed",
    Value = 1,
    Precise = 1,
    Min = 0,
    Max = 10,
    Callback = function(SliderValue)
        FlySpeed = SliderValue
    end
})

local ChosenGun = "[AK47] - $2318"
local ChosenOther = "[Chicken] - $7"
local ChosenArmor = "[High-Medium Armor] - $2163"
local ChosenAmmo = "100 [AR Ammo] - $77"
local ChosenMisc = "[AntiBodies] - $103"
local ChosenMelee = "[Bat] - $258"
local ReturnPosition = CFrame.new()
local AmmoSelected = false
local MeleeSelected = false
local MiscSelected = false
local GunSelected = true
local OtherSelected = false
local ArmorSelected = false
local Client = game.Players.LocalPlayer
function PurchaseItem()
    if GunSelected == true and not MeleeSelected and not MiscSelected and not AmmoSelected and not OtherSelected and not ArmorSelected and ChosenGun ~= nil then
        ReturnPosition = Client.Character.HumanoidRootPart.CFrame
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenGun].Head.CFrame
        wait(0.05)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenGun].ClickDetector, 0)
        task.wait(1)
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenGun].Head.CFrame
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenGun].ClickDetector, 0)
        task.wait()
        Client.Character.HumanoidRootPart.CFrame = ReturnPosition
    end
    if MeleeSelected == true and not GunSelected and not MiscSelected and not AmmoSelected and not OtherSelected and not ArmorSelected and ChosenMelee ~= nil then
        ReturnPosition = Client.Character.HumanoidRootPart.CFrame
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenMelee].Head.CFrame
        wait(0.05)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenMelee].ClickDetector, 0)
        task.wait(1)
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenMelee].Head.CFrame
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenMelee].ClickDetector, 0)
        task.wait()
        Client.Character.HumanoidRootPart.CFrame = ReturnPosition
    end
    if MiscSelected == true and not GunSelected and not MeleeSelected and not AmmoSelected and not OtherSelected and not ArmorSelected and ChosenMisc ~= nil then
        ReturnPosition = Client.Character.HumanoidRootPart.CFrame
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenMisc].Head.CFrame
        wait(0.05)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenMisc].ClickDetector, 0)
        task.wait(1)
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenMisc].Head.CFrame
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenMisc].ClickDetector, 0)
        task.wait()
        Client.Character.HumanoidRootPart.CFrame = ReturnPosition
    end
    if AmmoSelected == true and not MeleeSelected and not MiscSelected and not GunSelected and not OtherSelected and not ArmorSelected and ChosenAmmo ~= nil then
        ReturnPosition = Client.Character.HumanoidRootPart.CFrame
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenAmmo].Head.CFrame
        wait(0.05)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenAmmo].ClickDetector, 0)
        task.wait(1)
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenAmmo].Head.CFrame
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenAmmo].ClickDetector, 0)
        task.wait()
        Client.Character.HumanoidRootPart.CFrame = ReturnPosition
    end
    if OtherSelected == true and not MeleeSelected and not MiscSelected and not AmmoSelected and not GunSelected and not ArmorSelected and ChosenOther ~= nil then
        ReturnPosition = Client.Character.HumanoidRootPart.CFrame
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenOther].Head.CFrame
        wait(0.05)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenOther].ClickDetector, 0)
        task.wait(1)
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenOther].Head.CFrame
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenOther].ClickDetector, 0)
        task.wait()
        Client.Character.HumanoidRootPart.CFrame = ReturnPosition
    end
    if ArmorSelected == true and not MeleeSelected and not MiscSelected and not AmmoSelected and not OtherSelected and not GunSelected and ChosenArmor ~= nil then
        ReturnPosition = Client.Character.HumanoidRootPart.CFrame
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenArmor].Head.CFrame
        wait(0.05)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenArmor].ClickDetector, 0)
        task.wait(1)
        Client.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[ChosenArmor].Head.CFrame
        fireclickdetector(game:GetService("Workspace").Ignored.Shop[ChosenArmor].ClickDetector, 0)
        task.wait()
        Client.Character.HumanoidRootPart.CFrame = ReturnPosition
    end
end

AutoBuySection:Button{
    Name = "Purchase",
    Callback = function()
        PurchaseItem()
    end
}

AutoBuySection:AddDropdown({
    Name = "Type",
    Flag = "Auto_Buy_Type",
    List = {"Gun", "Ammo", "Food", "Armor", "Melee", "Misc"},
    Callback = function(Value)
        if Value == "Gun" then
            MeleeSelected = false
            MiscSelected = false
            GunSelected = true
            AmmoSelected = false
            OtherSelected = false
            ArmorSelected = false
        elseif Value == "Ammo" then
            MeleeSelected = false
            MiscSelected = false
            AmmoSelected = true
            OtherSelected = false
            GunSelected = false
            ArmorSelected = false
        elseif Value == "Food" then
            MeleeSelected = false
            MiscSelected = false
            OtherSelected = true
            AmmoSelected = false
            GunSelected = false
            ArmorSelected = false
        elseif Value == "Armor" then
            MeleeSelected = false
            MiscSelected = false
            ArmorSelected = true
            AmmoSelected = false
            GunSelected = false
            OtherSelected = false
        elseif Value == "Melee" then
            MeleeSelected = true
            MiscSelected = false
            ArmorSelected = false
            AmmoSelected = false
            GunSelected = false
            OtherSelected = false
        elseif Value == "Misc" then
            MeleeSelected = false
            MiscSelected = true
            ArmorSelected = false
            AmmoSelected = false
            GunSelected = false
            OtherSelected = false
        end
    end
})

AutoBuySection:AddDropdown({
    Name = "Gun",
    Flag = "Gun",
    List = {"[AK47] - $2318", "[AR] - $1030", "[AUG] - $2421", "[Double-Barrel SG] - $1391", "[DrumGun] - $3090", "[Flamethrower] - $25750", "[Glock] - $515", "[GrenadeLauncher] - $10300", "[LMG] - $3863", "[P90] - $1030", "[RPG] - $6180", "[Revolver] - $1339", "[Rifle] - $1597", "[SMG] - $773", "[Shotgun] - $1288", "[SilencerAR] - $1288", "[Silencer] - $412", "[TacticalShotgun] - $1803"},
    Callback = function(Value)
        ChosenGun = Value
    end
})

AutoBuySection:AddDropdown({
    Name = "Ammo",
    Flag = "Ammo",
    List = {"100 [AR Ammo] - $77", "100 [DrumGun Ammo] - $206", "12 [GrenadeLauncher Ammo] - $3090", "12 [Revolver Ammo] - $77", "120 [P90 Ammo] - $62", "120 [SilencerAR Ammo] - $77", "140 [Flamethrower Ammo] - $1597", "18 [Double-Barrel SG Ammo] - $62", "20 [Shotgun Ammo] - $62", "20 [TacticalShotgun Ammo] - $62", "200 [LMG Ammo] - $309", "25 [Glock Ammo] - $62", "25 [Silencer Ammo] - $52", "30 [Glock Ammo] - $62", "5 [RPG Ammo] - $1030", "5 [Rifle Ammo] - $258", "80 [SMG Ammo] - $62", "90 [AK47 Ammo] - $82", "90 [AUG Ammo] - $82"},
    Callback = function(Value)
        ChosenAmmo = Value
    end
})

AutoBuySection:AddDropdown({
    Name = "Food",
    Flag = "Food",
    List = {"[Chicken] - $7", "[Cranberry] - $3", "[Da Milk] - $7", "[Donut] - $10", "[Hamburger] - $10", "[HotDog] - $8", "[Lemonade] - $3", "[Lettuce] - $5", "[Meat] - $12", "[Pizza] - $10", "[Popcorn] - $7", "[Starblox Latte] - $5", "[Taco] - $2"},
    Callback = function(Value)
        ChosenOther = Value
    end
})

AutoBuySection:AddDropdown({
    Name = "Armor",
    Flag = "Armor",
    List = {"[High-Medium Armor] - $2163", "[Medium Armor] - $1030", "[Fire Armor] - $2060"},
    Callback = function(Value)
        ChosenArmor = Value
    end
})

AutoBuySection:AddDropdown({
    Name = "Melee",
    Flag = "Melee",
    List = {"[Bat] - $258", "[Knife] - $155", "[Pencil] - $180", "[Pitchfork] - $330", "[SledgeHammer] - $361", "[StopSign] - $309", "[Nunchucks] - $464"},
    Callback = function(Value)
        ChosenMelee = Value
    end
})

AutoBuySection:AddDropdown({
    Name = "Misc",
    Flag = "Misc",
    List = {"[AntiBodies] - $103", "[Basketball] - $103", "[Breathing Mask] - $62", "[BrownBag] - $26", "[Camera] - $103", "[Firework] - $10300", "[Flashbang] - $567", "[Flashlight] - $10", "[Flowers] - $5", "[Grenade] - $1288", "[HeavyWeights] - $258", "[Hockey Mask] - $62", "[Key] - $129", "[LockPicker] - $103", "[Money Gun] - $800", "[Ninja Mask] - $62", "[Old Phone] - $103", "[Orange Phone] - $412", "[Original Phone] - $52", "[Paintball Mask] - $62", "[PepperSpray] - $155", "[PinkPhone] - $412", "[Pumpkin Mask] - $62", "[Skull Mask] - $62", "[Surgeon Mask] - $26", "[Taser] - $1030", "[TearGas] - $5150", "[Tele] - $155", "[Weights] - $124", "[iPhoneB] - $618", "[iPhoneG] - $618", "[iPhoneP] - $618", "[iPhone] - $618"},
    Callback = function(Value)
        ChosenMisc = Value
    end
})


local Client = game.Players.LocalPlayer
Client.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
end)

getgenv().Underground = false
AntiSection:AddToggle({
    Name = "Underground Anti-Aim",
    Flag = "Underground",
    Keybind = 1,
    Callback = function(BoolValue)
        getgenv().Underground = BoolValue
    end
})

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Underground == true then
        local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-50000,0)
        game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
    end
end)

getgenv().Sky = false
AntiSection:AddToggle({
    Name = "Sky Anti-Aim",
    Flag = "Sky",
    Keybind = 1,
    Callback = function(BoolValue)
        getgenv().Sky = BoolValue
    end
})

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Sky == true then
        print("hi")
        local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,50000,0)
        game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
    end
end)

getgenv().Random = false
AntiSection:AddToggle({
    Name = "Random Anti-Aim",
    Flag = "Random",
    Keybind = 1,
    Callback = function(BoolValue)
        getgenv().Random = BoolValue
    end
})

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Random == true then
        local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(0,1000),math.random(0,1000),math.random(0,1000))
        game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
    end
end)
