-- Leaderboard UI: displays player's Points from leaderstats
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LeaderboardGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.18, 0, 0.06, 0)
label.Position = UDim2.new(0.02, 0, 0.02, 0)
label.BackgroundTransparency = 0.4
label.TextScaled = true
label.Text = "Points: 0"
label.Parent = screenGui

local function bindPoints()
    local ls = player:FindFirstChild("leaderstats")
    if not ls then return end
    local points = ls:FindFirstChild("Points")
    if not points then return end

    label.Text = "Points: "..tostring(points.Value)
    points:GetPropertyChangedSignal("Value"):Connect(function()
        label.Text = "Points: "..tostring(points.Value)
    end)
end

-- Try to bind now and when character loads in case leaderstats is added later
bindPoints()
player.CharacterAdded:Connect(function()
    wait(0.5)
    bindPoints()
end)
