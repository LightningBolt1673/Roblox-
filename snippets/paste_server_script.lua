-- Paste this into a Script under ServerScriptService in Roblox Studio
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    print("Player joined:", player.Name)
    local part = Instance.new("Part")
    part.Name = "SpawnPart"
    part.Size = Vector3.new(6,1,6)
    part.Position = Vector3.new(0,5,0)
    part.Anchored = true
    part.Parent = workspace
end)
