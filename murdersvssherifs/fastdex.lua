local v8 = game:GetService("Players")
local v9 = game:GetService("TeleportService")
local v10 = game:GetService("ReplicatedStorage")
local v11 = v8.LocalPlayer
local v12 = v10.Remotes:WaitForChild("BuyCase")
local v13 = game:GetService("RunService")
local v14 = game:GetService("VirtualUser")
local v15 = game:GetService("Workspace")
local v16 = game:GetService("UserInputService")
local v10 = game:GetService("ReplicatedStorage")
local v17 = require(v10.Modules:WaitForChild("Item"))
local v18 = v10.Remotes:WaitForChild("TradeItem")
local v19 = v10.Remotes:WaitForChild("Trade")
local v20 = v11.PlayerGui.Main.MainTradingFrame
local v21 = v11:WaitForChild("SkinsFolder")
local v22 = v10.Remotes:WaitForChild("EquipItem")
local v23 = v11:WaitForChild("Backpack")
local v24 = v11:GetMouse()
local v25 = game:GetService("UserInputService")
local v26 = game:GetService("TweenService")
local v27 = v8.LocalPlayer
local v28 = v27:WaitForChild("PlayerGui")
local v29 = game:GetService("HttpService")
local v27 = game:GetService("Players").LocalPlayer
local v30 = game:GetService("RunService")
local v31 = nil
local v32 = v10.Remotes:WaitForChild("TradeItem")
local v8 = game:GetService("Players")
local v29 = game:GetService("HttpService")
local v25 = game:GetService("UserInputService")
task.wait(1)
local v27 = v8.LocalPlayer
if not v27 then
    repeat
        task.wait()
    until v8.LocalPlayer
    v27 = v8.LocalPlayer
end
local v33 = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local v34 = v33:CreateWindow({
    Name = "FastDex - MVS - Crack By TRB",
    LoadingTitle = "FastDex - MVS",
    LoadingSubtitle = "By ! FrannnDev (DecentHolograms)",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FastDexConfig",
        FileName = "MVSFastDex",
    },
    KeySystem = false,
})
local function v35()
    local v151 = 0
    local v153
    local v154
    while true do
        if v151 == 0 then
            local v913 = 0
            while true do
                if 1 == v913 then
                    v151 = 1
                    break
                end
                if v913 == 0 then
                    local v152_1
                    v152_1, v153, v154 = pcall(function()
                        local v1280 = 0
                        local v1282
                        local v1284
                        local v1281
                        local v1283
                        while true do
                            if v1280 == 0 then
                                v1281 = 0
                                v1282 = nil
                                v1280 = 1
                            end
                            if v1280 == 1 then
                                v1283 = nil
                                v1284 = nil
                                v1280 = 2
                            end
                            if v1280 == 2 then
                                local v1285_2 = nil
                                while true do
                                    if v1281 == 0 then
                                        v1282 = v11:FindFirstChildOfClass("PlayerGui")
                                        if not v1282 then
                                            return nil, nil
                                        end
                                        v1281 = 1
                                    end
                                    if v1281 == 4 then
                                        return v1285_2:FindFirstChild("TeamRedFrame"), v1285_2:FindFirstChild("TeamBlueFrame")
                                    end
                                    if v1281 == 3 then
                                        v1285_2 = v1284:FindFirstChild("PlayersFrame")
                                        if not v1285_2 then
                                            return nil, nil
                                        end
                                        v1281 = 4
                                    end
                                    if v1281 == 2 then
                                        v1284 = v1283:FindFirstChild("MainGameFrame")
                                        if not v1284 then
                                            return nil, nil
                                        end
                                        v1281 = 3
                                    end
                                    if v1281 == 1 then
                                        v1283 = v1282:FindFirstChild("Main")
                                        if not v1283 then
                                            return nil, nil
                                        end
                                        v1281 = 2
                                    end
                                end
                                break
                            end
                        end
                    end)
                    if not v152_1 or not v153 or not v154 then
                        return nil, nil
                    end
                    v913 = 1
                end
            end
        end
        if 1 == v151 then
            return v153, v154
        end
    end
end
local function v36(v155)
    local v156 = 0
    local v157
    while true do
        if v156 == 0 then
            local v914 = 0
            while true do
                if v914 == 1 then
                    v156 = 1
                    break
                end
                if v914 == 0 then
                    v157 = {}
                    for v1286, v1287 in ipairs(v155:GetChildren()) do
                        if v1287:IsA("Frame") then
                            table.insert(v157, v1287.Name)
                        end
                    end
                    v914 = 1
                end
            end
        end
        if v156 == 1 then
            return v157
        end
    end
end
local function v37(v158)
    return tostring(v158):gsub("%s+", "")
end
local function v38()
    local v159 = 0
    local v161
    local v163
    local v165
    local v167
    local v169
    local v162
    local v166
    local v164
    local v160
    while true do
        if v159 == 0 then
            local v915 = 0
            while true do
                if v915 == 1 then
                    v162 = v36(v160)
                    v163 = v36(v161)
                    v915 = 2
                end
                if 0 == v915 then
                    v160, v161 = v35()
                    if not v160 or not v161 then
                        return {}
                    end
                    v915 = 1
                end
                if v915 == 2 then
                    v159 = 1
                    break
                end
            end
        end
        if v159 == 1 then
            v164, v165 = false, false
            v166, v167 = {}, {}
            for v1055, v1056 in ipairs(v162) do
                local v1057 = 0
                local v1058
                while true do
                    if v1057 == 0 then
                        v1058 = v37(v1056)
                        v166[v1058] = true
                        v1057 = 1
                    end
                    if 1 == v1057 then
                        if v1058 == v37(v11.Name) then
                            v164 = true
                        end
                        break
                    end
                end
            end
            for v1059, v1060 in ipairs(v163) do
                local v1061 = 0
                local v1062
                while true do
                    if v1061 == 0 then
                        local v1289 = 0
                        while true do
                            if v1289 == 0 then
                                v1062 = v37(v1060)
                                v167[v1062] = true
                                v1289 = 1
                            end
                            if v1289 == 1 then
                                v1061 = 1
                                break
                            end
                        end
                    end
                    if v1061 == 1 then
                        if v1062 == v37(v11.Name) then
                            v165 = true
                        end
                        break
                    end
                end
            end
            v159 = 2
        end
        if v159 == 2 then
            if not (v164 or v165) then
                return {}
            end
            local v168_3 = v164 and v167 or v166
            v169 = {}
            for v1063, v1064 in pairs(v168_3) do
                for v1156, v1157 in ipairs(v8:GetPlayers()) do
                    if v37(v1157.Name) == v1063 and v1157 ~= v11 then
                        table.insert(v169, v1157)
                    end
                end
            end
            v159 = 3
        end
        if 3 == v159 then
            return v169
        end
    end
end
local function v39(v170)
    local v171 = game:GetService("Players")
    local v172 = game:GetService("ReplicatedStorage")
    local v173 = game:GetService("UserInputService")
    local v174 = game:GetService("RunService")
    local v175 = game:GetService("TweenService")
    local v176 = v171.LocalPlayer
    local v177 = v176:WaitForChild("PlayerGui")
    if v177:FindFirstChild("FastDexItemViewer") then
        v177:FindFirstChild("FastDexItemViewer"):Destroy()
    end
    local v179 = Instance.new("ScreenGui")
    v179.Name = "FastDexItemViewer"
    v179.ResetOnSpawn = false
    v179.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v179.IgnoreGuiInset = true
    v179.Parent = v177
    local v186 = Instance.new("BlurEffect")
    v186.Size = 0
    v186.Parent = game.Lighting
    local function v190()
        return v173.TouchEnabled and not v173.KeyboardEnabled
    end
    local v191 = Instance.new("Frame")
    v191.Name = "MainFrame"
    v191.AnchorPoint = Vector2.new(0.5, 0.5)
    v191.Position = UDim2.new(0.5, 0, 0.5, 0)
    v191.Size = v190() and UDim2.new(0.88, 0, 0, 320) or UDim2.new(0, 550, 0, 320)
    v191.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    v191.BorderSizePixel = 0
    v191.ClipsDescendants = true
    v191.Parent = v179
    local v200 = Instance.new("UICorner")
    v200.CornerRadius = UDim.new(0, 15)
    v200.Parent = v191
    local v203 = Instance.new("UIStroke")
    v203.Color = Color3.fromRGB(100, 100, 120)
    v203.Thickness = 1
    v203.Transparency = 0.7
    v203.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    v203.Parent = v191
    local v210 = Instance.new("Frame")
    v210.Name = "Header"
    v210.Size = UDim2.new(1, 0, 0, 28)
    v210.BackgroundColor3 = Color3.fromRGB(255, 107, 53)
    v210.BorderSizePixel = 0
    v210.Parent = v191
    local v216 = Instance.new("UIGradient")
    v216.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 107, 53)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 69, 0)),
    })
    v216.Rotation = 90
    v216.Parent = v210
    local v220 = Instance.new("UICorner")
    v220.CornerRadius = UDim.new(0, 15)
    v220.Parent = v210
    local v223 = Instance.new("Frame")
    v223.Size = UDim2.new(1, 0, 0, 15)
    v223.Position = UDim2.new(0, 0, 1, -15)
    v223.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
    v223.BorderSizePixel = 0
    v223.Parent = v210
    local v229 = Instance.new("TextLabel")
    v229.Size = UDim2.new(1, -50, 1, 0)
    v229.Position = UDim2.new(0, 15, 0, 0)
    v229.BackgroundTransparency = 1
    v229.Text = "FastDex Inventory Viewer"
    v229.TextColor3 = Color3.new(1, 1, 1)
    v229.Font = Enum.Font.GothamBold
    v229.TextSize = v190() and 12 or 14
    v229.TextXAlignment = Enum.TextXAlignment.Left
    v229.Parent = v210
    local v241 = Instance.new("TextButton")
    v241.Size = UDim2.new(0, 22, 0, 22)
    v241.Position = UDim2.new(1, -30, 0.5, -11)
    v241.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    v241.Text = "X"
    v241.TextColor3 = Color3.new(1, 1, 1)
    v241.Font = Enum.Font.GothamBold
    v241.TextSize = 14
    v241.BorderSizePixel = 0
    v241.Parent = v210
    local v251 = Instance.new("UICorner")
    v251.CornerRadius = UDim.new(0, 6)
    v251.Parent = v241
    local v254 = false
    local v255 = nil
    local v256 = nil
    v210.InputBegan:Connect(function(v785)
        if v785.UserInputType == Enum.UserInputType.MouseButton1 or v785.UserInputType == Enum.UserInputType.Touch then
            local v917 = 0
            while true do
                if v917 == 1 then
                    v256 = v191.Position
                    break
                end
                if v917 == 0 then
                    v254 = true
                    v255 = v785.Position
                    v917 = 1
                end
            end
        end
    end)
    v173.InputChanged:Connect(function(v786)
        if v254 and (v786.UserInputType == Enum.UserInputType.MouseMovement or v786.UserInputType == Enum.UserInputType.Touch) then
            local v918 = v786.Position - v255
            v191.Position = UDim2.new(v256.X.Scale, v256.X.Offset + v918.X, v256.Y.Scale, v256.Y.Offset + v918.Y)
        end
    end)
    v173.InputEnded:Connect(function(v787)
        if v787.UserInputType == Enum.UserInputType.MouseButton1 or v787.UserInputType == Enum.UserInputType.Touch then
            v254 = false
        end
    end)
    local v257 = Instance.new("Frame")
    v257.Size = UDim2.new(1, 0, 1, -45)
    v257.Position = UDim2.new(0, 0, 0, 45)
    v257.BackgroundTransparency = 1
    v257.BorderSizePixel = 0
    v257.Parent = v191
    local v263 = Instance.new("ScrollingFrame")
    v263.Size = UDim2.new(1, -20, 1, -20)
    v263.Position = UDim2.new(0, 10, 0, 10)
    v263.BackgroundTransparency = 1
    v263.BorderSizePixel = 0
    v263.ScrollBarThickness = 4
    v263.ScrollBarImageColor3 = Color3.fromRGB(255, 107, 53)
    v263.ScrollBarImageTransparency = 0.7
    v263.CanvasSize = UDim2.new(0, 0, 0, 0)
    v263.AutomaticCanvasSize = Enum.AutomaticSize.Y
    v263.Parent = v257
    local v275 = Instance.new("UIGridLayout")
    v275.CellSize = v190() and UDim2.new(0.48, 0, 0, 170) or UDim2.new(0, 240, 0, 170)
    v275.CellPadding = UDim2.new(0, 10, 0, 10)
    v275.SortOrder = Enum.SortOrder.LayoutOrder
    v275.HorizontalAlignment = Enum.HorizontalAlignment.Center
    v275.Parent = v263
    local v283 = Instance.new("UIPadding")
    v283.PaddingTop = UDim.new(0, 5)
    v283.PaddingBottom = UDim.new(0, 5)
    v283.Parent = v263
    local v287 = Instance.new("TextLabel")
    v287.Size = UDim2.new(1, 0, 1, 0)
    v287.BackgroundTransparency = 1
    v287.Text = ""
    v287.TextColor3 = Color3.fromRGB(255, 100, 100)
    v287.Font = Enum.Font.GothamBold
    v287.TextSize = 18
    v287.Visible = false
    v287.Parent = v257
    local v296 = Instance.new("BlurEffect")
    v296.Size = 0
    v296.Parent = game.Lighting
    local v299 = Instance.new("Frame")
    v299.Name = "FullscreenViewer"
    v299.Size = UDim2.new(1, 0, 1, 0)
    v299.Position = UDim2.new(0, 0, 0, 0)
    v299.BackgroundTransparency = 1
    v299.BorderSizePixel = 0
    v299.Visible = false
    v299.ZIndex = 100
    v299.Active = true
    v299.Parent = v179
    local v309 = Instance.new("Frame")
    v309.Name = "ViewFrame"
    v309.AnchorPoint = Vector2.new(0.5, 0.5)
    v309.Position = UDim2.new(0.5, 0, 0.5, 0)
    v309.Size = v190() and UDim2.new(0.88, 0, 0, 300) or UDim2.new(0, 380, 0, 310)
    v309.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    v309.BorderSizePixel = 0
    v309.ZIndex = 101
    v309.Active = true
    v309.Parent = v299
    local v319 = Instance.new("UICorner")
    v319.CornerRadius = UDim.new(0, 20)
    v319.Parent = v309
    local v322 = Instance.new("UIStroke")
    v322.Color = Color3.fromRGB(255, 107, 53)
    v322.Thickness = 2
    v322.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    v322.Parent = v309
    local v327 = false
    local v328 = nil
    local v329 = nil
    local v330 = Instance.new("Frame")
    v330.Size = UDim2.new(1, 0, 0, 32)
    v330.BackgroundColor3 = Color3.fromRGB(255, 107, 53)
    v330.BorderSizePixel = 0
    v330.ZIndex = 101
    v330.Parent = v309
    v330.InputBegan:Connect(function(v788)
        if v788.UserInputType == Enum.UserInputType.MouseButton1 or v788.UserInputType == Enum.UserInputType.Touch then
            local v921 = 0
            while true do
                if v921 == 0 then
                    v327 = true
                    v328 = v788.Position
                    v921 = 1
                end
                if v921 == 1 then
                    v329 = v309.Position
                    break
                end
            end
        end
    end)
    v173.InputChanged:Connect(function(v789)
        if v327 and (v789.UserInputType == Enum.UserInputType.MouseMovement or v789.UserInputType == Enum.UserInputType.Touch) then
            local v922 = v789.Position - v328
            v309.Position = UDim2.new(v329.X.Scale, v329.X.Offset + v922.X, v329.Y.Scale, v329.Y.Offset + v922.Y)
        end
    end)
    v173.InputEnded:Connect(function(v790)
        if v790.UserInputType == Enum.UserInputType.MouseButton1 or v790.UserInputType == Enum.UserInputType.Touch then
            v327 = false
        end
    end)
    local v336 = Instance.new("UICorner")
    v336.CornerRadius = UDim.new(0, 20)
    v336.Parent = v330
    local v339 = Instance.new("Frame")
    v339.Size = UDim2.new(1, 0, 0, 20)
    v339.Position = UDim2.new(0, 0, 1, -20)
    v339.BackgroundColor3 = Color3.fromRGB(255, 107, 53)
    v339.BorderSizePixel = 0
    v339.ZIndex = 101
    v339.Parent = v330
    local v346 = Instance.new("TextLabel")
    v346.Size = UDim2.new(1, -50, 1, 0)
    v346.Position = UDim2.new(0, 10, 0, 0)
    v346.BackgroundTransparency = 1
    v346.Text = "Item Preview"
    v346.TextColor3 = Color3.new(1, 1, 1)
    v346.Font = Enum.Font.GothamBold
    v346.TextSize = v190() and 12 or 14
    v346.TextXAlignment = Enum.TextXAlignment.Left
    v346.ZIndex = 101
    v346.Parent = v330
    local v357 = Instance.new("TextButton")
    v357.Size = UDim2.new(0, 24, 0, 24)
    v357.Position = UDim2.new(1, -30, 0.5, -12)
    v357.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    v357.Text = "X"
    v357.TextColor3 = Color3.new(1, 1, 1)
    v357.Font = Enum.Font.GothamBold
    v357.TextSize = 14
    v357.BorderSizePixel = 0
    v357.ZIndex = 102
    v357.Parent = v330
    local v368 = Instance.new("UICorner")
    v368.CornerRadius = UDim.new(0, 8)
    v368.Parent = v357
    local v371 = Instance.new("ViewportFrame")
    v371.Size = UDim2.new(1, -14, 1, -46)
    v371.Position = UDim2.new(0, 7, 0, 38)
    v371.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    v371.BorderSizePixel = 0
    v371.ZIndex = 101
    v371.Parent = v309
    local v378 = Instance.new("UICorner")
    v378.CornerRadius = UDim.new(0, 15)
    v378.Parent = v371
    local v381 = Instance.new("Camera")
    v381.Parent = v371
    v371.CurrentCamera = v381
    local function v384(v791, v792, v793)
        v346.Text = v792 .. " x" .. v793
        for v859, v860 in pairs(v371:GetChildren()) do
            if v860:IsA("Model") then
                v860:Destroy()
            end
        end
        local v795
        if v791:IsA("Model") then
            v795 = v791:Clone()
            v795.Parent = v371
        elseif v791:IsA("BasePart") then
            local v1158 = 0
            local v1159
            while true do
                if v1158 == 2 then
                    v795.Parent = v371
                    break
                end
                if v1158 == 1 then
                    v1159.Parent = v795
                    v795.PrimaryPart = v1159
                    v1158 = 2
                end
                if v1158 == 0 then
                    v795 = Instance.new("Model")
                    v1159 = v791:Clone()
                    v1158 = 1
                end
            end
        end
        if not v795 then
            return
        end
        local v796, v797 = v795:GetBoundingBox()
        local v798 = math.max(v797.X, v797.Y, v797.Z)
        local v799 = v798 * 2.5
        local v800, v801 = -15, 0
        local v802 = false
        local v803 = false
        local v804 = Vector2.zero
        local function v805()
            local v861 = 0
            local v863
            local v865, v865_4, v865_5
            local v862
            local v864
            while true do
                if v861 == 1 then
                    v864 = nil
                    v865_4 = nil
                    v861 = 2
                end
                if v861 == 0 then
                    v862 = 0
                    v863 = nil
                    v861 = 1
                end
                if v861 == 2 then
                    while true do
                        if 1 == v862 then
                            v865_5 = CFrame.Angles(0, math.rad(v801), 0) * CFrame.Angles(math.rad(v800), 0, 0)
                            local v866_6 = CFrame.new(v863) * v865_5 * v864
                            v862 = 2
                        end
                        if v862 == 2 then
                            v381.CFrame = CFrame.lookAt((nil).Position, v863)
                            break
                        end
                        if v862 == 0 then
                            v863 = v796.Position
                            v864 = CFrame.new(0, 0, v799)
                            v862 = 1
                        end
                    end
                    break
                end
            end
        end
        local v806 = {}
        table.insert(v806, v371.InputBegan:Connect(function(v867)
            if v867.UserInputType == Enum.UserInputType.MouseButton1 or v867.UserInputType == Enum.UserInputType.Touch then
                v802 = true
                v804 = v867.Position
            end
        end))
        table.insert(v806, v371.InputEnded:Connect(function(v868)
            if v868.UserInputType == Enum.UserInputType.MouseButton1 or v868.UserInputType == Enum.UserInputType.Touch then
                v802 = false
            end
        end))
        table.insert(v806, v371.InputChanged:Connect(function(v869)
            if v802 and (v869.UserInputType == Enum.UserInputType.MouseMovement or v869.UserInputType == Enum.UserInputType.Touch) then
                local v1290 = 0
                local v1291
                while true do
                    if v1290 == 1 then
                        v801 = v801 - v1291.X * 0.5
                        v800 = math.clamp(v800 - v1291.Y * 0.5, -80, 80)
                        break
                    end
                    if v1290 == 0 then
                        v1291 = v869.Position - v804
                        v804 = v869.Position
                        v1290 = 1
                    end
                end
            end
            if v869.UserInputType == Enum.UserInputType.MouseWheel and v803 then
                v799 = math.clamp(v799 - v869.Position.Z * 2, v798 * 0.5, v798 * 10)
            end
        end))
        table.insert(v806, v371.MouseEnter:Connect(function()
            v803 = true
        end))
        table.insert(v806, v371.MouseLeave:Connect(function()
            v803 = false
        end))
        local __w1 = v174.RenderStepped:Connect(function()
            if v795 and v381 and v299.Visible then
                if not v802 then
                    v801 = v801 + 0.48
                end
                v805()
            end
        end)
        table.insert(v806, __w1)
        local function v808()
            local v871 = 0
            while true do
                if v871 == 1 then
                    v191.Visible = true
                    v299.Visible = false
                    break
                end
                if v871 == 0 then
                    for v1239, v1240 in pairs(v806) do
                        v1240:Disconnect()
                    end
                    v175:Create(v296, TweenInfo.new(0.2), {Size = 0}):Play()
                    v871 = 1
                end
            end
        end
        v357.MouseButton1Click:Connect(v808)
        v175:Create(v296, TweenInfo.new(0.2), {Size = 20}):Play()
        v191.Visible = false
        v299.Visible = true
        v805()
    end
    local v385 = v171:FindFirstChild(v170)
    if not v385 then
        local v872 = 0
        while true do
            if v872 == 1 then
                v263.Visible = false
                break
            end
            if v872 == 0 then
                v287.Text = "User is not in game"
                v287.Visible = true
                v872 = 1
            end
        end
    else
        local v873 = v385:FindFirstChild("SkinsFolder")
        if not v873 then
            local v1067 = 0
            while true do
                if v1067 == 0 then
                    v287.Text = "SkinsFolder not found"
                    v287.Visible = true
                    v1067 = 1
                end
                if v1067 == 1 then
                    v263.Visible = false
                    break
                end
            end
        else
            local v1068 = 0
            local v1069
            while true do
                if v1068 == 1 then
                    if #v1069 == 0 then
                        local v1425 = 0
                        while true do
                            if v1425 == 1 then
                                v263.Visible = false
                                break
                            end
                            if v1425 == 0 then
                                v287.Text = "No items found"
                                v287.Visible = true
                                v1425 = 1
                            end
                        end
                    else
                        local function v1426(v1467, v1468)
                            local v1469 = v1467.item
                            local v1470 = v1467.count
                            local v1471 = Instance.new("Frame")
                            v1471.Name = "ItemFrame_" .. v1468
                            v1471.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
                            v1471.BorderSizePixel = 0
                            v1471.LayoutOrder = v1468
                            v1471.Parent = v263
                            local v1477 = Instance.new("UICorner")
                            v1477.CornerRadius = UDim.new(0, 12)
                            v1477.Parent = v1471
                            local v1480 = Instance.new("UIStroke")
                            v1480.Color = Color3.fromRGB(80, 80, 100)
                            v1480.Thickness = 1
                            v1480.Transparency = 0.5
                            v1480.Parent = v1471
                            local v1485 = Instance.new("TextButton")
                            v1485.Size = UDim2.new(1, 0, 1, 0)
                            v1485.BackgroundTransparency = 1
                            v1485.Text = ""
                            v1485.Parent = v1471
                            local v1490 = Instance.new("TextLabel")
                            v1490.Size = UDim2.new(1, -10, 0, 25)
                            v1490.Position = UDim2.new(0, 5, 0, 3)
                            v1490.BackgroundTransparency = 1
                            v1490.Text = v1469.Name .. " x" .. v1470
                            v1490.TextColor3 = Color3.fromRGB(255, 230, 200)
                            v1490.Font = Enum.Font.GothamBold
                            v1490.TextSize = 10
                            v1490.TextScaled = true
                            v1490.TextXAlignment = Enum.TextXAlignment.Center
                            v1490.ZIndex = 2
                            v1490.Parent = v1471
                            local v1504 = Instance.new("Frame")
                            v1504.Size = UDim2.new(1, -10, 1, -30)
                            v1504.Position = UDim2.new(0, 5, 0, 30)
                            v1504.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
                            v1504.BorderSizePixel = 0
                            v1504.Parent = v1471
                            local v1510 = Instance.new("UICorner")
                            v1510.CornerRadius = UDim.new(0, 10)
                            v1510.Parent = v1504
                            local v1513 = Instance.new("ViewportFrame")
                            v1513.Size = UDim2.new(1, -4, 1, -4)
                            v1513.Position = UDim2.new(0, 2, 0, 2)
                            v1513.BackgroundTransparency = 1
                            v1513.BorderSizePixel = 0
                            v1513.Parent = v1504
                            local v1519 = Instance.new("Camera")
                            v1519.Parent = v1513
                            v1513.CurrentCamera = v1519
                            local v1522
                            if v1469:IsA("Model") then
                                v1522 = v1469:Clone()
                                v1522.Parent = v1513
                            elseif v1469:IsA("BasePart") then
                                local v1650 = 0
                                local v1651
                                while true do
                                    if v1650 == 1 then
                                        v1651.Parent = v1522
                                        v1522.PrimaryPart = v1651
                                        v1650 = 2
                                    end
                                    if 2 == v1650 then
                                        v1522.Parent = v1513
                                        break
                                    end
                                    if v1650 == 0 then
                                        v1522 = Instance.new("Model")
                                        v1651 = v1469:Clone()
                                        v1650 = 1
                                    end
                                end
                            end
                            if not v1522 then
                                local v1614 = 0
                                local v1615
                                while true do
                                    if v1614 == 2 then
                                        v1615.Material = Enum.Material.Neon
                                        v1615.Parent = v1522
                                        v1614 = 3
                                    end
                                    if 0 == v1614 then
                                        v1522 = Instance.new("Model")
                                        v1615 = Instance.new("Part")
                                        v1614 = 1
                                    end
                                    if v1614 == 1 then
                                        v1615.Size = Vector3.new(0.5, 2, 0.2)
                                        v1615.Color = Color3.fromRGB(255, 107, 53)
                                        v1614 = 2
                                    end
                                    if v1614 == 3 then
                                        v1522.PrimaryPart = v1615
                                        v1522.Parent = v1513
                                        break
                                    end
                                end
                            end
                            local v1523, v1524 = v1522:GetBoundingBox()
                            local v1525 = math.max(v1524.X, v1524.Y, v1524.Z)
                            local v1526 = v1525 * 2.5
                            local v1527 = 0
                            local function v1528()
                                local v1578 = 0
                                local v1580
                                local v1582
                                local v1579
                                while true do
                                    if v1578 == 1 then
                                        local v1652 = 0
                                        while true do
                                            if v1652 == 1 then
                                                v1578 = 2
                                                break
                                            end
                                            if 0 == v1652 then
                                                local v1581_7 = CFrame.Angles(0, math.rad(v1527), 0) * CFrame.Angles(math.rad(-15), 0, 0)
                                                v1582 = CFrame.new(v1579) * v1581_7 * v1580
                                                v1652 = 1
                                            end
                                        end
                                    end
                                    if v1578 == 0 then
                                        local v1653 = 0
                                        while true do
                                            if v1653 == 1 then
                                                v1578 = 1
                                                break
                                            end
                                            if v1653 == 0 then
                                                v1579 = v1523.Position
                                                v1580 = CFrame.new(0, 0, v1526)
                                                v1653 = 1
                                            end
                                        end
                                    end
                                    if v1578 == 2 then
                                        v1519.CFrame = CFrame.lookAt(v1582.Position, v1579)
                                        break
                                    end
                                end
                            end
                            v174.RenderStepped:Connect(function()
                                if v1522 and v1519 then
                                    v1527 = v1527 + 0.5
                                    v1528()
                                end
                            end)
                            v1485.MouseButton1Click:Connect(function()
                                v384(v1469, v1469.Name, v1470)
                            end)
                            v1528()
                        end
                        for v1529, v1530 in ipairs(v1069) do
                            v1426(v1530, v1529)
                        end
                    end
                    break
                end
                if v1068 == 0 then
                    local v1295 = 0
                    while true do
                        if v1295 == 0 then
                            v1069 = {}
                            for v1583, v1584 in pairs(v873:GetChildren()) do
                                local v1585 = 0
                                local v1587
                                local v1589
                                local v1591
                                local v1588
                                local v1586
                                local v1590
                                while true do
                                    if v1585 == 2 then
                                        v1590 = v172.Skins:FindFirstChild("Guns")
                                        v1591 = nil
                                        v1585 = 3
                                    end
                                    if v1585 == 3 then
                                        if v1589 then
                                            for v1704, v1705 in pairs(v1589:GetChildren()) do
                                                if v1705.Name == v1586 or v1705.Name:find(v1586) or v1586:find(v1705.Name) then
                                                    v1591 = v1705
                                                    break
                                                end
                                            end
                                        end
                                        if not v1591 and v1590 then
                                            for v1706, v1707 in pairs(v1590:GetChildren()) do
                                                if v1707.Name == v1586 or v1707.Name:find(v1586) or v1586:find(v1707.Name) then
                                                    v1591 = v1707
                                                    break
                                                end
                                            end
                                        end
                                        v1585 = 4
                                    end
                                    if v1585 == 4 then
                                        if v1591 then
                                            table.insert(v1069, {item = v1591, count = v1588})
                                        end
                                        break
                                    end
                                    if v1585 == 1 then
                                        v1588 = v1587 and v1587.Value or 0
                                        v1589 = v172.Skins:FindFirstChild("Knives")
                                        v1585 = 2
                                    end
                                    if v1585 == 0 then
                                        v1586 = v1584.Name
                                        v1587 = v1584:FindFirstChild("Count")
                                        v1585 = 1
                                    end
                                end
                            end
                            v1295 = 1
                        end
                        if v1295 == 1 then
                            v1068 = 1
                            break
                        end
                    end
                end
            end
        end
    end
    v241.MouseButton1Click:Connect(function()
        local v811 = 0
        local v813
        local v812
        while true do
            if v811 == 2 then
                v813.Completed:Connect(function()
                    v179:Destroy()
                    if v186 then
                        v186:Destroy()
                    end
                end)
                break
            end
            if v811 == 0 then
                v812 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                v813 = v175:Create(v191, v812, {Size = UDim2.new(0, 0, 0, 0)})
                v811 = 1
            end
            if v811 == 1 then
                v175:Create(v186, v812, {Size = 0}):Play()
                v813:Play()
                v811 = 2
            end
        end
    end)
    v191.Size = UDim2.new(0, 0, 0, 0)
    local v386 = v175:Create(v191, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = v190() and UDim2.new(0.95, 0, 0, 500) or UDim2.new(0, 850, 0, 500),
    })
    v386:Play()
end
local v40 = nil
local v41 = false
_G.BlockClick = false
local v42 = 200
local v43 = Enum.KeyCode.F
local v44 = false
local v45 = false
local v46 = false
local v47 = nil
local v48 = {}
local v49 = 0.25
local v51 = 0
local v53 = 0.05
local v54 = {}
local v56 = 0
local v58 = {
    maxDetectionDistance = 200,
    minDetectionDistance = 5,
    baseRaycastCount = 5,
    maxRaycastCount = 10,
    raySpreadAngle = 2,
    aimAssistStrength = 0.7,
    allowBackwardsShooting = false,
    predictionStrength = 0.8,
    requireLineOfSight = true,
    validateAssets = true,
    checkTeam = true,
    cameraThreshold = 0.1,
    maxCameraAngle = 30,
    maxRaysPerFrame = 8,
    distanceBasedRayReduction = true,
    adaptiveRaycasting = true,
    screenCenterWeight = 0.4,
    distanceWeight = 0.3,
    visibilityWeight = 0.3,
}
local v59 = {
    "HumanoidRootPart",
    "Head",
    "UpperTorso",
    "LowerTorso",
    "LeftUpperArm",
    "RightUpperArm",
    "LeftUpperLeg",
    "RightUpperLeg",
}
local function v60()
    local v387 = 0
    local v389
    while true do
        if v387 == 1 then
            if v389 then
                v58.aimAssistStrength = 0.9
                v58.maxRaycastCount = 8
                v53 = 0.07
            else
                local v1168 = 0
                while true do
                    if v1168 == 1 then
                        v53 = 0.05
                        break
                    end
                    if v1168 == 0 then
                        v58.aimAssistStrength = 0.7
                        v58.maxRaycastCount = 10
                        v1168 = 1
                    end
                end
            end
            break
        end
        if v387 == 0 then
            local v388_8 = game:GetService("UserInputService")
            v389 = v388_8.TouchEnabled and not v388_8.KeyboardEnabled
            v387 = 1
        end
    end
end
local function v61(v390)
    local v392 = 0
    while true do
        if v392 == 1 then
            v48[v390] = true
            v390.AncestryChanged:Connect(function()
                task.wait()
                if v41 and v40 == v390 and v40 and v40.Parent then
                    pcall(updateWeaponScripts)
                end
            end)
            v392 = 2
        end
        if v392 == 2 then
            v390:GetPropertyChangedSignal("Parent"):Connect(function()
                task.wait()
                if v41 and v40 == v390 and v40 and v40.Parent then
                    pcall(updateWeaponScripts)
                end
            end)
            break
        end
        if v392 == 0 then
            if not v390 then
                return
            end
            if v48[v390] then
                return
            end
            v392 = 1
        end
    end
end
function updateWeaponScripts()
    local v393 = 0
    local v395
    local v394
    local v396
    while true do
        if v393 == 1 then
            if not v40 or not v40.Parent then
                v41 = false
                v40 = nil
                return
            end
            v394, v395 = pcall(function()
                return v40:GetDescendants()
            end)
            v393 = 2
        end
        if 4 == v393 then
            for v1070, v1071 in ipairs(v396) do
                pcall(function()
                    if not v40 then
                        return
                    end
                    local v1169 = v40:FindFirstChild(v1071)
                    if v1169 and (v1169:IsA("Script") or v1169:IsA("LocalScript")) then
                        if v1169.Disabled ~= _G.BlockClick then
                            v1169.Disabled = _G.BlockClick
                        end
                    end
                end)
            end
            break
        end
        if 0 == v393 then
            if not v41 then
                return
            end
            if not v40 or not v40.Parent or v40:IsDescendantOf(game) == false then
                local v1170 = 0
                while true do
                    if v1170 == 1 then
                        if not v40 then
                            v41 = false
                            return
                        end
                        break
                    end
                    if v1170 == 0 then
                        local v1371 = 0
                        while true do
                            if v1371 == 1 then
                                v1170 = 1
                                break
                            end
                            if v1371 == 0 then
                                local v1171_9 = v11.Character
                                if v1171_9 and v1171_9:IsDescendantOf(workspace) then
                                    for v1656, v1657 in ipairs(v1171_9:GetChildren()) do
                                        if v1657:IsA("Tool") and v1657:FindFirstChild("fire") then
                                            v40 = v1657
                                            v41 = true
                                            v61(v40)
                                            break
                                        end
                                    end
                                end
                                v1371 = 1
                            end
                        end
                    end
                end
            end
            v393 = 1
        end
        if v393 == 3 then
            for v1072, v1073 in ipairs(v395) do
                if v1073 and (v1073:IsA("Script") or v1073:IsA("LocalScript")) and v1073.Disabled ~= _G.BlockClick then
                    pcall(function()
                        if v40 and v1073:IsDescendantOf(v40) then
                            v1073.Disabled = _G.BlockClick
                        end
                    end)
                end
            end
            v396 = {"Script", "LocalScript", "Client", "GunScript"}
            v393 = 4
        end
        if v393 == 2 then
            if not v394 or not v395 then
                local v1172 = 0
                while true do
                    if 0 == v1172 then
                        v40 = nil
                        v41 = false
                        v1172 = 1
                    end
                    if 1 == v1172 then
                        return
                    end
                end
            end
            table.insert(v395, v40)
            v393 = 3
        end
    end
end
function initializeWeaponScript()
    local v397 = 0
    local v399
    local v398
    while true do
        local v814 = 0
        while true do
            if v814 == 0 then
                if v397 == 3 then
                    v41 = false
                    return false
                end
                if v397 == 2 then
                    if v399 then
                        for v1429, v1430 in ipairs(v399:GetChildren()) do
                            if v1430:IsA("Tool") and v1430:FindFirstChild("fire") then
                                local v1593 = 0
                                while true do
                                    local v1616 = 0
                                    while true do
                                        if v1616 == 1 then
                                            if v1593 == 0 then
                                                v40 = v1430
                                                v41 = false
                                                v1593 = 1
                                            end
                                            break
                                        end
                                        if v1616 == 0 then
                                            if v1593 == 2 then
                                                return true
                                            end
                                            if v1593 == 1 then
                                                v61(v40)
                                                if v40 and v40.Parent then
                                                    pcall(updateWeaponScripts)
                                                end
                                                v1593 = 2
                                            end
                                            v1616 = 1
                                        end
                                    end
                                end
                            end
                        end
                    end
                    v40 = nil
                    v397 = 3
                end
                v814 = 1
            end
            if v814 == 1 then
                if 0 == v397 then
                    v398 = v11.Character
                    if not v398 then
                        return false
                    end
                    v397 = 1
                end
                if v397 == 1 then
                    for v1297, v1298 in ipairs(v398:GetChildren()) do
                        if v1298:IsA("Tool") and v1298:FindFirstChild("fire") then
                            local v1432 = 0
                            while true do
                                if v1432 == 2 then
                                    return true
                                end
                                if v1432 == 0 then
                                    v40 = v1298
                                    v41 = true
                                    v1432 = 1
                                end
                                if v1432 == 1 then
                                    v61(v40)
                                    if v40 and v40.Parent then
                                        pcall(updateWeaponScripts)
                                    end
                                    v1432 = 2
                                end
                            end
                        end
                    end
                    v399 = v11:FindFirstChild("Backpack")
                    v397 = 2
                end
                break
            end
        end
    end
end
local function v62(v400, v401)
    local v402 = tostring(v400) .. "_" .. v401
    local v403 = v54[v402]
    if v403 and v403.time > tick() - 0.5 then
        return v403.component
    end
    local v404 = v400:FindFirstChild(v401)
    v54[v402] = {component = v404, time = tick()}
    return v404
end
local function v63(v406)
    if not workspace.CurrentCamera then
        return false
    end
    local v411 = (v406 - workspace.CurrentCamera.CFrame.Position).Unit
    local v412 = workspace.CurrentCamera.CFrame.LookVector:Dot(v411)
    return v412 > v58.cameraThreshold
end
local function v64(v413)
    if not workspace.CurrentCamera then
        return 180
    end
    local v415, v416 = workspace.CurrentCamera:WorldToViewportPoint(v413)
    if not v416 then
        return 180
    end
    local v417 = workspace.CurrentCamera.ViewportSize.X / 2
    local v418 = workspace.CurrentCamera.ViewportSize.Y / 2
    local v419 = v415.X
    local v420 = v415.Y
    local v421 = v419 - v417
    local v422 = v420 - v418
    local v423 = math.deg(math.atan2(v422, v421))
    local v424 = math.abs(v423)
    if v424 > 180 then
        v424 = 360 - v424
    end
    return v424
end
local function v65(v425)
    if not workspace.CurrentCamera then
        return false, Vector2.new(0, 0), 180
    end
    local v427, v428 = workspace.CurrentCamera:WorldToViewportPoint(v425)
    if not v428 then
        return false, Vector2.new(0, 0), 180
    end
    local v429 = Vector2.new(v427.X, v427.Y)
    local v430 = v64(v425)
    return true, v429, v430
end
local function v66(v431, v432, v433)
    if not v432 or not v433 then
        return Vector3.new(0, 0, 0)
    end
    local v434 = v432.AssemblyLinearVelocity
    local v435 = v432.Position
    if v434.Magnitude > 1 then
        v435 = v435 + v434 * 0.08 * v58.predictionStrength
    end
    local v436 = v433.HipHeight + 2
    local v437 = 1.2
    local v438 = (math.random() - 0.5) * v437 * v49
    local v439 = (math.random() - 0.5) * v436 * v49 * 0.5
    local v440 = (math.random() - 0.5) * v437 * v49
    return v435 - v432.Position + Vector3.new(v438, v439, v440)
end
local function v67(v441)
    local v442 = 0
    local v444
    local v443
    while true do
        local v815 = 0
        while true do
            if v815 == 1 then
                if v442 == 0 then
                    if not v58.validateAssets then
                        return {hitboxScale = 1}
                    end
                    v443 = {hitboxScale = 1}
                    v442 = 1
                end
                break
            end
            if v815 == 0 then
                if v442 == 1 then
                    v444 = 0
                    for v1299, v1300 in ipairs(v441:GetChildren()) do
                        if v1300:IsA("Accessory") then
                            local v1434 = v1300:FindFirstChild("Handle")
                            if v1434 then
                                local v1658 = 0
                                local v1660, v1660_10, v1660_11
                                local v1659
                                while true do
                                    if 1 == v1658 then
                                        while true do
                                            if v1659 == 0 then
                                                v1660_10 = v1434.Size
                                                local v1661_12 = v1660_10.X * v1660_10.Y * v1660_10.Z
                                                v1659 = 1
                                            end
                                            if v1659 == 1 then
                                                if nil > 5 then
                                                    v444 = v444 + 1
                                                end
                                                break
                                            end
                                        end
                                        break
                                    end
                                    if v1658 == 0 then
                                        v1659 = 0
                                        v1660_11 = nil
                                        v1658 = 1
                                    end
                                end
                            end
                        end
                    end
                    v442 = 2
                end
                if v442 == 2 then
                    if v444 > 0 then
                        v443.hitboxScale = 1 + v444 * 0.2
                    end
                    return v443
                end
                v815 = 1
            end
        end
    end
end
local function v68(v445)
    if not v58.distanceBasedRayReduction then
        return math.min(v58.baseRaycastCount, v58.maxRaycastCount)
    end
    if v445 > 150 then
        return 3
    elseif v445 > 100 then
        return 4
    elseif v445 > 50 then
        return 5
    else
        return math.min(v58.baseRaycastCount, v58.maxRaycastCount)
    end
end
local function v69()
    if v56 >= 100 then
        return false
    end
    v56 = v56 + 1
    return true
end
game:GetService("RunService").Heartbeat:Connect(function(v447)
    v56 = math.max(0, v56 - 100 * v447)
end)
local function v70(v448, v449, v450)
    if not v448 or not v449 then
        return false, 0
    end
    local v451 = 0
    local v452 = 0
    local v453 = v42
    local v454 = v67(v448)
    local v455 = v454.hitboxScale
    local v456 = RaycastParams.new()
    v456.FilterType = Enum.RaycastFilterType.Blacklist
    v456.FilterDescendantsInstances = {v11.Character}
    v456.IgnoreWater = true
    local v461 = math.min(v450 * #v59, v58.maxRaysPerFrame)
    for v816, v817 in ipairs(v59) do
        local v818 = v448:FindFirstChild(v817)
        if v818 and v818:IsA("BasePart") then
            if not v69() or v452 >= v461 then
                break
            end
            local v925 = workspace:Raycast(v449, (v818.Position - v449).Unit * v453, v456)
            if v925 and v925.Instance and v925.Instance:IsDescendantOf(v448) then
                v451 = v451 + 1
            end
            v452 = v452 + 1
            local v926 = math.min(v450 - 1, 2)
            for v1074 = 1, v926 do
                if not v69() or v452 >= v461 then
                    break
                end
                local v1075 = Vector3.new((math.random() - 0.5) * 0.3 * v455, (math.random() - 0.5) * 0.3 * v455, (math.random() - 0.5) * 0.3 * v455)
                local v1076 = v818.Position + v1075
                v925 = workspace:Raycast(v449, (v1076 - v449).Unit * v453, v456)
                if v925 and v925.Instance and v925.Instance:IsDescendantOf(v448) then
                    v451 = v451 + 1
                end
                v452 = v452 + 1
            end
        end
    end
    local v462 = v452 > 0 and v451 / v452 or 0
    return v451 > 0 and v462 >= 0.2, v462
end
local function v71(v463)
    local v464 = v463.Character
    if not v464 then
        return 0
    end
    local v465 = v464:FindFirstChild("HumanoidRootPart")
    if not v465 then
        return 0
    end
    if not workspace.CurrentCamera then
        return 0
    end
    local v467 = 0
    local v468, v469, v470 = v65(v465.Position)
    if v468 then
        local v874 = 0
        local v875
        while true do
            if v874 == 0 then
                local v1173 = 0
                while true do
                    if v1173 == 1 then
                        v874 = 1
                        break
                    end
                    if v1173 == 0 then
                        v875 = math.clamp(1 - v470 / v58.maxCameraAngle, 0, 1)
                        v1173 = 1
                    end
                end
            end
            if v874 == 1 then
                v467 = v467 + v875 * v58.screenCenterWeight * 100
                break
            end
        end
    else
        return v467
    end
    local v471 = (workspace.CurrentCamera.CFrame.Position - v465.Position).Magnitude
    if v471 <= v42 then
        local v877 = 1 - v471 / v42
        v467 = v467 + v877 * v58.distanceWeight * 100
    end
    local v472 = v11.Character
    if v472 then
        local v879 = v62(v472, "HumanoidRootPart") or v472:FindFirstChild("Head")
        if v879 then
            local v1301 = 0
            local v1303
            local v1302
            while true do
                if v1301 == 1 then
                    v1302.FilterDescendantsInstances = {v472}
                    v1303 = workspace:Raycast(v879.Position, (v465.Position - v879.Position).Unit * v471, v1302)
                    v1301 = 2
                end
                if v1301 == 2 then
                    if not v1303 or v1303.Instance and v1303.Instance:IsDescendantOf(v464) then
                        v467 = v467 + v58.visibilityWeight * 100
                    end
                    break
                end
                if v1301 == 0 then
                    v1302 = RaycastParams.new()
                    v1302.FilterType = Enum.RaycastFilterType.Blacklist
                    v1301 = 1
                end
            end
        end
    end
    return v467
end
local function v72()
    local v473 = 0
    local v475, v475_14
    local v477
    local v476
    local v474
    while true do
        local v819 = 0
        while true do
            if 1 == v819 then
                if v473 == 2 then
                    local v1245 = 0
                    while true do
                        if v1245 == 0 then
                            v476 = nil
                            v477 = 0
                            v1245 = 1
                        end
                        if v1245 == 1 then
                            v473 = 3
                            break
                        end
                    end
                end
                if v473 == 3 then
                    for v1304, v1305 in ipairs(v474) do
                        if v1305 and typeof(v1305) == "Instance" and v1305:IsA("Player") then
                            local v1435 = v1305.Character
                            if v1435 and v1435:IsDescendantOf(workspace) then
                                local v1595 = 0
                                local v1597
                                local v1596
                                while true do
                                    if v1595 == 1 then
                                        if v1596 and v1597 and v1597.Health > 0 then
                                            local v1691 = workspace.CurrentCamera and (workspace.CurrentCamera.CFrame.Position - v1596.Position).Magnitude or 9999
                                            if v1691 <= v42 then
                                                local v1723 = v71(v1305)
                                                if v1723 > 20 and v1723 > v477 then
                                                    v477 = v1723
                                                    v476 = v1305
                                                end
                                            end
                                        end
                                        break
                                    end
                                    if v1595 == 0 then
                                        local v1662 = 0
                                        while true do
                                            if v1662 == 1 then
                                                v1595 = 1
                                                break
                                            end
                                            if v1662 == 0 then
                                                v1596 = v62(v1435, "HumanoidRootPart")
                                                v1597 = v62(v1435, "Humanoid")
                                                v1662 = 1
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    return v476, v477
                end
                break
            end
            if v819 == 0 then
                if v473 == 0 then
                    v474 = v38()
                    if not v474 or type(v474) ~= "table" or #v474 == 0 then
                        return nil, 0
                    end
                    v473 = 1
                end
                if v473 == 1 then
                    local v1246 = 0
                    while true do
                        if v1246 == 1 then
                            v473 = 2
                            break
                        end
                        if v1246 == 0 then
                            v475_14 = v11.Character
                            if not v475_14 or not v475_14:IsDescendantOf(workspace) then
                                return nil, 0
                            end
                            v1246 = 1
                        end
                    end
                end
                v819 = 1
            end
        end
    end
end
local function v73(v478)
    local v479 = 0
    local v481
    local v483
    local v485, v485_15
    local v487
    local v489
    local v480
    local v484
    local v490
    local v486
    local v482
    while true do
        if v479 == 3 then
            local v927 = 0
            while true do
                if v927 == 1 then
                    v486 = (v483.Position - v484.Position).Magnitude
                    v479 = 4
                    break
                end
                if v927 == 0 then
                    v485_15 = v62(v482, "Humanoid")
                    if not v483 or not v484 or not v485_15 or v485_15.Health <= 0 then
                        return false
                    end
                    v927 = 1
                end
            end
        end
        if v479 == 1 then
            v481 = v11.Character
            if not v481 or not v481:IsDescendantOf(workspace) then
                return false
            end
            v482 = v478.Character
            v479 = 2
        end
        if v479 == 2 then
            if not v482 or not v482:IsDescendantOf(workspace) then
                return false
            end
            v483 = v62(v481, "HumanoidRootPart") or v481:FindFirstChild("Head")
            v484 = v62(v482, "HumanoidRootPart")
            v479 = 3
        end
        if v479 == 4 then
            local v930 = 0
            while true do
                if v930 == 1 then
                    if not v487 and not v58.allowBackwardsShooting then
                        return false
                    end
                    v479 = 5
                    break
                end
                if v930 == 0 then
                    if v486 > v42 then
                        return false
                    end
                    v487 = v63(v484.Position)
                    v930 = 1
                end
            end
        end
        if v479 == 6 then
            return v489
        end
        if v479 == 5 then
            local v932 = 0
            while true do
                if v932 == 1 then
                    if _G.DebugMode then
                        print(string.format("Target: %s, Distance: %.1f, CameraLooking: %s, CanHit: %s, HitRatio: %.2f", v478.Name, v486, tostring(v487), tostring(v489), v490))
                    end
                    v479 = 6
                    break
                end
                if v932 == 0 then
                    local v488_16 = v68(v486)
                    v489, v490 = v70(v482, v483.Position, v488_16)
                    v932 = 1
                end
            end
        end
        if v479 == 0 then
            local v934 = 0
            while true do
                if v934 == 0 then
                    if not v478 or typeof(v478) ~= "Instance" or not v478:IsA("Player") then
                        return false
                    end
                    v480 = tick()
                    v934 = 1
                end
                if 1 == v934 then
                    if v480 - v51 < v53 then
                        return false
                    end
                    v479 = 1
                    break
                end
            end
        end
    end
end
local function v74()
    local v491 = 0
    local v492
    while true do
        if v491 == 1 then
            if not v492 then
                local v1175 = 0
                while true do
                    if v1175 == 1 then
                        return false
                    end
                    if v1175 == 0 then
                        v40 = nil
                        v41 = false
                        v1175 = 1
                    end
                end
            end
            return v62(v40, "fire") ~= nil
        end
        if v491 == 0 then
            if not v40 then
                v41 = false
                return false
            end
            v492 = pcall(function()
                return v40:IsDescendantOf(game) and v40.Parent ~= nil
            end)
            v491 = 1
        end
    end
end
local function v75()
    local v493 = 0
    local v495
    local v497
    local v499
    local v501
    local v502
    local v504
    local v505
    local v506
    local v507
    local v508
    local v509
    local v510
    local v496
    local v503
    local v500
    local v494
    while true do
        if v493 == 1 then
            if not v495 or v496 < 25 then
                return false
            end
            if not v73(v495) then
                return false
            end
            v497 = v11.Character
            if not v497 or not v497:IsDescendantOf(workspace) then
                return false
            end
            v493 = 2
        end
        if v493 == 3 then
            v500 = v62(v499, "HumanoidRootPart")
            v501 = v62(v499, "Humanoid")
            if not v500 or not v501 then
                return false
            end
            v51 = v494
            v493 = 4
        end
        if v493 == 6 then
            v509 = game.ReplicatedStorage.BindableEvents:FindFirstChild("LocalBeam")
            v510 = (v505 - v502.Position).Unit
            task.spawn(function()
                if v509 then
                    pcall(function()
                        v509:Fire(v502, v505)
                    end)
                end
                if v506 then
                    pcall(function()
                        v506:FireServer()
                    end)
                end
                if v507 then
                    pcall(function()
                        v507:FireServer(v505, v502.Position, v502)
                    end)
                end
                if v508 then
                    pcall(function()
                        v508:FireServer(v495, v510, v505)
                    end)
                end
            end)
            return true
        end
        if 4 == v493 then
            v502 = v62(v40, "Handle") or v40
            if not v502 then
                return false
            end
            v503 = v500.Position
            v504 = v66(v499, v500, v501)
            v493 = 5
        end
        if v493 == 0 then
            v494 = tick()
            if v494 - v51 < 2.15 then
                return false
            end
            if not v74() then
                return false
            end
            v495, v496 = v72()
            v493 = 1
        end
        if v493 == 5 then
            v505 = v503 + v504
            v506 = v62(v40, "fire")
            v507 = v62(v40, "showBeam")
            v508 = v62(v40, "kill")
            v493 = 6
        end
        if v493 == 2 then
            if not (v62(v497, "HumanoidRootPart") or v497:FindFirstChild("Head")) then
                return false
            end
            v499 = v495.Character
            if not v499 or not v499:IsDescendantOf(workspace) then
                return false
            end
            v493 = 3
        end
    end
end
local function v76()
    local v520 = 0
    local v522
    local v524
    local v521
    local v525
    while true do
        if 2 == v520 then
            local v523_18 = _G.BlockClick and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
            v524 = v522:Create(v521, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = v523_18})
            v520 = 3
        end
        if v520 == 1 then
            if not v521 then
                return
            end
            v522 = game:GetService("TweenService")
            v520 = 2
        end
        if v520 == 0 then
            if not v47 then
                return
            end
            v521 = v47:FindFirstChild("BlockShootButton")
            v520 = 1
        end
        if v520 == 4 then
            if v525 then
                v525.Text = _G.BlockClick and "ON" or "OFF"
            end
            break
        end
        if v520 == 3 then
            v524:Play()
            v525 = v521:FindFirstChild("StatusLabel")
            v520 = 4
        end
    end
end
local v77 = false
local function v78()
    local v526 = 0
    local v528
    local v530
    local v527
    local v529
    while true do
        if 2 == v526 then
            local v943 = 0
            while true do
                if v943 == 0 then
                    v529 = v527:FindFirstChild("StatusLabel")
                    v530 = v527:FindFirstChild("UIStroke")
                    v943 = 1
                end
                if 1 == v943 then
                    v526 = 3
                    break
                end
            end
        end
        if v526 == 0 then
            if not v47 then
                return
            end
            v527 = v47:FindFirstChild("BlockShootButton")
            v526 = 1
        end
        if v526 == 1 then
            if not v527 then
                return
            end
            v528 = v527:FindFirstChild("Icon")
            v526 = 2
        end
        if v526 == 3 then
            local v531_19 = v527:FindFirstChild("UIGradient")
            if v77 then
                local v1179 = 0
                while true do
                    if 2 == v1179 then
                        if v530 then
                            v530.Transparency = 1
                        end
                        if v531_19 then
                            v531_19.Transparency = NumberSequence.new(1)
                        end
                        break
                    end
                    if v1179 == 1 then
                        if v528 then
                            v528.ImageTransparency = 1
                        end
                        if v529 then
                            v529.TextTransparency = 1
                        end
                        v1179 = 2
                    end
                    if v1179 == 0 then
                        v527.BackgroundTransparency = 1
                        v527.TextTransparency = 1
                        v1179 = 1
                    end
                end
            else
                v527.BackgroundTransparency = 0
                v527.TextTransparency = 0
                if v528 then
                    v528.ImageTransparency = 0
                end
                if v529 then
                    v529.TextTransparency = 0
                end
                if v530 then
                    v530.Transparency = 0.6
                end
                if v531_19 then
                    v531_19.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.9),
                        NumberSequenceKeypoint.new(1, 0.95),
                    })
                end
            end
            break
        end
    end
end
local function v79()
    local v532 = 0
    local v534
    local v536
    local v538
    local v539
    local v535
    local v533
    local v537
    while true do
        if v532 == 2 then
            v534.BackgroundTransparency = 0.25
            v534.BorderSizePixel = 0
            v534.Text = ""
            v534.AutoButtonColor = false
            v534.Parent = v533
            v535 = Instance.new("UICorner")
            v532 = 3
        end
        if v532 == 1 then
            v534 = Instance.new("TextButton")
            v534.Name = "BlockShootButton"
            v534.Size = UDim2.new(0, 55, 0, 55)
            v534.Position = UDim2.new(1, -50, 1, -120)
            v534.AnchorPoint = Vector2.new(0.5, 0.5)
            v534.BackgroundColor3 = _G.BlockClick and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
            v532 = 2
        end
        if v532 == 8 then
            v539.TextSize = 11
            v539.Font = Enum.Font.GothamBold
            v539.TextStrokeTransparency = 0.4
            v539.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            v539.Parent = v534
            v47 = v534
            v532 = 9
        end
        if v532 == 7 then
            v539.Size = UDim2.new(1, 0, 0, 14)
            v539.Position = UDim2.new(0.5, 0, 1, 6)
            v539.AnchorPoint = Vector2.new(0.5, 0)
            v539.BackgroundTransparency = 1
            v539.Text = _G.BlockClick and "ON" or "OFF"
            v539.TextColor3 = Color3.fromRGB(255, 255, 255)
            v532 = 8
        end
        if 3 == v532 then
            v535.CornerRadius = UDim.new(0, 14)
            v535.Parent = v534
            v536 = Instance.new("UIStroke")
            v536.Color = Color3.fromRGB(255, 255, 255)
            v536.Thickness = 2
            v536.Transparency = 0.6
            v532 = 4
        end
        if v532 == 4 then
            v536.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            v536.Parent = v534
            v537 = Instance.new("UIGradient")
            v537.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200)),
            })
            v537.Rotation = 90
            v537.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.9),
                NumberSequenceKeypoint.new(1, 0.95),
            })
            v532 = 5
        end
        if v532 == 6 then
            v538.BackgroundTransparency = 1
            v538.Image = "rbxassetid://15403175166"
            v538.ImageColor3 = Color3.fromRGB(255, 255, 255)
            v538.Parent = v534
            v539 = Instance.new("TextLabel")
            v539.Name = "StatusLabel"
            v532 = 7
        end
        if v532 == 0 then
            if v47 then
                v47:Destroy()
            end
            v533 = Instance.new("ScreenGui")
            v533.Name = "BlockShootUI"
            v533.ResetOnSpawn = false
            v533.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            v533.DisplayOrder = 999
            v532 = 1
        end
        if v532 == 9 then
            v533.Parent = game:GetService("CoreGui")
            v534.MouseButton1Click:Connect(function()
                _G.BlockClick = not _G.BlockClick
                updateWeaponScripts()
                local v1077 = game:GetService("TweenService")
                local v1078 = _G.BlockClick and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
                local v1079 = v1077:Create(v534, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = v1078})
                v1079:Play()
                local v1080 = v1077:Create(v534, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 85, 0, 85)})
                v1080:Play()
                v1080.Completed:Connect(function()
                    local v1182 = v1077:Create(v534, TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = UDim2.new(0, 75, 0, 75)})
                    v1182:Play()
                end)
                local v1081 = v1077:Create(v538, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Rotation = v538.Rotation + 360})
                v1081:Play()
                v539.Text = _G.BlockClick and "ON" or "OFF"
            end)
            v533.Parent = game:GetService("CoreGui")
            v47 = v533
            v78()
            break
        end
        if 5 == v532 then
            v537.Parent = v534
            v538 = Instance.new("ImageLabel")
            v538.Name = "Icon"
            v538.Size = UDim2.new(0, 26, 0, 26)
            v538.Position = UDim2.new(0.5, 0, 0.5, -2)
            v538.AnchorPoint = Vector2.new(0.5, 0.5)
            v532 = 6
        end
    end
end
function updateBlockState()
    local v541 = v44 or v45
    if not v541 and _G.BlockClick then
        local v1183 = 0
        while true do
            if v1183 == 0 then
                _G.BlockClick = false
                updateWeaponScripts()
                v1183 = 1
            end
            if v1183 == 1 then
                v76()
                break
            end
        end
    elseif v541 and not _G.BlockClick then
        local v1311 = 0
        while true do
            if v1311 == 1 then
                v76()
                break
            end
            if v1311 == 0 then
                _G.BlockClick = true
                updateWeaponScripts()
                v1311 = 1
            end
        end
    end
end
function SetClickShootState(v542)
    v44 = v542
    if v542 then
        _G.BlockClick = true
        updateWeaponScripts()
        v76()
        if v46 and not v47 then
            v79()
        end
    else
        updateBlockState()
        if not v44 and not v45 and v47 then
            v47:Destroy()
            v47 = nil
        end
    end
end
function SetAutoShootState(v543)
    v45 = v543
    if v543 then
        local v1184 = 0
        while true do
            if v1184 == 1 then
                v76()
                if v46 and not v47 then
                    v79()
                end
                break
            end
            if v1184 == 0 then
                _G.BlockClick = true
                updateWeaponScripts()
                v1184 = 1
            end
        end
    else
        updateBlockState()
        if not v44 and not v45 and v47 then
            v47:Destroy()
            v47 = nil
        end
    end
end
v11.CharacterAdded:Connect(function(v545)
    v40 = nil
    v41 = false
    v54 = {}
    v545:WaitForChild("Humanoid", 5)
    local v546 = v545:WaitForChild("HumanoidRootPart", 3)
    if v546 then
        local v881 = 0
        while true do
            if v881 == 1 then
                v60()
                break
            end
            if 0 == v881 then
                task.wait(1.5)
                pcall(initializeWeaponScript)
                v881 = 1
            end
        end
    end
end)
v11.CharacterAdded:Connect(function(v547)
    v547.ChildAdded:Connect(function(v1312)
        if v1312:IsA("Tool") and v1312:FindFirstChild("fire") then
            local v1437 = 0
            while true do
                if v1437 == 2 then
                    pcall(updateWeaponScripts)
                    break
                end
                if 0 == v1437 then
                    task.wait(0.1)
                    v40 = v1312
                    v1437 = 1
                end
                if v1437 == 1 then
                    v41 = true
                    v61(v40)
                    v1437 = 2
                end
            end
        end
    end)
    v547.ChildRemoved:Connect(function(v1313)
        if v1313 == v40 then
            v41 = false
            v40 = nil
            task.wait(0.1)
            pcall(initializeWeaponScript)
        end
    end)
end)
game:GetService("RunService").Heartbeat:Connect(function()
    if v40 and not v40:IsDescendantOf(game) then
        v40 = nil
        v41 = false
    end
end)
workspace.DescendantRemoving:Connect(function(v550)
    if v550 == v40 then
        v40 = nil
        v41 = false
    end
end)
local v80 = false
v16.InputBegan:Connect(function(v551)
    if v551.KeyCode == v43 then
        local v886 = 0
        while true do
            if v886 == 0 then
                if not v44 and not v45 then
                    if v33 and not v80 and not v46 then
                        v33:Notify({
                            Title = "Block Shoot",
                            Content = "Enable Click Shoot or Auto Shoot first!",
                            Duration = 3,
                            Image = 15403175166.000002,
                        })
                    end
                    return
                end
                _G.BlockClick = not _G.BlockClick
                v886 = 1
            end
            if v886 == 2 then
                v76()
                break
            end
            if v886 == 1 then
                updateWeaponScripts()
                if v33 and not v80 and not v46 then
                    v33:Notify({
                        Title = "Block Shoot",
                        Content = _G.BlockClick and "Enabled" or "Disabled",
                        Duration = 2,
                        Image = 15403175166,
                    })
                end
                v886 = 2
            end
        end
    end
end)
local v81 = v34:CreateTab("AimAssist", 15403121940)
v81:CreateLabel("If you do not know what this is, do not touch these options")
v81:CreateInput({
    Name = "Aim Distance",
    PlaceholderText = "1 - 10000",
    RemoveTextAfterFocusLost = false,
    CurrentValue = tostring(v42),
    Callback = function(v552)
        local v554 = tonumber(v552)
        if v554 then
            v42 = math.clamp(v554, 1, 10000)
            v58.maxDetectionDistance = v42
        end
    end,
})
v81:CreateInput({
    Name = "Block Shoot Key",
    PlaceholderText = "Example: F, G, H",
    RemoveTextAfterFocusLost = false,
    CurrentValue = v43.Name,
    Callback = function(v555)
        local v558, v558_21
        local v557_20
        v557_20, v558_21 = pcall(function()
            return Enum.KeyCode[v555]
        end)
        if v557_20 and v558_21 then
            v43 = v558_21
        end
    end,
})
v81:CreateSlider({
    Name = "Aim Assist Strength",
    Range = {0, 100},
    Increment = 5,
    Suffix = "%",
    CurrentValue = v58.aimAssistStrength * 100,
    Callback = function(v559)
        v58.aimAssistStrength = v559 / 100
        print("Aim Assist Strength set to: " .. tostring(v58.aimAssistStrength))
    end,
})
v81:CreateSlider({
    Name = "Base Raycast Count",
    Range = {1, 15},
    Increment = 1,
    CurrentValue = v58.baseRaycastCount,
    Callback = function(v561)
        v58.baseRaycastCount = v561
        print("Base Raycast Count set to: " .. tostring(v561))
    end,
})
v81:CreateSlider({
    Name = "Camera Detection Threshold",
    Range = {0, 50},
    Increment = 1,
    Suffix = "%",
    CurrentValue = v58.cameraThreshold * 100,
    Callback = function(v563)
        v58.cameraThreshold = v563 / 100
        print("Camera Threshold set to: " .. tostring(v58.cameraThreshold))
    end,
})
v81:CreateToggle({
    Name = "Allow Backwards Shooting",
    CurrentValue = v58.allowBackwardsShooting,
    Callback = function(v565)
        v58.allowBackwardsShooting = v565
        print("Allow Backwards Shooting: " .. tostring(v565))
    end,
})
v81:CreateToggle({
    Name = "Debug Mode",
    CurrentValue = false,
    Callback = function(v567)
        _G.DebugMode = v567
        print("Debug Mode: " .. tostring(v567))
    end,
})
v81:CreateLabel("Mobile Settings & PC")
v81:CreateToggle({
    Name = "Mobile UI",
    CurrentValue = false,
    Callback = function(v569)
        v46 = v569
        if v569 and (v44 or v45) and not v47 then
            v79()
        elseif not v569 and v47 then
            v47:Destroy()
            v47 = nil
        end
    end,
})
v81:CreateToggle({
    Name = "Hide Mobile Button",
    CurrentValue = false,
    Callback = function(v571)
        v77 = v571
        v78()
    end,
})
v81:CreateToggle({
    Name = "Disable PC Notifications",
    CurrentValue = false,
    Callback = function(v573)
        v80 = v573
    end,
})
v81:CreateLabel("Shoot Types (For Guns)")
v81:CreateToggle({
    Name = "Click Shoot",
    CurrentValue = false,
    Callback = function(v574)
        SetClickShootState(v574)
    end,
})
v81:CreateToggle({
    Name = "Auto Shoot",
    CurrentValue = false,
    Callback = function(v575)
        SetAutoShootState(v575)
    end,
})
if v23 then
    v23.ChildRemoved:Connect(function(v887)
        local v888 = 0
        local v890
        local v889
        while true do
            if v888 == 0 then
                v889 = 0
                v890 = nil
                v888 = 1
            end
            if v888 == 1 then
                local v891_22 = nil
                while true do
                    if v889 == 4 then
                        v41 = true
                        initializeWeaponScript()
                        break
                    end
                    if 1 == v889 then
                        v890 = v11.Character
                        if not v890 then
                            return
                        end
                        v889 = 2
                    end
                    if v889 == 0 then
                        if not v887:IsA("Tool") then
                            return
                        end
                        task.wait(0.2)
                        v889 = 1
                    end
                    if v889 == 3 then
                        if not v891_22:FindFirstChild("fire") then
                            return
                        end
                        v40 = v891_22
                        v889 = 4
                    end
                    if v889 == 2 then
                        local v1378 = 0
                        while true do
                            if v1378 == 1 then
                                v889 = 3
                                break
                            end
                            if v1378 == 0 then
                                v891_22 = v890:FindFirstChild(v887.Name)
                                if not v891_22 then
                                    return
                                end
                                v1378 = 1
                            end
                        end
                    end
                end
                break
            end
        end
    end)
    v23.ChildAdded:Connect(function(v892)
        if not v892:IsA("Tool") then
            return
        end
        if v41 and v40 and v892.Name == v40.Name then
            local v1316 = 0
            while true do
                if 0 == v1316 then
                    v40 = nil
                    v41 = false
                    v1316 = 1
                end
                if v1316 == 1 then
                    updateWeaponScripts()
                    break
                end
            end
        end
    end)
end
task.spawn(function()
    while true do
        local v820 = v11.Character
        if v820 then
            local v996 = nil
            for v1083, v1084 in ipairs(v820:GetChildren()) do
                if v1084:IsA("Tool") and v1084:FindFirstChild("fire") then
                    v996 = v1084
                    break
                end
            end
            if v996 and v40 ~= v996 then
                local v1188 = 0
                while true do
                    if v1188 == 0 then
                        v40 = v996
                        v41 = true
                        v1188 = 1
                    end
                    if v1188 == 1 then
                        initializeWeaponScript()
                        break
                    end
                end
            elseif not v996 and v41 then
                v40 = nil
                v41 = false
            end
        end
        task.wait(0.1)
    end
end)
task.spawn(function()
    while true do
        if v45 and v41 and v40 and _G.BlockClick then
            v75()
        end
        task.wait(0.03)
    end
end)
local function v82()
    if v44 and v41 and v40 and _G.BlockClick then
        v75()
    end
end
v24.Button1Down:Connect(v82)
task.spawn(function()
    while true do
        local v823 = 0
        local v824
        while true do
            if v823 == 1 then
                for v1189, v1190 in pairs(v54) do
                    if v824 - v1190.time > 1.0 then
                        v54[v1189] = nil
                    end
                end
                break
            end
            if v823 == 0 then
                task.wait(2)
                v824 = tick()
                v823 = 1
            end
        end
    end
end)
v60()
local v83 = v34:CreateTab("Invisibility", 15402913667)
_G.InvisibilityEnabled = true
local v85 = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local v86 = false
v85.Archivable = true
local v88
v83:CreateLabel("Auto-Give Cloak - Keeps cloak in backpack automatically")
local v89 = false
v83:CreateToggle({
    Name = "Auto-Give Cloak",
    CurrentValue = false,
    Flag = "AutoGiveCloak",
    Callback = function(v576)
        v89 = v576
    end,
})
local function v90()
    local v577 = 0
    local v579
    local v581
    local v582
    while true do
        if v577 == 1 then
            v88 = v85:Clone()
            for v1085, v1086 in pairs(v88:GetDescendants()) do
                if v1086:IsA("BodyVelocity") or v1086:IsA("BodyGyro") or v1086:IsA("BodyPosition") then
                    v1086:Destroy()
                end
                if v1086:IsA("BasePart") and v1086.Transparency < 1 then
                    v1086.Transparency = 0.85
                end
            end
            v579 = Instance.new("BodyVelocity")
            v577 = 2
        end
        if v577 == 4 then
            v88.HumanoidRootPart.Anchored = false
            local v580_24 = v85:FindFirstChildOfClass("Animator")
            if v580_24 then
                v580_24:Clone().Parent = v88
            end
            v577 = 5
        end
        if v577 == 6 then
            v581 = v85:FindFirstChildOfClass("Humanoid")
            v582 = v85.HumanoidRootPart.CFrame + Vector3.new(0, 100000000, 0)
            task.spawn(function()
                for v1192 = 1, 90 do
                    if v86 then
                        v85.HumanoidRootPart.CFrame = v582
                    end
                    task.wait(0.1)
                end
            end)
            v577 = 7
        end
        if 2 == v577 then
            v579.MaxForce = Vector3.new(500000, 500000, 500000)
            v579.Velocity = Vector3.new(0, 0, 0)
            v579.Parent = v88.HumanoidRootPart
            v577 = 3
        end
        if v577 == 5 then
            local v1002 = 0
            while true do
                if v1002 == 1 then
                    v86 = true
                    v577 = 6
                    break
                end
                if v1002 == 0 then
                    for v1319, v1320 in pairs(v85:GetChildren()) do
                        if v1320:IsA("LocalScript") then
                            local v1438 = 0
                            local v1439
                            while true do
                                if v1438 == 1 then
                                    v1439.Parent = v88
                                    break
                                end
                                if v1438 == 0 then
                                    v1439 = v1320:Clone()
                                    v1439.Disabled = true
                                    v1438 = 1
                                end
                            end
                        end
                    end
                    workspace.CurrentCamera.CameraSubject = v88.Humanoid
                    v1002 = 1
                end
            end
        end
        if v577 == 3 then
            v88.Parent = workspace
            v88.HumanoidRootPart.CFrame = v85.HumanoidRootPart.CFrame
            v88.Humanoid.WalkSpeed = v85.Humanoid.WalkSpeed * 2
            v577 = 4
        end
        if v577 == 0 then
            if v31 then
                v31:Disconnect()
                v31 = nil
            end
            local v578_23 = v85:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity")
            if v578_23 then
                v578_23.P = 0
                v578_23.MaxForce = Vector3.new(0, 0, 0)
            end
            v577 = 1
        end
        if 7 == v577 then
            task.wait(0.1)
            v31 = v30.RenderStepped:Connect(function()
                local v1089 = 0
                while true do
                    if v1089 == 1 then
                        local v1090_25 = v581.MoveDirection
                        if v1090_25.Magnitude > 0 then
                            v579.Parent = nil
                            local v1443 = workspace.CurrentCamera.CFrame.LookVector:Dot(v1090_25) < 0
                            local v1444 = v1443 and workspace.CurrentCamera.CFrame.LookVector.Y * -1.4 or workspace.CurrentCamera.CFrame.LookVector.Y * 1.8
                            local v1445 = v1443 and 1.4 or 1.6
                            local v1446 = Vector3.new(v1090_25.X, v1444 + 0.35, v1090_25.Z).Unit
                            v88.HumanoidRootPart.Velocity = v1446 * v88.Humanoid.WalkSpeed * v1445
                        else
                            v579.Parent = v88.HumanoidRootPart
                        end
                        break
                    end
                    if v1089 == 0 then
                        if not _G.InvisibilityEnabled then
                            return
                        end
                        if not v86 then
                            return
                        end
                        v1089 = 1
                    end
                end
            end)
            break
        end
    end
end
local function v91()
    local v584 = 0
    while true do
        if v584 == 2 then
            for v1322 = 1, 5 do
                v85.HumanoidRootPart.CFrame = v88.HumanoidRootPart.CFrame
                task.wait()
            end
            v88:Destroy()
            v584 = 3
        end
        if v584 == 0 then
            if not v86 then
                return
            end
            v85.HumanoidRootPart.Velocity = Vector3.new()
            v584 = 1
        end
        if v584 == 1 then
            for v1325, v1326 in pairs(v88:GetDescendants()) do
                if v1326:IsA("BasePart") and v1326.Transparency < 1 then
                    v1326.Transparency = 1
                end
            end
            v86 = false
            v584 = 2
        end
        if v584 == 3 then
            workspace.CurrentCamera.CameraSubject = v85.Humanoid
            if v31 then
                v31:Disconnect()
                v31 = nil
            end
            break
        end
    end
end
local function v92()
    local v588 = 0
    local v590
    local v589
    while true do
        if v588 == 0 then
            local v1007 = 0
            while true do
                if v1007 == 1 then
                    v588 = 1
                    break
                end
                if v1007 == 0 then
                    v589 = game.Players.LocalPlayer.Backpack:FindFirstChild("Invisibility Cloak")
                    v590 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Invisibility Cloak")
                    v1007 = 1
                end
            end
        end
        if v588 == 1 then
            if not v589 and not v590 then
                local v1196 = 0
                local v1197
                while true do
                    if v1196 == 2 then
                        v1197.Equipped:Connect(function()
                            if not v86 and _G.InvisibilityEnabled then
                                v90()
                            end
                        end)
                        v1197.Unequipped:Connect(function()
                            if v86 then
                                v91()
                            end
                        end)
                        v1196 = 3
                    end
                    if v1196 == 0 then
                        local v1382 = 0
                        while true do
                            if v1382 == 1 then
                                v1196 = 1
                                break
                            end
                            if v1382 == 0 then
                                v1197 = Instance.new("Tool")
                                v1197.Name = "Invisibility Cloak"
                                v1382 = 1
                            end
                        end
                    end
                    if v1196 == 1 then
                        v1197.RequiresHandle = false
                        v1197.Parent = game.Players.LocalPlayer.Backpack
                        v1196 = 2
                    end
                    if v1196 == 3 then
                        return true
                    end
                end
            end
            return false
        end
    end
end
v83:CreateLabel("Invisibility Cloak - Press button to get the cloak tool")
v83:CreateButton({
    Name = "Get Invisibility Cloak",
    Callback = function()
        if v92() then
            v33:Notify({
                Title = "Invisibility",
                Content = "Cloak added to your backpack!",
                Duration = 3,
                Image = 15403175166.000002,
            })
        else
            v33:Notify({
                Title = "Invisibility",
                Content = "You already have a cloak in your inventory!",
                Duration = 3,
                Image = 15403175166.000002,
            })
        end
    end,
})
v83:CreateButton({
    Name = "Remove Cloak",
    Callback = function()
        local v591 = 0
        local v592
        while true do
            if v591 == 0 then
                v592 = false
                for v1091, v1092 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v1092.Name == "Invisibility Cloak" then
                        v1092:Destroy()
                        v592 = true
                    end
                end
                v591 = 1
            end
            if v591 == 1 then
                if game.Players.LocalPlayer.Character then
                    local v1198 = game.Players.LocalPlayer.Character:FindFirstChild("Invisibility Cloak")
                    if v1198 then
                        v1198:Destroy()
                        v592 = true
                    end
                end
                if v592 then
                    v33:Notify({
                        Title = "Invisibility",
                        Content = "Cloak removed from your inventory!",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                else
                    v33:Notify({
                        Title = "Invisibility",
                        Content = "No cloak found in your inventory!",
                        Duration = 3,
                        Image = 15403175166,
                    })
                end
                break
            end
        end
    end,
})
task.spawn(function()
    while true do
        if v89 then
            v92()
        end
        task.wait(1)
    end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function(v593)
    local v594 = 0
    while true do
        if v594 == 1 then
            if v89 then
                v92()
            end
            break
        end
        if v594 == 0 then
            v85 = v593
            v85.Archivable = true
            v594 = 1
        end
    end
end)
local v93 = v34:CreateTab("Kill", 15403116835)
v93:CreateLabel("Kill All Players")
v93:CreateButton({
    Name = "Kill Everyone (Add Winned Rounds - Depending Alive Enemies)",
    Callback = function()
        for v1093, v1094 in pairs(v8:GetPlayers()) do
            if v1094 ~= v11 then
                if KnifeKill then
                    KnifeKill:FireServer(v1094)
                end
            end
        end
        if v33 then
            v33:Notify({
                Title = "Kill All",
                Content = "Tried to kill all players!",
                Duration = 3,
                Image = 15403175166,
            })
        end
    end,
})
local function v94()
    for v1329, v1330 in ipairs(v11.Backpack:GetChildren()) do
        if v1330:FindFirstChild("kill") then
            return v1330
        end
    end
    return nil
end
v93:CreateButton({
    Name = "Kill Everyone (Gun In Backpack) (Does Not Add Won Rounds)",
    Callback = function()
        local v597 = 0
        local v598
        while true do
            if v597 == 1 then
                local v599_26 = v38()
                for v1095, v1096 in ipairs(v599_26) do
                    local v1097 = 0
                    local v1098
                    local v1099
                    while true do
                        if v1097 == 0 then
                            local v1331 = 0
                            while true do
                                if v1331 == 0 then
                                    v1098 = v598.Handle.Position
                                    v1099 = Vector3.new(0, 0, 0)
                                    v1331 = 1
                                end
                                if 1 == v1331 then
                                    v1097 = 1
                                    break
                                end
                            end
                        end
                        if 1 == v1097 then
                            pcall(function()
                                local v1386 = (v1099 - v1098).Unit
                                v598.kill:FireServer(v1096, v1386, v1099)
                            end)
                            break
                        end
                    end
                end
                v597 = 2
            end
            if v597 == 0 then
                v598 = v94()
                if not v598 then
                    return
                end
                v597 = 1
            end
            if v597 == 2 then
                if v33 then
                    v33:Notify({
                        Title = "Kill Everyone",
                        Content = "Tried to kill all enemies!",
                        Duration = 3,
                        Image = 15403175166,
                    })
                end
                break
            end
        end
    end,
})
local v95 = false
local v96 = false
v93:CreateToggle({
    Name = "Kill Spam (Add Winned Rounds - Depending Alive Enemies)",
    CurrentValue = false,
    Flag = "KillSpam",
    Image = 15403175166,
    Callback = function(v600)
        local v601 = 0
        while true do
            if v601 == 1 then
                if v95 then
                    task.spawn(function()
                        while v95 do
                            for v1712, v1713 in pairs(v8:GetPlayers()) do
                                if v1713 ~= v11 then
                                    KnifeKill:FireServer(v1713)
                                end
                            end
                            task.wait(0.01)
                        end
                    end)
                    v33:Notify({
                        Title = "Kill Spam",
                        Content = "Started!",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                else
                    v33:Notify({
                        Title = "Kill Spam",
                        Content = "Stopped!",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                break
            end
            if v601 == 0 then
                if not v96 then
                    v96 = true
                    return
                end
                v95 = v600
                v601 = 1
            end
        end
    end,
})
v93:CreateLabel("Kill Single Player")
local v97 = nil
local function v98()
    local v602 = 0
    local v603
    while true do
        if v602 == 0 then
            v603 = {}
            for v1100, v1101 in pairs(v8:GetPlayers()) do
                if v1101 ~= v11 then
                    table.insert(v603, v1101.Name)
                end
            end
            v602 = 1
        end
        if 1 == v602 then
            return v603
        end
    end
end
local v99 = v93:CreateDropdown({
    Name = "Select Player",
    Options = v98(),
    CurrentOption = {},
    Flag = "PlayerDropdown",
    Callback = function(v604)
        v97 = v8:FindFirstChild(v604[1])
    end,
})
v8.PlayerAdded:Connect(function()
    v99:Set(v98())
end)
v8.PlayerRemoving:Connect(function()
    v99:Set(v98())
end)
v93:CreateButton({
    Name = "Kill Player",
    Callback = function()
        if v97 then
            KnifeKill:FireServer(v97)
            v33:Notify({
                Title = "Knife Kill",
                Content = "Tried to kill " .. v97.Name .. "!",
                Duration = 3,
                Image = 15403175166,
            })
        else
            v33:Notify({
                Title = "Error",
                Content = "Select a player first!",
                Duration = 3,
                Image = 15403175166,
            })
        end
    end,
})
local v100 = v34:CreateTab("Inventory", 15403400185)
v100:CreateLabel("View Player Inventory")
local v101 = nil
local function v98()
    local v605 = 0
    local v606
    while true do
        if v605 == 0 then
            v606 = {}
            for v1102, v1103 in ipairs(v8:GetPlayers()) do
                table.insert(v606, v1103.Name)
            end
            v605 = 1
        end
        if v605 == 1 then
            return v606
        end
    end
end
local v102 = v100:CreateDropdown({
    Name = "Select Player",
    Options = v98(),
    CurrentOption = {},
    Flag = "InventoryDropdown",
    Callback = function(v607)
        v101 = v8:FindFirstChild(v607[1])
    end,
})
local function v103()
    local v608 = 0
    local v609
    while true do
        if v608 == 1 then
            if v609 and v8:FindFirstChild(v609) then
                v102:Set({v609})
                v101 = v8:FindFirstChild(v609)
            else
                v101 = nil
            end
            break
        end
        if v608 == 0 then
            v609 = v101 and v101.Name or nil
            v102:Set(v98())
            v608 = 1
        end
    end
end
v8.PlayerAdded:Connect(v103)
v8.PlayerRemoving:Connect(v103)
v100:CreateButton({
    Name = "View Inventory",
    Callback = function()
        if v101 then
            v39(v101.Name)
            v33:Notify({
                Title = "Inventory Viewer",
                Content = "Opening inventory for " .. v101.Name .. "!",
                Duration = 3,
                Image = 15403175166.000002,
            })
        else
            v33:Notify({
                Title = "Error",
                Content = "Select a player first!",
                Duration = 3,
                Image = 15403175166.000002,
            })
        end
    end,
})
v100:CreateLabel("Fix Trading Inventory")
v100:CreateButton({
    Name = "Trade Fix",
    Callback = function()
        local v610 = game:GetService("Players")
        local v611 = game:GetService("ReplicatedStorage")
        local v612 = v610.LocalPlayer
        local v613 = v611:WaitForChild("TradeItem")
        local v614 = v612.PlayerGui.Main.MainInventoryFrame.ItemsHolderFrame
        local v615 = v612.PlayerGui.Main.MainTradingFrame.ItemsHolderFrame
        local v616 = v612.PlayerGui.Main.MainTradingFrame.Slots.YourOfferFrame
        local v617
        local v618 = v612.PlayerGui:FindFirstChild("Main") and v612.PlayerGui.Main:FindFirstChild("MainTradingFrame")
        if not (v618 and v618.Visible) then
            v33:Notify({
                Title = "Error",
                Content = "You are not in a trade!",
                Duration = 3,
                Image = 15403175166,
            })
            return
        end
        local v619 = v618.Slots.TradingPlayerName
        local v620 = v619.Text
        local v621 = v620:match("%(@(.+)%)")
        local v622 = v610:FindFirstChild(v621)
        if not v622 then
            v33:Notify({
                Title = "Error",
                Content = "Target player not found!",
                Duration = 3,
                Image = 15403175166.000002,
            })
            return
        end
        local function v623()
            if v617 then
                return
            end
            local v827 = v616:FindFirstChild("EmptySlot4") or v616:FindFirstChild("EmptySlot3") or v616:FindFirstChild("EmptySlot2") or v616:FindFirstChild("EmptySlot1")
            if v827 then
                v617 = v827:Clone()
            end
        end
        local function v624()
            local v828 = 0
            local v830
            local v832, v832_27
            local v829
            local v833
            local v831
            while true do
                if v828 == 3 then
                    v833 = v830 + #v831
                    v828 = 4
                end
                if v828 == 1 then
                    v829 = {}
                    v830 = 0
                    v828 = 2
                end
                if v828 == 2 then
                    v831 = {}
                    for v1202, v1203 in ipairs(v616:GetChildren()) do
                        local v1204 = 0
                        local v1206, v1206_28
                        local v1205
                        while true do
                            if v1204 == 0 then
                                v1205 = v1203.Name
                                v1206 = v1205:match("^EmptySlot(%d+)$")
                                v1204 = 1
                            end
                            if v1204 == 1 then
                                if v1206 then
                                    v1206_28 = tonumber(v1206)
                                    if not v829[v1206_28] then
                                        v829[v1206_28] = true
                                        table.insert(v831, v1203)
                                    else
                                        v1203:Destroy()
                                    end
                                elseif v1205:match("^Item") then
                                    v830 = v830 + 1
                                end
                                break
                            end
                        end
                    end
                    v828 = 3
                end
                if v828 == 0 then
                    if not v617 then
                        warn("emptySlotTemplate es nil")
                        return
                    end
                    if not v616 then
                        warn("yourOfferFrame es nil")
                        return
                    end
                    v828 = 1
                end
                if v828 == 4 then
                    if v833 > 4 then
                        local v1261 = v833 - 4
                        for v1542 = 1, v1261 do
                            if v831[v1542] then
                                v831[v1542]:Destroy()
                            end
                        end
                    elseif v833 < 4 then
                        local v1389 = 4 - v833
                        for v1621 = 1, 4 do
                            if v1389 <= 0 then
                                break
                            end
                            if not v829[v1621] then
                                local v1663 = 0
                                local v1664
                                while true do
                                    if v1663 == 2 then
                                        v1389 = v1389 - 1
                                        break
                                    end
                                    if v1663 == 1 then
                                        v1664.Parent = v616
                                        v829[v1621] = true
                                        v1663 = 2
                                    end
                                    if v1663 == 0 then
                                        v1664 = v617:Clone()
                                        v1664.Name = "EmptySlot" .. v1621
                                        v1663 = 1
                                    end
                                end
                            end
                        end
                    end
                    break
                end
            end
        end
        local function v625()
            local v834 = 0
            local v836
            local v838
            local v835
            while true do
                if v834 == 3 then
                    if not v838 then
                        return nil
                    end
                    return v610:FindFirstChild(v838)
                end
                if v834 == 1 then
                    local v1104 = 0
                    while true do
                        if v1104 == 1 then
                            v834 = 2
                            break
                        end
                        if v1104 == 0 then
                            v836 = v835.Slots.TradingPlayerName
                            if not v836 then
                                return nil
                            end
                            v1104 = 1
                        end
                    end
                end
                if v834 == 0 then
                    local v1105 = 0
                    while true do
                        if v1105 == 1 then
                            v834 = 1
                            break
                        end
                        if 0 == v1105 then
                            v835 = v612.PlayerGui.Main:FindFirstChild("MainTradingFrame")
                            if not (v835 and v835.Visible) then
                                return nil
                            end
                            v1105 = 1
                        end
                    end
                end
                if 2 == v834 then
                    local v1106 = 0
                    while true do
                        if v1106 == 1 then
                            v834 = 3
                            break
                        end
                        if v1106 == 0 then
                            v838 = v836.Text:match("%(@(.+)%)")
                            v1106 = 1
                        end
                    end
                end
            end
        end
        local function v626()
            local v839 = 0
            local v840
            while true do
                if v839 == 0 then
                    v840 = {}
                    for v1207, v1208 in ipairs(v615:GetChildren()) do
                        v840[v1208.Name] = true
                    end
                    v839 = 1
                end
                if v839 == 1 then
                    return v840
                end
            end
        end
        local function v627()
            for v1210 = 1, 4 do
                local v1211 = v616:FindFirstChild("EmptySlot" .. v1210)
                if v1211 then
                    return v1211
                end
            end
            return nil
        end
        local function v628(v842, v843)
            local v844 = 0
            local v845
            while true do
                if v844 == 1 then
                    v845.MouseButton1Click:Connect(function()
                        local v1212 = v625()
                        if not v1212 then
                            return
                        end
                        v613:InvokeServer("REMOVE_FROM_TRADE", v1212, v843, {OurItems = {}, TheirItems = {}})
                        local v1213 = v615:FindFirstChild("Item" .. v843)
                        if v1213 then
                            local v1334 = 0
                            local v1336
                            local v1335
                            while true do
                                if v1334 == 0 then
                                    v1335 = v1213:FindFirstChild("ItemCountValue")
                                    v1336 = v1213:FindFirstChild("ItemCount") or v1213:FindFirstChild("Count") or v1213:FindFirstChildWhichIsA("TextLabel")
                                    v1334 = 1
                                end
                                if v1334 == 1 then
                                    if v1335 and v1336 then
                                        v1335.Value = v1335.Value + 1
                                        v1336.Text = tostring(v1335.Value)
                                    end
                                    break
                                end
                            end
                        else
                            local v1338 = v614:FindFirstChild(v843)
                            if v1338 then
                                local v1623 = 0
                                local v1624
                                while true do
                                    if 0 == v1623 then
                                        v1624 = v1338:Clone()
                                        v1624.Name = "Item" .. v843
                                        v1623 = 1
                                    end
                                    if v1623 == 1 then
                                        v1624.Parent = v615
                                        pcall(function()
                                            v1624.Visible = true
                                        end)
                                        v1623 = 2
                                    end
                                    if v1623 == 3 then
                                        setupAddButton(v1624, v843)
                                        break
                                    end
                                    if v1623 == 2 then
                                        local v1625_30 = v1624:FindFirstChild("ItemCount") or v1624:FindFirstChild("Count") or v1624:FindFirstChildWhichIsA("TextLabel")
                                        if v1625_30 then
                                            local v1717 = 0
                                            local v1718
                                            while true do
                                                if v1717 == 1 then
                                                    v1718.Value = 1
                                                    v1718.Parent = v1624
                                                    v1717 = 2
                                                end
                                                if v1717 == 2 then
                                                    v1625_30.Text = "1"
                                                    break
                                                end
                                                if v1717 == 0 then
                                                    local v1731 = 0
                                                    while true do
                                                        if v1731 == 0 then
                                                            v1718 = Instance.new("IntValue")
                                                            v1718.Name = "ItemCountValue"
                                                            v1731 = 1
                                                        end
                                                        if v1731 == 1 then
                                                            v1717 = 1
                                                            break
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        v1623 = 3
                                    end
                                end
                            end
                        end
                        v842:Destroy()
                        v624()
                    end)
                    break
                end
                if v844 == 0 then
                    v845 = v842:FindFirstChild("Button") or v842:FindFirstChildWhichIsA("TextButton")
                    if not v845 then
                        return
                    end
                    v844 = 1
                end
            end
        end
        local function v629(v846, v847)
            local v848 = 0
            local v849
            while true do
                if v848 == 1 then
                    v849.MouseButton1Click:Connect(function()
                        local v1214 = 0
                        local v1216
                        local v1218
                        local v1215
                        local v1217
                        while true do
                            if v1214 == 0 then
                                v623()
                                v1215 = v625()
                                if not v1215 then
                                    return
                                end
                                v1214 = 1
                            end
                            if v1214 == 3 then
                                local v1390 = 0
                                while true do
                                    if v1390 == 1 then
                                        v1218.Text = tostring(v1217.Value)
                                        v1214 = 4
                                        break
                                    end
                                    if v1390 == 0 then
                                        v613:InvokeServer("ADD_TO_TRADE", v1215, v847, {OurItems = {}, TheirItems = {}})
                                        v1217.Value = v1217.Value - 1
                                        v1390 = 1
                                    end
                                end
                            end
                            if v1214 == 4 then
                                local v1219_31 = v614:FindFirstChild(v847)
                                if v1219_31 then
                                    local v1543 = 0
                                    local v1545
                                    local v1544
                                    while true do
                                        if v1543 == 2 then
                                            local v1638 = 0
                                            while true do
                                                if 0 == v1638 then
                                                    v1544.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                                                    v1545 = v1544:FindFirstChild("ItemImage")
                                                    v1638 = 1
                                                end
                                                if v1638 == 1 then
                                                    if v1545 then
                                                        v1545.BackgroundTransparency = 0
                                                        v1545.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                                                    end
                                                    v1543 = 3
                                                    break
                                                end
                                            end
                                        end
                                        if 1 == v1543 then
                                            v1544.Position = v1216.Position
                                            v1544.Size = UDim2.new(0.218994126, 0, 0.843777716, 0)
                                            v1544.BackgroundTransparency = 0
                                            v1543 = 2
                                        end
                                        if v1543 == 0 then
                                            local v1643 = 0
                                            while true do
                                                if v1643 == 1 then
                                                    v1544.Parent = v616
                                                    v1543 = 1
                                                    break
                                                end
                                                if v1643 == 0 then
                                                    v1544 = v1219_31:Clone()
                                                    v1544.Name = "Item" .. v847
                                                    v1643 = 1
                                                end
                                            end
                                        end
                                        if v1543 == 3 then
                                            for v1665, v1666 in ipairs(v1544:GetChildren()) do
                                                if v1666:IsA("TextLabel") and (v1666.Name:match("ItemCount") or v1666.Name:match("Count")) then
                                                    v1666:Destroy()
                                                elseif v1666:IsA("IntValue") and v1666.Name:match("ItemCountValue") then
                                                    v1666:Destroy()
                                                end
                                            end
                                            v628(v1544, v847)
                                            v1216:Destroy()
                                            break
                                        end
                                    end
                                end
                                if v1217.Value <= 0 then
                                    v846:Destroy()
                                end
                                break
                            end
                            if v1214 == 1 then
                                v1216 = v627()
                                if not v1216 then
                                    return
                                end
                                v1217 = v846:FindFirstChild("ItemCountValue")
                                v1214 = 2
                            end
                            if v1214 == 2 then
                                local v1391 = 0
                                while true do
                                    if v1391 == 1 then
                                        if v1217.Value <= 0 then
                                            return
                                        end
                                        v1214 = 3
                                        break
                                    end
                                    if v1391 == 0 then
                                        v1218 = v846:FindFirstChild("ItemCount") or v846:FindFirstChild("Count") or v846:FindFirstChildWhichIsA("TextLabel")
                                        if not v1217 or not v1218 then
                                            return
                                        end
                                        v1391 = 1
                                    end
                                end
                            end
                        end
                    end)
                    break
                end
                if v848 == 0 then
                    v849 = v846:FindFirstChild("Button") or v846:FindFirstChildWhichIsA("TextButton")
                    if not v849 then
                        return
                    end
                    v848 = 1
                end
            end
        end
        v623()
        local v630 = v626()
        for v850, v851 in ipairs(v614:GetChildren()) do
            if v851:IsA("Frame") or v851:IsA("ImageLabel") then
                local v1010 = 0
                local v1012
                local v1011
                while true do
                    if v1010 == 1 then
                        if not v630[v1012] then
                            local v1392 = v851:Clone()
                            v1392.Name = v1012
                            v1392.Parent = v615
                            pcall(function()
                                v1392.Visible = true
                            end)
                            local v1395 = v1392:FindFirstChild("ItemCount") or v1392:FindFirstChild("Count") or v1392:FindFirstChildWhichIsA("TextLabel")
                            if v1395 then
                                local v1546 = 0
                                local v1547
                                while true do
                                    if v1546 == 2 then
                                        v1395.Text = tostring(v1547.Value)
                                        break
                                    end
                                    if v1546 == 0 then
                                        local v1645 = 0
                                        while true do
                                            if v1645 == 1 then
                                                v1546 = 1
                                                break
                                            end
                                            if v1645 == 0 then
                                                v1547 = Instance.new("IntValue")
                                                v1547.Name = "ItemCountValue"
                                                v1645 = 1
                                            end
                                        end
                                    end
                                    if 1 == v1546 then
                                        v1547.Value = tonumber(v1395.Text) or 1
                                        v1547.Parent = v1392
                                        v1546 = 2
                                    end
                                end
                            end
                            v629(v1392, v1011)
                        end
                        break
                    end
                    if v1010 == 0 then
                        local v1262 = 0
                        while true do
                            if v1262 == 1 then
                                v1010 = 1
                                break
                            end
                            if v1262 == 0 then
                                v1011 = v851.Name
                                v1012 = "Item" .. v1011
                                v1262 = 1
                            end
                        end
                    end
                end
            end
        end
        v624()
        v33:Notify({
            Title = "Trade Fix",
            Content = "Trading system initialized!",
            Duration = 3,
            Image = 15403175166.000002,
        })
    end,
})
local v104 = v34:CreateTab("Boxes", 15403012566.000002)
v104:CreateLabel("Open Boxes")
local v105 = nil
local v106 = v104:CreateDropdown({
    Name = "Select Box",
    Options = {
        "Knife Box #1",
        "Knife Box #2",
        "Gun Box #1",
        "Gun Box #2",
        "Mythic Box #1",
        "Mythic Box #2",
        "Mythic Box #3",
        "Mythic Box #4",
    },
    CurrentOption = {},
    Callback = function(v631)
        v105 = v631[1]
    end,
})
v104:CreateButton({
    Name = "Open Selected Box",
    Callback = function()
        local v633 = 0
        local v635, v635_32
        local v634
        while true do
            if v633 == 1 then
                if v634 then
                    v33:Notify({
                        Title = "Box Opener",
                        Content = "Opened " .. v105 .. "!",
                        Duration = 3,
                        Image = 15403175166,
                    })
                else
                    v33:Notify({
                        Title = "Error",
                        Content = "Failed to open box",
                        Duration = 3,
                        Image = 15403175166,
                    })
                end
                break
            end
            if v633 == 0 then
                if not v105 then
                    v33:Notify({
                        Title = "Error",
                        Content = "Select a box first!",
                        Duration = 3,
                        Image = 15403175166,
                    })
                    return
                end
                v634, v635_32 = pcall(function()
                    v12:InvokeServer(v105)
                end)
                v633 = 1
            end
        end
    end,
})
local v107 = v34:CreateTab("Equip", 15403144723)
v107:CreateLabel("Equip Weapons")
local v108 = nil
local v109 = nil
local function v110()
    local v636 = 0
    local v637
    while true do
        if v636 == 0 then
            v637 = {}
            for v1107, v1108 in pairs(v11:WaitForChild("SkinsFolder"):GetChildren()) do
                table.insert(v637, v1108.Name)
            end
            v636 = 1
        end
        if 1 == v636 then
            return v637
        end
    end
end
local v111 = v107:CreateDropdown({
    Name = "Select Weapon",
    Options = v110(),
    CurrentOption = {},
    Callback = function(v638)
        v108 = v638[1]
    end,
})
v11.SkinsFolder.ChildAdded:Connect(function()
    v111:Set(v110())
end)
v11.SkinsFolder.ChildRemoved:Connect(function()
    v111:Set(v110())
end)
v107:CreateDropdown({
    Name = "Select Type",
    Options = {"Knife", "Gun"},
    CurrentOption = {},
    Callback = function(v640)
        v109 = v640[1]
    end,
})
v107:CreateButton({
    Name = "Equip Selected",
    Callback = function()
        if v108 and v109 then
            local v898, v898_34
            local v897_33
            v897_33, v898_34 = pcall(function()
                v22:InvokeServer(v108, v109)
            end)
            if v897_33 then
                v33:Notify({
                    Title = "Equip",
                    Content = "Equipped " .. v108 .. " as " .. v109 .. "!",
                    Duration = 3,
                    Image = 15403175166.000002,
                })
            else
                v33:Notify({
                    Title = "Error",
                    Content = "Failed to equip!",
                    Duration = 3,
                    Image = 15403175166,
                })
            end
        else
            v33:Notify({
                Title = "Error",
                Content = "Select both weapon and type!",
                Duration = 3,
                Image = 15403175166,
            })
        end
    end,
})
local v112 = v34:CreateTab("Hitbox", 15403203770)
v112:CreateLabel("Hitbox Expander")
_G.HeadSize = nil
_G.Disabled = false
_G.Transparency = nil
_G.SelectedColor = nil
_G.Originals = {}
_G.AntiWall = false
local v113 = {}
local function v114(v642)
    local v643 = 0
    local v645
    local v644
    local v646
    while true do
        local v852 = 0
        while true do
            if 1 == v852 then
                if 3 == v643 then
                    return v646.Instance:IsDescendantOf(v642.Parent)
                end
                if v643 == 0 then
                    v644 = v15.CurrentCamera
                    v645 = RaycastParams.new()
                    v643 = 1
                end
                break
            end
            if 0 == v852 then
                if v643 == 2 then
                    v646 = v15:Raycast(v644.CFrame.Position, v642.Position - v644.CFrame.Position, v645)
                    if not v646 then
                        return true
                    end
                    v643 = 3
                end
                if 1 == v643 then
                    v645.FilterType = Enum.RaycastFilterType.Blacklist
                    v645.FilterDescendantsInstances = {v11.Character}
                    v643 = 2
                end
                v852 = 1
            end
        end
    end
end
local function v115(v647)
    if v647 == v11 then
        return
    end
    local v648 = v647.Character
    if not v648 then
        return
    end
    local v649 = v648:FindFirstChild("HumanoidRootPart")
    if not v649 then
        return
    end
    if _G.AntiWall and v113[v647.Name] == false then
        local v899 = 0
        while true do
            if v899 == 0 then
                local v900_35 = _G.Originals[v647.Name]
                if v900_35 then
                    local v1339 = 0
                    while true do
                        if 2 == v1339 then
                            v649.CanCollide = true
                            break
                        end
                        if v1339 == 1 then
                            v649.BrickColor = v900_35.Color
                            v649.Material = v900_35.Material
                            v1339 = 2
                        end
                        if v1339 == 0 then
                            v649.Size = v900_35.Size
                            v649.Transparency = v900_35.Transparency
                            v1339 = 1
                        end
                    end
                end
                v899 = 1
            end
            if v899 == 1 then
                return
            end
        end
    end
    if _G.Disabled then
        local v902 = 0
        while true do
            if v902 == 0 then
                if not _G.Originals[v647.Name] then
                    _G.Originals[v647.Name] = {
                        Size = v649.Size,
                        Transparency = v649.Transparency,
                        Color = v649.BrickColor,
                        Material = v649.Material,
                    }
                end
                if _G.HeadSize then
                    v649.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                end
                v902 = 1
            end
            if v902 == 1 then
                if _G.Transparency then
                    v649.Transparency = _G.Transparency
                end
                if _G.SelectedColor then
                    v649.BrickColor = BrickColor.new(_G.SelectedColor)
                end
                v902 = 2
            end
            if v902 == 2 then
                v649.Material = Enum.Material.Neon
                v649.CanCollide = false
                break
            end
        end
    else
        local v904 = _G.Originals[v647.Name]
        if v904 then
            local v1340 = 0
            while true do
                if v1340 == 2 then
                    v649.CanCollide = true
                    break
                end
                if v1340 == 1 then
                    v649.BrickColor = v904.Color
                    v649.Material = v904.Material
                    v1340 = 2
                end
                if 0 == v1340 then
                    v649.Size = v904.Size
                    v649.Transparency = v904.Transparency
                    v1340 = 1
                end
            end
        end
    end
end
local function v116(v650)
    local v651 = 0
    while true do
        if v651 == 0 then
            v113[v650.Name] = false
            v650.CharacterAdded:Connect(function()
                task.wait(0.15)
                v115(v650)
            end)
            v651 = 1
        end
        if v651 == 1 then
            if v650.Character then
                v115(v650)
            end
            break
        end
    end
end
for v652, v653 in pairs(v8:GetPlayers()) do
    v116(v653)
end
v8.PlayerAdded:Connect(v116)
task.spawn(function()
    while true do
        if _G.AntiWall then
            for v1341, v1342 in ipairs(v8:GetPlayers()) do
                if v1342 ~= v11 then
                    local v1453 = 0
                    local v1455
                    while true do
                        if v1453 == 0 then
                            local v1626 = 0
                            while true do
                                if v1626 == 1 then
                                    v1453 = 1
                                    break
                                end
                                if v1626 == 0 then
                                    local v1454_36 = v1342.Character
                                    v1455 = v1454_36 and v1454_36:FindFirstChild("HumanoidRootPart")
                                    v1626 = 1
                                end
                            end
                        end
                        if v1453 == 1 then
                            if v1455 then
                                v113[v1342.Name] = v114(v1455)
                            end
                            break
                        end
                    end
                end
            end
        end
        task.wait(0.15)
    end
end)
task.spawn(function()
    while true do
        for v1222, v1223 in ipairs(v8:GetPlayers()) do
            v115(v1223)
        end
        task.wait(0.16)
    end
end)
v112:CreateToggle({
    Name = "Enable Hitbox",
    CurrentValue = false,
    Callback = function(v654)
        _G.Disabled = v654
        for v1111, v1112 in pairs(v8:GetPlayers()) do
            v115(v1112)
        end
    end,
})
v112:CreateToggle({
    Name = "Anti Wall Shot",
    CurrentValue = false,
    Callback = function(v656)
        _G.AntiWall = v656
    end,
})
v112:CreateDropdown({
    Name = "Choose Color",
    Options = {
        "Gray",
        "Bright red",
        "Bright blue",
        "Bright yellow",
        "Bright green",
        "White",
        "Black",
    },
    CurrentOption = {},
    Callback = function(v657)
        _G.SelectedColor = v657[1]
        for v855, v856 in pairs(v8:GetPlayers()) do
            v115(v856)
        end
    end,
})
v112:CreateInput({
    Name = "Head Size",
    PlaceholderText = "1 - 50",
    RemoveTextAfterFocusLost = false,
    Callback = function(v659)
        local v660 = 0
        while true do
            if v660 == 1 then
                for v1113, v1114 in pairs(v8:GetPlayers()) do
                    v115(v1114)
                end
                break
            end
            if v660 == 0 then
                local v661_37 = tonumber(v659)
                _G.HeadSize = v661_37 and math.clamp(v661_37, 1, 50) or nil
                v660 = 1
            end
        end
    end,
})
v112:CreateInput({
    Name = "Transparency",
    PlaceholderText = "0 - 1",
    RemoveTextAfterFocusLost = false,
    Callback = function(v662)
        local v663 = 0
        while true do
            if v663 == 0 then
                local v664_38 = tonumber(v662)
                _G.Transparency = v664_38 and math.clamp(v664_38, 0, 1) or nil
                v663 = 1
            end
            if v663 == 1 then
                for v1115, v1116 in pairs(v8:GetPlayers()) do
                    v115(v1116)
                end
                break
            end
        end
    end,
})
local v117 = v34:CreateTab("Trading", 15403180857)
v117:CreateLabel("Trade Scam - Add Fake Items only if you have 1 item of the added")
local v118 = nil
local function v119()
    local v665 = 0
    local v666
    while true do
        if v665 == 1 then
            return v666
        end
        if 0 == v665 then
            local v1015 = 0
            while true do
                if v1015 == 0 then
                    v666 = {}
                    for v1569, v1570 in pairs(v11:WaitForChild("SkinsFolder"):GetChildren()) do
                        table.insert(v666, v1570.Name)
                    end
                    v1015 = 1
                end
                if v1015 == 1 then
                    v665 = 1
                    break
                end
            end
        end
    end
end
local v120 = v117:CreateDropdown({
    Name = "Select Weapon",
    Options = v119(),
    CurrentOption = {},
    Callback = function(v667)
        v118 = v667[1]
    end,
})
v11.SkinsFolder.ChildAdded:Connect(function()
    v120:Set(v119())
end)
v11.SkinsFolder.ChildRemoved:Connect(function()
    v120:Set(v119())
end)
local v121 = 1
local v122 = 1
v117:CreateInput({
    Name = "Amount to Add",
    PlaceholderText = "Ex: 5",
    Callback = function(v669)
        local v671 = tonumber(v669)
        if v671 then
            v121 = v671
        end
    end,
})
v117:CreateInput({
    Name = "Amount to Remove",
    PlaceholderText = "Ex: 3",
    Callback = function(v672)
        local v674 = tonumber(v672)
        if v674 then
            v122 = v674
        end
    end,
})
v117:CreateButton({
    Name = "Add Fake Items",
    Callback = function()
        local v675 = 0
        local v677
        local v679
        local v676
        while true do
            if v675 == 1 then
                if not v118 then
                    return v33:Notify({
                        Title = "Error",
                        Content = "Select an item first",
                        Duration = 3,
                        Image = 15403175166,
                    })
                end
                v677 = v676.Slots.TradingPlayerName.Text
                v675 = 2
            end
            if v675 == 4 then
                v33:Notify({
                    Title = "Trade",
                    Content = "Added x" .. v121 .. " " .. v118,
                    Duration = 3,
                    Image = 15403175166.000002,
                })
                break
            end
            if v675 == 2 then
                local v678_39 = v677:match("%(@(.+)%)")
                v679 = v8:FindFirstChild(v678_39)
                v675 = 3
            end
            if v675 == 3 then
                if not v679 then
                    return v33:Notify({
                        Title = "Error",
                        Content = "Could not find target player",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                for v1117 = 1, v121 do
                    v32:InvokeServer("ADD_TO_TRADE", v679, v118, {OurItems = {v118}, TheirItems = {}})
                    task.wait(0.5)
                end
                v675 = 4
            end
            if v675 == 0 then
                v676 = v11.PlayerGui:FindFirstChild("Main") and v11.PlayerGui.Main:FindFirstChild("MainTradingFrame")
                if not (v676 and v676.Visible) then
                    return v33:Notify({
                        Title = "Error",
                        Content = "You are not in a trade",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                v675 = 1
            end
        end
    end,
})
v117:CreateButton({
    Name = "Remove Fake Items",
    Callback = function()
        local v680 = 0
        local v682
        local v684
        local v681
        while true do
            if v680 == 3 then
                if not v684 then
                    return v33:Notify({
                        Title = "Error",
                        Content = "Could not find target player",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                for v1119 = 1, v122 do
                    v32:InvokeServer("REMOVE_FROM_TRADE", v684, v118, {OurItems = {v118}, TheirItems = {}})
                    task.wait(0.5)
                end
                v680 = 4
            end
            if v680 == 2 then
                local v683_40 = v682:match("%(@(.+)%)")
                v684 = v8:FindFirstChild(v683_40)
                v680 = 3
            end
            if v680 == 0 then
                v681 = v11.PlayerGui:FindFirstChild("Main") and v11.PlayerGui.Main:FindFirstChild("MainTradingFrame")
                if not (v681 and v681.Visible) then
                    return v33:Notify({
                        Title = "Error",
                        Content = "You are not in a trade",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                v680 = 1
            end
            if v680 == 4 then
                v33:Notify({
                    Title = "Trade",
                    Content = "Removed x" .. v122 .. " " .. v118,
                    Duration = 3,
                    Image = 15403175166.000002,
                })
                break
            end
            if v680 == 1 then
                if not v118 then
                    return v33:Notify({
                        Title = "Error",
                        Content = "Select an item first",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                v682 = v681.Slots.TradingPlayerName.Text
                v680 = 2
            end
        end
    end,
})
v117:CreateLabel("Spam Trade Requests")
local v123 = nil
local v124 = true
local function v98()
    local v685 = 0
    local v686
    while true do
        if v685 == 1 then
            for v1343, v1344 in ipairs(v8:GetPlayers()) do
                if v1344 ~= v11 then
                    table.insert(v686, v1344.Name)
                end
            end
            return v686
        end
        if v685 == 0 then
            v686 = {}
            table.insert(v686, "None")
            v685 = 1
        end
    end
end
local v125 = v117:CreateDropdown({
    Name = "Select Player",
    CurrentOption = {},
    Options = v98(),
    Flag = "TraderDropdown",
    Callback = function(v687)
        if v124 then
            v124 = false
            return
        end
        local v688 = v687[1]
        if v688 == "None" then
            v123 = nil
        else
            v123 = v8:FindFirstChild(v688)
        end
        v33:Notify({
            Image = 15403175166.000002,
            Title = "Spam Trade",
            Content = "Selected: " .. (v123 and v123.Name or "None"),
            Duration = 3,
        })
    end,
})
v8.PlayerAdded:Connect(v103)
v8.PlayerRemoving:Connect(v103)
v117:CreateButton({
    Name = "Spam 50 Trades",
    Callback = function()
        if not v123 then
            v33:Notify({
                Image = 15403175166.000002,
                Title = "Error",
                Content = "Select a player first!",
                Duration = 3,
            })
            return
        end
        task.spawn(function()
            for v1400 = 1, 50 do
                game:GetService("ReplicatedStorage").Trade:FireServer("SENT", v123)
                task.wait(0.2)
            end
            v33:Notify({
                Image = 15403175166,
                Title = " Trade",
                Content = "Finished sending 50 trades to " .. v123.Name,
                Duration = 3,
            })
        end)
    end,
})
v117:CreateLabel("Trade Utils")
v117:CreateToggle({
    Name = "Break Limit to 200 Items",
    CurrentValue = false,
    Callback = function(v690)
        local v691 = 0
        local v693
        local v695
        local v697
        local v698
        local v696
        local v694
        while true do
            if v691 == 0 then
                _G.TradeSlotSpam = v690
                v693 = game:GetService("Players").LocalPlayer.PlayerGui.Main.MainTradingFrame.Slots.YourOfferFrame
                v694 = v693:FindFirstChild("EmptySlot1")
                v691 = 1
            end
            if v691 == 3 then
                if v690 then
                    local v1225 = 0
                    while true do
                        if v1225 == 1 then
                            for v1456 = 5, v696 do
                                local v1457 = 0
                                local v1458
                                while true do
                                    if v1457 == 2 then
                                        v1458.Visible = false
                                        _G.TradeClonados[#_G.TradeClonados + 1] = v1458
                                        break
                                    end
                                    if v1457 == 0 then
                                        v1458 = v694:Clone()
                                        v1458.Name = v695
                                        v1457 = 1
                                    end
                                    if v1457 == 1 then
                                        v1458.Parent = v693
                                        if v1458:FindFirstChild("Index") then
                                            v1458.Index.Value = 4
                                        end
                                        v1457 = 2
                                    end
                                end
                            end
                            if not _G.TradeHeartbeatConnection then
                                _G.TradeHeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
                                    local v1604 = 0
                                    while true do
                                        if v1604 == 1 then
                                            for v1684, v1685 in ipairs(_G.TradeClonados) do
                                                if v1685 and v1685.Parent == v693 then
                                                    v1685.Visible = false
                                                end
                                            end
                                            break
                                        end
                                        if v1604 == 0 then
                                            local v1605_42 = 0
                                            for v1686, v1687 in ipairs(v693:GetChildren()) do
                                                if v698(v1687) then
                                                    v1687.Visible = false
                                                elseif v697(v1687) then
                                                    v1605_42 = v1605_42 + 1
                                                    if v1605_42 <= 4 then
                                                        v1687.Visible = true
                                                    else
                                                        v1687.Visible = false
                                                    end
                                                end
                                            end
                                            v1604 = 1
                                        end
                                    end
                                end)
                            end
                            break
                        end
                        if v1225 == 0 then
                            for v1459, v1460 in ipairs(_G.TradeClonados) do
                                if v1460 and v1460.Parent then
                                    v1460:Destroy()
                                end
                            end
                            _G.TradeClonados = {}
                            v1225 = 1
                        end
                    end
                else
                    local v1226 = 0
                    while true do
                        if v1226 == 1 then
                            _G.TradeClonados = {}
                            break
                        end
                        if v1226 == 0 then
                            if _G.TradeHeartbeatConnection then
                                _G.TradeHeartbeatConnection:Disconnect()
                                _G.TradeHeartbeatConnection = nil
                            end
                            for v1461, v1462 in ipairs(_G.TradeClonados) do
                                if v1462 and v1462.Parent then
                                    v1462:Destroy()
                                end
                            end
                            v1226 = 1
                        end
                    end
                end
                v33:Notify({
                    Title = "Trade Limit",
                    Content = v690 and "200 Items Limit Activated!" or "200 Items Limit Deactivated!",
                    Duration = 3,
                    Image = 15403175166.000002,
                })
                break
            end
            if v691 == 2 then
                function v697(v1122)
                    return typeof(v1122) == "Instance" and v1122:IsA("Frame") and v1122.Name:sub(1, 4) == "Item"
                end
                function v698(v1123)
                    return typeof(v1123) == "Instance" and v1123:IsA("Frame") and v1123.Name:sub(1, 5) == "Empty"
                end
                v691 = 3
            end
            if v691 == 1 then
                v695 = "EmptySlot4"
                v696 = 200
                if not _G.TradeClonados then
                    _G.TradeClonados = {}
                end
                if not _G.TradeHeartbeatConnection then
                    _G.TradeHeartbeatConnection = nil
                end
                v691 = 2
            end
        end
    end,
})
local v126 = nil
local v127 = nil
local function v128()
    return v20 and v20.Visible
end
local function v129()
    local v699 = 0
    local v701, v701_43
    local v700
    while true do
        if 2 == v699 then
            return nil
        end
        if v699 == 0 then
            if not v128() then
                return nil
            end
            v700 = v20.Slots.TradingPlayerName.Text
            v699 = 1
        end
        if v699 == 1 then
            local v1022 = 0
            while true do
                if v1022 == 1 then
                    v699 = 2
                    break
                end
                if v1022 == 0 then
                    v701_43 = v700:match("@(.+)%)")
                    if v701_43 then
                        return v8:FindFirstChild(v701_43)
                    end
                    v1022 = 1
                end
            end
        end
    end
end
local function v130()
    if not v127 then
        v127 = {}
        for v1630, v1631 in pairs(v17) do
            if v1631.ItemType == "Effect" then
                v127[v1630] = true
            end
        end
    end
    return v127
end
local v131 = {OurItems = {}, TheirItems = {}}
v117:CreateLabel("Give 1 of each item")
local v133 = 1
local v134 = 1
v117:CreateInput({
    Name = "Minimum items of each one",
    PlaceholderText = "Ex: 50",
    Callback = function(v705)
        local v707 = tonumber(v705)
        if v707 then
            v133 = v707
        end
    end,
})
v117:CreateInput({
    Name = "Amount to give",
    PlaceholderText = "Ex: 100",
    Callback = function(v708)
        local v710 = tonumber(v708)
        if v710 then
            v134 = v710
        end
    end,
})
v117:CreateButton({
    Name = "Give",
    Callback = function()
        local v711 = 0
        local v712
        local v714
        while true do
            if v711 == 3 then
                v33:Notify({
                    Title = "Trade",
                    Content = "Added " .. #v714 .. " items (" .. v134 * #v714 .. " total). Confirmating trade, this may take some seconds...",
                    Duration = 3,
                    Image = 15403175166,
                })
                v18:InvokeServer("CONFIRM", v712)
                break
            end
            if 0 == v711 then
                if not v128() then
                    return v33:Notify({
                        Title = "Error",
                        Content = "Trade UI is closed",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                v712 = v129()
                if not v712 then
                    return v33:Notify({
                        Title = "Error",
                        Content = "Partner not found",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                v126 = v712:FindFirstChild("SkinsFolder")
                v711 = 1
            end
            if 2 == v711 then
                local v715_45 = {}
                for v1124, v1125 in ipairs(v714) do
                    for v1227 = 1, v134 do
                        v715_45[#v715_45 + 1] = coroutine.create(function()
                            v18:InvokeServer("ADD_TO_TRADE", v712, v1125, v131)
                        end)
                    end
                end
                for v1126, v1127 in ipairs(v715_45) do
                    coroutine.resume(v1127)
                end
                task.wait(0.5)
                v711 = 3
            end
            if v711 == 1 then
                local v713_44 = v130()
                v714 = {}
                for v1128, v1129 in pairs(v21:GetChildren()) do
                    local v1131 = v1129.Name
                    if v1131 ~= "DefaultGun" and v1131 ~= "DefaultKnife" and v1131 ~= "Revolver_Default" and not v713_44[v1131] then
                        local v1464 = v1129:FindFirstChild("Count")
                        if v1464 then
                            local v1670 = v1464.Value
                            if v1670 >= v133 then
                                table.insert(v714, v1131)
                            end
                        end
                    end
                end
                if #v714 == 0 then
                    return v33:Notify({
                        Title = "Error",
                        Content = "No valid items found",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end
                v711 = 2
            end
        end
    end,
})
local v135 = v34:CreateTab("ESP", 15403375395)
v135:CreateLabel("ESP Enemy Team")
local v136 = false
local v137 = {}
local function v37(v719)
    return (string.gsub(v719, "_trupismendil", ""))
end
local function v139(v720)
    local v721 = v137[v720]
    if v721 then
        pcall(function()
            v721:Destroy()
        end)
        v137[v720] = nil
    end
end
local function v140(v722, v723)
    local v724 = v722.Character
    if not v724 then
        return
    end
    if not v724:FindFirstChild("HumanoidRootPart") then
        return
    end
    local v725 = v137[v722]
    if not v725 or v725.Parent == nil or v725.Adornee ~= v724 then
        local v909 = 0
        while true do
            if v909 == 3 then
                v137[v722] = v725
                break
            end
            if v909 == 0 then
                if v725 then
                    pcall(function()
                        v725:Destroy()
                    end)
                end
                v725 = Instance.new("Highlight")
                v909 = 1
            end
            if v909 == 1 then
                v725.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                v725.FillTransparency = 0.5
                v909 = 2
            end
            if 2 == v909 then
                v725.OutlineColor = Color3.fromRGB(255, 255, 255)
                v725.Parent = v724
                v909 = 3
            end
        end
    end
    v725.Adornee = v724
    v725.FillColor = v723
end
local function v35()
    local v728 = 0
    local v730
    local v731
    while true do
        if v728 == 1 then
            return v730, v731
        end
        if v728 == 0 then
            local v729_46
            v729_46, v730, v731 = pcall(function()
                local v1132 = 0
                local v1134
                local v1136
                local v1135
                local v1133
                while true do
                    if v1132 == 4 then
                        return v1136:FindFirstChild("TeamRedFrame"), v1136:FindFirstChild("TeamBlueFrame")
                    end
                    if v1132 == 0 then
                        v1133 = v11:FindFirstChildOfClass("PlayerGui")
                        if not v1133 then
                            return nil, nil
                        end
                        v1132 = 1
                    end
                    if v1132 == 1 then
                        local v1346 = 0
                        while true do
                            if v1346 == 0 then
                                v1134 = v1133:FindFirstChild("Main")
                                if not v1134 then
                                    return nil, nil
                                end
                                v1346 = 1
                            end
                            if v1346 == 1 then
                                v1132 = 2
                                break
                            end
                        end
                    end
                    if v1132 == 3 then
                        local v1347 = 0
                        while true do
                            if v1347 == 0 then
                                v1136 = v1135:FindFirstChild("PlayersFrame")
                                if not v1136 then
                                    return nil, nil
                                end
                                v1347 = 1
                            end
                            if v1347 == 1 then
                                v1132 = 4
                                break
                            end
                        end
                    end
                    if v1132 == 2 then
                        local v1348 = 0
                        while true do
                            if v1348 == 1 then
                                v1132 = 3
                                break
                            end
                            if v1348 == 0 then
                                v1135 = v1134:FindFirstChild("MainGameFrame")
                                if not v1135 then
                                    return nil, nil
                                end
                                v1348 = 1
                            end
                        end
                    end
                end
            end)
            if not v729_46 or not v730 or not v731 then
                return nil, nil
            end
            v728 = 1
        end
    end
end
local function v36(v732)
    local v733 = 0
    local v734
    while true do
        if 1 == v733 then
            return v734
        end
        if v733 == 0 then
            v734 = {}
            for v1137, v1138 in ipairs(v732:GetChildren()) do
                if v1138:IsA("Frame") then
                    table.insert(v734, v1138.Name)
                end
            end
            v733 = 1
        end
    end
end
local function v38()
    local v735 = 0
    local v737
    local v739
    local v741
    local v743
    local v745, v745_49
    local v738
    local v742
    local v746
    local v744
    local v740
    while true do
        local v857 = 0
        while true do
            if v857 == 2 then
                if v735 == 1 then
                    v739 = v36(v737)
                    v740, v741 = false, false
                    v742, v743 = {}, {}
                    v735 = 2
                end
                break
            end
            if v857 == 1 then
                if v735 == 2 then
                    for v1349, v1350 in ipairs(v738) do
                        local v1351 = 0
                        local v1352
                        while true do
                            if v1351 == 1 then
                                if v1352 == v11.Name then
                                    v740 = true
                                end
                                break
                            end
                            if v1351 == 0 then
                                v1352 = v37(v1350)
                                v742[v1352] = true
                                v1351 = 1
                            end
                        end
                    end
                    for v1353, v1354 in ipairs(v739) do
                        local v1355 = 0
                        local v1356
                        while true do
                            if v1355 == 1 then
                                if v1356 == v11.Name then
                                    v741 = true
                                end
                                break
                            end
                            if v1355 == 0 then
                                v1356 = v37(v1354)
                                v743[v1356] = true
                                v1355 = 1
                            end
                        end
                    end
                    if not v740 and not v741 then
                        return nil, nil
                    end
                    v735 = 3
                end
                if 0 == v735 then
                    local v736_47
                    v736_47, v737 = v35()
                    if not v736_47 or not v737 then
                        return nil, nil
                    end
                    v738 = v36(v736_47)
                    v735 = 1
                end
                v857 = 2
            end
            if v857 == 0 then
                if v735 == 3 then
                    local v744_48
                    v744_48, v745_49 = nil
                    if v740 then
                        v745 = v743
                        v744 = Color3.fromRGB(0, 0, 255)
                    else
                        v745 = v742
                        v744 = Color3.fromRGB(255, 0, 0)
                    end
                    v746 = {}
                    v735 = 4
                end
                if v735 == 4 then
                    for v1357, v1358 in pairs(v745) do
                        local v1360 = v8:FindFirstChild(v1357)
                        if v1360 and v1360 ~= v11 then
                            table.insert(v746, v1360)
                        end
                    end
                    return v746, v744
                end
                v857 = 1
            end
        end
    end
end
local function v141()
    local v747 = 0
    local v749
    local v748
    while true do
        if v747 == 1 then
            if not v748 or not v749 then
                for v1688, v1689 in pairs(v137) do
                    v139(v1688)
                end
                return
            end
            for v1139, v1140 in pairs(v137) do
                local v1141 = table.find(v748, v1139) ~= nil
                if not v1141 then
                    v139(v1139)
                end
            end
            v747 = 2
        end
        if v747 == 2 then
            for v1142, v1143 in ipairs(v748) do
                v140(v1143, v749)
            end
            break
        end
        if 0 == v747 then
            if not v136 then
                return
            end
            v748, v749 = v38()
            v747 = 1
        end
    end
end
v135:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Callback = function(v750)
        v136 = v750
        if not v136 then
            for v1267, v1268 in pairs(v8:GetPlayers()) do
                v139(v1268)
            end
        else
            v141()
        end
    end,
})
v13.RenderStepped:Connect(function()
    if v136 then
        pcall(v141)
    end
end)
v8.PlayerAdded:Connect(function(v752)
    v752.CharacterAdded:Connect(function()
        if v136 then
            task.defer(v141)
        end
    end)
end)
v8.PlayerRemoving:Connect(function(v753)
    v139(v753)
end)
v11.CharacterAdded:Connect(function()
    if v136 then
        task.wait(0.5)
        v141()
    end
end)
local function v142()
    local v754 = 0
    local v755
    local v756
    local v758
    local v757
    while true do
        if v754 == 4 then
            v757.Thickness = 1.5
            v757.Transparency = 0.3
            v757.Parent = v756
            v758 = Instance.new("TextLabel")
            v758.Size = UDim2.new(1, 0, 1, 0)
            v754 = 5
        end
        if v754 == 2 then
            v756.Position = UDim2.new(0.5, 0, 0, 20)
            v756.AnchorPoint = Vector2.new(0.5, 0)
            v756.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
            v756.BorderSizePixel = 0
            v756.BackgroundTransparency = 0.1
            v754 = 3
        end
        if v754 == 3 then
            v756.ZIndex = 1
            v756.Parent = v755
            Instance.new("UICorner", v756).CornerRadius = UDim.new(0, 10)
            v757 = Instance.new("UIStroke")
            v757.Color = Color3.fromRGB(100, 200, 100)
            v754 = 4
        end
        if v754 == 1 then
            v755.ResetOnSpawn = false
            v755.IgnoreGuiInset = true
            v755.Parent = v11:WaitForChild("PlayerGui")
            v756 = Instance.new("Frame")
            v756.Size = UDim2.new(0, 280, 0, 50)
            v754 = 2
        end
        if v754 == 8 then
            task.delay(4, function()
                local v1144 = 0
                local v1146
                local v1145
                while true do
                    if v1144 == 0 then
                        v1145 = v26:Create(v756, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1})
                        v1146 = v26:Create(v758, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1})
                        v1144 = 1
                    end
                    if 1 == v1144 then
                        v1145:Play()
                        v1146:Play()
                        v1144 = 2
                    end
                    if v1144 == 2 then
                        v1145.Completed:Wait()
                        v755:Destroy()
                        break
                    end
                end
            end)
            print("Anti-AFK auto enabled.")
            break
        end
        if v754 == 0 then
            local v1040 = 0
            while true do
                if 0 == v1040 then
                    if shared.__AntiAFKAlreadyRan then
                        return
                    end
                    shared.__AntiAFKAlreadyRan = true
                    v1040 = 1
                end
                if v1040 == 2 then
                    v755.Name = "AFK_Notice"
                    v754 = 1
                    break
                end
                if v1040 == 1 then
                    v11.Idled:Connect(function()
                        local v1361 = 0
                        while true do
                            if v1361 == 1 then
                                v14:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                                break
                            end
                            if 0 == v1361 then
                                v14:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                                task.wait(1)
                                v1361 = 1
                            end
                        end
                    end)
                    v755 = Instance.new("ScreenGui")
                    v1040 = 2
                end
            end
        end
        if v754 == 6 then
            v758.TextColor3 = Color3.fromRGB(255, 255, 255)
            v758.TextXAlignment = Enum.TextXAlignment.Center
            v758.TextStrokeTransparency = 0.5
            v758.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            v758.ZIndex = 2
            v754 = 7
        end
        if v754 == 7 then
            v758.Parent = v756
            v756.BackgroundTransparency = 1
            v758.TextTransparency = 1
            v26:Create(v756, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.1}):Play()
            v26:Create(v758, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
            v754 = 8
        end
        if v754 == 5 then
            local v1050 = 0
            while true do
                if v1050 == 0 then
                    v758.Position = UDim2.new(0, 0, 0, 0)
                    v758.BackgroundTransparency = 1
                    v1050 = 1
                end
                if v1050 == 1 then
                    v758.Text = "Anti-AFK Enabled"
                    v758.Font = Enum.Font.GothamBold
                    v1050 = 2
                end
                if v1050 == 2 then
                    v758.TextSize = 15
                    v754 = 6
                    break
                end
            end
        end
    end
end
local v143 = v34:CreateTab("Streak Farm", 15402939288)
v143:CreateLabel("User AFK Side")
v143:CreateButton({
    Name = "User Side Start",
    Callback = function()
        local v759 = 0
        while true do
            if v759 == 0 then
                v142()
                spawn(function()
                    while true do
                        local v1230 = 0
                        local v1232, v1232_51
                        while true do
                            if v1230 == 0 then
                                local v1415 = 0
                                while true do
                                    if 1 == v1415 then
                                        v1230 = 1
                                        break
                                    end
                                    if v1415 == 0 then
                                        local v1231_50
                                        v1231_50, v1232_51 = pcall(function()
                                            return v11.PlayerGui.Main.MainStarterPackFrame
                                        end)
                                        if v1231_50 and v1232_51 and v1232_51.Visible == true then
                                            v1232_51.Visible = false
                                            v33:Notify({
                                                Image = 15403175166.000002,
                                                Title = "Streak Farm",
                                                Content = "StarterPackFrame hidden",
                                                Duration = 3,
                                            })
                                        end
                                        v1415 = 1
                                    end
                                end
                            end
                            if v1230 == 1 then
                                task.wait(0.1)
                                break
                            end
                        end
                    end
                end)
                v759 = 1
            end
            if v759 == 2 then
                spawn(function()
                    while true do
                        local v1233 = 0
                        local v1235, v1235_52, v1235_53
                        local v1234
                        while true do
                            if v1233 == 1 then
                                local v1236_54 = nil
                                while true do
                                    if v1234 == 1 then
                                        task.wait(0.2)
                                        break
                                    end
                                    if v1234 == 0 then
                                        local v1236_55
                                        v1235_52, v1236_55 = pcall(function()
                                            return v11.PlayerGui.Main.MainGameFrame:WaitForChild("EndScreen")
                                        end)
                                        if v1235_52 and v1236_55 and v1236_55.Visible == true then
                                            v1236_55.Visible = false
                                            v33:Notify({
                                                Image = 15403175166.000002,
                                                Title = "Streak Farm",
                                                Content = "EndScreen closed",
                                                Duration = 2,
                                            })
                                        end
                                        v1234 = 1
                                    end
                                end
                                break
                            end
                            if v1233 == 0 then
                                v1234 = 0
                                v1235_53 = nil
                                v1233 = 1
                            end
                        end
                    end
                end)
                break
            end
            if v759 == 1 then
                spawn(function()
                    local v1147 = 0
                    local v1149
                    local v1148
                    while true do
                        if v1147 == 0 then
                            v1148 = Vector3.new(-302, 69, 6)
                            v1149 = 1
                            v1147 = 1
                        end
                        if 1 == v1147 then
                            while true do
                                local v1416 = 0
                                local v1418
                                while true do
                                    if v1416 == 1 then
                                        if v1418 then
                                            v1418.CFrame = CFrame.new(v1148)
                                        end
                                        task.wait(v1149)
                                        break
                                    end
                                    if v1416 == 0 then
                                        v1418 = (v11.Character or v11.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
                                        v1416 = 1
                                    end
                                end
                            end
                            break
                        end
                    end
                end)
                spawn(function()
                    while true do
                        local v1237 = 0
                        while true do
                            if v1237 == 1 then
                                task.wait(0.1)
                                break
                            end
                            if v1237 == 0 then
                                local v1420 = 0
                                while true do
                                    if v1420 == 1 then
                                        v1237 = 1
                                        break
                                    end
                                    if v1420 == 0 then
                                        local v1238_57 = {[1] = "REMOVE"}
                                        game:GetService("ReplicatedStorage").SetStatePlr:FireServer(unpack(v1238_57))
                                        v1420 = 1
                                    end
                                end
                            end
                        end
                    end
                end)
                v759 = 2
            end
        end
    end,
})
v143:CreateLabel("AFK Streak Farmer")
local v144 = nil
local function v145()
    local v760 = 0
    local v761
    while true do
        if 1 == v760 then
            return v761
        end
        if v760 == 0 then
            local v1052 = 0
            while true do
                if v1052 == 0 then
                    v761 = {}
                    for v1574, v1575 in pairs(v8:GetPlayers()) do
                        if v1575 ~= v11 then
                            table.insert(v761, v1575.Name)
                        end
                    end
                    v1052 = 1
                end
                if v1052 == 1 then
                    v760 = 1
                    break
                end
            end
        end
    end
end
local v146 = v143:CreateDropdown({
    Name = "Select Player",
    Options = v145(),
    CurrentOption = {},
    Callback = function(v762)
        v144 = v762[1]
    end,
})
v8.PlayerAdded:Connect(function()
    v146:Set(v145())
end)
v8.PlayerRemoving:Connect(function()
    v146:Set(v145())
end)
v143:CreateButton({
    Name = "AFK Streak Start",
    Callback = function()
        v142()
        if not v144 then
            v33:Notify({
                Image = 15403175166.000002,
                Title = "Error",
                Content = "Select a player first!",
                Duration = 3,
            })
            return
        end
        local v764, v765
        local function v766(v858)
            v764 = v858
            v765 = v764:WaitForChild("HumanoidRootPart")
        end
        v766(v11.Character or v11.CharacterAdded:Wait())
        v11.CharacterAdded:Connect(v766)
        local v767 = v11:WaitForChild("PlayerGui")
        local v768 = v767:WaitForChild("Main")
        local v769 = v768:WaitForChild("MainVotingFrame")
        local v770 = v768.MainGameFrame:WaitForChild("EndScreen")
        spawn(function()
            while true do
                local v912 = 0
                while true do
                    if v912 == 3 then
                        repeat
                            pcall(function()
                                v770.Visible = false
                                game:GetService("ReplicatedStorage").SetStatePlr:FireServer("REMOVE")
                            end)
                            task.wait(0.3)
                        until pcall(function()
                            return v770.Visible
                        end) and not v770.Visible
                        break
                    end
                    if v912 == 0 then
                        repeat
                            task.wait(0.1)
                        until v765
                        pcall(function()
                            v765.CFrame = CFrame.new(-310, 69, 7)
                        end)
                        v912 = 1
                    end
                    if v912 == 1 then
                        repeat
                            task.wait(0.1)
                        until pcall(function()
                            return v769.Visible
                        end) and v769.Visible
                        repeat
                            task.wait(0.1)
                        until pcall(function()
                            return v769.Visible
                        end) and not v769.Visible
                        v912 = 2
                    end
                    if 2 == v912 then
                        task.wait(2)
                        while true do
                            local v1279 = false
                            pcall(function()
                                if v770.Visible then
                                    v1279 = true
                                end
                            end)
                            if v1279 then
                                break
                            end
                            pcall(function()
                                KnifeKill:FireServer(v8:FindFirstChild(v144))
                            end)
                            task.wait(0.4)
                        end
                        v912 = 3
                    end
                end
            end
        end)
    end,
})
local v147 = v34:CreateTab("Misc", 15403059251)
v147:CreateLabel("If you reset in the match, enemies can't kill you, the game doesn't count it as a death. (But your character will be disarmed)")
v147:CreateButton({
    Name = "Enable Reset",
    Callback = function()
        local v771 = 0
        local v772
        while true do
            if v771 == 0 then
                v772 = game:GetService("StarterGui")
                pcall(function()
                    v772:SetCore("ResetButtonCallback", true)
                end)
                v771 = 1
            end
            if v771 == 1 then
                pcall(function()
                    v33:Notify({
                        Title = "Misc",
                        Content = "Reset enabled! Forcing respawn...",
                        Duration = 3,
                        Image = 15403175166.000002,
                    })
                end)
                break
            end
        end
    end,
})
v147:CreateLabel("Server Things")
v147:CreateButton({
    Name = "Change Server",
    Callback = function()
        local v773 = 0
        local v775, v775_58
        local v774
        local v776
        while true do
            if v773 == 0 then
                v33:Notify({
                    Title = "Misc",
                    Content = "Rejoining...",
                    Duration = 3,
                    Image = 15403175166.000002,
                })
                v774 = game:GetService("TeleportService")
                v773 = 1
            end
            if v773 == 1 then
                v776 = game:GetService("Players").LocalPlayer
                v773 = 2
            end
            if 2 == v773 then
                v774:Teleport(game.PlaceId, v776)
                break
            end
        end
    end,
})
v147:CreateLabel("FastDex UI Phone")
v147:CreateButton({
    Name = "Hide Open Button",
    Callback = function()
        local v777 = 0
        local v778
        local v780
        local v781
        local v779
        while true do
            if v777 == 3 then
                v780.ChildAdded:Connect(function(v1150)
                    if v1150.Name == "Prompt" then
                        v781(v1150)
                    end
                end)
                print("FastDex prompts hidden (CoreGui auto-detect).")
                break
            end
            if 2 == v777 then
                function v781(v1151)
                    if not v1151 or not v1151:FindFirstChild("Title") then
                        return
                    end
                    v1151.Title.Visible = false
                    v1151.BackgroundTransparency = 1
                    v1151.Title:GetPropertyChangedSignal("Visible"):Connect(function()
                        if v1151.Title.Visible then
                            v1151.Title.Visible = false
                        end
                    end)
                    v1151:GetPropertyChangedSignal("BackgroundTransparency"):Connect(function()
                        if v1151.BackgroundTransparency ~= 1 then
                            v1151.BackgroundTransparency = 1
                        end
                    end)
                end
                local v782_59 = v780:FindFirstChild("Prompt")
                if v782_59 then
                    v781(v782_59)
                end
                v777 = 3
            end
            if v777 == 1 then
                v780 = v779()
                if not v780 then
                    warn("Rayfield UI not found.")
                    return
                end
                v781 = nil
                v777 = 2
            end
            if v777 == 0 then
                v778 = game:GetService("CoreGui")
                function v779()
                    for v1607, v1608 in ipairs(v778:GetChildren()) do
                        if v1608:FindFirstChild("Rayfield") then
                            return v1608.Rayfield
                        end
                    end
                    return nil
                end
                v777 = 1
            end
        end
    end,
})
