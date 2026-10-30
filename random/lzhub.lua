-- Unpacked by ZeroVector: the script inside the packed file, as it was written
--[[
    LZ HUB — Cross-Platform (PC & Mobile) Multi-Feature Edition
    - Official Community Interface & Fully Integrated Tools
    - Full Mobile Touch Controls & Keyboard Support
]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Stats = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")
local CoreGuiService = game:GetService("CoreGui")

local LP = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

---------------------------------------------------------
-- Configuration & Settings Management
---------------------------------------------------------
local CONFIG = {
    ToggleKey = Enum.KeyCode.K,
    DiscordLink = "https://discord.gg/zx26bwaxe",
    LogoID = "rbxassetid://4590657391"
}

local SaveFileName = "LZ_Hub_Settings.json"
local Settings = {
    DhabAll = false,
    DhabRareOnly = false,
    SmartAlerts = true,
    Players = false,
    Vehicles = false,
    ShopEzba = false,
    Edge = false,
    TeleportShop = false,
    EspDistance = 500,
    Aimbot = false,
    AimbotDistance = 50,
    RequireWeapon = true,
    UseFOVCircle = true,
    FOVRadius = 120,
    HoldRightClick = false,
    RareHudActive = false,
    HudPosX = 0.75,
    HudPosY = 0.15,
    AntiAfkActive = true,      
    AutoRejoinActive = true,
    VehicleFlyActive = false,
    VehicleFlySpeed = 70
}

if writefile and readfile and isfile and isfile(SaveFileName) then
    local success, decoded = pcall(function()
        return HttpService:JSONDecode(readfile(SaveFileName))
    end)
    if success and type(decoded) == "table" then
        for k, v in pairs(decoded) do
            if Settings[k] ~= nil and k ~= "TeleportShop" and k ~= "VehicleFlyActive" then 
                Settings[k] = v 
            end
        end
    end
end

local function SaveSettings()
    if writefile then
        pcall(function()
            writefile(SaveFileName, HttpService:JSONEncode(Settings))
        end)
    end
end

---------------------------------------------------------
-- UI Setup & Initialization
---------------------------------------------------------
local function getParent()
    if type(gethui) == "function" then
        local ok, h = pcall(gethui)
        if ok and h then return h end
    end
    local ok, cg = pcall(function() return game:GetService("CoreGui") end)
    if ok and cg then return cg end
    return LP:WaitForChild("PlayerGui")
end

local uiParent = getParent()

for _, c in ipairs(uiParent:GetChildren()) do
    if c.Name == "LZ_Hub_UI" then c:Destroy() end
end

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "LZ_Hub_UI"
mainGui.ResetOnSpawn = false
mainGui.Parent = uiParent

---------------------------------------------------------
-- Themes & Color Constants
---------------------------------------------------------
local DarkTheme = {
    Background = Color3.fromRGB(15, 12, 28),
    Panel = Color3.fromRGB(24, 18, 43),
    ButtonOff = Color3.fromRGB(35, 28, 58),
    ButtonOn = Color3.fromRGB(124, 58, 237),
    Accent = Color3.fromRGB(124, 58, 237),
    Glow = Color3.fromRGB(168, 85, 247)
}

local Colors = {
    White = Color3.fromRGB(255, 255, 255),
    Muted = Color3.fromRGB(168, 85, 247),
    PlayerColor = Color3.fromRGB(255, 60, 60),
    VehicleColor = Color3.fromRGB(255, 150, 0)
}

local RarityNames = {
    T1 = "Common", T2 = "Uncommon", T3 = "Rare", T4 = "Epic", T5 = "Legendary", T6 = "Mythic",
    Common = "Common", Uncommon = "Uncommon", Rare = "Rare", Epic = "Epic", Legendary = "Legendary", Mythic = "Mythic"
}

local StateNames = {
    idle = "Idle 🧍",
    walk = "Walking 🚶",
    flee = "Fleeing 🏃",
    alert = "Alert ⚠️",
    display = "Displaying ✨"
}

local RarityColors = {
    T1 = Color3.fromRGB(150, 160, 175),
    T2 = Color3.fromRGB(70, 160, 95),
    T3 = Color3.fromRGB(65, 130, 195),
    T4 = Color3.fromRGB(130, 90, 175),
    T5 = Color3.fromRGB(255, 180, 50),
    T6 = Color3.fromRGB(255, 50, 70)
}

---------------------------------------------------------
-- Global Elements (FOV Circle, Sounds, Alerts & HUD)
---------------------------------------------------------
local CachedDhabs = {}
local NotifiedRareDhabs = {}
local LastKnownStates = {}

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1.5
FOVCircle.Color = DarkTheme.Glow
FOVCircle.Filled = false
FOVCircle.Transparency = 0.7
FOVCircle.Visible = false

local NotifySound = Instance.new("Sound", mainGui)
NotifySound.SoundId = "rbxassetid://4590657391"
NotifySound.Volume = 0.4
NotifySound.RollOffMaxDistance = 0

local AlertBox = Instance.new("TextLabel", mainGui)
AlertBox.Size = UDim2.new(0, 360, 0, 45)
AlertBox.Position = UDim2.new(0.5, -180, 0.05, 0)
AlertBox.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
AlertBox.TextColor3 = Colors.White
AlertBox.TextSize = 12
AlertBox.Font = Enum.Font.GothamBold
AlertBox.Text = "🚨 Alert: A Legendary/Mythic Dhab has been spotted nearby!"
AlertBox.Visible = false
Instance.new("UICorner", AlertBox).CornerRadius = UDim.new(0, 10)

local RareHud = Instance.new("Frame", mainGui)
RareHud.Name = "RareHud"
RareHud.Size = UDim2.new(0, 240, 0, 95)
RareHud.Position = UDim2.new(Settings.HudPosX, 0, Settings.HudPosY, 0)
RareHud.BackgroundColor3 = DarkTheme.Panel
RareHud.BorderSizePixel = 0
RareHud.Visible = Settings.RareHudActive
RareHud.Active = true
Instance.new("UICorner", RareHud).CornerRadius = UDim.new(0, 10)

local RareHudStroke = Instance.new("UIStroke", RareHud)
RareHudStroke.Color = DarkTheme.Accent
RareHudStroke.Thickness = 1.5

local RareHudTitle = Instance.new("TextLabel", RareHud)
RareHudTitle.Size = UDim2.new(1, 0, 0, 26)
RareHudTitle.BackgroundTransparency = 1
RareHudTitle.Text = "👑 Rare Dhab Radar (T5 & T6)"
RareHudTitle.TextColor3 = DarkTheme.Glow
RareHudTitle.TextSize = 10
RareHudTitle.Font = Enum.Font.GothamBold

local RareHudContent = Instance.new("TextLabel", RareHud)
RareHudContent.Size = UDim2.new(1, -16, 1, -32)
RareHudContent.Position = UDim2.new(0, 8, 0, 28)
RareHudContent.BackgroundTransparency = 1
RareHudContent.Text = "Searching for a Legendary or Mythic Dhab nearby..."
RareHudContent.TextColor3 = Colors.White
RareHudContent.TextSize = 10
RareHudContent.Font = Enum.Font.GothamMedium
RareHudContent.TextWrapped = true
RareHudContent.TextXAlignment = Enum.TextXAlignment.Left
RareHudContent.TextYAlignment = Enum.TextYAlignment.Top

local HudDragging, HudDragStart, HudStartPosition = false, nil, nil
RareHud.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        HudDragging = true
        HudDragStart = Input.Position
        HudStartPosition = RareHud.Position
        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then 
                HudDragging = false 
                Settings.HudPosX = RareHud.Position.X.Scale
                Settings.HudPosY = RareHud.Position.Y.Scale
                SaveSettings()
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if HudDragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - HudDragStart
        RareHud.Position = UDim2.new(HudStartPosition.X.Scale, HudStartPosition.X.Offset + Delta.X, HudStartPosition.Y.Scale, HudStartPosition.Y.Offset + Delta.Y)
    end
end)

---------------------------------------------------------
-- Main Frame Setup
---------------------------------------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.fromOffset(520, 380)
mainFrame.Position = UDim2.new(0.5, -260, 0.4, -190)
mainFrame.BackgroundColor3 = DarkTheme.Background
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = mainGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = DarkTheme.Accent
mainStroke.Thickness = 1.8

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = DarkTheme.Panel
header.BorderSizePixel = 0
header.Parent = mainFrame
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local logoImg = Instance.new("ImageLabel")
logoImg.Size = UDim2.fromOffset(36, 36)
logoImg.Position = UDim2.fromOffset(10, 7)
logoImg.BackgroundTransparency = 1
logoImg.Image = CONFIG.LogoID
logoImg.Parent = header

local titleLbl = Instance.new("TextLabel")
titleLbl.Position = UDim2.fromOffset(54, 8)
titleLbl.Size = UDim2.new(0, 180, 0, 18)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "LZ HUB"
titleLbl.TextColor3 = Colors.White
titleLbl.Font = Enum.Font.GothamBold
titleLbl.TextSize = 14
titleLbl.TextXAlignment = Enum.TextXAlignment.Left
titleLbl.Parent = header

local subTitleLbl = Instance.new("TextLabel")
subTitleLbl.Position = UDim2.fromOffset(54, 26)
subTitleLbl.Size = UDim2.new(0, 180, 0, 14)
subTitleLbl.BackgroundTransparency = 1
subTitleLbl.Text = "LZ HUB | Official Community"
subTitleLbl.TextColor3 = DarkTheme.Glow
subTitleLbl.Font = Enum.Font.GothamMedium
subTitleLbl.TextSize = 10
subTitleLbl.TextXAlignment = Enum.TextXAlignment.Left
subTitleLbl.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.fromOffset(26, 26)
closeBtn.Position = UDim2.new(1, -32, 0, 12)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 38, 38)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Colors.White
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 11
closeBtn.Parent = header
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

---------------------------------------------------------
-- Stats Header Display (FPS & Ping)
---------------------------------------------------------
local StatsFrame = Instance.new("Frame", header)
StatsFrame.Size = UDim2.new(0, 130, 0, 26)
StatsFrame.Position = UDim2.new(1, -170, 0.5, -13)
StatsFrame.BackgroundTransparency = 1

local FpsLabel = Instance.new("TextLabel", StatsFrame)
FpsLabel.Size = UDim2.new(0.5, 0, 1, 0)
FpsLabel.BackgroundColor3 = DarkTheme.ButtonOff
FpsLabel.Text = "FPS: 60"
FpsLabel.TextColor3 = Colors.Muted
FpsLabel.TextSize = 9
FpsLabel.Font = Enum.Font.GothamBold
Instance.new("UICorner", FpsLabel).CornerRadius = UDim.new(0, 6)

local PingLabel = Instance.new("TextLabel", StatsFrame)
PingLabel.Size = UDim2.new(0.5, -4, 1, 0)
PingLabel.Position = UDim2.new(0.5, 4, 0, 0)
PingLabel.BackgroundColor3 = DarkTheme.ButtonOff
PingLabel.Text = "Ping: 45ms"
PingLabel.TextColor3 = Colors.Muted
PingLabel.TextSize = 9
PingLabel.Font = Enum.Font.GothamBold
Instance.new("UICorner", PingLabel).CornerRadius = UDim.new(0, 6)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            FpsLabel.Text = "FPS: " .. fps
            PingLabel.Text = "Ping: " .. ping .. "ms"
        end)
    end
end)

---------------------------------------------------------
-- Floating Toggle Button (Touch & Mouse Support)
---------------------------------------------------------
local openBtn = Instance.new("ImageButton")
openBtn.Name = "LZ_OpenBtn"
openBtn.Size = UDim2.fromOffset(45, 45)
openBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
openBtn.BackgroundColor3 = DarkTheme.Panel
openBtn.Image = CONFIG.LogoID
openBtn.Visible = false
openBtn.Active = true
openBtn.Draggable = true
openBtn.Parent = mainGui
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)

local openStroke = Instance.new("UIStroke", openBtn)
openStroke.Color = DarkTheme.Accent
openStroke.Thickness = 1.5

local function toggleUI()
    mainFrame.Visible = not mainFrame.Visible
    openBtn.Visible = not mainFrame.Visible
end

closeBtn.MouseButton1Click:Connect(toggleUI)
openBtn.MouseButton1Click:Connect(toggleUI)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == CONFIG.ToggleKey then
        toggleUI()
    end
end)

---------------------------------------------------------
-- Navigation Bar & Tab System
---------------------------------------------------------
local NavBar = Instance.new("Frame", mainFrame)
NavBar.Size = UDim2.new(0, 130, 1, -60)
NavBar.Position = UDim2.new(0, 10, 0, 55)
NavBar.BackgroundColor3 = DarkTheme.Panel
NavBar.BorderSizePixel = 0
Instance.new("UICorner", NavBar).CornerRadius = UDim.new(0, 10)

local PagesFolder = Instance.new("Frame", mainFrame)
PagesFolder.Size = UDim2.new(1, -155, 1, -60)
PagesFolder.Position = UDim2.new(0, 145, 0, 55)
PagesFolder.BackgroundTransparency = 1

local Pages = {}
local function CreatePage(PageName)
    local Page = Instance.new("ScrollingFrame", PagesFolder)
    Page.Name = PageName
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.CanvasSize = UDim2.new(0, 0, 0, 520)
    Page.ScrollBarThickness = 3
    Page.Visible = false
    Pages[PageName] = Page
    return Page
end

local InfoPage = CreatePage("Info")
local EspPage = CreatePage("ESP")
local AimPage = CreatePage("Aimbot")
local TeleportPage = CreatePage("Teleport")
local UtilsPage = CreatePage("Utils")

local NavButtons = {}
local function CreateNavButton(Name, Text, Y, TargetPage)
    local Btn = Instance.new("TextButton", NavBar)
    Btn.Size = UDim2.new(1, -12, 0, 36)
    Btn.Position = UDim2.new(0, 6, 0, Y)
    Btn.BackgroundColor3 = DarkTheme.ButtonOff
    Btn.Text = Text
    Btn.TextColor3 = Colors.Muted
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 11
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

    Btn.MouseButton1Click:Connect(function()
        for pageName, pageFrame in pairs(Pages) do pageFrame.Visible = (pageName == TargetPage) end
        for btnName, buttonObj in pairs(NavButtons) do
            local isSelected = (buttonObj == Btn)
            TweenService:Create(buttonObj, TweenInfo.new(0.2), {
                BackgroundColor3 = isSelected and DarkTheme.Accent or DarkTheme.ButtonOff,
                TextColor3 = isSelected and Colors.White or Colors.Muted
            }):Play()
        end
    end)
    NavButtons[Name] = Btn
    return Btn
end

CreateNavButton("Info", "🏠 Info", 8, "Info")
CreateNavButton("ESP", "👁️ ESP List", 48, "ESP")
CreateNavButton("Aimbot", "🎯 Aimbot", 88, "Aimbot")
CreateNavButton("Teleport", "🚀 Teleport", 128, "Teleport")
CreateNavButton("Utils", "🛠️ Player Tools", 168, "Utils")

InfoPage.Visible = true
NavButtons["Info"].BackgroundColor3 = DarkTheme.Accent
NavButtons["Info"].TextColor3 = Colors.White

---------------------------------------------------------
-- Tab 1: Info Page & Discord Copy Button
---------------------------------------------------------
local InfoCard = Instance.new("ScrollingFrame", InfoPage)
InfoCard.Size = UDim2.new(1, 0, 1, 0)
InfoCard.BackgroundColor3 = DarkTheme.Panel
InfoCard.CanvasSize = UDim2.new(0, 0, 0, 410)
InfoCard.ScrollBarThickness = 3
InfoCard.BorderSizePixel = 0
Instance.new("UICorner", InfoCard).CornerRadius = UDim.new(0, 10)

local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(1, -20, 0, 42)
copyBtn.Position = UDim2.fromOffset(10, 10)
copyBtn.BackgroundColor3 = DarkTheme.Accent
copyBtn.Text = "💬  Copy Discord Community Link"
copyBtn.TextColor3 = Colors.White
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 12
copyBtn.Parent = InfoCard
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 8)

local copyStroke = Instance.new("UIStroke", copyBtn)
copyStroke.Color = DarkTheme.Glow
copyStroke.Thickness = 1

copyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(CONFIG.DiscordLink)
        copyBtn.Text = "✓ Copied Successfully!"
        task.delay(2, function()
            copyBtn.Text = "💬  Copy Discord Community Link"
        end)
    end
end)

local InfoTitle = Instance.new("TextLabel", InfoCard)
InfoTitle.Size = UDim2.new(1, -20, 0, 30)
InfoTitle.Position = UDim2.new(0, 10, 0, 60)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Text = "💎 LZ HUB Professional Interface"
InfoTitle.TextColor3 = DarkTheme.Glow
InfoTitle.TextSize = 13
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.TextXAlignment = Enum.TextXAlignment.Center

local InfoText = Instance.new("TextLabel", InfoCard)
InfoText.Size = UDim2.new(1, -20, 0, 310)
InfoText.Position = UDim2.new(0, 10, 0, 95)
InfoText.BackgroundTransparency = 1
InfoText.Text = "🌟 **Welcome to the comprehensive LZ HUB interface for all devices:**\n\n" ..
    "• **Vehicle Fly:** Vehicle flight fully compatible with mobile and PC via touch or keyboard keys.\n\n" ..
    "• **Rare Dhab Radar (HUD):** A compact, movable interface to track the nearest Legendary (T5) or Mythic (T6) Dhab.\n\n" ..
    "• **Smart Audio/Visual Alert System:** Instant detection of rare Dhabs with visual and audio alerts.\n\n" ..
    "• **Comprehensive Detection List (ESP):** Full detection with extended range up to 10000m for Dhabs, players, vehicles, and shops.\n\n" ..
    "• **Advanced Aimbot System:** Precise aim with an adjustable FOV circle.\n\n" ..
    "• **Anti-AFK & Auto-Rejoin:** Protection against being kicked with Anti-AFK and Auto-Rejoin."
InfoText.TextColor3 = Colors.White
InfoText.TextSize = 10
InfoText.Font = Enum.Font.Gotham
InfoText.TextWrapped = true
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.TextXAlignment = Enum.TextXAlignment.Left

---------------------------------------------------------
-- UI Helper Functions (Toggle Buttons & Actions)
---------------------------------------------------------
local function CreateToggleButton(ParentFrame, Key, Text, Y, AccentColor, OnToggleCallback)
    local Button = Instance.new("TextButton", ParentFrame)
    Button.Size = UDim2.new(1, -6, 0, 36)
    Button.Position = UDim2.new(0, 0, 0, Y)
    Button.BackgroundColor3 = DarkTheme.ButtonOff
    Button.Text = ""
    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

    local Accent = Instance.new("Frame", Button)
    Accent.Size = UDim2.new(0, 4, 1, -10)
    Accent.Position = UDim2.new(0, 5, 0, 5)
    Accent.BackgroundColor3 = AccentColor
    Instance.new("UICorner", Accent).CornerRadius = UDim.new(1, 0)

    local Label = Instance.new("TextLabel", Button)
    Label.Size = UDim2.new(1, -55, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = Colors.White
    Label.TextSize = 11
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local State = Instance.new("TextLabel", Button)
    State.Size = UDim2.new(0, 38, 0, 20)
    State.Position = UDim2.new(1, -44, 0.5, -10)
    State.BackgroundColor3 = Color3.fromRGB(50, 20, 28)
    State.Text = Settings[Key] and "ON" or "OFF"
    State.TextColor3 = Colors.White
    State.TextSize = 10
    State.Font = Enum.Font.GothamBold
    Instance.new("UICorner", State).CornerRadius = UDim.new(0, 6)

    local function Refresh()
        local Enabled = Settings[Key]
        State.Text = Enabled and "ON" or "OFF"
        TweenService:Create(State, TweenInfo.new(0.2), {BackgroundColor3 = Enabled and DarkTheme.ButtonOn or Color3.fromRGB(50, 20, 28)}):Play()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Enabled and DarkTheme.ButtonOn or DarkTheme.ButtonOff}):Play()
    end

    Button.MouseButton1Click:Connect(function()
        Settings[Key] = not Settings[Key]
        Refresh()
        SaveSettings()
        if OnToggleCallback then OnToggleCallback(Settings[Key], Refresh) end
    end)
    
    Refresh()
    return Button
end

local function TeleportToModel(ModelKeywords, DisplayTitle, SettingKey, RefreshCallback)
    local TargetModel = nil
    for _, Object in ipairs(Workspace:GetDescendants()) do
        if Object:IsA("Model") or Object:IsA("Part") then
            local NameLower = Object.Name:lower()
            for _, Keyword in ipairs(ModelKeywords) do
                if NameLower:find(Keyword:lower()) then
                    TargetModel = Object
                    break
                end
            end
        end
        if TargetModel then break end
    end

    if not TargetModel then
        AlertBox.Text = "⚠️ " .. DisplayTitle .. " not found in the map!"
        AlertBox.Visible = true
        task.delay(3, function() AlertBox.Visible = false end)
        Settings[SettingKey] = false
        if RefreshCallback then RefreshCallback() end
        return
    end

    local TargetPart = TargetModel:IsA("Model") and (TargetModel:FindFirstChild("HumanoidRootPart") or TargetModel.PrimaryPart or TargetModel:FindFirstChildWhichIsA("BasePart")) or TargetModel
    local MyChar = LP.Character
    local MyRoot = MyChar and MyChar:FindFirstChild("HumanoidRootPart")

    if TargetPart and MyRoot then
        local TargetCFrame = TargetPart.CFrame + Vector3.new(0, 4, 0)
        local Distance = (TargetPart.Position - MyRoot.Position).Magnitude
        local TweenTime = math.clamp(Distance / 100, 1.0, 10.0)

        local TweenInfoObj = TweenInfo.new(TweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local Tween = TweenService:Create(MyRoot, TweenInfoObj, {CFrame = TargetCFrame})

        AlertBox.Text = "🚀 Safely teleporting to " .. DisplayTitle .. "..."
        AlertBox.Visible = true

        Tween:Play()
        Tween.Completed:Connect(function()
            AlertBox.Text = "✅ Successfully arrived at " .. DisplayTitle .. "!"
            task.delay(2.5, function() AlertBox.Visible = false end)
            
            Settings[SettingKey] = false
            if RefreshCallback then RefreshCallback() end
        end)
    end
end

---------------------------------------------------------
-- Tab 2: ESP Page Options
---------------------------------------------------------
CreateToggleButton(EspPage, "DhabAll", "ESP All Dhabs (T1 to T6)", 0, Colors.White)
CreateToggleButton(EspPage, "DhabRareOnly", "ESP Legendary (T5) & Mythic (T6)", 40, RarityColors.T5)
CreateToggleButton(EspPage, "Players", "ESP Player Detection", 80, Colors.PlayerColor)
CreateToggleButton(EspPage, "Vehicles", "ESP Vehicle Detection", 120, Colors.VehicleColor)
CreateToggleButton(EspPage, "ShopEzba", "⛺ ESP Dhab Shop", 160, RarityColors.T5)
CreateToggleButton(EspPage, "Edge", "ESP World Edge", 200, RarityColors.T4)

local EspDistCard = Instance.new("Frame", EspPage)
EspDistCard.Size = UDim2.new(1, -6, 0, 52)
EspDistCard.Position = UDim2.new(0, 0, 0, 242)
EspDistCard.BackgroundColor3 = DarkTheme.Panel
Instance.new("UICorner", EspDistCard).CornerRadius = UDim.new(0, 8)

local EspDistLabel = Instance.new("TextLabel", EspDistCard)
EspDistLabel.Size = UDim2.new(1, -10, 0, 20)
EspDistLabel.Position = UDim2.new(0, 10, 0, 5)
EspDistLabel.BackgroundTransparency = 1
EspDistLabel.Text = "ESP Detection Range: " .. tostring(Settings.EspDistance) .. " m"
EspDistLabel.TextColor3 = Colors.White
EspDistLabel.TextSize = 11
EspDistLabel.Font = Enum.Font.GothamBold
EspDistLabel.TextXAlignment = Enum.TextXAlignment.Left

local EspMinusBtn = Instance.new("TextButton", EspDistCard)
EspMinusBtn.Size = UDim2.new(0, 55, 0, 22)
EspMinusBtn.Position = UDim2.new(0, 10, 0, 26)
EspMinusBtn.BackgroundColor3 = DarkTheme.ButtonOff
EspMinusBtn.Text = "- 100m"
EspMinusBtn.TextColor3 = Colors.White
EspMinusBtn.Font = Enum.Font.GothamBold
EspMinusBtn.TextSize = 10
Instance.new("UICorner", EspMinusBtn).CornerRadius = UDim.new(0, 6)

local EspPlusBtn = Instance.new("TextButton", EspDistCard)
EspPlusBtn.Size = UDim2.new(0, 55, 0, 22)
EspPlusBtn.Position = UDim2.new(0, 72, 0, 26)
EspPlusBtn.BackgroundColor3 = DarkTheme.ButtonOff
EspPlusBtn.Text = "+ 100m"
EspPlusBtn.TextColor3 = Colors.White
EspPlusBtn.Font = Enum.Font.GothamBold
EspPlusBtn.TextSize = 10
Instance.new("UICorner", EspPlusBtn).CornerRadius = UDim.new(0, 6)

EspMinusBtn.MouseButton1Click:Connect(function()
    if Settings.EspDistance > 100 then Settings.EspDistance = Settings.EspDistance - 100 EspDistLabel.Text = "ESP Detection Range: " .. tostring(Settings.EspDistance) .. " m" SaveSettings() end
end)
EspPlusBtn.MouseButton1Click:Connect(function()
    if Settings.EspDistance < 10000 then Settings.EspDistance = Settings.EspDistance + 100 EspDistLabel.Text = "ESP Detection Range: " .. tostring(Settings.EspDistance) .. " m" SaveSettings() end
end)

---------------------------------------------------------
-- Tab 3: Aimbot Page Options
---------------------------------------------------------
CreateToggleButton(AimPage, "Aimbot", "Enable Aimbot", 0, DarkTheme.Accent)
CreateToggleButton(AimPage, "RequireWeapon", "Weapon Required", 40, RarityColors.T5)
CreateToggleButton(AimPage, "HoldRightClick", "Right Click / Touch Only", 80, RarityColors.T3)
CreateToggleButton(AimPage, "UseFOVCircle", "Show Aim Circle (FOV)", 120, RarityColors.T2)

local FOVCard = Instance.new("Frame", AimPage)
FOVCard.Size = UDim2.new(1, -6, 0, 52)
FOVCard.Position = UDim2.new(0, 0, 0, 162)
FOVCard.BackgroundColor3 = DarkTheme.Panel
Instance.new("UICorner", FOVCard).CornerRadius = UDim.new(0, 8)

local FOVLabel = Instance.new("TextLabel", FOVCard)
FOVLabel.Size = UDim2.new(1, -10, 0, 20)
FOVLabel.Position = UDim2.new(0, 10, 0, 5)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "Aim Circle Size: " .. tostring(Settings.FOVRadius) .. " px"
FOVLabel.TextColor3 = Colors.White
FOVLabel.TextSize = 11
FOVLabel.Font = Enum.Font.GothamBold
FOVLabel.TextXAlignment = Enum.TextXAlignment.Left

local FOVMinusBtn = Instance.new("TextButton", FOVCard)
FOVMinusBtn.Size = UDim2.new(0, 50, 0, 22)
FOVMinusBtn.Position = UDim2.new(0, 10, 0, 26)
FOVMinusBtn.BackgroundColor3 = DarkTheme.ButtonOff
FOVMinusBtn.Text = "- 20px"
FOVMinusBtn.TextColor3 = Colors.White
FOVMinusBtn.Font = Enum.Font.GothamBold
FOVMinusBtn.TextSize = 10
Instance.new("UICorner", FOVMinusBtn).CornerRadius = UDim.new(0, 6)

local FOVPlusBtn = Instance.new("TextButton", FOVCard)
FOVPlusBtn.Size = UDim2.new(0, 50, 0, 22)
FOVPlusBtn.Position = UDim2.new(0, 66, 0, 26)
FOVPlusBtn.BackgroundColor3 = DarkTheme.ButtonOff
FOVPlusBtn.Text = "+ 20px"
FOVPlusBtn.TextColor3 = Colors.White
FOVPlusBtn.Font = Enum.Font.GothamBold
FOVPlusBtn.TextSize = 10
Instance.new("UICorner", FOVPlusBtn).CornerRadius = UDim.new(0, 6)

FOVMinusBtn.MouseButton1Click:Connect(function()
    if Settings.FOVRadius > 40 then Settings.FOVRadius = Settings.FOVRadius - 20 FOVLabel.Text = "Aim Circle Size: " .. tostring(Settings.FOVRadius) .. " px" SaveSettings() end
end)
FOVPlusBtn.MouseButton1Click:Connect(function()
    if Settings.FOVRadius < 300 then Settings.FOVRadius = Settings.FOVRadius + 20 FOVLabel.Text = "Aim Circle Size: " .. tostring(Settings.FOVRadius) .. " px" SaveSettings() end
end)

local DistCard = Instance.new("Frame", AimPage)
DistCard.Size = UDim2.new(1, -6, 0, 52)
DistCard.Position = UDim2.new(0, 0, 0, 220)
DistCard.BackgroundColor3 = DarkTheme.Panel
Instance.new("UICorner", DistCard).CornerRadius = UDim.new(0, 8)

local DistLabel = Instance.new("TextLabel", DistCard)
DistLabel.Size = UDim2.new(1, -10, 0, 20)
DistLabel.Position = UDim2.new(0, 10, 0, 5)
DistLabel.BackgroundTransparency = 1
DistLabel.Text = "Aimbot Range: " .. tostring(Settings.AimbotDistance) .. " m"
DistLabel.TextColor3 = Colors.White
DistLabel.TextSize = 11
DistLabel.Font = Enum.Font.GothamBold
DistLabel.TextXAlignment = Enum.TextXAlignment.Left

local MinusBtn = Instance.new("TextButton", DistCard)
MinusBtn.Size = UDim2.new(0, 50, 0, 22)
MinusBtn.Position = UDim2.new(0, 10, 0, 26)
MinusBtn.BackgroundColor3 = DarkTheme.ButtonOff
MinusBtn.Text = "- 10m"
MinusBtn.TextColor3 = Colors.White
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.TextSize = 10
Instance.new("UICorner", MinusBtn).CornerRadius = UDim.new(0, 6)

local PlusBtn = Instance.new("TextButton", DistCard)
PlusBtn.Size = UDim2.new(0, 50, 0, 22)
PlusBtn.Position = UDim2.new(0, 66, 0, 26)
PlusBtn.BackgroundColor3 = DarkTheme.ButtonOff
PlusBtn.Text = "+ 10m"
PlusBtn.TextColor3 = Colors.White
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.TextSize = 10
Instance.new("UICorner", PlusBtn).CornerRadius = UDim.new(0, 6)

MinusBtn.MouseButton1Click:Connect(function()
    if Settings.AimbotDistance > 10 then Settings.AimbotDistance = Settings.AimbotDistance - 10 DistLabel.Text = "Aimbot Range: " .. tostring(Settings.AimbotDistance) .. " m" SaveSettings() end
end)
PlusBtn.MouseButton1Click:Connect(function()
    if Settings.AimbotDistance < 200 then Settings.AimbotDistance = Settings.AimbotDistance + 10 DistLabel.Text = "Aimbot Range: " .. tostring(Settings.AimbotDistance) .. " m" SaveSettings() end
end)

---------------------------------------------------------
-- Tab 4: Teleport Page Options
---------------------------------------------------------
CreateToggleButton(TeleportPage, "TeleportShop", "🚀 Safe Teleport to Dhab Shop", 0, RarityColors.T5, function(State, RefreshCallback)
    if State then
        TeleportToModel({"DhabEzbaShop", "EzbaShop", "عزب"}, "Dhab Shop", "TeleportShop", RefreshCallback)
    end
end)

---------------------------------------------------------
-- Tab 5: Utils Page Options (Includes Vehicle Fly Control)
---------------------------------------------------------
CreateToggleButton(UtilsPage, "VehicleFlyActive", "🚗 Enable Vehicle Fly", 0, Colors.VehicleColor)

local FlySpeedCard = Instance.new("Frame", UtilsPage)
FlySpeedCard.Size = UDim2.new(1, -6, 0, 52)
FlySpeedCard.Position = UDim2.new(0, 0, 0, 42)
FlySpeedCard.BackgroundColor3 = DarkTheme.Panel
Instance.new("UICorner", FlySpeedCard).CornerRadius = UDim.new(0, 8)

local FlySpeedLabel = Instance.new("TextLabel", FlySpeedCard)
FlySpeedLabel.Size = UDim2.new(1, -10, 0, 20)
FlySpeedLabel.Position = UDim2.new(0, 10, 0, 5)
FlySpeedLabel.BackgroundTransparency = 1
FlySpeedLabel.Text = "Vehicle Fly Speed: " .. tostring(Settings.VehicleFlySpeed)
FlySpeedLabel.TextColor3 = Colors.White
FlySpeedLabel.TextSize = 11
FlySpeedLabel.Font = Enum.Font.GothamBold
FlySpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

local FlyMinusBtn = Instance.new("TextButton", FlySpeedCard)
FlyMinusBtn.Size = UDim2.new(0, 50, 0, 22)
FlyMinusBtn.Position = UDim2.new(0, 10, 0, 26)
FlyMinusBtn.BackgroundColor3 = DarkTheme.ButtonOff
FlyMinusBtn.Text = "- 10"
FlyMinusBtn.TextColor3 = Colors.White
FlyMinusBtn.Font = Enum.Font.GothamBold
FlyMinusBtn.TextSize = 10
Instance.new("UICorner", FlyMinusBtn).CornerRadius = UDim.new(0, 6)

local FlyPlusBtn = Instance.new("TextButton", FlySpeedCard)
FlyPlusBtn.Size = UDim2.new(0, 50, 0, 22)
FlyPlusBtn.Position = UDim2.new(0, 66, 0, 26)
FlyPlusBtn.BackgroundColor3 = DarkTheme.ButtonOff
FlyPlusBtn.Text = "+ 10"
FlyPlusBtn.TextColor3 = Colors.White
FlyPlusBtn.Font = Enum.Font.GothamBold
FlyPlusBtn.TextSize = 10
Instance.new("UICorner", FlyPlusBtn).CornerRadius = UDim.new(0, 6)

FlyMinusBtn.MouseButton1Click:Connect(function()
    if Settings.VehicleFlySpeed > 10 then 
        Settings.VehicleFlySpeed = Settings.VehicleFlySpeed - 10 
        FlySpeedLabel.Text = "Vehicle Fly Speed: " .. tostring(Settings.VehicleFlySpeed) 
        SaveSettings() 
    end
end)

FlyPlusBtn.MouseButton1Click:Connect(function()
    if Settings.VehicleFlySpeed < 500 then 
        Settings.VehicleFlySpeed = Settings.VehicleFlySpeed + 10 
        FlySpeedLabel.Text = "Vehicle Fly Speed: " .. tostring(Settings.VehicleFlySpeed) 
        SaveSettings() 
    end
end)

CreateToggleButton(UtilsPage, "RareHudActive", "👑 Show Rare Dhab HUD", 100, RarityColors.T5, function(State)
    RareHud.Visible = State
end)

CreateToggleButton(UtilsPage, "SmartAlerts", "🔔 Smart Rare Dhab Alerts", 140, RarityColors.T5)
CreateToggleButton(UtilsPage, "AntiAfkActive", "🛡️ Anti-AFK", 180, RarityColors.T2)
CreateToggleButton(UtilsPage, "AutoRejoinActive", "🔄 Auto-Rejoin on Disconnect", 220, RarityColors.T3)

---------------------------------------------------------
-- Mobile Touch Controls Engine (Fly Mobile HUD)
---------------------------------------------------------
local MobileFlyFrame = Instance.new("Frame", mainGui)
MobileFlyFrame.Name = "MobileFlyFrame"
MobileFlyFrame.Size = UDim2.new(0, 110, 0, 110)
MobileFlyFrame.Position = UDim2.new(0.82, 0, 0.5, -55)
MobileFlyFrame.BackgroundTransparency = 1
MobileFlyFrame.Visible = false

local function CreateTouchFlyButton(Name, Text, Pos)
    local Btn = Instance.new("TextButton", MobileFlyFrame)
    Btn.Name = Name
    Btn.Size = UDim2.new(0, 50, 0, 50)
    Btn.Position = Pos
    Btn.BackgroundColor3 = DarkTheme.Panel
    Btn.Text = Text
    Btn.TextColor3 = Colors.White
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 18
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 12)
    local Stroke = Instance.new("UIStroke", Btn)
    Stroke.Color = DarkTheme.Accent
    Stroke.Thickness = 1.5
    return Btn
end

local MobileUpBtn = CreateTouchFlyButton("UpBtn", "▲", UDim2.new(0, 30, 0, 0))
local MobileDownBtn = CreateTouchFlyButton("DownBtn", "▼", UDim2.new(0, 30, 0, 55))

local MobileUpPressed = false
local MobileDownPressed = false

MobileUpBtn.MouseButton1Down:Connect(function() MobileUpPressed = true end)
MobileUpBtn.MouseButton1Up:Connect(function() MobileUpPressed = false end)
MobileUpBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        MobileUpPressed = false
    end
end)

MobileDownBtn.MouseButton1Down:Connect(function() MobileDownPressed = true end)
MobileDownBtn.MouseButton1Up:Connect(function() MobileDownPressed = false end)
MobileDownBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        MobileDownPressed = false
    end
end)

---------------------------------------------------------
-- Vehicle Fly System Core Engine (Cross-Platform)
---------------------------------------------------------
local FlyBodyVel, FlyBodyGyro

local function GetCurrentVehicle()
    local MyChar = LP.Character
    if not MyChar then return nil end
    local Humanoid = MyChar:FindFirstChildOfClass("Humanoid")
    if Humanoid and Humanoid.SeatPart and Humanoid.SeatPart:IsA("VehicleSeat") then
        local VehicleModel = Humanoid.SeatPart:FindFirstAncestorOfClass("Model") or Humanoid.SeatPart.Parent
        return Humanoid.SeatPart, VehicleModel
    end
    return nil, nil
end

RunService.RenderStepped:Connect(function()
    local Seat, Vehicle = GetCurrentVehicle()
    
    if Settings.VehicleFlyActive and Seat and Vehicle then
        MobileFlyFrame.Visible = UserInputService.TouchEnabled
        
        local RootPart = Seat
        
        if not FlyBodyVel or FlyBodyVel.Parent ~= RootPart then
            if FlyBodyVel then FlyBodyVel:Destroy() end
            FlyBodyVel = Instance.new("BodyVelocity")
            FlyBodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            FlyBodyVel.Velocity = Vector3.new(0, 0, 0)
            FlyBodyVel.Parent = RootPart
        end

        if not FlyBodyGyro or FlyBodyGyro.Parent ~= RootPart then
            if FlyBodyGyro then FlyBodyGyro:Destroy() end
            FlyBodyGyro = Instance.new("BodyGyro")
            FlyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            FlyBodyGyro.P = 10000
            FlyBodyGyro.CFrame = RootPart.CFrame
            FlyBodyGyro.Parent = RootPart
        end

        local MoveVector = Vector3.new()
        local CamCF = Camera.CFrame

        -- Keyboard Controls
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            MoveVector = MoveVector + CamCF.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            MoveVector = MoveVector - CamCF.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            MoveVector = MoveVector - CamCF.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            MoveVector = MoveVector + CamCF.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) or UserInputService:IsKeyDown(Enum.KeyCode.E) or MobileUpPressed then
            MoveVector = MoveVector + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.Q) or MobileDownPressed then
            MoveVector = MoveVector - Vector3.new(0, 1, 0)
        end

        -- Mobile Touch Throttle Integration
        if Seat.Throttle > 0 then
            MoveVector = MoveVector + CamCF.LookVector
        elseif Seat.Throttle < 0 then
            MoveVector = MoveVector - CamCF.LookVector
        end
        if Seat.Steer > 0 then
            MoveVector = MoveVector + CamCF.RightVector
        elseif Seat.Steer < 0 then
            MoveVector = MoveVector - CamCF.RightVector
        end

        if MoveVector.Magnitude > 0 then
            MoveVector = MoveVector.Unit
        end

        FlyBodyVel.Velocity = MoveVector * Settings.VehicleFlySpeed
        FlyBodyGyro.CFrame = CamCF
    else
        MobileFlyFrame.Visible = false
        if FlyBodyVel then FlyBodyVel:Destroy() FlyBodyVel = nil end
        if FlyBodyGyro then FlyBodyGyro:Destroy() FlyBodyGyro = nil end
    end
end)

---------------------------------------------------------
-- Automation Tasks (Anti-AFK & Auto-Rejoin)
---------------------------------------------------------
task.spawn(function()
    local VirtualUser = game:GetService("VirtualUser")
    LP.Idled:Connect(function()
        if Settings.AntiAfkActive then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end)
end)

task.spawn(function()
    local Event = game:GetService("CoreGui").PromptError
    if Event then
        Event.Changed:Connect(function()
            if Settings.AutoRejoinActive then
                task.wait(1)
                pcall(function()
                    TeleportService:Teleport(game.PlaceId, LP)
                end)
            end
        end)
    end
    
    local ErrorPrompt = CoreGuiService:FindFirstChild("RobloxPromptGui", true)
    if ErrorPrompt then
        ErrorPrompt.DescendantAdded:Connect(function(msg)
            if msg.Name == "ErrorTitle" and Settings.AutoRejoinActive then
                task.wait(2)
                pcall(function()
                    TeleportService:Teleport(game.PlaceId, LP)
                end)
            end
        end)
    end
end)

---------------------------------------------------------
-- ESP Logic & Scanner Functions
---------------------------------------------------------
local function GetDhabInfo(Model)
    local TierFound = nil
    local StateFound = nil

    for Key, Value in pairs(Model:GetAttributes()) do
        local KeyLower = tostring(Key):lower()
        if KeyLower == "tier" then
            local tStr = tostring(Value):upper()
            if tStr == "T1" or tStr == "T2" or tStr == "T3" or tStr == "T4" or tStr == "T5" or tStr == "T6" then
                TierFound = tStr
            end
        elseif KeyLower == "state" then
            StateFound = tostring(Value):lower()
        end
    end

    if not TierFound then return nil end

    local Rarity = RarityNames[TierFound] or "Common"
    
    if StateFound and StateNames[StateFound] then
        LastKnownStates[Model] = StateNames[StateFound]
    elseif not LastKnownStates[Model] then
        LastKnownStates[Model] = "Idle 🧍"
    end

    return LastKnownStates[Model], Rarity, TierFound
end

local function GetCategory(Model)
    if not Model:IsA("Model") or Model == LP.Character then return nil end
    if Players:GetPlayerFromCharacter(Model) then return "Player" end

    local NameLower = Model.Name:lower()

    if NameLower:find("car") or NameLower:find("veh") or NameLower:find("seat") or NameLower:find("nissan") or NameLower:find("toyota") or NameLower:find("gmc") or Model:FindFirstChildOfClass("VehicleSeat") then
        return "Vehicle"
    end

    if Model.Name == "DhabEzbaShop" or NameLower:find("ezba") or NameLower:find("عزب") then return "ShopEzba" end
    if Model.Name == "DhabMapEdge" or NameLower:find("edge") or NameLower:find("boundary") then return "Edge" end

    local _, _, ValidTier = GetDhabInfo(Model)
    if ValidTier then
        return "Dhab"
    end

    return nil
end

local function GetPart(Model)
    return Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChild("Head") or Model.PrimaryPart or Model:FindFirstChildWhichIsA("BasePart")
end

local function RemoveESP(Model)
    local Highlight = Model:FindFirstChild("Sairo_HL")
    if Highlight then Highlight:Destroy() end
    LastKnownStates[Model] = nil
    for _, Object in ipairs(Model:GetDescendants()) do 
        if Object.Name == "Sairo_Text" then Object:Destroy() end 
    end
end

local function AddESP(Model, Category)
    local Part = GetPart(Model)
    if not Part then return end

    local MyChar = LP.Character
    local Dist = 0
    if MyChar and MyChar:FindFirstChild("HumanoidRootPart") then
        Dist = math.floor((Part.Position - MyChar.HumanoidRootPart.Position).Magnitude)
    end

    if (Category == "Player" or Category == "Vehicle" or Category == "Dhab") then
        if Dist > Settings.EspDistance then
            RemoveESP(Model)
            return
        end
    end

    local DisplayText, DisplayColor

    if Category == "Player" then
        local PlayerObj = Players:GetPlayerFromCharacter(Model)
        DisplayText = "Player: " .. (PlayerObj and PlayerObj.DisplayName or Model.Name) .. " [" .. Dist .. "m]"
        DisplayColor = Colors.PlayerColor
    elseif Category == "Vehicle" then
        DisplayText = "Vehicle [" .. Dist .. "m]"
        DisplayColor = Colors.VehicleColor
    elseif Category == "Dhab" then
        local StateText, Rarity, Tier = GetDhabInfo(Model)
        if not Tier then 
            RemoveESP(Model)
            return 
        end

        if Settings.DhabRareOnly and not Settings.DhabAll then
            if Tier ~= "T5" and Tier ~= "T6" then
                RemoveESP(Model)
                return
            end
        end

        if Settings.SmartAlerts and (Tier == "T5" or Tier == "T6") and Dist <= 200 then
            if not NotifiedRareDhabs[Model] then
                NotifiedRareDhabs[Model] = true
                AlertBox.Text = "🚨 Alert: Spotted a " .. Rarity .. " Dhab (" .. StateText .. ") nearby!"
                AlertBox.Visible = true
                pcall(function() NotifySound:Play() end)
                task.delay(4, function() AlertBox.Visible = false end)
            end
        end

        DisplayColor = RarityColors[Tier] or RarityColors.T1
        DisplayText = Rarity .. " | State: " .. StateText .. "\nDistance: [" .. Dist .. "m]"
    elseif Category == "ShopEzba" then 
        DisplayText = "Dhab Shop" 
        DisplayColor = RarityColors.T5
    elseif Category == "Edge" then 
        DisplayText = "World Edge" 
        DisplayColor = RarityColors.T4
    end

    local Highlight = Model:FindFirstChild("Sairo_HL") or Instance.new("Highlight", Model)
    Highlight.Name = "Sairo_HL"
    Highlight.Adornee = Model
    Highlight.FillColor = DisplayColor
    Highlight.OutlineColor = DisplayColor
    Highlight.FillTransparency = 0.3

    local Billboard = Part:FindFirstChild("Sairo_Text") or Instance.new("BillboardGui", Part)
    Billboard.Name = "Sairo_Text"
    Billboard.Adornee = Part
    Billboard.Size = UDim2.new(0, 220, 0, 50)
    Billboard.StudsOffset = Vector3.new(0, 3.2, 0)
    Billboard.AlwaysOnTop = true

    local Label = Billboard:FindFirstChild("Info") or Instance.new("TextLabel", Billboard)
    Label.Name = "Info"
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextStrokeTransparency = 0.2
    Label.TextScaled = true
    Label.Font = Enum.Font.ArialBold
    Label.Text = DisplayText
    Label.TextColor3 = DisplayColor
end

task.spawn(function()
    while mainGui.Parent do
        local NewDhabs = {}
        local ClosestRareDhabName = "No Dhab nearby"
        local ClosestRareDist = math.huge

        local MyChar = LP.Character
        local MyRoot = MyChar and MyChar:FindFirstChild("HumanoidRootPart")

        for _, Model in ipairs(Workspace:GetDescendants()) do
            if Model:IsA("Model") then
                local Category = GetCategory(Model)
                if Category then
                    if Category == "Dhab" then 
                        table.insert(NewDhabs, Model) 
                        
                        local StateText, Rarity, Tier = GetDhabInfo(Model)
                        if (Tier == "T5" or Tier == "T6") and MyRoot then
                            local Part = GetPart(Model)
                            if Part then
                                local Dist = (Part.Position - MyRoot.Position).Magnitude
                                local ExcludeSelf = Model:IsDescendantOf(MyChar)
                                if not ExcludeSelf and Dist < ClosestRareDist then
                                    ClosestRareDist = Dist
                                    ClosestRareDhabName = "⭐ Category: " .. Rarity .. "\n📌 State: " .. StateText .. "\n📍 Distance: " .. math.floor(Dist) .. " m"
                                end
                            end
                        end
                    end
                    
                    local Show = false
                    if Category == "Player" and Settings.Players then Show = true
                    elseif Category == "Vehicle" and Settings.Vehicles then Show = true
                    elseif Category == "Dhab" and (Settings.DhabAll or Settings.DhabRareOnly) then Show = true
                    elseif Category == "ShopEzba" and Settings.ShopEzba then Show = true
                    elseif Category == "Edge" and Settings.Edge then Show = true end

                    if Show then 
                        AddESP(Model, Category) 
                    else 
                        RemoveESP(Model)
                    end
                end
            end
        end
        CachedDhabs = NewDhabs
        
        if Settings.RareHudActive then
            if ClosestRareDist ~= math.huge then
                RareHudContent.Text = ClosestRareDhabName
            else
                RareHudContent.Text = "🔍 No Legendary/Mythic Dhab in range currently."
            end
        end
        
        task.wait(1.5)
    end
end)

---------------------------------------------------------
-- Aimbot Loop
---------------------------------------------------------
local function HasToolEquipped(Character)
    return Character:FindFirstChildOfClass("Tool") ~= nil
end

RunService.RenderStepped:Connect(function()
    local MousePos = UserInputService:GetMouseLocation()
    FOVCircle.Position = MousePos
    FOVCircle.Radius = Settings.FOVRadius
    FOVCircle.Visible = Settings.Aimbot and Settings.UseFOVCircle

    if not Settings.Aimbot then return end
    local MyChar = LP.Character
    if not MyChar then return end

    if Settings.RequireWeapon and not HasToolEquipped(MyChar) then return end
    if Settings.HoldRightClick and not (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) or UserInputService.TouchEnabled) then return end

    if MyChar:FindFirstChild("HumanoidRootPart") then
        local MyRoot = MyChar.HumanoidRootPart
        local ClosestTarget = nil
        local ShortestDistance = Settings.AimbotDistance

        for _, Model in ipairs(CachedDhabs) do
            if Model and Model.Parent then
                local TargetPart = GetPart(Model)
                if TargetPart then
                    local ScreenPos, OnScreen = Camera:WorldToViewportPoint(TargetPart.Position)
                    local Distance = (TargetPart.Position - MyRoot.Position).Magnitude

                    if Distance <= ShortestDistance and OnScreen then
                        if Settings.UseFOVCircle then
                            local MouseDist = (Vector2.new(ScreenPos.X, ScreenPos.Y) - MousePos).Magnitude
                            if MouseDist <= Settings.FOVRadius then ClosestTarget = TargetPart end
                        else
                            ClosestTarget = TargetPart
                        end
                    end
                end
            end
        end

        if ClosestTarget then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, ClosestTarget.Position)
        end
    end
end)

print("[LZ HUB] ✓ Script successfully configured to run efficiently on all devices!")
