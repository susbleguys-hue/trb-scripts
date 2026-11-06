local oldRequest = request
getgenv().request = function(opts)
    if opts and opts.Url and opts.Url:find("pandadevelopment.net") then
        return {
            Body = '{"Authenticated_Status":"Success","Key_Premium":true,"Note":"ok","Expire_Date":"never"}'
        }
    end
    return oldRequest(opts)
end
print("tomboy")
local starterGui = game:GetService("StarterGui")
local players = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local httpService = game:GetService("HttpService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local guiService = game:GetService("GuiService")
local teleportService = game:GetService("TeleportService")
local runService = game:GetService("RunService")
local virtualInputManager = game:GetService("VirtualInputManager")
local v1, v2, playerGui, playerGui2, f1, f2, f3, f4, v3, configSaverDropdown, localPlayer

if not axel_loaded then
  axel_loaded = true
  Premiums = false

  function f3()
    local v4, v5 = pcall(gethwid)

    if v4 and v5 then
      return v5
    end

    return tostring(rbxAnalyticsService:GetClientId()):gsub("-", "")
  end

  function f4(p1, p2)
    local jsonEncode = httpService:JSONEncode(p2)

    local v6 = request({
      Url = "https://new.pandadevelopment.net/api/v1" .. p1,
      Method = "POST",
      Headers = { ["Content-Type"] = "application/json" },
      Body = jsonEncode,
    })

    if v6 and v6.Body then
      return httpService:JSONDecode(v6.Body)
    end

    return nil
  end

  function GetKeyURL()
    return "https://new.pandadevelopment.net/getkey/" .. "axelhub" .. "?hwid=" .. f3()
  end

  function OpenGetKey()
    local v7 = GetKeyURL()

    if setclipboard then
      setclipboard(v7)
      print("Key URL copied to clipboard: " .. v7)
    end

    return v7
  end

  function Validate(p3, p4)
    local v8 = f4("/keys/validate", { ServiceID = "axelhub", HWID = f3(), Key = p3 })

    if not v8 then
      return {
        success = false,
        message = "Failed to connect to server",
        isPremium = false,
        expireDate = nil,
      }
    else
      local v9 = v8.Authenticated_Status == "Success"
      local success = v9
      local keyPremium = v8.Key_Premium or false
      local note = v8.Note or v9 and "Key validated!" or "Invalid key"

      if p4 and v9 and not keyPremium then
        success = false
        note = "Premium key required"
      end

      return {
        success = success,
        message = note,
        isPremium = keyPremium,
        expireDate = v8.Expire_Date,
      }
    end
  end

  function non_pre(p5)
    for v10, value in pairs(Validate(p5, false)) do
      if v10 == "success" and value == true then
        yes = true
        return true
      end
    end

    yes = false
    return false
  end

  stoppingshit = false

  function pre(p6)
    for v11, value2 in pairs(Validate(p6, false)) do
      if v11 == "isPremium" and value2 == true then
        return true
      end
    end

    return false
  end

  if _G.Key == nil then
    _G.Key = ""
  end

  if non_pre(_G.Key) then
    response = true
  end

  if response == nil then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AxelHubOnTop/LoaderSaver/refs/heads/main/keysystem.Lua"))():Init({
      Title = "AxelHub_WF_Key",
      Link = GetKeyURL(),
      Verify = function(p7)
        if pre(p7) then
          Premiums = true
        end

        if non_pre(p7) then
          response = true
        end

        return non_pre(p7)
      end,
    })
  end

  if not response then
    if isfile("axelhub_wf_key.key") then
      delfile("axelhub_wf_key.key")
    end

    starterGui:SetCore("SendNotification", {
      Icon = "rbxassetid://86949082023913",
      Title = "Axel Hub",
      Text = "Key Is Wrongs",
    })

    return
  end

  if yes == false then
    if non_pre(key) == false then
      if isfile("axelhub_wf_key.key") then
        delfile("axelhub_wf_key.key")
        axel_loaded = false
      end
    end

    loadstring(game:HttpGet("https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua"))()

    starterGui:SetCore("SendNotification", {
      Icon = "rbxassetid://86949082023913",
      Title = "Axel Hub",
      Text = "Key Is Wrong",
    })
  end

  if players.LocalPlayer.PlayerGui:FindFirstChild("...") then
    players.LocalPlayer.PlayerGui:FindFirstChild("..."):Destroy()
  end

  if yes == true then
    pcall(function()
      if pre(key) then Premiums = true end
    end)

    -- 1) Wait for game loaded, max 15s
    do
      local t = tick() + 15
      while not game:IsLoaded() and tick() < t do task.wait() end
    end

    -- 2) Wait for character, max 20s
    do
      local t = tick() + 20
      repeat task.wait() until players.LocalPlayer.Character or tick() > t
      if not players.LocalPlayer.Character then
        warn("[AxelHub] No character spawned — continuing anyway")
      end
    end

    -- 3) Wait for LoadingScreen, max 15s; then wait for it to disable, max 30s
    do
      local t = tick() + 15
      local ls
      repeat
        task.wait()
        local pg = players.LocalPlayer:FindFirstChild("PlayerGui")
        ls = pg and pg:FindFirstChild("LoadingScreen")
      until ls or tick() > t

      if ls then
        local t2 = tick() + 30
        while ls.Enabled and tick() < t2 do task.wait() end
      else
        warn("[AxelHub] LoadingScreen never appeared — continuing anyway")
      end
    end

    _G.DefaultSettings = {
      Auto_Farm_Level = false,
      Auto_Timed_Boss = false,
      Auto_Dun_Retry = false,
    }

    userid = players.LocalPlayer.UserId
    folder_name = "AxelHub/" .. userid .. "_WF.JSON"
    isfile(folder_name)

    repeat
      wait(1)

      if isfolder("AxelHub") then
        if isfile(folder_name) then
        else
          writefile(folder_name, game:service("HttpService"):JSONEncode(_G.DefaultSettings))
        end
      else
        makefolder("AxelHub")
      end
    until isfile(folder_name)

    if isfile(folder_name) then
      _G.Settings = game:service("HttpService"):JSONDecode(readfile(folder_name))
      local windUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

      function fuckasstp()
        local humanoid = players.LocalPlayer.Character.Humanoid

        if humanoid.Health > 0 then
          humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
      end

      function f1()
        userid = players.LocalPlayer.UserId
        return "AxelHub/" .. userid .. "_WF.JSON"
      end

      HttpService = httpService

      function f2(p8)
        v3 = tick()
        local v12 = v3

        task.delay(1, function()
          if v3 ~= v12 then
            return
          end

          if not (writefile and makefolder) then
            return
          else
            local match = p8:match("(.+)/")

            if not isfolder(match) then
              local split = match:split("/")
              local v14 = ""

              for index, value3 in ipairs(split) do
                local v15 = v14 .. value3

                if not isfolder(v15) then
                  makefolder(v15)
                end

                v14 = v15 .. "/"
              end
            end

            writefile(p8, HttpService:JSONEncode(_G.Settings))
            return
          end
        end)
      end

      v3 = 0

      if _G.Settings.Tween_Speed == nil then
        _G.Settings.Tween_Speed = 250
      end

      if _G.Settings.Disc == nil then
        _G.Settings.Disc = 5
      end

      if _G.Settings.Bypass_Tp == nil then
        _G.Settings.Bypass_Tp = false
      end

      getgenv().goto = function(p9, p10)
        if _G.Settings.Bypass_Tp then
          players.LocalPlayer.Character.HumanoidRootPart.CFrame = p9
        elseif _G.Settings.Bypass_Tp == false then
          local tweenService = game:service("TweenService")

          local tweenInfo = TweenInfo.new((p9.Position
              - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            / p10, Enum.EasingStyle.Linear)

          tweenService:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, {
            CFrame = p9,
          }):Play()
        end
      end

      Disc = 5

      function canceltp()
        local tweenService2 = game:service("TweenService")

        local tweenInfo2 = TweenInfo.new((players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position
            - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
          / 300, Enum.EasingStyle.Linear)

        tweenService2:Create(players.LocalPlayer.Character.HumanoidRootPart, tweenInfo2, {
          CFrame = players.LocalPlayer.Character.HumanoidRootPart.CFrame,
        }):Play()
      end

      toggles = {}
      dropdowns = {}
      slides = {}
      inputs = {}

      local axelHubWindow = windUI:CreateWindow({
        Title = "Axel Hub",
        Icon = "rbxassetid://86949082023913",
        Author = "by vxny",
        Folder = "AxelHub_Official",
        Size = UDim2.fromOffset(580, 460),
        MinSize = Vector2.new(560, 350),
        MaxSize = Vector2.new(850, 560),
        Transparent = true,
        Theme = "Dark",
        Resizable = true,
        SideBarWidth = 200,
        BackgroundImageTransparency = 0.42,
        HideSearchBar = true,
        ScrollBarEnabled = false,
        User = { Enabled = true, Anonymous = true, Callback = function() print("clicked") end },
      })

      axelHubWindow:SetBackgroundImage("rbxassetid://86949082023913")
      axelHubWindow:SetToggleKey(Enum.KeyCode.RightControl)

      windUI:AddTheme({
        Name = "AxelSunset",
        Accent = Color3.fromHex("#ff8c00"),
        Background = Color3.fromHex("#14110b"),
        BackgroundTransparency = 0,
        Outline = Color3.fromHex("#ffb300"),
        Text = Color3.fromHex("#fff7e6"),
        Placeholder = Color3.fromHex("#ffb84d"),
        Button = Color3.fromHex("#2a1f0f"),
        Icon = Color3.fromHex("#ffcc00"),
        Hover = Color3.fromHex("#ffd580"),
        WindowBackground = Color3.fromHex("#14110b"),
        WindowShadow = Color3.fromHex("#000000"),
        WindowTopbarButtonIcon = Color3.fromHex("#ffcc00"),
        WindowTopbarTitle = Color3.fromHex("#fff7e6"),
        WindowTopbarAuthor = Color3.fromHex("#ffb84d"),
        WindowTopbarIcon = Color3.fromHex("#ffe066"),
        TabBackground = Color3.fromHex("#2a1f0f"),
        TabTitle = Color3.fromHex("#fff7e6"),
        TabIcon = Color3.fromHex("#ffcc00"),
        ElementBackground = Color3.fromHex("#FA9511"),
        ElementTitle = Color3.fromHex("#fff7e6"),
        ElementDesc = Color3.fromHex("#ffcc80"),
        ElementIcon = Color3.fromHex("#ffb300"),
        PopupBackground = Color3.fromHex("#1a140a"),
        PopupBackgroundTransparency = 0,
        PopupTitle = Color3.fromHex("#fff7e6"),
        PopupContent = Color3.fromHex("#ffd699"),
        PopupIcon = Color3.fromHex("#ffcc00"),
        DialogBackground = Color3.fromHex("#1a140a"),
        DialogBackgroundTransparency = 0,
        DialogTitle = Color3.fromHex("#fff7e6"),
        DialogContent = Color3.fromHex("#ffd699"),
        DialogIcon = Color3.fromHex("#ffcc00"),
        Toggle = Color3.fromHex("#2a1f0f"),
        ToggleBar = Color3.fromHex("#ffb300"),
        Checkbox = Color3.fromHex("#2a1f0f"),
        CheckboxIcon = Color3.fromHex("#ffcc00"),
        Slider = Color3.fromHex("#2a1f0f"),
        SliderThumb = Color3.fromHex("#ffb300"),
      })

      windUI:SetTheme("AxelSunset")

      local mainSection = axelHubWindow:Section({
        Title = "Main",
        Icon = "rbxassetid://86949082023913",
        Opened = true,
      })

      local mainTab = mainSection:Tab({ Title = "Main", Icon = "door-open", Locked = false })

      local priorityTab = mainSection:Tab({
        Title = "Priority",
        Icon = "arrow-down-up",
        Locked = false,
      })

      local dungeonTab = mainSection:Tab({ Title = "Dungeon", Icon = "bubbles", Locked = false })
      local eggTab = mainSection:Tab({ Title = "Egg", Icon = "egg", Locked = false })
      local webhookTab = mainSection:Tab({ Title = "Webhook", Icon = "flag", Locked = false })
      local miscTab = mainSection:Tab({ Title = "Misc", Icon = "badge-alert", Locked = false })

      local settingsTab = mainSection:Tab({
        Title = "Settings",
        Icon = "settings",
        Opened = true,
      })

      axelHubWindow:Tag({
        Title = ".gg/axelhub",
        Icon = "link",
        Color = Color3.fromHex("#30ff6a"),
        Radius = 6,
      })

      axelHubWindow:Tag({
        Title = "1.2.1",
        Icon = "settings",
        Color = Color3.fromHex("#97DBF0"),
        Radius = 6,
      })

      axelHubWindow:EditOpenButton({
        Title = "Open Axel UI",
        Icon = "rbxassetid://86949082023913",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
      })

      mainTab:Section({ Title = "Main Menu" })
      mainTab:Divider()

      maps_table = {}

      pcall(function()
        for v16, value4 in pairs(replicatedStorage.Assets.Characters:GetChildren()) do
        end
      end)

      local v17 = dropdowns

      v17.World_Select = mainTab:Dropdown({
        Title = "Select World",
        Desc = "select your world.",
        Values = maps_table,
        Value = _G.Settings.World_Select or "Dragon Verse",
        Multi = false,
        AllowNone = false,
        Callback = function(value5)
          _G.Settings.World_Select = value5
          allmons = {}

          for v18, value6 in pairs(replicatedStorage.Assets.Characters[_G.Settings.World_Select]:GetChildren()) do
            if string.find(value6.Name, "Enemies") then
              for v19, value7 in pairs(value6:GetChildren()) do
              end
            end
          end

          dropdowns.Enemies_Select:Refresh(allmons)
        end,
      })

      allmons = {}

      pcall(function()
        for v20, value8 in pairs(replicatedStorage.Assets.Characters[_G.Settings.World_Select]:GetChildren()) do
          if string.find(value8.Name, "Enemies") then
            for v22, value9 in pairs(value8:GetChildren()) do
            end
          end
        end
      end)

      local v23 = dropdowns

      v23.Enemies_Select = mainTab:Dropdown({
        Title = "Select Enemies",
        Desc = "select your enemies to farm.",
        Values = allmons,
        Value = _G.Settings.Enemies_Select or {},
        Multi = true,
        AllowNone = true,
        Callback = function(value10) _G.Settings.Enemies_Select = value10 end,
      })

      mainTab:Button({
        Title = "Refresh Enemies",
        Desc = "",
        Locked = false,
        Callback = function()
          allmons = {}

          for v24, value11 in pairs(replicatedStorage.Assets.Characters[_G.Settings.World_Select]:GetChildren()) do
            if string.find(value11.Name, "Enemies") then
              for v25, value12 in pairs(value11:GetChildren()) do
              end
            end
          end

          dropdowns.Enemies_Select:Refresh(allmons)
        end,
      })

      local v26 = dropdowns

      v26.Selection_Far = mainTab:Dropdown({
        Title = "Distance",
        Desc = "",
        Values = { "Near", "Far" },
        Value = _G.Settings.Selection_Far or "Near",
        Multi = false,
        AllowNone = false,
        Callback = function(value13)
          _G.Settings.Selection_Far = value13

          if _G.Settings.Selection_Far == "Near" then
            nonesfr = CFrame.new(0, 4, 0)
          elseif _G.Settings.Selection_Far == "Far" then
            nonesfr = CFrame.new(-7, 4, -7)
          end
        end,
      })

      toggles.Auto_Click = mainTab:Toggle({
        Title = "Auto Click",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Click or false,
        Callback = function(value14) _G.Settings.Auto_Click = value14 end,
      })

      toggles.Auto_Farm_Selection = mainTab:Toggle({
        Title = "Auto Selected Enemies",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Farm_Selection or false,
        Callback = function(value15) _G.Settings.Auto_Farm_Selection = value15 end,
      })

      toggles.Auto_Ore = mainTab:Toggle({
        Title = "Auto Ore",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Ore or false,
        Callback = function(value16) _G.Settings.Auto_Ore = value16 end,
      })

      toggles.Auto_GlobalBoss = mainTab:Toggle({
        Title = "Auto Global Boss",
        Desc = "auto kill global boss",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_GlobalBoss or false,
        Callback = function(value17) _G.Settings.Auto_GlobalBoss = value17 end,
      })

      toggles.Auto_Quest = mainTab:Toggle({
        Title = "Auto Quest",
        Desc = "only kill quest",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Quest or false,
        Callback = function(value18) _G.Settings.Auto_Quest = value18 end,
      })

      priorityTab:Section({ Title = "Priority Menu" })
      priorityTab:Divider()

      _G.Settings.One_Priority = "None"
      _G.Settings.Two_Priority = "None"
      _G.Settings.Three_Priority = "None"
      _G.Settings.Four_Priority = "None"
      _G.Settings.Five_Priority = "None"
      _G.Settings.Six_Priority = "None"
      _G.Settings.Seven_Priority = "None"

      thingupsqq = {
        "Auto Global Boss", "Auto Trials", "Auto Tempest Invasion", "Auto Dragon Defenses",
        "Open Egg", "Auto Farm Selections", "Auto Quest", "Auto Ore",
      }

      local v27 = dropdowns

      v27.One_Priority = priorityTab:Dropdown({
        Title = "1 Priority",
        Desc = "select your first thing to do",
        Values = thingupsqq,
        Value = _G.Settings.One_Priority or "Auto Global Boss",
        Multi = false,
        AllowNone = false,
        Callback = function(value19) _G.Settings.One_Priority = value19 end,
      })

      local v28 = dropdowns

      v28.Two_Priority = priorityTab:Dropdown({
        Title = "2 Priority",
        Desc = "select your second thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Two_Priority or "Auto Trials",
        Multi = false,
        AllowNone = false,
        Callback = function(value20) _G.Settings.Two_Priority = value20 end,
      })

      local v29 = dropdowns

      v29.Three_Priority = priorityTab:Dropdown({
        Title = "3 Priority",
        Desc = "select your third thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Three_Priority or "Open Egg",
        Multi = false,
        AllowNone = false,
        Callback = function(value21) _G.Settings.Three_Priority = value21 end,
      })

      local v30 = dropdowns

      v30.Four_Priority = priorityTab:Dropdown({
        Title = "4 Priority",
        Desc = "select your fourth thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Four_Priority or "Auto Farm Selections",
        Multi = false,
        AllowNone = false,
        Callback = function(value22) _G.Settings.Four_Priority = value22 end,
      })

      local v31 = dropdowns

      v31.Five_Priority = priorityTab:Dropdown({
        Title = "5 Priority",
        Desc = "select your fifth thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Five_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value23) _G.Settings.Five_Priority = value23 end,
      })

      local v32 = dropdowns

      v32.Six_Priority = priorityTab:Dropdown({
        Title = "6 Priority",
        Desc = "select your sixth thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Six_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value24) _G.Settings.Six_Priority = value24 end,
      })

      local v33 = dropdowns

      v33.Seven_Priority = priorityTab:Dropdown({
        Title = "7 Priority",
        Desc = "select your seventh thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Seven_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value25) _G.Settings.Seven_Priority = value25 end,
      })

      dungeonTab:Section({ Title = "Trials Menu" })
      dungeonTab:Divider()

      toggles.Auto_Trials_Easy = dungeonTab:Toggle({
        Title = "Auto Trial Easy",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Trials_Easy or false,
        Callback = function(value26) _G.Settings.Auto_Trials_Easy = value26 end,
      })

      toggles.Auto_Trials_Medium = dungeonTab:Toggle({
        Title = "Auto Trial Medium",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Trials_Medium or false,
        Callback = function(value27) _G.Settings.Auto_Trials_Medium = value27 end,
      })

      local v34 = dropdowns

      v34.World_Leave_Selection = dungeonTab:Dropdown({
        Title = "Select World To Leave",
        Desc = "select your world.",
        Values = maps_table,
        Value = _G.Settings.World_Leave_Selection or "Dragon Verse",
        Multi = false,
        AllowNone = false,
        Callback = function(value28) _G.Settings.World_Leave_Selection = value28 end,
      })

      local v35 = dropdowns

      v35.World_Leave_Selection2 = dungeonTab:Dropdown({
        Title = "Select Zone To Leave",
        Desc = "select your zone.",
        Values = { "1", "2" },
        Value = _G.Settings.World_Leave_Selection2 or "1",
        Multi = false,
        AllowNone = false,
        Callback = function(value29) _G.Settings.World_Leave_Selection2 = value29 end,
      })

      if _G.Settings.Leave_Trials_At == nil then
        _G.Settings.Leave_Trials_At = 25
      end

      slides.Leave_Trials_At = dungeonTab:Slider({
        Title = "Leave Trials At",
        Desc = "select wave to leave trials.",
        Step = 1,
        Value = { Min = 1, Max = 100, Default = _G.Settings.Leave_Trials_At },
        Callback = function(value30) _G.Settings.Leave_Trials_At = value30 end,
      })

      toggles.Trials_Auto_Leave = dungeonTab:Toggle({
        Title = "Auto Leave Trials",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Trials_Auto_Leave or false,
        Callback = function(value31) _G.Settings.Trials_Auto_Leave = value31 end,
      })

      slides.Leave_Tower_At = dungeonTab:Slider({
        Title = "Leave Tower At",
        Desc = "select wave to leave tower.",
        Step = 1,
        Value = { Min = 1, Max = 100, Default = _G.Settings.Leave_Tower_At },
        Callback = function(value32) _G.Settings.Leave_Tower_At = value32 end,
      })

      toggles.Tower_Auto_Leave = dungeonTab:Toggle({
        Title = "Auto Leave Tower",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Tower_Auto_Leave or false,
        Callback = function(value33) _G.Settings.Tower_Auto_Leave = value33 end,
      })

      dungeonTab:Section({ Title = "Gamemodes Menu" })
      dungeonTab:Divider()

      toggles.Auto_Tower = dungeonTab:Toggle({
        Title = "Auto Tower",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Tower or false,
        Callback = function(value34) _G.Settings.Auto_Tower = value34 end,
      })

      toggles.Auto_Dragon_Defense = dungeonTab:Toggle({
        Title = "Auto Dragon Defense",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Dragon_Defense or false,
        Callback = function(value35) _G.Settings.Auto_Dragon_Defense = value35 end,
      })

      toggles.Auto_Tempest_Invasion = dungeonTab:Toggle({
        Title = "Auto Tempest Invasion",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Tempest_Invasion or false,
        Callback = function(value36) _G.Settings.Auto_Tempest_Invasion = value36 end,
      })

      eggTab:Section({ Title = "Star Menu" })
      eggTab:Divider()

      allegg = {
        "Dressrosa", "Marine Fortress", "Capsule Corp", "Dragon Arena", "Jura Forest",
        "Tempest Federation", "Sorcerers Academy", "Leveling City",
      }

      local v36 = dropdowns

      v36.Egg_Select = eggTab:Dropdown({
        Title = "Select Star",
        Desc = "select your star to open.",
        Values = allegg,
        Value = _G.Settings.Egg_Select or "Dressrosa",
        Multi = false,
        AllowNone = false,
        Callback = function(value37)
          _G.Settings.Egg_Select = value37

          if _G.Settings.Egg_Select == "Dressrosa" then
            cfpuk = CFrame.new(
              6146.64648, 787.870728, -1230.95581, -0.502635181, -1.17064962e-8, -0.864498615,
              2.53137884e-8, 1, -2.82592669e-8, 0.864498615, -3.60878367e-8, -0.502635181
            )
          elseif _G.Settings.Egg_Select == "Marine Fortress" then
            cfpuk = CFrame.new(
              11733.7285, -11.1551266, -23342.9805, -0.87446332, -1.50442858e-8, 0.485091686,
              -3.13649196e-8, 1, -2.55275179e-8, -0.485091686, -3.75377383e-8, -0.87446332
            )
          elseif _G.Settings.Egg_Select == "Capsule Corp" then
            cfpuk = CFrame.new(
              15194.9336, 787.852234, -2612.37061, 0.77139461, 7.07248873e-8, -0.636357069,
              -1.44596113e-8, 1, 9.36122504e-8, 0.636357069, -6.30105106e-8, 0.77139461
            )
          elseif _G.Settings.Egg_Select == "Dragon Arena" then
            cfpuk = CFrame.new(
              4757.15625, 788.561523, 5689.07471, 0.875353813, -3.11359365e-8, 0.483482927,
              -2.42616771e-9, 1, 6.87918629e-8, -0.483482927, -6.13902316e-8, 0.875353813
            )
          elseif _G.Settings.Egg_Select == "Jura Forest" then
            cfpuk = CFrame.new(
              620.554688, 807.313354, -829.634216, -0.899108112, 6.56116299e-8, 0.437726676,
              2.13538129e-8, 1, -1.060302e-7, -0.437726676, -8.59854765e-8, -0.899108112
            )
          elseif _G.Settings.Egg_Select == "Tempest Federation" then
            cfpuk = CFrame.new(
              1092.12378, 779.131226, -3681.27563, 0.265422344, 1.19328556e-8, 0.964132249,
              3.16956488e-8, 1, -2.11024886e-8, -0.964132249, 3.61598715e-8, 0.265422344
            )
          elseif _G.Settings.Egg_Select == "Sorcerers Academy" then
            cfpuk = CFrame.new(
              4718.97217, 778.074158, -6372.76221, -0.242132932, 2.28777495e-8, 0.970243096,
              -2.56162158e-9, 1, -2.42186768e-8, -0.970243096, -8.3495344e-9, -0.242132932
            )
          elseif _G.Settings.Egg_Select == "Leveling City" then
            cfpuk = CFrame.new(
              1425.73511, 782.00061, 1962.79102, 0.217447013, -6.96448481e-8, 0.976072133,
              2.51669672e-8, 1, 6.57455175e-8, -0.976072133, 1.02686091e-8, 0.217447013
            )
          end
        end,
      })

      if _G.Settings.Custom_Delay == nil then
        _G.Settings.Custom_Delay = 4.7
      end

      slides.Custom_Delay = eggTab:Slider({
        Title = "Delay Open Star",
        Desc = "select delay for next star",
        Step = 0.1,
        Value = { Min = 0, Max = 5, Default = _G.Settings.Custom_Delay },
        Callback = function(value38) _G.Settings.Custom_Delay = value38 end,
      })

      toggles.Auto_Open_Star = eggTab:Toggle({
        Title = "Auto Open Star",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Open_Star or false,
        Callback = function(value39)
          thingup = true
          _G.Settings.Auto_Open_Star = value39
        end,
      })

      function sendwebhook(value40)
        if _G.Settings.Webhook_Link ~= "" then
          pcall(function()
            local webhookLink = _G.Settings.Webhook_Link
            local color = tonumber(14177041)
            local yMDTHMSZ = os.date("!%Y-%m-%dT%H:%M:%SZ")

            local jsonEncode2 = httpService:JSONEncode({
              content = popathing,
              embeds = {
                {
                  author = { name = "" },
                  type = "rich",
                  title = "Axel Hub Notification",
                  color = color,
                  fields = {
                    {
                      name = "Account : " .. "||" .. players.LocalPlayer.Name .. "||",
                      value = value40,
                    },
                  },
                  description = "https://discord.com/invite/axelhub",
                  color = 15982945,
                  footer = {
                    text = "By Axel Hub",
                    icon_url = "https://i.postimg.cc/JzBQczg1/axel-hub-2-removebg-preview.png",
                  },
                  timestamp = yMDTHMSZ,
                  thumbnail = {
                    url = "https://i.postimg.cc/JzBQczg1/axel-hub-2-removebg-preview.png",
                  },
                  image = {
                    url = "https://tr.rbxcdn.com/180DAY-03cf3a4c472ab4edad95ff2fe74b9355/768/432/Image/Webp/noFilter",
                  },
                },
              },
            })

            local headers = { ["content-type"] = "application/json" }

            request = http_request or request or HttpPost or syn.request

            request({
              Url = webhookLink,
              Body = jsonEncode2,
              Method = "POST",
              Headers = headers,
            })
          end)
        else
          print("Invaild Url")
        end
      end

      if asd then
        local v37 = dropdowns

        v37.Webhook_Notify = webhookTab:Dropdown({
          Title = "Webhook Notify Selection",
          Desc = "tell us in discord if you need more (with name of the items)",
          Values = {
            "Aura Crate", "Cosmetic Crate", "Secret Chest", "Upper Seal", "Abyss Sigil",
            "Path Fragment", "Eternal Core", "Azure Heart", "Corruption Core",
          },
          Value = _G.Settings.Webhook_Notify or { "Aura Crate" },
          Multi = true,
          AllowNone = false,
          Callback = function(value41) _G.Settings.Webhook_Notify = value41 end,
        })

        if _G.Settings.Webhook_Link == nil then
          _G.Settings.Webhook_Link = ""
        end

        inputs.Webhook_Link = webhookTab:Input({
          Title = "Discord Webhook Link",
          Desc = "",
          Value = _G.Settings.Webhook_Link,
          InputIcon = "",
          Type = "Input",
          Placeholder = "Enter Your Link",
          Callback = function(value42) _G.Settings.Webhook_Link = value42 end,
        })

        webhookTab:Button({
          Title = "Test Webhook",
          Desc = "",
          Locked = false,
          Callback = function() sendwebhook("Axel Hub Best Script For You!") end,
        })

        toggles.Send_Webhook = webhookTab:Toggle({
          Title = "Send Webhook",
          Desc = "send webhook when items drop.",
          Icon = "circle-check-big",
          Type = "Checkbox",
          Value = _G.Settings.Send_Webhook or false,
          Callback = function(value43) _G.Settings.Send_Webhook = value43 end,
        })

        local v38 = inputs

        v38.Pings_Userid = webhookTab:Input({
          Title = "Discord Userid",
          Desc = "put your discord id",
          Value = _G.Settings.Pings_Userid or "",
          InputIcon = "",
          Type = "Input",
          Placeholder = "e.g. 12345678",
          Callback = function(value44)
            _G.Settings.Pings_Userid = value44

            if _G.Settings.Send_Webhook_Pings then
              popathing = "<@" .. _G.Settings.Pings_Userid .. ">"
            else
              popathing = ""
            end
          end,
        })

        toggles.Send_Webhook_Pings = webhookTab:Toggle({
          Title = "Ping when got kicked",
          Desc = "send webhook when you got kicked.",
          Icon = "circle-check-big",
          Type = "Checkbox",
          Value = _G.Settings.Send_Webhook_Pings or false,
          Callback = function(value45)
            _G.Settings.Send_Webhook_Pings = value45

            if _G.Settings.Send_Webhook_Pings then
              popathing = "<@" .. _G.Settings.Pings_Userid .. ">"
            else
              popathing = ""
            end
          end,
        })

        if _G.Settings.Send_Webhook_Pings then
          popathing = "<@" .. _G.Settings.Pings_Userid .. ">"
        else
          popathing = ""
        end
      end

      miscTab:Section({ Title = "Misc Menu" })
      mainTab:Select()
      miscTab:Divider()

      local v39 = dropdowns

      v39.Screen_cpu = miscTab:Dropdown({
        Title = "Screen Color",
        Desc = "",
        Values = { "Black", "White" },
        Value = _G.Settings.Screen_cpu or "Black",
        Multi = false,
        AllowNone = false,
        Callback = function(value46)
          _G.Settings.Screen_cpu = value46

          if _G.Settings.Screen_cpu == "Black" then
            FullScreenFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
          elseif _G.Settings.Screen_cpu == "White" then
            FullScreenFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          end
        end,
      })

      toggles.Screen_CPUStart = miscTab:Toggle({
        Title = "Reduce Cpu",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Screen_CPUStart or false,
        Callback = function(value47)
          _G.Settings.Screen_CPUStart = value47

          if not players.LocalPlayer.PlayerGui:FindFirstChild("GlobalColorScreen") then
            ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Name = "GlobalColorScreen"
            ScreenGui.IgnoreGuiInset = true
            ScreenGui.DisplayOrder = -999
            ScreenGui.Parent = players.LocalPlayer.PlayerGui

            FullScreenFrame = Instance.new("Frame")
            FullScreenFrame.Size = UDim2.new(1, 0, 1, 0)
            FullScreenFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FullScreenFrame.BorderSizePixel = 0
            FullScreenFrame.Parent = ScreenGui
          end

          FullScreenFrame.Visible = _G.Settings.Screen_CPUStart
        end,
      })

      spawn(function()
        while task.wait(1) do
          pcall(function()
            if not players.LocalPlayer.PlayerGui:FindFirstChild("GlobalColorScreen") then
              ScreenGui = Instance.new("ScreenGui")
              ScreenGui.Name = "GlobalColorScreen"
              ScreenGui.IgnoreGuiInset = true
              ScreenGui.DisplayOrder = -999
              ScreenGui.Parent = players.LocalPlayer.PlayerGui

              FullScreenFrame = Instance.new("Frame")
              FullScreenFrame.Size = UDim2.new(1, 0, 1, 0)
              FullScreenFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              FullScreenFrame.BorderSizePixel = 0
              FullScreenFrame.Parent = ScreenGui
            end

            FullScreenFrame.Visible = _G.Settings.Screen_CPUStart
          end)
        end
      end)

      settingsTab:Button({
        Title = "Save Main Config",
        Desc = "",
        Locked = false,
        Callback = function() f2(f1()) end,
      })

      if _G.Settings.Auto_Rejoin == nil then
        _G.Settings.Auto_Rejoin = true
      end

      if _G.Settings.Auto_Execute == nil then
        _G.Settings.Auto_Execute = true
      end

      toggles.Auto_Rejoin = settingsTab:Toggle({
        Title = "Auto Rejoin",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Rejoin,
        Callback = function(value48)
          _G.Settings.Auto_Rejoin = value48

          function missing(p11, p12, p13)
            if type(p12) == p11 then
              return p12
            end

            return p13
          end

          queueteleport = missing("function", queue_on_teleport or syn and syn.queue_on_teleport
            or fluxus and fluxus.queue_on_teleport)

          inqueue = true

          if _G.Settings.Auto_Rejoin then
            guiService.ErrorMessageChanged:Connect(function()
              wait(2)

              if _G.Settings.Send_Webhook_Pings then
                sendwebhook("You've Got Kicked!")
              end

              if inqueue and _G.Settings.Auto_Execute then
                queueteleport("task.wait(10) loadstring(game:HttpGet('https://raw.githubusercontent.com/lostinnowheres/Loader/refs/heads/main/Loader.Lua'))()")
                inqueue = false
              end

              teleportService:Teleport(game.PlaceId)
            end)
          end
        end,
      })

      toggles.Auto_Execute = settingsTab:Toggle({
        Title = "Auto Execute",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Execute,
        Callback = function(value49) _G.Settings.Auto_Execute = value49 end,
      })

      configall = {}

      if isfolder("AxelConfig_WF") then
        for v40, value50 in pairs(listfiles("AxelConfig_WF")) do
          value50:match("[^/\\]+$")
        end
      else
        makefolder("AxelConfig_WF")
      end

      inputs.Config_Name = settingsTab:Input({
        Title = "Config Name",
        Desc = "Input your config name",
        Value = "",
        InputIcon = "",
        Type = "Input",
        Placeholder = "e.g. FarmBoss",
        Callback = function(value51) Config_Name = value51 end,
      })

      settingsTab:Button({
        Title = "Create Config",
        Desc = "",
        Locked = false,
        Callback = function()
          if not isfile("AxelConfig_WF/" .. Config_Name .. ".JSON") then
            writefile("AxelConfig_WF/" .. Config_Name .. ".JSON", "")
          end
        end,
      })

      configSaverDropdown = settingsTab:Dropdown({
        Title = "Config Saver",
        Desc = "",
        Values = configall,
        Value = "",
        Multi = false,
        AllowNone = false,
        Callback = function(value52) Config_Select = value52 end,
      })

      settingsTab:Button({
        Title = "Refresh Config",
        Desc = "",
        Locked = false,
        Callback = function()
          configall = {}

          if isfolder("AxelConfig_WF") then
            for v41, value53 in pairs(listfiles("AxelConfig_WF")) do
              value53:match("[^/\\]+$")
            end
          else
            makefolder("AxelConfig_WF")
          end

-- https://discord.gg/AwGHNh7Z7T
          configSaverDropdown:Refresh(configall)
        end,
      })

      settingsTab:Button({
        Title = "Delete Config",
        Desc = "",
        Locked = false,
        Callback = function() delfile("AxelConfig_WF/" .. Config_Select) end,
      })

      _G.DefaultSettings = {
        Auto_Farm_Level = false,
        Auto_Dun_Retry = false,
        Auto_Timed_Boss = false,
      }

      settingsTab:Button({
        Title = "Save Config",
        Desc = "",
        Locked = false,
        Callback = function()
          if not isfile("AxelConfig_WF/" .. Config_Select) then
            local httpService2 = game:service("HttpService")

            writefile(
              "AxelConfig_WF/" .. Config_Select, httpService2:JSONEncode(_G.DefaultSettings)
            )
          else
            f2("AxelConfig_WF/" .. Config_Select)
          end
        end,
      })

      settingsTab:Button({
        Title = "Load Config",
        Desc = "",
        Locked = false,
        Callback = function()
          prop = game:service("HttpService"):JSONDecode(readfile("AxelConfig_WF/" .. Config_Select))

          for v42, value54 in pairs(prop) do
            local v43 = v42
            local v44 = value54

            pcall(function()
              if v44 == true or v44 == false then
                if v43 ~= "Auto_Rejoin" and v43 ~= "Auto_Execute" then
                  toggles[v43]:Set(v44)
                end
              elseif tonumber(v44) ~= nil then
                slides[v43]:Set(v44)
              elseif v43 == "Webhook_Link" then
                inputs[v43]:Set(v44)
              else
                dropdowns[v43]:Select(v44)
              end
            end)
          end
        end,
      })

      settingsTab:Button({
        Title = "Instant Turn Everything Off",
        Desc = "",
        Locked = false,
        Callback = function()
          prop = game:service("HttpService"):JSONDecode(readfile(f1()))

          for v45, value55 in pairs(prop) do
            local v46 = v45
            local v47 = value55

            pcall(function()
              if v46 ~= "Bypass_Tp" and v46 ~= "Auto_Rejoin" and v46 ~= "Auto_Execute"
                and v47 == true then
                toggles[v46]:Set(false)
              end
            end)
          end
        end,
      })

      function getClosestrandomeqs()
        local character = players.LocalPlayer.Character

        if not character then
          return nil
        else
          local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart then
            return nil
          else
            local v48 = nil
            local huge = math.huge

            for v49, value56 in pairs(workspace.Server.Enemies.World:GetChildren()) do
              for v50, value57 in pairs(value56:GetChildren()) do
                for v51, value58 in pairs(value57:GetChildren()) do
                  for v52, value59 in pairs(players.LocalPlayer.PlayerGui.UI.HUD.Quests.List:GetChildren()) do
                    if value59:FindFirstChild("Progress")
                      and value59.Progress.Bar.Size ~= UDim2.new(1, 0, 1, 0) then
                      if string.match(value59.Description.Text, "<font.->(.-)</font>")
                        == value58.Name then
                        local getAttributes = value58:GetAttributes()
                        local loaded = value58:GetAttribute("Loaded")

                        for v53, value60 in pairs(getAttributes) do
                          if v53 == "Health" and tonumber(value60) > 0 and loaded then
                            if value58 then
                              local magnitude = (value58.Position - humanoidRootPart.Position).Magnitude

                              if magnitude < huge then
                                huge = magnitude
                                v48 = value58

                                for v54, value61 in pairs((v48:GetAttributes())) do
                                  if v54 == "ID" then
                                    localid = value61
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end

            return v48, localid
          end
        end
      end

      function getClosestrandomseqeq(p14)
        local character2 = players.LocalPlayer.Character

        if not character2 then
          return nil
        else
          local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart2 then
            return nil
          else
            local v55 = nil
            local huge2 = math.huge

            for v56, value62 in pairs(workspace.Server.Enemies.World:GetChildren()) do
              for v57, value63 in pairs(value62:GetChildren()) do
                for v58, value64 in pairs(value63:GetChildren()) do
                  if value64.Name == p14 then
                    local getAttributes2 = value64:GetAttributes()
                    local loaded2 = value64:GetAttribute("Loaded")

                    for v59, value65 in pairs(getAttributes2) do
                      if v59 == "Health" and tonumber(value65) > 0 and loaded2 then
                        if value64 then
                          local magnitude2 = (value64.Position - humanoidRootPart2.Position).Magnitude

                          if magnitude2 < huge2 then
                            v55 = value64
                            huge2 = magnitude2

                            for v60, value66 in pairs((v55:GetAttributes())) do
                              if v60 == "ID" then
                                localid = value66
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end

            return v55, localid
          end
        end
      end

      function getClosestrandoms(p15)
        local character3 = players.LocalPlayer.Character

        if not character3 then
          return nil
        else
          local humanoidRootPart3 = character3:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart3 then
            return nil
          else
            local v61 = nil
            local huge3 = math.huge

            for v62, value67 in pairs(p15) do
              for v63, value68 in pairs(workspace.Server.Enemies.World:GetChildren()) do
                for v64, value69 in pairs(value68:GetChildren()) do
                  for v65, value70 in pairs(value69:GetChildren()) do
                    if value70.Name == value67 then
                      local getAttributes3 = value70:GetAttributes()
                      local loaded3 = value70:GetAttribute("Loaded")

                      for v66, value71 in pairs(getAttributes3) do
                        if v66 == "Health" and tonumber(value71) > 0 and loaded3 then
                          if value70 then
                            local magnitude3 = (value70.Position - humanoidRootPart3.Position).Magnitude

                            if magnitude3 < huge3 then
                              v61 = value70
                              huge3 = magnitude3

                              for v67, value72 in pairs((v61:GetAttributes())) do
                                if v67 == "ID" then
                                  localid = value72
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end

            return v61, localid
          end
        end
      end

      function checknotifation(p16)
        for v68, value73 in pairs(players.LocalPlayer.PlayerGui.Notifications.List:GetChildren()) do
          if string.find(value73.Name, p16) then
            return true
          end
        end

        return false
      end

      function checkgamemode()
        if players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tempest Invasion"].Visible
          or players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Dragon Defense"].Visible
          or players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Visible
          or players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Visible then
          return true
        end

        return false
      end

      function checkore()
        for v69, value74 in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
          if (value74.Position - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            < 15 then
            return true
          end
        end

        return false
      end

      function checkores()
        for v70, value75 in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
          if value75.ClassName == "Part" then
            return true
          end
        end

        return false
      end

      function getClosestrandomore()
        local character4 = players.LocalPlayer.Character

        if not character4 then
          return nil
        else
          local humanoidRootPart4 = character4:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart4 then
            return nil
          else
            local v71 = nil
            local huge4 = math.huge

            for v72, value76 in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
              for v73, value77 in pairs(workspace.Server.Enemies.Ores:GetChildren()) do
                local getAttributes4 = value77:GetAttributes()
                local loaded4 = value77:GetAttribute("Loaded")

                for v74, value78 in pairs(getAttributes4) do
                  if v74 == "Health" and tonumber(value78) > 0 and loaded4 then
                    if value77 then
                      local magnitude4 = (value77.Position - humanoidRootPart4.Position).Magnitude

                      if magnitude4 < huge4 then
                        huge4 = magnitude4
                        v71 = value77

                        for v75, value79 in pairs((v71:GetAttributes())) do
                          if v75 == "ID" then
                            localid = value79
                          end
                        end
                      end
                    end
                  end
                end
              end
            end

            return v71, localid
          end
        end
      end

      function getClosestrandomgame()
        local character5 = players.LocalPlayer.Character

        if not character5 then
          return nil
        else
          local humanoidRootPart5 = character5:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart5 then
            return nil
          else
            local v76 = nil
            local huge5 = math.huge

            for v77, value80 in pairs(workspace.Server.Enemies.Gamemodes:GetChildren()) do
              for v78, value81 in pairs(value80:GetChildren()) do
                local getAttributes5 = value81:GetAttributes()
                local loaded5 = value81:GetAttribute("Loaded")

                for v79, value82 in pairs(getAttributes5) do
                  if v79 == "Health" and tonumber(value82) > 0 and loaded5 then
                    if value81 then
                      local magnitude5 = (value81.Position - humanoidRootPart5.Position).Magnitude

                      if magnitude5 < huge5 then
                        huge5 = magnitude5
                        v76 = value81

                        for v80, value83 in pairs((v76:GetAttributes())) do
                          if v80 == "ID" then
                            localid = value83
                          end
                        end
                      end
                    end
                  end
                end
              end
            end

            return v76, localid
          end
        end
      end

      function checkworldenemies(p17, p18)
        for v81, value84 in pairs(workspace.Server.Enemies.World[p17][p18]:GetChildren()) do
          if value84.ClassName == "Part" then
            return true
          end
        end

        return false
      end

      function monsterass(p19)
        for v82, value85 in pairs(workspace.Server.Enemies.World:GetChildren()) do
          for v83, value86 in pairs(value85:GetChildren()) do
            for v84, value87 in pairs(value86:GetChildren()) do
              local getAttributes6 = value87:GetAttributes()
              local loaded6 = value87:GetAttribute("Loaded")

              for v85, value88 in pairs(getAttributes6) do
                if v85 == "Health" and tonumber(value88) > 0 and loaded6 then
                  if value87.Name == p19 then
                    return true
                  end
                end
              end
            end
          end
        end

        return false
      end

      function auto_farm_selection(p20)
        local v86 = getClosestrandoms(p20)
        players.LocalPlayer.Character.HumanoidRootPart.CFrame = v86.CFrame * nonesfr
      end

      function auto_farm_selections(p21)
        if _G.Settings.Auto_Farm_Selection then
          if monsterass(_G.Settings.Enemies_Select[1]) then
            enemies_selected = _G.Settings.Enemies_Select[1]
          elseif monsterass(_G.Settings.Enemies_Select[2]) then
            enemies_selected = _G.Settings.Enemies_Select[2]
          elseif monsterass(_G.Settings.Enemies_Select[3]) then
            enemies_selected = _G.Settings.Enemies_Select[3]
          elseif monsterass(_G.Settings.Enemies_Select[4]) then
            enemies_selected = _G.Settings.Enemies_Select[4]
          elseif monsterass(_G.Settings.Enemies_Select[5]) then
            enemies_selected = _G.Settings.Enemies_Select[5]
          elseif monsterass(_G.Settings.Enemies_Select[6]) then
            enemies_selected = _G.Settings.Enemies_Select[6]
          elseif monsterass(_G.Settings.Enemies_Select[7]) then
            enemies_selected = _G.Settings.Enemies_Select[7]
          elseif monsterass(_G.Settings.Enemies_Select[8]) then
            enemies_selected = _G.Settings.Enemies_Select[8]
          elseif monsterass(_G.Settings.Enemies_Select[9]) then
            enemies_selected = _G.Settings.Enemies_Select[9]
          elseif monsterass(_G.Settings.Enemies_Select[10]) then
            enemies_selected = _G.Settings.Enemies_Select[10]
          elseif monsterass(_G.Settings.Enemies_Select[11]) then
            enemies_selected = _G.Settings.Enemies_Select[11]
          elseif monsterass(_G.Settings.Enemies_Select[12]) then
            enemies_selected = _G.Settings.Enemies_Select[12]
          end

          local v87 = getClosestrandomseqeq(enemies_selected)
          players.LocalPlayer.Character.HumanoidRootPart.CFrame = v87.CFrame * nonesfr
          return true
        end
      end

      function checkgamemodes()
        for v88, value89 in pairs(players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes:GetChildren()) do
          if value89.ClassName == "Frame" and value89.Visible then
            return true
          end
        end

        return false
      end

      function auto_quest()
        if _G.Settings.Auto_Quest then
          local v89 = getClosestrandomeqs()

          players.LocalPlayer.Character.HumanoidRootPart.CFrame = v89.CFrame
            * CFrame.new(0, 7, 0)

          return true
        end
      end

      function auto_trials()
        if checkgamemode() == false then
          return false
        end

        if _G.Settings.Auto_Trials_Easy or _G.Settings.Auto_Trials_Medium then
          local v90 = getClosestrandomgame()

          players.LocalPlayer.Character.HumanoidRootPart.CFrame = v90.CFrame
            * CFrame.new(0, 7, 0)

          return true
        end
      end

      dragon_verse_2 = {}

      for v91, value90 in pairs(replicatedStorage.Assets.Characters["Dragon Verse"]["Shiny Enemies"]:GetChildren()) do
      end

      tempest_invasion = {}

      for v92, value91 in pairs(replicatedStorage.Assets.Characters["Slime Verse"]["Shiny Enemies"]:GetChildren()) do
      end

      leveling_verse = {}

      for v93, value92 in pairs(replicatedStorage.Assets.Characters["Leveling Verse"]["Enemies Zone 2"]:GetChildren()) do
      end

      for v94, value93 in pairs(replicatedStorage.Assets.Characters["Leveling Verse"]["Units Zone 2"]:GetChildren()) do
      end

      function auto_tower()
        if _G.Settings.Auto_Tower then
          if players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Tower Key") then
            number = string.match(
              players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List["Tower Key"].Background.Amount.Text,
              "%d+"
            )
          else
            number = 0
          end

          if players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes.Tower.Visible then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
              28123.748, 838.31665, -15837.8203, 0.998544633, 1.8208727e-8, -0.0539316386,
              -1.70253731e-8, 1, 2.24011867e-8, 0.0539316386, -2.14503775e-8, 0.998544633
            )

            return true
          end

          if players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Tower Key")
            and tonumber(number) > 3 then
            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "General", "Gamemodes", "Join", "Tower", n = 4 }, "\2",
            })

            return true
          elseif checkworldenemies("Leveling Verse", "2") then
            auto_farm_selection(leveling_verse)
            return true
          else
            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "Player", "Teleport", "Teleport", "Leveling Verse", 2, "Spawn2", n = 6 }, "\2",
            })

            return true
          end
        else
          return
        end
      end

      function auto_tempest_invasion()
        if _G.Settings.Auto_Tempest_Invasion then
          if players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Slime Key") then
            number = string.match(
              players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List["Slime Key"].Background.Amount.Text,
              "%d+"
            )
          else
            number = 0
          end

          if players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Tempest Invasion"].Visible then
            local v95 = getClosestrandomgame()

            players.LocalPlayer.Character.HumanoidRootPart.CFrame = v95.CFrame
              * CFrame.new(0, 7, 0)

            return true
          end

          if players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Slime Key")
            and tonumber(number) > 3 then
            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "General", "Gamemodes", "Join", "Tempest Invasion", n = 4 }, "\2",
            })

            return true
          elseif checkworldenemies("Slime Verse", "2") then
            auto_farm_selection(tempest_invasion)
            return true
          else
            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "Player", "Teleport", "Teleport", "Slime Verse", 2, n = 5 }, "\2",
            })

            return true
          end
        else
          return
        end
      end

      function auto_dragon_defenses()
        if _G.Settings.Auto_Dragon_Defense then
          if players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Saiyan Key") then
            number = string.match(
              players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List["Saiyan Key"].Background.Amount.Text,
              "%d+"
            )
          else
            number = 0
          end

          if players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Dragon Defense"].Visible then
            local v96 = getClosestrandomgame()

            players.LocalPlayer.Character.HumanoidRootPart.CFrame = v96.CFrame
              * CFrame.new(0, 7, 0)

            return true
          end

          if players.LocalPlayer.PlayerGui.UI.Frames.Inventory.Background.Categories.Items.List:FindFirstChild("Saiyan Key")
            and tonumber(number) > 3 then
            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "General", "Gamemodes", "Join", "Dragon Defense", n = 4 }, "\2",
            })
          elseif checkworldenemies("Dragon Verse", "2") then
            auto_farm_selection(dragon_verse_2)
          else
            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "Player", "Teleport", "Teleport", "Dragon Verse", 2, n = 5 }, "\2",
            })
          end

          return
        end
      end

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_Open_Star then
              if thingup and workspace.Cache:FindFirstChild("Value") then
                thingup = false
                task.wait(_G.Settings.Custom_Delay)
                thingup = true
              end
            end
          end)
        end
      end)

      function auto_ore()
        if _G.Settings.Auto_Ore and checkores() then
          local v97 = getClosestrandomore()

          players.LocalPlayer.Character.HumanoidRootPart.CFrame = v97.CFrame
            * CFrame.new(0, 7, 0)

          return true
        end

        return false
      end

      function auto_globalboss()
        if _G.Settings.Auto_GlobalBoss then
          if checknotifation("Global Boss") then
            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "Player", "Teleport", "Teleport", "Cursed Verse", 2, n = 5 }, "\2",
            })

            return true
          end

          for v98, value94 in pairs(workspace.Server.Enemies["Global Bosses"]:GetChildren()) do
            if value94.ClassName == "Part" then
              players.LocalPlayer.Character.HumanoidRootPart.CFrame = value94.CFrame
              return true
            end
          end

          return false
        end

        return false
      end

      function open_egg()
        if _G.Settings.Auto_Open_Star then
          if thingup then
            if players.LocalPlayer.PlayerGui.UI.Frames.Shop.Background.Main.List.Gamepasses["3"]["Remote Star"].Background.Buttons.Buy.Visible then
              players.LocalPlayer.Character.HumanoidRootPart.CFrame = cfpuk
              task.wait(0.1)
            end

            replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
              { "General", "Stars", "Open", _G.Settings.Egg_Select, 999, n = 5 }, "\2",
            })

            task.wait(0.1)
            return true
          end

          return
        end
      end

      thingupsqq = {
        "Auto Global Boss", "Auto Trials", "Auto Tempest Invasion", "Auto Dragon Defenses",
        "Open Egg", "Auto Farm Selections", "Auto Quest", "Auto Ore",
      }

      function priority_checker(p22)
        if stoppingshit == false then
          if p22 == "Auto Global Boss" then
            if auto_globalboss() then
              return true
            end

            return false
          elseif p22 == "Auto Trials" then
            if auto_trials() then
              return true
            end

            return false
          elseif p22 == "Auto Tempest Invasion" then
            if auto_tempest_invasion() then
              return true
            end

            return false
          elseif p22 == "Auto Dragon Defenses" then
            if auto_dragon_defenses() then
              return true
            end

            return false
          elseif p22 == "Open Egg" then
            if open_egg() then
              return true
            end

            return false
          elseif p22 == "Auto Farm Selections" then
            if auto_farm_selections() then
              return true
            end

            return false
          elseif p22 == "Auto Quest" then
            if auto_quest() then
              return true
            end

            return false
          elseif p22 == "Auto Ore" then
            if auto_ore() then
              return true
            end

            return false
          elseif p22 == "Auto Tower" then
            if auto_tower() then
              return true
            end

            return false
          elseif p22 == "None" then
            if auto_tower() then
              return true
            elseif auto_trials() then
              return true
            elseif auto_dragon_defenses() then
              return true
            elseif auto_tempest_invasion() then
              return true
            elseif auto_globalboss() then
              return true
            elseif open_egg() then
              return true
            elseif auto_ore() then
              return true
            elseif auto_farm_selections(_G.Settings.Enemies_Select) then
              return true
            else
              if auto_quest() then
                return true
              end

              return false
            end
          else
            return false
          end
        else
          return false
        end
      end

      spawn(function()
        while task.wait() do
          pcall(function()
            if priority_checker(_G.Settings.One_Priority) then
              return
            elseif priority_checker(_G.Settings.Two_Priority) then
              return
            elseif priority_checker(_G.Settings.Three_Priority) then
              return
            elseif priority_checker(_G.Settings.Four_Priority) then
              return
            elseif priority_checker(_G.Settings.Five_Priority) then
              return
            elseif priority_checker(_G.Settings.Six_Priority) then
              return
            else
              if priority_checker(_G.Settings.Seven_Priority) then
                return
              end

              return
            end
          end)
        end
      end)

      if yesuieiq then
        spawn(function()
          while task.wait() do
            pcall(function()
              if auto_globalboss() then
                return
              elseif auto_tempest_invasion() then
                return
              elseif auto_dragon_defenses() then
                return
              elseif auto_trials() then
                return
              elseif open_egg() then
                return
              elseif auto_farm_selections(_G.Settings.Enemies_Select) then
                return
              else
                if auto_quest() then
                  return
                end

                return
              end
            end)
          end
        end)
      end

      function getClosestrandom()
        local character6 = players.LocalPlayer.Character

        if not character6 then
          return nil
        else
          local humanoidRootPart6 = character6:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart6 then
            return nil
          else
            local v99 = nil
            local huge6 = math.huge

            for v100, value95 in pairs(workspace.Server.Enemies.World:GetChildren()) do
              for v101, value96 in pairs(value95:GetChildren()) do
                for v102, value97 in pairs(value96:GetChildren()) do
                  for v103, value98 in pairs((value97:GetAttributes())) do
                    if v103 == "Health" and tonumber(value98) > 0 then
                      if value97 then
                        local magnitude6 = (value97.Position - humanoidRootPart6.Position).Magnitude

                        if magnitude6 < huge6 then
                          huge6 = magnitude6
                          v99 = value97

                          for v104, value99 in pairs((v99:GetAttributes())) do
                            if v104 == "ID" then
                              localid = value99
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end

            return v99, localid
          end
        end
      end

      spawn(function()
        while task.wait(3) do
          pcall(function()
            if _G.Settings.Trials_Auto_Leave then
              if players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Visible
                or players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Visible then
                if players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Visible then
                  v568 = players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Easy"].Main.Wave.Value.Text
                elseif players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Visible then
                  v566 = players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes["Trial Medium"].Main.Wave.Value.Text
                end

                if tonumber((string.match(text, "%d+"))) >= _G.Settings.Leave_Trials_At then
                  local v105 = tonumber(_G.Settings.World_Leave_Selection2)

                  replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
                    {
                      "Player", "Teleport", "Teleport", _G.Settings.World_Leave_Selection, v105,
                      n = 5,
                    },
                    "\2",
                  })
                end
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait(3) do
          pcall(function()
            if _G.Settings.Tower_Auto_Leave then
              if players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes.Tower.Visible then
                if tonumber((string.match(
                  players.LocalPlayer.PlayerGui.UI.HUD.Gamemodes.Tower.Main.Wave.Value.Text,
                  "%d+"
                ))) >= _G.Settings.Leave_Tower_At then
                  stoppingshit = true
                  local v106 = tonumber(_G.Settings.World_Leave_Selection2)

                  replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
                    {
                      "Player", "Teleport", "Teleport", _G.Settings.World_Leave_Selection, v106,
                      n = 5,
                    },
                    "\2",
                  })

                  task.wait(5)
                  stoppingshit = false
                end
              end
            end
          end)
        end
      end)

      function attackble()
        replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
          {
            "General", "Attack", "Click", { ["937829ae-270c-428a-9bfd-fc97275f66bd"] = true },
            n = 4,
          },
          "\2",
        })
      end

      function attackreal(p23)
        local getChildren = p23.GetChildren
        table_mons_near = {}

        for v107, value100 in pairs(getChildren(p23)) do
          if value100.ClassName == "Part" then
            tonumber(value100:GetAttribute("Health"))
            tostring(value100:GetAttribute("ID"))
          end
        end

        if table_mons_near[1] == nil then
          return false
        end

        thinghone1 = table_mons_near[1]

        if table_mons_near[2] ~= nil then
          thinghone2 = table_mons_near[2]
        else
          thinghone2 = table_mons_near[1]
        end

        if table_mons_near[3] ~= nil then
          thinghone3 = table_mons_near[3]
        else
          thinghone3 = table_mons_near[1]
        end

        if table_mons_near[4] ~= nil then
          thinghone4 = table_mons_near[4]
        else
          thinghone4 = table_mons_near[1]
        end

        if table_mons_near[5] ~= nil then
          thinghone5 = table_mons_near[5]
        else
          thinghone5 = table_mons_near[1]
        end

        replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
          {
            "General", "Attack", "Click",
            {
              [thinghone1] = true,
              [thinghone2] = true,
              [thinghone3] = true,
              [thinghone4] = true,
              [thinghone5] = true,
            },
            n = 4,
          },
          "\2",
        })

        return true
      end

      spawn(function()
        runService.RenderStepped:Connect(function()
          pcall(function()
            if _G.Settings.Auto_Click then
              parents = nil

              if _G.Settings.Auto_Ore and checkore() then
                parents = workspace.Server.Enemies.Ores
              elseif checkgamemodes() then
                for v108, value101 in pairs(workspace.Server.Enemies.Gamemodes:GetChildren()) do
                  for v109, value102 in pairs(value101:GetChildren()) do
                    if value102.ClassName == "Part" then
                      parents = value102.Parent
                    end
                  end
                end
              else
                for v110, value103 in pairs(workspace.Server.Enemies.World:GetChildren()) do
                  for v111, value104 in pairs(value103:GetChildren()) do
                    for v112, value105 in pairs(value104:GetChildren()) do
                      if value105.ClassName == "Part" then
                        parents = value105.Parent
                      end
                    end
                  end
                end
              end

              if not attackreal(parents) then
                replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
                  {
                    "General", "Attack", "Click",
                    { ["86f44e3c-e2c8-4a2d-8daf-5eb35e51d3b2"] = true },
                    n = 4,
                  },
                  "\2",
                })
              end
            end
          end)
        end)
      end)

      inglo = false

      function checkgloboss()
        for v113, value106 in pairs(workspace.Server.Enemies["Global Bosses"]:GetChildren()) do
          if value106.ClassName == "Part" then
            return true
          end
        end

        return false
      end

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_GlobalBoss then
              if checknotifation("Global Boss") and not checkgloboss() then
                for v114, value107 in pairs(workspace.Client.Enemies:GetChildren()) do
                  for v115, value108 in pairs(workspace.Server.Enemies.World:GetChildren()) do
                    for v116, value109 in pairs(value108:GetChildren()) do
                      if value109:FindFirstChild(value107.Name) then
                        Verse_Old = value109.Parent.Name
                        Dimes_Old = value109.Name
                      end
                    end
                  end
                end

                inglo = true
                stoppingshit = true

                replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
                  { "Player", "Teleport", "Teleport", "Cursed Verse", 2, n = 5 }, "\2",
                })

                task.wait(5)

                players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                  10873.502, 773.154114, -5159.50684, -1.1920929e-7, 0, 1.00000012, 0, 1, 0,
                  -1.00000012, 0, -1.1920929e-7
                )

                task.wait(1)
                stoppingshit = false
              elseif not checkgloboss() and inglo then
                local v117 = tonumber(Dimes_Old)

                replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
                  { "Player", "Teleport", "Teleport", Verse_Old, v117, n = 5 }, "\2",
                })

                inglo = false
                task.wait(5)
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait() do
          pcall(function()
            if players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("PlayerHUD").Main.Title.UID.Visible
              == true then
              local head = players.LocalPlayer.Character:WaitForChild("Head")
              head:WaitForChild("PlayerHUD").Main.Title.Visible = true

              local head2 = players.LocalPlayer.Character:WaitForChild("Head")

              head2:WaitForChild("PlayerHUD").Main.Title.TextColor3 = Color3.fromRGB(
                255, 135, 0
              )

              local head3 = players.LocalPlayer.Character:WaitForChild("Head")
              head3:WaitForChild("PlayerHUD").Main.Title.Text = "@AXELHUB"

              local head4 = players.LocalPlayer.Character:WaitForChild("Head")
              head4:WaitForChild("PlayerHUD").Main.Title.UID.Visible = false

              local head5 = players.LocalPlayer.Character:WaitForChild("Head")
              head5:WaitForChild("PlayerHUD").Main.Role.Text = "discord.gg/axelhub"

              local head6 = players.LocalPlayer.Character:WaitForChild("Head")
              head6:WaitForChild("PlayerHUD").Main.Role.TextColor3 = Color3.fromRGB(255, 175, 0)

              local head7 = players.LocalPlayer.Character:WaitForChild("Head")
              head7:WaitForChild("PlayerHUD").Main.Role.UID.Visible = false
            end
          end)
        end
      end)

      spawn(function()
        while task.wait(1) do
          pcall(function()
            if _G.Settings.Auto_Trials_Medium then
              if checknotifation("Medium") then
                replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
                  { "General", "Gamemodes", "Join", "Trial Medium", n = 4 }, "\2",
                })
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait(1) do
          pcall(function()
            if _G.Settings.Auto_Trials_Easy then
              if checknotifation("Easy") then
                replicatedStorage:WaitForChild("BridgeNet"):WaitForChild("dataRemoteEvent"):FireServer({
                  { "General", "Gamemodes", "Join", "Trial Easy", n = 4 }, "\2",
                })
              end
            end
          end)
        end
      end)

      localPlayer = players.LocalPlayer

      function setCollision(canCollide)
        if localPlayer.Character then
          for v118, value110 in pairs(localPlayer.Character:GetDescendants()) do
            if value110:IsA("BasePart") then
              value110.CanCollide = canCollide
            end
          end
        end
      end

      spawn(function()
        while task.wait() do
          pcall(function()
            if Noclip or _G.Settings.Auto_Dragon_Defense or _G.Settings.Auto_Farm_Selection
              or _G.Settings.Auto_Quest or _G.Settings.Auto_Trials then
              if not workspace:FindFirstChild("AxelHub_Part") then
                axelhubpart = Instance.new("Part")
              end

              axelhubpart = workspace:FindFirstChild("AxelHub_Part")
              axelhubpart.Parent = workspace
              axelhubpart.Name = "AxelHub_Part"
              axelhubpart.Anchored = true
              axelhubpart.CanCollide = true
              axelhubpart.Size = Vector3.new(5, 0.2, 5)

              axelhubpart.CFrame = players.LocalPlayer.Character.HumanoidRootPart.CFrame
                * CFrame.new(0, -3.1, 0)
            end
          end)
        end
      end)

      spawn(function()
        while task.wait(120) do
          pcall(function()
            virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
          end)
        end
      end)
    end
  end

  return
end
print("femboy")
