local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local starterGui = game:GetService("StarterGui")
local v1 = game:GetService("Workspace")
local virtualInputManager = game:GetService("VirtualInputManager")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local coreGui = game:GetService("CoreGui")
loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/discord.lua"))()
wait(3)
args = { [1] = "RolePlayName", [2] = "「 😎 Sander XY Summer crack by TheRealBlox☀️ 」" }
replicatedStorage.RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
args = { [1] = "PickingRPNameColor", [2] = Color3.new(1, 1, 0) }
replicatedStorage.RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
args = { [1] = "RolePlayBio", [2] = "Hello, " .. game.Players.LocalPlayer.DisplayName }
replicatedStorage.RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
args = { [1] = "PickingRPBioColor", [2] = Color3.new(0, 0, 0) }
replicatedStorage.RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/SanderXYINTRO.lua"))()
wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/CloseDuplicateInfo.lua"))()

local f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20,
  f21, f22, f23, f24, callback, f25, f26, f27, f28, f29, f30, f31, f32, f33, f34, sanderXYUI,
  findFirstChild, v2, connect, v3, connect2, v4, v5, applyEmmiter, v6, v7, v8, applyEmmiter2,
  v9, localPlayer, runService2, v10, localPlayer2, v11, v12, v13, v14, v15, v16, localPlayer3,
  v17, v18, cframe, v19, f35, f36, v20, localPlayer4, v21, v22, v23, v24, cframe2, v25, v26,
  localPlayer5, v27, v28, f37, v29, f38, f39, v30, v31, v32, v33, localPlayer6, v34, icon, f40,
  v35, v36, v37, v38, v39, f41, remotes, v40, v41, v42, v43, v44, localPlayer7, v45, v46, v47,
  v48, v49, f42, v50, v51, listAddDropdown, v52, v53, v54, v55, f43, localPlayer8,
  currentCamera, v56, v57, v58, v59, connect3, v60, v61, v62, v63, currentCamera2, localPlayer9,
  v64, v65, v66, v67, v68, v69, v70, f44, v71, v72, localPlayer10, v73, f45, v74, localPlayer11,
  v75, f46, f47, f48, v76

if game.placeId == 4924922222 then
  sanderXYUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/SanderXYUI.lua"))()

  local window = sanderXYUI:MakeWindow({
    Name = "Title of the library",
    HidePremium = false,
    SaveConfig = true,
    IntroEnabled = false,
    ConfigFolder = "OrionTest",
  })

  Tab = window:MakeTab({
    Name = "「 Information 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddParagraph(
    "😎 Sander XY Normal ☀️", "Hi, I'm SanderDev and thank you for using my project."
  )

  Tab:AddParagraph(" Version! ", " ☀️ V2 Summer! ☀️")
  Tab:AddParagraph("Sander XY Update Changelog", "----------------------------")

  Tab:AddParagraph(
    "Added ",
    "+ Added Carnival Tab | + Added Balloon Aimbot | + Added Trails System | Trails for Local Player | Target Trails | Annoying Props | • Added Auto Hazard Lights | • Added Auto Head Lights | • Added Auto Suspension"
  )

  Tab:AddParagraph(
    "Information ",
    "Trails - Make props follow your character | Target Trails - Make props follow selected player | Annoying Props all - Props follow every player | WARNING: Do not use during Summer Carnival (only annoying props all)"
  )

  Tab:AddParagraph(
    "Teleports ",
    "+ Added House Teleport | Estate Teleport | Land Teleport | Motel Teleport | Apartment Teleport | Landmark Teleport"
  )

  Tab:AddParagraph(
    "Updated ",
    "+ Moved RP/Bio Name section to You tab | + Added Anti Sit | + Reworked Player List System | Auto updates | Better synchronization & performance"
  )

  Tab:AddParagraph(
    "Fixed ",
    "+ Fixed Loop Custom Body | + Fixed Bring Couch | + Fixed ESP | Player Skeleton | Player Name | Player Health | Red ESP | + Fixed Skin System | • Fixed Flip Vehicle | • Fixed Auto Wheel Texture"
  )

  Tab:AddParagraph(
    "Removed ",
    "- Removed Nazi Cat Logo | - Removed Aura from all items | - Removed Drawing Gun | - Removed outdated features"
  )

  Tab:AddParagraph(
    "Optimization ",
    "+ Added Script Loader Panel | + Updated loading screen design | + Optimized entire script for better performance"
  )

  Tab:AddButton({
    Name = "Roblox Account",
    Callback = function() setclipboard("https://www.roblox.com/pl/users/3016844381/profile") end,
  })

  Tab:AddButton({
    Name = "Roblox Group",
    Callback = function()
      setclipboard("https://www.roblox.com/pl/communities/35289663/Sander-X-Team#!/about")
    end,
  })

  Tab = window:MakeTab({
    Name = "「 Carnival 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Players = players
  RunService = runService
  player = Players.LocalPlayer
  camera = workspace.CurrentCamera
  enabled = true
  smooth = 0.7
  target = nil

  function getBalloons()
    b = {}
    f = workspace:FindFirstChild("SummerCarnival")

    if f then
      f = f:FindFirstChild("Map")
    end

    if f then
      f = f:FindFirstChild("Attractions")
    end

    if f then
      f = f:FindFirstChild("BalloonPop")
    end

    if f then
      f = f:FindFirstChild("Balloons")
    end

    if not f then
      return b
    end

    for key, value in pairs(f:GetChildren()) do
      p = value:IsA("Model")
          and (value:FindFirstChild("PrimaryPart") or value:FindFirstChild("HumanoidRootPart")
            or value:FindFirstChildOfClass("BasePart"))
        or value:IsA("BasePart") and value

      if p and p.Parent then
        table.insert(b, { model = value, part = p })
      end
    end

    return b
  end

  function getClosest()
    all = getBalloons()

    if #all == 0 then
      return nil
    end

    best = nil
    bestDist = math.huge
    pos = camera.CFrame.Position

    for key2, value2 in pairs(all) do
      if value2.part and value2.part.Parent then
        dist = (value2.part.Position - pos).Magnitude

        if dist < bestDist then
          bestDist = dist
          best = value2
        end
      end
    end

    return best
  end

  function alive()
    c = player.Character

    if not c then
      return false
    end

    h = c:FindFirstChild("Humanoid")
    return h and h.Health > 0
  end

  function getBalloonCount()
    all = getBalloons()
    return #all
  end

  function switchTarget()
    target = getClosest()
  end

  function isAimbotActive()
    return enabled
  end

  RunService.RenderStepped:Connect(function()
    if not enabled or not alive() then
      return
    end

    if target and (not target.part or not target.part.Parent) then
      target = getClosest()
    end

    if not target then
      target = getClosest()
    end

    if target and target.part and target.part.Parent then
      camera.CFrame = camera.CFrame:Lerp(
        CFrame.new(camera.CFrame.Position, target.part.Position), smooth
      )
    end
  end)

  Tab:AddToggle({
    Name = "「 Balloon Aimbot 」",
    Default = nil,
    Callback = function(value3)
      enabled = value3

      if not value3 then
        target = nil
      end
    end,
  })

  Tab = window:MakeTab({
    Name = "「 You 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 RP/BIO Name 」" })

  Tab:AddDropdown({
    Name = "Custom Name:",
    Default = "",
    Options = {
      "HACKER", "SANDER XY THE BEST", "DARK WEB", "2026", "1x1x1x1", "OWNER",
      "BYE SANDER X FOREVER!",
    },
    Callback = function(value4)
      local findFirstChild2 = replicatedStorage:FindFirstChild("RE"):FindFirstChild("1RPNam1eTex1t")

      if not findFirstChild2 then
        return
      else
        local v77 = {
          HACKER = "҉H҉҉A҉҉C҉҉K҉҉E҉҉R҉",
          ["SANDER XY THE BEST"] = "҉S҉҉A҉҉N҉҉D҉҉E҉҉R҉ ҉X҉ ҉T҉҉H҉҉E҉ ҉B҉҉E҉҉S҉҉T҉",
          ["DARK WEB"] = "҉D҉҉A҉҉R҉҉K҉ ҉W҉҉E҉҉B҉",
          ["2026"] = "҉2҉҉0҉҉2҉҉6҉",
          ["1x1x1x1"] = "҉1҉҉x҉҉1҉҉x҉҉1҉҉x҉҉1҉",
          OWNER = "҉O҉҉W҉҉N҉҉E҉҉R҉",
          ["BYE SANDER X FOREVER!"] = "҉B҉҉Y҉҉E҉ ҉S҉҉A҉҉N҉҉D҉҉E҉҉R҉ ҉X҉ ҉F҉҉O҉҉R҉҉E҉҉V҉҉E҉҉R҉҉!҉",
        }

        if v77[value4] then
          args = { [1] = "RolePlayName", [2] = v77[value4] }
          findFirstChild2:FireServer(unpack(args))
        end

        return
      end
    end,
  })

  Tab:AddTextbox({
    Name = "RolePlay Name:",
    Default = "Here Write",
    TextDisappear = true,
    Callback = function(value5)
      args = { [1] = "RolePlayName", [2] = value5 }
      local findFirstChild3 = replicatedStorage.RE:FindFirstChild("1RPNam1eTex1t")

      if findFirstChild3 then
        findFirstChild3:FireServer(unpack(args))
        print(". " .. value5)
      end
    end,
  })

  Tab:AddTextbox({
    Name = "RolePlay Bio:",
    Default = "Here  Write",
    TextDisappear = true,
    Callback = function(value6)
      args = { [1] = "RolePlayBio", [2] = value6 }
      local findFirstChild4 = replicatedStorage.RE:FindFirstChild("1RPNam1eTex1t")

      if findFirstChild4 then
        findFirstChild4:FireServer(unpack(args))
        print(". " .. value6)
      end
    end,
  })

  findFirstChild = replicatedStorage.RE:FindFirstChild("1RPNam1eColo1r")
  v2 = false
  connect = nil
  v3 = false
  connect2 = nil

  Tab:AddToggle({
    Name = "RGB Name",
    Default = false,
    Callback = function(value7)
      v2 = value7
      local v78

      if v2 and not connect then
        v78 = 0

        connect = runService.Heartbeat:Connect(function(delta)
          if not v2 then
            return
          end

          v78 = (v78 + delta * 0.15) % 1
          findFirstChild:FireServer("PickingRPNameColor", Color3.fromHSV(v78, 1, 1))
        end)
      elseif not v2 and connect then
        connect:Disconnect()
        connect = nil
      end
    end,
  })

  Tab:AddToggle({
    Name = "RGB Bio",
    Default = false,
    Callback = function(value8)
      v3 = value8
      local v79

      if v3 and not connect2 then
        v79 = 0

        connect2 = runService.Heartbeat:Connect(function(delta2)
          if not v3 then
            return
          end

          v79 = (v79 + delta2 * 0.15) % 1
          findFirstChild:FireServer("PickingRPBioColor", Color3.fromHSV(v79, 1, 1))
        end)
      elseif not v3 and connect2 then
        connect2:Disconnect()
        connect2 = nil
      end
    end,
  })

  Tab:AddSection({ Name = "「 Body Function 」" })

  rainbowEnabled = false

  rainbowColors = {
    "Bright red", "Bright orange", "Bright yellow", "Bright green", "Bright blue",
    "Bright violet",
  }

  function changeColor(p1)
    replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(p1)
  end

  task.spawn(function()
    while true do
      if rainbowEnabled then
        for index, value9 in ipairs(rainbowColors) do
          if not rainbowEnabled then
            break
          end

          changeColor(value9)
          task.wait(0.3)
        end
      end

      task.wait(0.3)
    end
  end)

  Tab:AddToggle({
    Name = "「 Loop Rainbow Skin 」",
    Default = false,
    Callback = function(value10) rainbowEnabled = value10 end,
  })

  v4 = false
  LoopConnection = nil
  v5 = false

  Tab:AddToggle({
    Name = "「 Loop Custom Body 」",
    Default = false,
    Callback = function(value11)
      v4 = value11

      if value11 then
        v5 = false

        if LoopConnection then
          LoopConnection = nil
        end

        LoopConnection = task.spawn(function()
          while v4 and not v5 do
            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86500008,
                [2] = 86500036,
                [3] = 86500054,
                [4] = 0,
                [5] = 0,
                [6] = 86498048,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 27112025,
                [2] = 27112039,
                [3] = 27112052,
                [4] = 27112068,
                [5] = 27112056,
                [6] = 0,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 4637244207,
                [2] = 4637242874,
                [3] = 4637116155,
                [4] = 4637243648,
                [5] = 4637242166,
                [6] = 4637245706,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 0,
                [2] = 0,
                [3] = 0,
                [4] = 0,
                [5] = 0,
                [6] = 0,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 376532000,
                [2] = 376531012,
                [3] = 376530220,
                [4] = 376531703,
                [5] = 376531300,
                [6] = 0,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86500008,
                [2] = 86500036,
                [3] = 86500054,
                [4] = 86500078,
                [5] = 86500064,
                [6] = 86498048,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 0,
                [2] = 0,
                [3] = 0,
                [4] = 0,
                [5] = 0,
                [6] = 0,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86500008,
                [2] = 86500036,
                [3] = 86500054,
                [4] = 86500078,
                [5] = 86500064,
                [6] = 86498048,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86499666,
                [2] = 86499698,
                [3] = 86499716,
                [4] = 376547092,
                [5] = 376546668,
                [6] = 86498113,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86499666,
                [2] = 86499698,
                [3] = 86499716,
                [4] = 86499793,
                [5] = 86499753,
                [6] = 86498113,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86499666,
                [2] = 86499698,
                [3] = 86499716,
                [4] = 4637243648,
                [5] = 4637242166,
                [6] = 86498113,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86499666,
                [2] = 86499698,
                [3] = 86499716,
                [4] = 4637122096,
                [5] = 4637120072,
                [6] = 86498113,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 86499666,
                [2] = 86499698,
                [3] = 86499716,
                [4] = 86500078,
                [5] = 86500064,
                [6] = 86498113,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 4637151279,
                [2] = 4637120775,
                [3] = 4637119437,
                [4] = 4637122096,
                [5] = 4637120072,
                [6] = 86498113,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 376547767,
                [2] = 376547341,
                [3] = 376547633,
                [4] = 376547092,
                [5] = 376546668,
                [6] = 86498113,
              },
            }))

            replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack({
              [1] = {
                [1] = 48474356,
                [2] = 1,
                [3] = 0,
                [4] = 0,
                [5] = 0,
                [6] = 0,
              },
            }))

            task.wait(0.5)
          end
        end)
      else
        v5 = true

        if LoopConnection then
          LoopConnection = nil
        end

        replicatedStorage:WaitForChild("Remotes"):WaitForChild("ResetCharacterAppearance"):FireServer()
      end
    end,
  })

  Tab:AddSection({ Name = "「 Fire Effects (NO GAMEPASS!) 」" })

  applyEmmiter = replicatedStorage.Remotes.ApplyEmmiter
  v6 = { "Fire White", "Fire Orange", "Fire Green", "Fire Blue", "Fire Purple", "Fire Black" }

  v7 = {
    ["Fire White"] = { "1", "030FireWhite" },
    ["Fire Orange"] = { "2", "031FireOrange" },
    ["Fire Green"] = { "3", "032FireGreen" },
    ["Fire Blue"] = { "4", "033FireBlue" },
    ["Fire Purple"] = { "5", "034FirePurple" },
    ["Fire Black"] = { "6", "035FireBlack" },
  }

  v8 = false

  Tab:AddToggle({
    Name = "「 Loop Fire Effects 」",
    Default = false,
    Callback = function(value12)
      v8 = value12

      if value12 then
        spawn(function()
          local v80 = 1

          while v8 do
            local v81 = v7[v6[v80]]

            if v81 then
              local v82, v83 = unpack(v81)
              applyEmmiter:InvokeServer(v82, v83)
            end

            v80 = v80 + 1

            if v80 > #v6 then
              v80 = 1
            end

            wait(0.2)
          end
        end)
      end
    end,
  })

  applyEmmiter2 = replicatedStorage.Remotes.ApplyEmmiter

  v9 = {
    ["Fire White"] = { "1", "030FireWhite" },
    ["Fire Orange"] = { "2", "031FireOrange" },
    ["Fire Green"] = { "3", "032FireGreen" },
    ["Fire Blue"] = { "4", "033FireBlue" },
    ["Fire Purple"] = { "5", "034FirePurple" },
    ["Fire Black"] = { "6", "035FireBlack" },
  }

  Tab:AddDropdown({
    Name = "「 Select Fire Effect 」",
    Default = nil,
    Options = {
      "Fire White", "Fire Orange", "Fire Green", "Fire Blue", "Fire Purple", "Fire Black",
    },
    Callback = function(value13)
      local v84 = v9[value13]

      if v84 then
        local v85, v86 = unpack(v84)
        applyEmmiter2:InvokeServer(v85, v86)
      end
    end,
  })

  Tab:AddSection({ Name = "「 Functions of need 」" })

  localPlayer = game.Players.LocalPlayer
  local v87 = game

  function f1(p2)
    if p2 and typeof(p2) == "RBXScriptConnection" then
      p2:Disconnect()
    end
  end

  runService2 = v87:GetService("RunService")
  v10 = {}

  Tab:AddToggle({
    Name = "「 Anti Sit 」",
    Default = false,
    Callback = function(value14)
      local function f49(p3)
        if not p3 then
          return
        else
          pcall(function() p3:SetStateEnabled(Enum.HumanoidStateType.Seated, false) end)

          local connect4 = p3.StateChanged:Connect(function(p4, p5)
            if p5 == Enum.HumanoidStateType.Seated then
              p3:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
          end)

          if connect4 then
            table.insert(v10, connect4)
          end

          return
        end
      end

      local function f50()
        local function f51(p6)
          local waitForChild = p6:WaitForChild("Humanoid", 5)

          if waitForChild then
            f49(waitForChild)
          end
        end

        local connect5 = localPlayer.CharacterAdded:Connect(f51)

        if connect5 then
          table.insert(v10, connect5)
        end

        if localPlayer.Character then
          f51(localPlayer.Character)
        end
      end

      local function f52()
        for index2, value15 in ipairs(v10) do
          f1(value15)
        end

        table.clear(v10)

        local humanoid = localPlayer.Character
          and localPlayer.Character:FindFirstChildOfClass("Humanoid")

        if humanoid then
          pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end)
        end
      end

      if value14 then
        f50()

        local connect6 = runService2.Heartbeat:Connect(function()
          local humanoid2 = localPlayer.Character
            and localPlayer.Character:FindFirstChildOfClass("Humanoid")

          if humanoid2 then
            pcall(function() humanoid2:SetStateEnabled(Enum.HumanoidStateType.Seated, false) end)
          end
        end)

        if connect6 then
          table.insert(v10, connect6)
        end
      else
        f52()
      end
    end,
  })

  Tab:AddButton({
    Name = "Free Cam By Wojtes_BMW",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/FreeCamBySanderDev.lua"))()
    end,
  })

  Tab:AddSection({ Name = "「 Radioactive 」" })

  Tab:AddButton({
    Name = "Radioactive Avatar",
    Callback = function()
      local localPlayer12 = players.LocalPlayer
      local humanoidRootPart

      if not localPlayer12 then
        return
      else
        local findFirstChild5 = workspace:FindFirstChild("001_Lots")

        if not findFirstChild5 then
          return
        end

        humanoidRootPart = localPlayer12.Character
          and localPlayer12.Character:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart then
          return
        else
          local function f53(title, text, p7)
            task.wait(0.5)

            pcall(function()
              starterGui:SetCore("SendNotification", {
                Title = title,
                Text = text,
                Duration = 3,
                Icon = p7 or "",
              })
            end)
          end

          local function f54(p8)
            local housePickedByPlayer = p8:FindFirstChild("HousePickedByPlayer") or p8

            local components = (housePickedByPlayer:FindFirstChild("HouseModel")
              or housePickedByPlayer):FindFirstChild("Components")

            if not components then
              return false
            else
              local water = components:FindFirstChild("Water")

              if not water then
                return false
              end

              if (water:FindFirstChildWhichIsA("TouchTransmitter")
                  or water:FindFirstChildWhichIsA("TouchInterest"))
                and typeof(firetouchinterest) == "function" then
                firetouchinterest(humanoidRootPart, water, 0)
                task.wait(0.1)
                firetouchinterest(humanoidRootPart, water, 1)
              else
                local cframe3 = humanoidRootPart.CFrame
                humanoidRootPart.CFrame = water.CFrame + Vector3.new(0, 5, 0)
                task.wait(0.15)
                humanoidRootPart.CFrame = cframe3
              end

              return true
            end
          end

          for index3, value16 in ipairs(findFirstChild5:GetChildren()) do
            if value16.Name:lower():find("house") then
              if f54(value16) then
                f53(
                  "XY Team", "Your Character Started Radioactived!",
                  "rbxassetid://130069738634749"
                )

                return
              end
            end
          end

          for index4, value17 in ipairs(findFirstChild5:GetChildren()) do
            if not value17.Name:lower():find("house") then
              if f54(value17) then
                f53(
                  "XY Team", "Your Character Started Radioactived!",
                  "rbxassetid://130069738634749"
                )

                return
              end
            end
          end

          return
        end
      end
    end,
  })

  localPlayer2 = players.LocalPlayer

  if not localPlayer2 then
    return
  end

  v11 = false
  v12 = false

  Tab:AddToggle({
    Name = "「 Loop Radioactive Avatar 」",
    Default = false,
    Callback = function(value18)
      if not v12 then
        v12 = true
        v11 = value18
        return
      end

      v11 = value18

      if value18 then
        starterGui:SetCore("SendNotification", {
          Title = "XY Team",
          Text = "You have enabled the Loop Radioactive Avatar.",
          Duration = 3,
          Icon = "rbxassetid://130069738634749",
        })

        task.spawn(function()
          local function f55(p9, p10)
            local housePickedByPlayer2 = p9:FindFirstChild("HousePickedByPlayer") or p9

            local components2 = (housePickedByPlayer2:FindFirstChild("HouseModel")
              or housePickedByPlayer2):FindFirstChild("Components")

            if not components2 then
              return false
            else
              local water2 = components2:FindFirstChild("Water")

              if not water2 then
                return false
              end

              if (water2:FindFirstChildWhichIsA("TouchTransmitter")
                  or water2:FindFirstChildWhichIsA("TouchInterest"))
                and typeof(firetouchinterest) == "function" then
                firetouchinterest(p10, water2, 0)
                task.wait(0.1)
                firetouchinterest(p10, water2, 1)
              else
                local cframe4 = p10.CFrame
                p10.CFrame = water2.CFrame + Vector3.new(0, 5, 0)
                task.wait(0.15)
                p10.CFrame = cframe4
              end

              return true
            end
          end

          while v11 do
            local findFirstChild6 = workspace:FindFirstChild("001_Lots")

            local humanoidRootPart2 = localPlayer2.Character
              and localPlayer2.Character:FindFirstChild("HumanoidRootPart")

            if findFirstChild6 and humanoidRootPart2 then
              local v88 = false

              for index5, value19 in ipairs(findFirstChild6:GetChildren()) do
                if value19.Name:lower():find("house") and f55(value19, humanoidRootPart2) then
                  v88 = true
                  break
                end
              end

              if not v88 then
                for index6, value20 in ipairs(findFirstChild6:GetChildren()) do
                  if not value20.Name:lower():find("house") and f55(value20, humanoidRootPart2) then
                    break
                  end
                end
              end
            end

            task.wait(30)
          end
        end)
      else
        starterGui:SetCore("SendNotification", {
          Title = "XY Team",
          Text = "You have disabled the Loop Radioactive Avatar.",
          Duration = 3,
          Icon = "rbxassetid://130069738634749",
        })
      end
    end,
  })

  Tab:AddSection({ Name = "「 Smoke 」" })

  v13 = players
  local localPlayer13 = v13.LocalPlayer

  Tab:AddButton({
    Name = "Smoke Avatar",
    Callback = function()
      local localPlayer14 = players.LocalPlayer
      local humanoidRootPart3 = (localPlayer14.Character or localPlayer14.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

      local catchFire = workspace:FindFirstChild("Mall")
        and workspace.Mall:FindFirstChild("Pizza")
        and workspace.Mall.Pizza:FindFirstChild("PizzaOven")
        and workspace.Mall.Pizza.PizzaOven:FindFirstChild("CatchFire")

      if not catchFire then
        return
      end

      firetouchinterest(humanoidRootPart3, catchFire, 0)
      task.wait(0.1)
      firetouchinterest(humanoidRootPart3, catchFire, 1)

      starterGui:SetCore("SendNotification", {
        Title = "XY Team",
        Text = "Your Character Started Smoking!",
        Duration = 3,
        Icon = "rbxassetid://130069738634749",
      })
    end,
  })

  local localPlayer15 = game.Players.LocalPlayer
  v14 = false
  v15 = false

  Tab:AddToggle({
    Name = "「 Loop Smoke Avatar 」",
    Default = false,
    Callback = function(value21)
      if not v15 then
        v15 = true
        return
      end

      v14 = value21

      if value21 then
        starterGui:SetCore("SendNotification", {
          Title = "XY Team",
          Text = "You have enabled the Loop Smoke Avatar.",
          Duration = 3,
          Icon = "rbxassetid://130069738634749",
        })

        task.spawn(function()
          while v14 do
            local localPlayer16 = players.LocalPlayer

            local humanoidRootPart4 = (localPlayer16.Character
              or localPlayer16.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

            local catchFire2 = workspace:FindFirstChild("Mall")
              and workspace.Mall:FindFirstChild("Pizza")
              and workspace.Mall.Pizza:FindFirstChild("PizzaOven")
              and workspace.Mall.Pizza.PizzaOven:FindFirstChild("CatchFire")

            if catchFire2 then
              firetouchinterest(humanoidRootPart4, catchFire2, 0)
              task.wait(0.1)
              firetouchinterest(humanoidRootPart4, catchFire2, 1)
            end

            task.wait(1)
          end
        end)
      else
        starterGui:SetCore("SendNotification", {
          Title = "XY Team",
          Text = "You have disabled the Loop Smoke Avatar.",
          Duration = 3,
          Icon = "rbxassetid://130069738634749",
        })
      end
    end,
  })

  Tab = window:MakeTab({
    Name = "「 Fun 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 Help 」" })

  Tab:AddButton({
    Name = "Equip ALL",
    Callback = function()
      v13 = players
      LocalPlayer = v13.LocalPlayer

      function equipAllTools()
        backpack = LocalPlayer.Backpack
        character = LocalPlayer.Character

        for key3, value22 in pairs(backpack:GetChildren()) do
          if value22:IsA("Tool") then
            value22.Parent = character
          end
        end
      end

      equipAllTools()
    end,
  })

  Tab:AddButton({
    Name = "Restart Items",
    Callback = function()
      local localPlayer17 = game.Players.LocalPlayer
      local v89 = localPlayer17.Character or localPlayer17.CharacterAdded:Wait()
      v89:WaitForChild("Humanoid").Health = 0
    end,
  })

  Tab:AddSection({ Name = "「 Secret items 」" })

  Tab:AddButton({
    Name = "Get Chainsaw",
    Callback = function()
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Playe1rTrigge1rEven1t"):FireServer(unpack({
        "ToolGiveToServer", players.LocalPlayer, "Chainsaw",
      }))
    end,
  })

  Tab:AddButton({
    Name = "Get MoneyGun",
    Callback = function()
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Playe1rTrigge1rEven1t"):FireServer(unpack({
        "ToolGiveToServer", players.LocalPlayer, "MoneyGun",
      }))
    end,
  })

  Tab:AddButton({
    Name = "Get Cannon",
    Callback = function()
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Playe1rTrigge1rEven1t"):FireServer(unpack({
        "ToolGiveToServer", players.LocalPlayer, "Cannon",
      }))
    end,
  })

  Tab:AddButton({
    Name = "Get Nuclear Barrel",
    Callback = function()
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Playe1rTrigge1rEven1t"):FireServer(unpack({
        "ToolGiveToServer", players.LocalPlayer, "NuclearBarrel",
      }))
    end,
  })

  Tab:AddButton({
    Name = "Get Crystals",
    Callback = function()
      args = { "PickingTools", "Crystals" }
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
    end,
  })

  Tab:AddButton({
    Name = "Get Snow Cannon",
    Callback = function()
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Playe1rTrigge1rEven1t"):FireServer(unpack({
        "ToolGiveToServer", players.LocalPlayer, "SnowballCannon",
      }))
    end,
  })

  Tab:AddSection({ Name = "「 For Buildings 」" })

  v16 = false

  Tab:AddToggle({
    Name = "「 Spin 」",
    Default = false,
    Callback = function(value23) v16 = value23 end,
  })

  runService.RenderStepped:Connect(function()
    if v16 then
      local localPlayer18 = game.Players.LocalPlayer
      local humanoidRootPart5 = (localPlayer18.Character or localPlayer18.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")

      if humanoidRootPart5 then
        humanoidRootPart5.CFrame = humanoidRootPart5.CFrame * CFrame.Angles(0, math.rad(35), 0)
      end
    end
  end)

  Tab:AddSection({ Name = "「 Drop Function 」" })

  Tab:AddButton({
    Name = "Get All Items (U NEED THIS)",
    Callback = function()
      args = { [1] = "ClearAllTools" }
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
      local localPlayer19 = players.LocalPlayer
      local v90 = localPlayer19.Character or localPlayer19.CharacterAdded:Wait()
      local currentCamera3 = workspace.CurrentCamera

      local v91 = {
        "Bloxaide", "Coke", "BottledWater", "Milk", "Mocha", "ShakeChocolate", "FrapStrawberry",
        "FrapMint", "Icecream", "Hershey", "Reeses", "CottonCandyPurple", "CakePink", "Donut",
        "CookieChip", "YummyBread", "MuffinBlueBerry", "Pizza", "Pretzel", "Waffle", "Guda",
        "Burrito", "HotDog", "Chips", "Popcorn", "Sandwich", "Taco", "Hamburger", "AppleGreen",
        "BreakfestPlate1", "BurgerTray", "DinnerPlate3", "DinnerPlate1", "Banana", "Apple",
        "DinnerPlate2", "LunchPlate1", "PrisonTray", "TakeOutPizza", "TakeOutHappyBurger",
        "TakeOut", "Weights", "Mop", "Basketball", "LaundryBasket", "Box", "Shovel", "Bucket",
        "WateringCan", "Cones", "StopSign", "FireX", "Wrench", "Axe", "Hammer", "Guitar",
        "Roses", "Present", "Camcorder", "ElectricGuitar", "Microphone", "Balloon",
        "FishingRod", "Umbrella", "Marshmello", "HandRadio", "Binocks", "FlashLight",
        "GhostMeter", "CreditCardGirl", "DuffleBagMoney", "Money", "CreditCardBoy", "DuffleBag",
        "Bomb", "Bow", "SwordWood", "Sniper", "Assault", "Glock", "GlockBrown", "Shotgun",
        "Cuffs", "Taser", "PlaneTicket", "Hairbrush", "Toothbrush", "Trophy", "SWATShield",
        "Ear", "Medicine", "BabyMonkey", "BabyBottle", "BabyHippo", "BabyGirl", "BabyBoy",
        "Licence", "Paper", "ClipBoard", "Ticket", "Envelope", "Book", "Sign", "Paperbag",
        "Laptop", "Ipad", "Iphone", "SprayCan", "PaintRoller", "BrushAndPalette", "SketchBook",
        "BoxOfChocolates", "Cupcake", "DessertTray", "ChineseTray", "SubwayTray", "Boombox",
        "DSLR Camera", "Megaphone", "ClapperBoard", "Lipstick", "PowderCompactBrush",
        "Sparkler", "AnimalCatBlack", "AnimalCatBrown", "AnimalCatCarrier", "AnimalCatGrey",
        "AnimalCatTan", "AnimalCatWhite", "AnimalDogBlack", "AnimalDogBrown", "AnimalDogGrey",
        "AnimalDogTan", "AnimalDogWhite", "AnimalKittenBlack", "AnimalKittenBrown",
        "AnimalKittenCarrier", "AnimalKittenGrey", "AnimalKittenTan", "AnimalKittenWhite",
        "AnimalPuppyBlack", "AnimalPuppyBrown", "AnimalPuppyCarrier", "AnimalPuppyGrey",
        "AnimalPuppyTan", "AnimalPuppyWhite",
      }

      local findFirstChild7 = replicatedStorage:WaitForChild("RE"):FindFirstChild("1Too1l")

      if not findFirstChild7 then
        return
      else
        local function f56(p11)
          local function f57(p12)
            for index7, value24 in ipairs(p12:GetChildren()) do
              if value24:IsA("Tool") and value24.Name == p11 then
                return true
              end
            end

            return false
          end

          return f57(localPlayer19.Backpack) or v90 and f57(v90)
            or f57(localPlayer19:FindFirstChildOfClass("StarterGear") or Instance.new("Folder"))
        end

        local v92 = {}

        for index8, value25 in ipairs(v91) do
          if not f56(value25) then
            table.insert(v92, value25)
          end
        end

        if #v92 == 0 then
          starterGui:SetCore("SendNotification", {
            Title = "XY Team",
            Text = "You already have all the items",
            Duration = 3,
            Icon = "rbxassetid://130069738634749",
          })

          return
        else
          v90:WaitForChild("HumanoidRootPart").Anchored = true
          local cameraType = currentCamera3.CameraType
          local cameraSubject = currentCamera3.CameraSubject

          currentCamera3.CameraType = Enum.CameraType.Scriptable

          currentCamera3.CFrame = CFrame.new(
            -28.4476147, -114.799881, 40.9905739, 0.774168968, 0.24523823, -0.583541453,
            -1.9316543e-8, 0.921896994, 0.387434989, 0.632979035, -0.299940139, 0.71370405
          )

          for index9, value26 in ipairs(v92) do
            findFirstChild7:InvokeServer("PickingTools", value26)
          end

          starterGui:SetCore("SendNotification", {
            Title = "XY Team",
            Text = "You got missing items!",
            Duration = 3,
            Icon = "rbxassetid://130069738634749",
          })

          currentCamera3.CameraType = cameraType
          currentCamera3.CameraSubject = cameraSubject

          wait(1)
          local screenGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ScreenGui")

          if screenGui then
            screenGui:Destroy()
          end

          v90.HumanoidRootPart.Anchored = false
          return
        end
      end
    end,
  })

  Tab:AddButton({
    Name = "Drop All Items",
    Callback = function()
      local localPlayer20 = game.Players.LocalPlayer

      local function f58()
        local v93 = localPlayer20.Character
        local v94 = localPlayer20:FindFirstChild("Backpack")

        if v93 and v94 then
          for index10, value27 in ipairs(v93:GetChildren()) do
            if value27:IsA("Tool") then
              value27.Parent = v94
            end
          end
        end
      end

      f58()

      local getChildren = game.Players.LocalPlayer.Backpack:GetChildren()

      for i = 1, #getChildren do
        local v95 = getChildren[i]

        if v95:IsA("Tool") then
          v95.Parent = game.Players.LocalPlayer.Character
        end
      end

      wait(0)
      local localPlayer21 = game.Players.LocalPlayer

      local function f59()
        local v96 = localPlayer21.Character
        local v97 = localPlayer21:FindFirstChild("Backpack")

        if v96 and v97 then
          for index11, value28 in ipairs(v96:GetChildren()) do
            if value28:IsA("Tool") then
              value28.Parent = v97
            end
          end
        end
      end

      f59()

      wait(0)
      local localPlayer22 = game.Players.LocalPlayer

      for key4, value29 in pairs({
        localPlayer22.Backpack, localPlayer22.Character or localPlayer22.CharacterAdded:Wait(),
      }) do
        for key5, value30 in pairs(value29:GetChildren()) do
          if value30:IsA("Tool") then
            for key6, handle1 in pairs(value30:GetDescendants()) do
              if handle1:IsA("BasePart") then
                handle1.CanCollide = true

                if handle1.Name == "Handle" then
                  handle1.Name = "Handle1"
                end
              end
            end
          end
        end
      end

      wait(0)
      local getChildren2 = game.Players.LocalPlayer.Backpack:GetChildren()

      for j = 1, #getChildren2 do
        local v98 = getChildren2[j]

        if v98:IsA("Tool") then
          v98.Parent = game.Players.LocalPlayer.Character
        end

        wait(0)
      end

      wait(4)
      local localPlayer23 = game.Players.LocalPlayer

      local function f60()
        local v99 = localPlayer23.Character
        local v100 = localPlayer23:FindFirstChild("Backpack")

        if v99 and v100 then
          for index12, value31 in ipairs(v99:GetChildren()) do
            if value31:IsA("Tool") then
              value31.Parent = v100
            end
          end
        end
      end

      f60()

      local localPlayer24 = game.Players.LocalPlayer

      for key7, value32 in pairs({
        localPlayer24.Backpack, localPlayer24.Character or localPlayer24.CharacterAdded:Wait(),
      }) do
        for key8, value33 in pairs(value32:GetChildren()) do
          if value33:IsA("Tool") then
            for key9, handle in pairs(value33:GetDescendants()) do
              if handle:IsA("BasePart") then
                handle.CanCollide = true

                if handle.Name == "Handle1" then
                  handle.Name = "Handle"
                end
              end
            end
          end
        end
      end
    end,
  })

  Tab:AddSection({ Name = "「 Trails 」" })

  localPlayer3 = players.LocalPlayer
  v17 = false
  v18 = "Skibidi"
  cframe = CFrame.new(1201.5882568359, 50, 1227.5556640625)

  v19 = {
    ["Trailing Blocks"] = { PropType = "QuarterFloor", PropCategory = "Building" },
    ["Trailing Bunkers"] = { PropType = "BigGunBunker", PropCategory = "Building" },
    ["Trailing Fire"] = { PropType = "TorchFireLong", PropCategory = "Torch" },
    ["Trailing Blue Lights"] = { PropType = "DanceMachineCouple", PropCategory = "Lights" },
    ["Trailing Dance Machine"] = { PropType = "DanceMachineCouple", PropCategory = "Screens" },
    ["Trailing Snowman"] = { PropType = "ChristmasSnowman", PropCategory = "Christmas" },
    ["Trailing Trampoline"] = { PropType = "Summer2026Trampoline", PropCategory = "Carnival" },
    ["Trailing Horses"] = { PropType = "HorseBigBrown", PropCategory = "Horse" },
    ["Trailing Slip And Slide"] = {
      PropType = "Summer2026SlipAndSlide",
      PropCategory = "Carnival",
    },
    ["Trailing Dogs"] = { PropType = "AnimalDogStand", PropCategory = "Animals" },
  }

  Tab:AddDropdown({
    Name = "「 Select Trailing Prop 」",
    Default = nil,
    Options = {
      "Trailing Blocks", "Trailing Bunkers", "Trailing Fire", "Trailing Blue Lights",
      "Trailing Dance Machine", "Trailing Snowman", "Trailing Trampoline", "Trailing Horses",
      "Trailing Slip And Slide", "Trailing Dogs",
    },
    Callback = function(value34) v18 = value34 end,
  })

  function f11()
    local v101 = localPlayer3.Character
    local v102 = localPlayer3.Backpack

    if v101 then
      if v101:FindFirstChild("PropMaker") then
        return true
      end
    end

    if v102 then
      if v102:FindFirstChild("PropMaker") then
        return true
      end

      return false
    end

    return false
  end

  function f3()
    local v103 = localPlayer3.Character
    local v104 = localPlayer3.Backpack

    if v103 then
      local propMaker = v103:FindFirstChild("PropMaker")

      if propMaker then
        return propMaker
      end
    end

    if v104 then
      local propMaker2 = v104:FindFirstChild("PropMaker")

      if propMaker2 then
        return propMaker2
      end

      return nil
    end

    return nil
  end

  function f35()
    local v105 = localPlayer3.Character or localPlayer3.CharacterAdded:Wait()
    local humanoid3 = v105:WaitForChild("Humanoid")
    local cframe5 = v105.HumanoidRootPart.CFrame
    local v106 = v19[v18]

    if not v106 then
      return
    else
      humanoid3.WalkSpeed = 0
      humanoid3.JumpPower = 0

      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllProps")
      task.wait(1)

      if not f11() then
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(
          "PickingTools", "PropMaker"
        )

        task.wait(0.5)
      end

      local v107 = f3()

      if v107 then
        humanoid3:EquipTool(v107)
      end

      task.wait(0.5)

      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(
        "RequestingPropName", v106.PropType, v106.PropCategory
      )

      v105.HumanoidRootPart.CFrame = cframe
      task.wait(0.5)

      for k = 1, 15 do
        if not v17 then
          break
        else
          local propMaker3 = v105:FindFirstChild("PropMaker")

          if propMaker3 then
            local toolPropMake = propMaker3:FindFirstChild("Tool_PropMake")

            if toolPropMake then
              toolPropMake:FireServer(workspace:FindFirstChild("Model")
                and workspace.Model:FindFirstChild("CornerHills"), cframe.Position)
            end
          end

          task.wait(0.9)
        end
      end

      v105.HumanoidRootPart.CFrame = cframe5

      humanoid3.WalkSpeed = 16
      humanoid3.JumpPower = 50

      return
    end
  end

  function f36()
    local humanoidRootPart6 = (localPlayer3.Character or localPlayer3.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

    local findFirstChild8 = workspace:FindFirstChild("WorkspaceCom")
      and workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")

    local v108 = "Prop" .. localPlayer3.Name

    if not findFirstChild8 then
      return
    end

    while v17 do
      for index13, value35 in ipairs(findFirstChild8:GetChildren()) do
        if value35.Name == v108 then
          local setCurrentCFrame = value35:FindFirstChild("SetCurrentCFrame")

          if setCurrentCFrame then
            setCurrentCFrame:InvokeServer(humanoidRootPart6.CFrame)
          end
        end
      end

      task.wait(0.1)
    end
  end

  Tab:AddToggle({
    Name = "「 Start 」",
    Default = false,
    Callback = function(value36)
      v17 = value36

      if value36 then
        task.spawn(function()
          f35()

          if v17 then
            f36()
          end
        end)
      else
        pcall(function()
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllProps")
        end)

        local v109 = localPlayer3.Character

        if v109 then
          local humanoid4 = v109:FindFirstChild("Humanoid")

          if humanoid4 then
            humanoid4.WalkSpeed = 16
            humanoid4.JumpPower = 50
          end
        end
      end
    end,
  })

  Tab:AddSection({ Name = "「 Trails for target 」" })

  Tab:AddParagraph(
    "WARNING!",
    "it works, but I don't recommend using it during the summer carnival update cuz  if random a player is on this  carnival place its  blockin props."
  )

  getgenv().SharedPlayersList = {}
  getgenv().SharedChasingPlayer = nil

  v20 = {}
  localPlayer4 = players.LocalPlayer
  v21 = replicatedStorage

  function f4()
    local v110 = {}

    for index14, value37 in ipairs(players:GetPlayers()) do
      if value37 ~= localPlayer4 then
        table.insert(v110, value37.Name)
      end
    end

    getgenv().SharedPlayersList = v110

    for index15, value38 in ipairs(v20) do
      local v111 = value38

      if v111.object and v111.object.Refresh then
        pcall(function() v111.object:Refresh(getgenv().SharedPlayersList, true) end)
      end
    end

    if getgenv().SharedChasingPlayer
      and not players:FindFirstChild(getgenv().SharedChasingPlayer) then
      getgenv().SharedChasingPlayer = nil

      for index16, value39 in ipairs(v20) do
        local v112 = value39

        if v112.object and v112.object.Set then
          pcall(function() local object = v112.object end)
        end
      end
    end
  end

  function RegisterDropdown(object2)
    table.insert(v20, { object = object2 })
  end

  runService.Heartbeat:Connect(function()
    if tick() % 10 < 0.1 then
      f4()
    end
  end)

  players.PlayerAdded:Connect(f4)
  players.PlayerRemoving:Connect(f4)

  f4()
  v22 = false
  v23 = "Trailing Blocks"
  v24 = localPlayer4
  cframe2 = CFrame.new(1201.5882568359, 50, 1227.5556640625)

  v25 = {
    ["Trailing Blocks"] = { dfghjk = "QuarterFloor", qazwsx = "Building" },
    ["Trailing Bunkers"] = { dfghjk = "BigGunBunker", qazwsx = "Building" },
    ["Trailing Fire"] = { dfghjk = "TorchFireLong", qazwsx = "Torch" },
    ["Trailing Horses"] = { dfghjk = "HorseBigBrown", qazwsx = "Horse" },
    ["Trailing Blue Lights"] = { dfghjk = "LightsSpotLightToothpaste", qazwsx = "Lights" },
    ["Trailing Dance Machine"] = { dfghjk = "DanceMachineCouple", qazwsx = "Screens" },
    ["Trailing Snowman"] = { dfghjk = "ChristmasSnowman", qazwsx = "Christmas" },
    ["Trailing Trampoline"] = { dfghjk = "Summer2026Trampoline", qazwsx = "Carnival" },
    ["Trailing Slip And Slide"] = { dfghjk = "Summer2026SlipAndSlide", qazwsx = "Carnival" },
    ["Trailing Dogs"] = { dfghjk = "AnimalDogStand", qazwsx = "Animals" },
  }

  RegisterDropdown((Tab:AddDropdown({
    Name = "「 Select Player 」",
    Default = "",
    Options = getgenv().SharedPlayersList,
    Callback = function(value40)
      if value40 and value40 ~= "" then
        for index17, value41 in ipairs(players:GetPlayers()) do
          if value41.Name == value40 then
            v24 = value41
            getgenv().SharedChasingPlayer = value40
            break
          end
        end
      else
        v24 = localPlayer4
        getgenv().SharedChasingPlayer = nil
      end
    end,
  })))

  Tab:AddDropdown({
    Name = "「 Select Trailing Prop 」",
    Default = "Trailing Blocks",
    Options = {
      "Trailing Blocks", "Trailing Bunkers", "Trailing Fire", "Trailing Horses",
      "Trailing Blue Lights", "Trailing Dance Machine", "Trailing Snowman",
      "Trailing Trampoline", "Trailing Slip And Slide", "Trailing Dogs",
    },
    Callback = function(value42) v23 = value42 end,
  })

  function f12(p13)
    local v113 = p13.Character
    local v114 = p13.Backpack

    return v113 and v113:FindFirstChild("PropMaker")
      or v114 and v114:FindFirstChild("PropMaker")
  end

  function f5(p14)
    local v115 = p14.Character
    local v116 = p14.Backpack

    if v115 then
      local propMaker4 = v115:FindFirstChild("PropMaker")

      if propMaker4 then
        return propMaker4
      end
    end

    if v116 then
      local propMaker5 = v116:FindFirstChild("PropMaker")

      if propMaker5 then
        return propMaker5
      end

      return nil
    end

    return nil
  end

  function f6()
    if not v24 or v24 == localPlayer4 then
      starterGui:SetCore("SendNotification", {
        Title = "XY Team",
        Text = "no player selected!",
        Duration = 3,
        Icon = "rbxassetid://130069738634749",
      })

      return
    end

    while v22 do
      task.wait(0.1)
      local v117 = v24.Character

      if v117 then
        local humanoidRootPart7 = v117:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart7 then
          local workspaceCom = workspace:FindFirstChild("WorkspaceCom")

          if workspaceCom then
            local findFirstChild9 = workspaceCom:FindFirstChild("001_TrafficCones")

            if findFirstChild9 then
              local v118 = "Prop" .. localPlayer4.Name

              for index18, value43 in ipairs(findFirstChild9:GetChildren()) do
                if value43.Name == v118 then
                  local setCurrentCFrame2 = value43:FindFirstChild("SetCurrentCFrame")

                  if setCurrentCFrame2 then
                    setCurrentCFrame2:InvokeServer(humanoidRootPart7.CFrame)
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  function f7()
    if not v24 or v24 == localPlayer4 then
      starterGui:SetCore("SendNotification", {
        Title = "XY Team",
        Text = "Select a player before starting!",
        Duration = 3,
        Icon = "rbxassetid://130069738634749",
      })

      return
    else
      local v119 = localPlayer4.Character or localPlayer4.CharacterAdded:Wait()
      local humanoid5 = v119:WaitForChild("Humanoid")
      local cframe6 = v119.HumanoidRootPart.CFrame
      local v120 = v25[v23]

      if not v120 then
        return
      else
        humanoid5.WalkSpeed = 0
        humanoid5.JumpPower = 0

        v21:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllProps")
        task.wait(1)

        if not f12(localPlayer4) then
          v21:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(
            "PickingTools", "PropMaker"
          )

          task.wait(0.5)
        end

        local v121 = v26(localPlayer4)

        if v121 then
          humanoid5:EquipTool(v121)
        end

        task.wait(0.5)

        v21:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(
          "RequestingPropName", v120.dfghjk, v120.qazwsx
        )

        v119.HumanoidRootPart.CFrame = cframe2
        task.wait(0.5)

        for m = 1, 15 do
          if not v22 then
            break
          else
            local propMaker6 = v119:FindFirstChild("PropMaker")

            if propMaker6 then
              local toolPropMake2 = propMaker6:FindFirstChild("Tool_PropMake")

              if toolPropMake2 then
                toolPropMake2:FireServer(workspace:FindFirstChild("Model")
                  and workspace.Model:FindFirstChild("CornerHills"), cframe2.Position)
              end
            end

            task.wait(0.9)
          end
        end

        v119.HumanoidRootPart.CFrame = cframe6

        humanoid5.WalkSpeed = 16
        humanoid5.JumpPower = 50

        return
      end
    end
  end

  v26 = f5

  Tab:AddToggle({
    Name = "「 Start 」",
    Default = false,
    Callback = function(value44)
      v22 = value44

      if value44 then
        if not v24 or v24 == localPlayer4 then
          starterGui:SetCore("SendNotification", {
            Title = "XY Team",
            Text = "Select a player before starting!",
            Duration = 3,
            Icon = "rbxassetid://130069738634749",
          })

          v22 = false
          return
        end

        task.spawn(function()
          f7()

          if v22 then
            f6()
          end
        end)

        return
      else
        pcall(function()
          v21:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllProps")
        end)

        local v122 = localPlayer4.Character

        if v122 then
          local humanoid6 = v122:FindFirstChild("Humanoid")

          if humanoid6 then
            humanoid6.WalkSpeed = 16
            humanoid6.JumpPower = 50
          end
        end

        return
      end
    end,
  })

  Tab:AddSection({ Name = "「 Annoying Prop For Players 」" })

  localPlayer5 = players.LocalPlayer

  function f2(name, p15, p16, p17)
    local v123 = false
    local tab = Tab
    local v124, v125

    tab:AddToggle({
      Name = name,
      Callback = function(value45)
        if value45 then
          if v123 then
            return
          end

          v123 = true

          v124 = task.spawn(function()
            replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
            replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllProps")

            task.wait(1)
            local v126 = localPlayer5.Character or localPlayer5.CharacterAdded:Wait()
            local humanoid7 = v126:WaitForChild("Humanoid")
            local cframe7 = v126.HumanoidRootPart.CFrame

            humanoid7.WalkSpeed = 0
            humanoid7.JumpPower = 0

            replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(
              "PickingTools", "PropMaker"
            )

            task.wait(0.5)

            local propMaker7 = v126:FindFirstChild("PropMaker")
              or localPlayer5.Backpack:FindFirstChild("PropMaker")

            if propMaker7 then
              humanoid7:EquipTool(propMaker7)
            end

            task.wait(0.5)

            replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(
              "RequestingPropName", p15, p16
            )

            v126.HumanoidRootPart.CFrame = p17
            task.wait(0.5)

            for n = 1, 15 do
              if not v123 then
                break
              end

              v126:WaitForChild("PropMaker"):WaitForChild("Tool_PropMake"):FireServer(
                workspace:WaitForChild("Model"):WaitForChild("CornerHills"), p17.Position
              )

              task.wait(0.9)
            end

            v126.HumanoidRootPart.CFrame = cframe7

            humanoid7.WalkSpeed = 16
            humanoid7.JumpPower = 50

            task.wait(1)
            local v127 = "Prop" .. localPlayer5.Name
            local waitForChild2 = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_TrafficCones")
            local v128 = 1

            for index19, value46 in ipairs(waitForChild2:GetChildren()) do
              if value46.Name == v127 then
                value46.Name = v127 .. v128
                v128 = v128 + 1
              end
            end

            task.wait(0.1)
            local getChildren3 = waitForChild2.GetChildren
            local v129 = {}

            for index20, value47 in ipairs(getChildren3(waitForChild2)) do
              if value47.Name:match("^" .. v127 .. "%d+$") then
                table.insert(v129, value47)
              end
            end

            v125 = task.spawn(function()
              while v123 do
                local v130 = {}

                for index21, value48 in ipairs((players:GetPlayers())) do
                  if value48 ~= localPlayer5 then
                    table.insert(v130, value48)
                  end
                end

                if #v130 > 0 then
                  for index22, value49 in ipairs(v129) do
                    if not v123 then
                      break
                    else
                      local v131 = v130[(index22 - 1) % #v130 + 1]

                      if v131 and v131.Character
                        and v131.Character:FindFirstChild("HumanoidRootPart") then
                        local setCurrentCFrame3 = value49:FindFirstChild("SetCurrentCFrame")

                        if setCurrentCFrame3 then
                          setCurrentCFrame3:InvokeServer(v131.Character.HumanoidRootPart.CFrame)
                        end
                      end
                    end
                  end
                end

                task.wait(0.1)
              end
            end)
          end)

          return
        else
          v123 = false

          if v124 then
            task.cancel(v124)
            v124 = nil
          end

          if v125 then
            task.cancel(v125)
            v125 = nil
          end

          local v132 = localPlayer5.Character

          if v132 then
            v132.HumanoidRootPart.Anchored = false
            local humanoid8 = v132:FindFirstChild("Humanoid")

            if humanoid8 then
              humanoid8.WalkSpeed = 16
              humanoid8.JumpPower = 50
            end
          end

          return
        end
      end,
    })
  end

  local cframe8 = CFrame.new(1201.5882568359, 50, 1227.5556640625)

  f2("「 Trailing Bunkers All 」", "BigGunBunker", "Building", cframe8)
  f2("「 Trailing Stairs All 」", "FurnitureBleachers", "Furniture", cframe8)
  f2("「 Trailing Fire All 」", "TorchFireLong", "Torch", cframe8)
  f2("「 Trailing Horses All 」", "HorseBigBrown", "Horse", cframe8)
  f2("「 Trailing BLue Lights All 」", "LightsSpotLightToothpaste", "Lights", cframe8)
  f2("「 Trailing Dogs All 」", "AnimalDogStand", "Animals", cframe8)
  f2("「 Trailing Slip And Slide All 」", "Summer2026SlipAndSlide", "Carnival", cframe8)
  f2("「 Trailing Trampoline All 」", "Summer2026Trampoline", "Carnival", cframe8)
  f2("「 Trailing Dance Machine All 」", "DanceMachineCouple", "Screens", cframe8)
  f2("「 Trailing Transmission Towers All 」", "TransmissionTower", "Infrastructure", cframe8)

  Tab = window:MakeTab({
    Name = "「 House 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 House Host Function 」" })

  Tab:AddButton({
    Name = "Ban All From Your House *Build A House*",
    Callback = function()
      starterGui:SetCore("SendNotification", {
        Title = "XY Team",
        Text = "Done! (If it doesn't work Build a house)",
        Duration = 3,
        Icon = "rbxassetid://130069738634749",
      })

      local waitForChild3 = workspace:WaitForChild("001_Lots")

      local function f61(p18)
        local findFirstChild10 = waitForChild3:FindFirstChild(p18.Name .. "House")

        if not findFirstChild10 then
          return
        else
          local permissionsDisallow = findFirstChild10:FindFirstChild("HousePickedByPlayer")
            and findFirstChild10.HousePickedByPlayer:FindFirstChild("HouseModel")
            and findFirstChild10.HousePickedByPlayer.HouseModel:FindFirstChild("Permissions:Disallow")

          if not permissionsDisallow then
            return
          end

          for key10, value50 in pairs(players:GetPlayers()) do
            if value50 ~= p18 then
              args = { [1] = value50 }
              permissionsDisallow:FireServer(unpack(args))
            end
          end

          return
        end
      end

      for key11, value51 in pairs(players:GetPlayers()) do
        f61(value51)
      end

      players.PlayerAdded:Connect(function(p19)
        task.wait(1)
        f61(p19)
      end)
    end,
  })

  Tab:AddButton({
    Name = "UnBan All From Your House *Build A House*",
    Callback = function()
      starterGui:SetCore("SendNotification", {
        Title = "XY Team",
        Text = "Done! (If it doesn't work Build a house)",
        Duration = 3,
        Icon = "rbxassetid://130069738634749",
      })

      local waitForChild4 = workspace:WaitForChild("001_Lots")

      local function f62(p20)
        local findFirstChild11 = waitForChild4:FindFirstChild(p20.Name .. "House")

        if not findFirstChild11 then
          return
        else
          local permissionsAllow = findFirstChild11:FindFirstChild("HousePickedByPlayer")
            and findFirstChild11.HousePickedByPlayer:FindFirstChild("HouseModel")
            and findFirstChild11.HousePickedByPlayer.HouseModel:FindFirstChild("Permissions:Allow")

          if not permissionsAllow then
            return
          end

          for key12, value52 in pairs(players:GetPlayers()) do
            if value52 ~= p20 then
              args = { [1] = value52 }
              permissionsAllow:FireServer(unpack(args))
            end
          end

          return
        end
      end

      for key13, value53 in pairs(players:GetPlayers()) do
        f62(value53)
      end

      players.PlayerAdded:Connect(function(p21)
        task.wait(1)
        f62(p21)
      end)
    end,
  })

  Tab:AddSection({ Name = "「 House Unban 」" })

  v27 = nil

  function f8(name2, content)
    sanderXYUI:MakeNotification({
      Name = name2,
      Content = content,
      Image = "rbxassetid://4483345998",
      Time = 3.5,
    })
  end

  v28 = workspace["001_Lots"]

  function f37()
    for index23, value54 in ipairs(v28:GetChildren()) do
      if players:FindFirstChild(value54.Name:sub(1, -6)) then
        local housePickedByPlayer3 = value54:FindFirstChild("HousePickedByPlayer")

        local houseModel = housePickedByPlayer3

        houseModel = housePickedByPlayer3
          and value54.HousePickedByPlayer:FindFirstChild("HouseModel")

        if houseModel then
          for index24, value55 in ipairs(houseModel:GetChildren()) do
            if value55.Name:find("BannedBlock") then
              f8("Unban", " Unlocked" .. value54.Number.Number.Value)
              value55:Destroy()
            end
          end
        end
      end
    end
  end

  runService.RenderStepped:Connect(function()
    if v27 then
      f37()
    end
  end)

  Tab:AddToggle({
    Name = "「 Auto Unban 」",
    Default = false,
    Callback = function(value56) v27 = value56 end,
  })

  v29 = workspace["001_Lots"]

  function f38(name3, content2)
    sanderXYUI:MakeNotification({
      Name = name3,
      Content = content2,
      Image = "rbxassetid://4483345998",
      Time = 3.5,
    })
  end

  function f39()
    for index25, value57 in ipairs(v29:GetChildren()) do
      if players:FindFirstChild(value57.Name:sub(1, -6)) then
        local housePickedByPlayer4 = value57:FindFirstChild("HousePickedByPlayer")

        local houseModel2 = housePickedByPlayer4

        houseModel2 = housePickedByPlayer4
          and value57.HousePickedByPlayer:FindFirstChild("HouseModel")

        if houseModel2 then
          for index26, value58 in ipairs(houseModel2:GetChildren()) do
            if value58.Name:find("BannedBlock") then
              f38("Unban", "Unlocked" .. value57.Number.Number.Value)
              value58:Destroy()
            end
          end
        end
      end
    end
  end

  Tab:AddButton({ Name = "Unban", Callback = function() f39() end })
  Section = Tab:AddSection({ Name = "「 House Music ID 」(GAMEPASS!)" })

  houseMusicTextBox = Tab:AddTextbox({
    Name = "「 Music ID [Only For House] 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value59) houseMusicId = value59 end,
  })

  Tab:AddButton({
    Name = "Play Music",
    Description = "The Music Is Only for the House",
    Callback = function()
      if houseMusicId and houseMusicId ~= "" then
        args = { [1] = "PickHouseMusicText", [2] = houseMusicId }
        replicatedStorage.RE:FindFirstChild("1Player1sHous1e"):FireServer(unpack(args))
      else
        starterGui:SetCore("SendNotification", {
          Title = "XY Team",
          Text = "Please enter a valid Music ID!",
          Duration = 3,
          Icon = "rbxassetid://130069738634749",
        })
      end
    end,
  })

  Tab:AddSection({ Name = "「 House Teleport 」" })
  Tab:AddParagraph("INFO", "From 1 to 15.")

  v30 = {
    ["1"] = CFrame.new(
      -23.4970779, 32.0248184, 428.582214, -0.999945521, 3.64639767e-8, -0.0104385689,
      3.69953632e-8, 1, -5.07129947e-8, 0.0104385689, -5.10964107e-8, -0.999945521
    ),
    ["2"] = CFrame.new(
      149.726379, 32.0248222, 427.179504, -0.999974489, 3.9855319e-9, -0.00714386534,
      3.71777098e-9, 1, 3.74945124e-8, 0.00714386534, 3.74669966e-8, -0.999974489
    ),
    ["3"] = CFrame.new(
      254.710327, 32.0248222, 426.875793, -0.999447465, -3.91495014e-8, -0.033238437,
      -3.99564328e-8, 1, 2.36128557e-8, 0.033238437, 2.4927898e-8, -0.999447465
    ),
    ["4"] = CFrame.new(
      253.590363, 32.0248222, 398.252167, 0.99995625, -6.32453923e-10, 0.00935398508,
      4.91626961e-10, 1, 1.5057589e-8, -0.00935398508, -1.50523309e-8, 0.99995625
    ),
    ["5"] = CFrame.new(
      149.751587, 32.0248222, 396.567566, 1, -9.32486977e-10, -9.83117843e-7, 9.32469768e-10, 1,
      -1.74096861e-8, 9.83117843e-7, 1.74096861e-8, 1
    ),
    ["6"] = CFrame.new(
      -22.0458107, 32.0248222, 396.969849, 1, -2.52829269e-9, -0.00000480806057, 2.5279927e-9,
      1, -6.23849417e-8, 0.00000480806057, 6.23849346e-8, 1
    ),
    ["7"] = CFrame.new(
      -190.550629, 32.0248222, -256.015137, -0.999974549, 2.10321782e-9, -0.00713396119,
      1.9429518e-9, 1, 2.2472145e-8, 0.00713396119, 2.24577121e-8, -0.999974549
    ),
    ["8"] = CFrame.new(
      -350.46228, 32.0248222, -257.744568, -0.999974549, 1.4000926e-9, -0.00713396491,
      8.73118577e-10, 1, 7.38714334e-8, 0.00713396491, 7.38633261e-8, -0.999974549
    ),
    ["9"] = CFrame.new(
      -453.591156, 34.0249939, -257.027618, -0.999998748, -8.43386416e-10, 0.00159270153,
      -7.50793372e-10, 1, 5.81364183e-8, -0.00159270153, 5.81351465e-8, -0.999998748
    ),
    ["10"] = CFrame.new(
      -456.530273, 34.0249939, -282.747925, 0.999540269, 1.33926414e-9, 0.0303182304,
      -2.93373881e-10, 1, -3.45015216e-8, -0.0303182304, 3.44767663e-8, 0.999540269
    ),
    ["11"] = CFrame.new(
      -351.4133, 34.0249939, -283.345154, 0.999873936, 8.95602028e-8, 0.0158771873,
      -9.031465e-8, 1, 4.6800352e-8, -0.0158771873, -4.82283973e-8, 0.999873936
    ),
    ["12"] = CFrame.new(
      -193.819321, 34.0249939, -283.245453, 0.999609292, -8.39114223e-10, 0.0279510207,
      4.85008755e-10, 1, 1.26755646e-8, -0.0279510207, -1.26570558e-8, 0.999609292
    ),
    ["13"] = CFrame.new(
      -401.707642, 66.0249939, -442.865204, -0.00537203904, -4.19515516e-8, 0.999985576,
      4.7715023e-8, 1, 4.22084874e-8, -0.999985576, 4.79410822e-8, -0.00537203904
    ),
    ["14"] = CFrame.new(
      -347.766754, 66.0249939, -488.839142, 0.999925494, 1.46730379e-8, 0.0122051798,
      -1.39327776e-8, 1, -6.07363333e-8, -0.0122051798, 6.05617601e-8, 0.999925494
    ),
    ["15"] = CFrame.new(
      -28.4702816, 3.59891891, 2216.66064, -0.998063922, -8.91847374e-10, 0.0621965639,
      -4.60541674e-11, 1, 1.36001468e-8, -0.0621965639, 1.35709515e-8, -0.998063922
    ),
  }

  v31 = ""

  Tab:AddTextbox({
    Name = "「 House Number 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value60) v31 = value60 end,
  })

  Tab:AddButton({
    Name = "Teleport",
    Callback = function()
      if v30[v31] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v30[v31]
      end
    end,
  })

  Tab:AddSection({ Name = "「 Estate Teleport 」" })
  Tab:AddParagraph("INFO", "From 1 to 3.")

  v32 = {
    ["1"] = CFrame.new(
      -115.687431, 66.2337952, -417.203278, 0.0221967939, 5.19787626e-8, -0.999753594,
      -3.58880428e-8, 1, 5.11947782e-8, 0.999753594, 3.47428397e-8, 0.0221967939
    ),
    ["2"] = CFrame.new(
      232.989731, 34.2334824, 565.893677, -0.0238156542, 3.10974535e-8, 0.999716341,
      7.64612906e-8, 1, -2.92847826e-8, -0.999716341, 7.57421645e-8, -0.0238156542
    ),
    ["3"] = CFrame.new(
      -1948.07568, 30.8587303, 328.176727, -0.0203366019, -6.33049524e-8, 0.999793172,
      -8.78909656e-9, 1, 6.3139268e-8, -0.999793172, -7.5032407e-9, -0.0203366019
    ),
  }

  v33 = ""

  Tab:AddTextbox({
    Name = "「 Estate Number 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value61) v33 = value61 end,
  })

  Tab:AddButton({
    Name = "Teleport",
    Callback = function()
      if v32[v33] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v32[v33]
      end
    end,
  })

  Tab:AddSection({ Name = "「 Land Teleport 」" })
  Tab:AddParagraph("INFO", "From 1 to 7.")

  nigga3 = {
    ["1"] = CFrame.new(
      -100.879753, 2.99999928, 1054.12061, -0.999998748, -1.37503592e-10, 0.0015925467,
      9.3459936e-12, 1, 9.22105272e-8, -0.0015925467, 9.22104277e-8, -0.999998748
    ),
    ["2"] = CFrame.new(
      -733.235535, 2.99999928, 778.094177, -0.999998748, 1.55078103e-10, 0.00159254798,
      -1.05088759e-11, 1, -1.03976127e-7, -0.00159254798, -1.03976014e-7, -0.999998748
    ),
    ["3"] = CFrame.new(
      -229.576401, -1.43291104, 782.118652, -0.926597714, -5.01744779e-9, 0.376054138,
      1.49785624e-8, 1, 5.02495467e-8, -0.376054138, 5.21938652e-8, -0.926597714
    ),
    ["4"] = CFrame.new(
      625.827576, 74.0511475, -346.697083, 0.698911726, 7.24425107e-8, -0.715207934,
      -9.28358617e-8, 1, 1.0568165e-8, 0.715207934, 5.90107305e-8, 0.698911726
    ),
    ["5"] = CFrame.new(
      -896.691528, 2.99999976, -355.290314, 0.505748212, -8.38967207e-9, 0.86268115,
      1.21577609e-11, 1, 9.71798642e-9, -0.86268115, -4.9043658e-9, 0.505748212
    ),
    ["6"] = CFrame.new(
      249.178482, 18.6705513, -2310.73926, 0.99966228, -2.00141667e-10, -0.0259868745,
      -2.7355942e-9, 1, -1.12934394e-7, 0.0259868745, 1.12967349e-7, 0.99966228
    ),
    ["7"] = CFrame.new(
      1330.09033, 2.99999928, -216.597382, 0.0522867665, 8.91248604e-8, -0.998632133,
      -3.00241454e-9, 1, 8.90897383e-8, 0.998632133, -1.65990677e-9, 0.0522867665
    ),
  }

  landNumber = ""

  Tab:AddTextbox({
    Name = "「 Land Number 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value62) landNumber = value62 end,
  })

  Tab:AddButton({
    Name = "Teleport",
    Callback = function()
      if nigga3[landNumber] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nigga3[landNumber]
      end
    end,
  })

  Tab:AddSection({ Name = "「 Motel Teleport 」" })
  Tab:AddParagraph("INFO", "From 1 to 5.")

  nigga4 = {
    ["1"] = CFrame.new(
      259.981506, 4.39999628, 216.007904, -0.011467482, 6.10498532e-8, -0.999934256,
      7.95256625e-8, 1, 6.01418506e-8, 0.999934256, -7.88307588e-8, -0.011467482
    ),
    ["2"] = CFrame.new(
      222.031281, 4.39999628, 227.895966, -0.99992913, -1.91885086e-9, 0.0119031779,
      -1.56727897e-9, 1, 2.95453066e-8, -0.0119031779, 2.9524557e-8, -0.99992913
    ),
    ["3"] = CFrame.new(
      257.836212, 21.3999958, 222.567337, -0.00160894648, 6.06196679e-13, -0.999998689,
      -1.20252949e-7, 1, 1.94087024e-10, 0.999998689, 1.20253105e-7, -0.00160894648
    ),
    ["4"] = CFrame.new(
      220.946899, 21.3999958, 228.133514, -0.999898076, 8.74138664e-8, -0.0142763089,
      8.61747012e-8, 1, 8.74138664e-8, 0.0142763089, 8.61747012e-8, -0.999898076
    ),
    ["5"] = CFrame.new(
      158.500214, 21.3999958, 228.216614, -0.999190211, -3.59000367e-8, -0.0402359776,
      -3.73473377e-8, 1, 3.52187222e-8, 0.0402359776, 3.669291e-8, -0.999190211
    ),
  }

  motelNumber = ""

  Tab:AddTextbox({
    Name = "「 Motel Number 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value63) motelNumber = value63 end,
  })

  Tab:AddButton({
    Name = "Teleport",
    Callback = function()
      if nigga4[motelNumber] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nigga4[motelNumber]
      end
    end,
  })

  Tab:AddSection({ Name = "「 Apartment Teleport 」" })
  Tab:AddParagraph("INFO", "From 1 to 2.")

  nigga5 = {
    ["1"] = CFrame.new(
      -35.3365974, 18.9999981, -124.835403, 0.999921143, 4.02309991e-10, -0.0125567811,
      -2.89913343e-10, 1, 8.95289265e-9, 0.0125567811, -8.94854679e-9, 0.999921143
    ),
    ["2"] = CFrame.new(
      -36.4522476, 34.9999962, -126.303703, 0.999198496, -7.94987827e-8, -0.0400294363,
      8.23755784e-8, 1, 7.02176735e-8, 0.0400294363, -7.34588426e-8, 0.999198496
    ),
  }

  apartmentNumber = ""

  Tab:AddTextbox({
    Name = "「 Apartment Number 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value64) apartmentNumber = value64 end,
  })

  Tab:AddButton({
    Name = "Teleport",
    Callback = function()
      if nigga5[apartmentNumber] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nigga5[apartmentNumber]
      end
    end,
  })

  Tab:AddParagraph("INFO", "From 1 to 1.")
  Tab:AddSection({ Name = "「 Landmark Teleport 」" })

  nigga6 = {
    ["1"] = CFrame.new(
      486.959167, 3.02499938, 394.383301, 0.0325534157, 3.97479809e-8, -0.999469995,
      -1.93179606e-9, 1, 3.9706137e-8, 0.999469995, 6.38201714e-10, 0.0325534157
    ),
  }

  landmarkNumber = ""

  Tab:AddTextbox({
    Name = "「 Landmark Number 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value65) landmarkNumber = value65 end,
  })

  Tab:AddButton({
    Name = "Teleport",
    Callback = function()
      if nigga6[landmarkNumber] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nigga6[landmarkNumber]
      end
    end,
  })

  Tab = window:MakeTab({
    Name = "「 Car/Boat/Bike 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 Extra Speed Car/Boat 」" })

  localPlayer6 = players.LocalPlayer
  v34 = nil

  function f9(title2, text2)
    starterGui:SetCore("SendNotification", {
      Title = title2,
      Text = text2,
      Duration = 5,
      Button1 = "Ok",
      Icon = icon,
    })
  end

  icon = "rbxassetid://130069738634749"

  function f40(p22)
    if not p22 or p22 == "" then
      f9("XY Team", "Please enter a value!")
      return
    else
      local v133 = tonumber(p22)

      if not v133 then
        f9("XY Team", "Invalid value! Please enter a number.")
        return
      end

      if v133 < 0 or v133 > 100000000000000000000 then
        f9("XY Team", "Enter a valid value")
        return
      else
        local vehicles = workspace:FindFirstChild("Vehicles")

        if not vehicles then
          return
        else
          local findFirstChild12 = vehicles:FindFirstChild(localPlayer6.Name .. "Car")

          if not findFirstChild12 then
            f9("XY Team", "You don't have a car!")
            return
          else
            local vehicleSeat = nil

            if findFirstChild12:FindFirstChild("Seats") then
              vehicleSeat = findFirstChild12.Seats:FindFirstChild("VehicleSeat")
            end

            if not vehicleSeat then
              vehicleSeat = findFirstChild12:FindFirstChild("Seats")
                and findFirstChild12.Seats:FindFirstChild("VehicleSeat")
            end

            if not vehicleSeat then
              f9("XY Team", "PLEASE REPORT IT!")
              return
            else
              local topSpeed = vehicleSeat:FindFirstChild("TopSpeed")

              if topSpeed and topSpeed:IsA("NumberValue") then
                topSpeed.Value = v133
              end

              local maxSpeed = vehicleSeat:FindFirstChild("MaxSpeed")

              if maxSpeed and maxSpeed:IsA("NumberValue") then
                maxSpeed.Value = v133
              end

              local turbo = vehicleSeat:FindFirstChild("Turbo")

              if turbo and turbo:IsA("StringValue") then
                turbo.Value = tostring(v133)
              end

              local rturbo = vehicleSeat:FindFirstChild("RTurbo")

              if rturbo and rturbo:IsA("NumberValue") then
                rturbo.Value = v133
              end

              f9("XY Team", "changed to: " .. v133)
              return
            end
          end
        end
      end
    end
  end

  Tab:AddTextbox({
    Name = "「 Speed 3 in 1 (no Gamepass) 」",
    Default = "",
    TextDisappear = true,
    Callback = function(value66) v34 = value66 end,
  })

  Tab:AddButton({ Name = "Change", Callback = function() f40(v34) end })
  Tab:AddSection({ Name = "「 Car/Boat Object 」" })

  Tab:AddButton({
    Name = "Teleport All Car/Boat",
    Description = "",
    Callback = function()
      local localPlayer25 = game.Players.LocalPlayer
      local humanoidRootPart8 = (localPlayer25.Character or localPlayer25.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

      local vechicles = workspace:FindFirstChild("Vechicles")
        or workspace:FindFirstChild("Vehicles")

      if not vechicles then
        return
      else
        local function f63(p23)
          if p23:IsA("Model") then
            if not p23.PrimaryPart then
              p23.PrimaryPart = p23:FindFirstChildWhichIsA("BasePart")
            end

            if p23.PrimaryPart then
              p23:PivotTo(humanoidRootPart8.CFrame)
            end
          elseif p23:IsA("BasePart") then
            p23.CFrame = humanoidRootPart8.CFrame
          end
        end

        local v134 = false

        for index27, value67 in ipairs(vechicles:GetChildren()) do
          if string.find(value67.Name, "Car") then
            f63(value67)
            v134 = true
          end
        end

        if v134 then
          game.StarterGui:SetCore("SendNotification", {
            Title = "XY Team",
            Text = "Every Car/Boat Object Has Been Teleported",
            Duration = 5,
            Icon = "rbxassetid://130069738634749",
          })
        else
          game.StarterGui:SetCore("SendNotification", {
            Title = "XY Team",
            Text = "There is no object :(",
            Duration = 5,
            Icon = "rbxassetid://130069738634749",
          })
        end

        return
      end
    end,
  })

  Tab:AddButton({
    Name = "Teleport All Horse",
    Description = "",
    Callback = function()
      local localPlayer26 = game.Players.LocalPlayer
      local humanoidRootPart9 = (localPlayer26.Character or localPlayer26.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

      local vechicles2 = workspace:FindFirstChild("Vechicles")
        or workspace:FindFirstChild("Vehicles")

      if not vechicles2 then
        return
      else
        local function f64(p24)
          if p24:IsA("Model") then
            if not p24.PrimaryPart then
              p24.PrimaryPart = p24:FindFirstChildWhichIsA("BasePart")
            end

            if p24.PrimaryPart then
              p24:PivotTo(humanoidRootPart9.CFrame)
            end
          elseif p24:IsA("BasePart") then
            p24.CFrame = humanoidRootPart9.CFrame
          end
        end

        local v135 = false

        for index28, value68 in ipairs(vechicles2:GetChildren()) do
          if string.find(value68.Name, "Horse") then
            f64(value68)
            v135 = true
          end
        end

        if v135 then
          game.StarterGui:SetCore("SendNotification", {
            Title = "XY Team",
            Text = "Every Horse Object Has Been Teleported",
            Duration = 5,
            Icon = "rbxassetid://130069738634749",
          })
        else
          game.StarterGui:SetCore("SendNotification", {
            Title = "XY Team",
            Text = "There is no object :(",
            Duration = 5,
            Icon = "rbxassetid://130069738634749",
          })
        end

        return
      end
    end,
  })

  Tab:AddButton({
    Name = "Fling All Car",
    Description = "",
    Callback = function()
      local cframe9 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58)
      wait(0.3)
      args = { [1] = "PickingBoat", [2] = "MilitaryBoatFree" }
      replicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
      wait(1)
      local v136

      for key14, value69 in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"]:GetDescendants()) do
        if value69:IsA("VehicleSeat") then
          v136 = value69
        end
      end

      local seatPart = game.Players.LocalPlayer.Character.Humanoid.SeatPart

      while not (game.Players.LocalPlayer.Character.Humanoid.Health == 0) do
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
          if not game.Players.LocalPlayer.Character.Humanoid.SeatPart == v136 then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
          end
        end

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v136.CFrame
        task.wait()

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v136.CFrame
          + Vector3.new(0, 1, 0)

        task.wait()

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v136.CFrame
          + Vector3.new(0, -1, 0)

        task.wait()

        if game.Players.LocalPlayer.Character.Humanoid.SeatPart == v136 then
          for key15, value70 in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"]:GetDescendants()) do
            if value70.Name == "PhysicalWheel" then
              value70:Destroy()
            end
          end

          local test1 = Instance.new(
            "BodyThrust",
            game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass
          )

          test1.Force = Vector3.new(50000, 0, 50000)
          test1.Name = "Test1"
          test1.Location = game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass.Position

          for key16, value71 in pairs(game.workspace.Vehicles:GetChildren()) do
            for key17, value72 in pairs(value71:GetDescendants()) do
              if value72.Name == "VehicleSeat" then
                local mOVOOEPFFGEREVEWVW = Instance.new(
                  "BodyVelocity",
                  game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass
                )

                mOVOOEPFFGEREVEWVW.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                mOVOOEPFFGEREVEWVW.P = 1250
                mOVOOEPFFGEREVEWVW.Velocity = Vector3.new(0, 0, 0)
                mOVOOEPFFGEREVEWVW.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

                for i6 = 1, 25 do
                  local v137 = { x = 0, y = 0, z = 0 }
                  v137.x = value72.Position.X
                  v137.y = value72.Position.Y
                  v137.z = value72.Position.Z
                  v137.x = v137.x + value72.Velocity.X / 2
                  v137.y = v137.y + value72.Velocity.Y / 2
                  v137.z = v137.z + value72.Velocity.Z / 2

                  if v137.y <= -200 then
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass.CFrame = CFrame.new(
                      0, 1000, 0
                    )
                  else
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(
                      v137.x, v137.y, v137.z
                    ))

                    task.wait()

                    game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(
                      v137.x, v137.y, v137.z
                    )) + Vector3.new(
                      0, -2, 0
                    )

                    task.wait()

                    game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(
                      v137.x, v137.y, v137.z
                    )) * CFrame.new(
                      0, 0, 2
                    )

                    task.wait()

                    game.workspace.Vehicles[game.Players.LocalPlayer.Name .. "Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(
                      v137.x, v137.y, v137.z
                    )) * CFrame.new(
                      2, 0, 0
                    )

                    task.wait()
                  end

                  task.wait()
                end
              end
            end
          end

          task.wait()
          game.Players.LocalPlayer.Character.Humanoid.Sit = false
          wait()

          local mOVOOEPFFGEREVEWVW2 = Instance.new(
            "BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart
          )

          mOVOOEPFFGEREVEWVW2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
          mOVOOEPFFGEREVEWVW2.P = 1250
          mOVOOEPFFGEREVEWVW2.Velocity = Vector3.new(0, 0, 0)
          mOVOOEPFFGEREVEWVW2.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

          wait(0.1)

          for i7 = 1, 2 do
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe9
          end

          wait(1)
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe9
          wait()
          game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"):Destroy()
          wait(0.2)
          return
        end
      end
    end,
  })

  Tab:AddSection({ Name = "「 Radio Music 」" })

  v35 = ""

  Tab:AddTextbox({
    Name = "「 Radio Song ID 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value73) v35 = value73 end,
  })

  Tab:AddButton({
    Name = "Play Song",
    Callback = function()
      local v138, v139

      if v35 == "" then
        return
      else
        local localPlayer27 = game.Players.LocalPlayer
        v138 = localPlayer27:WaitForChild("Backpack")
        v139 = localPlayer27.Character or localPlayer27.CharacterAdded:Wait()
        local humanoid9 = v139:WaitForChild("Humanoid")

        local function f65()
          return v138:FindFirstChild("Boombox") or v139:FindFirstChild("Boombox")
        end

        if not f65() then
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack({
            "PickingTools", "Boombox",
          }))
        end

        local waitForChild5 = v138:WaitForChild("Boombox", 5)

        if waitForChild5 then
          humanoid9:EquipTool(waitForChild5)
        end

        args = { [1] = "ToolMusicText", [2] = v35 }
        local playerToolEvent = replicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent")

        if playerToolEvent then
          playerToolEvent:FireServer(unpack(args))
        end

        return
      end
    end,
  })

  v36 = {
    ["Fligru & Witti - DOSC"] = 135675751098770,
    ["Gaz gaz gaz policja goni nas"] = 103722026186207,
    Pryzmat = 123512437650780,
    Vivalavida = 138146600644510,
    ["Sobel - Kochasz?"] = 118956178693000,
    ["Boks stop btkey Vixa"] = 85182733163715,
    ["Ty i Ja Vixa"] = 100100513266930,
    ["Nie widzisz mnie"] = 101911861939400,
    Verba = 121150743044940,
    ["Ostatnia nocka"] = 97830350531476,
    ["Odgadnij moje sny"] = 132664527096990,
    ["Nie daj zyciu sie"] = 91497324146586,
    BEJBE = 92255134063806,
    ["Czarne Oczy"] = 123732222551250,
    ["Egzotyczne Dziwki"] = 109451104937827,
    Dotyk = 80283262789278,
    ["Akcent - Gwiazda (Hardstyle)"] = 112936707379500,
    ["Deszcz Pieniedzy"] = 110741134957700,
    ["Ale zanim pojde"] = 107903472079420,
    ["Katowice Noca"] = 122149674775330,
    ["W snach"] = 91762328956311,
    ["Posluchaj mala"] = 9325768029246400,
    Patolove = 102336373420024,
    ["Szon Lover"] = 71036945862923,
    Czinklaczento = 120116907663610,
    ["Z toba"] = 135169286737601,
    BFF = 133187958926560,
    ["Tu cie mam"] = 137277734586950,
    Afterparty = 124345798028280,
    ["Wygryw anthem"] = 84327073725789,
    ["Piwko nie mozna - Show"] = 119274127658070,
    ["Ile czasu nam"] = 75919534503419,
    ["1dayinla"] = 98026976351792,
    ["Nie musze pamietac"] = 86946303530939,
    ["Zabieram cie na chate"] = 106670515208405,
  }

  Tab:AddDropdown({
    Name = "「 Polish Songs 」",
    Default = "",
    Options = {
      "Fligru & Witti - DOSC", "Gaz gaz gaz policja goni nas", "Pryzmat", "Vivalavida",
      "Sobel - Kochasz?", "Boks stop btkey Vixa", "Ty i Ja Vixa", "Nie widzisz mnie", "Verba",
      "Ostatnia nocka", "Odgadnij moje sny", "Nie daj zyciu sie", "BEJBE", "Czarne Oczy",
      "Egzotyczne Dziwki", "Dotyk", "Akcent - Gwiazda (Hardstyle)", "Deszcz Pieniedzy",
      "Ale zanim pojde", "Katowice Noca", "W snach", "Posluchaj mala", "Patolove", "Szon Lover",
      "Czinklaczento", "Z toba", "BFF", "Tu cie mam", "Afterparty", "Wygryw anthem",
      "Piwko nie mozna - Show", "Ile czasu nam", "1dayinla", "Nie musze pamietac",
      "Zabieram cie na chate",
    },
    Callback = function(value74)
      local v140 = v36[value74]
      local v141, v142

      if not v140 then
        return
      else
        local localPlayer28 = game.Players.LocalPlayer
        v141 = localPlayer28:WaitForChild("Backpack")
        v142 = localPlayer28.Character or localPlayer28.CharacterAdded:Wait()
        local humanoid10 = v142:WaitForChild("Humanoid")

        local function f66()
          return v141:FindFirstChild("Boombox") or v142:FindFirstChild("Boombox")
        end

        if not f66() then
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack({
            "PickingTools", "Boombox",
          }))
        end

        local waitForChild6 = v141:WaitForChild("Boombox", 5)

        if waitForChild6 then
          humanoid10:EquipTool(waitForChild6)
        end

        args = { [1] = "ToolMusicText", [2] = v140 }
        local playerToolEvent2 = replicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent")

        if playerToolEvent2 then
          playerToolEvent2:FireServer(unpack(args))
        end

        return
      end
    end,
  })

  v37 = {
    Hollywood = 81495562539173,
    ["Loud Phonk"] = 16190756998,
    ["Scary Phonk"] = 13530437708,
    ["Flex Phonk"] = 103965834613926,
    ["67 Phonk"] = 112214814544630,
    ["Winter Phonk"] = 137723036891450,
    ["Crystal Phonk"] = 132367259509030,
    ["Edit Phonk"] = 115491312021930,
    ["Chwyku Phonk"] = 80796352391107,
    ["Hell Phonk"] = 125106989226648,
    ["Alvoeado Sinistra Phonk"] = 116440470492600,
    ["Metamorphosis Phonk"] = 15689451063,
    ["In Ohio Phonk"] = 13530438676,
    ["Porsche Phonk"] = 71704299912964,
    ["Ritual Phonk"] = 115175275895590,
    ["City Lights Phonk"] = 130020237868400,
    ["F40 Phonk"] = 106487735936050,
  }

  Tab:AddDropdown({
    Name = "「 Phonk Songs 」",
    Default = "",
    Options = {
      "Hollywood", "Loud Phonk", "Scary Phonk", "67 Phonk", "Winter Phonk", "Crystal Phonk",
      "Edit Phonk", "Chwyku Phonk", "Hell Phonk", "Alvoeado Sinistra Phonk",
      "Metamorphosis Phonk", "In Ohio Phonk", "Porsche Phonk", "Ritual Phonk",
      "City Lights Phonk", "F40 Phonk",
    },
    Callback = function(value75)
      local v143 = v37[value75]
      local v144, v145

      if not v143 then
        return
      else
        local localPlayer29 = game.Players.LocalPlayer
        v144 = localPlayer29:WaitForChild("Backpack")
        v145 = localPlayer29.Character or localPlayer29.CharacterAdded:Wait()
        local humanoid11 = v145:WaitForChild("Humanoid")

        local function f67()
          return v144:FindFirstChild("Boombox") or v145:FindFirstChild("Boombox")
        end

        if not f67() then
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack({
            "PickingTools", "Boombox",
          }))
        end

        local waitForChild7 = v144:WaitForChild("Boombox", 5)

        if waitForChild7 then
          humanoid11:EquipTool(waitForChild7)
        end

        args = { [1] = "ToolMusicText", [2] = v143 }
        local playerToolEvent3 = replicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent")

        if playerToolEvent3 then
          playerToolEvent3:FireServer(unpack(args))
        end

        return
      end
    end,
  })

  Tab:AddSection({ Name = "「 Car Teleport 」" })

  v38 = nil

  RegisterDropdown((Tab:AddDropdown({
    Name = "「 Select Person 」",
    Default = "",
    Options = getgenv().SharedPlayersList,
    Callback = function(value76)
      v38 = value76
      getgenv().SharedChasingPlayer = value76
    end,
  })))

  Tab:AddButton({
    Name = "Teleport to car",
    Callback = function()
      if not v38 or v38 == "" then
        return
      else
        local findFirstChild13 = game.Players:FindFirstChild(v38)

        if findFirstChild13 then
          local vehicles2 = workspace:FindFirstChild("Vehicles")

          if vehicles2 then
            local findFirstChild14 = vehicles2:FindFirstChild(findFirstChild13.Name .. "Car")

            if findFirstChild14 and findFirstChild14:IsA("Model") then
              local primaryPart = findFirstChild14.PrimaryPart
                or findFirstChild14:FindFirstChild("PrimaryPart")

              if primaryPart then
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(primaryPart.CFrame
                  + Vector3.new(0, 5, 0))

                starterGui:SetCore("SendNotification", {
                  Title = "XY Team",
                  Text = "Teleported to vehicle: " .. findFirstChild13.Name .. " Car",
                  Duration = 3,
                  Icon = "rbxassetid://130069738634749",
                })
              end
            else
              starterGui:SetCore("SendNotification", {
                Title = "XY Team",
                Text = "Vehicle not found: " .. findFirstChild13.Name .. " Car",
                Duration = 3,
                Icon = "rbxassetid://130069738634749",
              })
            end
          end
        end

        return
      end
    end,
  })

  Tab:AddSection({ Name = "「 Car Function 」" })

  function f10(text3)
    starterGui:SetCore("SendNotification", {
      Title = "XY Team",
      Text = text3,
      Duration = 3,
      Icon = "rbxassetid://130069738634749",
    })
  end

  v39 = false

  function f41()
    spawn(function()
      while v39 do
        for i8 = 0, 1, 0.01 do
          if not v39 then
            break
          else
            local color = Color3.fromHSV(i8, 1, 1)
            players.LocalPlayer.PlayerGui.MainGUIHandler.VehicleControl.UIColorPicker.SetColor:FireServer(color)
            task.wait(0.03)
          end
        end
      end
    end)
  end

  Tab:AddToggle({
    Name = "「 RGB Car (ONLY GAMEPASS!) 」",
    Default = false,
    Callback = function(value77)
      if value77 and not v39 then
        v39 = true
        f10("RGB Car enabled!")
        f41()
      elseif not value77 and v39 then
        v39 = false
        f10("RGB Car disabled!")
      end
    end,
  })

  v21 = replicatedStorage
  remotes = v21:WaitForChild("Remotes")
  v40 = false
  v41 = false
  v42 = false
  v43 = false
  v44 = false

  Tab:AddToggle({
    Name = "「 Auto Flip Vehicle 」",
    Default = false,
    Callback = function(value78)
      v40 = value78

      task.spawn(function()
        while v40 do
          remotes.RepositionVehicle:InvokeServer()
          task.wait(1)
        end
      end)
    end,
  })

  Tab:AddToggle({
    Name = "「 Auto Hazard Lights 」",
    Default = false,
    Callback = function(value79)
      v41 = value79

      task.spawn(function()
        while v41 do
          remotes.ToggleHazardLights:InvokeServer()
          task.wait(1)
        end
      end)
    end,
  })

  Tab:AddToggle({
    Name = "「 Auto Head Lights 」",
    Default = false,
    Callback = function(value80)
      v42 = value80

      task.spawn(function()
        while v42 do
          remotes.ToggleHeadLights:InvokeServer()
          task.wait(1)
        end
      end)
    end,
  })

  Tab:AddToggle({
    Name = "「 Auto Wheel Texture 」",
    Default = false,
    Callback = function(value81)
      v43 = value81

      task.spawn(function()
        while v43 do
          remotes.SetWheelDecal:InvokeServer()
          task.wait(1)
        end
      end)
    end,
  })

  Tab:AddToggle({
    Name = "「 Auto Suspension 」",
    Default = false,
    Callback = function(value82)
      v44 = value82

      task.spawn(function()
        while v44 do
          remotes.SetNextSuspensionHeight:InvokeServer()
          task.wait(1)
        end
      end)
    end,
  })

  Tab = window:MakeTab({
    Name = "「 Teleport 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 Teleport Location 」" })

  Tab:AddDropdown({
    Name = "「 Teleport to Secret Location 」",
    Options = {
      "Secret place on the beach", "Secret Location", "Secret 1", "Secret 2 (Mansion)",
      "Secret 3 (police station)", "Secret Room in Workshop", "Secret Room 2", "Limbo platform",
      "X-ray", "Inside the X-RAY", "Under the boat", "Under the start",
    },
    Callback = function(value83)
      local v146 = ({
        ["Secret place on the beach"] = CFrame.new(-279, 22, 1116),
        ["Secret Location"] = CFrame.new(505, -75, 143),
        ["Secret 1"] = CFrame.new(223.24, -37.59, -153.5),
        ["Secret 2 (Mansion)"] = CFrame.new(-350.31, 45.38, -123.73),
        ["Secret 3 (police station)"] = CFrame.new(-151.79, 22.57, 7.77),
        ["Secret Room in Workshop"] = CFrame.new(0, 4, -495),
        ["Secret Room 2"] = CFrame.new(-343, 4, -613),
        ["Limbo platform"] = CFrame.new(17.99, -28.77, -61.85),
        ["X-ray"] = CFrame.new(-349, 4.43, 98),
        ["Inside the X-RAY"] = CFrame.new(-57.21, -11.81, 109.71),
        ["Under the boat"] = CFrame.new(-108.22, 0.31, 873.85),
        ["Under the start"] = CFrame.new(-26, -8.49, 14),
      })[value83]

      if v146 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v146
      end
    end,
  })

  Tab:AddSection({ Name = "「 More Soon! 」" })

  local localPlayer30 = players.LocalPlayer
  localPlayer30:WaitForChild("Backpack")

  if not localPlayer30.Character then
    localPlayer30.CharacterAdded:Wait()
  end

  Tab = window:MakeTab({
    Name = "「 Toggle Core 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 Items Toggle 」" })

  localPlayer7 = players.LocalPlayer
  v45 = localPlayer7.Character or localPlayer7.CharacterAdded:Wait()

  function f14(p25, p26)
    for index29, value84 in ipairs(p25:GetChildren()) do
      if value84.Name == p26 then
        return value84
      end
    end

    return nil
  end

  v46 = localPlayer7.Backpack

  function f15(title3, text4, p27, icon2)
    starterGui:SetCore("SendNotification", {
      Title = title3,
      Text = text4,
      Duration = p27 or 5,
      Button1 = "OK",
      Icon = icon2,
    })
  end

  v47 = false

  function f16()
    if v48 and v48.Parent == v45 then
      pcall(function() v48.Parent = v46 end)
    end

    v48 = nil
  end

  v48 = nil
  v49 = nil

  function f17(p28)
    local waitForChild8 = replicatedStorage:WaitForChild("RE", 5)

    if not waitForChild8 then
      return
    end

    local findFirstChild15 = waitForChild8:FindFirstChild("1Too1l")

    if not findFirstChild15 then
      return
    end

    args = { "PickingTools", p28 }
    pcall(function() findFirstChild15:InvokeServer(unpack(args)) end)
  end

  function f42(p29)
    v48 = f14(v45, p29)

    if v48 then
      return true
    end

    v48 = f14(v46, p29)
    local v147

    if v48 then
      if pcall(function() v48.Parent = v45 end) then
        return true
      end

      f17(p29)
      task.wait(0.3)
      v147 = f14(v46, p29)
      v48 = v147 or f14(v45, p29)

      if v48 then
        pcall(function() v48.Parent = v45 end)
        return true
      end

      return false
    end

    f17(p29)
    task.wait(0.3)
    v147 = f14(v46, p29)
    v48 = v147 or f14(v45, p29)

    if v48 then
      pcall(function() v48.Parent = v45 end)
      return true
    end

    return false
  end

  function f19()
    if v47 then
      return
    end

    task.wait(0.3)
    local setColor = nil

    if not pcall(function()
      setColor = localPlayer7.PlayerGui.ToolGui.ToolSettings.Settings.PropsColor.SetColor
    end) or not setColor then
      f15("XY Team", "Internet Problems!", 5, "rbxassetid://130069738634749")
      f16()
      return
    end

    v47 = true

    task.spawn(function()
      local v148 = 0

      while v47 do
        local color2 = Color3.fromHSV(v148 / 360, 1, 1)
        local v149 = pcall(function() setColor:FireServer(color2) end)

        if not v149 then
          v149 = pcall(function()
            setColor:FireServer(Vector3.new(color2.R, color2.G, color2.B))
          end)
        end

        if not v149 then
          pcall(function() setColor:FireServer({ color2.R, color2.G, color2.B }) end)
        end

        v148 = (v148 + 1) % 360
        task.wait(0.02)
      end
    end)
  end

  function f18()
    v47 = false
    f16()
  end

  localPlayer7.CharacterAdded:Connect(function(p30)
    v45 = p30
    v46 = localPlayer7.Backpack

    if v49 then
      if not f42(v49) then
        f15(
          "XY Team", "You don't have " .. v49 .. " – requesting it...", 5,
          "rbxassetid://130069738634749"
        )

        if toggles[v49] then
          toggles[v49]:Set(false)
        end

        v49 = nil
      else
        f19()
      end
    end
  end)

  v50 = {}

  function f13(p31)
    v50[p31] = Tab:AddToggle({
      Name = "RGB " .. p31,
      Default = false,
      Callback = function(value85)
        if value85 then
          if v49 and v49 ~= p31 then
            v50[v49]:Set(false)
          end

          if not f42(p31) then
            f15(
              "XY Team", "You don't have " .. p31 .. " – requesting it...", 5,
              "rbxassetid://130069738634749"
            )

            v50[p31]:Set(false)
            return
          end

          v49 = p31
          f19()
          return
        end

        if v49 == p31 then
          f18()
          v49 = nil
        end
      end,
    })
  end

  for index30, value86 in ipairs({
    "Boombox", "Megaphone", "BrushAndPalette", "Cupcake", "Lipstick", "MuffinBlueBerry",
    "PaintRoller", "PowderCompactBrush", "SprayCan", "CakePink", "Bow", "Donut", "HorseBrush",
    "FoamFinger", "GlowingBatons",
  }) do
    f13(value86)
  end

  Tab = window:MakeTab({
    Name = "「 People 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 Orbit Function 」" })

  v51 = {}
  listAddDropdown = nil

  function f20()
    v51 = {}

    for key18, value87 in pairs(players:GetPlayers()) do
      table.insert(v51, value87.Name)
    end

    if listAddDropdown then
      listAddDropdown:Refresh(v51, true)
    end
  end

  players.PlayerAdded:Connect(f20)
  players.PlayerRemoving:Connect(f20)

  f20()
  v52 = nil
  v53 = 5
  v54 = 2
  v55 = false

  listAddDropdown = Tab:AddDropdown({
    Name = "「 List 」",
    Default = v51[1] or "Brak graczy",
    Options = v51,
    Callback = function(value88)
      v52 = value88
      print(".", value88)
    end,
  })

  SliderDistance = Tab:AddSlider({
    Name = "「 Orbit Radius 」",
    Min = 0,
    Max = 50,
    Default = 5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "studs",
    Callback = function(value89)
      v53 = value89
      print(".", value89, "studs")
    end,
  })

  local orbitSpeedAddSlider = Tab:AddSlider({
    Name = "「 Orbit Speed 」",
    Min = 0,
    Max = 10,
    Default = 2,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "speed",
    Callback = function(value90)
      v54 = value90
      print(".", value90, "speed")
    end,
  })

  function f22()
    args = { [1] = "DeleteAllVehicles" }
    replicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
    local localPlayer31 = players.LocalPlayer
    local humanoidRootPart10 = (localPlayer31.Character or localPlayer31.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart10 then
      return
    else
      humanoidRootPart10.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
      task.wait(0.5)
      local re = replicatedStorage:FindFirstChild("RE")

      if re and re:FindFirstChild("1Ca1r") then
        re["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
      end

      task.wait(1)
      return
    end
  end

  SliderSpeed = orbitSpeedAddSlider

  function f43()
    local localPlayer32 = players.LocalPlayer
    local v150 = localPlayer32.Character or localPlayer32.CharacterAdded:Wait()
    local humanoidRootPart11 = v150:FindFirstChild("HumanoidRootPart")
    local sit

    if not humanoidRootPart11 then
      return
    else
      f22()
      local findFirstChild16 = nil

      for i9 = 1, 10 do
        findFirstChild16 = v1.Vehicles:FindFirstChild(localPlayer32.Name .. "Car")

        if findFirstChild16 then
          break
        end

        task.wait(0.5)
      end

      if not findFirstChild16 then
        return
      else
        local seats = findFirstChild16:FindFirstChild("Seats")

        local vehicleSeat2 = seats
        vehicleSeat2 = seats and findFirstChild16.Seats:FindFirstChild("VehicleSeat")

        if vehicleSeat2 and v150:FindFirstChildOfClass("Humanoid") and not v150.Humanoid.Sit then
          if not v150.Humanoid.Sit then
            local parent = findFirstChild16.Parent
          end

          repeat
            humanoidRootPart11.CFrame = vehicleSeat2.CFrame * CFrame.new(0, 2, 0)
            task.wait()
            sit = v150.Humanoid.Sit or not findFirstChild16.Parent
          until sit
        end

        while v55 and v150.Humanoid.Sit do
          local findFirstChild17 = players:FindFirstChild(v52)

          if findFirstChild17 and findFirstChild17.Character then
            local head = findFirstChild17.Character:FindFirstChild("Head")

            if head then
              local position = head.Position
              local v151 = tick() * v54
              local v152 = position + Vector3.new(math.cos(v151) * v53, 0, math.sin(v151) * v53)

              if findFirstChild16.PrimaryPart then
                findFirstChild16:SetPrimaryPartCFrame(CFrame.new(v152, position))
              end
            end
          end

          task.wait(0.03)
        end

        return
      end
    end
  end

  toggle = Tab:AddToggle({
    Name = "「 Orbiting 」",
    Default = false,
    Callback = function(value91)
      v55 = value91

      if v55 then
        f43()
      end
    end,
  })

  Tab:AddSection({ Name = "「 Couch Function 」" })
  localPlayer8 = players.LocalPlayer
  currentCamera = workspace.CurrentCamera
  getgenv().Target = nil
  v56 = nil
  v57 = {}

  RegisterDropdown((Tab:AddDropdown({
    Name = "「 Select the player you want to Kill/Bring 」",
    Options = getgenv().SharedPlayersList,
    Default = "",
    Callback = function(value92)
      getgenv().Target = value92
      v56 = value92
      getgenv().SharedChasingPlayer = value92
    end,
  })))

  function f24()
    local findFirstChild18 = players:FindFirstChild(getgenv().Target)

    if not findFirstChild18 then
      return
    end

    local humanoidRootPart12, v153, position2, bringPosition

    if not findFirstChild18.Character
      or not findFirstChild18.Character:FindFirstChild("HumanoidRootPart") then
      return
    else
      v153 = localPlayer8.Character
      local humanoid12 = v153 and v153:FindFirstChildOfClass("Humanoid")
      local humanoidRootPart13 = v153 and v153:FindFirstChild("HumanoidRootPart")
      humanoidRootPart12 = findFirstChild18.Character.HumanoidRootPart

      if not (humanoid12 and humanoidRootPart13 and humanoidRootPart12) then
        return
      else
        v57[findFirstChild18.Name] = {
          Position = humanoidRootPart12.Position,
          CFrame = humanoidRootPart12.CFrame,
        }

        position2 = humanoidRootPart13.Position
        replicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
        task.wait(0.2)
        replicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
        task.wait(0.3)
        local couch = localPlayer8.Backpack:FindFirstChild("Couch")

        if couch then
          couch.Parent = v153
        end

        task.wait(0.1)
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        task.wait(0.1)
        humanoid12:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        currentCamera.CameraSubject = findFirstChild18.Character:FindFirstChild("Head")
          or humanoidRootPart12 or humanoid12

        bringPosition = Instance.new("BodyPosition")
        bringPosition.Name = "BringPosition"
        bringPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bringPosition.D = 10
        bringPosition.P = 30000
        bringPosition.Position = humanoidRootPart13.Position
        bringPosition.Parent = humanoidRootPart12

        task.spawn(function()
          local v154 = tick()
          local total = 0

          while tick() - v154 < 5 do
            local humanoid13 = findFirstChild18.Character:FindFirstChildOfClass("Humanoid")

            if not (humanoid13 and not humanoid13.Sit) then
              break
            end

            total = total + 50

            humanoidRootPart13.CFrame = CFrame.new(humanoidRootPart12.Position
                + humanoidRootPart12.Velocity / 1.5 + Vector3.new(0, 2, 0))
              * CFrame.Angles(math.rad(total), 0, 0)

            bringPosition.Position = humanoidRootPart13.Position + Vector3.new(2, 0, 0)
            task.wait()
          end

          bringPosition:Destroy()
          humanoid12:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
          currentCamera.CameraSubject = humanoid12

          for key19, value93 in pairs(v153:GetDescendants()) do
            if value93:IsA("BasePart") then
              local zero = Vector3.zero
              value93.Velocity = Vector3.zero
              value93.RotVelocity = zero
            end
          end

          local v155 = v57[findFirstChild18.Name]

          if v155 and findFirstChild18.Character
            and findFirstChild18.Character:FindFirstChild("HumanoidRootPart") then
            findFirstChild18.Character.HumanoidRootPart.CFrame = v155.CFrame
            v57[findFirstChild18.Name] = nil
          end

          humanoidRootPart13.CFrame = CFrame.new(position2)
          task.wait(0.3)
          local couch2 = v153:FindFirstChild("Couch")

          if couch2 then
            couch2.Parent = localPlayer8.Backpack
          end

          task.wait(0.01)
          replicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
          task.wait(0.2)
        end)

        return
      end
    end
  end

  function f23()
    local v156 = localPlayer8.Character

    if v156 then
      local chaosCouch = v156:FindFirstChild("Chaos.Couch")
        or localPlayer8.Backpack:FindFirstChild("Chaos.Couch")

      if chaosCouch then
        chaosCouch:Destroy()
      end
    end

    replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
  end

  function f21(p32)
    p32:WaitForChild("Humanoid").Died:Connect(f23)
    f23()
  end

  if localPlayer8.Character then
    f21(localPlayer8.Character)
  end

  localPlayer8.CharacterAdded:Connect(f21)

  function callback()
    if not v56 then
      return
    end

    local findFirstChild19 = players:FindFirstChild(v56)
    local humanoidRootPart14, v157, position3, vector, bringPosition2

    if not (findFirstChild19 and findFirstChild19.Character
      and findFirstChild19.Character:FindFirstChild("HumanoidRootPart")) then
      return
    else
      v157 = localPlayer8.Character
      local humanoid14 = v157 and v157:FindFirstChildOfClass("Humanoid")
      local humanoidRootPart15 = v157 and v157:FindFirstChild("HumanoidRootPart")
      humanoidRootPart14 = findFirstChild19.Character.HumanoidRootPart

      if not (humanoid14 and humanoidRootPart15 and humanoidRootPart14) then
        return
      else
        position3 = humanoidRootPart15.Position
        vector = Vector3.new(145.51, -350.09, 21.58)
        replicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
        task.wait(0.2)
        replicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
        task.wait(0.3)
        local couch3 = localPlayer8.Backpack:FindFirstChild("Couch")

        if couch3 then
          couch3.Parent = v157
        end

        task.wait(0.1)
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        task.wait(0.1)
        humanoid14:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        currentCamera.CameraSubject = findFirstChild19.Character:FindFirstChild("Head")
          or humanoidRootPart14 or humanoid14

        bringPosition2 = Instance.new("BodyPosition")
        bringPosition2.Name = "BringPosition"
        bringPosition2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bringPosition2.D = 10
        bringPosition2.P = 30000
        bringPosition2.Position = humanoidRootPart15.Position
        bringPosition2.Parent = humanoidRootPart14

        task.spawn(function()
          local v158 = tick()
          local total2 = 0

          while tick() - v158 < 5 do
            local humanoid15 = findFirstChild19.Character:FindFirstChildOfClass("Humanoid")

            if not (humanoid15 and not humanoid15.Sit) then
              break
            end

            total2 = total2 + 50

            humanoidRootPart15.CFrame = CFrame.new(humanoidRootPart14.Position
                + humanoidRootPart14.Velocity / 1.5 + Vector3.new(0, 2, 0))
              * CFrame.Angles(math.rad(total2), 0, 0)

            bringPosition2.Position = humanoidRootPart15.Position + Vector3.new(2, 0, 0)
            task.wait()
          end

          bringPosition2:Destroy()
          humanoid14:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
          currentCamera.CameraSubject = humanoid14

          for key20, value94 in pairs(v157:GetDescendants()) do
            if value94:IsA("BasePart") then
              local zero2 = Vector3.zero
              value94.Velocity = Vector3.zero
              value94.RotVelocity = zero2
            end
          end

          humanoidRootPart15.CFrame = CFrame.new(vector)
          task.wait(0.3)
          local couch4 = v157:FindFirstChild("Couch")

          if couch4 then
            couch4.Parent = localPlayer8.Backpack
          end

          task.wait(0.01)
          replicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "Couch")
          task.wait(0.2)
          humanoidRootPart15.CFrame = CFrame.new(position3)
        end)

        return
      end
    end
  end

  Tab:AddButton({
    Name = "Bring By Couch",
    Callback = function()
      if not getgenv().Target then
        return
      end

      f24()
    end,
  })

  Tab:AddButton({ Name = "Kill By Couch", Callback = callback })
  Tab:AddSection({ Name = "「 Kill Function 」" })

  RegisterDropdown((Tab:AddDropdown({
    Name = "Select Person",
    Default = "",
    Options = getgenv().SharedPlayersList,
    Callback = function(value95)
      getgenv().Target = value95
      getgenv().SharedChasingPlayer = value95
    end,
  })))

  Tab:AddButton({
    Name = "Kill By Car",
    Callback = function()
      args = { [1] = "DeleteAllVehicles" }
      replicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
      local v159 = getgenv().Target
      local localPlayer33 = game.Players.LocalPlayer
      local v160 = localPlayer33.Character
      local humanoid16 = v160:FindFirstChildOfClass("Humanoid")
      local humanoidRootPart16 = v160:FindFirstChild("HumanoidRootPart")
      local vehicles3 = game.Workspace:FindFirstChild("Vehicles")
      local cframe10 = humanoidRootPart16.CFrame
      local findFirstChild20

      if not v159 or not humanoid16 then
        return
      else
        findFirstChild20 = vehicles3:FindFirstChild(localPlayer33.Name .. "Car")

        if not findFirstChild20 then
          if humanoidRootPart16 and v159 then
            humanoidRootPart16.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
            task.wait(0.5)

            replicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(
              "PickingCar", "CopUnderCoverSUV"
            )

            task.wait(0.5)
            findFirstChild20 = vehicles3:FindFirstChild(localPlayer33.Name .. "Car")
            task.wait(0.5)
            local seats2 = findFirstChild20:FindFirstChild("Seats")

            local vehicleSeat3 = seats2
            vehicleSeat3 = seats2 and findFirstChild20.Seats:FindFirstChild("VehicleSeat")

            if vehicleSeat3 then
              local sit2 = humanoid16.Sit

              repeat
                task.wait()

                humanoidRootPart16.CFrame = vehicleSeat3.CFrame
                  * CFrame.new(0, math.random(-1, 1), 0)
              until humanoid16.Sit
            end
          end
        end

        task.wait(0.5)
        findFirstChild20 = vehicles3:FindFirstChild(localPlayer33.Name .. "Car")

        if findFirstChild20 and not humanoid16.Sit then
          local seats3 = findFirstChild20:FindFirstChild("Seats")

          local vehicleSeat4 = seats3
          vehicleSeat4 = seats3 and findFirstChild20.Body:FindFirstChild("VehicleSeat")

          if vehicleSeat4 then
            local sit3 = humanoid16.Sit

            repeat
              task.wait()

              humanoidRootPart16.CFrame = vehicleSeat4.CFrame
                * CFrame.new(0, math.random(-1, 1), 0)
            until humanoid16.Sit
          end
        end

        local findFirstChild21 = game.Players:FindFirstChild(getgenv().Target)

        if findFirstChild21 then
          local v161 = findFirstChild21.Character
          local humanoid17 = v161:FindFirstChildOfClass("Humanoid")
          local humanoidRootPart17 = v161:FindFirstChild("HumanoidRootPart")

          if v161 and humanoid17 and humanoidRootPart17 then
            if not humanoid17.Sit then
              while not humanoid17.Sit do
                task.wait()

                local function f68(p33, p34, p35)
                  findFirstChild20:SetPrimaryPartCFrame(CFrame.new(p33.Position) * p34 * p35)
                end

                f68(humanoidRootPart17, CFrame.new(0, 1, 0)
                  + humanoid17.MoveDirection * humanoidRootPart17.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(0), 0, 0))

                f68(humanoidRootPart17, CFrame.new(0, -2.25, 5)
                  + humanoid17.MoveDirection * humanoidRootPart17.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(0), 0, 0))

                f68(humanoidRootPart17, CFrame.new(0, 2.25, 0.25)
                  + humanoid17.MoveDirection * humanoidRootPart17.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(95), 0, 0))

                f68(humanoidRootPart17, CFrame.new(-2.25, -1.5, 2.25)
                  + humanoid17.MoveDirection * humanoidRootPart17.Velocity.Magnitude / 1.1, CFrame.Angles(math.rad(45), 0, 0))

                f68(humanoidRootPart17, CFrame.new(0, 1.5, 0)
                  + humanoid17.MoveDirection * humanoidRootPart17.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(0), 0, 0))

                f68(humanoidRootPart17, CFrame.new(0, -1.5, 0)
                  + humanoid17.MoveDirection * humanoidRootPart17.Velocity.Magnitude / 1.05, CFrame.Angles(math.rad(0), 0, 0))
              end

              task.wait(0.1)
              findFirstChild20:SetPrimaryPartCFrame(CFrame.new(0, -470, 0))
              task.wait(0.2)
              humanoid16.Sit = false
              task.wait(0.1)
              humanoidRootPart16.CFrame = cframe10
            end
          end
        end

        return
      end
    end,
  })

  Tab:AddSection({ Name = "「 Fling Section 」" })

  Tab:AddButton({
    Name = "Fling All By Ball",
    Callback = function()
      local localPlayer34 = players.LocalPlayer
      local v162 = "WorkspaceCom/001_SoccerBalls/Soccer" .. localPlayer34.Name
      getgenv().Target = nil
      local v163 = false

      local function f69()
        argsClear = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(argsClear))
        argsTool = { [1] = "PickingTools", [2] = "SoccerBall" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(argsTool))
        localPlayer34.Backpack:FindFirstChild("SoccerBall")
        local v164

        repeat
          task.wait()
          v164 = localPlayer34.Backpack
        until v164:FindFirstChild("SoccerBall")

        local soccerBall = localPlayer34.Backpack:FindFirstChild("SoccerBall")

        if not soccerBall then
          return
        end

        soccerBall.Parent = localPlayer34.Character
        task.wait(0.25)
      end

      local function f70(p36)
        for index31, value96 in ipairs(p36:GetChildren()) do
          if value96:IsA("BodyForce") or value96:IsA("BodyVelocity")
            or value96:IsA("BodyAngularVelocity") then
            value96:Destroy()
          end
        end
      end

      local function f71(p37, p38)
        for index32, value97 in ipairs(p38:GetDescendants()) do
          if value97:IsA("BasePart") then
            local noCollisionConstraint = Instance.new("NoCollisionConstraint")
            noCollisionConstraint.Part0 = p37
            noCollisionConstraint.Part1 = value97
            noCollisionConstraint.Parent = p37
          end
        end
      end

      local function f72(p39)
        f70(p39)

        local bodyForce = Instance.new("BodyForce")
        bodyForce.Force = Vector3.new(900000000, 900000000, 900000000)
        bodyForce.Parent = p39

        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.P = 10000000
        bodyVelocity.Parent = p39
      end

      local connect7

      local function f73(p40)
        local v165 = p40.Character or p40.CharacterAdded:Wait()
        local humanoidRootPart18 = v165:FindFirstChild("HumanoidRootPart")
        local position4, v166

        if not humanoidRootPart18 then
          return
        else
          local v167, v168 = pcall(function()
            local v169 = workspace

            for index33, value98 in ipairs(v162:split("/")) do
              v169 = v169:WaitForChild(value98, 5)
            end

            return v169
          end)

          if not v167 or not v168 then
            return
          end

          v168.Anchored = false
          v168.CanCollide = true
          v168.Massless = false

          f70(v168)
          f71(v168, v165)
          f72(v168)
          f1(connect7)
          position4 = humanoidRootPart18.Position
          v166 = true

          connect7 = runService.Heartbeat:Connect(function()
            if not v168 or not humanoidRootPart18 or not humanoidRootPart18.Parent then
              f1(connect7)
              connect7 = nil
              return
            else
              local v170 = position4
              local position5 = humanoidRootPart18.Position
              local magnitude = (position5 - v170).Magnitude
              position4 = position5
              local v171 = humanoidRootPart18.Position + Vector3.new(0, -0.5, 0)

              if magnitude > 1 then
                v168.CFrame = CFrame.new(v171 + humanoidRootPart18.CFrame.LookVector * 10)
              else
                v168.CFrame = CFrame.new(v171 + Vector3.new(0, v166 and 3 or -3, 0))
                v166 = not v166
              end

              return
            end
          end)

          return
        end
      end

      local function f74(p41)
        local humanoidRootPart19 = p41.Character
          and p41.Character:FindFirstChild("HumanoidRootPart")

        return humanoidRootPart19 and math.abs(humanoidRootPart19.Velocity.Y) > 100
      end

      local function f75()
        v163 = true

        starterGui:SetCore("SendNotification", {
          Title = "XY Team",
          Text = "Script started flinging players.",
          Duration = 3,
          Icon = "rbxassetid://130069738634749",
        })

        f69()
        local v172 = { CFrame.new(0, 0, 0) }
        players.LocalPlayer.Character:WaitForChild("SoccerBall"):WaitForChild("FootballInteraction"):FireServer(unpack(v172))

        for index34, value99 in ipairs((players:GetPlayers())) do
          if value99 ~= localPlayer34 then
            getgenv().Target = value99.Name
            f73(value99)
            local total3 = 0

            while total3 < 3 and value99.Character
              and value99.Character:FindFirstChild("Humanoid") do
              if f74(value99) then
                break
              end

              task.wait(0.2)
              total3 = total3 + 0.2
            end
          end
        end

        v163 = false
        f1(connect7)
        connect7 = nil

        starterGui:SetCore("SendNotification", {
          Title = "XY Team",
          Text = "Every player got flinged!.",
          Duration = 3,
          Icon = "rbxassetid://130069738634749",
        })
      end

      if not v163 then
        f75()
      end
    end,
  })

  Tab:AddSection({ Name = "「 View 」" })

  v58 = false
  v59 = nil

  function f25(p42)
    if p42 and typeof(p42) == "RBXScriptConnection" then
      p42:Disconnect()
    end
  end

  connect3 = nil
  v60 = f25

  function toggleView(p43)
    v58 = p43

    if p43 then
      if v59 then
        local v173 = v59

        if v173 then
          game.Workspace.CurrentCamera.CameraSubject = v173.Character
          v60(connect3)

          connect3 = v173.CharacterAdded:Connect(function(p44)
            game.Workspace.CurrentCamera.CameraSubject = p44
          end)

          sanderXYUI:MakeNotification({
            Name = "View",
            Content = "You're watching: " .. v173.Name,
            Image = "rbxassetid://4483345998",
            Time = 6,
          })
        else
          print(".")
          v58 = false
        end
      else
        print(".")
        v58 = false
      end
    else
      v60(connect3)
      connect3 = nil
      local localPlayer35 = game.Players.LocalPlayer

      if localPlayer35 and localPlayer35.Character then
        game.Workspace.CurrentCamera.CameraSubject = localPlayer35.Character
      end
    end
  end

  function findPlayerByPartialNameOrNickname(p45)
    local lower = p45:sub(1, 2):lower()

    for index35, value100 in ipairs(game.Players:GetPlayers()) do
      if value100.Name:lower():sub(1, 2) == lower
        or value100.DisplayName and value100.DisplayName:lower():sub(1, 2) == lower then
        return value100
      end
    end

    return nil
  end

  Tab:AddTextbox({
    Name = "Player Name :",
    Default = "",
    TextDisappear = true,
    Callback = function(value101)
      v59 = findPlayerByPartialNameOrNickname(value101)

      if v59 then
        print("." .. v59.Name)

        if v58 then
          toggleView(false)
          toggleView(true)
        end
      else
        print(".")

        if v58 then
          toggleView(false)
        end
      end
    end,
  })

  Tab:AddToggle({
    Name = "View",
    Default = false,
    Callback = function(value102)
      v58 = value102
      toggleView(value102)
    end,
  })

  Tab:AddSection({ Name = "「 Goto 」" })

  v61 = nil

  RegisterDropdown((Tab:AddDropdown({
    Name = "Choose who you want to Goto",
    Description = nil,
    Options = getgenv().SharedPlayersList,
    Callback = function(value103)
      v61 = value103
      getgenv().SharedChasingPlayer = value103
    end,
  })))

  Tab:AddButton({
    Name = "Goto",
    Description = nil,
    Callback = function()
      if v61 then
        local findFirstChild22 = game.Players:FindFirstChild(v61)

        if findFirstChild22 and findFirstChild22.Character
          and findFirstChild22.Character:FindFirstChild("HumanoidRootPart") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = findFirstChild22.Character.HumanoidRootPart.CFrame
        end
      end
    end,
  })

  game.Players.PlayerRemoving:Connect(function(p46)
    if v59 == p46 then
      v59 = nil

      if v58 then
        toggleView(false)

        sanderXYUI:MakeNotification({
          Name = "Sander X",
          Content = p46.Name .. " has left",
          Image = "rbxassetid://4483345998",
          Time = 5,
        })
      end
    end
  end)

  function maintainView()
    while wait() do
      if v58 and v59 then
        local v174 = v59

        if v174 and game.Workspace.CurrentCamera.CameraSubject ~= v174.Character then
          game.Workspace.CurrentCamera.CameraSubject = v174.Character
        end
      end
    end
  end

  spawn(maintainView)

  Tab:AddSection({ Name = "「 Effects Add-ons 」" })

  Tab:AddTextbox({
    Name = "Gravity",
    Description = "",
    Default = tostring(workspace.Gravity),
    Callback = function(value104)
      local v175 = tonumber(value104)

      if v175 then
        workspace.Gravity = v175
        print("?", ".")
      else
        print(".")
      end
    end,
  })

  function f26()
    userInputService.JumpRequest:connect(function()
      if v62 then
        players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
      end
    end)
  end

  v62 = false

  Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(value105)
      v62 = value105

      if v62 then
        f26()
      end
    end,
  })

  Tab:AddButton({
    Name = "Click Teleport",
    Callback = function() loadstring(game:HttpGet("https://pastefy.app/Ro0n1K3w/raw"))() end,
  })

  Tab:AddButton({
    Name = "Telekinesis",
    Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/h4VWC9dc"))() end,
  })

  Tab:AddButton({
    Name = "illusion TP",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end,
  })

  v63 = false

  function toggleIllusionV20()
    v63 = not v63

    if v63 then
      while v63 do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
          * CFrame.new(0, 1, 0)

        tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1e-12), {
          CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            * CFrame.new(0, -1, 0),
        }):Play()

        wait(1e-12)

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(
          math.rad(90), math.rad(180), math.rad(270)
        )

        tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.001001001001001001), {
          CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            * CFrame.Angles(math.rad(90), math.rad(180), math.rad(270)),
        }):Play()

        wait(0.001001001001001001)
      end
    end
  end

  Tab:AddButton({
    Name = "illusion V1",
    Description = "",
    Callback = function() toggleIllusionV20() end,
  })

  Tab = window:MakeTab({
    Name = "「 ESP 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddParagraph("NOTE!", "Esp Allows you to stalk other players.")

  currentCamera2 = workspace.CurrentCamera
  localPlayer9 = players.LocalPlayer
  v64 = false
  v65 = false
  v66 = false
  v67 = {}
  v68 = {}
  v69 = {}

  function f27()
    local line = Drawing.new("Line")
    line.Thickness = 1.5
    line.Color = Color3.fromRGB(0, 255, 0)
    line.Transparency = 1

    return line
  end

  v70 = {
    { "Head", "UpperTorso" }, { "UpperTorso", "LowerTorso" }, { "UpperTorso", "LeftUpperArm" },
    { "LeftUpperArm", "LeftLowerArm" }, { "LeftLowerArm", "LeftHand" },
    { "UpperTorso", "RightUpperArm" }, { "RightUpperArm", "RightLowerArm" },
    { "RightLowerArm", "RightHand" }, { "LowerTorso", "LeftUpperLeg" },
    { "LeftUpperLeg", "LeftLowerLeg" }, { "LeftLowerLeg", "LeftFoot" },
    { "LowerTorso", "RightUpperLeg" }, { "RightUpperLeg", "RightLowerLeg" },
    { "RightLowerLeg", "RightFoot" },
  }

  function f28(size, font, color3)
    local text5 = Drawing.new("Text")
    text5.Size = size
    text5.Center = true
    text5.Outline = true
    text5.Font = font
    text5.Color = color3
    text5.Transparency = 1

    return text5
  end

  function f44(p47)
    for key21, value106 in pairs(p47) do
      local v176 = value106
      pcall(function() v176:Remove() end)
    end

    table.clear(p47)
  end

  runService.RenderStepped:Connect(function()
    f44(v67)
    f44(v68)
    f44(v69)

    for key22, value107 in pairs(players:GetPlayers()) do
      if value107 ~= localPlayer9 and value107.Character then
        local v177 = value107.Character
        local humanoid18 = v177:FindFirstChildOfClass("Humanoid")
        local v178 = not humanoid18
        local head2 = v177:FindFirstChild("Head")

        if v178 or not head2 then
        else
          if v64 then
            for key23, value108 in pairs(v70) do
              local findFirstChild23 = v177:FindFirstChild(value108[1])
              local findFirstChild24 = v177:FindFirstChild(value108[2])

              if findFirstChild23 and findFirstChild24 then
                local v179, v180 = currentCamera2:WorldToViewportPoint(findFirstChild23.Position)
                local v181, v182 = currentCamera2:WorldToViewportPoint(findFirstChild24.Position)

                if v180 and v182 then
                  local v183 = f27()
                  v183.From = Vector2.new(v179.X, v179.Y)
                  v183.To = Vector2.new(v181.X, v181.Y)
                  v183.Visible = true

                  table.insert(v67, v183)
                end
              end
            end
          end

          if v65 and head2 then
            local v184, v185 = currentCamera2:WorldToViewportPoint(head2.Position
              + Vector3.new(0, 2.7, 0))

            if v185 then
              local v186 = f28(14, 3, Color3.fromRGB(0, 255, 255))
              v186.Text = value107.Name
              v186.Position = Vector2.new(v184.X - v186.TextBounds.X / 2, v184.Y)
              v186.Visible = true

              table.insert(v68, v186)
            end
          end

          if v66 and humanoid18 and humanoid18.Health > 0 and head2 then
            local v187, v188 = currentCamera2:WorldToViewportPoint(head2.Position
              + Vector3.new(0, 2.7, 0))

            if v188 then
              local v189 = humanoid18.Health / humanoid18.MaxHealth

              local v190 = f28(13, 2, Color3.fromRGB(255 * (1 - v189), 255 * v189, 0))
              v190.Text = math.floor(humanoid18.Health) .. " HP"
              v190.Position = Vector2.new(v187.X - v190.TextBounds.X / 2, v187.Y + 14)
              v190.Visible = true

              table.insert(v69, v190)
            end
          end
        end
      end
    end
  end)

  Tab:AddToggle({
    Name = "「 Players Skeleton 」",
    Default = false,
    Callback = function(value109) v64 = value109 end,
  })

  Tab:AddToggle({
    Name = "「 Players Name 」",
    Default = false,
    Callback = function(value110) v65 = value110 end,
  })

  Tab:AddToggle({
    Name = "「 Players HP 」",
    Default = false,
    Callback = function(value111) v66 = value111 end,
  })

  Tab:AddToggle({
    Name = "「 Red ESP 」",
    Default = false,
    Callback = function(value112)
      local function f76(p48)
        if p48 and p48:FindFirstChild("HumanoidRootPart") then
          local redESP = Instance.new("Highlight")
          redESP.Name = "RedESP"
          redESP.Adornee = p48
          redESP.FillColor = Color3.fromRGB(255, 0, 0)
          redESP.OutlineColor = Color3.fromRGB(0, 0, 0)
          redESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
          redESP.Parent = coreGui
        end
      end

      if value112 then
        for key24, value113 in pairs(players:GetPlayers()) do
          if value113 ~= players.LocalPlayer then
            if value113.Character then
              f76(value113.Character)
            end

            value113.CharacterAdded:Connect(function(p49)
              if Tab.Toggles["Red ESP"].Value then
                f76(p49)
              end
            end)
          end
        end
      else
        for key25, value114 in pairs(coreGui:GetChildren()) do
          if value114:IsA("Highlight") and value114.Name == "RedESP" then
            value114:Destroy()
          end
        end
      end
    end,
  })

  Tab = window:MakeTab({
    Name = "「 Skin 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddParagraph("NOTE!", "New Skins Update Thanks to AntekWoszszek!")

  Tab:AddDropdown({
    Name = "History Skins (designer: AntekWoszszczczek):",
    Default = "",
    Options = {
      "Soviet Parade Honor Guard", "Adolf Hitler", "Joseph Stalin (Summer)", "Joseph Stalin",
      "Russian Military", "Joseph Pilsudski",
    },
    Callback = function(value115)
      local localPlayer36 = players.LocalPlayer
      local remotes2 = replicatedStorage:WaitForChild("Remotes")

      local function f77(p50)
        args = { [1] = p50 }
        remotes2:WaitForChild("Wear"):InvokeServer(unpack(args))
      end

      local function f78()
        local localPlayer37 = game.Players.LocalPlayer
        local v191 = localPlayer37.Character or localPlayer37.CharacterAdded:Wait()
        local wear = game.ReplicatedStorage.Remotes.Wear

        for key26, value116 in pairs(v191:GetChildren()) do
          zxzxc = value116:GetAttribute("AssetId")

          if zxzxc then
            wear:InvokeServer(zxzxc)
            task.wait(0.8)
          end
        end
      end

      f78()

      task.wait(0.7)

      for index36, value117 in ipairs(({
        ["Soviet Parade Honor Guard"] = {
          118536406779730, 15021364705, 15021355462, 16105355696,
        },
        ["Adolf Hitler"] = {
          11239746088, 4316217088, 10921859516, 16184013489, 16184592736, 14899151967,
          14908167675, 14908173231, 14874157306, 14874139380, 14955417006,
        },
        ["Joseph Stalin (Summer)"] = {
          17445142384, 120661421599580, 4786863817, 122265100718580, 126885328997060,
          18440672984, 13895617178, 7074764, 17328278372, 83036664569432, 127355706606440,
        },
        ["Joseph Stalin"] = {
          17659733801, 125740357143100, 16112939546, 4786863817, 90508774599329, 14076202938,
        },
        ["Russian Military"] = {
          17444923689, 120661421599580, 139159664014920, 124529348795530, 15987386690,
          15987392677,
        },
        ["Joseph Pilsudski"] = {
          14998424781, 98436513420827, 13743105272, 4080162638, 4995497755, 14076202938,
          12330311832, 13462890800, 13569618532, 14678432527, 1424226224,
        },
      })[value115] or {}) do
        f77(value117)
        task.wait(1)
      end
    end,
  })

  Tab:AddDropdown({
    Name = "SCP Skins (designer: AntekWoszszczczek):",
    Default = "",
    Options = { "Cloud-9", "Nu-7", "E-11", "C.I.", "Eta-10", "S.D" },
    Callback = function(value118)
      local localPlayer38 = players.LocalPlayer
      local remotes3 = replicatedStorage:WaitForChild("Remotes")

      local function f79(p51)
        args = { [1] = p51 }
        remotes3:WaitForChild("Wear"):InvokeServer(unpack(args))
      end

      local function f80()
        local localPlayer39 = game.Players.LocalPlayer
        local v192 = localPlayer39.Character or localPlayer39.CharacterAdded:Wait()
        ddddc = game.ReplicatedStorage.Remotes.Wear

        for key27, value119 in pairs(v192:GetChildren()) do
          zxzxc = value119:GetAttribute("AssetId")

          if zxzxc then
            ddddc:InvokeServer(zxzxc)
            task.wait(0.8)
          end
        end
      end

      f80()

      task.wait(0.7)

      for index37, value120 in ipairs(({
        ["Cloud-9"] = {
          10551267917, 6192981736, 6192983565, 18657457046, 80791950806860, 12383357842,
          13327087857, 16603970693, 7499448880, 7499442692, 17115008941, 17114995034,
          18505418001, 138824935436570, 15834711710, 11515963408, 15961368062,
        },
        ["Nu-7"] = {
          10551267917, 16271056264, 6192981736, 6192983565, 18657457046, 80791950806860,
          12383357842, 13327087857, 16603970693, 7499448880, 7499442692, 17115008941,
          17114995034, 18828895266, 17430994449, 13600740755, 9958477344, 15961368062,
        },
        ["E-11"] = {
          18642628074, 18657457046, 80791950806860, 12383357842, 13327087857, 16603970693,
          11515963408, 940828186,
        },
        ["C.I."] = {
          7480383200, 18505418001, 5170390923, 5161461677, 80791950806860, 12383357842,
          13327087857, 16603970693, 14952204288, 13862460626,
        },
        ["Eta-10"] = {
          18657457046, 80791950806860, 12383357842, 13327087857, 16603970693, 14527795635,
          7901972046, 1342894685, 4523936040,
        },
        ["S.D"] = {
          18759636287, 18657457046, 80791950806860, 12383357842, 13327087857, 16603970693,
          13603100880, 13603103554,
        },
      })[value118] or {}) do
        f79(value120)
        task.wait(1)
      end
    end,
  })

  Tab:AddDropdown({
    Name = "Meme Skins (designer: AntekWoszszczczek):",
    Default = "",
    Options = {
      "Golden TrollFace", "Delux Rock", "Bo Sinn", "Mickey Mouse (sus)", "Freak Bob",
      "Konon (1963-2025)",
    },
    Callback = function(value121)
      local localPlayer40 = players.LocalPlayer
      local remotes4 = replicatedStorage:WaitForChild("Remotes")

      local function f81(p52)
        args = { [1] = p52 }
        remotes4:WaitForChild("Wear"):InvokeServer(unpack(args))
      end

      local function f82()
        asasd = game.Players.LocalPlayer
        szxzx = asasd.Character or asasd.CharacterAdded:Wait()
        ddddc = game.ReplicatedStorage.Remotes.Wear

        for key28, value122 in pairs(szxzx:GetChildren()) do
          zxzxc = value122:GetAttribute("AssetId")

          if zxzxc then
            ddddc:InvokeServer(zxzxc)
            task.wait(0.8)
          end
        end
      end

      f82()

      task.wait(0.7)

      skins = {
        ["Golden TrollFace"] = { 13271314856, 2178906609, 4307509960 },
        ["Delux Rock"] = { 12451225178, 8998922811, 5231223671 },
        ["Bo Sinn"] = {
          6374467232, 5193622313, 12299883619, 16830658322, 17401807242, 16647841799,
          16647845700, 16647839692, 13895692779,
        },
        ["Mickey Mouse (sus)"] = {
          18265941623, 18265954265, 6069138311, 119319658122980, 18964656939, 6905334557,
        },
        ["Freak Bob"] = { 18440963919, 226948064, 17475516808 },
        ["Konon (1963-2025)"] = {
          13033117874, 10975301608, 14720386664, 17660929664, 14076202938,
        },
      }

      for index38, value123 in ipairs(skins[value121] or {}) do
        f81(value123)
        task.wait(0.4)
      end
    end,
  })

  Tab:AddDropdown({
    Name = "Horror Skins (designed by Wojtes_BMW):",
    Default = "",
    Options = { "Jeff The Killer", "Black Eye", "Chucky", "Pennywise", "Terrifier", "Scream" },
    Callback = function(value124)
      local localPlayer41 = players.LocalPlayer
      local remotes5 = replicatedStorage:WaitForChild("Remotes")

      local function f83(p53)
        args = { [1] = p53 }
        remotes5:WaitForChild("Wear"):InvokeServer(unpack(args))
      end

      local function f84()
        local localPlayer42 = game.Players.LocalPlayer
        local v193 = localPlayer42.Character or localPlayer42.CharacterAdded:Wait()
        local wear2 = game.ReplicatedStorage.Remotes.Wear

        for key29, value125 in pairs(v193:GetChildren()) do
          local assetId = value125:GetAttribute("AssetId")

          if assetId then
            wear2:InvokeServer(assetId)
            task.wait(0.8)
          end
        end
      end

      f84()

      task.wait(0.7)

      for index39, value126 in ipairs(({
        ["Jeff The Killer"] = {
          133835024489500, 80142632821053, 138995226702240, 14738607601, 18766113807,
        },
        ["Black Eye"] = { 122987998732170, 12163311814, 12876048513 },
        Chucky = { 72466957849040, 7493861040, 7493862899, 119240453879740 },
        Pennywise = { 17744620277, 4974346489, 4974360150, 16144852434 },
        Terrifier = { 137431636953340, 106768351310780, 114536935165542, 15255132990 },
        Scream = { 109813920830660, 138995226702240, 14742104860, 12876048513 },
      })[value124] or {}) do
        f83(value126)
        task.wait(0.41)
      end
    end,
  })

  Tab:AddSection({ Name = "「 Copy Skin 」" })

  v71 = players
  v72 = replicatedStorage
  localPlayer10 = v71.LocalPlayer
  v73 = nil

  RegisterDropdown((Tab:AddDropdown({
    Name = "「 Select Player 」",
    Default = "",
    Options = getgenv().SharedPlayersList,
    Callback = function(value127)
      v73 = value127
      getgenv().SharedChasingPlayer = value127
    end,
  })))

  function f34(p54)
    args = { [1] = p54 }
    v72:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
  end

  function f29(p55)
    local v194 = p55.Character

    if not v194 then
      return
    else
      local bodyColors = v194:FindFirstChildOfClass("BodyColors")

      if not bodyColors then
        return
      end

      args = { [1] = bodyColors.HeadColor.Name }
      v72:WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(args))
      return
    end
  end

  function f30(p56)
    local humanoid19 = p56.Character and p56.Character:FindFirstChildOfClass("Humanoid")

    if not humanoid19 then
      return
    else
      local getAppliedDescription = humanoid19:GetAppliedDescription()

      args = {
        [1] = {
          [1] = getAppliedDescription.Torso,
          [2] = getAppliedDescription.RightArm,
          [3] = getAppliedDescription.LeftArm,
          [4] = getAppliedDescription.RightLeg,
          [5] = getAppliedDescription.LeftLeg,
          [6] = getAppliedDescription.Head,
        },
      }

      v72:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
      return
    end
  end

  function RemoveAllItems()
    character = localPlayer10.Character

    if not character then
      return
    end

    if not character:FindFirstChildOfClass("Humanoid") then
      return
    else
      args = {
        [1] = {
          [1] = 0,
          [2] = 0,
          [3] = 0,
          [4] = 0,
          [5] = 0,
          [6] = 0,
        },
      }

      v72:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
      local count = 0

      while count < 10 do
        remaining = {}
        count = count + 1

        for key30, value128 in pairs(character:GetChildren()) do
          local assetId2 = value128:GetAttribute("AssetId")

          if assetId2 then
            table.insert(remaining, { obj = value128, id = assetId2 })
          end
        end

        if #remaining == 0 then
          break
        end

        for key31, value129 in pairs(remaining) do
          v72.Remotes.Wear:InvokeServer(value129.id)
          task.wait(0.3)
        end

        task.wait(0.5)
        stillRemaining = 0

        for key32, value130 in pairs(character:GetChildren()) do
          if value130:GetAttribute("AssetId") then
            stillRemaining = stillRemaining + 1
          end
        end

        if stillRemaining == 0 then
          break
        end
      end

      return
    end
  end

  function f45(p57)
    local humanoid20 = p57.Character and p57.Character:FindFirstChildOfClass("Humanoid")

    if not humanoid20 then
      return
    else
      local getAppliedDescription2 = humanoid20:GetAppliedDescription()

      clothingIds = {
        getAppliedDescription2.Shirt, getAppliedDescription2.Pants,
        getAppliedDescription2.GraphicTShirt,
      }

      for index40, value131 in ipairs(clothingIds) do
        if value131 ~= 0 then
          task.wait(1)
          f34(value131)
        end
      end

      return
    end
  end

  function f31(p58)
    local v195 = p58.Character

    if not v195 then
      return
    end

    for key33, value132 in pairs(v195:GetChildren()) do
      local assetId3 = value132:GetAttribute("AssetId")

      if assetId3 then
        f34(assetId3)
        task.wait(1)
      end
    end
  end

  function f32()
    if v73 then
      local findFirstChild25 = v71:FindFirstChild(v73)

      if findFirstChild25 then
        RemoveAllItems()
        v74(findFirstChild25)
        task.wait(1)
        f30(findFirstChild25)
        f45(findFirstChild25)
        f29(findFirstChild25)
      end
    end
  end

  v74 = f31

  Tab:AddButton({ Name = "Copy Selected Player", Callback = function() f32() end })
  Tab:AddSection({ Name = "「 18+ 」" })

  localPlayer11 = players.LocalPlayer
  v75 = false
  TablaGrip = { CFrame.new(0.5, -1.7, 0) * CFrame.Angles(math.rad(10), math.rad(51), 0) }
  BabyGrip = { CFrame.new(0.4, 0, 0) * CFrame.Angles(math.rad(10), math.rad(51), 0) }
  local cframe11 = CFrame.new(0, 0.6, 0.4)
  local v196 = math.rad(143)
  local cframe12 = CFrame.Angles(v196, 2.8, 23.9)

  function f33()
    args = { [1] = "ClearAllTools" }
    replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    v75 = false
  end

  BabyHippoGrip = { cframe11 * cframe12 }

  function isR15(p59)
    if p59.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
      return true
    end

    return false
  end

  function f46()
    local humanoid21 = localPlayer11.Character:FindFirstChildWhichIsA("Humanoid")

    if not humanoid21 then
      return
    else
      local v197 = isR15(localPlayer11)

      local animation = Instance.new("Animation")
      animation.AnimationId = v197 and "rbxassetid://698251653" or "rbxassetid://72042024"

      local loadAnimation = humanoid21:LoadAnimation(animation)
      loadAnimation:Play()
      loadAnimation:AdjustSpeed(v197 and 0.7 or 0.65)
      loadAnimation.TimePosition = 0.5

      while loadAnimation and loadAnimation.TimePosition < (v197 and 0.7 or 0.65) do
        task.wait(0.1)
      end

      if loadAnimation then
        loadAnimation:Stop()
      end

      return
    end
  end

  function f47(p60, p61)
    v75 = true
    args = { [1] = "ClearAllTools" }
    replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    pickArgs = { [1] = "PickingTools", [2] = p60 }
    replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(pickArgs))

    for key34, value133 in pairs(localPlayer11.Backpack:GetChildren()) do
      if value133.Name == p60 then
        value133.Parent = localPlayer11.Character

        if value133:IsDescendantOf(localPlayer11.Character) then
          value133.Grip = p61[1]
        else
          warn("Tool not found in character:", value133.Name)
        end
      end
    end

    while v75 do
      f46()
      task.wait(0)
    end
  end

  Tab:AddToggle({
    Name = "「 Masturbation FireX 」",
    Default = false,
    Callback = function(value134)
      if value134 then
        f47("FireX", TablaGrip)
      else
        f33()
      end
    end,
  })

  Tab:AddToggle({
    Name = "「 Masturbation BabyBoy 」",
    Default = false,
    Callback = function(value135)
      if value135 then
        f47("BabyBoy", BabyGrip)
      else
        f33()
      end
    end,
  })

  Tab:AddToggle({
    Name = "「 Masturbation BabyHippo 」",
    Default = false,
    Callback = function(value136)
      if value136 then
        f47("BabyHippo", BabyHippoGrip)
      else
        f33()
      end
    end,
  })

  Tab:AddDropdown({
    Name = "「 Custom D#ck 」",
    Default = "",
    Options = {
      "D#ck ShotGun", "D#ck Assault", "D#ck Glock", "D#ck Glock Brown", "D#ck Sword",
      "D#ck Rose", "D#ck GhostMeter", "D#ck Hammer",
    },
    Callback = function(value137)
      if value137 == "D#ck ShotGun" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "Shotgun" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.1)
        TablaGripPos = { Vector3.new(0.1, 1, -0.6) }

        for key35, value138 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value138:IsA("Tool") then
            value138.Parent = game.Players.LocalPlayer.Character
            local gripPos = TablaGripPos[math.min(key35, #TablaGripPos)]

            if value138:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value138.GripPos = gripPos
            else
              warn("", value138.Name, "")
            end
          end
        end
      elseif value137 == "D#ck Assault" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "Assault" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.1)
        TablaGripPos = { Vector3.new(0.8, 2, 1.2) }

        for key36, value139 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value139:IsA("Tool") then
            value139.Parent = game.Players.LocalPlayer.Character
            local gripPos2 = TablaGripPos[math.min(key36, #TablaGripPos)]

            if value139:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value139.GripPos = gripPos2
            else
              warn("", value139.Name, "")
            end
          end
        end
      elseif value137 == "D#ck Glock" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "Glock" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.1)
        TablaGripPos = { Vector3.new(0.3, 2, -0.53) }

        for key37, value140 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value140:IsA("Tool") then
            value140.Parent = game.Players.LocalPlayer.Character
            local gripPos3 = TablaGripPos[math.min(key37, #TablaGripPos)]

            if value140:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value140.GripPos = gripPos3
            else
              warn("", value140.Name, "")
            end
          end
        end
      elseif value137 == "D#ck Glock Brown" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "GlockBrown" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.1)
        TablaGripPos = { Vector3.new(0.3, 2, -0.53) }

        for key38, value141 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value141:IsA("Tool") then
            value141.Parent = game.Players.LocalPlayer.Character
            local gripPos4 = TablaGripPos[math.min(key38, #TablaGripPos)]

            if value141:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value141.GripPos = gripPos4
            else
              warn("", value141.Name, "")
            end
          end
        end
      elseif value137 == "D#ck Sword" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "SwordWood" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.1)
        TablaGrip = { CFrame.new(-1.5, -1.9, 0) * CFrame.Angles(math.rad(180), 3.1, 0) }

        for key39, value142 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value142:IsA("Tool") then
            value142.Parent = game.Players.LocalPlayer.Character
            local grip = TablaGrip[math.min(key39, #TablaGrip)]

            if value142:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value142.Grip = grip
            else
              warn("", value142.Name, "")
            end
          end
        end
      elseif value137 == "D#ck Rose" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "Roses" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.1)
        TablaGripPos = { Vector3.new(-1, -0.5, -1.5) }

        for key40, value143 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value143:IsA("Tool") then
            value143.Parent = game.Players.LocalPlayer.Character
            local gripPos5 = TablaGripPos[math.min(key40, #TablaGripPos)]

            if value143:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value143.GripPos = gripPos5
            else
              warn("", value143.Name, "")
            end
          end
        end
      elseif value137 == "D#ck GhostMeter" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "GhostMeter" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.8)
        TablaGripPos = { Vector3.new(1.52, 1, -1) }

        for key41, value144 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value144:IsA("Tool") then
            value144.Parent = game.Players.LocalPlayer.Character
            local gripPos6 = TablaGripPos[math.min(key41, #TablaGripPos)]

            if value144:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value144.GripPos = gripPos6
            else
              warn("", value144.Name, "")
            end
          end
        end
      elseif value137 == "D#ck Hammer" then
        args = { [1] = "ClearAllTools" }
        replicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
        args = { [1] = "PickingTools", [2] = "Hammer" }
        replicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
        wait(0.8)
        TablaGrip = { CFrame.new(1.5, -1.8, 0.3) * CFrame.Angles(math.rad(180), 0, 0) }

        for index41, value145 in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if value145:IsA("Tool") then
            value145.Parent = game.Players.LocalPlayer.Character
            local grip2 = TablaGrip[(index41 - 1) % #TablaGrip + 1]

            if value145:IsDescendantOf(game.Players.LocalPlayer.Character) then
              value145.Grip = grip2
            else
              warn("", value145.Name, "")
            end
          end
        end
      end
    end,
  })

  Tab:AddButton({
    Name = "Gun to Your Head",
    Callback = function()
      args = { [1] = "ClearAllTools" }
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
      wait(1)
      args = { "GlockBrown", "MagnumGolden" }
      replicatedStorage:WaitForChild("Remotes"):WaitForChild("GunEquip"):InvokeServer(unpack(args))
      local v198 = { CFrame.new(-0.3, -0.3, 0) * CFrame.Angles(math.rad(0), 9.3, 0) }

      for key42, value146 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if value146:IsA("Tool") then
          value146.Parent = game.Players.LocalPlayer.Character
          local grip3 = v198[math.min(key42, #v198)]

          if value146:IsDescendantOf(game.Players.LocalPlayer.Character) then
            value146.Grip = grip3
          else
            warn("", value146.Name, "")
          end
        end
      end
    end,
  })

  Tab:AddSection({ Name = "「 Hats 」" })

  Tab:AddDropdown({
    Name = "「 Hats With Sound 」",
    Default = "",
    Options = {
      "Brighteyes Bloxy Cola Hat", "Brighteyes Witches Brew Hat", "Telamons Chicken Suit",
    },
    Callback = function(value147)
      local v199 = ({
        ["Brighteyes Bloxy Cola Hat"] = 24114402,
        ["Brighteyes Witches Brew Hat"] = 305888394,
        ["Telamons Chicken Suit"] = 24112667,
      })[value147]

      if v199 then
        args = { [1] = v199 }
        replicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
      end
    end,
  })

  Tab:AddDropdown({
    Name = "「 Valkyrie Helmets 」",
    Default = "",
    Options = {
      "Valkyrie Helm", "Valkyrie Shine Time", "Blackvalk", "Emerald Valkyrie", "Ice Valkyrie",
    },
    Callback = function(value148)
      local v200 = ({
        ["Valkyrie Helm"] = 1365767,
        ["Valkyrie Shine Time"] = 1180433861,
        Blackvalk = 124730194,
        ["Emerald Valkyrie"] = 2830437685,
        ["Ice Valkyrie"] = 4390891467,
      })[value148]

      if v200 then
        args = { [1] = v200 }
        replicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
      end
    end,
  })

  Tab:AddSection({ Name = "「 Box 」" })

  Tab:AddDropdown({
    Name = "「 Custom Meme Skin 」",
    Default = "",
    Options = {
      "Rowan Atkinson Gta San", "BIG-Shocked-Cat-Suit", "cow", "Bingo Cat",
      "Sorry ure Not a Sigma", "Ninja Low Taper", "Messi Meme", "Trans Skibidi Toilet",
      "Very Stupid Dog", "Alien Cat", "Weird Flamingo", "FreakBob", "Eye Rah",
    },
    Callback = function(value149)
      local v201 = ({
        ["Rowan Atkinson Gta San"] = 116402119240980,
        ["BIG-Shocked-Cat-Suit"] = 18752680390,
        cow = 85625404668612,
        ["Bingo Cat"] = 139201938342970,
        ["Sorry ure Not a Sigma"] = 17340267926,
        ["Ninja Low Taper"] = 109436770624970,
        ["Messi Meme"] = 18573595009,
        ["Trans Skibidi Toilet"] = 98307487515780,
        ["Very Stupid Dog"] = 18890105692,
        ["Alien Cat"] = 102716512580820,
        ["Weird Flamingo"] = 17263434058,
        FreakBob = 86848374418738,
        ["Eye Rah"] = 104061352253700,
      })[value149]

      if v201 then
        args = { [1] = v201 }
        replicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
      end
    end,
  })

  Tab:AddDropdown({
    Name = "「  Custom Horror Skin 」",
    Default = "",
    Options = {
      "Jeft The Killer NightMare", "Locked in alien", "Scary Monster", "terrifying Monster",
      "Yellow Boy", "Very Scary Girl", "Weird Scary Dark Girl", "Scary Stick Boy",
      "A jump with fish-shaped teeth", "CaseOh",
    },
    Callback = function(value150)
      local v202 = ({
        ["Jeft The Killer NightMare"] = 85901474083461,
        ["Locked in alien"] = 72288004345481,
        ["Scary Monster"] = 18838943375,
        ["terrifying Monster"] = 116049312535591,
        ["Yellow Boy"] = 111996080812170,
        ["Very Scary Girl"] = 106715720963490,
        ["Weird Scary Dark Girl"] = 131341742032120,
        ["Scary Stick Boy"] = 87859729921468,
        ["A jump with fish-shaped teeth"] = 18736808278,
        CaseOh = 87025677280527,
      })[value150]

      if v202 then
        args = { [1] = v202 }
        replicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
      end
    end,
  })

  Tab:AddDropdown({
    Name = "「 Custom Eltoria RX750 」",
    Default = "",
    Options = { "White", "Yellow", "Red", "Black" },
    Callback = function(value151)
      local remotes6 = replicatedStorage:WaitForChild("Remotes")

      local v203 = {
        White = 4435389917,
        Yellow = 4332375148,
        Red = 4506965901,
        Black = 4585144193,
      }

      if v203[value151] then
        args = { [1] = v203[value151] }
        remotes6:WaitForChild("Wear"):InvokeServer(unpack(args))
      end
    end,
  })

  Tab:AddSection({ Name = "Box V2" })

  Tab:AddDropdown({
    Name = " (V2) Custom Horror Skins:",
    Default = "",
    Options = {
      "Jeff The Killer", "Siren Head", "Smile Dog", "Mario Victim 1", "Jermas Eyes", "SCP-096",
      "Scary Girl", "AYUWOKI", "Eyes", "Phen-228",
    },
    Callback = function(value152)
      local remotes7 = replicatedStorage:WaitForChild("Remotes")

      local v204 = {
        ["Jeff The Killer"] = 14502327402,
        ["Siren Head"] = 15133314794,
        ["Smile Dog"] = 14761007249,
        ["Mario Victim 1"] = 14732524763,
        ["Jermas Eyes"] = 14817978441,
        ["SCP-096"] = 14952594200,
        ["Scary Girl"] = 14567023223,
        AYUWOKI = 17215935156,
        Eyes = 14701936208,
        ["Phen-228"] = 17289564307,
      }

      if v204[value152] then
        args = { [1] = v204[value152] }
        remotes7:WaitForChild("Wear"):InvokeServer(unpack(args))
      end
    end,
  })

  Tab:AddDropdown({
    Name = "(V2) Custom Meme Skin:",
    Default = "",
    Options = {
      "cashOh Bro", "Nikocado Avocado", "Shrek", "Arab WallTuh", "Sigma Dog", "Black Man",
      "Socked Guy", "Sussy Dog", "Dog Meme", "Looksmaxing", "Dr cheatson", "Pig Explosion",
      "Tyler", "Kai cenat", "Chipi chipi Cat", "Super Idol", "Ronaldo",
    },
    Callback = function(value153)
      local remotes8 = replicatedStorage:WaitForChild("Remotes")

      local v205 = {
        ["cashOh Bro"] = 17040765338,
        ["Nikocado Avocado"] = 15036970502,
        Shrek = 15105007162,
        ["Arab WallTuh"] = 14605941742,
        ["Sigma Dog"] = 17198646013,
        ["Black Man"] = 17378489658,
        ["Socked Guy"] = 14952570512,
        ["Sussy Dog"] = 17253063048,
        ["Dog Meme"] = 14753332139,
        Looksmaxing = 17803036342,
        ["Dr cheatson"] = 18254304785,
        ["Pig Explosion"] = 17678916331,
        Tyler = 17327750447,
        ["Kai cenat"] = 15588677056,
        ["Chipi chipi Cat"] = 15696360871,
        ["Super Idol"] = 15228571817,
        Ronaldo = 14967090040,
      }

      if v205[value153] then
        args = { [1] = v205[value153] }
        remotes8:WaitForChild("Wear"):InvokeServer(unpack(args))
      end
    end,
  })

  Tab = window:MakeTab({
    Name = "「 Troll 」",
    Icon = "rbxassetid://7734021680",
    PremiumOnly = false,
  })

  Tab:AddSection({ Name = "「 SpeedWalk/JumpPower 」" })

  Tab:AddSlider({
    Name = "「 SpeedWalk 」",
    Min = 16,
    Max = 350,
    Default = 5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 10,
    ValueName = "Speed",
    Callback = function(value154)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value154
    end,
  })

  Tab:AddSlider({
    Name = "「 JumpPower 」",
    Min = 50,
    Max = 350,
    Default = 5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 10,
    ValueName = "Jump",
    Callback = function(value155)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = value155
    end,
  })

  Tab:AddSection({ Name = "「 Family Controls 」" })

  roles = { "Family", "Parent", "Adopted", "Teen", "Guardian", "Child", "Grandparent" }
  delayTime = 0
  v47 = false
  v72 = replicatedStorage
  SetFamilyRole = v72:WaitForChild("Remotes"):WaitForChild("SetFamilyRole")

  function f48()
    task.spawn(function()
      while v47 do
        for index42, value156 in ipairs(roles) do
          if not v47 then
            break
          end

          SetFamilyRole:FireServer(value156)
          task.wait(delayTime)
        end
      end
    end)
  end

  Tab:AddToggle({
    Name = "「Auto Role Switch 」",
    Default = false,
    Callback = function(value157)
      v47 = value157

      if v47 then
        f48()
      end
    end,
  })

  v71 = players
  v72 = replicatedStorage
  localPlayer10 = v71.LocalPlayer
  InvitePlayerToFamily = v72:WaitForChild("Remotes"):WaitForChild("InvitePlayerToFamily")
  v47 = false
  delayTime = 0

  function InviteAllPlayersLoop()
    task.spawn(function()
      while v47 do
        for key43, value158 in pairs(v71:GetPlayers()) do
          if not v47 then
            break
          elseif value158 ~= localPlayer10 then
            InvitePlayerToFamily:FireServer(value158.UserId, "FamilyInviteMenu")
          end
        end

        task.wait(delayTime)
      end
    end)
  end

  Tab:AddButton({
    Name = "Create Family ( u need this!)",
    Callback = function()
      CreateFamily = replicatedStorage.Remotes.CreateFamily
      CreateFamily:FireServer()
    end,
  })

  Tab:AddToggle({
    Name = "「 Auto Invite Players 」",
    Default = false,
    Callback = function(value159)
      v47 = value159

      if v47 then
        InviteAllPlayersLoop()
      end
    end,
  })

  Tab:AddButton({
    Name = "Invite All Players to Your Family",
    Callback = function()
      InvitePlayerToFamily = replicatedStorage:WaitForChild("Remotes"):WaitForChild("InvitePlayerToFamily")
      local localPlayer43 = players.LocalPlayer

      function InviteAllPlayers()
        for key44, value160 in pairs(players:GetPlayers()) do
          if value160 ~= localPlayer43 then
            InvitePlayerToFamily:FireServer(value160.UserId, "FamilyInviteMenu")
          end
        end
      end

      InviteAllPlayers()
    end,
  })

  Tab:AddSection({ Name = "「 Child Controls 」" })

  localPlayer6 = game.Players.LocalPlayer
  chasingPlayer = nil

  RegisterDropdown((Tab:AddDropdown({
    Name = "「 Select player to follow/Spectate 」",
    Default = "",
    Options = getgenv().SharedPlayersList,
    Callback = function(value161)
      if game.Players:FindFirstChild(value161) then
        chasingPlayer = value161
        getgenv().SharedChasingPlayer = value161
      else
        chasingPlayer = nil
        getgenv().SharedChasingPlayer = nil
      end
    end,
  })))

  Tab:AddButton({
    Name = "Send Baby Girl",
    Callback = function()
      if not chasingPlayer then
        return
      end

      if not workspace:FindFirstChild(localPlayer6.Name)
        or not workspace[localPlayer6.Name]:FindFirstChild("FollowCharacter") then
        args = { "CharacterFollowSpawnPlayer", "BabyGirl" }

        pcall(function()
          replicatedStorage.RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
        end)
      end

      task.wait(0.2)

      if workspace:FindFirstChild(localPlayer6.Name) then
        for key45, value162 in pairs(workspace[localPlayer6.Name]:GetChildren()) do
          if value162:IsA("BasePart") then
            value162.CanCollide = true
          end
        end
      end

      if workspace:FindFirstChild(chasingPlayer) and workspace:FindFirstChild(localPlayer6.Name)
        and workspace[localPlayer6.Name]:FindFirstChild("FollowCharacter") then
        workspace[localPlayer6.Name].FollowCharacter.Parent = workspace[chasingPlayer]

        if rawget(getgenv(), "RunService") then
          return
        end

        local v206 = getgenv()

        v206.RunService = runService.Heartbeat:Connect(function()
          local followCharacter = workspace[chasingPlayer]:FindFirstChild("FollowCharacter")

          if followCharacter and followCharacter:FindFirstChild("Torso")
            and followCharacter.Torso:FindFirstChild("BodyPosition") then
            local humanoidRootPart20 = workspace[chasingPlayer]:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart20 then
              followCharacter.Torso.BodyPosition.Position = humanoidRootPart20.Position
                - humanoidRootPart20.CFrame.LookVector * 3

              followCharacter.Torso.BodyGyro.CFrame = humanoidRootPart20.CFrame
            end
          end
        end)

        return
      end
    end,
  })

  Tab:AddButton({
    Name = "Respawn Baby Girl",
    Callback = function()
      if rawget(getgenv(), "RunService") then
        getgenv().RunService:Disconnect()
        getgenv().RunService = nil
      end

      args = { "DeleteFollowCharacter" }

      pcall(function()
        replicatedStorage.RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
      end)

      args1 = { "CharacterFollowSpawnPlayer", "BabyGirl" }

      pcall(function()
        replicatedStorage.RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args1))
      end)
    end,
  })

  Tab:AddButton({
    Name = "Send Baby Boy",
    Callback = function()
      if not chasingPlayer then
        return
      end

      if not workspace:FindFirstChild(localPlayer6.Name)
        or not workspace[localPlayer6.Name]:FindFirstChild("FollowCharacter") then
        args = { "CharacterFollowSpawnPlayer", "BabyBoy" }

        pcall(function()
          replicatedStorage.RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
        end)
      end

      task.wait(0.2)

      if workspace:FindFirstChild(localPlayer6.Name) then
        for key46, value163 in pairs(workspace[localPlayer6.Name]:GetChildren()) do
          if value163:IsA("BasePart") then
            value163.CanCollide = true
          end
        end
      end

      if workspace:FindFirstChild(chasingPlayer) and workspace:FindFirstChild(localPlayer6.Name)
        and workspace[localPlayer6.Name]:FindFirstChild("FollowCharacter") then
        workspace[localPlayer6.Name].FollowCharacter.Parent = workspace[chasingPlayer]

        if rawget(getgenv(), "RunService") then
          return
        end

        local v207 = getgenv()

        v207.RunService = runService.Heartbeat:Connect(function()
          local followCharacter2 = workspace[chasingPlayer]:FindFirstChild("FollowCharacter")

          if followCharacter2 and followCharacter2:FindFirstChild("Torso")
            and followCharacter2.Torso:FindFirstChild("BodyPosition") then
            local humanoidRootPart21 = workspace[chasingPlayer]:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart21 then
              followCharacter2.Torso.BodyPosition.Position = humanoidRootPart21.Position
                - humanoidRootPart21.CFrame.LookVector * 3

              followCharacter2.Torso.BodyGyro.CFrame = humanoidRootPart21.CFrame
            end
          end
        end)

        return
      end
    end,
  })

  Tab:AddButton({
    Name = "Respawn Baby Boy",
    Callback = function()
      if rawget(getgenv(), "RunService") then
        getgenv().RunService:Disconnect()
        getgenv().RunService = nil
      end

      args = { "DeleteFollowCharacter" }

      pcall(function()
        replicatedStorage.RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args))
      end)

      args1 = { "CharacterFollowSpawnPlayer", "BabyBoy" }

      pcall(function()
        replicatedStorage.RE:FindFirstChild("1Bab1yFollo1w"):FireServer(unpack(args1))
      end)
    end,
  })

  v76 = players

  function v60(p62)
    if p62 and typeof(p62) == "RBXScriptConnection" then
      p62:Disconnect()
    end
  end

  Tab:AddToggle({
    Name = "「 Spectate Player 」",
    Default = false,
    Callback = function(value164)
      local currentCamera4 = workspace.CurrentCamera

      if not currentCamera4 then
        return
      elseif value164 then
        if not chasingPlayer then
          return
        end

        if not getgenv().CameraConnection then
          local connect8 = runService.Heartbeat:Connect(function()
            local findFirstChild26 = v76:FindFirstChild(chasingPlayer)
            local v208 = findFirstChild26 and findFirstChild26.Character
            local v209

            if v208 then
              local humanoid22 = findFirstChild26.Character:FindFirstChildOfClass("Humanoid")

              if humanoid22 then
                currentCamera4.CameraSubject = humanoid22
                return
              end

              v60(getgenv().CameraConnection)
              getgenv().CameraConnection = nil
              v209 = localPlayer6

              if v209 and localPlayer6.Character then
                local humanoid23 = localPlayer6.Character:FindFirstChildOfClass("Humanoid")

                if humanoid23 then
                  currentCamera4.CameraSubject = humanoid23
                end
              end

              return
            end

            v60(getgenv().CameraConnection)
            getgenv().CameraConnection = nil
            v209 = localPlayer6

            if v209 and localPlayer6.Character then
              local humanoid24 = localPlayer6.Character:FindFirstChildOfClass("Humanoid")

              if humanoid24 then
                currentCamera4.CameraSubject = humanoid24
              end
            end
          end)

          if connect8 then
            getgenv().CameraConnection = connect8
          end
        end

        return
      else
        v60(getgenv().CameraConnection)
        getgenv().CameraConnection = nil

        if localPlayer6 and localPlayer6.Character then
          local humanoid25 = localPlayer6.Character:FindFirstChildOfClass("Humanoid")

          if humanoid25 then
            currentCamera4.CameraSubject = humanoid25
          end
        end

        return
      end
    end,
  })

  Tab:AddSection({ Name = "「 Boombox 」(GAMEPASS!)" })

  musicId = ""

  Tab:AddTextbox({
    Name = "「 Enter Music ID 」",
    Default = "",
    TextDisappear = false,
    Callback = function(value165) musicId = value165 end,
  })

  Tab:AddButton({
    Name = "Play Boombox Music",
    Callback = function()
      if musicId ~= "" then
        args = { "ToolMusicText", musicId }
        replicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent"):FireServer(unpack(args))
      end
    end,
  })

  Tab:AddDropdown({
    Name = "Music For Boombox",
    Options = {
      "PLAYBOI CARTTI - JUMPIN", "Phonk", "Dreaming", "Poland", "Life Styl3", "Porsche?",
      "Pushing Forward", "Universe", "Funk Festa", "Goofy Phonk",
    },
    Callback = function(value166)
      Nigga = ({
        ["PLAYBOI CARTTI - JUMPIN"] = "136089291723510",
        Phonk = "17422173467",
        Dreaming = "92770692696583",
        Poland = "89446012745308",
        ["Life Styl3"] = "106431836746309",
        ["Porsche?"] = "6789012345",
        ["Pushing Forward"] = "134037306729704",
        Universe = "118888943008373",
        ["Funk Festa"] = "103409297553965",
        ["Goofy Phonk"] = "105832154444494",
      })[value166]

      if Nigga then
        args = { "ToolMusicText", Nigga }
        replicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent"):FireServer(unpack(args))
      end
    end,
  })

  Tab:AddSection({ Name = "「 Spam Function 」" })

  Tab:AddToggle({
    Name = "Duplicate Boat",
    Default = false,
    Callback = function(value167)
      toggleState = value167

      if value167 then
        v76 = players
        Player = v76.LocalPlayer
        v45 = Player.Character or Player.CharacterAdded:Wait()
        RootPart = v45:WaitForChild("HumanoidRootPart")
        Humanoid = v45:FindFirstChildOfClass("Humanoid")

        function canoeSpam()
          molestado1 = workspace.WorkspaceCom:FindFirstChild("001_CanoeCloneButton")

          if not molestado1 then
            return
          end

          button = molestado1:FindFirstChild("Button")

          if not button then
            return
          end

          clickDetector = button:FindFirstChild("ClickDetector")

          if not clickDetector then
            return
          end

          while toggleState do
            task.wait()
            RootPart.CFrame = button.CFrame
            task.wait(0.1)
            fireclickdetector(clickDetector)
            task.wait(0.5)
            molestado2 = workspace.WorkspaceCom:FindFirstChild("001_CanoeStorage")

            if molestado2 then
              canoe = molestado2:FindFirstChild("Canoe")

              if canoe and canoe:FindFirstChild("VehicleSeat") then
                local sit4 = Humanoid.Sit

                repeat
                  RootPart.CFrame = canoe.VehicleSeat.CFrame
                    + Vector3.new(0, math.random(-1, 1), 0)

                  task.wait()
                until Humanoid.Sit

                task.wait(0.2)
                RootPart.CFrame = CFrame.new(math.random(-40, 40), 4.549, math.random(-40, 40))
                task.wait(0.2)
                Humanoid.Sit = false
                canoe.Name = "Boattest"
              end
            end
          end
        end

        task.spawn(canoeSpam)
      end
    end,
  })

  OrionLib:Init()
  wait(0)

  for i10 = 1, 100000 do
    updatePlayersList()
    wait(10)
  end

  return
end

OrionLib:Init()
wait(0)

for i11 = 1, 100000 do
  updatePlayersList()
  wait(10)
end
