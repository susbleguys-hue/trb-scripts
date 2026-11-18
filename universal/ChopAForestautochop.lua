-- Auto-Chopper UI (v3: top-most + auto-teleport + skip felled)
-- LocalScript in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local RS      = game:GetService("ReplicatedStorage")
local UIS     = game:GetService("UserInputService")
local Tween   = game:GetService("TweenService")

local player = Players.LocalPlayer

local Event = RS:WaitForChild("Shared"):WaitForChild("Services")
    :WaitForChild("ChopRemotes"):WaitForChild("Chop")
local Trees = workspace:WaitForChild("Map"):WaitForChild("Trees")

local state = {
    enabled        = false,
    autoTeleport   = false,
    reach          = 30,
    delay          = 0.5,
    teleportOffset = 4,
    hits           = 0,
}

-- ====== GUI ======
local gui = Instance.new("ScreenGui")
gui.Name           = "AutoChopper"
gui.ResetOnSpawn   = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder   = 2147483647   -- always on top
gui.Parent         = player:WaitForChild("PlayerGui")

local function make(class, props, parent)
    local inst = Instance.new(class)
    for k, v in pairs(props) do inst[k] = v end
    if parent then inst.Parent = parent end
    return inst
end

local frame = make("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(260, 330),
    Position = UDim2.new(0, 20, 0, 20),
    BackgroundColor3 = Color3.fromRGB(24, 24, 28),
    BorderSizePixel = 0,
    Active = true,
}, gui)
make("UICorner", { CornerRadius = UDim.new(0, 8) }, frame)
make("UIStroke", { Color = Color3.fromRGB(60, 60, 70), Thickness = 1 }, frame)

local titleBar = make("Frame", {
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Color3.fromRGB(34, 34, 40),
    BorderSizePixel = 0,
}, frame)
make("UICorner", { CornerRadius = UDim.new(0, 8) }, titleBar)

make("TextLabel", {
    Size = UDim2.new(1, -10, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    Text = "Auto Chopper",
    TextColor3 = Color3.fromRGB(230, 230, 240),
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left,
}, titleBar)

local toggleBtn = make("TextButton", {
    Size = UDim2.new(1, -20, 0, 36),
    Position = UDim2.new(0, 10, 0, 40),
    BackgroundColor3 = Color3.fromRGB(60, 60, 70),
    BorderSizePixel = 0,
    Text = "OFF",
    TextColor3 = Color3.fromRGB(230, 230, 240),
    Font = Enum.Font.GothamBold,
    TextSize = 14,
}, frame)
make("UICorner", { CornerRadius = UDim.new(0, 6) }, toggleBtn)

local tpBtn = make("TextButton", {
    Size = UDim2.new(1, -20, 0, 32),
    Position = UDim2.new(0, 10, 0, 82),
    BackgroundColor3 = Color3.fromRGB(50, 50, 60),
    BorderSizePixel = 0,
    Text = "Auto-Teleport: OFF",
    TextColor3 = Color3.fromRGB(200, 200, 210),
    Font = Enum.Font.Gotham,
    TextSize = 13,
}, frame)
make("UICorner", { CornerRadius = UDim.new(0, 6) }, tpBtn)

local reachLabel = make("TextLabel", {
    Size = UDim2.new(1, -20, 0, 20),
    Position = UDim2.new(0, 10, 0, 122),
    BackgroundTransparency = 1,
    Text = "Reach: 30",
    TextColor3 = Color3.fromRGB(200, 200, 210),
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
}, frame)

local reachSlider = make("Frame", {
    Size = UDim2.new(1, -20, 0, 8),
    Position = UDim2.new(0, 10, 0, 146),
    BackgroundColor3 = Color3.fromRGB(50, 50, 60),
    BorderSizePixel = 0,
}, frame)
make("UICorner", { CornerRadius = UDim.new(1, 0) }, reachSlider)

local reachFill = make("Frame", {
    Size = UDim2.new(29 / 200, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(90, 160, 255),
    BorderSizePixel = 0,
}, reachSlider)
make("UICorner", { CornerRadius = UDim.new(1, 0) }, reachFill)

local reachKnob = make("Frame", {
    Size = UDim2.fromOffset(16, 16),
    Position = UDim2.new(29 / 200, -8, 0.5, -8),
    BackgroundColor3 = Color3.fromRGB(240, 240, 250),
    BorderSizePixel = 0,
    ZIndex = 2,
}, reachSlider)
make("UICorner", { CornerRadius = UDim.new(1, 0) }, reachKnob)

local delayLabel = make("TextLabel", {
    Size = UDim2.new(1, -20, 0, 20),
    Position = UDim2.new(0, 10, 0, 166),
    BackgroundTransparency = 1,
    Text = "Delay: 0.50s",
    TextColor3 = Color3.fromRGB(200, 200, 210),
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
}, frame)

local delaySlider = make("Frame", {
    Size = UDim2.new(1, -20, 0, 8),
    Position = UDim2.new(0, 10, 0, 190),
    BackgroundColor3 = Color3.fromRGB(50, 50, 60),
    BorderSizePixel = 0,
}, frame)
make("UICorner", { CornerRadius = UDim.new(1, 0) }, delaySlider)

local delayFill = make("Frame", {
    Size = UDim2.new((0.5 - 0.1) / (2.0 - 0.1), 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(90, 200, 130),
    BorderSizePixel = 0,
}, delaySlider)
make("UICorner", { CornerRadius = UDim.new(1, 0) }, delayFill)

local delayKnob = make("Frame", {
    Size = UDim2.fromOffset(16, 16),
    Position = UDim2.new((0.5 - 0.1) / (2.0 - 0.1), -8, 0.5, -8),
    BackgroundColor3 = Color3.fromRGB(240, 240, 250),
    BorderSizePixel = 0,
    ZIndex = 2,
}, delaySlider)
make("UICorner", { CornerRadius = UDim.new(1, 0) }, delayKnob)

local status = make("TextLabel", {
    Size = UDim2.new(1, -20, 0, 60),
    Position = UDim2.new(0, 10, 0, 210),
    BackgroundTransparency = 1,
    Text = "Idle  |  Hits: 0",
    TextColor3 = Color3.fromRGB(150, 150, 160),
    Font = Enum.Font.Gotham,
    TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    TextWrapped = true,
}, frame)

-- ====== Slider helper ======
local function bindSlider(container, fill, knob, minV, maxV, onChange)
    local dragging = false
    local function updateFromX(x)
        local t = math.clamp((x - container.AbsolutePosition.X) / container.AbsoluteSize.X, 0, 1)
        local v = minV + (maxV - minV) * t
        fill.Size = UDim2.new(t, 0, 1, 0)
        knob.Position = UDim2.new(t, -8, 0.5, -8)
        onChange(v)
    end
    container.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateFromX(input.Position.X)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromX(input.Position.X)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

bindSlider(reachSlider, reachFill, reachKnob, 1, 200, function(v)
    state.reach = math.floor(v + 0.5)
    reachLabel.Text = "Reach: " .. state.reach
end)

bindSlider(delaySlider, delayFill, delayKnob, 0.1, 2.0, function(v)
    state.delay = math.floor(v * 100 + 0.5) / 100
    delayLabel.Text = string.format("Delay: %.2fs", state.delay)
end)

-- ====== Window drag ======
do
    local dragging, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- ====== Toggles ======
local function setEnabled(on)
    state.enabled = on
    toggleBtn.Text = on and "ON" or "OFF"
    Tween:Create(toggleBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = on and Color3.fromRGB(70, 160, 100)
                                  or Color3.fromRGB(60, 60, 70)
    }):Play()
end

local function setAutoTeleport(on)
    state.autoTeleport = on
    tpBtn.Text = "Auto-Teleport: " .. (on and "ON" or "OFF")
    Tween:Create(tpBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = on and Color3.fromRGB(70, 130, 200)
                                  or Color3.fromRGB(50, 50, 60)
    }):Play()
end

toggleBtn.MouseButton1Click:Connect(function()
    setEnabled(not state.enabled)
end)

tpBtn.MouseButton1Click:Connect(function()
    setAutoTeleport(not state.autoTeleport)
end)

UIS.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        setEnabled(not state.enabled)
    end
end)

-- ====== Felled check ======
-- Handles both Attribute and BoolValue-child forms, plus numeric ValueBase.
local function isFelled(tree)
    local attr = tree:GetAttribute("Felled")
    if attr ~= nil then return attr == true end

    local v = tree:FindFirstChild("Felled")
    if v then
        if v:IsA("BoolValue") then return v.Value end
        local ok, val = pcall(function() return v.Value end)
        if ok then
            return val == true or (type(val) == "number" and val > 0)
        end
    end
    return false
end

-- ====== Chopping ======
local lastChopped, lastChoppedAt = nil, 0
local CHOP_COOLDOWN = 3   -- seconds to skip a just-chopped tree

local function findNearestTree()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local origin = hrp.Position
    local best, bestDist
    for _, tree in ipairs(Trees:GetChildren()) do
        if tree:IsA("Model") and tree.Parent == Trees then
            local recently = (tree == lastChopped) and (tick() - lastChoppedAt < CHOP_COOLDOWN)
            if not recently and not isFelled(tree) then
                local ok, p = pcall(function() return tree:GetPivot().Position end)
                if ok then
                    local d = (p - origin).Magnitude
                    if d <= state.reach and (not bestDist or d < bestDist) then
                        best, bestDist = tree, d
                    end
                end
            end
        end
    end
    return best, bestDist
end

local function teleportNear(tree)
    local char = player.Character
    if not char then return end
    local p = tree:GetPivot().Position
    local off = state.teleportOffset
    local target = p + Vector3.new(off, 3, off)
    char:PivotTo(CFrame.lookAt(target, p))
end

task.spawn(function()
    while true do
        if state.enabled then
            local tree, dist = findNearestTree()
            if tree then
                local p = tree:GetPivot().Position

                if state.autoTeleport and (dist or 0) > 10 then
                    teleportNear(tree)
                    task.wait(0.12)
                    p = tree:GetPivot().Position
                end

                local hit = Vector3.new(p.X, p.Y + 4, p.Z)
                Event:FireServer(tree, hit, 1, 14)
                state.hits += 1
                lastChopped = tree
                lastChoppedAt = tick()

                local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                local nowDist = hrp and (hrp.Position - p).Magnitude or 0
                status.Text = string.format(
                    "Chopping %s\nDist: %.1f  |  Hits: %d",
                    tree.Name, nowDist, state.hits
                )
            else
                status.Text = string.format(
                    "No tree in %d studs (all felled?)\nHits: %d",
                    state.reach, state.hits
                )
            end
            task.wait(state.delay)
        else
            status.Text = string.format("Idle  |  Hits: %d", state.hits)
            task.wait(0.1)
        end
    end
end)
