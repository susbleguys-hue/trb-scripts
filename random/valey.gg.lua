local players = game:GetService("Players")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")
local marketplaceService = game:GetService("MarketplaceService")
local userInputService = game:GetService("UserInputService")
local v1 = game:GetService("Workspace")
local proximityPromptService = game:GetService("ProximityPromptService")
local teleportService = game:GetService("TeleportService")
local httpService = game:GetService("HttpService")
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local themeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()
local saveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()
local options = library.Options
local toggles = library.Toggles

library.ForceCheckbox = false
library.ShowToggleFrameInKeybinds = true

local window = library:CreateWindow({
  Title = "Valley.gg Free",
  Footer = "",
  Icon = skull,
  NotifySide = "Right",
  ShowCustomCursor = false,
  Resizable = true,
  Size = UDim2.new(0, 600, 0, 450),
  MinimumSize = UDim2.new(0, 400, 0, 300),
})

local v2 = {
  Main = window:AddTab("Main", "star"),
  Combat = window:AddTab("Combat", "skull"),
  Misc = window:AddTab("Misc", "puzzle-piece"),
  AutoFarm = window:AddTab("AutoFarm", "tractor"),
  Players = window:AddTab("Players", "users"),
  Visuals = window:AddTab("Visuals", "cloud"),
  ["UI Settings"] = window:AddTab("UI Settings", "settings"),
}

local localPlayer = players.LocalPlayer
getgenv().SwimMethod = false

task.spawn(function()
  while task.wait() do
    if getgenv().SwimMethod then
      local humanoid = localPlayer.Character
        and localPlayer.Character:FindFirstChild("Humanoid")

      if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
      end
    end
  end
end)

local function f1()
  local profileSnowUI = Instance.new("ScreenGui")
  profileSnowUI.ResetOnSpawn = false
  profileSnowUI.IgnoreGuiInset = true
  profileSnowUI.Name = "ProfileSnowUI"
  profileSnowUI.Parent = localPlayer:WaitForChild("PlayerGui")

  local frame = Instance.new("Frame")
  frame.Size = UDim2.fromScale(1, 1)
  frame.BackgroundColor3 = Color3.new(0, 0, 0)
  frame.Parent = profileSnowUI

  local frame2 = Instance.new("Frame")
  frame2.BackgroundTransparency = 1
  frame2.Size = UDim2.fromScale(1, 1)
  frame2.Parent = frame

  local frame3 = Instance.new("Frame")
  frame3.BackgroundTransparency = 1
  frame3.Size = UDim2.fromScale(1, 1)
  frame3.Parent = frame

  local uiListLayout = Instance.new("UIListLayout")
  uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
  uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
  uiListLayout.Padding = UDim.new(0, 10)
  uiListLayout.Parent = frame3

  local avatar = Instance.new("ImageLabel")
  avatar.Name = "Avatar"
  avatar.BackgroundTransparency = 1
  avatar.Size = UDim2.fromOffset(120, 120)
  avatar.Image = ""
  avatar.Parent = frame3

  local uiCorner = Instance.new("UICorner")
  uiCorner.CornerRadius = UDim.new(1, 0)
  uiCorner.Parent = avatar

  local textLabel = Instance.new("TextLabel")
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Processing Money..."
  textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextSize = 22
  textLabel.Size = UDim2.fromOffset(520, 36)
  textLabel.Parent = frame3

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "Cooking and Cleaning"
  textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
  textLabel2.Font = Enum.Font.GothamBold
  textLabel2.TextSize = 20
  textLabel2.Size = UDim2.fromOffset(420, 30)
  textLabel2.Parent = frame3

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = "Wallet: $0"
  textLabel3.TextColor3 = Color3.fromRGB(200, 200, 200)
  textLabel3.Font = Enum.Font.Gotham
  textLabel3.TextSize = 18
  textLabel3.Size = UDim2.fromOffset(420, 28)
  textLabel3.Parent = frame3

  local textLabel4 = Instance.new("TextLabel")
  textLabel4.BackgroundTransparency = 1
  textLabel4.Text = "Dirty Money: $0"
  textLabel4.TextColor3 = Color3.fromRGB(200, 150, 150)
  textLabel4.Font = Enum.Font.Gotham
  textLabel4.TextSize = 18
  textLabel4.Size = UDim2.fromOffset(420, 28)
  textLabel4.Parent = frame3

  math.randomseed(tick() % 1 * 10000000)

  local function f2(p1, p2, p3)
    local frame4 = Instance.new("Frame")
    frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame4.BorderSizePixel = 0
    frame4.Size = UDim2.fromOffset(p3, p3)
    frame4.Position = UDim2.fromScale(p1, p2)
    frame4.Parent = frame
  end

  for i = 1, 160 do
    f2(math.random(), math.random(), math.random(1, 3))
  end

  local v3 = false

  local function f3()
    local frame5 = Instance.new("Frame")
    frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame5.BorderSizePixel = 0

    local v4 = math.random(2, 4)

    frame5.Size = UDim2.fromOffset(v4, v4)
    frame5.Position = UDim2.new(math.random(), 0, -0.05, 0)
    frame5.Parent = frame2

    local uiCorner2 = Instance.new("UICorner")
    uiCorner2.CornerRadius = UDim.new(1, 0)
    uiCorner2.Parent = frame5

    local v5 = math.random(5, 9)
    local v6 = math.random()
    local v7 = math.random()

    local create = tweenService:Create(frame5, TweenInfo.new(v5 + v6, Enum.EasingStyle.Linear), {
      Position = UDim2.new(
        math.clamp(frame5.Position.X.Scale + (v7 - 0.5) * 0.2, 0, 1), 0, 1.1, 0
      ),
    })

    create.Completed:Connect(function() frame5:Destroy() end)
    create:Play()
  end

  local function f4()
    if v3 then
      return
    end

    v3 = true

    task.spawn(function()
      while v3 do
        for j = 1, math.random(3, 6) do
          f3()
        end

        task.wait(0.25)
      end
    end)
  end

  local function f5()
    local value = 0
    local stored = localPlayer:FindFirstChild("stored")

    if stored then
      local money = stored:FindFirstChild("Money")

      if money and money:IsA("IntValue") then
        value = money.Value
      end
    end

    local value2 = 0

    if stored then
      local filthyStack = stored:FindFirstChild("FilthyStack")

      if filthyStack and filthyStack:IsA("IntValue") then
        value2 = filthyStack.Value
      end
    end

    local function f6(p4)
      return "$" .. tostring(tonumber(p4) or 0):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub(
        "^,", ""
      )
    end

    textLabel3.Text = "Wallet: " .. f6(value)
    textLabel4.Text = "Dirty Money: " .. f6(value2)
  end

  local function f7()
    local v8, v9 = pcall(function()
      return players:GetUserThumbnailAsync(
        localPlayer.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420
      )
    end)

    if v8 and v9 then
      avatar.Image = v9
    end
  end

  frame.BackgroundTransparency = 1

  for k = 1, 8 do
    frame.BackgroundTransparency = 1 - k / 8
    task.wait(0.02)
  end

  f7()
  f4()
  local connect

  if localPlayer:FindFirstChild("stored") then
    connect = localPlayer.stored.ChildAdded:Connect(f5)
    connect = localPlayer.stored.ChildRemoved:Connect(f5)
  end

  f5()

  local v10 = task.spawn(function()
    while profileSnowUI.Parent do
      f5()
      task.wait(1)
    end
  end)

  return profileSnowUI, function()
    if connect then
      connect:Disconnect()
    end

    task.cancel(v10)
    v3 = false
    profileSnowUI:Destroy()
  end
end

local function f8(p5)
  local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
  local humanoid2 = character:FindFirstChildOfClass("Humanoid")
  local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

  if humanoid2 and humanoidRootPart then
    getgenv().SwimMethod = true
    task.wait(1.5)
    humanoid2:ChangeState(Enum.HumanoidStateType.FallingDown)

    humanoidRootPart.Velocity = Vector3.zero
    humanoidRootPart.CFrame = CFrame.new(p5.X, p5.Y, p5.Z)

    task.wait(2)
    getgenv().SwimMethod = false
    humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
  end
end

local function f9(p6)
  local currentCamera = workspace.CurrentCamera

  local cframe = localPlayer.Character
      and localPlayer.Character:FindFirstChild("HumanoidRootPart")
      and localPlayer.Character.HumanoidRootPart.CFrame
    or CFrame.new(0, 0, 0)

  local v11

  for key, value3 in pairs(workspace:GetDescendants()) do
    if value3.Name == "CookPart" then
      v11 = value3
      break
    end
  end

  local proximityPrompt = v11 and v11:FindFirstChildWhichIsA("ProximityPrompt")
  local iceFruitSell = workspace:FindFirstChild("IceFruit Sell")

  if localPlayer:FindFirstChild("stored") then
    local value4 = localPlayer.stored:FindFirstChild("FilthyStack")
      and localPlayer.stored.FilthyStack.Value
  end

  local value5 = localPlayer:FindFirstChild("stored")
      and localPlayer.stored:FindFirstChild("Money") and localPlayer.stored.Money.Value
    or 0

  local function f10()
    local iceFruitSell2 = workspace:FindFirstChild("IceFruit Sell")

    if not iceFruitSell2 then
      warn("IceFruit Sell not found in workspace")
      return
    end

    for key2, value6 in pairs(iceFruitSell2:GetDescendants()) do
      if value6:IsA("ProximityPrompt") then
        value6.Enabled = true
        value6.HoldDuration = 0
        value6.RequiresLineOfSight = false
      end
    end
  end

  local v12 = not v11

  local function f11(p7, p8)
    local v13, v14 = pcall(function()
      return marketplaceService:UserOwnsGamePassAsync(p7.UserId, p8)
    end)

    return v13 and v14
  end

  local v15 = v12 or not proximityPrompt or not iceFruitSell
  local findFirstChild, f12, f13, v16, v17, v18, v19, v20, f14, proximityPrompt2, v21

  if v15 then
    warn("Missing required game objects. Script cannot continue.")
    return
  else
    f10()
    local v22 = { "Ice-Fruit Bag", "Ice-Fruit Cupz", "FijiWater", "FreshWater" }
    local v23 = true

    for index, value7 in ipairs(v22) do
      if not (localPlayer.Backpack:FindFirstChild(value7)
        or localPlayer.Character and localPlayer.Character:FindFirstChild(value7)) then
        v23 = false
        break
      end
    end

    if v23 then
      warn("You already have all required items.")
    elseif value5 < 2696 then
      warn("Insufficient funds to buy required tools")
      return
    else
      local function f15(p9)
        if not localPlayer.Backpack:FindFirstChild(p9)
          and not (localPlayer.Character and localPlayer.Character:FindFirstChild(p9)) then
          return (pcall(function()
            replicatedStorage:WaitForChild("ExoticShopRemote"):InvokeServer(p9)
          end))
        end

        return true
      end

      for index2, value8 in ipairs(v22) do
        local count = 0

        if not (localPlayer.Character and localPlayer.Character:FindFirstChild(value8)) then
          localPlayer.Backpack:FindFirstChild(value8)
        end

        repeat
          if not f15(value8) then
            warn("Failed to buy " .. value8)
            task.wait(1)
          end

          task.wait(0.4)
          count = count + 1
          local character2 = localPlayer.Character

          local findFirstChild2 = character2
          findFirstChild2 = character2 and localPlayer.Character:FindFirstChild(value8)

          findFirstChild = findFirstChild2

          findFirstChild = findFirstChild2 or localPlayer.Backpack:FindFirstChild(value8)
            or count > 5
        until findFirstChild
      end
    end

    function f14()
      if not v11 then
        return false
      else
        local fire1 = v11:FindFirstChild("Fire1")

        if not fire1 then
          return false
        else
          local particleEmitter = fire1:FindFirstChild("ParticleEmitter")

          if not particleEmitter then
            return false
          end

          return particleEmitter.Enabled
        end
      end
    end

    function f12()
      if not v11 then
        return false
      else
        local fire12 = v11:FindFirstChild("Fire1")

        if not fire12 then
          return false
        else
          local particleEmitter2 = fire12:FindFirstChild("ParticleEmitter")

          if not particleEmitter2 then
            return false
          end

          return not particleEmitter2.Enabled
        end
      end
    end

    function f13(p10)
      pcall(function()
        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
          localPlayer.Character.Humanoid:UnequipTools()
        end
      end)

      task.wait(0.5)
      local findFirstChild3

      if not proximityPrompt then
        return false
      else
        proximityPrompt.HoldDuration = 0
        local findFirstChild4 = localPlayer.Backpack:FindFirstChild(p10)

        if not findFirstChild4 then
          warn(p10 .. " not found in backpack")
          return false
        end

        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
          warn("Equipping " .. p10)
          localPlayer.Character.Humanoid:EquipTool(findFirstChild4)
          local total = 0

          if not localPlayer.Character:FindFirstChild(p10) then
          end

          repeat
            task.wait(0.1)
            total = total + 0.1

            if total > 5 then
              warn("Tool never equipped after 5 seconds")
              break
            end

            findFirstChild3 = localPlayer.Character:FindFirstChild(p10) or total > 5
          until findFirstChild3

          if v11 then
            f8(v11.CFrame.Position + Vector3.new(0, 3, 0))
          end

          for m = 1, 30 do
            task.wait(0.1)

            if currentCamera and proximityPrompt and proximityPrompt.Parent then
              currentCamera.CFrame = CFrame.new(
                currentCamera.CFrame.Position, proximityPrompt.Parent.Position
              )
            end

            pcall(function() fireproximityprompt(proximityPrompt) end)

            if not localPlayer.Character:FindFirstChild(p10)
              and not localPlayer.Backpack:FindFirstChild(p10) then
              warn("Tool used successfully: " .. p10)
              return true
            end

            if p10 == "FreshWater" and f14() then
              warn("Cooking has started after using " .. p10)
              return true
            end
          end

          warn("Failed to use tool after multiple attempts: " .. p10)
          return false
        end

        return false
      end
    end

    if proximityPrompt and proximityPrompt.Parent then
      f8(Vector3.new(-614, 356, -683))
      local v24 = 0

      if not proximityPrompt.Enabled then
      end

      repeat
        task.wait(0.4)

        if currentCamera and proximityPrompt and proximityPrompt.Parent then
          currentCamera.CFrame = CFrame.new(
            currentCamera.CFrame.Position, proximityPrompt.Parent.Position
          )
        end

        v24 = v24 + 0.2

        if v24 > 10 then
          warn("Prompt never became enabled after 10 seconds")

          if v11 then
            f8(v11.CFrame.Position + Vector3.new(0, 3, 0))
            task.wait(1)
            v24 = 0
          else
            break
          end
        end

        local enabled = proximityPrompt.Enabled

        v16 = enabled
        v16 = enabled or v24 > 10
      until v16

      if proximityPrompt.Enabled then
        proximityPrompt.RequiresLineOfSight = false
        proximityPrompt.HoldDuration = 0

        warn("Starting cooking process...")
        f13("FijiWater")
        task.wait(1)
        f13("Ice-Fruit Bag")
        task.wait(1)
        f13("FreshWater")
        local v25 = os.time()

        repeat
          task.wait(0.4)
          v17 = f14()

          if os.time() - v25 > 10 and not v17 then
            warn("Cooking failed to start, retrying...")
            f13("Ice-Fruit Bag")
            task.wait(1)
            f13("FreshWater")
            v25 = os.time()
          end

          if os.time() - v25 > 30 then
            warn("Failed to start cooking after multiple attempts")
            break
          end

          v18 = v17
          v18 = v17 or os.time() - v25 > 30
        until v18

        if v17 then
          warn("Cooking process confirmed started. Waiting for completion...")
          local total2 = 0

          repeat
            task.wait(0.4)
            total2 = total2 + 0.5
            v19 = f12()

            if total2 % 5 == 0 then
              warn("Still cooking... " .. total2 .. "s elapsed")
            end

            if total2 > 300 then
              warn("Cooking never completed after 60 seconds, moving on anyway")
              break
            end

            v20 = v19 or total2 > 300
          until v20

          if v19 then
            warn("Cooking process confirmed completed!")
          end

          if localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz") and localPlayer.Character
            and localPlayer.Character:FindFirstChild("Humanoid") then
            localPlayer.Character.Humanoid:EquipTool(localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz"))
          end

          f8(v11.CFrame.Position + Vector3.new(0, 3, 0))

          for n = 1, 10 do
            task.wait(0.1)

            if currentCamera and proximityPrompt and proximityPrompt.Parent then
              currentCamera.CFrame = CFrame.new(
                currentCamera.CFrame.Position, proximityPrompt.Parent.Position
              )
            end

            pcall(function() fireproximityprompt(proximityPrompt) end)
          end

          local v26 = false

          if localPlayer.Character and localPlayer.Character:FindFirstChild("Ice-Fruit Cupz") then
            v26 = true
            warn("Ice-Fruit Cupz equipped successfully")
          elseif localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz") then
            pcall(function()
              localPlayer.Character.Humanoid:EquipTool(localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz"))
            end)

            task.wait(0.5)
            v26 = localPlayer.Character:FindFirstChild("Ice-Fruit Cupz") ~= nil

            if v26 then
              warn("Ice-Fruit Cupz equipped successfully")
            end
          end

          if not v26 then
            warn("Failed to obtain cooked item, cannot proceed to selling")
            return
          end

          proximityPrompt2 = iceFruitSell:FindFirstChild("ProximityPrompt")

          if proximityPrompt2 then
            warn("[DEBUG] Found selling prompt")
            f8(Vector3.new(-70, 287, -321))

            if currentCamera and proximityPrompt2 and proximityPrompt2.Parent then
              currentCamera.CFrame = CFrame.new(
                currentCamera.CFrame.Position, proximityPrompt2.Parent.Position
              )
            end

            task.wait(2)

            if not (localPlayer.Character and localPlayer.Character:FindFirstChild("Ice-Fruit Cupz")) then
              if localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz") then
                localPlayer.Character.Humanoid:EquipTool(localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz"))
                task.wait(0.5)
              else
                warn("Ice-Fruit Cupz not found before selling")
                return
              end
            end

            v21 = 990000

            if f11(localPlayer, 1061358030) or f11(localPlayer, 1061772429) then
              v21 = 18000000
            end

            local function f16()
              local value9 = localPlayer:FindFirstChild("stored")
                  and localPlayer.stored:FindFirstChild("FilthyStack")
                  and localPlayer.stored.FilthyStack.Value
                or 0

              local v27 = 0

              for i6 = 1, 10000 do
                task.spawn(function()
                  pcall(function()
                    if proximityPrompt2 then
                      proximityPrompt2.Enabled = true

                      if currentCamera and proximityPrompt2 and proximityPrompt2.Parent then
                        currentCamera.CFrame = CFrame.new(
                          currentCamera.CFrame.Position, proximityPrompt2.Parent.Position
                        )
                      end

                      fireproximityprompt(proximityPrompt2)
                    end
                  end)
                end)

                local value10 = localPlayer:FindFirstChild("stored")
                    and localPlayer.stored:FindFirstChild("FilthyStack")
                    and localPlayer.stored.FilthyStack.Value
                  or 0

                if value10 > value9 then
                  if i6 % 100 == 0 then
                    warn("Selling progress: $" .. value10)
                  end

                  value9 = value10
                  v27 = 0
                else
                  v27 = v27 + 1
                end

                if value10 >= v21 then
                  warn("Reached selling limit: $" .. value10)

                  if p6 then
                    p6()
                  end

                  return
                end

                if not (localPlayer.Character
                  and localPlayer.Character:FindFirstChild("Ice-Fruit Cupz")) then
                  warn("Lost Ice-Fruit Cupz during selling")

                  if p6 then
                    p6()
                  end

                  return
                end

                if v27 > 1000 then
                  warn("Money not increasing, attempting to fix...")

                  pcall(function()
                    if localPlayer.Character
                      and localPlayer.Character:FindFirstChild("Humanoid") then
                      localPlayer.Character.Humanoid:UnequipTools()
                    end
                  end)

                  task.wait(0.5)

                  if localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz") then
                    localPlayer.Character.Humanoid:EquipTool(localPlayer.Backpack:FindFirstChild("Ice-Fruit Cupz"))
                  end

                  task.wait(0.5)
                  f8(Vector3.new(-70, 287, -321))
                  v27 = 0
                end

                if i6 % 500 == 0 then
                  task.wait(0.05)
                end
              end

              if p6 then
                p6()
              end
            end

            f16()

            if cframe then
              f8(cframe.Position)
            end

            return
          end

          warn("Selling prompt not found")
          return
        end

        warn("Cooking never started")
        return
      end

      warn("Prompt not enabled")
      return
    end

    warn("Prompt or prompt parent not found")
    return
  end
end

local function f17(p11, p12)
  if p11 and p11:FindFirstChild("ProfileSnowUI") then
    local frame6 = p11.ProfileSnowUI:FindFirstChild("Frame")

    if frame6 then
      local textLabel5 = frame6:FindFirstChild("TextLabel")

      if textLabel5 then
        textLabel5.Text = "Cleaning Dirty Money..."
      end
    end
  end

  local v28 = {}

  for index3, value11 in ipairs(workspace:WaitForChild("CounterBag"):GetChildren()) do
    local cashPrompt = value11:FindFirstChild("Counter")
      and value11.Counter:FindFirstChild("On")
      and value11.Counter.On:FindFirstChild("PromptTach")
      and value11.Counter.On.PromptTach:FindFirstChild("CashPrompt")

    local beep = value11.Counter and value11.Counter.On
      and value11.Counter.On:FindFirstChild("Beep")

    local grabPrompt = value11:FindFirstChild("DuffleBag")
      and value11.DuffleBag:FindFirstChild("Attachment")
      and value11.DuffleBag.Attachment:FindFirstChild("GrabPrompt")

    if cashPrompt and beep and grabPrompt then
      table.insert(v28, {
        prompt = cashPrompt,
        beep = beep,
        grab = grabPrompt,
        name = value11.Name,
      })
    end
  end

  local prompt, beep2, grab, name, v29, connect2

  if #v28 == 0 then
    warn("❌ No valid counters found.")

    if p12 then
      p12()
    end

    return
  else
    local v30 = v28[math.random(1, #v28)]
    prompt = v30.prompt
    beep2 = v30.beep
    grab = v30.grab
    name = v30.name
    v29 = 0
    connect2 = nil

    local function f18()
      local parent = prompt

      while parent and not parent:IsA("BasePart") do
        parent = parent.Parent
      end

      if parent then
        f8(parent.CFrame.Position + Vector3.new(0, 2, 0))
        task.wait(0.3)

        if prompt and prompt:IsA("ProximityPrompt") then
          fireproximityprompt(prompt)
        end

        local ended = beep2.Ended
        v29 = v29 + 1

        if v29 == 2 then
          task.wait(1)
          local moneyReady = localPlayer.Backpack:FindFirstChild("MoneyReady")

          local moneyReady2 = moneyReady
          moneyReady2 = moneyReady or localPlayer.Character:FindFirstChild("MoneyReady")

          if moneyReady2 and moneyReady2:IsA("Tool") then
            if moneyReady2.Parent == localPlayer.Backpack then
              localPlayer.Character.Humanoid:EquipTool(moneyReady2)
            end
          end

          while true do
            if not (localPlayer.Backpack:FindFirstChild("MoneyReady")
              or localPlayer.Character:FindFirstChild("MoneyReady")) then
              break
            end

            if grab and grab:IsA("ProximityPrompt") then
              fireproximityprompt(grab)
            end

            task.wait(0.3)
          end

          if connect2 then
            connect2:Disconnect()
          end

          if p12 then
            task.wait(1)
            p12()
          end

          if library and library.Notify then
            library:Notify({
              Title = "Money Cleaning",
              Description = "Finished collecting money from counter: " .. name,
              Duration = 3,
            })
          end
        elseif library and library.Notify then
          library:Notify({
            Title = "Money Cleaning",
            Description = "Teleported to counter: " .. name,
            Duration = 3,
          })
        end
      end
    end

    f18()

    connect2 = beep2.Played:Connect(f18)

    task.spawn(function()
      while p11 and p11.Parent do
        local bagOfMoney = localPlayer.Backpack:FindFirstChild("BagOfMoney")

        if bagOfMoney then
          if bagOfMoney.Parent == localPlayer.Backpack then
            localPlayer.Character.Humanoid:EquipTool(bagOfMoney)
          end

          local position = localPlayer.Character.HumanoidRootPart.Position

          f8(Vector3.new(-203.58938598633, 283.62670898438, -1200.6501464844)
            + Vector3.new(0, 2, 0))

          task.wait(0.5)

          local proximityPrompt3 = workspace:FindFirstChild("ATMMoney")
            and workspace.ATMMoney:FindFirstChildOfClass("ProximityPrompt")

          if proximityPrompt3 then
            fireproximityprompt(proximityPrompt3)
          end

          task.wait(5)
          f8(position + Vector3.new(0, 2, 0))
        end

        task.wait(1)
      end
    end)

    return
  end
end

local money2 = v2.Main:AddLeftGroupbox("Money")

money2:AddButton("InfMoneyButton", {
  Text = "💰 Inf Money (Auto)",
  Func = function()
    local v31, v32 = f1()

    task.spawn(function()
      f9(v32)
      f17(v31, v32)
    end)
  end,
  Tooltip = "Automatically generate and clean money",
  DisabledTooltip = "Cannot generate money",
  Disabled = false,
  Visible = true,
})

money2:AddButton("BuyAllItemsButton", {
  Text = "🛒 Buy All Items",
  Func = function()
    local localPlayer2 = game.Players.LocalPlayer
    local v33 = { "Ice-Fruit Bag", "Ice-Fruit Cupz", "FijiWater", "FreshWater" }

    local value12 = localPlayer2:FindFirstChild("stored")
      and localPlayer2.stored:FindFirstChild("Money") and localPlayer2.stored.Money.Value

    local findFirstChild5

    if (value12 or 0) < 2696 then
      library:Notify({
        Title = "Insufficient Funds",
        Description = "Need at least $2,696 to buy all items",
        Duration = 3,
      })

      return
    else
      local function f19(p13)
        if not localPlayer2.Backpack:FindFirstChild(p13)
          and not (localPlayer2.Character and localPlayer2.Character:FindFirstChild(p13)) then
          return (pcall(function()
            replicatedStorage:WaitForChild("ExoticShopRemote"):InvokeServer(p13)
          end))
        end

        return true
      end

      for index4, value13 in ipairs(v33) do
        local count2 = 0

        if not (localPlayer2.Character and localPlayer2.Character:FindFirstChild(value13)) then
          localPlayer2.Backpack:FindFirstChild(value13)
        end

        repeat
          if not f19(value13) then
            warn("Failed to buy " .. value13)
            task.wait(1)
          end

          task.wait(0.4)
          count2 = count2 + 1
          local character3 = localPlayer2.Character

          local findFirstChild6 = character3
          findFirstChild6 = character3 and localPlayer2.Character:FindFirstChild(value13)

          findFirstChild5 = findFirstChild6

          findFirstChild5 = findFirstChild6 or localPlayer2.Backpack:FindFirstChild(value13)
            or count2 > 5
        until findFirstChild5
      end

      library:Notify({
        Title = "Purchase Complete",
        Description = "All items purchased!",
        Duration = 2,
      })

      return
    end
  end,
  Tooltip = "Buy Ice-Fruit Bag, Cupz, FijiWater, and FreshWater",
  Disabled = false,
  Visible = true,
})

money2:AddButton("CookButton", {
  Text = "🍳 Cook Ice-Fruit",
  Func = function()
    local localPlayer3 = game.Players.LocalPlayer
    local currentCamera2 = workspace.CurrentCamera
    local v34 = workspace
    local v35

    for key3, value14 in pairs(v34:GetDescendants()) do
      if value14.Name == "CookPart" then
        v35 = value14
        break
      end
    end

    if not v35 then
      library:Notify({ Title = "Error", Description = "Cooking pot not found!", Duration = 3 })
      return
    end

    local proximityPrompt4 = v35:FindFirstChildWhichIsA("ProximityPrompt")
    local f20

    if not proximityPrompt4 then
      library:Notify({ Title = "Error", Description = "Cooking prompt not found!", Duration = 3 })
      return
    else
      function f20()
        if not v35 then
          return false
        else
          local fire13 = v35:FindFirstChild("Fire1")

          if not fire13 then
            return false
          else
            local particleEmitter3 = fire13:FindFirstChild("ParticleEmitter")

            if not particleEmitter3 then
              return false
            end

            return particleEmitter3.Enabled
          end
        end
      end

      local function f21(p14)
        pcall(function()
          if localPlayer3.Character and localPlayer3.Character:FindFirstChild("Humanoid") then
            localPlayer3.Character.Humanoid:UnequipTools()
          end
        end)

        task.wait(0.5)
        proximityPrompt4.HoldDuration = 0
        local findFirstChild7 = localPlayer3.Backpack:FindFirstChild(p14)

        if not findFirstChild7 then
          return false
        end

        if localPlayer3.Character and localPlayer3.Character:FindFirstChild("Humanoid") then
          localPlayer3.Character.Humanoid:EquipTool(findFirstChild7)
          task.wait(0.5)
          f8(v35.CFrame.Position + Vector3.new(0, 3, 0))

          for i7 = 1, 30 do
            task.wait(0.1)

            if currentCamera2 and proximityPrompt4 and proximityPrompt4.Parent then
              currentCamera2.CFrame = CFrame.new(
                currentCamera2.CFrame.Position, proximityPrompt4.Parent.Position
              )
            end

            pcall(function() fireproximityprompt(proximityPrompt4) end)

            if not localPlayer3.Character:FindFirstChild(p14)
              and not localPlayer3.Backpack:FindFirstChild(p14) then
              return true
            end

            if p14 == "FreshWater" and f20() then
              return true
            end
          end

          return false
        end

        return false
      end

      f8(Vector3.new(-614, 356, -683))
      task.wait(1)

      proximityPrompt4.RequiresLineOfSight = false
      proximityPrompt4.HoldDuration = 0

      f21("FijiWater")
      task.wait(1)
      f21("Ice-Fruit Bag")
      task.wait(1)
      f21("FreshWater")
      task.wait(2)

      if localPlayer3.Backpack:FindFirstChild("Ice-Fruit Cupz") then
        localPlayer3.Character.Humanoid:EquipTool(localPlayer3.Backpack:FindFirstChild("Ice-Fruit Cupz"))
      end

      f8(v35.CFrame.Position + Vector3.new(0, 3, 0))
      task.wait(0.5)

      for i8 = 1, 10 do
        task.wait(0.1)

        if currentCamera2 and proximityPrompt4 and proximityPrompt4.Parent then
          currentCamera2.CFrame = CFrame.new(
            currentCamera2.CFrame.Position, proximityPrompt4.Parent.Position
          )
        end

        pcall(function() fireproximityprompt(proximityPrompt4) end)
      end

      library:Notify({
        Title = "Cooking Complete",
        Description = "Ice-Fruit Cupz ready to sell!",
        Duration = 2,
      })

      return
    end
  end,
  Tooltip = "Cook Ice-Fruit items into sellable cups",
  Disabled = false,
  Visible = true,
})

money2:AddButton("SellCupButton", {
  Text = "💵 Sell Cup",
  Func = function()
    local localPlayer4 = game.Players.LocalPlayer
    local currentCamera3 = workspace.CurrentCamera
    local iceFruitSell3 = workspace:FindFirstChild("IceFruit Sell")

    if not iceFruitSell3 then
      library:Notify({
        Title = "Error",
        Description = "Selling location not found!",
        Duration = 3,
      })

      return
    end

    local proximityPrompt5 = iceFruitSell3:FindFirstChild("ProximityPrompt")
    local f22

    if not proximityPrompt5 then
      library:Notify({ Title = "Error", Description = "Selling prompt not found!", Duration = 3 })
      return
    else
      if not (localPlayer4.Character and localPlayer4.Character:FindFirstChild("Ice-Fruit Cupz")) then
        if localPlayer4.Backpack:FindFirstChild("Ice-Fruit Cupz") then
          localPlayer4.Character.Humanoid:EquipTool(localPlayer4.Backpack:FindFirstChild("Ice-Fruit Cupz"))
          task.wait(0.5)
        else
          library:Notify({
            Title = "Error",
            Description = "No Ice-Fruit Cupz to sell!",
            Duration = 3,
          })

          return
        end
      end

      f8(Vector3.new(-70, 287, -321))
      task.wait(1)

      if currentCamera3 and proximityPrompt5 and proximityPrompt5.Parent then
        currentCamera3.CFrame = CFrame.new(
          currentCamera3.CFrame.Position, proximityPrompt5.Parent.Position
        )
      end

      proximityPrompt5.Enabled = true
      proximityPrompt5.HoldDuration = 0
      proximityPrompt5.RequiresLineOfSight = false

      local v36 = 990000

      function f22(p15, p16)
        local v37, v38 = pcall(function()
          return marketplaceService:UserOwnsGamePassAsync(p15.UserId, p16)
        end)

        return v37 and v38
      end

      if f22(localPlayer4, 1061358030) or f22(localPlayer4, 1061772429) then
        v36 = 18000000
      end

      local value15 = localPlayer4:FindFirstChild("stored")
          and localPlayer4.stored:FindFirstChild("FilthyStack")
          and localPlayer4.stored.FilthyStack.Value
        or 0

      local v39 = 0

      for i9 = 1, 10000 do
        task.spawn(function()
          pcall(function()
            if proximityPrompt5 then
              proximityPrompt5.Enabled = true

              if currentCamera3 and proximityPrompt5 and proximityPrompt5.Parent then
                currentCamera3.CFrame = CFrame.new(
                  currentCamera3.CFrame.Position, proximityPrompt5.Parent.Position
                )
              end

              fireproximityprompt(proximityPrompt5)
            end
          end)
        end)

        local value16 = localPlayer4:FindFirstChild("stored")
            and localPlayer4.stored:FindFirstChild("FilthyStack")
            and localPlayer4.stored.FilthyStack.Value
          or 0

        if value16 > value15 then
          if i9 % 100 == 0 then
            warn("Selling progress: $" .. value16)
          end

          v39 = 0
          value15 = value16
        else
          v39 = v39 + 1
        end

        if value16 >= v36 then
          library:Notify({
            Title = "Selling Complete",
            Description = "Reached limit: $" .. value16,
            Duration = 3,
          })

          return
        end

        if not (localPlayer4.Character and localPlayer4.Character:FindFirstChild("Ice-Fruit Cupz")) then
          library:Notify({
            Title = "Selling Stopped",
            Description = "Lost Ice-Fruit Cupz",
            Duration = 3,
          })

          return
        end

        if v39 > 1000 then
          pcall(function()
            if localPlayer4.Character and localPlayer4.Character:FindFirstChild("Humanoid") then
              localPlayer4.Character.Humanoid:UnequipTools()
            end
          end)

          task.wait(0.5)

          if localPlayer4.Backpack:FindFirstChild("Ice-Fruit Cupz") then
            localPlayer4.Character.Humanoid:EquipTool(localPlayer4.Backpack:FindFirstChild("Ice-Fruit Cupz"))
          end

          task.wait(0.5)
          f8(Vector3.new(-70, 287, -321))
          v39 = 0
        end

        if i9 % 500 == 0 then
          task.wait(0.05)
        end
      end

      library:Notify({
        Title = "Selling Complete",
        Description = "Finished selling cups!",
        Duration = 2,
      })

      return
    end
  end,
  Tooltip = "Sell Ice-Fruit Cupz for dirty money",
  Disabled = false,
  Visible = true,
})

local replicatedStorage2 = game.ReplicatedStorage

local function f23(p17, ...)
  return p17:InvokeServer(...)
end

local localPlayer5 = game.Players.LocalPlayer
local f24

local function f25()
  local v40 = { "Ice-Fruit Bag", "Ice-Fruit Cupz", "FijiWater", "FreshWater" }

  for index5, value17 in ipairs(v40) do
    local findFirstChild8 = replicatedStorage2.ExoticStock:FindFirstChild(value17)

    if not findFirstChild8 or findFirstChild8.Value == 0 then
      if library and library.Notify then
        library:Notify({
          Title = "AutoBuy",
          Description = value17 .. " is out of stock!",
          Duration = 5,
        })
      end

      return false
    end
  end

  for index6, value18 in ipairs(v40) do
    f23(replicatedStorage2.ExoticShopRemote, value18)
    task.wait(1.25)
  end

  for index7, value19 in ipairs(v40) do
    if not f24(value19) then
      if library and library.Notify then
        library:Notify({
          Title = "AutoBuy",
          Description = "Failed to acquire: " .. value19,
          Duration = 5,
        })
      end

      return false
    end
  end

  return true
end

function f24(p18)
  return localPlayer5.Backpack:FindFirstChild(p18) or localPlayer5.Character:FindFirstChild(p18)
end

money2:AddButton("BuyIceFruitzButton", {
  Text = "Buy Ice-Fruitz-Itemz",
  Func = function()
    if f25() then
      if library and library.Notify then
        library:Notify({
          Title = "AutoBuy",
          Description = "Items purchased successfully!",
          Duration = 5,
        })
      end
    elseif library and library.Notify then
      library:Notify({
        Title = "AutoBuy",
        Description = "Failed to purchase items!",
        Duration = 5,
      })
    end
  end,
  Tooltip = "Automatically buy Ice-Fruitz items",
  DisabledTooltip = "Cannot auto-buy items",
  Disabled = false,
  Visible = true,
})

local dupe = v2.Main:AddLeftGroupbox("Dupe")

dupe:AddLabel({
  Text = "Equip Tool And Predd Dupe",
  Tooltip = "Instructions for using Market Dupe",
  Visible = true,
})

dupe:AddButton("DuplicateGunButton", {
  Text = "Duplicate Tool",
  Func = function()
    local v41 = cloneref(replicatedStorage)
    local localPlayer6 = cloneref(players).LocalPlayer
    local character4 = localPlayer6.Character or localPlayer6.CharacterAdded:Wait()
    local backpack = localPlayer6:WaitForChild("Backpack")
    local tool = character4:FindFirstChildOfClass("Tool")
    local name2, specialId

    if not tool then
      return
    else
      tool.Parent = backpack
      task.wait(0.5)
      name2 = tool.Name
      specialId = nil

      local function f26()
        if typeof(localPlayer6.GetNetworkPing) == "function" then
          local v42, v43 = pcall(function()
            return tonumber(string.match(localPlayer6:GetNetworkPing(), "%d+"))
          end)

          if v42 and v43 then
            return v43
          end
        end

        local v44, v45 = pcall(function()
          return localPlayer6:FindFirstChild("PlayerGui"):FindFirstChild("Ping")
            or localPlayer6:FindFirstChild("PlayerScripts"):FindFirstChild("Ping")
        end)

        local textLabel6 = v44 and v45 and v45:IsA("TextLabel")
        local instance, v46, v47

        if textLabel6 then
          local v48 = tonumber(string.match(v45.Text, "%d+"))

          if v48 then
            return v48
          end

          v46 = tick()

          instance = Instance.new("BoolValue", v41)
          instance.Name = "PingTest_" .. tostring(math.random(10000, 99999))

          task.wait(0.1)
          v47 = tick()
          instance:Destroy()
          return math.clamp((v47 - v46) * 1000, 50, 300)
        end

        v46 = tick()

        instance = Instance.new("BoolValue", v41)
        instance.Name = "PingTest_" .. tostring(math.random(10000, 99999))

        task.wait(0.1)
        v47 = tick()
        instance:Destroy()
        return math.clamp((v47 - v46) * 1000, 50, 300)
      end

      local v49 = f26()
      local v50 = math.clamp(v49, 0, 300)

      local connect3 = v41.MarketItems.ChildAdded:Connect(function(child)
        if child.Name == name2 then
          local waitForChild = child:WaitForChild("owner", 2)

          if waitForChild and waitForChild.Value == localPlayer6.Name then
            specialId = child:GetAttribute("SpecialId")
          end
        end
      end)

      task.spawn(function() v41.ListWeaponRemote:FireServer(name2, 99999) end)
      task.wait(0.25 + v50 / 300 * 0.03)
      task.spawn(function() v41.BackpackRemote:InvokeServer("Store", name2) end)
      task.wait(3)

      if specialId then
        task.spawn(function() v41.BuyItemRemote:FireServer(name2, "Remove", specialId) end)
      end

      task.spawn(function() v41.BackpackRemote:InvokeServer("Grab", name2) end)
      connect3:Disconnect()
      task.wait(1)
      return
    end
  end,
  Tooltip = "Duplicate the gun you are holding",
  DisabledTooltip = "Cannot duplicate gun",
  Disabled = false,
  Visible = true,
})

local telePort = v2.Main:AddLeftGroupbox("TelePort")
local localPlayer7 = game.Players.LocalPlayer

local v51 = {
  {
    Name = " 🏛️ Bank",
    Position = Vector3.new(-226.22584533691, 283.8095703125, -1217.7509765625),
  },
  { Name = " 💸 Money Wash", Position = Vector3.new(-977.1771, 253.6838, -692.5855) },
  { Name = " 📦 Safe Items", Position = Vector3.new(68514.8984, 52941.5, -796.09) },
  { Name = " 💰 Pawn Shop", Position = Vector3.new(-1049.6431, 253.5367, -814.2697) },
  {
    Name = " 🔒 Bank Vault",
    Position = Vector3.new(-217.568359375, 373.79849243164, -1216.2094726562),
  },
  { Name = " 🤑 Money Man", Position = Vector3.new(-1008.0662, 262.1141, 55.1336) },
  { Name = " 🔫 GunShop 1", Position = Vector3.new(92969.8984, 122097.9688, 17023.8867) },
  { Name = " 🛡️ GunShop 1 Lobby", Position = Vector3.new(-1002.4224, 253.6382, -803.9125) },
  {
    Name = " 🔫 GunShop 2",
    Position = Vector3.new(66195.4453125, 123615.7109375, 5750.2827148438),
  },
  {
    Name = " 🛡️ GunShop 2 Lobby",
    Position = Vector3.new(-224.3818359375, 283.8034362793, -794.71740722656),
  },
  { Name = " 🔫 GunShop 3", Position = Vector3.new(60820.3086, 87609.1484, -351.4746) },
  {
    Name = " 🏢 Pent House",
    Position = Vector3.new(-178.27471923828, 397.13830566406, -573.0322265625),
  },
  {
    Name = " 🍵 Pent House2",
    Position = Vector3.new(-618.03460693359, 356.54513549805, -681.40155029297),
  },
  {
    Name = " 🏠 Mini Mansion",
    Position = Vector3.new(-791.51800537109, 256.79446411133, 1414.4248046875),
  },
  {
    Name = " 🎒 Backpack Shop",
    Position = Vector3.new(-692.41424560547, 253.78091430664, -681.06726074219),
  },
  {
    Name = " 💎 Frozen Shop",
    Position = Vector3.new(-216.31436157227, 284.03149414062, -1169.0324707031),
  },
  { Name = " 💧 Drip Shop", Position = Vector3.new(67462.6953, 10489.0352, 549.5895) },
  { Name = " 🍗 Chicken Wings", Position = Vector3.new(-957.9142, 253.5367, -815.9442) },
  {
    Name = " 🥪 Deli",
    Position = Vector3.new(-755.81140136719, 254.69274902344, -687.1181640625),
  },
  {
    Name = " 🚗 Car Dealer",
    Position = Vector3.new(-401.99371337891, 253.41410827637, -1248.8380126953),
  },
  { Name = " 👕 Drip Store", Position = Vector3.new(67462, 10489.21484375, 546.19415283203) },
  {
    Name = " 🥤 Soda Warehouse",
    Position = Vector3.new(-187.85504150391, 284.62521362305, -291.34191894531),
  },
  {
    Name = " 🍾 Soda Supplies",
    Position = Vector3.new(-403.09906005859, 254.20343017578, -580.04376220703),
  },
  {
    Name = " 🍹 Soda Seller",
    Position = Vector3.new(-1292.2200927734, 253.30044555664, -3003.0483398438),
  },
  {
    Name = " 🐍 Exotic Dealer",
    Position = Vector3.new(-1523.5654296875, 273.97299194336, -990.65753173828),
  },
  {
    Name = " 🔀 Switch Seller",
    Position = Vector3.new(-1446.2166748047, 256.05981445312, 2189.8762207031),
  },
  {
    Name = " 🛠️ Bank Tools",
    Position = Vector3.new(-397.43087768555, 334.31423950195, -555.70233154297),
  },
  { Name = " 🚧 Construction Site", Position = Vector3.new(-1731.8307, 370.8123, -1176.8387) },
  { Name = " 🚔 Prison", Position = Vector3.new(-1135.0464, 254.716, -3330.9954) },
  { Name = " 🍟 McDonalds", Position = Vector3.new(-1012.13, 253.71, -1148.07) },
  { Name = " ❄️ Ice Box", Position = Vector3.new(-215.1407, 283.5154, -1258.691) },
  {
    Name = " 🏥 Hospital",
    Position = Vector3.new(-1589.5041503906, 254.27223205566, 17.655523300171),
  },
  {
    Name = " 🛍️ MarGreens",
    Position = Vector3.new(-381.20751953125, 254.4538269043, -385.66546630859),
  },
  {
    Name = " 🚨 Feds Room",
    Position = Vector3.new(-1441.7904052734, 255.03651428223, -3132.5974121094),
  },
  {
    Name = " 🚪 House Rob Door 1",
    Position = Vector3.new(-714.24401855469, 287.12142944336, -779.23297119141),
  },
  {
    Name = " 🚪 House Rob Door 2",
    Position = Vector3.new(-606.26690673828, 253.88676452637, -679.88446044922),
  },
  {
    Name = " 🎬 Studio Robbery",
    Position = Vector3.new(93427.515625, 14484.905273438, 566.67010498047),
  },
  {
    Name = " 🏕️ TrailerPark",
    Position = Vector3.new(-1522.7690429688, 253.16094970703, 2344.9594726562),
  },
  {
    Name = " 🏨 Woody's Hotel",
    Position = Vector3.new(-1022.6196289062, 325.84005737305, -908.91571044922),
  },
}

local v52 = {}

for index8, value20 in ipairs(v51) do
  table.insert(v52, value20.Name)
end

local v53

telePort:AddDropdown("TeleportDropdown", {
  Values = v52,
  Default = nil,
  Multi = false,
  Text = "Select Location",
  Tooltip = "Pick a location to teleport",
  DisabledTooltip = "Dropdown disabled",
  Searchable = true,
  Callback = function(value21)
    if value21 and value21 ~= "" then
      for index9, value22 in ipairs(v51) do
        if value22.Name == value21 then
          v53 = value22
          break
        end
      end
    end
  end,
  Disabled = false,
  Visible = true,
})

telePort:AddButton("TeleportButton", {
  Text = "Teleport to Location",
  Func = function()
    local v54

    if v53 then
      local character5 = localPlayer7.Character or localPlayer7.CharacterAdded:Wait()
      local humanoid3 = character5:WaitForChild("Humanoid")
      local humanoidRootPart2 = character5:WaitForChild("HumanoidRootPart")
      humanoid3:ChangeState(0)
      localPlayer7:GetAttribute("LastACPos")

      repeat
        task.wait()
        v54 = localPlayer7
      until not v54:GetAttribute("LastACPos")

      humanoidRootPart2.CFrame = CFrame.new(v53.Position)
    end
  end,
  Tooltip = "Teleport to the selected location",
  DisabledTooltip = "Cannot teleport",
  Disabled = false,
  Visible = true,
})

local shopGuis = v2.Main:AddLeftGroupbox("ShopGuis")
local playerGui = players.LocalPlayer:WaitForChild("PlayerGui")

local v55 = {
  Crafting = { "CraftGUI", "Main", "Visible" },
  ["Megaphone List"] = { "Bronx MessageList", "Holder", "Visible" },
  Animations = { "Animations", "Frame", "Visible" },
  ["Bronx Market"] = { "Bronx Market 2", nil, "Enabled" },
  ["Bronx Tattoos"] = { "Bronx TATTOOS", nil, "Enabled" },
  ["Bronx Clothing"] = { "Bronx CLOTHING", nil, "Enabled" },
  ["Trunk Storage"] = { "TRUNK STORAGE", nil, "Enabled" },
  ["Bronx Pawning"] = { "Bronx PAWNING", nil, "Enabled" },
}

local v56 = {}

for key4 in pairs(v55) do
  table.insert(v56, key4)
end

local v57

shopGuis:AddDropdown("GUISelectorDropdown", {
  Values = v56,
  Default = nil,
  Multi = false,
  Text = "Select GUI",
  Tooltip = "Select a GUI to open/close",
  DisabledTooltip = "Dropdown disabled",
  Searchable = true,
  Callback = function(value23)
    if value23 and value23 ~= "" then
      v57 = value23
    end
  end,
  Disabled = false,
  Visible = true,
})

shopGuis:AddButton("ToggleSelectedGUIButton", {
  Text = "Open/Close Selected GUI",
  Func = function()
    if v57 then
      local v58 = v55[v57]

      if v58 then
        local findFirstChild9 = playerGui:FindFirstChild(v58[1])

        if findFirstChild9 then
          local findFirstChild10 = v58[2] and findFirstChild9:FindFirstChild(v58[2])
            or findFirstChild9

          if findFirstChild10 and v58[3] then
            findFirstChild10[v58[3]] = not findFirstChild10[v58[3]]
          end
        end
      end
    end
  end,
  Tooltip = "Toggle the selected GUI",
  DisabledTooltip = "Cannot toggle GUI",
  Disabled = false,
  Visible = true,
})

local policeSounds = v2.Main:AddRightGroupbox("PoliceSounds")
local v59

policeSounds:AddDropdown("MegaphoneDropdown", {
  Values = { "Hands UP!", "Driver Pull Over!", "Move it FOLKS!", "PULL OVER NOW!" },
  Default = {},
  Multi = false,
  Text = "Select Megaphone Message",
  Tooltip = "Choose a message to play on the megaphone",
  DisabledTooltip = "Dropdown disabled",
  Callback = function(value24)
    if value24 and value24 ~= "" then
      v59 = value24

      if library and library.Notify then
        library:Notify({
          Title = "Megaphone",
          Description = "Selected message: " .. tostring(v59),
          Duration = 4,
        })
      end
    end
  end,
  Disabled = false,
  Visible = true,
}):SetValue({})

policeSounds:AddButton("PoliceSoundsButton", {
  Text = "Police Sounds",
  Func = function()
    local v60

    if v59 then
      v60 = { v59 }

      if pcall(function()
        replicatedStorage:WaitForChild("MegaphoneRemote"):FireServer(unpack(v60))
      end) then
        if library and library.Notify then
          library:Notify({
            Title = "Megaphone",
            Description = "Message played: " .. v59,
            Duration = 4,
          })
        end
      end
    elseif library and library.Notify then
      library:Notify({ Title = "Megaphone", Description = "No message selected!", Duration = 4 })
    end
  end,
  Tooltip = "Play the selected megaphone message",
  DisabledTooltip = "Cannot play message",
  Disabled = false,
  Visible = true,
})

local quickBuy = v2.Main:AddLeftGroupbox("QuickBuy")
local v61 = {}

quickBuy:AddDropdown("MyMultiDropdown", {
  Values = {
    "RawChicken", "PinkCamoGloves", "RedGloves", "BluCamoGloves", "BluShiestyCam",
    "PurpleCamoGloves", "YelloCamoGloves", "Shiesty", "Water", "BluGloves", "WhiteGloves",
    "BlackGloves", "RawSteak", "YelloShiesty", "PinkCamoGloves", "WhiteShiesty",
    "RedCamoGloves",
  },
  Default = {},
  Multi = true,
  Text = "Select Items",
  Tooltip = "Select one or more items to buy",
  Callback = function(value25) v61 = value25 end,
  Disabled = false,
  Visible = true,
}):SetValue({})

quickBuy:AddButton("QuickBuyButton", {
  Text = "QuickBuy",
  Func = function()
    local v62 = false

    for key5, value26 in next, v61, nil do
      if value26 then
        local v63 = { key5 }
        v62 = true

        if pcall(function()
          replicatedStorage:WaitForChild("ShopRemote"):InvokeServer(unpack(v63))
        end) then
          if library and library.Notify then
            library:Notify({ Title = "Shop", Description = "Bought: " .. key5, Duration = 5 })
          end
        end
      end
    end

    if not v62 then
      if library and library.Notify then
        library:Notify({ Title = "Shop", Description = "No items selected!", Duration = 5 })
      end
    end
  end,
  Tooltip = "Buy all currently selected items",
  DisabledTooltip = "Cannot buy items",
  Disabled = false,
  Visible = true,
})

local cars = v2.Main:AddLeftGroupbox("Cars")
local localPlayer8 = game.Players.LocalPlayer

cars:AddButton({
  Text = "Unlock All Cars",
  Func = function()
    local civCars = workspace:FindFirstChild("CivCars")

    if not civCars then
      warn("CivCars folder not found in workspace.")
      return
    else
      local count3 = 0

      for index10, value27 in ipairs(civCars:GetChildren()) do
        local findFirstChildWhichIsA = value27:FindFirstChildWhichIsA("VehicleSeat", true)

        if findFirstChildWhichIsA then
          findFirstChildWhichIsA.Disabled = false
          count3 = count3 + 1
        end
      end

      if library and library.Notify then
        library:Notify({
          Title = "Car Unlocker",
          Description = "Unlocked " .. count3 .. " cars!",
          Duration = 5,
        })
      end

      return
    end
  end,
  DoubleClick = false,
  Tooltip = "Unlock all civilian cars",
  DisabledTooltip = "Cannot unlock cars",
  Disabled = false,
  Visible = true,
  Risky = false,
})

cars:AddButton({
  Text = "Bring My Car",
  Func = function()
    local humanoidRootPart3 = localPlayer8.Character
      and localPlayer8.Character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart3 then
      return
    else
      local civCars2 = workspace:FindFirstChild("CivCars")

      if not civCars2 then
        return
      else
        local v64 = nil

        for index11, value28 in ipairs(civCars2:GetChildren()) do
          local findFirstChildWhichIsA2 = value28:FindFirstChildWhichIsA("VehicleSeat", true)

          if findFirstChildWhichIsA2 then
            local owner = findFirstChildWhichIsA2:FindFirstChild("Owner")

            if owner and owner:IsA("ObjectValue") and owner.Value == localPlayer8
              or findFirstChildWhichIsA2:GetAttribute("Owner") == localPlayer8.Name then
              v64 = value28
              break
            end
          end
        end

        if not v64 then
          if library and library.Notify then
            library:Notify({
              Title = "Car Teleporter",
              Description = "Your car hasn't spawned yet!",
              Duration = 5,
            })
          end

          return
        elseif not v64.PrimaryPart then
          local primaryPart = v64:FindFirstChild("PrimaryPart")

          local basePart = primaryPart
          basePart = primaryPart or v64:FindFirstChildWhichIsA("BasePart")

          if basePart then
            v64.PrimaryPart = basePart
            v64:SetPrimaryPartCFrame(humanoidRootPart3.CFrame * CFrame.new(0, 0, -12))

            if library and library.Notify then
              library:Notify({
                Title = "Car Teleporter",
                Description = "Your car has been teleported to you!",
                Duration = 5,
              })
            end

            return
          end

          warn("Your car has no identifiable PrimaryPart.")
          return
        else
          v64:SetPrimaryPartCFrame(humanoidRootPart3.CFrame * CFrame.new(0, 0, -12))

          if library and library.Notify then
            library:Notify({
              Title = "Car Teleporter",
              Description = "Your car has been teleported to you!",
              Duration = 5,
            })
          end

          return
        end
      end
    end
  end,
  DoubleClick = false,
  Tooltip = "Teleport your car to you (if you own one)",
  DisabledTooltip = "Cannot bring car",
  Disabled = false,
  Visible = true,
  Risky = false,
})

cars:AddButton({
  Text = "Steal Nearest Car",
  Func = function()
    local character6 = localPlayer8.Character or localPlayer8.CharacterAdded:Wait()
    local humanoidRootPart4 = character6:WaitForChild("HumanoidRootPart")
    local humanoid4 = character6:WaitForChild("Humanoid")

    local function f27()
      local civCars3 = workspace:FindFirstChild("CivCars")

      if not civCars3 then
        return nil
      else
        local v65 = nil
        local huge = math.huge

        for index12, value29 in ipairs(civCars3:GetChildren()) do
          local findFirstChildWhichIsA3 = value29:FindFirstChildWhichIsA("VehicleSeat", true)

          if findFirstChildWhichIsA3 and findFirstChildWhichIsA3.Occupant == nil then
            local magnitude = (findFirstChildWhichIsA3.Position - humanoidRootPart4.Position).Magnitude

            if magnitude < huge then
              huge = magnitude
              v65 = findFirstChildWhichIsA3
            end
          end
        end

        return v65
      end
    end

    local v66 = f27()

    if v66 then
      humanoid4:ChangeState(0)
      humanoidRootPart4.CFrame = v66.CFrame + Vector3.new(0, 3, 0)
    else
      warn("No available car seat found.")
    end
  end,
  DoubleClick = false,
  Tooltip = "Steal the nearest unoccupied car",
  DisabledTooltip = "No cars available",
  Disabled = false,
  Visible = true,
  Risky = false,
})

local fistMods = v2.Combat:AddLeftGroupbox("FistMods")

fistMods:AddToggle("AntiCooldownSwing", {
  Text = "Anti Cooldown Swing",
  Tooltip = "Removes swing cooldown",
  Default = false,
  Callback = function(value30)
    local tool2 = game.Players.LocalPlayer.Character
      and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool2 and tool2:FindFirstChild("Melee_Settings") then
      require(tool2.Melee_Settings).SwingCooldown = value30 and 0 or nil
    end
  end,
})

fistMods:AddToggle("AntiCooldownStomp", {
  Text = "Anti Cooldown Stomp",
  Tooltip = "Removes stomp cooldown",
  Default = false,
  Callback = function(value31)
    local tool3 = game.Players.LocalPlayer.Character
      and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool3 and tool3:FindFirstChild("Melee_Settings") then
      require(tool3.Melee_Settings).StompCooldown = value31 and 0 or nil
    end
  end,
})

fistMods:AddToggle("AntiCooldownAttack", {
  Text = "Anti Cooldown Attack",
  Tooltip = "Removes attack cooldown",
  Default = false,
  Callback = function(value32)
    local tool4 = game.Players.LocalPlayer.Character
      and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool4 and tool4:FindFirstChild("Melee_Settings") then
      require(tool4.Melee_Settings).AttackCooldown = value32 and 0 or nil
    end
  end,
})

local gunMods = v2.Combat:AddLeftGroupbox("GunMods")

gunMods:AddToggle("OneTap", {
  Text = "1 Tap",
  Tooltip = "Massively boosts damage",
  Default = false,
  Callback = function(value33)
    local tool5 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool5 and tool5:FindFirstChild("Setting") then
      require(tool5.Setting).BaseDamage = value33 and 9000000000 or 25
    end
  end,
})

gunMods:AddToggle("InfiniteAmmo", {
  Text = "Infinite Ammo",
  Tooltip = "Removes limited ammo and sets large ammo values",
  Default = false,
  Callback = function(value34)
    local tool6 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool6 and tool6:FindFirstChild("Setting") then
      local v67 = require(tool6.Setting)
      v67.LimitedAmmoEnabled = not value34

      if value34 then
        v67.MaxAmmo = 100000000
        v67.AmmoPerMag = 10000000
        v67.Ammo = 100000000
      end
    end
  end,
})

gunMods:AddToggle("InfiniteMag", {
  Text = "Infinite Mag",
  Tooltip = "Gives massive magazine size",
  Default = false,
  Callback = function(value35)
    local tool7 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool7 and tool7:FindFirstChild("Setting") then
      require(tool7.Setting).AmmoPerMag = 1000000000
    end
  end,
})

gunMods:AddToggle("InfiniteRange", {
  Text = "Infinite Range",
  Tooltip = "Sets weapon range to extremely high value",
  Default = false,
  Callback = function(value36)
    local tool8 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool8 and tool8:FindFirstChild("Setting") then
      require(tool8.Setting).Range = 9000000000
    end
  end,
})

gunMods:AddToggle("FullyAutomatic", {
  Text = "Fully Automatic",
  Tooltip = "Makes weapon fully auto",
  Default = false,
  Callback = function(value37)
    local tool9 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool9 and tool9:FindFirstChild("Setting") then
      require(tool9.Setting).Auto = 9000000000
    end
  end,
})

gunMods:AddToggle("DisableJamming", {
  Text = "Disable Jamming",
  Tooltip = "Prevents weapon jams",
  Default = false,
  Callback = function(value38)
    local tool10 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool10 and tool10:FindFirstChild("Setting") then
      require(tool10.Setting).JamChance = 0
    end
  end,
})

gunMods:AddToggle("DisableRecoil", {
  Text = "Disable Recoil",
  Tooltip = "Completely removes recoil",
  Default = false,
  Callback = function(value39)
    local tool11 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool11 and tool11:FindFirstChild("Settings") then
      require(tool11.Settings).Recoil = value39 and 0 or 1
    end
  end,
})

gunMods:AddToggle("SniperMode", {
  Text = "Enable Sniper Mode",
  Tooltip = "Activates sniper-specific settings",
  Default = false,
  Callback = function(value40)
    local tool12 = game.Players.LocalPlayer.Character
      and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool12 and tool12:FindFirstChild("Setting") then
      require(tool12.Setting).SniperEnabled = value40
    end
  end,
})

gunMods:AddToggle("AutoReload", {
  Text = "Enable Auto Reload",
  Tooltip = "Automatically reloads weapon",
  Default = false,
  Callback = function(value41)
    local tool13 = game.Players.LocalPlayer.Character
      and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")

    if tool13 and tool13:FindFirstChild("Setting") then
      require(tool13.Setting).AutoReload = value41
    end
  end,
})

local aimBot = v2.Combat:AddRightGroupbox("AimBot")
local localPlayer9 = game.Players.LocalPlayer
local currentCamera4 = workspace.CurrentCamera
local v68 = false
local v69 = "HumanoidRootPart"

local function f28()
  if not localPlayer9.Character or not localPlayer9.Character:FindFirstChild("HumanoidRootPart") then
    return nil
  else
    local v70 = nil
    local huge2 = math.huge

    for index13, value42 in ipairs(workspace:GetChildren()) do
      if value42:IsA("Model") and value42 ~= localPlayer9.Character
        and value42:FindFirstChild(v69) then
        local magnitude2 = (localPlayer9.Character.HumanoidRootPart.Position
          - value42[v69].Position).Magnitude

        if magnitude2 < huge2 then
          huge2 = magnitude2
          v70 = value42
        end
      end
    end

    return v70
  end
end

local function f29()
  local v71 = f28()

  if v71 and v71:FindFirstChild(v69) then
    currentCamera4.CFrame = CFrame.new(currentCamera4.CFrame.Position, v71[v69].Position)
  end
end

runService.RenderStepped:Connect(function()
  if v68 then
    f29()
  end
end)

aimBot:AddToggle("TargetLockToggle", {
  Text = "Enable Target Lock",
  Default = false,
  Callback = function(value43)
    v68 = value43
    print("Target Lock:", value43)
  end,
})

aimBot:AddDropdown("AimPartDropdown", {
  Values = { "HumanoidRootPart", "Head" },
  Default = "HumanoidRootPart",
  Multi = false,
  Text = "Aim Part",
  Callback = function(value44)
    v69 = value44
    print("Aim part:", v69)
  end,
})

local hitBox = v2.Combat:AddLeftGroupbox("HitBox")
local localPlayer10 = players.LocalPlayer

_G.HeadSize = 50
_G.Enabled = false
_G.Rainbow = false
_G.HeadColor = Color3.fromRGB(0, 0, 255)

local function f30()
  local v72 = tick()
  return Color3.fromHSV(v72 * 2 % 5 / 5, 1, 1)
end

local v73 = {}

hitBox:AddToggle("HitboxToggle", {
  Text = "Enable Hitbox",
  Default = false,
  Callback = function(value45)
    _G.Enabled = value45

    if not value45 then
      for key6, value46 in pairs(v73) do
        if key6.Character and key6.Character:FindFirstChild("HumanoidRootPart") then
          local humanoidRootPart5 = key6.Character.HumanoidRootPart
          humanoidRootPart5.Size = value46.Size
          humanoidRootPart5.Transparency = value46.Transparency
          humanoidRootPart5.BrickColor = value46.BrickColor
          humanoidRootPart5.Material = value46.Material
          humanoidRootPart5.CanCollide = value46.CanCollide
        end
      end

      v73 = {}
    end
  end,
})

hitBox:AddSlider("HitboxSizeSlider", {
  Text = "Hitbox Size",
  Min = 5,
  Max = 100,
  Increment = 1,
  Default = _G.HeadSize,
  Suffix = "size",
  Callback = function(value47) _G.HeadSize = value47 end,
})

hitBox:AddLabel("Hitbox Color"):AddColorPicker("HitboxColorPicker", {
  Default = _G.HeadColor,
  Title = "Hitbox Color",
  Transparency = 0,
  Callback = function(value48) _G.HeadColor = value48 end,
})

options.HitboxColorPicker:OnChanged(function()
  print("Hitbox color changed!", options.HitboxColorPicker.Value)
  print("Transparency changed!", options.HitboxColorPicker.Transparency)
end)

options.HitboxColorPicker:SetValueRGB(_G.HeadColor)

hitBox:AddToggle("HitboxRainbowToggle", {
  Text = "Rainbow Hitbox",
  Default = false,
  Callback = function(value49) _G.Rainbow = value49 end,
})

runService.RenderStepped:Connect(function()
  if _G.Enabled then
    for index14, value50 in ipairs(players:GetPlayers()) do
      local v74 = value50

      if v74 ~= localPlayer10 and v74.Character
        and v74.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
          local humanoidRootPart6 = v74.Character.HumanoidRootPart

          if not v73[v74] then
            v73[v74] = {
              Size = humanoidRootPart6.Size,
              Transparency = humanoidRootPart6.Transparency,
              BrickColor = humanoidRootPart6.BrickColor,
              Material = humanoidRootPart6.Material,
              CanCollide = humanoidRootPart6.CanCollide,
            }
          end

          humanoidRootPart6.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
          humanoidRootPart6.Transparency = 0.7
          humanoidRootPart6.BrickColor = BrickColor.new(_G.Rainbow and f30() or _G.HeadColor)
          humanoidRootPart6.Material = Enum.Material.Neon
          humanoidRootPart6.CanCollide = false
        end)
      end
    end
  end
end)

local fov = v2.Combat:AddLeftGroupbox("Fov")
local localPlayer11 = players.LocalPlayer
local v75 = 0
local v76 = 100
local v77 = false

local circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(255, 255, 255)
circle.Thickness = 2
circle.NumSides = 300
circle.Transparency = 1
circle.Visible = false
circle.Filled = false
circle.Radius = v76

local v78 = {}

local function f31(p19)
  for key7, value51 in pairs(v78) do
    value51:Remove()
  end

  v78 = {}

  for i10 = 1, p19 do
    local line = Drawing.new("Line")
    line.Color = Color3.fromRGB(255, 255, 255)
    line.Thickness = 2
    line.Transparency = 1
    line.Visible = false

    table.insert(v78, line)
  end
end

if v75 > 0 then
  f31(v75)
else
  f31(0)
end

local function f32(p20, p21, p22)
  for i11 = 1, p22 do
    local v79 = 2 * math.pi / p22 * (i11 - 1) - math.pi / 2
    local v80 = 2 * math.pi / p22 * (i11 % p22) - math.pi / 2
    local v81 = math.cos(v79)
    local v82 = math.sin(v79)
    local vector = Vector2.new(p20.X + p21 * v81, p20.Y + p21 * v82)
    local new = Vector2.new
    local x = p20.X
    local v83 = math.cos(v80)
    local y = p20.Y
    local v84 = math.sin(v80)
    local to = new(x + p21 * v83, y + p21 * v84)

    v78[i11].From = vector
    v78[i11].To = to
    v78[i11].Visible = v77
  end
end

local function f33()
  for key8, value52 in pairs(v78) do
    value52.Visible = false
  end
end

fov:AddToggle("FOVToggle", {
  Text = "Enable FOV Circle",
  Default = false,
  Tooltip = "Draws a circle or polygon FOV",
  Callback = function(value53)
    v77 = value53

    if v77 then
      if v75 == 0 then
        circle.Visible = true
        f33()
      else
        circle.Visible = false

        for key9, value54 in pairs(v78) do
          value54.Visible = true
        end
      end
    else
      circle.Visible = false
      f33()
    end
  end,
})

fov:AddSlider("FOVSides", {
  Text = "Sides",
  Min = 0,
  Max = 40,
  Increment = 1,
  Default = v75,
  Suffix = "sides",
  Callback = function(value55)
    v75 = value55

    if v75 == 0 then
      circle.Visible = v77
      f33()
    elseif v75 >= 3 then
      circle.Visible = false
      f31(v75)

      if v77 then
        for key10, value56 in pairs(v78) do
          value56.Visible = true
        end
      end
    else
      v75 = 0
      circle.Visible = v77
      f33()
    end
  end,
})

fov:AddSlider("FOVRadius", {
  Text = "Radius",
  Min = 10,
  Max = 300,
  Increment = 1,
  Default = v76,
  Suffix = "px",
  Callback = function(value57)
    v76 = value57
    circle.Radius = v76
  end,
})

runService.RenderStepped:Connect(function()
  if v77 then
    local getMouse = localPlayer11:GetMouse()
    local vector2 = Vector2.new(getMouse.X, getMouse.Y)

    if v75 == 0 then
      circle.Position = vector2
      circle.Radius = v76
      circle.Visible = true

      f33()
    else
      f32(vector2, v76, v75)
      circle.Visible = false
    end
  else
    circle.Visible = false
    f33()
  end
end)

local snapLines = v2.Combat:AddRightGroupbox("SnapLines")
local currentCamera5 = workspace.CurrentCamera
local localPlayer12 = players.LocalPlayer
local color = Color3.fromRGB(255, 0, 0)
local v85 = false

local line2 = Drawing.new("Line")
line2.Visible = false
line2.Thickness = 2
line2.Color = color

local function f34(p23)
  local character7 = p23.Character

  if not character7 then
    return false
  else
    local head = character7:FindFirstChild("Head")
    local v86 = not head
    local humanoid5 = character7:FindFirstChildOfClass("Humanoid")

    if v86 or not humanoid5 or humanoid5.Health <= 0 then
      return false
    else
      local v87, v88 = currentCamera5:WorldToViewportPoint(head.Position)

      if not v88 then
        return false
      else
        local getMouseLocation = userInputService:GetMouseLocation()
        return (Vector2.new(v87.X, v87.Y) - getMouseLocation).Magnitude <= 150
      end
    end
  end
end

local function f35()
  local v89 = 300
  local v90

  for index15, value58 in ipairs(players:GetPlayers()) do
    if value58 ~= localPlayer12 and value58.Character then
      local character8 = value58.Character
      local humanoidRootPart7 = character8:FindFirstChild("HumanoidRootPart")
      local v91 = humanoidRootPart7
      local humanoid6 = character8:FindFirstChildOfClass("Humanoid")

      if humanoidRootPart7 then
        v91 = humanoid6 and humanoid6.Health > 0 and f34(value58)
      end

      if v91 then
        local magnitude3 = (localPlayer12.Character.HumanoidRootPart.Position
          - humanoidRootPart7.Position).Magnitude

        if magnitude3 < v89 then
          v89 = magnitude3
          v90 = value58
        end
      end
    end
  end

  return v90
end

runService.RenderStepped:Connect(function()
  if not v85 then
    line2.Visible = false
    return
  else
    local v92 = f35()

    if v92 and v92.Character then
      local humanoidRootPart8 = v92.Character:FindFirstChild("HumanoidRootPart")

      if humanoidRootPart8 then
        local v93, v94 = currentCamera5:WorldToViewportPoint(humanoidRootPart8.Position)

        if v94 then
          line2.From = userInputService:GetMouseLocation()
          line2.To = Vector2.new(v93.X, v93.Y)
          line2.Color = color
          line2.Visible = true

          return
        end
      end

      line2.Visible = false
      return
    end

    line2.Visible = false
    return
  end
end)

snapLines:AddToggle("SnaplineToggle", {
  Text = "Enable Snapline",
  Default = false,
  Tooltip = "Draw a line to the closest enemy",
  Callback = function(value59)
    v85 = value59

    if not value59 then
      line2.Visible = false
    end
  end,
})

snapLines:AddLabel("Snapline Color"):AddColorPicker("SnaplineColorPicker", {
  Default = color,
  Title = "Snapline Color",
  Transparency = 0,
  Callback = function(value60) color = value60 end,
})

options.SnaplineColorPicker:OnChanged(function()
  print("Color changed!", options.SnaplineColorPicker.Value)
  print("Transparency changed!", options.SnaplineColorPicker.Transparency)
end)

options.SnaplineColorPicker:SetValueRGB(Color3.fromRGB(255, 0, 0))

local triggerBot = v2.Combat:AddRightGroupbox("TriggerBot")
local localPlayer13 = players.LocalPlayer
local getMouse2 = localPlayer13:GetMouse()
local v95 = false
local v96 = 0.1

triggerBot:AddToggle("TriggerBotToggle", {
  Text = "TriggerBot",
  Default = false,
  Tooltip = "Automatically clicks enemies under your cursor",
  Callback = function(value61) v95 = value61 end,
})

triggerBot:AddSlider("ClickDelaySlider", {
  Text = "Clicking Delay",
  Min = 0.05,
  Max = 1,
  Increment = 0.05,
  Default = 0.1,
  Suffix = "s",
  Tooltip = "Delay between auto-clicks",
  Callback = function(value62) v96 = value62 end,
})

task.spawn(function()
  while true do
    if v95 and getMouse2.Target and getMouse2.Target.Parent:FindFirstChild("Humanoid")
      and getMouse2.Target.Parent.Name ~= localPlayer13.Name then
      mouse1press()
      task.wait()
      mouse1release()
      task.wait(v96)
    else
      task.wait(0.05)
    end
  end
end)

local inGameMods = v2.Misc:AddRightGroupbox("InGameMods")
local localPlayer14 = players.LocalPlayer

local function f36()
  local safes = workspace:WaitForChild("1# Map"):WaitForChild("2 Crosswalks"):WaitForChild("Safes")
  local character9 = localPlayer14.Character

  if not character9 or not character9:FindFirstChild("HumanoidRootPart") then
    return nil
  else
    local humanoidRootPart9 = character9.HumanoidRootPart
    local v97 = nil
    local huge3 = math.huge

    for key11, value63 in pairs(safes:GetChildren()) do
      if value63:IsA("Model") then
        local primaryPart2 = value63.PrimaryPart

        local basePart2 = primaryPart2
        basePart2 = primaryPart2 or value63:FindFirstChildWhichIsA("BasePart")

        if basePart2 then
          local magnitude4 = (humanoidRootPart9.Position - basePart2.Position).Magnitude

          if magnitude4 < huge3 then
            v97 = value63
            huge3 = magnitude4
          end
        end
      end
    end

    return v97
  end
end

local f37

local function f38()
  local v98 = f36()

  if not v98 then
    warn("No safe found!")
    return
  else
    local primaryPart3 = v98.PrimaryPart or v98:FindFirstChildWhichIsA("BasePart")

    if not primaryPart3 then
      warn("Safe has no BasePart!")
      return
    end

    if f37(primaryPart3.CFrame + Vector3.new(0, 3, 0)) then
      print("Teleported to safe:", v98.Name)
    else
      warn("Teleport failed")
    end

    return
  end
end

function f37(cframe2)
  local character10 = localPlayer14.Character

  if not character10 or not character10:FindFirstChild("Humanoid")
    or not character10:FindFirstChild("HumanoidRootPart") then
    warn("Character or Humanoid/HumanoidRootPart missing")
    return false
  end

  character10.Humanoid:ChangeState(0)
  localPlayer14:GetAttribute("LastACPos")
  local v99

  repeat
    task.wait()
    v99 = localPlayer14
  until not v99:GetAttribute("LastACPos")

  character10.HumanoidRootPart.CFrame = cframe2
  return true
end

inGameMods:AddButton({
  Text = "Teleport To Closest Safe",
  Func = function() f38() end,
  Tooltip = "Automatically teleports you to the closest safe",
})

local localPlayer15 = game.Players.LocalPlayer
local v100 = false

inGameMods:AddToggle("InfStaminaToggle", {
  Text = "Inf Stamina",
  Default = false,
  Tooltip = "Prevents stamina from decreasing",
  Callback = function(value64)
    v100 = value64

    if value64 then
      task.spawn(function()
        while v100 do
          task.wait(1)

          if localPlayer15 and localPlayer15:FindFirstChild("PlayerGui") then
            local staminaBarScript = localPlayer15.PlayerGui:FindFirstChild("Run")
              and localPlayer15.PlayerGui.Run:FindFirstChild("Frame")
              and localPlayer15.PlayerGui.Run.Frame:FindFirstChild("Frame")
              and localPlayer15.PlayerGui.Run.Frame.Frame:FindFirstChild("Frame")
              and localPlayer15.PlayerGui.Run.Frame.Frame.Frame:FindFirstChild("StaminaBarScript")

            if staminaBarScript then
              staminaBarScript.Disabled = true
            end
          end
        end
      end)
    end
  end,
})

local v101 = false

inGameMods:AddToggle("InfHungerToggle", {
  Text = "Inf Hunger",
  Default = false,
  Tooltip = "Prevents hunger from decreasing",
  Callback = function(value65)
    v101 = value65

    if value65 then
      task.spawn(function()
        while v101 do
          task.wait(1)

          if localPlayer15 and localPlayer15:FindFirstChild("PlayerGui") then
            local hunger = localPlayer15.PlayerGui:FindFirstChild("Hunger")

            if hunger then
              local hungerBarScript = hunger:FindFirstChild("Frame")
                and hunger.Frame:FindFirstChild("Frame")
                and hunger.Frame.Frame:FindFirstChild("Frame")
                and hunger.Frame.Frame.Frame:FindFirstChild("HungerBarScript")

              if hungerBarScript then
                hungerBarScript.Disabled = true
              end
            end
          end
        end
      end)
    end
  end,
})

local v102 = false

inGameMods:AddToggle("InfSleepToggle", {
  Text = "Inf Sleep",
  Default = false,
  Tooltip = "Prevents sleep from decreasing",
  Callback = function(value66)
    v102 = value66

    if value66 then
      task.spawn(function()
        while v102 do
          task.wait(1)

          if localPlayer15 and localPlayer15:FindFirstChild("PlayerGui") then
            local sleepGui = localPlayer15.PlayerGui:FindFirstChild("SleepGui")

            if sleepGui then
              local sleepScript = sleepGui:FindFirstChild("Frame")
                and sleepGui.Frame:FindFirstChild("sleep")
                and sleepGui.Frame.sleep:FindFirstChild("SleepBar")
                and sleepGui.Frame.sleep.SleepBar:FindFirstChild("sleepScript")

              if sleepScript then
                sleepScript.Disabled = true
              end
            end
          end
        end
      end)
    end
  end,
})

local v103 = false

inGameMods:AddToggle("NoFallDamageToggle", {
  Text = "No Fall Damage",
  Default = false,
  Tooltip = "Prevents fall damage",
  Callback = function(value67)
    v103 = value67

    if value67 then
      task.spawn(function()
        while v103 do
          task.wait(1)

          if localPlayer15 and localPlayer15.Character then
            local fallDamageRagdoll = localPlayer15.Character:FindFirstChild("FallDamageRagdoll")

            if fallDamageRagdoll then
              fallDamageRagdoll.Disabled = true
            end
          end
        end
      end)
    end
  end,
})

inGameMods:AddToggle("NoJumpCooldownToggle", {
  Text = "No Jump Cooldown",
  Default = false,
  Tooltip = "Removes jump cooldown",
  Callback = function(value68)
    getgenv().noJumpCooldown = value68

    if value68 then
      task.spawn(function()
        while getgenv().noJumpCooldown do
          task.wait(0.2)

          pcall(function()
            local playerGui2 = localPlayer15:FindFirstChild("PlayerGui")

            if playerGui2 then
              local jumpDebounce = playerGui2:FindFirstChild("JumpDebounce")

              if jumpDebounce then
                jumpDebounce:Destroy()
              end
            end
          end)
        end
      end)
    end
  end,
})

local v104 = false

inGameMods:AddToggle("NoRentPayToggle", {
  Text = "No Rent Pay",
  Default = false,
  Tooltip = "Disables rent payment scripts",
  Callback = function(value69)
    v104 = value69

    if value69 then
      task.spawn(function()
        while v104 do
          task.wait(1)

          if localPlayer15 then
            local rentGui = localPlayer15:FindFirstChild("PlayerGui")
              and localPlayer15.PlayerGui:FindFirstChild("RentGui")

            if rentGui then
              local localScript = rentGui:FindFirstChild("LocalScript")

              if localScript then
                localScript.Disabled = true
                localScript:Destroy()
              end
            end
          end
        end
      end)
    end
  end,
})

local characterMods = v2.Misc:AddLeftGroupbox("CharacterMods")

local function f39(p24, p25)
  local character11 = game.Players.LocalPlayer.Character

  if character11 and character11:FindFirstChild("CharacterSettings") then
    require(character11.CharacterSettings)[p24] = p25
  end
end

local v105 = identifyexecutor and identifyexecutor() or "Unknown"

if not ({
  Solara = true,
  JJSploit = true,
  Xeno = true,
  Zorara = true,
  Ronix = true,
})[v105] then
  characterMods:AddToggle("MaxPickUpRangeToggle", {
    Text = "No Max Pick Up Range",
    Default = false,
    Tooltip = "Increases pickup range to maximum",
    Callback = function(value70) f39("MaxPickUpRange", value70 and 1000 or 6.5) end,
  })

  characterMods:AddToggle("NoKnockBackToggle", {
    Text = "No KnockBack",
    Default = false,
    Tooltip = "Prevents knockback from hits",
    Callback = function(value71) f39("KnockAt", value71 and 1000 or 27) end,
  })

  characterMods:AddToggle("NoCarryCooldownToggle", {
    Text = "No Carry Cooldown",
    Default = false,
    Tooltip = "Removes carry cooldown",
    Callback = function(value72) f39("CarryCooldown", value72 and 0 or 0.25) end,
  })
else
  warn("Executor not supported:", v105)
end

local misc = v2.Misc:AddLeftGroupbox("Misc")
local localPlayer16 = game.Players.LocalPlayer
local connect4 = nil

local function f40()
  for key12, value73 in pairs(v1:GetDescendants()) do
    if value73:IsA("ProximityPrompt") then
      value73.HoldDuration = 0
    end
  end

  connect4 = proximityPromptService.PromptButtonHoldBegan:Connect(function(player)
    player.HoldDuration = 0
  end)
end

local function f41()
  if connect4 then
    connect4:Disconnect()
    connect4 = nil
  end
end

misc:AddToggle("InstantInteractToggle", {
  Text = "Instant Interact",
  Default = false,
  Tooltip = "Makes all Proximity Prompts instant",
  Callback = function(value74)
    if value74 then
      f40()
    else
      f41()
    end
  end,
})

local v106 = false

misc:AddToggle("NoCameraBobbingToggle", {
  Text = "No Camera Bobbing",
  Default = false,
  Tooltip = "Removes camera bobbing",
  Callback = function(value75)
    v106 = value75

    if value75 then
      task.spawn(function()
        while v106 do
          task.wait(1)

          if localPlayer16 and localPlayer16.Character then
            local cameraBobbing = localPlayer16.Character:FindFirstChild("CameraBobbing")

            if cameraBobbing then
              cameraBobbing:Destroy()
            end
          end
        end
      end)
    end
  end,
})

task.spawn(function()
  local bloodGui = localPlayer16:WaitForChild("PlayerGui"):WaitForChild("BloodGui")
  bloodGui.Enabled = true

  LeftGroupBox:AddToggle("NoBloodToggle", {
    Text = "No Blood",
    Default = false,
    Tooltip = "Disables blood effects",
    Callback = function(value76) bloodGui.Enabled = not value76 end,
  })
end)

misc:AddToggle("NoDeathScreenToggle", {
  Text = "No Death Screen",
  Default = false,
  Tooltip = "Disables the death screen",
  Callback = function(value77)
    replicatedStorage:WaitForChild("deathScreen").Enabled = not value77
  end,
})

misc:AddToggle("NoCrawlToggle", {
  Text = "No Crawl When Damaged",
  Default = false,
  Tooltip = "Disables crawling animation when damaged",
  Callback = function(value78)
    local function f42(p26)
      local crawlWhenDamaged = p26:FindFirstChild("crawlWhenDamaged")

      if crawlWhenDamaged then
        crawlWhenDamaged.Disabled = value78
      end

      local humanoid7 = p26:FindFirstChildOfClass("Humanoid")

      if humanoid7 then
        for key13, value79 in pairs(humanoid7:GetPlayingAnimationTracks()) do
          if value79.Name == "crawlAnimation" and value78 then
            value79:Stop()
          end
        end
      end
    end

    if localPlayer16.Character then
      f42(localPlayer16.Character)
    end

    localPlayer16.CharacterAdded:Connect(function(character12)
      if value78 then
        f42(character12)
      end
    end)
  end,
})

local autoFarm = v2.AutoFarm:AddLeftGroupbox("AutoFarm")
local localPlayer17 = players.LocalPlayer
local currentCamera6 = workspace.CurrentCamera
local v107 = false

local function f43()
  for key14, value80 in pairs(workspace.Dollas:GetDescendants()) do
    if value80:IsA("ProximityPrompt") and value80.Name == "ProximityPrompt" then
      value80.HoldDuration = 0
      value80.RequiresLineOfSight = false
    end
  end
end

local v108

local function f44()
  f43()

  v108 = task.spawn(function()
    local v109

    while v107 do
      task.wait()
      local v110 = false

      for key15, value81 in pairs(workspace.Dollas:GetDescendants()) do
        if value81:IsA("ProximityPrompt") and value81.Name == "ProximityPrompt" and v107 then
          v110 = true
          f43()

          currentCamera6.CFrame = CFrame.new(
            currentCamera6.CFrame.Position, value81.Parent.CFrame.Position
          )

          local character13 = localPlayer17.Character

          local humanoid8 = character13
          humanoid8 = character13 and character13:FindFirstChildOfClass("Humanoid")

          local humanoidRootPart10 = character13
          humanoidRootPart10 = character13 and character13:FindFirstChild("HumanoidRootPart")

          if humanoid8 and humanoidRootPart10 then
            humanoid8:ChangeState(0)
            localPlayer17:GetAttribute("LastACPos")

            repeat
              task.wait()
              v109 = localPlayer17
            until not v109:GetAttribute("LastACPos")

            humanoidRootPart10.CFrame = value81.Parent.CFrame
          end

          task.wait(0.25)
          fireproximityprompt(value81)
        end
      end

      if not v110 then
        pcall(function() library:Notify("Auto Cash Pickup: No dropped cash found!", 4) end)
        task.wait(3)
      end
    end
  end)
end

local function f45()
  v107 = false

  if v108 then
    task.cancel(v108)
    v108 = nil
  end
end

autoFarm:AddToggle("AutoPickupToggle", {
  Text = "Auto Collect Dropped Cash",
  Default = false,
  Tooltip = "Automatically collects dropped cash near you",
  Callback = function(value82)
    v107 = value82

    if v107 then
      f44()
    else
      f45()
    end
  end,
})

local localPlayer18 = players.LocalPlayer
local v111 = false

local function f46(p27)
  if p27 and p27:IsA("ProximityPrompt") then
    fireproximityprompt(p27)
  end
end

local function f47()
  return localPlayer18.Character or localPlayer18.CharacterAdded:Wait()
end

local function f48(cframe3)
  local v112 = f47()
  local humanoid9 = v112:WaitForChild("Humanoid")
  local humanoidRootPart11 = v112:WaitForChild("HumanoidRootPart")
  humanoid9:ChangeState(0)
  localPlayer18:GetAttribute("LastACPos")
  local v113

  repeat
    task.wait()
    v113 = localPlayer18
  until not v113:GetAttribute("LastACPos")

  humanoidRootPart11.CFrame = cframe3
end

local function f49()
  return localPlayer18:FindFirstChild("Backpack")
end

local function f50()
  local v114 = f49()

  if v114 then
    local plyWood = v114:FindFirstChild("PlyWood")

    if plyWood then
      plyWood.Parent = f47()
    end
  end
end

local function f51()
  local v115 = f49()
  local v116 = f47()
  return v115 and v115:FindFirstChild("PlyWood") or v116 and v116:FindFirstChild("PlyWood")
end

local f52

local function f53(p28, p29)
  local proximityPrompt6 = workspace.ConstructionStuff[p28]:FindFirstChildOfClass("ProximityPrompt")

  while v111 and proximityPrompt6 and proximityPrompt6.Enabled do
    f48(p29)
    task.wait(0.01)
    f46(proximityPrompt6)
    task.wait()

    if not f51() then
      f52()
    end
  end
end

function f52()
  f48(CFrame.new(-1727, 371, -1178))
  task.wait(0.1)

  while v111 and not f51() do
    f46(workspace.ConstructionStuff["Grab Wood"]:FindFirstChildOfClass("ProximityPrompt"))
    task.wait(0.1)
    f50()
  end
end

autoFarm:AddToggle("ConstructionAutofarm", {
  Text = "Enable Construction Autofarm",
  Default = false,
  Tooltip = "Automatically farm and build walls",
  Callback = function(value83)
    v111 = value83

    if v111 then
      task.spawn(function()
        while v111 do
          if not f51() then
            f52()
          end

          f53("Wall2 Prompt", CFrame.new(-1705, 368, -1151))
          f53("Wall3 Prompt", CFrame.new(-1732, 368, -1152))
          f53("Wall4 Prompt2", CFrame.new(-1772, 368, -1152))
          f53("Wall1 Prompt3", CFrame.new(-1674, 368, -1166))

          task.wait(0.1)
        end
      end)
    end
  end,
})

autoFarm:AddButton({
  Text = "Start Construction Job",
  Func = function()
    f48(CFrame.new(-1728, 371, -1172))
    task.wait(0.2)
    f46(workspace.ConstructionStuff["Start Job"]:FindFirstChildOfClass("ProximityPrompt"))
    task.wait(0.5)
  end,
  Tooltip = "Starts your construction job",
  DoubleClick = false,
})

local localPlayer19

local function f54(p30, p31, p32)
  local character14 = localPlayer19.Character or localPlayer19.CharacterAdded:Wait()
  local humanoid10 = character14:WaitForChild("Humanoid")
  local humanoidRootPart12 = character14:WaitForChild("HumanoidRootPart")
  humanoid10:ChangeState(0)
  localPlayer19:GetAttribute("LastACPos")
  local v117

  repeat
    task.wait()
    v117 = localPlayer19
  until not v117:GetAttribute("LastACPos")

  humanoidRootPart12.CFrame = CFrame.new(p30, p31, p32)
end

localPlayer19 = game.Players.LocalPlayer
local v118 = false

autoFarm:AddToggle("LootTrashToggle", {
  Text = "Search Trashbags",
  Default = false,
  Tooltip = "Automatically loot all trashbags",
  Callback = function(value84)
    v118 = value84
    getgenv().loottrash = value84

    if value84 then
      for key16, value85 in pairs(workspace:GetDescendants()) do
        if value85:IsA("ProximityPrompt") and value85.Name == "ProximityPrompt"
          and value85.Parent.Name == "DumpsterPromt" then
          value85.HoldDuration = 0
          value85.RequiresLineOfSight = false
        end
      end

      task.spawn(function()
        while v118 do
          task.wait()

          for key17, value86 in pairs(workspace:GetDescendants()) do
            if value86:IsA("ProximityPrompt") and value86.Name == "ProximityPrompt"
              and value86.Parent.Name == "DumpsterPromt" then
              if localPlayer19.Character
                and localPlayer19.Character:FindFirstChild("HumanoidRootPart") then
                f54(
                  value86.Parent.Position.X, value86.Parent.Position.Y,
                  value86.Parent.Position.Z + 3
                )
              end

              workspace.CurrentCamera.CFrame = CFrame.new(
                workspace.CurrentCamera.CFrame.Position, value86.Parent.Position
              )

              task.wait(0.3)

              for i12 = 1, 10 do
                fireproximityprompt(value86)
              end

              task.wait(0.1)

              if not v118 then
                break
              end
            end
          end
        end
      end)
    end
  end,
})

autoFarm:AddButton({
  Text = "Auto Sell Pawned Items",
  Func = function()
    task.spawn(function()
      for index16, value87 in ipairs(localPlayer19.PlayerGui["Bronx PAWNING"].Frame.Holder.List:GetChildren()) do
        if value87:IsA("Frame") then
          local text = value87.Item.Text

          while true do
            if not localPlayer19.Backpack:FindFirstChild(text) then
              break
            end

            game.ReplicatedStorage.PawnRemote:FireServer(text)
            task.wait(0.05)
          end
        end
      end
    end)
  end,
  Tooltip = "Automatically sell all pawned items",
})

local localPlayer20 = game.Players.LocalPlayer
local currentCamera7 = workspace.CurrentCamera

local function f55()
  for key18, value88 in pairs(workspace.StudioPay.Money:GetDescendants()) do
    if value88:IsA("ProximityPrompt") and value88.Name == "Prompt" then
      value88.HoldDuration = 0
      value88.RequiresLineOfSight = false
    end
  end
end

local v119 = false

autoFarm:AddToggle("RobStudioToggle", {
  Text = "Enable Studio Autofarm",
  Default = false,
  Tooltip = "Automatically collect all money in studio",
  Callback = function(value89)
    v119 = value89
    local v120, v121

    if v119 then
      local humanoidRootPart13 = localPlayer20.Character
        and localPlayer20.Character:FindFirstChild("HumanoidRootPart")

      local character15 = localPlayer20.Character

      local humanoid11 = character15
      humanoid11 = character15 and localPlayer20.Character:FindFirstChild("Humanoid")

      local v122 = not humanoidRootPart13
      local v123 = humanoid11

      if v122 or not v123 then
        return
      end

      local cframe4 = humanoidRootPart13.CFrame
      f55()

      for key19, value90 in pairs(workspace.StudioPay.Money:GetDescendants()) do
        if value90:IsA("ProximityPrompt") and value90.Name == "Prompt" and value90.Enabled then
          v123:ChangeState(0)
          localPlayer20:GetAttribute("LastACPos")

          repeat
            task.wait()
            v120 = localPlayer20
          until not v120:GetAttribute("LastACPos")

          humanoidRootPart13.CFrame = CFrame.new(
            value90.Parent.Position.X, value90.Parent.Position.Y + 2, value90.Parent.Position.Z
          )

          currentCamera7.CFrame = CFrame.new(
            currentCamera7.CFrame.Position, value90.Parent.Position
          )

          task.wait(0.25)

          if not (value90.Enabled == false) then
          end

          repeat
            task.wait(0.3)
            fireproximityprompt(value90)
            v121 = value90.Enabled == false or not v119
          until v121

          if not v119 then
            break
          end
        end
      end

      if v119 then
        humanoidRootPart13.CFrame = cframe4
      end

      return
    end
  end,
})

autoFarm:AddButton({
  Text = "Check Studio For Money",
  Func = function()
    local v124 = false

    for key20, value91 in pairs(workspace.StudioPay.Money:GetDescendants()) do
      if value91:IsA("ProximityPrompt") and value91.Name == "Prompt" and value91.Enabled then
        v124 = true
        break
      end
    end

    if v124 then
      library:Notify("Success: Money Found In Studio.", 4)
    else
      library:Notify("Notice: No Money Found In Studio.", 4)
    end
  end,
  Tooltip = "Check if there is money available to collect in the studio",
})

local target = v2.Players:AddLeftGroupbox("Target")

local function f56()
  return game.Players.LocalPlayer.Character
end

local function f57(p33, p34, p35)
  local v125 = f56()
  local localPlayer21

  if not v125 then
    return
  else
    local humanoid12 = v125:FindFirstChild("Humanoid")
    local v126 = not humanoid12
    local humanoidRootPart14 = v125:FindFirstChild("HumanoidRootPart")

    if v126 or not humanoidRootPart14 then
      return
    end

    humanoid12:ChangeState(0)
    game.Players.LocalPlayer:GetAttribute("LastACPos")

    repeat
      task.wait()
      localPlayer21 = game.Players.LocalPlayer
    until not localPlayer21:GetAttribute("LastACPos")

    humanoidRootPart14.CFrame = CFrame.new(p33, p34, p35)
    return
  end
end

local localPlayer22 = players.LocalPlayer

local function f58()
  local v127 = {}

  for index17, value92 in ipairs(players:GetPlayers()) do
    if value92 ~= localPlayer22 then
      table.insert(v127, value92.Name)
    end
  end

  return v127
end

local findFirstChild11

local addDropdown = target:AddDropdown("SelectPlayer", {
  Values = f58(),
  Default = 1,
  Multi = false,
  Text = "Select Player",
  Callback = function(value93) findFirstChild11 = players:FindFirstChild(value93) end,
})

players.PlayerAdded:Connect(function()
  local function f59()
    local v128 = {}

    for index18, value94 in ipairs(players:GetPlayers()) do
      if value94 ~= localPlayer22 then
        table.insert(v128, value94.Name)
      end
    end

    return v128
  end

  addDropdown:SetValues(f59())
end)

players.PlayerRemoving:Connect(function()
  local function f60()
    local v129 = {}

    for index19, value95 in ipairs(players:GetPlayers()) do
      if value95 ~= localPlayer22 then
        table.insert(v129, value95.Name)
      end
    end

    return v129
  end

  addDropdown:SetValues(f60())
end)

target:AddToggle("SpectateToggle", {
  Text = "Spectate Selected Player",
  Default = false,
  Callback = function(value96)
    if value96 then
      if findFirstChild11 and findFirstChild11.Character then
        local character16 = findFirstChild11.Character
        workspace.CurrentCamera.CameraSubject = character16:FindFirstChildOfClass("Humanoid")
      end
    else
      local v130 = f56()

      if v130 and v130:FindFirstChildOfClass("Humanoid") then
        workspace.CurrentCamera.CameraSubject = v130:FindFirstChildOfClass("Humanoid")
      end
    end
  end,
})

target:AddButton("TeleportButton", {
  Text = "Teleport To Selected Player",
  Func = function()
    if findFirstChild11 and findFirstChild11.Character
      and findFirstChild11.Character:FindFirstChild("HumanoidRootPart") then
      local position2 = findFirstChild11.Character.HumanoidRootPart.Position
      f57(position2.X, position2.Y, position2.Z)
    end
  end,
})

local v131 = false

target:AddToggle("LoopTeleportToggle", {
  Text = "Loop Teleport To Selected Player",
  Default = false,
  Callback = function(value97)
    v131 = value97

    if v131 then
      task.spawn(function()
        while v131 do
          if findFirstChild11 and findFirstChild11.Character
            and findFirstChild11.Character:FindFirstChild("HumanoidRootPart") then
            local position3 = findFirstChild11.Character.HumanoidRootPart.Position
            f57(position3.X, position3.Y, position3.Z)
          end

          task.wait(0.1)
        end
      end)
    end
  end,
})

local v132 = false

target:AddToggle("LoopBringToggle", {
  Text = "Loop Bring Selected Player",
  Default = false,
  Callback = function(value98)
    v132 = value98

    if v132 then
      task.spawn(function()
        while v132 do
          if findFirstChild11 and findFirstChild11.Character
            and findFirstChild11.Character:FindFirstChild("HumanoidRootPart") then
            local v133 = f56()

            if v133 and v133:FindFirstChild("HumanoidRootPart") then
              findFirstChild11.Character.HumanoidRootPart.CFrame = CFrame.new(v133.HumanoidRootPart.Position)
            end
          end

          task.wait(0.1)
        end
      end)
    end
  end,
})

local tweet = v2.Players:AddLeftGroupbox("Tweet")
local v134 = "Valley.GG On Top"

local function f61()
  if v134 ~= "" then
    replicatedStorage:WaitForChild("Resources"):WaitForChild("#Phone"):WaitForChild("Main"):FireServer(unpack({
      "Tweet", { "CreateTweet", v134 },
    }))
  end
end

local v135 = false
local v136 = 0

tweet:AddInput("TweetMessageInput", {
  Text = "Tweet Message",
  Default = "Valley.GG On Top",
  Numeric = false,
  Finished = true,
  Tooltip = "Enter the tweet message you want to send.",
  Callback = function(value99)
    v134 = value99
    f61()
  end,
})

tweet:AddSlider("SpamDelaySlider", {
  Text = "Spam Tweets Delay",
  Default = 10,
  Min = 0,
  Max = 10,
  Rounding = 1,
  Compact = false,
  Tooltip = "Set the delay between tweets (in seconds).",
  DisabledTooltip = "This slider is disabled!",
  Disabled = false,
  Visible = true,
  Callback = function(value100) v136 = value100 end,
})

tweet:AddToggle("SpamTweetsToggle", {
  Text = "Spam Tweets",
  Tooltip = "Enable to repeatedly send tweets automatically.",
  DisabledTooltip = "Toggle disabled!",
  Default = false,
  Disabled = false,
  Visible = true,
  Callback = function(value101)
    v135 = value101

    if v135 then
      task.spawn(function()
        while v135 do
          f61()
          task.wait(v136)
        end
      end)
    end
  end,
})

local esp = v2.Visuals:AddLeftGroupbox("Esp")
local currentCamera8 = workspace.CurrentCamera
local localPlayer23 = players.LocalPlayer
local v137 = false
local v138 = false
local v139 = false
local v140 = false
local v141 = false
local v142 = false
local v143 = false
local v144 = false
local v145 = false
local v146 = false
local v147 = false
local v148 = false
local v149 = false
local color2 = Color3.fromRGB(255, 255, 255)
local color3 = Color3.fromRGB(255, 255, 255)
local color4 = Color3.fromRGB(255, 255, 255)
local color5 = Color3.fromRGB(255, 255, 255)
local color6 = Color3.fromRGB(255, 255, 255)
local color7 = Color3.fromRGB(255, 255, 255)

local function f62()
  local v150 = tick()
  return Color3.fromHSV(v150 * 2 % 5 / 5, 1, 1)
end

local v151 = {}
local v152 = {}
local f63

local function f64(p36)
  f63(p36)

  local square = Drawing.new("Square")
  square.Thickness = 1
  square.Filled = false
  square.Transparency = 1
  square.Visible = false

  local function f65(size)
    local text2 = Drawing.new("Text")
    text2.Size = size
    text2.Center = true
    text2.Outline = true
    text2.Visible = false

    return text2
  end

  local v153 = f65(14)

  local v154 = f65(13)
  v154.Center = false

  local v155 = f65(13)
  local v156 = f65(13)

  local line3 = Drawing.new("Line")
  line3.Thickness = 1
  line3.Transparency = 1
  line3.Visible = false

  v152[p36] = { square, v153, v154, v155, v156, line3 }

  v151[p36] = runService.RenderStepped:Connect(function()
    local character17 = p36.Character

    local humanoidRootPart15 = character17
    humanoidRootPart15 = character17 and character17:FindFirstChild("HumanoidRootPart")

    local v157 = v137
    local v158 = humanoidRootPart15

    if not (v157 and v158) then
      for key21, value102 in pairs(v152[p36]) do
        value102.Visible = false
      end

      return
    else
      local v159, v160 = currentCamera8:WorldToViewportPoint(v158.Position)

      if not v160 then
        for key22, value103 in pairs(v152[p36]) do
          value103.Visible = false
        end

        return
      else
        local character18 = localPlayer23.Character

        local humanoidRootPart16 = character18
        humanoidRootPart16 = character18 and character18:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart16 then
          for key23, value104 in pairs(v152[p36]) do
            value104.Visible = false
          end

          return
        else
          local magnitude5 = (humanoidRootPart16.Position - v158.Position).Magnitude
          local v161 = math.clamp(3000 / magnitude5, 2, 100)
          local v162 = v161 / 2
          local vector3 = Vector2.new(v159.X - v162 / 2, v159.Y - v161 / 2)
          local humanoid13 = character17:FindFirstChildOfClass("Humanoid")
          local health = humanoid13 and humanoid13.Health or 0
          local maxHealth = humanoid13 and humanoid13.MaxHealth or 100
          local v163 = math.floor(health / maxHealth * 100)
          local tool14 = character17:FindFirstChildOfClass("Tool")
          local name3 = tool14 and tool14.Name or "None"

          square.Size = Vector2.new(v162, v161)
          square.Position = vector3
          square.Color = v139 and f62() or color2
          square.Visible = v138 and v137

          v153.Position = Vector2.new(v159.X, v159.Y - v161 / 2 - 16)
          v153.Text = p36.Name
          v153.Color = v141 and f62() or color3
          v153.Visible = v140 and v137

          v154.Position = Vector2.new(v159.X + v162 / 2 + 4, v159.Y - v161 / 2)
          v154.Text = v163 .. "%"
          v154.Color = v143 and f62() or color4
          v154.Visible = v142 and v137

          v155.Position = Vector2.new(v159.X, v159.Y + v161 / 2 + 2)
          v155.Text = math.floor(magnitude5) .. " studs"
          v155.Color = v145 and f62() or color5
          v155.Visible = v144 and v137

          v156.Position = Vector2.new(v159.X, v159.Y + v161 / 2 + 18)
          v156.Text = name3
          v156.Color = v147 and f62() or color6
          v156.Visible = v146 and v137

          local y2 = false and currentCamera8.ViewportSize.Y / 2
            or currentCamera8.ViewportSize.Y

          line3.From = Vector2.new(currentCamera8.ViewportSize.X / 2, y2)
          line3.To = Vector2.new(v159.X, v159.Y)
          line3.Color = v149 and f62() or color7
          line3.Visible = v148 and v137

          return
        end
      end
    end
  end)
end

function f63(p37)
  if v151[p37] then
    v151[p37]:Disconnect()
    v151[p37] = nil
  end

  if v152[p37] then
    for key24, value105 in pairs(v152[p37]) do
      if value105.Remove then
        value105:Remove()
      elseif value105.Destroy then
        value105:Destroy()
      end
    end

    v152[p37] = nil
  end
end

local function f66()
  for key25, value106 in pairs(players:GetPlayers()) do
    if value106 ~= localPlayer23 then
      f63(value106)
    end
  end
end

local function f67()
  f66()

  for key26, value107 in pairs(players:GetPlayers()) do
    if value107 ~= localPlayer23 then
      f64(value107)
    end
  end
end

players.PlayerAdded:Connect(function(player2)
  if player2 ~= localPlayer23 then
    f64(player2)
  end
end)

players.PlayerRemoving:Connect(function(player3) f63(player3) end)

esp:AddToggle("MainESPToggle", {
  Text = "Enable ESP",
  Default = false,
  Callback = function(value108)
    v137 = value108

    if value108 then
      f67()
    else
      f66()
    end
  end,
})

esp:AddToggle("BoxToggle", {
  Text = "Enable Box",
  Default = false,
  Callback = function(value109) v138 = value109 end,
})

esp:AddLabel("Box Color"):AddColorPicker("BoxColorPicker", {
  Default = color2,
  Title = "Box Color",
  Callback = function(value110) color2 = value110 end,
})

options.BoxColorPicker:OnChanged(function() color2 = options.BoxColorPicker.Value end)

esp:AddToggle("RainbowBoxToggle", {
  Text = "Rainbow Box",
  Default = false,
  Callback = function(value111) v139 = value111 end,
})

esp:AddToggle("NameToggle", {
  Text = "Enable Names",
  Default = false,
  Callback = function(value112) v140 = value112 end,
})

esp:AddLabel("Name Color"):AddColorPicker("NameColorPicker", {
  Default = color3,
  Title = "Name Color",
  Callback = function(value113) color3 = value113 end,
})

options.NameColorPicker:OnChanged(function() color3 = options.NameColorPicker.Value end)

esp:AddToggle("RainbowNameToggle", {
  Text = "Rainbow Names",
  Default = false,
  Callback = function(value114) v141 = value114 end,
})

esp:AddToggle("HealthToggle", {
  Text = "Enable Health",
  Default = false,
  Callback = function(value115) v142 = value115 end,
})

esp:AddLabel("Health Color"):AddColorPicker("HealthColorPicker", {
  Default = color4,
  Title = "Health Color",
  Callback = function(value116) color4 = value116 end,
})

options.HealthColorPicker:OnChanged(function() color4 = options.HealthColorPicker.Value end)

esp:AddToggle("RainbowHealthToggle", {
  Text = "Rainbow Health",
  Default = false,
  Callback = function(value117) v143 = value117 end,
})

esp:AddToggle("DistanceToggle", {
  Text = "Enable Distance",
  Default = false,
  Callback = function(value118) v144 = value118 end,
})

esp:AddLabel("Distance Color"):AddColorPicker("DistanceColorPicker", {
  Default = color5,
  Title = "Distance Color",
  Callback = function(value119) color5 = value119 end,
})

options.DistanceColorPicker:OnChanged(function() color5 = options.DistanceColorPicker.Value end)

esp:AddToggle("RainbowDistanceToggle", {
  Text = "Rainbow Distance",
  Default = false,
  Callback = function(value120) v145 = value120 end,
})

esp:AddToggle("ToolToggle", {
  Text = "Enable Weapon",
  Default = false,
  Callback = function(value121) v146 = value121 end,
})

esp:AddLabel("Weapon Color"):AddColorPicker("ToolColorPicker", {
  Default = color6,
  Title = "Weapon Color",
  Callback = function(value122) color6 = value122 end,
})

options.ToolColorPicker:OnChanged(function() color6 = options.ToolColorPicker.Value end)

esp:AddToggle("RainbowToolToggle", {
  Text = "Rainbow Weapon",
  Default = false,
  Callback = function(value123) v147 = value123 end,
})

esp:AddToggle("TracerToggle", {
  Text = "Enable Tracer",
  Default = false,
  Callback = function(value124) v148 = value124 end,
})

esp:AddLabel("Tracer Color"):AddColorPicker("TracerColorPicker", {
  Default = color7,
  Title = "Tracer Color",
  Callback = function(value125) color7 = value125 end,
})

options.TracerColorPicker:OnChanged(function() color7 = options.TracerColorPicker.Value end)

esp:AddToggle("RainbowTracerToggle", {
  Text = "Rainbow Tracer",
  Default = false,
  Callback = function(value126) v149 = value126 end,
})

local menu = v2["UI Settings"]:AddLeftGroupbox("Menu")

menu:AddToggle("KeybindMenuOpen", {
  Default = library.KeybindFrame.Visible,
  Text = "Open Keybind Menu",
  Callback = function(value127) library.KeybindFrame.Visible = value127 end,
})

menu:AddToggle("ShowCustomCursor", {
  Text = "Custom Cursor 🖱️",
  Default = false,
  Callback = function(value128) library.ShowCustomCursor = value128 end,
})

menu:AddDivider()

menu:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
  Default = "RightShift",
  NoUI = true,
  Text = "Menu keybind",
})

menu:AddButton("Unload", function() library:Unload() end)

library:OnUnload(function() print("Unloaded!") end)

menu:AddButton({
  Text = "Rejoin Same Server",
  Func = function() teleportService:Teleport(game.PlaceId, players.LocalPlayer) end,
  DoubleClick = false,
  Tooltip = "Rejoin the same server you’re currently in",
  DisabledTooltip = "You can’t rejoin right now!",
  Disabled = false,
  Visible = true,
  Risky = false,
})

menu:AddButton({
  Text = "Hop Server",
  Func = function()
    local placeId = game.PlaceId
    local jsonDecode = {}
    local nextPageCursor = ""
    local hour = os.date("!*t").hour

    if not pcall(function() jsonDecode = httpService:JSONDecode(readfile("NotSameServers.json")) end) then
      table.insert(jsonDecode, hour)
      writefile("NotSameServers.json", httpService:JSONEncode(jsonDecode))
    end

    local function f68()
      local jsonDecode2

      if nextPageCursor == "" then
        jsonDecode2 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"
          .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"))
      else
        jsonDecode2 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"
          .. placeId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. nextPageCursor))
      end

      local v164 = ""

      if jsonDecode2.nextPageCursor and jsonDecode2.nextPageCursor ~= "null"
        and jsonDecode2.nextPageCursor ~= nil then
        nextPageCursor = jsonDecode2.nextPageCursor
      end

      local count4 = 0

      for key27, value129 in pairs(jsonDecode2.data) do
        local v165 = true
        v164 = tostring(value129.id)

        if tonumber(value129.maxPlayers) > tonumber(value129.playing) then
          for key28, value130 in pairs(jsonDecode) do
            if count4 ~= 0 then
              if v164 == tostring(value130) then
                v165 = false
              end
            elseif tonumber(hour) ~= tonumber(value130) then
              pcall(function()
                delfile("NotSameServers.json")
                jsonDecode = {}
                table.insert(jsonDecode, hour)
              end)
            end

            count4 = count4 + 1
          end

          if v165 == true then
            table.insert(jsonDecode, v164)
            task.wait()

            pcall(function()
              writefile("NotSameServers.json", httpService:JSONEncode(jsonDecode))
              task.wait()
              teleportService:TeleportToPlaceInstance(placeId, v164, game.Players.LocalPlayer)
            end)

            task.wait(4)
          end
        end
      end
    end

    local function f69()
      while task.wait() do
        pcall(function()
          f68()

          if nextPageCursor ~= "" then
            f68()
          end
        end)
      end
    end

    f69()
  end,
  DoubleClick = false,
  Tooltip = "Hop to a new server (avoids same server twice)",
  DisabledTooltip = "You can’t hop servers right now!",
  Disabled = false,
  Visible = true,
  Risky = false,
})

menu:AddButton({
  Text = "Join Low Pop Server",
  Func = function()
    local placeId2 = game.PlaceId

    local v166 = "https://games.roblox.com/v1/games/" .. placeId2
      .. "/servers/Public?sortOrder=Asc&limit=100"

    local function f70(p38)
      return httpService:JSONDecode((game:HttpGet(v166 .. (p38 and "&cursor=" .. p38 or ""))))
    end

    local nextPageCursor2, v167

    repeat
      local v168 = f70(nextPageCursor2)
      v167 = v168.data[1]
      nextPageCursor2 = v168.nextPageCursor
    until v167

    teleportService:TeleportToPlaceInstance(placeId2, v167.id, game.Players.LocalPlayer)
  end,
  DoubleClick = false,
  Tooltip = "Join the server with the fewest players",
  DisabledTooltip = "You can’t join servers right now!",
  Disabled = false,
  Visible = true,
  Risky = false,
})

menu:AddButton({
  Text = "Join VC Server",
  Func = function() teleportService:Teleport(13453616108, players.LocalPlayer) end,
  DoubleClick = false,
  Tooltip = "Join the Voice Chat (VC) server",
  DisabledTooltip = "You can’t join the VC server right now!",
  Disabled = false,
  Visible = true,
  Risky = false,
})

menu:AddDropdown("DPIDropdown", {
  Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
  Default = "100%",
  Text = "DPI Scale",
  Callback = function(value131) library:SetDPIScale((tonumber((value131:gsub("%%", ""))))) end,
})

library.ToggleKeybind = options.MenuKeybind
themeManager:SetLibrary(library)

saveManager:SetLibrary(library)
saveManager:IgnoreThemeSettings()
saveManager:SetIgnoreIndexes({ "MenuKeybind" })

themeManager:SetFolder("MyScriptHub")

saveManager:SetFolder("MyScriptHub/specific-game")
saveManager:SetSubFolder("specific-place")
saveManager:BuildConfigSection(v2["UI Settings"])

themeManager:ApplyToGroupbox(menu)
