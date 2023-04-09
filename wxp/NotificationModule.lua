local module = {}
local AddedNotification = script:WaitForChild("AddedNotification")	

function module:NotifyPlayer(player, text)
	local PlayerGui = player:WaitForChild("PlayerGui")
	local AddedNotification = Instance.new("Frame")
	local Notification_Border = Instance.new("Frame")
	local Notification_Text = Instance.new("TextLabel")
	AddedNotification.Name = "AddedNotification"
	AddedNotification.Parent = game.ReplicatedStorage.Notifications
	AddedNotification.AnchorPoint = Vector2.new(0.300000012, 0.100000001)
	AddedNotification.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	AddedNotification.BorderSizePixel = 0
	AddedNotification.Position = UDim2.new(0.0316395015, 0, 0.0960099772, 0)
	AddedNotification.Size = UDim2.new(0, 0, 0, 29)

	Notification_Border.Name = "Notification_Border"
	Notification_Border.Parent = AddedNotification
	Notification_Border.AnchorPoint = Vector2.new(0.300000012, 0.100000001)
	Notification_Border.BackgroundColor3 = Color3.fromRGB(125, 0, 200)
	Notification_Border.BorderSizePixel = 0
	Notification_Border.ClipsDescendants = true
	Notification_Border.Size = UDim2.new(0, 2, 0, 0)

	Notification_Text.Name = "Notification_Text"
	Notification_Text.Parent = AddedNotification
	Notification_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Notification_Text.BackgroundTransparency = 1.000
	Notification_Text.ClipsDescendants = true
	Notification_Text.Position = UDim2.new(0.0296610165, 0, 0, 0)
	Notification_Text.Size = UDim2.new(0, 0, 0, 29)
	Notification_Text.Font = Enum.Font.GothamBold
	Notification_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
	Notification_Text.TextSize = 14.000
	Notification_Text.TextXAlignment = Enum.TextXAlignment.Left
	local NotificationsGui = PlayerGui.Notification_Main:WaitForChild("Notification_Layout_1")

	local newNotify = AddedNotification:Clone()
	newNotify.Parent = NotificationsGui
	wait()
	newNotify.Notification_Text.Text = text
	newNotify.Notification_Border:TweenSize(
		UDim2.new(0, 2,0, 29),
		"Out",
		"Quad",
		0.25,
		true
	)
	newNotify.Notification_Border:TweenPosition(
		UDim2.new(-0.002, 0,0.1, 0),
		"Out",
		"Quad",
		0.25,
		true
	)
	wait(0.5)
	newNotify:TweenSize(
		UDim2.new(0, 240,0, 29),
		"Out",
		"Quad",
		0.5,
		true
	)
	newNotify:TweenPosition(
		UDim2.new(0.101, 0,0.096, 0),
		"Out",
		"Quad",
		0.5,
		false
	)
	newNotify.Notification_Text:TweenSize(
		UDim2.new(0, 200,0, 29),
		"Out",
		"Quad",
		0.5,
		false
	)
	wait(3)
	newNotify.Notification_Text:TweenSize(
		UDim2.new(0, 0,0, 29),
		"Out",
		"Quad",
		0.5,
		false
	)
	newNotify:TweenSize(
		UDim2.new(0, 0,0, 29),
		"Out",
		"Quad",
		0.5,
		true
	)
	newNotify:TweenPosition(
		UDim2.new(0.032, 0,0.096, 0),
		"Out",
		"Quad",
		0.5,
		true
	)
	wait(0.5)
	newNotify.Notification_Border:TweenSize(
		UDim2.new(0, 2,0, 0),
		"Out",
		"Quad",
		0.25,
		true
	)
	newNotify.Notification_Border:TweenPosition(
		UDim2.new(0, 0,0, 0),
		"Out",
		"Quad",
		0.25,
		true
	)
	coroutine.wrap(function()
		wait(1)
		newNotify:Destroy()
	end)()
end

return module
