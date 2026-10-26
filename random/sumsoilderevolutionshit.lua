local runService = game:GetService("RunService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

Window = Rayfield:CreateWindow({
  Name = "+1 Soldier Evolution",
  LoadingTitle = "KhSaeedHub",
  LoadingSubtitle = "Please, Join discord for more scripts!",
  ConfigurationSaving = { Enabled = true, FolderName = KhSaeedHub, FileName = "KhSaeedHub" },
  Discord = { Enabled = true, Invite = "37xqzu6eBF", RememberJoins = true },
  KeySystem = false,
  KeySettings = {
    Title = "KhSaeedHub",
    Subtitle = "Thank you for your support!",
    Note = "https://khsaeedhub.vercel.app/",
    FileName = "KhSaeedHub",
    SaveKey = true,
    GrabKeyFromSite = true,
    Key = { "https://khsaeedhub.vercel.app/api/key/raw/" },
  },
})

Tab = Window:CreateTab("Main")
Section = Tab:CreateSection("Train 🏃")

Button = Tab:CreateButton({
  Name = "Best Training Dummy 🎯",
  Callback = function() getDummy() end,
})

Toggle = Tab:CreateToggle({
  Name = "Auto Train 🖱️",
  CurrentValue = false,
  Flag = "Toggle",
  Callback = function(value)
    Click = value

    ClickHeart = runService.Heartbeat:Connect(function()
      if Click and players.LocalPlayer.Character then
        getClick()
      else
        ClickHeart:Disconnect()
      end
    end)
  end,
})

Toggle = Tab:CreateToggle({
  Name = "Auto Win 🏆",
  CurrentValue = false,
  Flag = "Toggle",
  Callback = function(value2)
    Win = value2

    WinHeart = runService.Heartbeat:Connect(function()
      if Win and players.LocalPlayer.Character then
        getWin()
      else
        WinHeart:Disconnect()
      end
    end)
  end,
})

Section = Tab:CreateSection("Rebirth ♻️")
Button = Tab:CreateButton({ Name = "Rebirth", Callback = function() getRebirth() end })

Toggle = Tab:CreateToggle({
  Name = "Auto Rebirth",
  CurrentValue = false,
  Flag = "Toggle",
  Callback = function(value3)
    Rebirth = value3

    RebirthHeart = runService.Heartbeat:Connect(function()
      if Rebirth and players.LocalPlayer.Character then
        getRebirth()
      else
        RebirthHeart:Disconnect()
      end
    end)
  end,
})

Section = Tab:CreateSection("")
Section = Tab:CreateSection("")

Tab = Window:CreateTab("🎃")
Section = Tab:CreateSection("Equip 🐈")

Button = Tab:CreateButton({
  Name = "Equip Best Pets",
  Callback = function()
    if not replicatedStorage:FindFirstChild("Packets") then
      return
    end

    require(ReplicatedStorage.Packets).EquipBestPets:Fire()
  end,
})

Section = Tab:CreateSection("Hatch 👻")
Section = Tab:CreateSection("Halloween World 🕸️")

Button = Tab:CreateButton({
  Name = "Halloween LootBox (2.5K 🍬)",
  Callback = function() getHatch("Halloween Lootbox") end,
})

Button = Tab:CreateButton({
  Name = "Halloween Egg (500 🍬)",
  Callback = function() getHatch("Halloween Egg") end,
})

Section = Tab:CreateSection("")
Section = Tab:CreateSection("🕷️")

Tab = Window:CreateTab("Hatch")
Section = Tab:CreateSection("Equip 🐈")

Button = Tab:CreateButton({
  Name = "Equip Best Pets",
  Callback = function()
    if not replicatedStorage:FindFirstChild("Packets") then
      return
    end

    require(ReplicatedStorage.Packets).EquipBestPets:Fire()
  end,
})

Section = Tab:CreateSection("Hatch 🐣")
Section = Tab:CreateSection("World 4")

Button = Tab:CreateButton({
  Name = "Shipwreck Egg (12.8T)",
  Callback = function() getHatch("Shipwreck Egg") end,
})

Button = Tab:CreateButton({
  Name = "Trench Egg (2.56T)",
  Callback = function() getHatch("Trench Egg") end,
})

Button = Tab:CreateButton({
  Name = "Shell Egg (512B)",
  Callback = function() getHatch("Shell Egg") end,
})

Button = Tab:CreateButton({
  Name = "Coral Egg (77B)",
  Callback = function() getHatch("Coral Egg") end,
})

Section = Tab:CreateSection("World 3")

Button = Tab:CreateButton({
  Name = "Robot Egg (25B)",
  Callback = function() getHatch("Robot Egg") end,
})

Button = Tab:CreateButton({
  Name = "Meteor Egg (5B)",
  Callback = function() getHatch("Meteor Egg") end,
})

Button = Tab:CreateButton({
  Name = "Desert Egg (1B)",
  Callback = function() getHatch("Desert Egg") end,
})

Button = Tab:CreateButton({
  Name = "Farm Egg (150M)",
  Callback = function() getHatch("Farm Egg") end,
})

Section = Tab:CreateSection("World 2")

Button = Tab:CreateButton({
  Name = "Anime Egg (50M)",
  Callback = function() getHatch("Anime Egg") end,
})

Button = Tab:CreateButton({
  Name = "Water Egg (10M)",
  Callback = function() getHatch("Water Egg") end,
})

Button = Tab:CreateButton({
  Name = "Crystal Egg (2M)",
  Callback = function() getHatch("Crystal Egg") end,
})

Button = Tab:CreateButton({
  Name = "Ninja Egg (300K)",
  Callback = function() getHatch("Ninja Egg") end,
})

Section = Tab:CreateSection("World 1")

Button = Tab:CreateButton({
  Name = "Ice Egg (15K)",
  Callback = function() getHatch("Ice Egg") end,
})

Button = Tab:CreateButton({
  Name = "Cactus Egg (1.5K)",
  Callback = function() getHatch("Cactus Egg") end,
})

Button = Tab:CreateButton({
  Name = "Basket Egg (150)",
  Callback = function() getHatch("Basket Egg") end,
})

Button = Tab:CreateButton({
  Name = "Basic Egg (10)",
  Callback = function() getHatch("Basic Egg") end,
})

Section = Tab:CreateSection("")
Section = Tab:CreateSection("")

Tab = Window:CreateTab("Misc")
Section = Tab:CreateSection("Spin 🔮")
Button = Tab:CreateButton({ Name = "Spin Wheel", Callback = function() getSpin() end })
Section = Tab:CreateSection("Time Reward 🎁")

Button = Tab:CreateButton({
  Name = "Claim Next Time Reward",
  Callback = function() getReward() end,
})

Toggle = Tab:CreateToggle({
  Name = "Auto Claim Time Reward",
  CurrentValue = false,
  Flag = "Toggle",
  Callback = function(value4)
    Reward = value4

    RewardHeart = runService.Heartbeat:Connect(function()
      if Reward and players.LocalPlayer.Character then
        getReward()
      else
        RewardHeart:Disconnect()
      end
    end)
  end,
})

Section = Tab:CreateSection("")
Section = Tab:CreateSection("")

Tab = Window:CreateTab("Credits", 14848261712)
Section = Tab:CreateSection("Credits to: KhSaeedHub")

Button = Tab:CreateButton({
  Name = "RScripts Profile",
  Callback = function()
    setclipboard("https://rscripts.net/@KhSaeed90")

    Rayfield:Notify({
      Title = "Link is copied",
      Content = "Check RScripts profile page for more Scripts!",
      Duration = 5,
      Image = 14848261712,
    })
  end,
})

Button = Tab:CreateButton({
  Name = "Scriptblox Profile",
  Callback = function()
    setclipboard("https://scriptblox.com/u/KhSaeed90")

    Rayfield:Notify({
      Title = "Link is copied",
      Content = "Check ScriptBlox profile page for more Scripts!",
      Duration = 5,
      Image = 14848261712,
    })
  end,
})

Button = Tab:CreateButton({
  Name = "Discord Server",
  Callback = function()
    setclipboard("https://controlc.com/5572471c")

    Rayfield:Notify({
      Title = "Link is copied",
      Content = "Join discord server for more Scripts!",
      Duration = 5,
      Image = 14848261712,
    })
  end,
})

function getClick()
  if not replicatedStorage:FindFirstChild("Packets") then
    return
  end

  require(ReplicatedStorage.Packets).PunchRequest:Fire()
end

function getRebirth()
  if not replicatedStorage:FindFirstChild("Packets") then
    return
  end

  if not players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") then
    return
  end

  Progress = players.LocalPlayer.PlayerGui.MainUI.Frames.Rebirth.Bar.Progress

  if Progress.Size.X.Scale < 1 then
    return
  end

  require(ReplicatedStorage.Packets).RebirthRequest:Fire()
end

function getHatch(p1)
  if not replicatedStorage:FindFirstChild("Packets") then
    return
  end

  require(ReplicatedStorage.Packets).HatchEgg:Fire(p1, true)
end

function getSpin()
  if not replicatedStorage:FindFirstChild("Packets") then
    return
  end

  if players.LocalPlayer:GetAttribute("Spins") <= 0 then
    return
  end

  require(ReplicatedStorage.Packets).WheelSpin:Fire()
end

function getTravel(p2)
  if not replicatedStorage:FindFirstChild("Packets") then
    return
  end

  require(replicatedStorage.Packets).WorldTravel:Fire(p2)
end

function getReward()
  if not replicatedStorage:FindFirstChild("Packets") then
    return
  end

  if not players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") then
    return
  end

  if not players.LocalPlayer.PlayerGui.MainUI.Holder.PlaytimeRewards.NotificationFrame.Visible then
    return
  end

  for index, value5 in ipairs(players.LocalPlayer.PlayerGui.MainUI.Frames.PlaytimeRewards.Holder:GetChildren()) do
    if not value5.Name:find("Tier") then
    else
      require(ReplicatedStorage.Packets).ClaimFreeReward:Fire(
        "claim", tonumber(value5.Name:match("%d+"))
      )
    end
  end
end

function getDummy()
  target = nil

  for index2, value6 in ipairs(workspace:GetDescendants()) do
    if not value6:GetAttribute("RebirthsRequired") then
    elseif value6:FindFirstChild("Status", true)
      and value6:FindFirstChild("Status", true).Text == "Locked" then
    else
      local v1 = game

      if value6:GetAttribute("RebirthsRequired")
        > tonumber(v1:GetService("Players").LocalPlayer.PlayerGui.MainUI.Holder.BottomSideFrame.BottomLeft.Rebirths.Amount.Text) then
      else
        local v2 = not target
        local v3 = v2

        if not v2 then
          local v4 = target
          v3 = value6:GetAttribute("ExpMult") > v4:GetAttribute("ExpMult")
        end

        if v3 then
          target = value6
        end
      end
    end
  end

  if not target then
    return
  else
    local character = players.LocalPlayer.Character
    local v5 = target
    character:PivotTo(CFrame.new(v5:GetPivot().Position + Vector3.new(0, 5, 0)))
    return
  end
end

function getWin()
  if not players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
    return
  elseif not replicatedStorage:FindFirstChild("SharedData") then
    return
  else
    local v6 = game
    local v7 = game
    local v8 = game
    World = require(v6:GetService("ReplicatedStorage").SharedData.WorldConfig).StageFolder(require(v7:GetService("ReplicatedStorage").SharedData.WorldConfig).Of(v8:GetService("Players").LocalPlayer))
    Next = nil
    Previous = nil

    if not (replicatedStorage:FindFirstChild("SharedData")
      and replicatedStorage.SharedData:FindFirstChild("WorldConfig")) then
      return
    else
      for index3, value7 in ipairs(World:GetChildren()) do
        if not (value7:FindFirstChild("Entrance") and value7:FindFirstChild("Exit")) then
        else
          if value7:FindFirstChild("Exit").CanCollide then
            if not Next
              or value7.Entrance:GetAttribute("Stage") < Next.Entrance:GetAttribute("Stage") then
              Next = value7
            end
          end

          if not value7:FindFirstChild("Exit").CanCollide then
            if not Previous
              or value7.Entrance:GetAttribute("Stage") > Previous.Entrance:GetAttribute("Stage") then
              Previous = value7
            end
          end
        end
      end

      if Next then
        players.LocalPlayer.Character.Humanoid:MoveTo(Next.EnemySpawn:GetPivot().Position)
      elseif Previous then
        players.LocalPlayer.Character.Humanoid:MoveTo(Previous.WinPads.Normal:GetPivot().Position)
      end

      local v9 = game
      local v10 = game

      if v9:GetService("Players").LocalPlayer.Character.Humanoid.Health
        <= v10:GetService("Players").LocalPlayer.Character.Humanoid.MaxHealth * 0.75 then
        if not Previous then
          return
        end

        local getPivot = Previous.Exit:GetPivot()
        local character2 = players.LocalPlayer.Character

        if (getPivot.Position - character2:GetPivot().Position).Magnitude < 100 then
          players.LocalPlayer.Character:MoveTo(Previous.WinPads.Normal:GetPivot().Position)
        end

        return
      end

      return
    end
  end
end
