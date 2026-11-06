--key Bypass
local oldRequest = request
getgenv().request = function(opts)
    if opts and opts.Url and opts.Url:find("pandadevelopment.net") then
        return {
            Body = '{"Authenticated_Status":"Success","Key_Premium":true,"Note":"ok","Expire_Date":"never"}'
        }
    end
    return oldRequest(opts)
end
local starterGui = game:GetService("StarterGui")
local players = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local httpService = game:GetService("HttpService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local guiService = game:GetService("GuiService")
local teleportService = game:GetService("TeleportService")
local virtualInputManager = game:GetService("VirtualInputManager")
local f1, v1, v2, v3, v4, v5, f2, f3, f4, v6, f5, configSaverDropdown

if not axel_loaded then
  axel_loaded = true
  Premiums = false

  function f1()
    local v7, v8 = pcall(gethwid)

    if v7 and v8 then
      return v8
    end

    return tostring(rbxAnalyticsService:GetClientId()):gsub("-", "")
  end

  function f4(p1, p2)
    local jsonEncode = httpService:JSONEncode(p2)

    local v9 = request({
      Url = "https://new.pandadevelopment.net/api/v1" .. p1,
      Method = "POST",
      Headers = { ["Content-Type"] = "application/json" },
      Body = jsonEncode,
    })

    if v9 and v9.Body then
      return httpService:JSONDecode(v9.Body)
    end

    return nil
  end

  function GetKeyURL()
    return "https://new.pandadevelopment.net/getkey/" .. "axelhub" .. "?hwid=" .. f1()
  end

  function OpenGetKey()
    local v10 = GetKeyURL()

    if setclipboard then
      setclipboard(v10)
      print("Key URL copied to clipboard: " .. v10)
    end

    return v10
  end

  function Validate(p3, p4)
    local v11 = f4("/keys/validate", { ServiceID = "axelhub", HWID = f1(), Key = p3 })

    if not v11 then
      return {
        success = false,
        message = "Failed to connect to server",
        isPremium = false,
        expireDate = nil,
      }
    else
      local v12 = v11.Authenticated_Status == "Success"
      local success = v12
      local keyPremium = v11.Key_Premium or false
      local note = v11.Note or v12 and "Key validated!" or "Invalid key"

      if p4 and v12 and not keyPremium then
        success = false
        note = "Premium key required"
      end

      return {
        success = success,
        message = note,
        isPremium = keyPremium,
        expireDate = v11.Expire_Date,
      }
    end
  end

  function non_pre(p5)
    for v13, value in pairs(Validate(p5, false)) do
      if v13 == "success" and value == true then
        yes = true
        return true
      end
    end

    yes = false
    return false
  end

  function pre(p6)
    for v14, value2 in pairs(Validate(p6, false)) do
      if v14 == "isPremium" and value2 == true then
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
      Title = "AxelHub_CO_Key",
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
    if isfile("axelhub_co_key.key") then
      delfile("axelhub_co_key.key")
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
      if isfile("axelhub_co_key.key") then
        delfile("axelhub_co_key.key")
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
    if pre(key) then
      Premiums = true
    end

    function clicks(selectedObject)
      VirtualInputManager = virtualInputManager

      local v15 = game
      v15:GetService("GuiService").SelectedObject = selectedObject

      task.wait(0.1)

      VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
      VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

      task.wait(0.1)

      local v16 = game
      v16:GetService("GuiService").SelectedObject = nil
    end

    if game.PlaceId == 134963296781990 then
      world1 = true
    elseif game.PlaceId == 105342279726230 then
      world2 = true
    elseif game.PlaceId == 95740619340896 or game.PlaceId == 106357754220640
      or game.PlaceId == 130793476404022 or game.PlaceId == 136446612737000 then
      dungeon = true
    end

    game:IsLoaded()

    repeat
      task.wait()
      v1 = game
    until v1:IsLoaded()

    v19 = players.LocalPlayer.Character

    repeat
      task.wait()
      v2 = game
    until v2:GetService("Players").LocalPlayer.Character

    if not dungeon then
      v22 = players.LocalPlayer.PlayerGui.Loading

      repeat
        task.wait()
        v3 = game
      until v3:GetService("Players").LocalPlayer.PlayerGui.Loading

      v25 = players.LocalPlayer.PlayerGui.Loading.Enabled

      repeat
        task.wait(1)
        clicks(players.LocalPlayer.PlayerGui.Loading.InterfacePlay.Area.Buttons.Play.Button)
        v4 = game
      until v4:GetService("Players").LocalPlayer.PlayerGui.Loading.Enabled == false

      v29 = players.LocalPlayer.PlayerGui.Loading

      repeat
        task.wait()
        v5 = game
      until v5:GetService("Players").LocalPlayer.PlayerGui.Loading
    end

    _G.DefaultSettings = {
      Auto_Farm_Level = false,
      Auto_Timed_Boss = false,
      Auto_Dun_Retry = false,
    }

    userid = players.LocalPlayer.UserId
    folder_name = "AxelHub/" .. userid .. "_CO.JSON"
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

      HttpService = httpService

      function f3()
        userid = players.LocalPlayer.UserId
        return "AxelHub/" .. userid .. "_CO.JSON"
      end

      function f2(p8)
        v6 = tick()
        local v17 = v6

        task.delay(1, function()
          if v6 ~= v17 then
            return
          end

          if not (writefile and makefolder) then
            return
          else
            local match = p8:match("(.+)/")

            if not isfolder(match) then
              local split = match:split("/")
              local v18 = ""

              for index, value3 in ipairs(split) do
                local v20 = v18 .. value3

                if not isfolder(v20) then
                  makefolder(v20)
                end

                v18 = v20 .. "/"
              end
            end

            writefile(p8, HttpService:JSONEncode(_G.Settings))
            return
          end
        end)
      end

      v6 = 0

      if _G.Settings.Tween_Speed == nil then
        _G.Settings.Tween_Speed = 250
      end

      if _G.Settings.Disc == nil then
        _G.Settings.Disc = 5
      end

      if _G.Settings.Bypass_Tp == nil then
        _G.Settings.Bypass_Tp = false
      end

      _ENV["goto"] = function(p9, p10)
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

      local window = windUI:CreateWindow({
        Title = "Axel Hub - Clover Origins",
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

      window:SetBackgroundImage("rbxassetid://86949082023913")
      window:SetToggleKey(Enum.KeyCode.RightControl)

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

      if game.PlaceId == 134963296781990 then
        world1 = true
      elseif game.PlaceId == 105342279726230 then
        world2 = true
      elseif game.PlaceId == 95740619340896 then
        dungeon = true
      end

      function f5(p11)
        local v21, v23 = string.match(p11, "Lvl%.%s*(%d+)(k?)")
        local v24 = tonumber(v21)

        if v23 == "k" then
          v24 = v24 * 1000
        end

        return v24
      end

      function questcom()
        for v26, value4 in pairs(players.LocalPlayer.PlayerGui["Interface Player"].Notifications:GetChildren()) do
          if value4.ClassName == "Frame" and string.find(value4.Name, "Quest Completed") then
            value4:Destroy()
            return true
          end
        end

        return false
      end

      function checklevel12()
        if _G.Settings.Select_Quest == "Level" then
          local v27 = tonumber(f5(players.LocalPlayer.PlayerGui["Interface Player"].FrameBars.HUD.LabelLevel.TextLabel.Text))

          if world1 then
            if v27 < 50 then
              return "1"
            elseif v27 < 150 then
              return "2"
            elseif v27 < 250 then
              return "3"
            elseif v27 < 450 then
              return "4"
            elseif v27 < 750 then
              return "5"
            elseif v27 < 1000 then
              return "6"
            elseif v27 < 1350 then
              return "7"
            elseif v27 < 1650 then
              return "8"
            elseif v27 < 2000 then
              return "9"
            elseif v27 < 2550 then
              return "10"
            else
              if v27 >= 2550 then
                return "11"
              end

              return
            end
          elseif world2 then
            if v27 < 4500 then
              return "12"
            elseif v27 < 5000 then
              return "13"
            elseif v27 < 5500 then
              return "14"
            elseif v27 < 6000 then
              return "15"
            elseif v27 < 7000 then
              return "16"
            elseif v27 < 7500 then
              return "17"
            else
              if v27 >= 7500 then
                return "18"
              end

              return
            end
          else
            return
          end
        else
          if _G.Settings.Select_Quest == "Quest" then
            return _G.Settings.Selected_Quest
          end

          return
        end
      end

      mainquest = nil

      function checklevel1()
        if _G.Settings.Select_Quest == "Level" then
          return tostring(checklevel12())
        end

        if _G.Settings.Select_Quest == "Quest" then
          return _G.Settings.Selected_Quest
        end
      end

      function checklevel2()
        if checklevel1() == "1" then
          monsname = "Bandit"
          questname = "Bandit Quest Lvl 1"
        elseif checklevel1() == "2" then
          monsname = "Bandit Boss"
          questname = "Bandit Boss Quest Lvl 50"
        elseif checklevel1() == "3" then
          monsname = "Boar"
          questname = "Boar Quest Lvl 150"
        elseif checklevel1() == "4" then
          monsname = "Boar Boss"
          questname = "Boar Boss Quest Lvl 250"
        elseif checklevel1() == "5" then
          monsname = "Corrupted Wizard"
          questname = "Corrupted Wizards Quest Lvl 450"
        elseif checklevel1() == "6" then
          monsname = "Orc"
          questname = "Orc Lvl 750"
        elseif checklevel1() == "7" then
          monsname = "Orc King"
          questname = "Orc King Lvl 1000+"
        elseif checklevel1() == "8" then
          monsname = "Corrupt Dark Wizard"
          questname = "Corrupt Dark Wizard 1350"
        elseif checklevel1() == "9" then
          monsname = "Water Wizard"
          questname = "Quest Giver Water Wizard"
        elseif checklevel1() == "10" then
          monsname = "Earth Wizard"
          questname = "Quest Giver Earth Wizard 2000+"
        elseif checklevel1() == "11" then
          monsname = "Corrupt Nobleman"
          questname = "Quest Giver Corrupted Nobleman 2550+"
        elseif checklevel1() == "12" then
          monsname = "Exiled Magic Knight"
          questname = "Exiled Magic Quest"
        elseif checklevel1() == "13" then
          monsname = "Corrupted Fire Wizard"
          questname = "Corrupted Fire Magic"
        elseif checklevel1() == "14" then
          monsname = "White Wolf"
          questname = "Alpha Wolf Quest Giver"
        elseif checklevel1() == "15" then
          monsname = "Boxer Figther"
          questname = "Boxer Fighter Quest Giver"
        elseif checklevel1() == "16" then
          monsname = "Reinforcement Wizard"
          questname = "Reinforcement Quest Giver"
        elseif checklevel1() == "17" then
          monsname = "Swamp Monster"
          questname = "Swamp Monster Quest Giver"
        elseif checklevel1() == "18" then
          monsname = "Hybrid Alligator"
          questname = "Hybrid Alligator Quest Giver"
        end
      end

      function attacknearest()
        if attackhold then
          for v28, value5 in pairs(players.LocalPlayer.Character:GetChildren()) do
            if value5.ClassName == "Tool" then
              weapon_sedsa = value5.Name
            end
          end

          for v30, value6 in pairs(workspace.Npcs:GetChildren()) do
            if value6:FindFirstChild("HumanoidRootPart") then
              if (value6.HumanoidRootPart.Position
                  - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                < 10 then
                buklaa = _G.Settings.Damage_Multipier
                talbe_shity = {}

                for i = 1, buklaa do
                  table.insert(talbe_shity, value6)
                end

                replicatedStorage:WaitForChild("Events"):WaitForChild("Combat"):FireServer(unpack({
                  weapon_sedsa, talbe_shity, 1, 0.14839826303593, 58.678974,
                }))
              end
            end
          end
        end
      end

      local mainSection = window:Section({
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

      local statsTab = mainSection:Tab({ Title = "Stats", Icon = "bubbles", Locked = false })
      local rerollTab = mainSection:Tab({ Title = "Reroll", Icon = "shell", Locked = false })
      local questTab = mainSection:Tab({ Title = "Quest", Icon = "scroll", Locked = false })

      local dungeonTab = mainSection:Tab({
        Title = "Dungeon",
        Icon = "door-open",
        Locked = false,
      })

      local webhookTab = mainSection:Tab({ Title = "Webhook", Icon = "flag", Locked = false })
      local miscTab = mainSection:Tab({ Title = "Misc", Icon = "badge-alert", Locked = false })

      local settingsTab = mainSection:Tab({
        Title = "Settings",
        Icon = "settings",
        Opened = true,
      })

      window:Tag({
        Title = ".gg/axelhub",
        Icon = "link",
        Color = Color3.fromHex("#30ff6a"),
        Radius = 6,
      })

      window:Tag({
        Title = "1.1.1",
        Icon = "settings",
        Color = Color3.fromHex("#97DBF0"),
        Radius = 6,
      })

      window:EditOpenButton({
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

      backpacks = {}

      for v31, value7 in pairs(players.LocalPlayer.Backpack:GetChildren()) do
      end

      dropdowns.Selected_Weapon = mainTab:Dropdown({
        Title = "Select Weapon",
        Desc = "select your weapon.",
        Values = backpacks,
        Value = _G.Settings.Selected_Weapon,
        Multi = false,
        AllowNone = false,
        Callback = function(value8) _G.Settings.Selected_Weapon = value8 end,
      })

      mainTab:Button({
        Title = "Refresh Weapon",
        Desc = "",
        Locked = false,
        Callback = function()
          backpacks = {}

          for v32, value9 in pairs(players.LocalPlayer.Backpack:GetChildren()) do
          end

          dropdowns.Selected_Weapon:Refresh(backpacks)
        end,
      })

      local v33 = dropdowns

      v33.Select_Quest = mainTab:Dropdown({
        Title = "Select Quest",
        Desc = "select way to farm",
        Values = { "Level", "Quest" },
        Value = _G.Settings.Select_Quest or "Level",
        Multi = false,
        AllowNone = false,
        Callback = function(value10) _G.Settings.Select_Quest = value10 end,
      })

      if world1 then
        questthing = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11" }
      elseif world2 then
        questthing = { "12", "13", "14", "15", "16", "17", "18" }
      else
        questthing = { "1", "2" }
      end

      local v34 = dropdowns

      v34.Selected_Quest = mainTab:Dropdown({
        Title = "Select Quest",
        Desc = "select quest to farm.",
        Values = questthing,
        Value = _G.Settings.Selected_Quest or "1",
        Multi = false,
        AllowNone = false,
        Callback = function(value11) _G.Settings.Selected_Quest = value11 end,
      })

      if _G.Settings.Damage_Multipier == nil then
        _G.Settings.Damage_Multipier = 250
      end

      slides.Damage_Multipier = mainTab:Slider({
        Title = "Damage Multipier",
        Desc = "",
        Step = 1,
        Value = { Min = 1, Max = 1000, Default = _G.Settings.Damage_Multipier or 250 },
        Callback = function(value12) _G.Settings.Damage_Multipier = value12 end,
      })

      toggles.Auto_Farm_Level = mainTab:Toggle({
        Title = "Auto Farm Level",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Farm_Level or false,
        Callback = function(value13) _G.Settings.Auto_Farm_Level = value13 end,
      })

      toggles.Auto_Second_Sea = mainTab:Toggle({
        Title = "Auto Second Sea",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Second_Sea or false,
        Callback = function(value14) _G.Settings.Auto_Second_Sea = value14 end,
      })

      toggles.Kill_Aura = mainTab:Toggle({
        Title = "Kill Aura",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Kill_Aura or false,
        Callback = function(value15) _G.Settings.Kill_Aura = value15 end,
      })

      toggles.Auto_Chest = mainTab:Toggle({
        Title = "Auto Chest",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Chest or false,
        Callback = function(value16) _G.Settings.Auto_Chest = value16 end,
      })

      mainTab:Section({ Title = "Boss Menu" })
      mainTab:Divider()

      toggles.Auto_Santoryu_Vermillion = mainTab:Toggle({
        Title = "Auto Santoryu Vermillion",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Santoryu_Vermillion or false,
        Callback = function(value17) _G.Settings.Auto_Santoryu_Vermillion = value17 end,
      })

      toggles.Auto_Litch = mainTab:Toggle({
        Title = "Auto Litch",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Litch or false,
        Callback = function(value18) _G.Settings.Auto_Litch = value18 end,
      })

      toggles.Auto_Luck = mainTab:Toggle({
        Title = "Auto Luck",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Luck or false,
        Callback = function(value19) _G.Settings.Auto_Luck = value19 end,
      })

      toggles.Auto_Noelle = mainTab:Toggle({
        Title = "Auto Noelle",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Noelle or false,
        Callback = function(value20) _G.Settings.Auto_Noelle = value20 end,
      })

      toggles.Auto_Asta = mainTab:Toggle({
        Title = "Auto Asta",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Asta or false,
        Callback = function(value21) _G.Settings.Auto_Asta = value21 end,
      })

      toggles.Auto_Yami = mainTab:Toggle({
        Title = "Auto Yami",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Yami or false,
        Callback = function(value22) _G.Settings.Auto_Yami = value22 end,
      })

      toggles.Auto_Werewolf = mainTab:Toggle({
        Title = "Auto Werewolf",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Werewolf or false,
        Callback = function(value23) _G.Settings.Auto_Werewolf = value23 end,
      })

      toggles.Auto_Yuno = mainTab:Toggle({
        Title = "Auto Yuno",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Yuno or false,
        Callback = function(value24) _G.Settings.Auto_Yuno = value24 end,
      })

      rerollTab:Section({ Title = "Grimoires Menu" })
      rerollTab:Divider()

      thingupsqqs = {
        "Regen", "Reinforcement", "Earth", "Fire", "Water", "Lighting", "Dark", "Fire Magma",
        "AntiMagic", "Wind", "Time Magic", "Light",
      }

      local v35 = dropdowns

      v35.Grimoires_Select = rerollTab:Dropdown({
        Title = "Grimoires Select",
        Desc = "select your grimoires to spin.",
        Values = thingupsqqs,
        Value = _G.Settings.Grimoires_Select or "Regen",
        Multi = true,
        AllowNone = true,
        Callback = function(value25) _G.Settings.Grimoires_Select = value25 end,
      })

      toggles.Auto_Grimoires = rerollTab:Toggle({
        Title = "Auto Grimoires",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Grimoires or false,
        Callback = function(value26) _G.Settings.Auto_Grimoires = value26 end,
      })

      questTab:Section({ Title = "Priority Menu" })
      questTab:Divider()

      questTab:Button({
        Title = "Broom Quest",
        Desc = "",
        Locked = false,
        Callback = function()
          thingass = 1

          repeat
            task.wait()
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BroomQuestCircles[thingass].CFrame
            task.wait(1)
            thingass = thingass + 1
          until thingass == 17
        end,
      })

      toggles.Auto_ManaSense = questTab:Toggle({
        Title = "Auto ManaSense",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_ManaSense or false,
        Callback = function(value27) _G.Settings.Auto_ManaSense = value27 end,
      })

      dungeonTab:Section({ Title = "Dungeon Menu" })
      dungeonTab:Divider()

      toggles.Auto_Join_Rift = dungeonTab:Toggle({
        Title = "Auto Join Rift",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Join_Rift or false,
        Callback = function(value28) _G.Settings.Auto_Join_Rift = value28 end,
      })

      toggles.Auto_Dungeon = dungeonTab:Toggle({
        Title = "Auto Dungeon",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Dungeon or false,
        Callback = function(value29) _G.Settings.Auto_Dungeon = value29 end,
      })

      toggles.Auto_Retry_Dungeon = dungeonTab:Toggle({
        Title = "Auto Retry",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Retry_Dungeon or false,
        Callback = function(value30) _G.Settings.Auto_Retry_Dungeon = value30 end,
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

      thingupsqq = { "None", "Farm Level", "Yuno", "Litch" }

      local v36 = dropdowns

      v36.One_Priority = priorityTab:Dropdown({
        Title = "1 Priority",
        Desc = "select your first thing to do",
        Values = thingupsqq,
        Value = _G.Settings.One_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value31) _G.Settings.One_Priority = value31 end,
      })

      local v37 = dropdowns

      v37.Two_Priority = priorityTab:Dropdown({
        Title = "2 Priority",
        Desc = "select your second thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Two_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value32) _G.Settings.Two_Priority = value32 end,
      })

      local v38 = dropdowns

      v38.Three_Priority = priorityTab:Dropdown({
        Title = "3 Priority",
        Desc = "select your third thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Three_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value33) _G.Settings.Three_Priority = value33 end,
      })

      local v39 = dropdowns

      v39.Four_Priority = priorityTab:Dropdown({
        Title = "4 Priority",
        Desc = "select your fourth thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Four_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value34) _G.Settings.Four_Priority = value34 end,
      })

      local v40 = dropdowns

      v40.Five_Priority = priorityTab:Dropdown({
        Title = "5 Priority",
        Desc = "select your fifth thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Five_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value35) _G.Settings.Five_Priority = value35 end,
      })

      local v41 = dropdowns

      v41.Six_Priority = priorityTab:Dropdown({
        Title = "6 Priority",
        Desc = "select your sixth thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Six_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value36) _G.Settings.Six_Priority = value36 end,
      })

      local v42 = dropdowns

      v42.Seven_Priority = priorityTab:Dropdown({
        Title = "7 Priority",
        Desc = "select your seventh thing to do",
        Values = thingupsqq,
        Value = _G.Settings.Seven_Priority or "None",
        Multi = false,
        AllowNone = false,
        Callback = function(value37) _G.Settings.Seven_Priority = value37 end,
      })

      statsTab:Section({ Title = "Priority Menu" })
      statsTab:Divider()

      toggles.Auto_Stats_Melee = statsTab:Toggle({
        Title = "Auto Stats Melee",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Stats_Melee or false,
        Callback = function(value38) _G.Settings.Auto_Stats_Melee = value38 end,
      })

      spawn(function()
        while task.wait(0.5) do
          pcall(function()
            if _G.Settings.Auto_Stats_Melee then
              replicatedStorage:WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack({
                "Melee", 99,
              }))
            end
          end)
        end
      end)

      toggles.Auto_Stats_Blade = statsTab:Toggle({
        Title = "Auto Stats Blade",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Stats_Blade or false,
        Callback = function(value39) _G.Settings.Auto_Stats_Blade = value39 end,
      })

      spawn(function()
        while task.wait(0.5) do
          pcall(function()
            if _G.Settings.Auto_Stats_Blade then
              replicatedStorage:WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack({
                "Blade", 99,
              }))
            end
          end)
        end
      end)

      toggles.Auto_Stats_Magic = statsTab:Toggle({
        Title = "Auto Stats Magic",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Stats_Magic or false,
        Callback = function(value40) _G.Settings.Auto_Stats_Magic = value40 end,
      })

-- https://discord.gg/AwGHNh7Z7T
      spawn(function()
        while task.wait(0.5) do
          pcall(function()
            if _G.Settings.Auto_Stats_Magic then
              replicatedStorage:WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack({
                "Magic", 99,
              }))
            end
          end)
        end
      end)

      toggles.Auto_Stats_Mana = statsTab:Toggle({
        Title = "Auto Stats Mana",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Stats_Mana or false,
        Callback = function(value41) _G.Settings.Auto_Stats_Mana = value41 end,
      })

      spawn(function()
        while task.wait(0.5) do
          pcall(function()
            if _G.Settings.Auto_Stats_Mana then
              replicatedStorage:WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack({
                "Mana", 99,
              }))
            end
          end)
        end
      end)

      toggles.Auto_Stats_Defense = statsTab:Toggle({
        Title = "Auto Stats Defense",
        Desc = "",
        Icon = "circle-check-big",
        Type = "Checkbox",
        Value = _G.Settings.Auto_Stats_Defense or false,
        Callback = function(value42) _G.Settings.Auto_Stats_Defense = value42 end,
      })

      spawn(function()
        while task.wait(0.5) do
          pcall(function()
            if _G.Settings.Auto_Stats_Defense then
              replicatedStorage:WaitForChild("Events"):WaitForChild("Stats"):FireServer(unpack({
                "Defense", 99,
              }))
            end
          end)
        end
      end)

      function sendwebhook(value43)
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
                      value = value43,
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
        local v43 = dropdowns

        v43.Webhook_Notify = webhookTab:Dropdown({
          Title = "Webhook Notify Selection",
          Desc = "tell us in discord if you need more (with name of the items)",
          Values = {
            "Aura Crate", "Cosmetic Crate", "Secret Chest", "Upper Seal", "Abyss Sigil",
            "Path Fragment", "Eternal Core", "Azure Heart", "Corruption Core",
          },
          Value = _G.Settings.Webhook_Notify or { "Aura Crate" },
          Multi = true,
          AllowNone = false,
          Callback = function(value44) _G.Settings.Webhook_Notify = value44 end,
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
          Callback = function(value45) _G.Settings.Webhook_Link = value45 end,
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
          Callback = function(value46) _G.Settings.Send_Webhook = value46 end,
        })

        local v44 = inputs

        v44.Pings_Userid = webhookTab:Input({
          Title = "Discord Userid",
          Desc = "put your discord id",
          Value = _G.Settings.Pings_Userid or "",
          InputIcon = "",
          Type = "Input",
          Placeholder = "e.g. 12345678",
          Callback = function(value47)
            _G.Settings.Pings_Userid = value47

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
          Callback = function(value48)
            _G.Settings.Send_Webhook_Pings = value48

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

      local v45 = dropdowns

      v45.Screen_cpu = miscTab:Dropdown({
        Title = "Screen Color",
        Desc = "",
        Values = { "Black", "White" },
        Value = _G.Settings.Screen_cpu or "Black",
        Multi = false,
        AllowNone = false,
        Callback = function(value49)
          _G.Settings.Screen_cpu = value49

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
        Callback = function(value50)
          _G.Settings.Screen_CPUStart = value50

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
        Callback = function() f2(f3()) end,
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
        Callback = function(value51)
          _G.Settings.Auto_Rejoin = value51

          function missing(p12, p13, p14)
            if type(p13) == p12 then
              return p13
            end

            return p14
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
        Callback = function(value52) _G.Settings.Auto_Execute = value52 end,
      })

      configall = {}

      if isfolder("AxelConfig_CO") then
        for v46, value53 in pairs(listfiles("AxelConfig_CO")) do
          value53:match("[^/\\]+$")
        end
      else
        makefolder("AxelConfig_CO")
      end

      inputs.Config_Name = settingsTab:Input({
        Title = "Config Name",
        Desc = "Input your config name",
        Value = "",
        InputIcon = "",
        Type = "Input",
        Placeholder = "e.g. FarmBoss",
        Callback = function(value54) Config_Name = value54 end,
      })

      settingsTab:Button({
        Title = "Create Config",
        Desc = "",
        Locked = false,
        Callback = function()
          if not isfile("AxelConfig_CO/" .. Config_Name .. ".JSON") then
            writefile("AxelConfig_CO/" .. Config_Name .. ".JSON", "")
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
        Callback = function(value55) Config_Select = value55 end,
      })

      settingsTab:Button({
        Title = "Refresh Config",
        Desc = "",
        Locked = false,
        Callback = function()
          configall = {}

          if isfolder("AxelConfig_CO") then
            for v47, value56 in pairs(listfiles("AxelConfig_CO")) do
              value56:match("[^/\\]+$")
            end
          else
            makefolder("AxelConfig_CO")
          end

          configSaverDropdown:Refresh(configall)
        end,
      })

      settingsTab:Button({
        Title = "Delete Config",
        Desc = "",
        Locked = false,
        Callback = function() delfile("AxelConfig_CO/" .. Config_Select) end,
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
          if not isfile("AxelConfig_CO/" .. Config_Select) then
            local httpService2 = game:service("HttpService")

            writefile(
              "AxelConfig_CO/" .. Config_Select, httpService2:JSONEncode(_G.DefaultSettings)
            )
          else
            f2("AxelConfig_CO/" .. Config_Select)
          end
        end,
      })

      settingsTab:Button({
        Title = "Load Config",
        Desc = "",
        Locked = false,
        Callback = function()
          prop = game:service("HttpService"):JSONDecode(readfile("AxelConfig_CO/" .. Config_Select))

          for v48, value57 in pairs(prop) do
            local v49 = v48
            local v50 = value57

            pcall(function()
              if v50 == true or v50 == false then
                if v49 ~= "Auto_Rejoin" and v49 ~= "Auto_Execute" then
                  toggles[v49]:Set(v50)
                end
              elseif tonumber(v50) ~= nil then
                slides[v49]:Set(v50)
              elseif v49 == "Webhook_Link" then
                inputs[v49]:Set(v50)
              else
                dropdowns[v49]:Select(v50)
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
          prop = game:service("HttpService"):JSONDecode(readfile(f3()))

          for v51, value58 in pairs(prop) do
            local v52 = v51
            local v53 = value58

            pcall(function()
              if v52 ~= "Bypass_Tp" and v52 ~= "Auto_Rejoin" and v52 ~= "Auto_Execute"
                and v53 == true then
                toggles[v52]:Set(false)
              end
            end)
          end
        end,
      })

      function checkquest()
        if workspace:FindFirstChild("Chests") then
          for v54, value59 in pairs(workspace.Chests.Chests:GetChildren()) do
            if value59.ClassName == "Model" and value59:FindFirstChild("RootPart") then
              return true
            end
          end

          return false
        end

        return false
      end

      function auto_chest()
        if _G.Settings.Auto_Chest then
          if checkquest() then
            for v55, value60 in pairs(workspace.Chests.Chests:GetChildren()) do
              if value60.ClassName == "Model" and value60:FindFirstChild("RootPart") then
                players.LocalPlayer.Character.HumanoidRootPart.CFrame = value60.RootPart.CFrame

                for v56, value61 in pairs(value60:GetChildren()) do
                  if value61.ClassName == "ProximityPrompt" then
                    print(value61)
                    fireproximityprompt(value61)
                    return true
                  end
                end
              end
            end

            return false
          end

          if not checkquest() then
            return false
          end

          return false
        end

        return false
      end

      function Auto_Farm_Level()
        if _G.Settings.Auto_Farm_Level then
          checklevel2()

          if players.LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.Visible then
            local v57 = game

            if string.find(
              v57:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.LabelTittle.LabelTittle.Text,
              monsname
            ) then
              for v58, value62 in pairs(workspace.Npcs:GetChildren()) do
                if value62.Name == monsname and value62.Humanoid.Health > 0 then
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = value62.HumanoidRootPart.CFrame
                    * CFrame.new(0, 0, 3)
                end
              end
            else
              local v59 = game

              if not string.find(
                v59:GetService("Players").LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.LabelTittle.LabelTittle.Text,
                monsname
              ) then
                replicatedStorage:WaitForChild("Events"):WaitForChild("Quests"):FireServer("cancel")
              end
            end
          elseif players.LocalPlayer.PlayerGui["Interface Player"].QuestDisplay.Visible
            == false then
            replicatedStorage:WaitForChild("Events"):WaitForChild("Quests"):FireServer(unpack({
              "giveQuest", questname,
            }))
          end
        end
      end

      function Auto_Werewolf()
        if _G.Settings.Auto_Werewolf then
          for v60, value63 in pairs(workspace.Npcs:GetChildren()) do
            if value63.Name == "Wolf" or value63.Name == "Werewolf" then
              players.LocalPlayer.Character.HumanoidRootPart.CFrame = value63.HumanoidRootPart.CFrame
                * CFrame.new(0, 0, 3)

              return true
            end
          end

          return false
        end

        return false
      end

      function Auto_Litch()
        if _G.Settings.Auto_Litch and world1 then
          if workspace.Npcs:FindFirstChild("Litch") then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Litch.HumanoidRootPart.CFrame
              * CFrame.new(0, 0, 3)

            return true
          end

          return false
        end

        return false
      end

      function Auto_Santoryu_Vermillion()
        if _G.Settings.Auto_Santoryu_Vermillion then
          if workspace.Npcs:FindFirstChild("Santoryu Vermillion") then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs["Santoryu Vermillion"].HumanoidRootPart.CFrame
              * CFrame.new(0, 0, 3)

            return true
          end

          return false
        end

        return false
      end

      function Auto_Yuno()
        if _G.Settings.Auto_Yuno then
          if workspace.Npcs:FindFirstChild("Yuno") then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Yuno.HumanoidRootPart.CFrame
              * CFrame.new(0, 0, 3)

            return true
          end

          return false
        end

        return false
      end

      function Auto_Noelle()
        if _G.Settings.Auto_Noelle then
          if workspace.Npcs:FindFirstChild("Noelle") then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Noelle.HumanoidRootPart.CFrame
              * CFrame.new(0, 0, 3)

            return true
          end

          return false
        end

        return false
      end

      function Auto_Luck()
        if _G.Settings.Auto_Luck then
          if workspace.Npcs:FindFirstChild("Luck") then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Luck.HumanoidRootPart.CFrame
              * CFrame.new(0, 0, 3)

            return true
          end

          return false
        end

        return false
      end

      function Auto_Asta()
        if _G.Settings.Auto_Asta then
          if workspace.Npcs:FindFirstChild("Asta") then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Asta.HumanoidRootPart.CFrame
              * CFrame.new(0, 0, 3)

            return true
          end

          return false
        end

        return false
      end

      function Auto_Yami()
        if _G.Settings.Auto_Yami then
          if workspace.Npcs:FindFirstChild("Yami") then
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Npcs.Yami.HumanoidRootPart.CFrame
              * CFrame.new(0, 0, 3)

            return true
          end

          return false
        end

        return false
      end

      function checkgrimore()
        local label1 = players.LocalPlayer.PlayerGui.GrimoireSpins.Frame.Frame.LabelGrimoire.Label1

        for v61, value64 in pairs(_G.Settings.Grimoires_Select) do
          if label1.Text == value64 then
            return true
          end
        end

        return false
      end

      function priority_checker(p15)
        if p15 == "Farm Level" then
          if Auto_Farm_Level() then
            return true
          end

          return false
        elseif p15 == "Yuno" then
          if Auto_Yuno() then
            return true
          end

          return false
        elseif p15 == "Litch" then
          if Auto_Litch() then
            return true
          end

          return false
        elseif p15 == "None" then
          if Auto_Werewolf() then
            return true
          elseif Auto_Santoryu_Vermillion() then
            return true
          elseif Auto_Noelle() then
            return true
          elseif Auto_Yami() then
            return true
          elseif Auto_Asta() then
            return true
          elseif Auto_Luck() then
            return true
          elseif Auto_Litch() then
            return true
          elseif Auto_Yuno() then
            return true
          elseif auto_chest() then
            return true
          else
            if Auto_Farm_Level() then
              return true
            end

            return true
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

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_ManaSense then
              if players.LocalPlayer.PlayerGui.ManaSense.Enabled then
                local v62 = game
                local v63 = game
                v62:GetService("GuiService").SelectedObject = v63:GetService("Players").LocalPlayer.PlayerGui.ManaSense.Frame.ActiveCircle
                task.wait(0.1)

                virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

                task.wait(0.1)

                local v64 = game
                v64:GetService("GuiService").SelectedObject = nil
              elseif players.LocalPlayer.PlayerGui.Dialogue.Enabled then
                local v65 = game
                local v66 = game
                v65:GetService("GuiService").SelectedObject = v66:GetService("Players").LocalPlayer.PlayerGui.Dialogue.Frame.Side.Accept.Trigger
                task.wait(0.1)

                virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

                task.wait(0.1)

                local v67 = game
                v67:GetService("GuiService").SelectedObject = nil
              else
                players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                  -462.414856, 39.2215767, -1478.33899, -0.759834111, 0, 0.650117159, 0, 1, 0,
                  -0.650117159, 0, -0.759834111
                )

                fireproximityprompt(workspace.Interactives.ManaSense.Interact)
              end
            end
          end)
        end
      end)

      attackhold = true

      spawn(function()
        while task.wait(0.2) do
          pcall(function()
            if _G.Settings.Kill_Aura or _G.Settings.Auto_Dungeon or _G.Settings.Auto_Farm_Level
              or _G.Settings.Auto_Litch or _G.Settings.Auto_Yuno then
              attackhold = true
              task.wait(10)
              attackhold = false
              task.wait(2)
            end
          end)
        end
      end)

      spawn(function()
        while task.wait(0.2) do
          pcall(function()
            if _G.Settings.Kill_Aura or _G.Settings.Auto_Dungeon or _G.Settings.Auto_Farm_Level
              or _G.Settings.Auto_Litch or _G.Settings.Auto_Yuno then
              attacknearest()
              attacking = true

              if not players.LocalPlayer.Character:FindFirstChild(_G.Settings.Selected_Weapon) then
                players.LocalPlayer.Character.Humanoid:EquipTool(players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Selected_Weapon))
              end
            else
              attacking = false
            end
          end)
        end
      end)

      spawn(function()
        while task.wait() do
          pcall(function()
            if Noclip or _G.Settings.Auto_Farm_Level or _G.Settings.Auto_Yuno
              or _G.Settings.Auto_Litch then
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
        while task.wait() do
          pcall(function()
            if attacking then
              if workspace:FindFirstChild("Effects") then
                local v68 = game
                workspace.Effects.Parent = v68:GetService("ReplicatedStorage")
              end
            elseif not attacking then
              if replicatedStorage:FindFirstChild("Effects") then
                local v69 = game
                v69:GetService("ReplicatedStorage").Effects.Parent = workspace
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait(3) do
          pcall(function()
            if _G.Settings.Auto_Join_Rift and world1 then
              for v70, value65 in pairs(workspace:GetChildren()) do
                if value65.Name == "TimeRiftBubble" then
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = value65.CFrame
                  task.wait(1)
                  fireproximityprompt(value65.PromptHolder.ProximityPrompt)
                end
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_Grimoires then
              if players.LocalPlayer.PlayerGui.GrimoireSpins.Enabled == false then
                if players.LocalPlayer.PlayerGui.Dialogue.Enabled then
                  local v71 = game
                  local v72 = game
                  v71:GetService("GuiService").SelectedObject = v72:GetService("Players").LocalPlayer.PlayerGui.Dialogue.Frame.Side.Accept.Trigger
                  task.wait(0.1)

                  virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                  virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

                  task.wait(0.1)

                  local v73 = game
                  v73:GetService("GuiService").SelectedObject = nil
                else
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    753.548035, 13.6261683, -695.656982, 0.409679413, 0, -0.912229657, 0, 1, 0,
                    0.912229657, 0, 0.409679413
                  )

                  fireproximityprompt(workspace.Interactives.Wizard.Interact)
                end
              elseif checkgrimore() then
                print(true)
              else
                replicatedStorage:WaitForChild("Events"):WaitForChild("Spins"):FireServer("Grimoire")
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_Dungeon and dungeon then
              for v74, value66 in pairs(workspace.Npcs:GetChildren()) do
                if value66:FindFirstChild("HumanoidRootPart") and value66.Humanoid.Health > 0 then
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = value66.HumanoidRootPart.CFrame
                    * CFrame.new(0, 0, 5)
                end
              end
            end
          end)
        end
      end)

      function checkmonss()
        for v75, value67 in pairs(workspace.Npcs:GetChildren()) do
          if value67 and value67.Humanoid.Health > 0 then
            return true
          end
        end

        return false
      end

      function checkdoordun()
        for v76, value68 in pairs(workspace.mapa:GetChildren()) do
          if value68.Name == "portão" then
            return true
          end
        end

        return false
      end

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_Retry_Dungeon and dungeon
              and players.LocalPlayer.PlayerGui.Dungeon.Rewards.Visible then
              replicatedStorage:WaitForChild("Events"):WaitForChild("Dungeon"):FireServer("RepeatDungeon")
              doornowfiredun = 1
              task.wait(0.5)
            end
          end)
        end
      end)

      doornowfiredun = 1

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_Dungeon and dungeon then
              if not checkmonss() and checkdoordun() then
                if doornowfiredun == 1 then
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    -288.89621, 3.24687624, 182.450546, -0.993048012, -9.43622283e-8,
                    -0.11771024, -9.21354797e-8, 1, -2.43588065e-8, 0.11771024, -1.33441747e-8,
                    -0.993048012
                  )

                  doornowfiredun = doornowfiredun + 1
                  task.wait(2)
                elseif doornowfiredun == 2 then
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    -11.1228313, 23.448391, 397.848541, -0.0602148362, -6.30728803e-10,
                    -0.998185456, 2.07433377e-8, 1, -1.8832027e-9, 0.998185456, -2.0819094e-8,
                    -0.0602148362
                  ) * CFrame.new(math.random(
                    0, 5
                  ), 0, math.random(
                    0, 5
                  ))

                  doornowfiredun = doornowfiredun + 1
                  task.wait(2)
                elseif doornowfiredun == 3 then
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    429.42276, 27.9519386, 432.702972, -0.514482498, 1.15381171e-8,
                    -0.857500851, -1.24256427e-8, 1, 2.09106403e-8, 0.857500851, 2.14131575e-8,
                    -0.514482498
                  )

                  doornowfiredun = doornowfiredun + 1
                  task.wait(3)
                elseif doornowfiredun == 4 then
                  players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    834.799011, 34.5948982, 437.292603, 0.812706232, 1.5390583e-8, 0.582673669,
                    -3.31696981e-8, 1, 1.98509706e-8, -0.582673669, -3.54601184e-8, 0.812706232
                  )

                  doornowfiredun = 1
                  task.wait(2)
                end
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_Dungeon and dungeon then
              if not checkmonss() then
                for v77, value69 in pairs(workspace:GetChildren()) do
                  if string.find(value69.Name, "Portal") then
                    players.LocalPlayer.Character.HumanoidRootPart.CFrame = value69.CFrame
                    task.wait(0.5)
                  end
                end
              end
            end
          end)
        end
      end)

      spawn(function()
        while task.wait() do
          pcall(function()
            if _G.Settings.Auto_Second_Sea and world1 then
              if tonumber(f5(players.LocalPlayer.PlayerGui["Interface Player"].FrameBars.HUD.LabelLevel.TextLabel.Text))
                > 4000 then
                players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                  -756.013306, 222.335785, 6112.77637, 0.193625316, -5.19363219e-9,
                  -0.981075525, 1.78500403e-9, 1, -4.94152586e-9, 0.981075525, -7.94419253e-10,
                  0.193625316
                )

                if workspace:FindFirstChild("Traveller Clover Kingdom") then
                  fireproximityprompt(workspace["Traveller Clover Kingdom"].CloverKingdomTP)
                end
              end
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
