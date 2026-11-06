-- Recovered Luau source by ZeroVector
local v = game
local v2 = Instance
local v3 = Vector3
local v4 = require
local v5 = CFrame
local new = v2 and v2.new
local new2 = v5 and v5.new
local new3 = v3 and v3.new
local ReplicatedStorage = v:GetService("ReplicatedStorage")
local Players = v:GetService("Players")
local v6 = v4(ReplicatedStorage.Data.PetRegistry)
local v7 = v4(ReplicatedStorage.Data.PetRegistry.PetList)
local v8 = v4(ReplicatedStorage.Data.SeedData)
local str = ""
local str2 = ""
local str3 = ""
local str4 = ""
local str5 = ""

local function fn(arg)
    for k, v9 in Players.LocalPlayer.Character:GetChildren() do
        if v9:IsA("Tool") and v9:GetAttribute("SeedNamee") == arg then
            return v9
        end
    end

    for k, v9 in Players.LocalPlayer.Backpack:GetChildren() do
        if v9:IsA("Tool") and v9:GetAttribute("SeedNamee") == arg then
            return v9
        end
    end
end

local function fn2(arg)
    for k, v9 in Players.LocalPlayer.Character:GetChildren() do
        if v9:IsA("Tool") and v9:GetAttribute("EggNamee") == arg then
            return v9
        end
    end

    for k, v9 in Players.LocalPlayer.Backpack:GetChildren() do
        if v9:IsA("Tool") and v9:GetAttribute("EggNamee") == arg then
            return v9
        end
    end
end

local v9 = loadstring(v:HttpGet("https://sirius.menu/rayfield"))():CreateWindow({
    Name = "Dark Spawner",
    LoadingTitle = "Dark Spawner",
    LoadingSubtitle = "Made by whqtt",
    Theme = "Default",
})

local v10 = v9:CreateTab("Pet Spawner", 136232391555861)
v10:CreateSection("Pet Spawner")
local v11 = v9:CreateTab("Seed Spawner", 111869302762063)
v11:CreateSection("Seed Spawner")
local v12 = v9:CreateTab("Egg Spawner", 133763620419151)
v12:CreateSection("Egg Spawner")

v10:CreateInput({
    Name = "Pet Name",
    CurrentValue = "",
    PlaceholderText = "Raccoon",
    RemoveTextAfterFocusLost = false,
    Callback = function(arg)
        str = arg
    end,
})

v10:CreateInput({
    Name = "Pet Weight",
    CurrentValue = "",
    PlaceholderText = "1",
    RemoveTextAfterFocusLost = false,
    Callback = function(arg)
        str2 = arg
    end,
})

v10:CreateInput({
    Name = "Pet Age",
    CurrentValue = "",
    PlaceholderText = "1",
    RemoveTextAfterFocusLost = false,
    Callback = function(arg)
        str3 = arg
    end,
})

v10:CreateButton({
    Name = "Spawn",
    Callback = function()
        local v13 = v7[str]
        local num = tonumber(str2)
        local num2 = tonumber(str3)

        if v13 and num and num2 then
            local Tool = new("Tool")
            Tool.Name = str .. " [" .. string.format("%.2f", num) .. " KG] [Age " .. math.floor(num2) .. "]"
            Tool.Grip = new2(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            Tool:SetAttribute("ItemType", "Pet")
            local Part = new("Part")
            Part.Name = "Handle"
            Part.Transparency = 1
            Part.Size = new3(0.1, 0.1, 0.1)
            Part.Parent = Tool
            local clone = v13.Model:Clone()
            clone.Parent = Part
            clone:ScaleTo(num / (1 + v6.PetConfig.WEIGHT_CONFIG.SCALE_PERCENTAGE_OF_BASE_WEIGHT_PER_LEVEL * num2) + v13.ModelScalePerLevel * num)

            for k, v14 in clone:GetDescendants() do
                if v14:IsA("BasePart") then
                    v14.CanCollide = false
                    v14.Massless = true
                end
            end

            local Weld = new("Weld")
            Weld.Name = "Handle_RootPart_WELD"
            local toolWeldOffset = v13.ToolWeldOffset
            local weldOffset = toolWeldOffset and v13.WeldOffset or new2(0, 0, 0, 0, 0, -1, 1, 0, 0, 0, -1, 0)
            Weld.C0 = weldOffset
            Weld.C1 = new2(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            Weld.Part0 = Part
            Weld.Part1 = clone.RootPart
            Weld.Parent = clone.RootPart
            local v14 = nil

            Tool.Equipped:Connect(function()
                v14 = clone.AnimationController:LoadAnimation(v13.Animations.Idle)
                v14:Play()
            end)

            Tool.Unequipped:Connect(function()
                if v14 then
                    v14:Stop()
                    v14:Destroy()
                    v14 = nil
                end
            end)

            Tool.Parent = Players.LocalPlayer.Backpack
        end
    end,
})

v11:CreateInput({
    Name = "Seed Name",
    CurrentValue = "",
    PlaceholderText = "Carrot",
    RemoveTextAfterFocusLost = false,
    Callback = function(arg)
        str4 = arg
    end,
})

v11:CreateButton({
    Name = "Spawn",
    Callback = function()
        local v13 = v8[str4]

        if v13 then
            local v14 = fn(v13.SeedName)
            local Tool = v14 or new("Tool")
            local attribute = Tool:GetAttribute("Quantity")
            local n = attribute or 0
            local n2 = n + 1
            Tool.Name = v13.SeedName .. " [X" .. n2 .. "]"
            Tool.Grip = new2(0.200000003, -0.448717117, 0.231557086, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            Tool:SetAttribute("ItemType", "Holdable")
            Tool:SetAttribute("SeedNamee", v13.SeedName)
            Tool:SetAttribute("Quantity", n2)
            if v14 then
                return
            end
            local clone = ReplicatedStorage.Seed_Models:FindFirstChild(str4):Clone()
            clone.Name = "Handle"
            clone.Parent = Tool
            Tool.Parent = Players.LocalPlayer.Backpack
        end
    end,
})

v12:CreateInput({
    Name = "Egg Name",
    CurrentValue = "",
    PlaceholderText = "Night Egg",
    RemoveTextAfterFocusLost = false,
    Callback = function(arg)
        str5 = arg
    end,
})

v12:CreateButton({
    Name = "Spawn",
    Callback = function()
        local v13 = ReplicatedStorage.Assets.Models.EggModels:FindFirstChild(str5)

        if v13 then
            local v14 = fn2(v13.Name)
            local Tool = v14 or new("Tool")
            local attribute = Tool:GetAttribute("Quantity")
            local n = attribute or 0
            local n2 = n + 1
            Tool.Name = v13.Name .. " x" .. n2
            Tool.Grip = new2(0, -0.800000072, -1.4000001, 0, 1, 0, 0, 0, -1, -1, 0, 0)
            Tool:SetAttribute("ItemType", "PetEgg")
            Tool:SetAttribute("EggNamee", v13.Name)
            Tool:SetAttribute("Quantity", n2)
            if v14 then
                return
            end
            local Part = new("Part")
            Part.Name = "Handle"
            Part.Transparency = 1
            Part.Size = new3(2, 2, 2)
            Part.Parent = Tool
            local Animation = new("Animation")
            Animation.Name = "Hold"
            Animation.AnimationId = "rbxassetid://113938302810353"
            Animation.Parent = Tool
            local clone = v13:Clone()
            clone.Parent = Part

            for k, v15 in clone:GetDescendants() do
                if v15:IsA("BasePart") then
                    v15.CanCollide = false
                    v15.Massless = true
                end
            end

            local Weld = new("Weld")
            Weld.Name = "Handle_HitBox_WELD"
            Weld.C0 = new2(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            Weld.C1 = new2(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            Weld.Part0 = Part
            Weld.Part1 = clone.HitBox
            Weld.Parent = clone.HitBox
            local v15 = nil

            Tool.Equipped:Connect(function()
                v15 = Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animation)
                v15:Play()
            end)

            Tool.Unequipped:Connect(function()
                if v15 then
                    v15:Stop()
                    v15:Destroy()
                    v15 = nil
                end
            end)

            Tool.Parent = Players.LocalPlayer.Backpack
        end
    end,
})
