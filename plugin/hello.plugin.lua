-- Simple Roblox Studio plugin: inserts a part at origin
local toolbar = plugin:CreateToolbar("Roblox-Tools")
local button = toolbar:CreateButton("InsertPart", "Insert a part into Workspace at origin", "")

button.Click:Connect(function()
    local part = Instance.new("Part")
    part.Name = "InsertedByPlugin"
    part.Size = Vector3.new(4,1,4)
    part.Position = Vector3.new(0,5,0)
    part.Parent = workspace
end)
