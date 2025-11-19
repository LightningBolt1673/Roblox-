local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local welcomeEvent = ReplicatedStorage:FindFirstChild("WelcomeEvent")
if not welcomeEvent then
    welcomeEvent = Instance.new("RemoteEvent")
    welcomeEvent.Name = "WelcomeEvent"
    welcomeEvent.Parent = ReplicatedStorage
end

Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local points = Instance.new("IntValue")
    points.Name = "Points"
    points.Value = 0
    points.Parent = leaderstats

    local part = Instance.new("Part")
    part.Name = "WelcomePart"
    part.Size = Vector3.new(10,1,10)
    part.Position = Vector3.new(0, 5, 0)
    part.Anchored = true
    part.BrickColor = BrickColor.new("Bright yellow")
    part.Parent = workspace

    welcomeEvent:FireClient(player, "Welcome to the place, "..player.Name.."!")
end)
