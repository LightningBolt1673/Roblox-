local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local welcomeEvent = ReplicatedStorage:WaitForChild("WelcomeEvent")

local function showWelcome(message)
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WelcomeGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4,0,0.08,0)
    label.Position = UDim2.new(0.3,0,0.05,0)
    label.BackgroundTransparency = 0.3
    label.TextScaled = true
    label.Text = message
    label.Parent = screenGui

    delay(3, function()
        if screenGui then
            screenGui:Destroy()
        end
    end)
end

welcomeEvent.OnClientEvent:Connect(showWelcome)
