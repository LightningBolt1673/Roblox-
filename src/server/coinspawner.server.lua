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

    -- Add a small particle effect to make coins visible and a placeholder sound
    local particle = Instance.new("ParticleEmitter")
    particle.Name = "CoinTrail"
    particle.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0))
    particle.LightEmission = 0.7
    particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6), NumberSequenceKeypoint.new(1, 0)})
    particle.Rate = 20
    particle.Lifetime = NumberRange.new(0.4, 0.8)
    particle.Speed = NumberRange.new(0, 1)
    particle.Parent = coin

    local pickupSound = Instance.new("Sound")
    pickupSound.Name = "PickupSound"
    -- Replace SoundId with your preferred asset id, for example: "rbxassetid://18435260"
    pickupSound.SoundId = ""
    pickupSound.Volume = 1
    pickupSound.Parent = coin

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

            -- Play pickup sound if set
            if pickupSound and pickupSound.SoundId ~= "" then
                pickupSound:Play()
            end

            -- Emit a quick burst of particles at the moment of pickup
            if particle then
                particle:Emit(25)
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
