-- Coin spawner: periodically spawns coins that give Points when touched
local Players = game:GetService("Players")
local spawnInterval = 8 -- seconds between coins
local coinFolder = workspace:FindFirstChild("Coins") or Instance.new("Folder")
coinFolder.Name = "Coins"
coinFolder.Parent = workspace

local function spawnCoin()
    local coin = Instance.new("Part")
    coin.Name = "Coin"
    coin.Shape = Enum.PartType.Ball
    coin.Size = Vector3.new(1,1,1)
    coin.BrickColor = BrickColor.new("Bright yellow")
    coin.Position = Vector3.new(math.random(-30,30), 5, math.random(-30,30))
    coin.Anchored = false
    coin.CanCollide = false
    coin.Parent = coinFolder

    local touchedConn
    touchedConn = coin.Touched:Connect(function(hit)
        local character = hit.Parent
        local player = Players:GetPlayerFromCharacter(character)
        if player then
            local ls = player:FindFirstChild("leaderstats")
            if ls then
                local points = ls:FindFirstChild("Points")
                if points then
                    points.Value = points.Value + 1
                end
            end
            if touchedConn then
                touchedConn:Disconnect()
            end
            coin:Destroy()
        end
    end)
end

while true do
    spawnCoin()
    wait(spawnInterval)
end
