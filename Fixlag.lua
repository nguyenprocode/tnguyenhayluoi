-- Function to optimize the game environment
local function optimizeGame()
    -- Remove fog effects
    local lighting = game:GetService("Lighting")
    if lighting:FindFirstChildOfClass("Atmosphere") then
        lighting:FindFirstChildOfClass("Atmosphere"):Destroy()
    end
    if lighting:FindFirstChildOfClass("Sky") then
        lighting:FindFirstChildOfClass("Sky"):Destroy()
    end
    lighting.FogEnd = 1000000 -- Disable fog by setting a very high value

    -- Function to optimize a single part
    local function optimizePart(part)
        if part:IsA("BasePart") then
            part.Material = Enum.Material.SmoothPlastic
            part.Color = Color3.fromRGB(200, 200, 200) -- Light gray color
        end

        -- Remove all textures
        for _, child in ipairs(part:GetChildren()) do
            if child:IsA("Texture") or child:IsA("Decal") then
                child:Destroy()
            end
        end
    end

    -- Function to traverse and optimize all objects
    local function traverseAndOptimize(object)
        for _, child in ipairs(object:GetDescendants()) do
            optimizePart(child)
        end
    end

    -- Optimize all parts in the game
    traverseAndOptimize(workspace)
end

-- Execute the optimization function
optimizeGame()

print("Game optimization completed!")
