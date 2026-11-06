local tweenService = game:GetService("TweenService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local players = game:GetService("Players")
local v1 = {
  API_URL = "https://robloxserver2.tagonmiku.workers.dev/",
  KEY_LINK = "https://axioshub.store/homegetkey",
  LOAD_COOLDOWN = 5,
  COLORS = {
    BG = Color3.fromRGB(10, 10, 10),
    Surface = Color3.fromRGB(17, 17, 17),
    Card = Color3.fromRGB(26, 26, 26),
    Border = Color3.fromRGB(42, 42, 42),
    Accent = Color3.fromRGB(255, 255, 255),
    Text = Color3.fromRGB(255, 255, 255),
    Muted = Color3.fromRGB(102, 102, 102),
    Success = Color3.fromRGB(74, 222, 128),
    Error = Color3.fromRGB(248, 113, 113),
    Info = Color3.fromRGB(96, 165, 250),
    Warn = Color3.fromRGB(251, 191, 36),
    LoadingBG = Color3.fromRGB(30, 58, 46),
    LoadingFG = Color3.fromRGB(74, 222, 128),
  },
}
local v2 = {
  [2239430935] = "blair",
  [1316421563] = "vb4.2",
  [65241] = "natural_disaster",
  [7314989375] = "hunters",
  [8507957492] = "gone_hunting",
  [8316902627] = "plants_vs_brainrots",
  [9099314377] = "wizard_arena",
  [6739698191] = "violence_district",
  [601130232] = "bee_swarm",
  [9509842868] = "garden_horizons",
  [10128873893] = "sit_downleft",
  [9382766753] = "speed_car_escape",
  [9363735110] = "escape_tsunami_for_brainrots",
  [6107536686] = "ther",
  [7394964165] = "solo_hunter",
  [3258251641] = "stur",
}
local v3 = {
  {
    name = "Blair",
    mapId = "blair",
    gameId = 2239430935,
    textureId = "rbxassetid://124747726990966",
  },
  {
    name = "Volleyball 4.2",
    mapId = "vb4.2",
    gameId = 1316421563,
    textureId = "rbxassetid://118179527348904",
  },
  {
    name = "Natural Disaster",
    mapId = "natural_disaster",
    gameId = 65241,
    textureId = "rbxassetid://120847888818457",
  },
  {
    name = "Hunters",
    mapId = "hunters",
    gameId = 7314989375,
    textureId = "rbxassetid://135399549470883",
  },
  {
    name = "Gone Hunting",
    mapId = "gone_hunting",
    gameId = 8507957492,
    textureId = "rbxassetid://101686531195153",
  },
  {
    name = "Plants vs Brainrots",
    mapId = "plants_vs_brainrots",
    gameId = 8316902627,
    textureId = "rbxassetid://117542286233008",
  },
  {
    name = "Wizard Arena",
    mapId = "wizard_arena",
    gameId = 9099314377,
    textureId = "rbxassetid://88332389751195",
  },
  {
    name = "Violence District",
    mapId = "violence_district",
    gameId = 6739698191,
    textureId = "rbxassetid://135690752599713",
  },
  {
    name = "Bee Swarm Simulator",
    mapId = "bee_swarm",
    gameId = 601130232,
    textureId = "rbxassetid://96316724656316",
  },
  {
    name = "Solo Hunter",
    mapId = "solo_hunter",
    gameId = 7394964165,
    textureId = "rbxassetid://134229521193741",
  },
  {
    name = "Garden Horizons",
    mapId = "garden_horizons",
    gameId = 9509842868,
    textureId = "rbxassetid://74770798220054",
  },
  {
    name = "Speed Car Escape",
    mapId = "speed_car_escape",
    gameId = 9382766753,
    textureId = "rbxassetid://112849414694838",
  },
  {
    name = "Escape Tsunami",
    mapId = "escape_tsunami_for_brainrots",
    gameId = 9363735110,
    textureId = "rbxassetid://115623769459371",
  },
  {
    name = "Ther",
    mapId = "ther",
    gameId = 6107536686,
    textureId = "rbxassetid://115479302521879",
  },
  {
    name = "Sit Down Left",
    mapId = "sit_downleft",
    gameId = 10128873893,
    textureId = "rbxassetid://82339733439304",
  },
  {
    name = "Stand Up Right",
    mapId = "stur",
    gameId = 3258251641,
    textureId = "rbxassetid://124904853410206",
  },
}
local localPlayer = players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local touchEnabled = userInputService.TouchEnabled and not userInputService.KeyboardEnabled
local v4 = false
local v5 = 0
local text = ""
local v6 = {}
local v7 = {}
local v8 = getgenv and getgenv() or _G

local function f1(parent, p1, p2)
  local uiStroke = Instance.new("UIStroke")
  uiStroke.Color = p1 or v1.COLORS.Border
  uiStroke.Thickness = p2 or 1
  uiStroke.Parent = parent
  return uiStroke
end

local function f2(p3)
  if not p3 then
    return ""
  else
    local v9 = string.gsub(p3, "\n", "\r\n")
    local v10 = string.gsub(v9, "([^%w _%%%-%.~])", function(p4) return string.format("%%%02X", string.byte(p4)) end)
    return string.gsub(v10, " ", "+")
  end
end

local function f3(p5)
  if not p5 then
    return ""
  else
    local v11 = string.find(p5, "{")
    return v11 and string.sub(p5, v11) or p5
  end
end

local function f4(parent2, p6)
  local uiCorner = Instance.new("UICorner")
  uiCorner.CornerRadius = UDim.new(0, p6 or 0)
  uiCorner.Parent = parent2
  return uiCorner
end

local function f5(p7, p8, p9)
  tweenService:Create(p7, TweenInfo.new(p9 or 0.2, Enum.EasingStyle.Quad), p8):Play()
end

local function f6(p10)
  if p10 <= 0 then
    return "EXPIRED"
  else
    local v12 = math.floor(p10 / 86400)
    local v13 = math.floor(p10 % 86400 / 3600)
    local v14 = math.floor(p10 % 3600 / 60)
    local v15 = math.floor(p10 % 60)
    if v12 > 0 then
      return string.format("%dd %02d:%02d:%02d", v12, v13, v14, v15)
    end
    return string.format("%02d:%02d:%02d", v13, v14, v15)
  end
end

local function f7(p11)
  if v7[p11] ~= nil then
    return v7[p11]
  end
  v7[p11] = false
  return false
end

local function f8()
  local gameId = game.GameId
  if v8.ForceDumper or v8.ScriptID == "dumper-files-roblox" then
    return {
      name = "Universal Dumper",
      mapId = "dumper-files-roblox",
      gameId = gameId,
      textureId = "",
    }
  end
  if v2[gameId] then
    local v16 = v2[gameId]
    for index, value in ipairs(v3) do
      if value.mapId == v16 then
        return value
      end
    end
    return nil
  end
  return nil
end

local axiosHub2026 = Instance.new("ScreenGui")
axiosHub2026.Name = "AxiosHub2026"
axiosHub2026.ResetOnSpawn = false
axiosHub2026.IgnoreGuiInset = true
axiosHub2026.DisplayOrder = 999999999
axiosHub2026.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if not pcall(function() axiosHub2026.Parent = coreGui end) then
  axiosHub2026.Parent = playerGui
end
local notifHolder = Instance.new("Frame")
notifHolder.Name = "NotifHolder"
notifHolder.Size = UDim2.new(0, touchEnabled and 260 or 300, 1, -20)
notifHolder.Position = UDim2.new(1, -(touchEnabled and 272 or 312), 0, 10)
notifHolder.BackgroundTransparency = 1
notifHolder.ZIndex = 9999999
notifHolder.Parent = axiosHub2026
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 8)

local function f9()
  local keyInfo = _G.KeyInfo
  local expiresAt = keyInfo and keyInfo.expires_at
  if not keyInfo or keyInfo and keyInfo.is_admin or not expiresAt then
    return
  end
  local axiosKeyTimer = Instance.new("ScreenGui")
  axiosKeyTimer.Name = "AxiosKeyTimer"
  axiosKeyTimer.ResetOnSpawn = false
  axiosKeyTimer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  axiosKeyTimer.DisplayOrder = 999999
  if not pcall(function() axiosKeyTimer.Parent = coreGui end) then
    axiosKeyTimer.Parent = playerGui
  end
  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, touchEnabled and 180 or 220, 0, 36)
  frame.Position = UDim2.new(1, -(touchEnabled and 192 or 232), 0, 10)
  frame.BackgroundColor3 = v1.COLORS.Surface
  frame.BackgroundTransparency = 0.15
  frame.BorderSizePixel = 0
  frame.Parent = axiosKeyTimer
  f4(frame, 10)
  local v17 = f1(frame, v1.COLORS.Border, 1)
  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(0, 8, 0, 8)
  frame2.Position = UDim2.new(0, 12, 0.5, -4)
  frame2.BackgroundColor3 = v1.COLORS.Success
  frame2.BorderSizePixel = 0
  frame2.Parent = frame
  f4(frame2, 4)
  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, -30, 1, 0)
  textLabel.Position = UDim2.new(0, 28, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Key: --:--:--"
  textLabel.TextColor3 = v1.COLORS.Success
  textLabel.TextSize = touchEnabled and 11 or 12
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextXAlignment = Enum.TextXAlignment.Left
  textLabel.Parent = frame
  task.spawn(function()
    local success, color
    while true do
      local v18 = expiresAt - os.time()
      if v18 <= 0 then
        textLabel.Text = "KEY EXPIRED"
        textLabel.TextColor3 = v1.COLORS.Error
        frame2.BackgroundColor3 = v1.COLORS.Error
        v17.Color = v1.COLORS.Error
        task.wait(3)
        pcall(function()
          localPlayer:Kick("\n\n Axios Hub — Key Expired\n\nYour key has expired.\nPlease get a new key at axioshub.store\n")
        end)
        break
      end
      textLabel.Text = "Key: " .. f6(v18)
      if v18 > 3600 then
        success = v1.COLORS.Success
        color = Color3.fromRGB(42, 90, 60)
      elseif v18 > 600 then
        success = v1.COLORS.Warn
        color = Color3.fromRGB(80, 70, 30)
      else
        success = v1.COLORS.Error
        color = Color3.fromRGB(80, 30, 30)
        if v18 <= 60 then
          frame.BackgroundTransparency = 0.1 + 0.2 * math.abs(math.sin(tick() * 2))
        end
      end
      textLabel.TextColor3 = success
      frame2.BackgroundColor3 = success
      v17.Color = color
      task.wait(1)
    end
  end)
end

uiListLayout.Parent = notifHolder

local function f10(text2, p12)
  if #v6 >= 5 then
    table.remove(v6, 1)
  end
  local success2 = p12 == "ok" and v1.COLORS.Success or p12 == "err" and v1.COLORS.Error or p12 == "warn" and v1.COLORS.Warn
    or v1.COLORS.Info
  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, 0, 0, 0)
  frame3.BackgroundColor3 = v1.COLORS.Surface
  frame3.BorderSizePixel = 0
  frame3.LayoutOrder = os.clock() * 1000
  frame3.ClipsDescendants = true
  frame3.ZIndex = 9999999
  frame3.Parent = notifHolder
  f4(frame3, 10)
  local v19 = f1(frame3, success2, 1)
  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(0, 7, 0, 7)
  frame4.Position = UDim2.new(0, 12, 0.5, -3)
  frame4.BackgroundColor3 = success2
  frame4.BorderSizePixel = 0
  frame4.ZIndex = 9999999
  frame4.Parent = frame3
  f4(frame4, 4)
  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(1, -32, 1, 0)
  textLabel2.Position = UDim2.new(0, 27, 0, 0)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = text2
  textLabel2.TextColor3 = v1.COLORS.Text
  textLabel2.TextSize = touchEnabled and 11 or 13
  textLabel2.Font = Enum.Font.Gotham
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.TextWrapped = true
  textLabel2.TextYAlignment = Enum.TextYAlignment.Center
  textLabel2.ZIndex = 9999999
  textLabel2.Parent = frame3
  table.insert(v6, frame3)
  f5(frame3, { Size = UDim2.new(1, 0, 0, 48) }, 0.25)
  task.delay(3.5, function()
    if frame3 and frame3.Parent then
      f5(frame3, { Size = UDim2.new(1, 0, 0, 0) }, 0.25)
      f5(textLabel2, { TextTransparency = 1 }, 0.2)
      f5(v19, { Transparency = 1 }, 0.2)
      task.wait(0.3)
      for index2, value2 in ipairs(v6) do
        if value2 == frame3 then
          table.remove(v6, index2)
          break
        end
      end
      frame3:Destroy()
    end
  end)
end

local v20 = touchEnabled and math.min(workspace.CurrentCamera.ViewportSize.X - 24, 380) or 460
local v21 = touchEnabled and 530 or 590
local frame5 = Instance.new("Frame")
frame5.Size = UDim2.new(1, 0, 1, 0)
frame5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame5.BackgroundTransparency = 0.45
frame5.BorderSizePixel = 0
frame5.ZIndex = 999990
frame5.Parent = axiosHub2026
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, v20, 0, v21)
mainFrame.Position = UDim2.new(0.5, -v20 / 2, 0.5, -v21 / 2)
mainFrame.BackgroundColor3 = v1.COLORS.BG
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 999995
mainFrame.Parent = axiosHub2026
f4(mainFrame, 16)
f1(mainFrame, v1.COLORS.Border, 1)
local v22 = touchEnabled and 52 or 58
local frame6 = Instance.new("Frame")
frame6.Size = UDim2.new(1, 0, 0, v22)
frame6.BackgroundColor3 = v1.COLORS.Surface
frame6.BorderSizePixel = 0
frame6.ZIndex = 999996
frame6.Parent = mainFrame
f4(frame6, 16)
local frame7 = Instance.new("Frame")
frame7.Size = UDim2.new(1, 0, 0, 16)
frame7.Position = UDim2.new(0, 0, 1, -16)
frame7.BackgroundColor3 = v1.COLORS.Surface
frame7.BorderSizePixel = 0
frame7.ZIndex = 999996
frame7.Parent = frame6
local frame8 = Instance.new("Frame")
frame8.Size = UDim2.new(1, 0, 0, 1)
frame8.Position = UDim2.new(0, 0, 1, 0)
frame8.BackgroundColor3 = v1.COLORS.Border
frame8.BorderSizePixel = 0
frame8.ZIndex = 999996
frame8.Parent = frame6
local frame9 = Instance.new("Frame")
frame9.Size = UDim2.new(0, 32, 0, 32)
frame9.Position = UDim2.new(0, 14, 0.5, -16)
frame9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame9.BorderSizePixel = 0
frame9.ZIndex = 999997
frame9.Parent = frame6
f4(frame9, 8)
local textLabel3 = Instance.new("TextLabel")
textLabel3.Size = UDim2.new(1, 0, 1, 0)
textLabel3.BackgroundTransparency = 1
textLabel3.Text = "A"
textLabel3.TextColor3 = Color3.fromRGB(0, 0, 0)
textLabel3.TextSize = 18
textLabel3.Font = Enum.Font.GothamBold
textLabel3.ZIndex = 999997
textLabel3.Parent = frame9
local textLabel4 = Instance.new("TextLabel")
textLabel4.Size = UDim2.new(0, 160, 0, 22)
textLabel4.Position = UDim2.new(0, 54, 0.5, -18)
textLabel4.BackgroundTransparency = 1
textLabel4.Text = "AXIOS HUB"
textLabel4.TextColor3 = v1.COLORS.Text
textLabel4.TextSize = touchEnabled and 14 or 15
textLabel4.Font = Enum.Font.GothamBold
textLabel4.TextXAlignment = Enum.TextXAlignment.Left
textLabel4.ZIndex = 999997
textLabel4.Parent = frame6
local textLabel5 = Instance.new("TextLabel")
textLabel5.Size = UDim2.new(0, 160, 0, 16)
textLabel5.Position = UDim2.new(0, 54, 0.5, 2)
textLabel5.BackgroundTransparency = 1
textLabel5.Text = "Script Loader v2026"
textLabel5.TextColor3 = v1.COLORS.Muted
textLabel5.TextSize = touchEnabled and 10 or 11
textLabel5.Font = Enum.Font.Gotham
textLabel5.TextXAlignment = Enum.TextXAlignment.Left
textLabel5.ZIndex = 999997
textLabel5.Parent = frame6
local frame10 = Instance.new("Frame")
frame10.Size = UDim2.new(0, 60, 0, 22)
frame10.Position = UDim2.new(1, -72 - v22, 0.5, -11)
frame10.BackgroundColor3 = Color3.fromRGB(26, 58, 38)
frame10.BorderSizePixel = 0
frame10.ZIndex = 999997
frame10.Parent = frame6
f4(frame10, 11)
f1(frame10, Color3.fromRGB(42, 90, 60), 1)
local textLabel6 = Instance.new("TextLabel")
textLabel6.Size = UDim2.new(1, 0, 1, 0)
textLabel6.BackgroundTransparency = 1
textLabel6.Text = "Online"
textLabel6.TextColor3 = v1.COLORS.Success
textLabel6.TextSize = 10
textLabel6.Font = Enum.Font.GothamBold
textLabel6.ZIndex = 999997
textLabel6.Parent = frame10
local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(0, v22, 0, v22)
textButton.Position = UDim2.new(1, -v22, 0, 0)
textButton.BackgroundColor3 = v1.COLORS.Surface
textButton.BorderSizePixel = 0
textButton.Text = "X"
textButton.TextColor3 = v1.COLORS.Muted
textButton.TextSize = 14
textButton.Font = Enum.Font.GothamBold
textButton.ZIndex = 999998
textButton.Parent = frame6
f4(textButton, 16)
local frame11 = Instance.new("Frame")
frame11.Size = UDim2.new(0, 16, 1, 0)
frame11.BackgroundColor3 = v1.COLORS.Surface
frame11.BorderSizePixel = 0
frame11.ZIndex = 999997
frame11.Parent = textButton
local frame12 = Instance.new("Frame")
frame12.Size = UDim2.new(0, 1, 1, 0)
frame12.BackgroundColor3 = v1.COLORS.Border
frame12.BorderSizePixel = 0
frame12.ZIndex = 999998
frame12.Parent = textButton
textButton.MouseEnter:Connect(function() f5(textButton, { TextColor3 = v1.COLORS.Text }) end)
textButton.MouseLeave:Connect(function() f5(textButton, { TextColor3 = v1.COLORS.Muted }) end)
textButton.MouseButton1Click:Connect(function() axiosHub2026:Destroy() end)
local v23 = v22 + 14
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -v23)
scrollingFrame.Position = UDim2.new(0, 0, 0, v23)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 0
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.ZIndex = 999995
scrollingFrame.Parent = mainFrame
local uiPadding = Instance.new("UIPadding")
uiPadding.PaddingLeft = UDim.new(0, 14)
uiPadding.PaddingRight = UDim.new(0, 14)
uiPadding.PaddingTop = UDim.new(0, 8)
uiPadding.PaddingBottom = UDim.new(0, 16)
uiPadding.Parent = scrollingFrame
local uiListLayout2 = Instance.new("UIListLayout")
uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout2.Padding = UDim.new(0, 10)
uiListLayout2.Parent = scrollingFrame
local frame13 = Instance.new("Frame")
frame13.Size = UDim2.new(1, 0, 0, 58)
frame13.BackgroundColor3 = v1.COLORS.Surface
frame13.BorderSizePixel = 0
frame13.LayoutOrder = 1
frame13.ZIndex = 999995
frame13.Parent = scrollingFrame
f4(frame13, 12)
f1(frame13, v1.COLORS.Border, 1)
local uiPadding2 = Instance.new("UIPadding")
uiPadding2.PaddingLeft = UDim.new(0, 12)
uiPadding2.PaddingRight = UDim.new(0, 12)
uiPadding2.Parent = frame13
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0, 42, 0, 42)
imageLabel.Position = UDim2.new(0, 0, 0.5, -21)
imageLabel.BackgroundColor3 = v1.COLORS.Card
imageLabel.BorderSizePixel = 0
imageLabel.Image = ""
imageLabel.ScaleType = Enum.ScaleType.Crop
imageLabel.ZIndex = 999995
imageLabel.Parent = frame13
f4(imageLabel, 10)
f1(imageLabel, v1.COLORS.Border, 1)
local textLabel7 = Instance.new("TextLabel")
textLabel7.Size = UDim2.new(1, 0, 1, 0)
textLabel7.BackgroundTransparency = 1
textLabel7.Text = "?"
textLabel7.TextSize = 20
textLabel7.Font = Enum.Font.GothamBold
textLabel7.TextColor3 = v1.COLORS.Muted
textLabel7.ZIndex = 999995
textLabel7.Parent = imageLabel
local textLabel8 = Instance.new("TextLabel")
textLabel8.Size = UDim2.new(1, -140, 0, 22)
textLabel8.Position = UDim2.new(0, 56, 0.5, -20)
textLabel8.BackgroundTransparency = 1
textLabel8.Text = "Detecting..."
textLabel8.TextColor3 = v1.COLORS.Text
textLabel8.TextSize = touchEnabled and 13 or 14
textLabel8.Font = Enum.Font.GothamBold
textLabel8.TextXAlignment = Enum.TextXAlignment.Left
textLabel8.ZIndex = 999995
textLabel8.Parent = frame13
local textLabel9 = Instance.new("TextLabel")
textLabel9.Size = UDim2.new(1, -140, 0, 16)
textLabel9.Position = UDim2.new(0, 56, 0.5, 4)
textLabel9.BackgroundTransparency = 1
textLabel9.Text = "Scanning..."
textLabel9.TextColor3 = v1.COLORS.Muted
textLabel9.TextSize = 11
textLabel9.Font = Enum.Font.Gotham
textLabel9.TextXAlignment = Enum.TextXAlignment.Left
textLabel9.ZIndex = 999995
textLabel9.Parent = frame13
local frame14 = Instance.new("Frame")
frame14.Size = UDim2.new(0, 82, 0, 24)
frame14.Position = UDim2.new(1, -82, 0.5, -12)
frame14.BackgroundColor3 = v1.COLORS.Card
frame14.BorderSizePixel = 0
frame14.ZIndex = 999996
frame14.Parent = frame13
f4(frame14, 12)
local v24 = f1(frame14, v1.COLORS.Border, 1)
local textLabel10 = Instance.new("TextLabel")
textLabel10.Size = UDim2.new(1, 0, 1, 0)
textLabel10.BackgroundTransparency = 1
textLabel10.Text = "Scanning..."
textLabel10.TextColor3 = v1.COLORS.Muted
textLabel10.TextSize = 10
textLabel10.Font = Enum.Font.GothamBold
textLabel10.ZIndex = 999996
textLabel10.Parent = frame14
local frame15 = Instance.new("Frame")
frame15.Size = UDim2.new(1, 0, 0, 38)
frame15.BackgroundColor3 = v1.COLORS.Surface
frame15.BorderSizePixel = 0
frame15.LayoutOrder = 2
frame15.ZIndex = 999995
frame15.Parent = scrollingFrame
f4(frame15, 10)
f1(frame15, v1.COLORS.Border, 1)
local uiPadding3 = Instance.new("UIPadding")
uiPadding3.PaddingLeft = UDim.new(0, 4)
uiPadding3.PaddingRight = UDim.new(0, 4)
uiPadding3.PaddingTop = UDim.new(0, 4)
uiPadding3.PaddingBottom = UDim.new(0, 4)
uiPadding3.Parent = frame15
local uiListLayout3 = Instance.new("UIListLayout")
uiListLayout3.FillDirection = Enum.FillDirection.Horizontal
uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout3.Padding = UDim.new(0, 4)
uiListLayout3.Parent = frame15

local function f11(text3, layoutOrder)
  local textButton2 = Instance.new("TextButton")
  textButton2.Size = UDim2.new(0.5, -2, 1, 0)
  textButton2.BackgroundColor3 = v1.COLORS.Surface
  textButton2.BorderSizePixel = 0
  textButton2.Text = text3
  textButton2.TextColor3 = v1.COLORS.Muted
  textButton2.TextSize = touchEnabled and 11 or 12
  textButton2.Font = Enum.Font.GothamBold
  textButton2.LayoutOrder = layoutOrder
  textButton2.ZIndex = 999996
  textButton2.Parent = frame15
  f4(textButton2, 7)
  return textButton2
end

local v25 = f11("Load Script", 1)
local v26 = f11("Games", 2)
local frame16 = Instance.new("Frame")
frame16.Size = UDim2.new(1, 0, 0, 0)
frame16.AutomaticSize = Enum.AutomaticSize.Y
frame16.BackgroundTransparency = 1
frame16.BorderSizePixel = 0
frame16.LayoutOrder = 3
frame16.ZIndex = 999995
frame16.Parent = scrollingFrame
local uiListLayout4 = Instance.new("UIListLayout")
uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout4.Padding = UDim.new(0, 10)
uiListLayout4.Parent = frame16
local frame17 = Instance.new("Frame")
frame17.Size = UDim2.new(1, 0, 0, touchEnabled and 130 or 150)
frame17.BackgroundColor3 = v1.COLORS.Card
frame17.BorderSizePixel = 0
frame17.ClipsDescendants = true
frame17.LayoutOrder = 1
frame17.ZIndex = 999995
frame17.Parent = frame16
f4(frame17, 12)
f1(frame17, v1.COLORS.Border, 1)
local imageLabel2 = Instance.new("ImageLabel")
imageLabel2.Size = UDim2.new(1, 0, 1, 0)
imageLabel2.BackgroundTransparency = 1
imageLabel2.ScaleType = Enum.ScaleType.Crop
imageLabel2.Image = ""
imageLabel2.ZIndex = 999995
imageLabel2.Parent = frame17
local frame18 = Instance.new("Frame")
frame18.Size = UDim2.new(1, 0, 0.55, 0)
frame18.Position = UDim2.new(0, 0, 0.45, 0)
frame18.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame18.BackgroundTransparency = 0.05
frame18.BorderSizePixel = 0
frame18.ZIndex = 999996
frame18.Parent = frame17
local uiGradient = Instance.new("UIGradient")
uiGradient.Rotation = 90
uiGradient.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
uiGradient.Parent = frame18
local textLabel11 = Instance.new("TextLabel")
textLabel11.Size = UDim2.new(1, -16, 0, 26)
textLabel11.Position = UDim2.new(0, 14, 1, -46)
textLabel11.BackgroundTransparency = 1
textLabel11.Text = "Detecting game..."
textLabel11.TextColor3 = v1.COLORS.Text
textLabel11.TextSize = touchEnabled and 15 or 17
textLabel11.Font = Enum.Font.GothamBold
textLabel11.TextXAlignment = Enum.TextXAlignment.Left
textLabel11.ZIndex = 999997
textLabel11.Parent = frame17
local textLabel12 = Instance.new("TextLabel")
textLabel12.Size = UDim2.new(1, -16, 0, 16)
textLabel12.Position = UDim2.new(0, 14, 1, -22)
textLabel12.BackgroundTransparency = 1
textLabel12.Text = ""
textLabel12.TextColor3 = Color3.fromRGB(170, 170, 170)
textLabel12.TextSize = 11
textLabel12.Font = Enum.Font.Gotham
textLabel12.TextXAlignment = Enum.TextXAlignment.Left
textLabel12.ZIndex = 999997
textLabel12.Parent = frame17
local frame19 = Instance.new("Frame")
frame19.Size = UDim2.new(1, 0, 0, 0)
frame19.AutomaticSize = Enum.AutomaticSize.Y
frame19.BackgroundColor3 = v1.COLORS.Surface
frame19.BorderSizePixel = 0
frame19.LayoutOrder = 2
frame19.ZIndex = 999995
frame19.Parent = frame16
f4(frame19, 12)
f1(frame19, v1.COLORS.Border, 1)
local uiPadding4 = Instance.new("UIPadding")
uiPadding4.PaddingLeft = UDim.new(0, 14)
uiPadding4.PaddingRight = UDim.new(0, 14)
uiPadding4.PaddingTop = UDim.new(0, 14)
uiPadding4.PaddingBottom = UDim.new(0, 14)
uiPadding4.Parent = frame19
local uiListLayout5 = Instance.new("UIListLayout")
uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout5.Padding = UDim.new(0, 10)
uiListLayout5.Parent = frame19
local textLabel13 = Instance.new("TextLabel")
textLabel13.Size = UDim2.new(1, 0, 0, 14)
textLabel13.BackgroundTransparency = 1
textLabel13.Text = "LICENSE KEY"
textLabel13.TextColor3 = v1.COLORS.Muted
textLabel13.TextSize = 10
textLabel13.Font = Enum.Font.GothamBold
textLabel13.TextXAlignment = Enum.TextXAlignment.Left
textLabel13.LayoutOrder = 1
textLabel13.ZIndex = 999995
textLabel13.Parent = frame19
local v27 = touchEnabled and 40 or 44
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, 0, 0, v27)
textBox.BackgroundColor3 = v1.COLORS.Card
textBox.BorderSizePixel = 0
textBox.PlaceholderText = "AXIO-XXXX-XXXX-XXXX"
textBox.PlaceholderColor3 = v1.COLORS.Muted
textBox.Text = ""
textBox.TextColor3 = v1.COLORS.Text
textBox.TextSize = touchEnabled and 12 or 13
textBox.Font = Enum.Font.Code
textBox.ClearTextOnFocus = false
textBox.LayoutOrder = 2
textBox.ZIndex = 999995
textBox.Parent = frame19
f4(textBox, 10)
local v28 = f1(textBox, v1.COLORS.Border, 1)
local uiPadding5 = Instance.new("UIPadding")
uiPadding5.PaddingLeft = UDim.new(0, 12)
uiPadding5.Parent = textBox
textBox:GetPropertyChangedSignal("Text"):Connect(function() text = textBox.Text end)
textBox.Focused:Connect(function()
  f5(textBox, { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
  v28.Color = Color3.fromRGB(80, 80, 80)
end)
textBox.FocusLost:Connect(function()
  f5(textBox, { BackgroundColor3 = v1.COLORS.Card })
  v28.Color = v1.COLORS.Border
end)
local frame20 = Instance.new("Frame")
frame20.Size = UDim2.new(1, 0, 0, v27)
frame20.BackgroundTransparency = 1
frame20.BorderSizePixel = 0
frame20.LayoutOrder = 3
frame20.ZIndex = 999995
frame20.Parent = frame19
local uiListLayout6 = Instance.new("UIListLayout")
uiListLayout6.FillDirection = Enum.FillDirection.Horizontal
uiListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout6.Padding = UDim.new(0, 10)
uiListLayout6.Parent = frame20
local textButton3 = Instance.new("TextButton")
textButton3.Size = UDim2.new(0.38, 0, 1, 0)
textButton3.BackgroundColor3 = v1.COLORS.Card
textButton3.BorderSizePixel = 0
textButton3.Text = "Get Key"
textButton3.TextColor3 = Color3.fromRGB(180, 180, 180)
textButton3.TextSize = touchEnabled and 11 or 12
textButton3.Font = Enum.Font.GothamBold
textButton3.LayoutOrder = 1
textButton3.ZIndex = 999995
textButton3.Parent = frame20
f4(textButton3, 10)
f1(textButton3, v1.COLORS.Border, 1)
local textButton4 = Instance.new("TextButton")
textButton4.Size = UDim2.new(0.62, -10, 1, 0)
textButton4.BackgroundColor3 = v1.COLORS.Accent
textButton4.BorderSizePixel = 0
textButton4.Text = "Load Script"
textButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
textButton4.TextSize = touchEnabled and 12 or 13
textButton4.Font = Enum.Font.GothamBold
textButton4.LayoutOrder = 2
textButton4.ZIndex = 999995
textButton4.Parent = frame20
f4(textButton4, 10)
local textLabel14 = Instance.new("TextLabel")
textLabel14.Size = UDim2.new(1, 0, 0, 32)
textLabel14.BackgroundColor3 = Color3.fromRGB(40, 28, 8)
textLabel14.BorderSizePixel = 0
textLabel14.Text = "Purchase Only — buy at axioshub.store"
textLabel14.TextColor3 = v1.COLORS.Warn
textLabel14.TextSize = touchEnabled and 10 or 11
textLabel14.Font = Enum.Font.GothamBold
textLabel14.Visible = false
textLabel14.LayoutOrder = 4
textLabel14.ZIndex = 999995
textLabel14.Parent = frame19
f4(textLabel14, 8)
f1(textLabel14, Color3.fromRGB(80, 60, 20), 1)
local frame21 = Instance.new("Frame")
frame21.Size = UDim2.new(1, 0, 0, 3)
frame21.BackgroundColor3 = v1.COLORS.Border
frame21.BorderSizePixel = 0
frame21.LayoutOrder = 5
frame21.Visible = false
frame21.ZIndex = 999995
frame21.Parent = frame19
f4(frame21, 2)
local frame22 = Instance.new("Frame")
frame22.Size = UDim2.new(1, 0, 1, 0)
frame22.BackgroundColor3 = v1.COLORS.Success
frame22.BorderSizePixel = 0
frame22.ZIndex = 999996
frame22.Parent = frame21
f4(frame22, 2)
local frame23 = Instance.new("Frame")
frame23.Size = UDim2.new(1, 0, 0, 0)
frame23.AutomaticSize = Enum.AutomaticSize.Y
frame23.BackgroundTransparency = 1
frame23.BorderSizePixel = 0
frame23.LayoutOrder = 3
frame23.Visible = false
frame23.ZIndex = 999995
frame23.Parent = scrollingFrame
local frame24 = Instance.new("Frame")
frame24.Size = UDim2.new(1, 0, 0, 0)
frame24.AutomaticSize = Enum.AutomaticSize.Y
frame24.BackgroundTransparency = 1
frame24.BorderSizePixel = 0
frame24.ZIndex = 999995
frame24.Parent = frame23
local uiGridLayout = Instance.new("UIGridLayout")
uiGridLayout.CellSize = UDim2.new(0.5, -5, 0, touchEnabled and 60 or 66)
uiGridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiGridLayout.Parent = frame24
local v29 = v2[game.GameId]
for index3, value3 in ipairs(v3) do
  local v30 = value3.mapId == v29
  local v31 = touchEnabled and 38 or 44
  local frame25 = Instance.new("Frame")
  frame25.BackgroundColor3 = v30 and v1.COLORS.Card or Color3.fromRGB(14, 14, 14)
  frame25.BorderSizePixel = 0
  frame25.LayoutOrder = index3
  frame25.ZIndex = 999995
  frame25.Parent = frame24
  f4(frame25, 10)
  local v32 = f1(frame25, v30 and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(28, 28, 28), 1)
  local imageLabel3 = Instance.new("ImageLabel")
  imageLabel3.Size = UDim2.new(0, v31, 0, v31)
  imageLabel3.Position = UDim2.new(0, 10, 0.5, -v31 / 2)
  imageLabel3.BackgroundColor3 = v1.COLORS.Card
  imageLabel3.BorderSizePixel = 0
  imageLabel3.Image = value3.textureId
  imageLabel3.ScaleType = Enum.ScaleType.Crop
  imageLabel3.ImageTransparency = v30 and 0 or 0.6
  imageLabel3.ZIndex = 999996
  imageLabel3.Parent = frame25
  f4(imageLabel3, 8)
  if not v30 then
    local frame26 = Instance.new("Frame")
    frame26.Size = UDim2.new(1, 0, 1, 0)
    frame26.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame26.BackgroundTransparency = 0.35
    frame26.BorderSizePixel = 0
    frame26.ZIndex = 999997
    frame26.Parent = imageLabel3
    f4(frame26, 8)
    local textLabel15 = Instance.new("TextLabel")
    textLabel15.Size = UDim2.new(1, 0, 1, 0)
    textLabel15.BackgroundTransparency = 1
    textLabel15.Text = "LOCK"
    textLabel15.TextColor3 = Color3.fromRGB(100, 100, 100)
    textLabel15.TextSize = 9
    textLabel15.Font = Enum.Font.GothamBold
    textLabel15.ZIndex = 999998
    textLabel15.Parent = imageLabel3
  end
  local textLabel16 = Instance.new("TextLabel")
  textLabel16.Size = UDim2.new(1, -(touchEnabled and 58 or 66), 1, 0)
  textLabel16.Position = UDim2.new(0, touchEnabled and 54 or 62, 0, 0)
  textLabel16.BackgroundTransparency = 1
  textLabel16.Text = value3.name
  textLabel16.TextColor3 = v30 and v1.COLORS.Text or Color3.fromRGB(50, 50, 50)
  textLabel16.TextSize = touchEnabled and 10 or 11
  textLabel16.Font = Enum.Font.GothamBold
  textLabel16.TextXAlignment = Enum.TextXAlignment.Left
  textLabel16.TextWrapped = true
  textLabel16.TextYAlignment = Enum.TextYAlignment.Center
  textLabel16.ZIndex = 999996
  textLabel16.Parent = frame25
  local textButton5 = Instance.new("TextButton")
  textButton5.Size = UDim2.new(1, 0, 1, 0)
  textButton5.BackgroundTransparency = 1
  textButton5.Text = ""
  textButton5.ZIndex = 999997
  textButton5.Parent = frame25
  if v30 then
    textButton5.MouseEnter:Connect(function()
      f5(frame25, { BackgroundColor3 = Color3.fromRGB(32, 32, 32) })
      v32.Color = Color3.fromRGB(100, 100, 100)
    end)
    textButton5.MouseLeave:Connect(function()
      f5(frame25, { BackgroundColor3 = v1.COLORS.Card })
      v32.Color = Color3.fromRGB(60, 60, 60)
    end)
    textButton5.MouseButton1Click:Connect(function() switchToTab("load") end)
  else
    textButton5.MouseButton1Click:Connect(function() f10("Not available in this game", "err") end)
  end
end
task.wait()
frame24.Size = UDim2.new(1, 0, 0, math.ceil(#v3 / 2) * (touchEnabled and 70 or 76))

function switchToTab(p13)
  if p13 == "load" then
    frame16.Visible = true
    frame23.Visible = false
    v25.BackgroundColor3 = v1.COLORS.Card
    v25.TextColor3 = v1.COLORS.Text
    v26.BackgroundColor3 = v1.COLORS.Surface
    v26.TextColor3 = v1.COLORS.Muted
  else
    frame16.Visible = false
    frame23.Visible = true
    v26.BackgroundColor3 = v1.COLORS.Card
    v26.TextColor3 = v1.COLORS.Text
    v25.BackgroundColor3 = v1.COLORS.Surface
    v25.TextColor3 = v1.COLORS.Muted
  end
end

v25.MouseButton1Click:Connect(function() switchToTab("load") end)
v26.MouseButton1Click:Connect(function() switchToTab("games") end)
switchToTab("load")

local function f12(p14)
  if not p14 then
    return
  end
  textButton3.Visible = false
  textButton4.Size = UDim2.new(1, 0, 1, 0)
  textLabel14.Visible = true
  textLabel13.Text = "LICENSE KEY  (Purchase Only)"
  textLabel13.TextColor3 = v1.COLORS.Warn
end

textButton3.MouseEnter:Connect(function() f5(textButton3, { BackgroundColor3 = Color3.fromRGB(35, 35, 35) }) end)
textButton3.MouseLeave:Connect(function() f5(textButton3, { BackgroundColor3 = v1.COLORS.Card }) end)
textButton3.MouseButton1Click:Connect(function()
  pcall(function() setclipboard(v1.KEY_LINK) end)
  f10("Key link copied to clipboard!", "info")
end)
textButton4.MouseEnter:Connect(function()
  if not v4 then
    f5(textButton4, { BackgroundColor3 = Color3.fromRGB(220, 220, 220) })
  end
end)
textButton4.MouseLeave:Connect(function()
  if not v4 then
    f5(textButton4, { BackgroundColor3 = v1.COLORS.Accent })
  end
end)
local connect

local function f13()
  if connect then
    connect:Disconnect()
  end
  frame21.Visible = true
  local v33 = tick()
  connect = runService.Heartbeat:Connect(function()
    local v34 = tick()
    local v35 = math.max(0, 1 - (v34 - v33) / v1.LOAD_COOLDOWN)
    frame22.Size = UDim2.new(v35, 0, 1, 0)
    if v35 <= 0 then
      connect:Disconnect()
      frame21.Visible = false
    end
  end)
end

local f14

local function f15(p15)
  local v36, v37 = pcall(function() loadstring(p15)() end)
  if v36 then
    f10("Script loaded!", "ok")
    f9()
    task.wait(1)
    axiosHub2026:Destroy()
  else
    f14(false)
    f10("Execution failed", "err")
    warn("Axios Hub — Script Error:", v37)
  end
end

function f14(p16)
  v4 = p16
  textButton4.Active = not p16
  if p16 then
    textButton4.Text = "Verifying..."
    textButton4.TextColor3 = v1.COLORS.LoadingFG
    textButton4.BackgroundColor3 = v1.COLORS.LoadingBG
  else
    textButton4.Text = "Load Script"
    textButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
    textButton4.BackgroundColor3 = v1.COLORS.Accent
  end
end

local v38
textButton4.MouseButton1Click:Connect(function()
  local v39 = tick()
  if v4 then
    f10("Already loading...", "err")
  elseif v39 - v5 < v1.LOAD_COOLDOWN then
    f10("Wait " .. math.ceil(v1.LOAD_COOLDOWN - (v39 - v5)) .. "s before retrying", "err")
  elseif not text or text == "" then
    f10("Enter your key first", "err")
  else
    if not v38 then
      f10("No game detected", "err")
      return
    end
    f14(true)
    v5 = tick()
    f13()
    f10("Verifying key...", "info")
    task.spawn(function()
      local getClientId = rbxAnalyticsService:GetClientId()
      local generateGUID = httpService:GenerateGUID(false)
      local v40 = string.format(
        "%s/check_key?key=%s&hwid=%s&map_id=%s&checksum=%s&username=%s", v1.API_URL, f2(text), f2(tostring(getClientId)), f2(v38.mapId),
        f2(generateGUID), f2(localPlayer.Name)
      )
      local v41, v42 = pcall(function() return game:HttpGet(v40) end)
      if not v41 then
        f14(false)
        f10("Connection failed", "err")
      else
        local v43, v44 = pcall(function() return httpService:JSONDecode(f3(v42)) end)
        if not v43 then
          f14(false)
          f10("Invalid server response", "err")
          return
        end
        if v44.status == "success" and v44.data and v44.data.script then
          f10("Loading script...", "ok")
          v8.Key = text
          v8.MapID = v38.mapId
          v8.KeyInfo = v44.data
          task.wait(0.3)
          f15(v44.data.script)
        else
          f14(false)
          f10(v44.message or "Invalid key", "err")
        end
      end
    end)
  end
end)
local v45, v46, position, position2
if not touchEnabled then
  v45 = nil
  v46 = nil
  position = nil
  position2 = nil
  frame6.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
      v45 = true
      position = input.Position
      position2 = mainFrame.Position
      input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
          v45 = false
        end
      end)
    end
  end)
  frame6.InputChanged:Connect(function(input2)
    if input2.UserInputType == Enum.UserInputType.MouseMovement then
      v46 = input2
    end
  end)
  userInputService.InputChanged:Connect(function(input3)
    if input3 == v46 and v45 then
      local v47 = input3.Position - position
      mainFrame.Position = UDim2.new(position2.X.Scale, position2.X.Offset + v47.X, position2.Y.Scale, position2.Y.Offset + v47.Y)
    end
  end)
end
f10("Axios Hub — Initializing...", "info")
v38 = f8()
if v38 then
  textLabel8.Text = v38.name
  textLabel9.Text = v38.mapId
  textLabel10.Text = "Detected"
  textLabel10.TextColor3 = v1.COLORS.Success
  frame14.BackgroundColor3 = Color3.fromRGB(26, 58, 38)
  v24.Color = Color3.fromRGB(42, 90, 60)
  if v38.textureId and v38.textureId ~= "" then
    imageLabel.Image = v38.textureId
    textLabel7.Visible = false
  else
    imageLabel.Image = ""
    textLabel7.Visible = true
  end
  imageLabel2.Image = v38.textureId
  textLabel11.Text = v38.name
  textLabel12.Text = v38.mapId
  f10("Detected: " .. v38.name, "ok")
  task.spawn(function()
    task.wait(0.4)
    if not v8.ForceDumper then
      f12((f7(v38.mapId)))
    end
    local key = v8.Key
    local v48, v49
    if key and key ~= "" then
      f10("_G.Key detected — verifying...", "info")
      f14(true)
      local getClientId2 = rbxAnalyticsService:GetClientId()
      local generateGUID2 = httpService:GenerateGUID(false)
      v48 = string.format(
        "%s/check_key?key=%s&hwid=%s&map_id=%s&checksum=%s&username=%s", v1.API_URL, f2(key), f2(tostring(getClientId2)), f2(v38.mapId),
        f2(generateGUID2), f2(localPlayer.Name)
      )
      local v50
      v50, v49 = pcall(function() return game:HttpGet(v48) end)
      if v50 and v49 then
        local v51, v52 = pcall(function() return httpService:JSONDecode(f3(v49)) end)
        if v51 and v52 and v52.status == "success" and v52.data and v52.data.script then
          f10("Key verified — loading script!", "ok")
          v8.Key = key
          v8.MapID = v38.mapId
          v8.KeyInfo = v52.data
          task.wait(0.3)
          f15(v52.data.script)
          return
        end
        f10((v51 and v52 and v52.message or "Key invalid") .. " — showing UI", "err")
        f14(false)
      else
        f10("Connection failed — showing UI", "err")
        f14(false)
      end
    end
    f10("Checking saved key...", "info")
    f14(true)
    local getClientId3 = rbxAnalyticsService:GetClientId()
    local generateGUID3 = httpService:GenerateGUID(false)
    local v53 = string.format(
      "%s/check_hwid?hwid=%s&map_id=%s&checksum=%s&username=%s", v1.API_URL, f2(tostring(getClientId3)), f2(v38.mapId), f2(generateGUID3),
      f2(localPlayer.Name)
    )
    local v54, v55 = pcall(function() return game:HttpGet(v53) end)
    if not v54 then
      f14(false)
    else
      local v56, v57 = pcall(function() return httpService:JSONDecode(f3(v55)) end)
      if not v56 then
        f14(false)
        return
      end
      if v57.status == "success" and v57.data and v57.data.script then
        f10("Saved key found — loading!", "ok")
        v8.Key = v57.data.key_value
        v8.MapID = v38.mapId
        v8.KeyInfo = v57.data
        task.wait(0.5)
        f15(v57.data.script)
      else
        local message = v57 and v57.message or "No saved key found"
        f14(false)
        f10(message, "err")
      end
    end
  end)
else
  textLabel8.Text = "Unsupported Game"
  textLabel9.Text = "Not available"
  textLabel10.Text = "Not Supported"
  textLabel10.TextColor3 = v1.COLORS.Error
  frame14.BackgroundColor3 = Color3.fromRGB(58, 26, 26)
  v24.Color = Color3.fromRGB(90, 42, 42)
  f10("Game not supported", "err")
end
print("[Axios Hub 2026] — Initialized")
