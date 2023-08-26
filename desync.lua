if _G.conz ~= nil and type(_G.conz) ==  'table' then
    table.foreach(_G.conz, function(i,v) v:Disconnect() end)
    table.clear(_G.conz)
    print('restart')
end

_G.conz = {}
_G.desync_conz  = {}
_G.toggled = false
local desync_delay = 0.4

local plrs = game:GetService('Players')
local run = game:GetService('RunService')
local uis = game:GetService('UserInputService')

local plr = plrs.LocalPlayer

table.insert(_G.conz, uis.InputBegan:Connect(function(input, proccessed)
    if proccessed then
        return
    end

    local key_code = input.KeyCode

    if key_code == Enum.KeyCode.F then
        _G.toggled = not _G.toggled
        game:GetService('StarterGui'):SetCore('SendNotification', {
            Title = tostring(_G.toggled),
            Text = tostring(_G.toggled),
            Duration = 3;
        })
        table.foreach(_G.desync_conz, function(i,v) v:Disconnect() end)
        print(_G.toggled)
    end
end))

while task.wait() do
    if _G.toggled == true then
        if plr and plr.Character ~= nil then   
            local loop = run.Heartbeat:Connect(function()
                sethiddenproperty(plr.Character.HumanoidRootPart, "NetworkIsSleeping", true)
                task.wait()
                sethiddenproperty(plr.Character.HumanoidRootPart, "NetworkIsSleeping", false)
            end)
            table.insert(_G.desync_conz, loop)
            task.wait(desync_delay)
            if loop ~= nil then
                loop:Disconnect()
            end
        end
    end
end
