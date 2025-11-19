-- Paste this LocalScript into StarterPlayer > StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "HelloGui"
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.3, 0, 0.06, 0)
label.Position = UDim2.new(0.35, 0, 0.02, 0)
label.TextScaled = true
label.Text = "Hello, "..player.Name.."!"
label.Parent = gui

delay(3, function() if gui then gui:Destroy() end end)
