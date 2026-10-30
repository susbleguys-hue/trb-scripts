local tbl = {}
local tbl2 = {}

local tbl3 = {
    IceSpear = "https://github.com/IdkMyNameLoll/testingthings/raw/refs/heads/main/icespear2.rbxm",
    FireSpear = "https://github.com/IdkMyNameLoll/testingthings/raw/refs/heads/main/icespear.rbxm",
    loadingMobile = "https://github.com/IdkMyNameLoll/testingthings/raw/refs/heads/main/loadermagic.rbxm",
    mobileButtons = "https://github.com/IdkMyNameLoll/testingthings/raw/refs/heads/main/magbytb.rbxm",
    book = "https://github.com/IdkMyNameLoll/testingthings/raw/refs/heads/main/book.rbxm",
}

local tbl4 = {
    fireStuffFade = "https://github.com/IdkMyNameLoll/testingthings/raw/refs/heads/main/fade.mp3",
}

local mainUI = game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI")

if not mainUI then
    _G.magicbookscript412432Enabled = false
    return
end

local captionsCreated

if mainUI.MainFrame:FindFirstChild("CaptionsCreated") then
    captionsCreated = mainUI.MainFrame.CaptionsCreated
else
    captionsCreated = Instance.new("Folder", mainUI.MainFrame)
    captionsCreated.Name = "CaptionsCreated"
end

if _G.magicbookscript412432Enabled ~= false and _G.magicbookscript412432Enabled ~= nil then
    return
end

_G.magicbookscript412432Enabled = true

local function fn(text)
    if not mainUI.MainFrame.Caption:FindFirstChild("Sound") then
        local clone

        if mainUI:FindFirstChild("Initiator") then
            clone = mainUI.Initiator.Main_Game.Reminder.Caption:Clone()
        else
            clone = Instance.new("Sound")
        end

        clone.Parent = mainUI.MainFrame.Caption
        clone.Name = "Sound"
    end

    local clone = mainUI.MainFrame.Caption:Clone()
    mainUI.MainFrame.Caption:FindFirstChild("Sound"):Play()

    for k, child in pairs(captionsCreated:GetChildren()) do
        child.Visible = false
    end

    clone.Parent = captionsCreated
    clone.Text = text
    clone.Visible = true

    spawn(function()
        wait(7)
        game:GetService("TweenService"):Create(clone, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
        wait(3)
        clone:Destroy()
    end)
end

local function fn2(text)
    if not mainUI.MainFrame.Caption:FindFirstChild("Sound") then
        local clone

        if mainUI:FindFirstChild("Initiator") then
            clone = mainUI.Initiator.Main_Game.Reminder.Caption:Clone()
        else
            clone = Instance.new("Sound")
        end

        clone.Parent = mainUI.MainFrame.Caption
        clone.Name = "Sound"
    end

    local clone = mainUI.MainFrame.Caption:Clone()
    mainUI.MainFrame.Caption:FindFirstChild("Sound"):Play()

    for k, child in pairs(captionsCreated:GetChildren()) do
        child.Visible = false
    end

    clone.Parent = captionsCreated
    clone.Text = text
    clone.Visible = true

    spawn(function()
        wait(2)
        game:GetService("TweenService"):Create(clone, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
        wait(3)
        clone:Destroy()
    end)
end

local function fn3()
    if game.GameId == 7253344792 then
        return true
    end
    return false
end

local function fn4(arg)
    writefile("IndexellScripts/Assets/MagicBook/" .. arg .. ".rbxm", game:HttpGet(tbl3[arg]))
end

local function fn5(arg)
    writefile("IndexellScripts/Sounds/" .. arg .. ".mp3", game:HttpGet(tbl4[arg]))
end

local function fn6()
    if not isfolder("IndexellScripts") then
        makefolder("IndexellScripts")
    end

    if not isfolder("IndexellScripts/Sounds") then
        makefolder("IndexellScripts/Sounds")
    end

    if not isfolder("IndexellScripts/Assets") then
        makefolder("IndexellScripts/Assets")
    end

    if not isfolder("IndexellScripts/Assets/MagicBook") then
        makefolder("IndexellScripts/Assets/MagicBook")
    end
end

local function fn7(arg, arg2, arg3)
    for k, v in pairs(tbl) do
        if v.Name == tostring(arg) then
            return v.Object:Clone()
        end
    end

    return nil
end

local function fn8(arg)
    for k, v in pairs(tbl2) do
        if v.Name == tostring(arg) then
            return v.Audio
        end
    end

    return "rbxassetid://0"
end

local function fn9(arg)
    local n = math.floor(#tbl / arg * 100)
    if tonumber(n) == "nan" then
        return 0
    end
    return n
end

local function fn10(arg)
    local n = math.floor(#tbl2 / arg * 100)
    if tonumber(n) == "nan" then
        return 0
    end
    return n
end

local function fn11(arg)
    local n = 0

    for k in pairs(tbl3) do
        n = n + 1
    end

    local v = fn9(n)

    for k in pairs(tbl3) do
        if arg == true then
            fn("Creating Asset: " .. tostring(k) .. " (" .. tostring(v) .. "% Done)")
        end

        fn4(k)
        local v2 = game:GetObjects(getcustomasset("IndexellScripts/Assets/MagicBook/" .. k .. ".rbxm", true))[1]
        table.insert(tbl, {Name = tostring(k), Object = v2})
        v = fn9(n)
    end
end

local function fn12(arg)
    local n = 0

    for k in pairs(tbl4) do
        n = n + 1
    end

    local v = fn10(n)

    for k in pairs(tbl4) do
        if arg == true then
            fn("Creating Audio Asset: " .. tostring(k) .. " (" .. tostring(v) .. "% Done)")
        end

        fn5(k)

        table.insert(tbl2, {
            Name = tostring(k),
            Audio = getcustomasset("IndexellScripts/Sounds/" .. k .. ".mp3", true),
        })

        v = fn10(n)
    end
end

fn("Loading Script..")
fn("Loading Files..")

if fn3() == false then
    fn6()
    fn11(true)
    fn12(true)
end

fn("Loading Other Stuff..")
local str = "Fire Spear"
local flag = false
local flag2 = false
local flag3 = true
local flag4 = false
local UserInputService = game:GetService("UserInputService")
local flag5 = false
local clone = fn3() == true and script._loadingScreenMAGICBOOK:Clone() or fn7("loadingMobile")
local clone2 = fn3() == true and script.magicBookButtons:Clone() or fn7("mobileButtons")

if UserInputService.TouchEnabled then
    flag2 = true
end

local function fn13()
    if str == "Fire Spear" then
        str = "Ice Spear"
    elseif str == "Ice Spear" then
        str = "Fire Spear"
    end

    fn2("Current Spell: " .. tostring(str))
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed == false and flag4 == true and flag == false and flag5 == true and input.KeyCode == Enum.KeyCode.R then
        fn13()
    end
end)

local function fn14(arg)
    if arg == "Fire Spear" then
        local humanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local mouse = game.Players.LocalPlayer:GetMouse()
        local position = humanoidRootPart.Position
        local unit = (mouse.Hit.p - position).unit
        local clone3 = fn3() == true and workspace.Fire:Clone() or fn7("FireSpear")
        clone3.Parent = workspace
        clone3:PivotTo(CFrame.lookAt(position, position + unit))
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = unit * 50
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Parent = clone3.b
        clone3.b.CanCollide = false
        clone3.b.Sound.SoundId = fn8("fireStuffFade")
        game.Debris:AddItem(clone3, 10)
        local flag6 = true
        local connection = nil

        connection = clone3.b.Touched:Connect(function(hit)
            if flag6 == true then
                flag6 = false

                if hit:IsDescendantOf(workspace.CurrentRooms) and hit:IsA("BasePart") then
                    if hit.Parent:IsA("Model") then
                        if workspace.CurrentRooms:FindFirstChild(hit.Parent.Name) then
                            flag6 = true
                        elseif hit.Parent:FindFirstChild("ISTHATTHEBITEOF87") then
                            if hit.Parent.Name == "SeekRig" and hit.Parent.Parent.Name == "SeekMovingNewClone" and not hit.Parent:FindFirstChild("ISTHATTHEBITEOF87") then
                                clone3.b.Anchored = true
                                local explosion = Instance.new("Explosion", workspace)
                                local clone4 = clone3.b.Sound:Clone()
                                local folder = Instance.new("Folder", hit.Parent)
                                explosion.BlastRadius = 0
                                explosion.BlastPressure = 0
                                explosion.Position = clone3.b.Position
                                folder.Name = "ISTHATTHEBITEOF87"
                                clone3:Destroy()

                                for k, descendant in pairs(hit.Parent:GetDescendants()) do
                                    if descendant:IsA("BasePart") then
                                        if descendant.Material ~= Enum.Material.Wood and descendant.Material ~= Enum.Material.WoodPlanks and descendant.Material ~= Enum.Material.Fabric then
                                            if descendant.Material == Enum.Material.DiamondPlate then
                                                descendant.Color = Color3.fromRGB(255, 182, 64)
                                                descendant.Material = Enum.Material.Neon
                                            end
                                        else
                                            descendant.Color = Color3.fromRGB(0, 0, 0)
                                            local fire = Instance.new("Fire", descendant)
                                            fire.Size = 10
                                            fire.Heat = 100

                                            spawn(function()
                                                task.wait(2)
                                                local clone5 = clone4:Clone()
                                                clone5.Parent = descendant
                                                clone5.TimePosition = 0.5
                                                clone5:Play()
                                                game:GetService("TweenService"):Create(descendant, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Transparency = 1}):Play()
                                                task.wait(1)
                                                fire.Enabled = false
                                            end)
                                        end
                                    end
                                end

                                spawn(function()
                                    task.wait(3.5)
                                    hit.Parent:Destroy()
                                end)

                                connection:Disconnect()
                            else
                                flag6 = true
                            end
                        else
                            clone3.b.Anchored = true
                            local explosion = Instance.new("Explosion", workspace)
                            local clone4 = clone3.b.Sound:Clone()
                            local folder = Instance.new("Folder", hit.Parent)
                            explosion.BlastRadius = 0
                            explosion.BlastPressure = 0
                            explosion.Position = clone3.b.Position
                            folder.Name = "ISTHATTHEBITEOF87"
                            clone3:Destroy()

                            for k, descendant in pairs(hit.Parent:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    if descendant.Material ~= Enum.Material.Wood and descendant.Material ~= Enum.Material.WoodPlanks and descendant.Material ~= Enum.Material.Fabric then
                                        if descendant.Material == Enum.Material.DiamondPlate then
                                            descendant.Color = Color3.fromRGB(255, 182, 64)
                                            descendant.Material = Enum.Material.Neon
                                        end
                                    else
                                        descendant.Color = Color3.fromRGB(0, 0, 0)
                                        local fire = Instance.new("Fire", descendant)
                                        fire.Size = 10
                                        fire.Heat = 100

                                        spawn(function()
                                            task.wait(2)
                                            local clone5 = clone4:Clone()
                                            clone5.Parent = descendant
                                            clone5.TimePosition = 0.5
                                            clone5:Play()
                                            game:GetService("TweenService"):Create(descendant, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Transparency = 1}):Play()
                                            task.wait(1)
                                            fire.Enabled = false
                                        end)
                                    end
                                end
                            end

                            spawn(function()
                                task.wait(3.5)
                                hit.Parent:Destroy()
                            end)

                            connection:Disconnect()
                        end
                    else
                        flag6 = true
                    end
                else
                    flag6 = true
                end
            end
        end)
    elseif arg == "Ice Spear" then
        local humanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local mouse = game.Players.LocalPlayer:GetMouse()
        local position = humanoidRootPart.Position
        local unit = (mouse.Hit.p - position).unit
        local clone3 = fn3() == true and workspace.Ice:Clone() or fn7("IceSpear")
        clone3.Parent = workspace
        clone3:PivotTo(CFrame.lookAt(position, position + unit))
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = unit * 50
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Parent = clone3.b
        clone3.b.CanCollide = false
        game.Debris:AddItem(clone3, 10)

        spawn(function()
            task.wait(8)
            clone3:Destroy()
        end)

        local flag6 = true
        local connection = nil

        connection = clone3.b.Touched:Connect(function(hit)
            if flag6 == true then
                flag6 = false

                if hit:IsDescendantOf(workspace.CurrentRooms) and hit:IsA("BasePart") then
                    if hit.Parent:IsA("Model") then
                        if workspace.CurrentRooms:FindFirstChild(hit.Parent.Name) then
                            if hit.Parent.Name == "SeekRig" and hit.Parent.Parent.Name == "SeekMovingNewClone" and not hit.Parent:FindFirstChild("ISTHATTHEBITEOF87") then
                                clone3.b.Anchored = true
                                local clone4 = clone3.b.Sound:Clone()
                                Instance.new("Folder", hit.Parent).Name = "ISTHATTHEBITEOF87"
                                local clone5 = clone4:Clone()
                                clone5.Parent = hit
                                clone5:Play()

                                for k, descendant in pairs(hit.Parent:GetDescendants()) do
                                    if descendant:IsA("BasePart") then
                                        descendant.Color = Color3.fromRGB(0, 208, 255)
                                        descendant.Material = Enum.Material.Ice
                                        descendant.Anchored = true
                                    end
                                end

                                connection:Disconnect()
                            else
                                flag6 = true
                            end
                        elseif hit.Parent:FindFirstChild("ISTHATTHEBITEOF87") then
                            flag6 = true
                        else
                            clone3.b.Anchored = true
                            local clone4 = clone3.b.Sound:Clone()
                            Instance.new("Folder", hit.Parent).Name = "ISTHATTHEBITEOF87"
                            local clone5 = clone4:Clone()
                            clone5.Parent = hit
                            clone5:Play()

                            for k, descendant in pairs(hit.Parent:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    descendant.Color = Color3.fromRGB(0, 208, 255)
                                    descendant.Material = Enum.Material.Ice
                                    descendant.Anchored = true
                                end
                            end

                            connection:Disconnect()
                        end
                    else
                        flag6 = true
                    end
                elseif hit.Name == "Shade" and not hit:FindFirstChild("AFFECTEDSHADE") then
                    Instance.new("Folder", hit).Name = "AFFECTEDSHADE"
                    clone3.b.Anchored = true
                    local clone4 = clone3.b.Sound:Clone()
                    local clone5 = clone4:Clone()
                    clone5.Parent = hit
                    clone5:Play()
                    clone4:Destroy()
                    hit.Color = Color3.fromRGB(0, 208, 255)
                    hit.Material = Enum.Material.Ice
                    hit.Anchored = true
                    connection:Disconnect()
                else
                    flag6 = true
                end
            end
        end)
    end
end

local function fn15()
    if game.Players.LocalPlayer.Character:FindFirstChild("BookM") or game.Players.LocalPlayer.Backpack:FindFirstChild("BookM") then
        return
    end
    flag5 = false
    local clone3 = fn3() == true and game.ReplicatedStorage.BookM:Clone() or fn7("book")
    clone3.Parent = game.Players.LocalPlayer.Backpack

    clone3.Equipped:Connect(function()
        flag5 = true
    end)

    clone3.Unequipped:Connect(function()
        flag5 = false
    end)

    clone3.Activated:Connect(function()
        if flag5 == true then
            fn14(str)
        end
    end)
end

if flag2 == true then
    flag3 = false
    clone.Parent = game.Players.LocalPlayer.PlayerGui
    clone.Enabled = true
    local flag6 = false

    clone.Frame.Confirm.MouseButton1Up:Connect(function()
        if flag6 == false then
            flag6 = true
            flag = true
            clone.Frame.Visible = false
            clone.Sound:Play()
            clone2.Parent = game.Players.LocalPlayer.PlayerGui
            clone2.Enabled = true
            flag3 = true
            task.wait(0.05)
            clone:Destroy()
        end
    end)

    clone.Frame.Decline.MouseButton1Up:Connect(function()
        if flag6 == false then
            flag6 = true
            flag = false
            clone.Frame.Visible = false
            clone.Sound:Play()
            clone2:Destroy()
            flag3 = true
            task.wait(0.05)
            clone:Destroy()
        end
    end)
else
    flag4 = true
end

repeat
    task.wait()
until flag3 == true

if clone2 and flag then
    clone2.SS.MouseButton1Up:Connect(function()
        clone2.SS.Sound:Play()

        if flag5 == true then
            fn13()
        else
            fn("You must have the magic book equipped to change the spell.")
        end
    end)

    clone2.US.Visible = false

    clone2.US.MouseButton1Up:Connect(function()
        clone2.US.Sound:Play()

        if flag5 == true then
            fn14(str)
        end
    end)
end

fn15()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    fn15()
end)

fn("Loaded Script!")
task.wait(1)
fn("Magic Book Idea and original script by Luk3.")
task.wait(3)
fn("This script is scripted by Indexell. And i guess thats all lol (dm indexell_ on discord if there are any errors)")
task.wait(3)
fn("Ty jack for obfuscating this with luraph")
task.wait(1)
fn("creds to TRB for deobfuscating the script")
