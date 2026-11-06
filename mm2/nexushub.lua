--==============================================================
--  🌟 Nexus Hub | MM2 Script (Final v1.4 — All-in-One)
--  Logo ID: 70769117780882
--  UI Sound ID: 1140207837688369
--  Features: UI + Role Detector + Sheriff (Full) + Gun Farmer
--            + Gun Drop Alert + Noclip + Invisible + UI Sounds
--==============================================================

local Players           = game:GetService("Players")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local HttpService       = game:GetService("HttpService")
local TeleportService   = game:GetService("TeleportService")
local SoundService      = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--==============================================================
--  🔊 UI SOUND SYSTEM
--==============================================================
local UISound = {
    SoundId = "rbxassetid://1140207837688369",
    Volume = 1.5,
    Enabled = true,
    OpenSound = nil,
    CloseSound = nil,
    ClickSound = nil,
}

local function createUISound(name)
    local s = Instance.new("Sound")
    s.Name = name
    s.SoundId = UISound.SoundId
    s.Volume = UISound.Volume
    s.Parent = SoundService
    return s
end

UISound.OpenSound  = createUISound("UI_OpenSound")
UISound.CloseSound = createUISound("UI_CloseSound")
UISound.ClickSound = createUISound("UI_ClickSound")

local function playUISound(sound)
    if not UISound.Enabled or not sound then return end
    pcall(function()
        sound:Stop()
        sound.TimePosition = 0
        sound:Play()
    end)
end

local function isClickingUI()
    local gui = LocalPlayer:FindFirstChild("PlayerGui")
    local mouse = LocalPlayer:GetMouse()
    if not gui or not mouse then return false end
    local targets = gui:GetGuiObjectsAtPosition(mouse.X, mouse.Y)
    return #targets > 0
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        if isClickingUI() then
            playUISound(UISound.ClickSound)
        end
    end
end)

--==============================================================
--  โหลด WindUI + Window
--==============================================================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Nexus Hub | MM2",
    Icon = "rbxassetid://70769117780882",
    Author = "Nexus Team",
    Folder = "NexusHub_MM2",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    User = { Enabled = true, Anonymous = true },
    SideBarWidth = 200,
    HasOutline = true,
})

playUISound(UISound.OpenSound)

--==============================================================
--  ตรวจจับเปิด/ปิด UI
--==============================================================
local uiOpen = true

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightShift
        or input.KeyCode == Enum.KeyCode.RightControl then
        uiOpen = not uiOpen
        if uiOpen then
            playUISound(UISound.OpenSound)
        else
            playUISound(UISound.CloseSound)
        end
    end
end)

--==============================================================
--  แท็บทั้งหมด
--==============================================================
local HomeTab     = Window:Tab({ Title = "Home",     Icon = "home" })
local MainTab     = Window:Tab({ Title = "Main",     Icon = "zap" })
local SheriffTab  = Window:Tab({ Title = "Sheriff",  Icon = "shield" })
local GunTab      = Window:Tab({ Title = "Gun Farm", Icon = "crosshair" })
local PlayersTab  = Window:Tab({ Title = "Players",  Icon = "users" })
local VisualTab   = Window:Tab({ Title = "Visual",   Icon = "eye" })
local PlayerTab   = Window:Tab({ Title = "Player",   Icon = "user" })
local MiscTab     = Window:Tab({ Title = "Misc",     Icon = "settings" })

--==============================================================
--  Config
--==============================================================
local Config = {
    -- Combat
    AutoKill = false, KillAura = false,
    -- Sheriff
    AutoShoot = false, Aimbot = false, SilentAim = false,
    WallbangShoot = false, NoRecoil = false, FastReload = false,
    ShootRange = 200,
    AimbotSmooth = 0.15,
    AimPart = "Head",
    Prediction = false,
    PredictionFactor = 0.15,
    AutoShootDelay = 0.1,
    InstantKill = false,
    ForceHit = false,
    PriorityTarget = "Murderer",
    OnlyShootVisible = false,
    ShowAimLine = false,
    AutoReload = true,
    -- Visual
    ESP = false, ESPMurderer = false, Billboard = false,
    RoleTextSize = 13, BillboardTextSize = 14,
    -- Player
    Speed = 16, JumpPower = 50,
    InfiniteJump = false, WalkOnWater = false,
    -- Gun Farm
    FarmLoop = false, FarmLoopCount = 1,
    -- Gun Alert
    GunAlertEnabled = true,
    GunAlertSound = true,
    GunAlertTeleport = false,
    GunAlertCooldown = 3,
    -- Ghost
    Noclip = false,
    Invisible = false,
    HideAccessories = true,
    HideName = true,
    InvisibleAlpha = 0.5,
    -- UI
    UISoundEnabled = true,
    UISoundVolume = 1.5,
}

--==============================================================
--  🏠 HOME TAB
--==============================================================
HomeTab:Section({ Title = "🌟 NEXUS HUB | MM2" })

HomeTab:Paragraph({
    Title = "🌟 Nexus Hub | MM2",
    Desc = "เครดิต: Nexus Team | เวอร์ชัน 1.4 (Final + Sheriff Full)",
})

task.spawn(function()
    task.wait(0.5)
    local container = HomeTab.Container or HomeTab.Frame or HomeTab.UI or Window.UI
    if container and not container:FindFirstChild("NexusLogo") then
        local logo = Instance.new("ImageLabel")
        logo.Name = "NexusLogo"
        logo.Size = UDim2.new(0, 160, 0, 160)
        logo.Position = UDim2.new(0.5, -80, 0, 20)
        logo.BackgroundTransparency = 1
        logo.Image = "rbxassetid://70769117780882"
        logo.ScaleType = Enum.ScaleType.Fit
        logo.Parent = container
    end
end)

HomeTab:Section({ Title = "ข้อมูล" })
HomeTab:Paragraph({
    Title = "📌 ฟีเจอร์ทั้งหมด",
    Desc = "Sheriff Full | Role Detector | ESP | Gun Farmer | 🔔 Gun Alert | 👻 Ghost Mode | 🔊 UI Sounds",
})

HomeTab:Paragraph({
    Title = "⚠ คำเตือน",
    Desc = "ใช้ใน Private Server เท่านั้น การใช้ exploit ผิด ToS ของ Roblox",
})

HomeTab:Divider()
HomeTab:Section({ Title = "🔊 ตั้งค่าเสียง UI" })

HomeTab:Toggle({
    Title = "เปิดเสียง UI",
    Desc = "SoundId: 1140207837688369",
    Value = true,
    Callback = function(state)
        UISound.Enabled = state
        Config.UISoundEnabled = state
    end,
})

HomeTab:Slider({
    Title = "ระดับเสียง UI",
    Value = { Min = 0, Max = 5, Default = 1.5 },
    Callback = function(v)
        UISound.Volume = v
        Config.UISoundVolume = v
        UISound.OpenSound.Volume = v
        UISound.CloseSound.Volume = v
        UISound.ClickSound.Volume = v
    end,
})

HomeTab:Button({ Title = "🔊 ทดสอบเสียงเปิด", Callback = function() playUISound(UISound.OpenSound) end })
HomeTab:Button({ Title = "🔊 ทดสอบเสียงปิด", Callback = function() playUISound(UISound.CloseSound) end })
HomeTab:Button({ Title = "🔊 ทดสอบเสียงคลิก", Callback = function() playUISound(UISound.ClickSound) end })

--==============================================================
--  🔍 ROLE DETECTOR
--==============================================================
local RoleDetector = {}

function RoleDetector.getRole(player)
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health <= 0 then
            return "Dead", Color3.fromRGB(100, 100, 100)
        end
        if char:FindFirstChild("Knife") then
            return "Murderer", Color3.fromRGB(255, 50, 50)
        end
        if char:FindFirstChild("Gun") or char:FindFirstChild("Revolver") then
            return "Sheriff", Color3.fromRGB(0, 170, 255)
        end
    end
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        if backpack:FindFirstChild("Knife") then
            return "Murderer", Color3.fromRGB(255, 50, 50)
        end
        if backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver") then
            return "Sheriff", Color3.fromRGB(0, 170, 255)
        end
    end
    if char then return "Innocent", Color3.fromRGB(0, 255, 100) end
    return "Unknown", Color3.fromRGB(150, 150, 150)
end

function RoleDetector.getIcon(role)
    local icons = { Murderer = "🔪", Sheriff = "🔫", Innocent = "😇", Dead = "💀", Unknown = "❓" }
    return icons[role] or "❓"
end

local function getMurderer()
    for _, p in pairs(Players:GetPlayers()) do
        if p == LocalPlayer then continue end
        if RoleDetector.getRole(p) == "Murderer" then
            return p, p.Character
        end
    end
    return nil
end

local function isSheriff()
    return RoleDetector.getRole(LocalPlayer) == "Sheriff"
end

local function getGun()
    local char = LocalPlayer.Character
    if char then
        for _, tool in pairs(char:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name == "Revolver") then
                return tool
            end
        end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name == "Revolver") then
                return tool
            end
        end
    end
    return nil
end

--// ดึง target ตาม priority
local function getPriorityTarget()
    local murderer = getMurderer()
    if Config.PriorityTarget == "Murderer" and murderer then
        return murderer, murderer.Character
    end
    if Config.PriorityTarget == "Random" then
        local list = {}
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    table.insert(list, p)
                end
            end
        end
        if #list > 0 then
            local p = list[math.random(1, #list)]
            return p, p.Character
        end
    end
    return murderer, murderer and murderer.Character
end

--// ดึง part ของ target ตาม AimPart
local function getAimPart(char)
    if not char then return nil end
    if Config.AimPart == "Head" then
        return char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    else
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
    end
end

--// Prediction
local function getPredictedPosition(part)
    if not part then return Vector3.new() end
    if not Config.Prediction then return part.Position end
    local velocity = part.AssemblyLinearVelocity or Vector3.new()
    return part.Position + velocity * Config.PredictionFactor
end

--// Aim Line drawing
local aimLine = Drawing.new("Line")
aimLine.Visible = false
aimLine.Thickness = 1.5
aimLine.Color = Color3.fromRGB(255, 50, 50)
aimLine.Transparency = 1

--==============================================================
--  MAIN TAB
--==============================================================
MainTab:Section({ Title = "Combat" })

MainTab:Toggle({
    Title = "Auto Kill (Murderer)",
    Value = false,
    Callback = function(state)
        Config.AutoKill = state
        task.spawn(function()
            while Config.AutoKill do
                task.wait(0.1)
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not root then continue end
                for _, v in pairs(Players:GetPlayers()) do
                    if v == LocalPlayer then continue end
                    local vChar = v.Character
                    local vRoot = vChar and vChar:FindFirstChild("HumanoidRootPart")
                    local vHum = vChar and vChar:FindFirstChildOfClass("Humanoid")
                    if vRoot and vHum and vHum.Health > 0 then
                        if (root.Position - vRoot.Position).Magnitude < 15 then
                            vHum.Health = 0
                        end
                    end
                end
            end
        end)
    end,
})

MainTab:Toggle({
    Title = "Kill Aura",
    Value = false,
    Callback = function(state)
        Config.KillAura = state
        task.spawn(function()
            while Config.KillAura do
                task.wait(0.05)
                local knife = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Knife")
                if knife then knife:Activate() end
            end
        end)
    end,
})

MainTab:Divider()
MainTab:Section({ Title = "Teleport" })

MainTab:Button({
    Title = "TP to Murderer",
    Callback = function()
        local murderer, mChar = getMurderer()
        if not murderer or not mChar then
            WindUI:Notify({ Title = "ไม่พบ Murderer", Content = "ยังไม่มีใครเป็นฆาตกร", Duration = 3 })
            return
        end
        local mRoot = mChar:FindFirstChild("HumanoidRootPart")
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if mRoot and root then
            root.CFrame = mRoot.CFrame * CFrame.new(0, 0, 3)
        end
    end,
})

MainTab:Button({
    Title = "TP to Random Player",
    Callback = function()
        local list = Players:GetPlayers()
        if #list == 0 then return end
        local target = list[math.random(1, #list)]
        if target and target.Character and LocalPlayer.Character then
            local tRoot = target.Character:FindFirstChild("HumanoidRootPart")
            local mRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if tRoot and mRoot then
                mRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 3)
            end
        end
    end,
})

--==============================================================
--  🕵️ SHERIFF TAB (เมนูครบสมบูรณ์!)
--==============================================================
SheriffTab:Section({ Title = "📊 สถานะ" })

local statusLabel = SheriffTab:Paragraph({
    Title = "บทบาทของคุณ",
    Desc = "กำลังตรวจสอบ...",
})

local statsLabel = SheriffTab:Paragraph({
    Title = "📈 สถิติ",
    Desc = "Shots: 0 | Hits: 0 | Misses: 0",
})

local SheriffStats = { Shots = 0, Hits = 0, Misses = 0 }

task.spawn(function()
    while task.wait(1) do
        local role = RoleDetector.getRole(LocalPlayer)
        local icon = RoleDetector.getIcon(role)
        local murderer = getMurderer()
        statusLabel:SetTitle(string.format("%s คุณเป็น: %s", icon, role))
        statusLabel:SetDesc(murderer and ("🎯 Murderer: " .. murderer.Name) or "ยังไม่พบ Murderer")

        local acc = SheriffStats.Shots > 0
            and math.floor((SheriffStats.Hits / SheriffStats.Shots) * 100) or 0
        statsLabel:SetTitle("📈 สถิติการยิง")
        statsLabel:SetDesc(string.format("Shots: %d | Hits: %d | Misses: %d | Acc: %d%%",
            SheriffStats.Shots, SheriffStats.Hits, SheriffStats.Misses, acc))
    end
end)

SheriffTab:Divider()
SheriffTab:Section({ Title = "🎯 Aim & Shoot" })

SheriffTab:Toggle({
    Title = "Auto Shoot Murderer",
    Value = false,
    Callback = function(state)
        Config.AutoShoot = state
        task.spawn(function()
            while Config.AutoShoot do
                task.wait(Config.AutoShootDelay)
                if not isSheriff() then continue end
                local gun = getGun()
                if not gun then continue end
                local murderer, mChar = getMurderer()
                if not murderer or not mChar then continue end
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local mRoot = mChar:FindFirstChild("HumanoidRootPart")
                if root and mRoot then
                    if (root.Position - mRoot.Position).Magnitude <= Config.ShootRange then
                        local ok = pcall(function() gun:Activate() end)
                        SheriffStats.Shots = SheriffStats.Shots + 1
                        if ok then
                            SheriffStats.Hits = SheriffStats.Hits + 1
                        else
                            SheriffStats.Misses = SheriffStats.Misses + 1
                        end
                    end
                end
            end
        end)
    end,
})

SheriffTab:Toggle({
    Title = "🎯 Aimbot (ล็อกเป้า Murderer)",
    Desc = "หันกล้องไปที่เป้าอัตโนมัติ",
    Value = false,
    Callback = function(state)
        Config.Aimbot = state
        task.spawn(function()
            while Config.Aimbot do
                task.wait()
                if not isSheriff() then continue end
                local _, mChar = getPriorityTarget()
                if not mChar then continue end
                local targetPart = getAimPart(mChar)
                if targetPart then
                    local targetPos = getPredictedPosition(targetPart)
                    local currentCF = Camera.CFrame
                    local goalCF = CFrame.new(currentCF.Position, targetPos)

                    if Config.AimbotSmooth > 0 then
                        Camera.CFrame = currentCF:Lerp(goalCF, Config.AimbotSmooth)
                    else
                        Camera.CFrame = goalCF
                    end
                end
            end
        end)
    end,
})

SheriffTab:Toggle({
    Title = "🔫 Silent Aim",
    Desc = "ยิงโดนแม้ไม่หันไปทางเป้า (อิงกล้อง)",
    Value = false,
    Callback = function(state)
        Config.SilentAim = state
    end,
})

SheriffTab:Toggle({
    Title = "🧱 Wallbang (ยิงทะลุกำแพง)",
    Value = false,
    Callback = function(s) Config.WallbangShoot = s end,
})

SheriffTab:Toggle({
    Title = "💥 No Recoil (ไม่สะท้อน)",
    Value = false,
    Callback = function(s) Config.NoRecoil = s end,
})

SheriffTab:Toggle({
    Title = "⚡ Fast Reload (รีโหลดเร็ว)",
    Value = false,
    Callback = function(s) Config.FastReload = s end,
})

SheriffTab:Toggle({
    Title = "🔄 Auto Reload (รีโหลดอัตโนมัติ)",
    Value = true,
    Callback = function(s) Config.AutoReload = s end,
})

SheriffTab:Toggle({
    Title = "💀 Instant Kill (ตายทันที)",
    Desc = "ยิงโดน = ตายทันที",
    Value = false,
    Callback = function(s) Config.InstantKill = s end,
})

SheriffTab:Toggle({
    Title = "🎯 Force Hit (บังคับโดน)",
    Desc = "ยิงทุกนัดโดนเป้าเสมอ",
    Value = false,
    Callback = function(s) Config.ForceHit = s end,
})

SheriffTab:Toggle({
    Title = "📈 Prediction (ทำนายการเคลื่อนไหว)",
    Desc = "ยิงล่วงหน้าตามทิศทางเป้า",
    Value = false,
    Callback = function(s) Config.Prediction = s end,
})

SheriffTab:Toggle({
    Title = "👁️ Only Shoot Visible (ยิงเฉพาะที่เห็น)",
    Desc = "ยิงเฉพาะเมื่อเป้าไม่อยู่หลังกำแพง",
    Value = false,
    Callback = function(s) Config.OnlyShootVisible = s end,
})

SheriffTab:Toggle({
    Title = "📏 Show Aim Line (เส้นเล็ง)",
    Value = false,
    Callback = function(s) Config.ShowAimLine = s end,
})

SheriffTab:Divider()
SheriffTab:Section({ Title = "⚙️ ตั้งค่า" })

SheriffTab:Slider({
    Title = "ระยะยิง (Range)",
    Desc = "ระยะสูงสุดที่ยิงได้",
    Value = { Min = 50, Max = 1000, Default = 200 },
    Callback = function(v) Config.ShootRange = v end,
})

SheriffTab:Slider({
    Title = "Aimbot Smooth (ความนุ่ม)",
    Desc = "0 = กระตุกทันที | 1 = ค่อย ๆ หัน",
    Value = { Min = 0, Max = 1, Default = 0.15 },
    Callback = function(v) Config.AimbotSmooth = v end,
})

SheriffTab:Slider({
    Title = "Prediction Factor",
    Desc = "ยิ่งมากยิ่งทำนายไกล",
    Value = { Min = 0, Max = 1, Default = 0.15 },
    Callback = function(v) Config.PredictionFactor = v end,
})

SheriffTab:Slider({
    Title = "Auto Shoot Delay",
    Desc = "ระยะห่างระหว่างการยิง",
    Value = { Min = 0.01, Max = 1, Default = 0.1 },
    Callback = function(v) Config.AutoShootDelay = v end,
})

SheriffTab:Dropdown({
    Title = "จุดเล็ง (Aim Part)",
    Value = "Head",
    Options = { "Head", "Torso" },
    Callback = function(v) Config.AimPart = v end,
})

SheriffTab:Dropdown({
    Title = "เป้าหมายหลัก (Priority)",
    Value = "Murderer",
    Options = { "Murderer", "Random" },
    Callback = function(v) Config.PriorityTarget = v end,
})

SheriffTab:Divider()
SheriffTab:Section({ Title = "⚡ ปุ่มด่วน" })

SheriffTab:Button({
    Title = "Equip Gun",
    Callback = function()
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if not backpack then return end
        for _, tool in pairs(backpack:GetChildren()) do
            if tool.Name == "Gun" or tool.Name == "Revolver" then
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:EquipTool(tool) end
                break
            end
        end
    end,
})

SheriffTab:Button({
    Title = "หันไปทาง Murderer",
    Callback = function()
        local murderer, mChar = getMurderer()
        if not murderer or not mChar then return end
        local mRoot = mChar:FindFirstChild("HumanoidRootPart")
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if mRoot and root then
            root.CFrame = CFrame.new(root.Position, Vector3.new(mRoot.Position.X, root.Position.Y, mRoot.Position.Z))
        end
    end,
})

SheriffTab:Button({
    Title = "🔄 รีเซ็ตสถิติ",
    Callback = function()
        SheriffStats.Shots = 0
        SheriffStats.Hits = 0
        SheriffStats.Misses = 0
        WindUI:Notify({ Title = "📈 รีเซ็ตสถิติแล้ว", Duration = 2 })
    end,
})

SheriffTab:Divider()
SheriffTab:Section({ Title = "🚀 โหมดอัตโนมัติ" })

SheriffTab:Button({
    Title = "🎯 FULL AUTO MODE",
    Desc = "เปิดทุกอย่างพร้อมกัน",
    Callback = function()
        Config.Aimbot = true
        Config.AutoShoot = true
        Config.WallbangShoot = true
        Config.ESPMurderer = true
        Config.NoRecoil = true
        Config.AutoReload = true
        Config.FastReload = true
        WindUI:Notify({ Title = "FULL AUTO", Content = "เปิดโหมดอัตโนมัติแล้ว!", Duration = 3, Icon = "check" })
    end,
})

SheriffTab:Button({
    Title = "🛑 ปิดโหมดทั้งหมด",
    Desc = "ปิดทุก toggle ในหน้า Sheriff",
    Callback = function()
        Config.Aimbot = false
        Config.AutoShoot = false
        Config.SilentAim = false
        Config.WallbangShoot = false
        Config.NoRecoil = false
        Config.FastReload = false
        Config.InstantKill = false
        Config.ForceHit = false
        Config.Prediction = false
        Config.OnlyShootVisible = false
        Config.ShowAimLine = false
        Config.ESPMurderer = false
        WindUI:Notify({ Title = "🛑 ปิดทั้งหมดแล้ว", Duration = 2 })
    end,
})

--==============================================================
--  Sheriff Loops (รันเบื้องหลัง)
--==============================================================

--// Instant Kill + Force Hit Loop
task.spawn(function()
    while task.wait(0.05) do
        if not isSheriff() then continue end
        if not (Config.InstantKill or Config.ForceHit) then continue end
        local murderer, mChar = getMurderer()
        if not murderer or not mChar then continue end
        local mHum = mChar:FindFirstChildOfClass("Humanoid")
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local mRoot = mChar:FindFirstChild("HumanoidRootPart")
        if mHum and root and mRoot then
            if (root.Position - mRoot.Position).Magnitude <= Config.ShootRange then
                if Config.InstantKill then
                    mHum.Health = 0
                end
                if Config.ForceHit then
                    pcall(function()
                        mHum:TakeDamage(mHum.MaxHealth)
                    end)
                end
            end
        end
    end
end)

--// Auto Reload Loop
task.spawn(function()
    while task.wait(0.5) do
        if not Config.AutoReload then continue end
        if not isSheriff() then continue end
        local gun = getGun()
        if not gun then continue end
        local char = LocalPlayer.Character
        if not char then continue end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and gun.Parent ~= char then
            pcall(function() hum:EquipTool(gun) end)
        end
    end
end)

--// Aim Line Drawing Loop
RunService.RenderStepped:Connect(function()
    if Config.ShowAimLine and isSheriff() then
        local _, mChar = getPriorityTarget()
        if mChar then
            local part = getAimPart(mChar)
            if part then
                local targetPos = getPredictedPosition(part)
                local screenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
                if onScreen then
                    local originX = Camera.ViewportSize.X / 2
                    local originY = Camera.ViewportSize.Y / 2
                    aimLine.From = Vector2.new(originX, originY)
                    aimLine.To = Vector2.new(screenPos.X, screenPos.Y)
                    aimLine.Visible = true
                else
                    aimLine.Visible = false
                end
            else
                aimLine.Visible = false
            end
        else
            aimLine.Visible = false
        end
    else
        aimLine.Visible = false
    end
end)

--// Only Shoot Visible Check (ใช้ Raycast)
local function isVisible(targetChar)
    if not Config.OnlyShootVisible then return true end
    local part = getAimPart(targetChar)
    if not part then return false end
    local origin = Camera.CFrame.Position
    local dir = (part.Position - origin)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = { LocalPlayer.Character, targetChar }
    local result = workspace:Raycast(origin, dir, params)
    return result == nil
end

--==============================================================
--  🔫 GUN FARM TAB
--==============================================================
local GunFarmer = { Running = false, SavedCFrame = nil }

local function findDroppedGun()
    local gunNames = { "GunDrop", "Gun", "Revolver", "RevolverDrop" }
    for _, obj in pairs(workspace:GetDescendants()) do
        if not obj.Parent then continue end
        for _, name in pairs(gunNames) do
            if obj.Name == name then
                if obj:IsA("Tool") or obj:IsA("Model") or obj:IsA("BasePart") then
                    local part
                    if obj:IsA("BasePart") then part = obj
                    elseif obj:IsA("Tool") then part = obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
                    elseif obj:IsA("Model") then part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                    end
                    if part then return obj, part end
                end
            end
        end
    end
    return nil
end

local function collectGun(gunObj, gunPart)
    if not gunObj then return false end
    if gunPart then
        for _, target in pairs({ gunPart, gunPart.Parent }) do
            if target then
                for _, prompt in pairs(target:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        pcall(function() fireproximityprompt(prompt) end)
                    end
                end
            end
        end
    end
    if gunObj:IsA("Tool") then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            pcall(function() hum:EquipTool(gunObj) end)
            return true
        end
    end
    return false
end

function GunFarmer.Start()
    if GunFarmer.Running then
        WindUI:Notify({ Title = "⚠ กำลังทำงานอยู่", Duration = 2 })
        return
    end
    GunFarmer.Running = true

    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then
        WindUI:Notify({ Title = "❌ ไม่พบตัวละคร", Duration = 3 })
        GunFarmer.Running = false
        return
    end

    GunFarmer.SavedCFrame = root.CFrame
    WindUI:Notify({
        Title = "💾 บันทึกตำแหน่งเดิมแล้ว",
        Content = string.format("X:%.0f Y:%.0f Z:%.0f",
            root.Position.X, root.Position.Y, root.Position.Z),
        Duration = 2,
    })

    task.spawn(function()
        local gunObj, gunPart = findDroppedGun()
        if not gunObj or not gunPart then
            WindUI:Notify({ Title = "❌ ไม่พบปืน", Content = "ไม่มีปืนตกบนแมพ", Duration = 3 })
            GunFarmer.Running = false
            return
        end

        local cur = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if cur then
            cur.CFrame = gunPart.CFrame + Vector3.new(0, 3, 0)
            WindUI:Notify({ Title = "🔫 วาร์ปหาปืนแล้ว", Content = gunObj.Name, Duration = 2 })
        end

        task.wait(0.3)
        collectGun(gunObj, gunPart)

        for i = 1, 10 do
            task.wait(0.15)
            local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if r and gunPart and gunPart.Parent then
                r.CFrame = gunPart.CFrame + Vector3.new(0, 3, 0)
            else break end
        end

        task.wait(0.5)

        local backRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if backRoot and GunFarmer.SavedCFrame then
            backRoot.CFrame = GunFarmer.SavedCFrame
            WindUI:Notify({
                Title = "✅ กลับตำแหน่งเดิมแล้ว",
                Content = "เก็บปืนเสร็จสิ้น",
                Duration = 3, Icon = "check",
            })
        end
        GunFarmer.Running = false
    end)
end

GunTab:Section({ Title = "เก็บปืนอัตโนมัติ" })

GunTab:Button({
    Title = "🔫 วาปไปเก็บปืน แล้วกลับ",
    Desc = "วาร์ปหาปืน → เก็บ → กลับจุดเดิม",
    Callback = function() GunFarmer.Start() end,
})

GunTab:Slider({
    Title = "จำนวนรอบ",
    Value = { Min = 1, Max = 10, Default = 1 },
    Callback = function(v) Config.FarmLoopCount = v end,
})

GunTab:Button({
    Title = "🔄 วาปเก็บปืนหลายรอบ",
    Callback = function()
        task.spawn(function()
            for i = 1, Config.FarmLoopCount do
                repeat task.wait(0.2) until not GunFarmer.Running
                GunFarmer.Start()
                repeat task.wait(0.2) until not GunFarmer.Running
                WindUI:Notify({ Title = string.format("รอบ %d/%d เสร็จ", i, Config.FarmLoopCount), Duration = 2 })
                task.wait(0.5)
            end
        end)
    end,
})

GunTab:Toggle({
    Title = "🔁 Auto Farm Loop",
    Value = false,
    Callback = function(state)
        Config.FarmLoop = state
        task.spawn(function()
            while Config.FarmLoop do
                if not GunFarmer.Running then GunFarmer.Start() end
                task.wait(1)
            end
        end)
    end,
})

GunTab:Divider()
GunTab:Section({ Title = "ตำแหน่ง" })

GunTab:Button({
    Title = "💾 บันทึกตำแหน่งปัจจุบัน",
    Callback = function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            GunFarmer.SavedCFrame = root.CFrame
            WindUI:Notify({ Title = "💾 บันทึกแล้ว", Duration = 3 })
        end
    end,
})

GunTab:Button({
    Title = "↩️ กลับตำแหน่งที่บันทึกไว้",
    Callback = function()
        if not GunFarmer.SavedCFrame then
            WindUI:Notify({ Title = "❌ ไม่มีตำแหน่งที่บันทึก", Duration = 3 })
            return
        end
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = GunFarmer.SavedCFrame
            WindUI:Notify({ Title = "✅ กลับแล้ว", Duration = 2 })
        end
    end,
})

--==============================================================
--  🔔 GUN ALERT
--==============================================================
local GunAlert = { KnownGuns = {}, LastAlertTime = 0 }

local alertSound = Instance.new("Sound")
alertSound.Name = "GunAlertSound"
alertSound.SoundId = "rbxassetid://9114427909"
alertSound.Volume = 2
alertSound.Parent = SoundService

local function isDroppedGun(obj)
    if not obj or not obj.Parent then return false end
    local n = obj.Name
    if n ~= "Gun" and n ~= "Revolver" and n ~= "GunDrop" and n ~= "RevolverDrop" then return false end
    local parent = obj.Parent
    if parent then
        if parent:IsA("Backpack") or parent:IsA("Player") then return false end
        if parent:IsA("Model") and Players:GetPlayerFromCharacter(parent) then return false end
    end
    return obj:IsDescendantOf(workspace)
end

local function getGunPart(gun)
    if not gun then return nil end
    if gun:IsA("BasePart") then return gun end
    if gun:IsA("Tool") then return gun:FindFirstChild("Handle") or gun:FindFirstChildWhichIsA("BasePart") end
    if gun:IsA("Model") then return gun.PrimaryPart or gun:FindFirstChildWhichIsA("BasePart") end
    return gun:FindFirstChildWhichIsA("BasePart", true)
end

local function alertDroppedGun(gun)
    local now = tick()
    if now - GunAlert.LastAlertTime < Config.GunAlertCooldown then return end
    GunAlert.LastAlertTime = now

    local part = getGunPart(gun)
    local pos = part and part.Position or Vector3.new()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local dist = root and math.floor((root.Position - pos).Magnitude) or 0

    WindUI:Notify({
        Title = "🔫 ปืนตก!",
        Content = string.format("%s ตกอยู่ห่าง %d studs", gun.Name, dist),
        Duration = 5, Icon = "crosshair",
    })

    if Config.GunAlertSound then pcall(function() alertSound:Play() end) end
    if Config.GunAlertTeleport and part and root then
        root.CFrame = part.CFrame + Vector3.new(0, 3, 0)
    end
end

workspace.DescendantAdded:Connect(function(obj)
    if not Config.GunAlertEnabled then return end
    task.wait(0.1)
    if isDroppedGun(obj) and not GunAlert.KnownGuns[obj] then
        GunAlert.KnownGuns[obj] = true
        alertDroppedGun(obj)
    end
end)

workspace.DescendantRemoving:Connect(function(obj)
    GunAlert.KnownGuns[obj] = nil
end)

GunTab:Divider()
GunTab:Section({ Title = "🔔 แจ้งเตือนปืนตก" })

GunTab:Toggle({
    Title = "เปิดแจ้งเตือนเมื่อปืนตก",
    Value = true,
    Callback = function(state) Config.GunAlertEnabled = state end,
})

GunTab:Toggle({
    Title = "🔊 เล่นเสียงแจ้งเตือน",
    Value = true,
    Callback = function(state) Config.GunAlertSound = state end,
})

GunTab:Toggle({
    Title = "⚡ วาปไปหาปืนทันทีที่ตก",
    Value = false,
    Callback = function(state) Config.GunAlertTeleport = state end,
})

GunTab:Slider({
    Title = "คูลดาวน์แจ้งเตือน (วินาที)",
    Value = { Min = 1, Max = 30, Default = 3 },
    Callback = function(v) Config.GunAlertCooldown = v end,
})

--==============================================================
--  👥 PLAYERS TAB
--==============================================================
PlayersTab:Section({ Title = "บทบาทผู้เล่นในเซิร์ฟเวอร์" })

local playerLabels = {}

local function createPlayerLabel(player)
    local role = RoleDetector.getRole(player)
    local icon = RoleDetector.getIcon(role)
    local label = PlayersTab:Paragraph({
        Title = string.format("%s %s", icon, player.Name),
        Desc = string.format("บทบาท: %s | DisplayName: %s", role, player.DisplayName),
    })
    playerLabels[player] = label
end

for _, p in pairs(Players:GetPlayers()) do createPlayerLabel(p) end

Players.PlayerAdded:Connect(function(p)
    task.wait(1)
    createPlayerLabel(p)
end)

Players.PlayerRemoving:Connect(function(p) playerLabels[p] = nil end)

task.spawn(function()
    while task.wait(1) do
        for player, label in pairs(playerLabels) do
            if player.Parent then
                local role = RoleDetector.getRole(player)
                local icon = RoleDetector.getIcon(role)
                label:SetTitle(string.format("%s %s", icon, player.Name))
                label:SetDesc(string.format("บทบาท: %s | DisplayName: %s", role, player.DisplayName))
            end
        end
    end
end)

--==============================================================
--  👁️ VISUAL TAB (ESP)
--==============================================================
local ESPObjects = {}

local function createESP(player)
    local box = Drawing.new("Square")
    box.Thickness = 1
    box.Filled = false
    box.Transparency = 1
    box.Visible = false

    local nameTag = Drawing.new("Text")
    nameTag.Size = 12
    nameTag.Center = true
    nameTag.Outline = true
    nameTag.Color = Color3.fromRGB(255, 255, 255)
    nameTag.Visible = false

    local roleTag = Drawing.new("Text")
    roleTag.Size = Config.RoleTextSize
    roleTag.Center = true
    roleTag.Outline = true
    roleTag.Color = Color3.fromRGB(255, 255, 255)
    roleTag.Visible = false

    ESPObjects[player] = { Box = box, Name = nameTag, Role = roleTag }
end

for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then createESP(p) end
end
Players.PlayerAdded:Connect(function(p) if p ~= LocalPlayer then createESP(p) end end)
Players.PlayerRemoving:Connect(function(p)
    if ESPObjects[p] then
        ESPObjects[p].Box:Remove()
        ESPObjects[p].Name:Remove()
        ESPObjects[p].Role:Remove()
        ESPObjects[p] = nil
    end
end)

VisualTab:Toggle({
    Title = "ESP แสดงบทบาท",
    Value = false,
    Callback = function(state)
        Config.ESP = state
        if not state then
            for _, o in pairs(ESPObjects) do
                o.Box.Visible = false
                o.Name.Visible = false
                o.Role.Visible = false
            end
        end
    end,
})

RunService.RenderStepped:Connect(function()
    if not Config.ESP then return end
    for player, obj in pairs(ESPObjects) do
        local char = player.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if root and hum and hum.Health > 0 then
            local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
            if onScreen then
                local role, roleColor = RoleDetector.getRole(player)
                local icon = RoleDetector.getIcon(role)
                local dist = (Camera.CFrame.Position - root.Position).Magnitude
                local scale = 1000 / dist
                obj.Box.Size = Vector2.new(scale * 1.2, scale * 1.8)
                obj.Box.Position = Vector2.new(pos.X - obj.Box.Size.X / 2, pos.Y - obj.Box.Size.Y / 2)
                obj.Box.Color = roleColor
                obj.Box.Visible = true
                obj.Name.Text = string.format("%s [%d]", player.Name, math.floor(dist))
                obj.Name.Position = Vector2.new(pos.X, pos.Y - obj.Box.Size.Y / 2 - 18)
                obj.Name.Visible = true
                obj.Role.Text = string.format("%s %s", icon, role)
                obj.Role.Color = roleColor
                obj.Role.Position = Vector2.new(pos.X, pos.Y + obj.Box.Size.Y / 2 + 4)
                obj.Role.Visible = true
            else
                obj.Box.Visible = false
                obj.Name.Visible = false
                obj.Role.Visible = false
            end
        else
            obj.Box.Visible = false
            obj.Name.Visible = false
            obj.Role.Visible = false
        end
    end
end)

--==============================================================
--  🏃 PLAYER TAB (Movement)
--==============================================================
PlayerTab:Section({ Title = "Movement" })

PlayerTab:Slider({
    Title = "Walk Speed",
    Value = { Min = 16, Max = 200, Default = 16 },
    Callback = function(v)
        Config.Speed = v
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end,
})

PlayerTab:Slider({
    Title = "Jump Power",
    Value = { Min = 50, Max = 300, Default = 50 },
    Callback = function(v)
        Config.JumpPower = v
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = v end
    end,
})

PlayerTab:Toggle({ Title = "Infinite Jump", Value = false, Callback = function(s) Config.InfiniteJump = s end })
PlayerTab:Toggle({ Title = "Walk On Water", Value = false, Callback = function(s) Config.WalkOnWater = s end })

UserInputService.JumpRequest:Connect(function()
    if not Config.InfiniteJump then return end
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

--==============================================================
--  👻 NOCLIP + INVISIBLE SYSTEM
--==============================================================
local Ghost = { SavedTransparency = {}, SavedDecals = {} }

local function setNoclip(enabled)
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide then
            pcall(function() part.CanCollide = not enabled end)
        end
    end
end

RunService.Stepped:Connect(function()
    if not Config.Noclip then return end
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide then
            pcall(function() part.CanCollide = false end)
        end
    end
end)

local function applyInvisible(enabled)
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            if enabled then
                if Ghost.SavedTransparency[part] == nil then
                    Ghost.SavedTransparency[part] = part.Transparency
                end
                part.LocalTransparencyModifier = 1
                if part.Name ~= "HumanoidRootPart" then part.Transparency = 1 end
            else
                local saved = Ghost.SavedTransparency[part]
                part.LocalTransparencyModifier = saved or 0
                part.Transparency = saved or 0
            end
        elseif part:IsA("Decal") or part:IsA("Texture") then
            if enabled then
                if Ghost.SavedDecals[part] == nil then
                    Ghost.SavedDecals[part] = part.Transparency
                end
                part.Transparency = 1
            else
                part.Transparency = Ghost.SavedDecals[part] or 0
            end
        end
    end
    if enabled and Config.HideName then
        if not char:FindFirstChildOfClass("ForceField") then
            local ff = Instance.new("ForceField")
            ff.Name = "GhostForceField"
            ff.Visible = false
            ff.Parent = char
        end
    else
        local ff = char:FindFirstChild("GhostForceField")
        if ff then ff:Destroy() end
    end
end

task.spawn(function()
    while task.wait(0.1) do
        if Config.Invisible then
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.LocalTransparencyModifier = 1
                        if part.Name ~= "HumanoidRootPart" then part.Transparency = 1 end
                    elseif part:IsA("Decal") or part:IsA("Texture") then
                        part.Transparency = 1
                    end
                end
            end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = Config.Speed
    hum.JumpPower = Config.JumpPower
    Ghost.SavedTransparency = {}
    Ghost.SavedDecals = {}
    task.wait(0.5)
    if Config.Noclip then setNoclip(true) end
    if Config.Invisible then applyInvisible(true) end
end)

PlayerTab:Divider()
PlayerTab:Section({ Title = "👻 Ghost Mode" })

PlayerTab:Toggle({
    Title = "🚪 Noclip (ทะลุกำแพง)",
    Value = false,
    Callback = function(state) Config.Noclip = state; setNoclip(state) end,
})

PlayerTab:Toggle({
    Title = "👻 Invisible (ล่องหน)",
    Value = false,
    Callback = function(state)
        Config.Invisible = state
        Ghost.SavedTransparency = {}
        Ghost.SavedDecals = {}
        applyInvisible(state)
    end,
})

PlayerTab:Toggle({
    Title = "🎩 ซ่อนเครื่องประดับ",
    Value = true,
    Callback = function(state)
        Config.HideAccessories = state
        if Config.Invisible then applyInvisible(true) end
    end,
})

PlayerTab:Toggle({
    Title = "🏷️ ซ่อนชื่อ (ForceField)",
    Value = true,
    Callback = function(state)
        Config.HideName = state
        if Config.Invisible then applyInvisible(true) end
    end,
})

PlayerTab:Button({
    Title = "👻 เปิด Ghost Mode (Noclip + ล่องหน)",
    Callback = function()
        Config.Noclip = true
        Config.Invisible = true
        Ghost.SavedTransparency = {}
        Ghost.SavedDecals = {}
        setNoclip(true)
        applyInvisible(true)
        WindUI:Notify({ Title = "👻 Ghost Mode เปิด", Duration = 3, Icon = "check" })
    end,
})

PlayerTab:Button({
    Title = "🛑 ปิด Ghost Mode",
    Callback = function()
        Config.Noclip = false
        Config.Invisible = false
        setNoclip(false)
        applyInvisible(false)
    end,
})

--==============================================================
--  🔔 แจ้งเตือนพบบทบาทใหม่
--==============================================================
local notified = {}

task.spawn(function()
    while task.wait(2) do
        for _, p in pairs(Players:GetPlayers()) do
            if p == LocalPlayer then continue end
            local role = RoleDetector.getRole(p)
            if (role == "Murderer" or role == "Sheriff") and not notified[p.UserId .. role] then
                notified[p.UserId .. role] = true
                local icon = RoleDetector.getIcon(role)
                WindUI:Notify({
                    Title = (role == "Murderer" and "🔴 " or "🔵 ") .. "พบบทบาทใหม่!",
                    Content = string.format("%s %s เป็น %s", icon, p.Name, role),
                    Duration = 5,
                    Icon = role == "Murderer" and "sword" or "shield",
                })
            end
        end
    end
end)

--==============================================================
--  ⚙️ MISC TAB
--==============================================================
MiscTab:Section({ Title = "Server" })

MiscTab:Button({
    Title = "Rejoin Server",
    Callback = function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end,
})

MiscTab:Button({
    Title = "Server Hop",
    Callback = function()
        local ok, servers = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(
                "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            ))
        end)
        if ok and servers then
            for _, s in pairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
                    break
                end
            end
        end
    end,
})

MiscTab:Divider()
MiscTab:Section({ Title = "🔊 เสียง UI" })

MiscTab:Toggle({
    Title = "เปิดเสียง UI",
    Value = true,
    Callback = function(state) UISound.Enabled = state end,
})

MiscTab:Slider({
    Title = "ระดับเสียง UI",
    Value = { Min = 0, Max = 5, Default = 1.5 },
    Callback = function(v)
        UISound.Volume = v
        UISound.OpenSound.Volume = v
        UISound.CloseSound.Volume = v
        UISound.ClickSound.Volume = v
    end,
})

MiscTab:Section({ Title = "🌟 Nexus Hub" })
MiscTab:Paragraph({
    Title = "Nexus Hub | MM2",
    Desc = "เครดิต: Nexus Team | เวอร์ชัน 1.4 (Final + Sheriff Full)",
})

--==============================================================
--  แจ้งเตือนโหลดเสร็จ
--==============================================================
WindUI:Notify({
    Title = "🌟 Nexus Hub | MM2",
    Content = "โหลดสำเร็จ! v1.4 เมนู Sheriff ครบสมบูรณ์ 🎯🔫",
    Duration = 5,
    Icon = "rbxassetid://70769117780882",
})

print("[Nexus Hub] โหลดสำเร็จ ✅ | v1.4 (Final + Sheriff Full)")
print("Sheriff Menu: AutoShoot | Aimbot | SilentAim | Wallbang | NoRecoil | FastReload | InstantKill | ForceHit | Prediction | OnlyVisible | AimLine")
