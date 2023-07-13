--// Anti-Cheat Bypass
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

--// Variables
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer
local Line = Drawing.new("Line")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Client = Players.LocalPlayer
local Character = Client.Character
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
local Plr

--// New Character
Client.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
end)

--// Notification Function
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local function SendNotification(Title, Message, Time)
    Notification:Notify(
        {Title = Title, Description = Message},
        {OutlineColor = Color3.fromRGB(170, 255, 0),Time = Time, Type = "default"},
        {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
    )
end

--// Notification
SendNotification("Poison","Welcome To Poison: " .. tostring(game.Players.LocalPlayer), 5)
SendNotification("Poison","Made by: @bleedoutnigga (Skid wxp)", 5)

--// Toggles
--// Speed
Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (getgenv().SpeedConfig.Key) then
        if getgenv().SpeedConfig.Enabled == false then
            SendNotification("Poison", "Enabled: Speed", 2)
            getgenv().SpeedConfig.Enabled = true
        elseif getgenv().SpeedConfig.Enabled == true then
            SendNotification("Poison", "Disabled: Speed", 2)
            getgenv().SpeedConfig.Enabled = false
        end
    end
end)

--// Anti-Lock
Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (getgenv().AntiConfig.Key) then
        if getgenv().AntiConfig.Enabled == false then
            SendNotification("Poison", "Enabled: Anti-Lock", 2)
            getgenv().AntiConfig.Enabled = true
        elseif getgenv().AntiConfig.Enabled == true then
            SendNotification("Poison", "Disabled: Anti-Lock", 2)
            getgenv().AntiConfig.Enabled = false
        end
    end
end)

--// Resolver
Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (getgenv().ResolverConfig.Key) then
        if getgenv().ResolverConfig.Enabled == false then
            SendNotification("Poison", "Enabled: Resolver", 2)
            getgenv().ResolverConfig.Enabled = true
        elseif getgenv().ResolverConfig.Enabled == true then
            SendNotification("Poison", "Disabled: Resolver", 2)
            getgenv().ResolverConfig.Enabled = false
        end
    end
end)

--// Speed
RunService.Heartbeat:Connect(function()
    if getgenv().SpeedConfig.Enabled then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().SpeedConfig.Speed
    end
end)

--// Anti-Lock
RunService.Heartbeat:Connect(function()
    if getgenv().ResolverConfig.Enabled then
        local CurrentVelocity = HumanoidRootPart.Velocity
        HumanoidRootPart.Velocity = getgenv().ResolverConfig.Velocity
        RunService.RenderStepped:Wait()
        HumanoidRootPart.Velocity = CurrentVelocity
    end
end)

--// Silent Toggle
Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (getgenv().SilentConfig.Key) then
        if getgenv().SilentConfig.Enabled == true then
            Plr = FindClosestPlayer()
            getgenv().SilentConfig.Enabled = false
            if getgenv().SilentConfig.Notifications == true then
                SendNotification("Poison", "Unlocked", 2)
            end
        elseif getgenv().SilentConfig.Enabled == false then
            Plr = FindClosestPlayer()
            getgenv().SilentConfig.Enabled = true
            if getgenv().SilentConfig.Notifications == true then
                SendNotification("Poison", "Locked: " .. tostring(Plr.Character.Humanoid.DisplayName), 2)
            end
        end
    end
end)

--// Down Check
if getgenv().SilentConfig.DownCheck == true then
    function FindClosestPlayer()
        local ClosestDistance, ClosestPlayer = math.huge, nil;
        for _, Player in next, game:GetService("Players"):GetPlayers() do
            local DownChecking = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil
            if Player ~= LocalPlayer then
                local Character = Player.Character
                if Character and DownChecking then
                    local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Positon)
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
        return ClosestPlayer, ClosestDistance
    end
end

--// Grabbed Check
if getgenv().SilentConfig.GrabbedCheck == true then
    function FindClosestPlayer()
        local ClosestDistance, ClosestPlayer = math.huge, nil;
        for _, Player in next, game:GetService("Players"):GetPlayers() do
            local CheckingForGrab = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
            if Player ~= LocalPlayer then
                local Character = Player.Character
                if Character and Character.Humanoid.Health > 1 and CheckingForGrab then
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
    return ClosestPlayer, ClosestDistance
    end
end

--// Tracer
RunService.Heartbeat:connect(function()
    if getgenv().SilentConfig.Enabled == true then
        local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position)
        Line.Color = getgenv().TracerConfig.Color
        Line.Transparency = getgenv().TracerConfig.Transparency
        Line.Thickness = getgenv().TracerConfig.Thickness
        Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
        Line.To = Vector2.new(Vector.X, Vector.Y)
        if getgenv().TracerConfig.Enabled == true then
            Line.Visible = true
        end
    elseif getgenv().SilentConfig.Enabled == false then
        Line.Visible = false
    end
end)

--// Main
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = { ... }
    if getgenv().SilentConfig.Enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        if getgenv().ResolverConfig.Enabled == true then
            args[3] = Plr.Character[getgenv().SilentConfig.Part].Position + (Plr.Character.Humanoid.MoveDirection * getgenv().ResolverConfig.Prediction)
        elseif getgenv().ResolverConfig.Enabled == false then
            args[3] = Plr.Character[getgenv().SilentConfig.Part].Position + (Plr.Character[getgenv().SilentConfig.Part].Velocity * getgenv().SilentConfig.Prediction)
        end
        return old(unpack(args))
    end
    return old(...)
end)
