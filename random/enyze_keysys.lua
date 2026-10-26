-- Behaviour trace of a MoonVeil script
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 622 statements recorded in 0.33s
-- URLs requested:
--   https://github.com/Etisss/reimagined-giggle/blob/main/enyxe_xyz_200x200.png?raw=true
--   https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/check.png
--   https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/external-link.png
--   https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/key.png
--   https://enyxe.xyz/linkvertise.png
--   https://enyxe.xyz/workink.png
--   https://enyxe.xyz/api/providers
-- non-standard globals touched: gethwid, StatusText, getclipboard, keypress, keyrelease

-- [deobf] folded 0 repeated calls into 0 helper functions and 4 unrolled runs into loops
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local result = gethwid()
local hui = gethui()
local Enyxe = hui:FindFirstChild("Enyxe")
local children = CoreGui:GetChildren()

for i, v in ipairs(children) do
end

local hui2 = gethui()
local children2 = hui2:GetChildren()

for i2, v2 in ipairs(children2) do
end

task.spawn(function()
	task.wait(5)
	local children3 = CoreGui:GetChildren()

	for i3, v3 in ipairs(children3) do
	end

	local hui3 = gethui()
	local children4 = hui3:GetChildren()

	for i4, v4 in ipairs(children4) do
	end

	task.wait(5)
	-- [envlog] the statements above repeat forever (loop)
end)

local Enyxe2 = Instance.new("ScreenGui")
Enyxe2.Name = "Enyxe"
Enyxe2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Enyxe2.ResetOnSpawn = false
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = Enyxe2
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -92)
MainFrame.Size = UDim2.new(0, 350, 0, 184)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(80, 80, 80)
UIStroke.Thickness = 1.5
local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 8)
local MainCloseButton = Instance.new("TextButton")
MainCloseButton.Name = "MainCloseButton"
MainCloseButton.Parent = MainFrame
MainCloseButton.BackgroundColor3 = Color3.fromRGB(24, 26, 32)
MainCloseButton.BorderSizePixel = 0
MainCloseButton.Position = UDim2.new(1, -28, 0, 10)
MainCloseButton.Size = UDim2.new(0, 18, 0, 18)
MainCloseButton.Font = Enum.Font.GothamBold
MainCloseButton.Text = "X"
MainCloseButton.TextColor3 = Color3.fromRGB(160, 160, 170)
MainCloseButton.TextSize = 10
MainCloseButton.ZIndex = 5
local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 4)
UICorner2.Parent = MainCloseButton

MainCloseButton.MouseEnter:Connect(function()
	MainCloseButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
	MainCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

MainCloseButton.MouseLeave:Connect(function()
	MainCloseButton.BackgroundColor3 = Color3.fromRGB(24, 26, 32)
	MainCloseButton.TextColor3 = Color3.fromRGB(160, 160, 170)
end)

MainCloseButton.MouseButton1Click:Connect(function()
	Enyxe2.Enabled = false
end)

local BubbleContainer = Instance.new("Frame")
BubbleContainer.Name = "BubbleContainer"
BubbleContainer.Parent = MainFrame
BubbleContainer.BackgroundTransparency = 1
BubbleContainer.Size = UDim2.new(1, 0, 1, 0)
BubbleContainer.ZIndex = 1

for _, item in ipairs({
	{ xOffset = 24, xOffset2 = 6, xOffset3 = 4 },
	{ xOffset = 26, xOffset2 = 6, xOffset3 = 5 },
	{ xOffset = 15, xOffset2 = 3, xOffset3 = 3 },
	{ xOffset = 14, xOffset2 = 3, xOffset3 = 2 },
	{ xOffset = 25, xOffset2 = 6, xOffset3 = 5 },
}) do
	local Bubble = Instance.new("Frame")
	Bubble.Name = "Bubble"
	Bubble.Parent = BubbleContainer
	Bubble.Size = UDim2.new(0, item.xOffset, 0, item.xOffset)
	Bubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bubble.BackgroundTransparency = 0.72
	Bubble.BorderSizePixel = 0
	Bubble.ZIndex = 1
	local UICorner3 = Instance.new("UICorner")
	UICorner3.CornerRadius = UDim.new(1, 0)
	UICorner3.Parent = Bubble
	local UIStroke2 = Instance.new("UIStroke")
	UIStroke2.Color = Color3.fromRGB(255, 255, 255)
	UIStroke2.Transparency = 0.15
	UIStroke2.Thickness = 1.2
	UIStroke2.Parent = Bubble
	local Glint = Instance.new("Frame")
	Glint.Name = "Glint"
	Glint.Parent = Bubble
	Glint.Size = UDim2.new(0, item.xOffset2, 0, item.xOffset2)
	Glint.Position = UDim2.new(0, item.xOffset3, 0, item.xOffset3)
	Glint.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Glint.BackgroundTransparency = 0.15
	Glint.BorderSizePixel = 0
	Glint.ZIndex = 1
	local UICorner4 = Instance.new("UICorner")
	UICorner4.CornerRadius = UDim.new(1, 0)
	UICorner4.Parent = Glint
end

RunService.RenderStepped:Connect(function(deltaTime)
	-- [envlog] error: Script:2: attempt to compare userdata < number
end)

-- isfile("enyxe_logo.png") -> false
local response = game:HttpGet("https://github.com/Etisss/reimagined-giggle/blob/main/enyxe_xyz_200x200.png?raw=true")
writefile("enyxe_logo.png", response)
-- isfile("enyxe_logo.png") -> false
-- isfile("enyxe_check.png") -> false
local response2 = game:HttpGet("https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/check.png")
writefile("enyxe_check.png", response2)
-- isfile("enyxe_check.png") -> false
-- isfile("enyxe_link.png") -> false
local response3 = game:HttpGet("https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/external-link.png")
writefile("enyxe_link.png", response3)
-- isfile("enyxe_link.png") -> false
-- isfile("enyxe_key.png") -> false
local response4 = game:HttpGet("https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/key.png")
writefile("enyxe_key.png", response4)
-- isfile("enyxe_key.png") -> false
-- isfile("enyxe_lv_v2.png") -> false
local response5 = game:HttpGet("https://enyxe.xyz/linkvertise.png")
writefile("enyxe_lv_v2.png", response5)
-- isfile("enyxe_lv_v2.png") -> false
-- isfile("enyxe_wi_v2.png") -> false
local response6 = game:HttpGet("https://enyxe.xyz/workink.png")
writefile("enyxe_wi_v2.png", response6)
-- isfile("enyxe_wi_v2.png") -> false
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Parent = MainFrame
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0, 14, 0, 10)
Logo.Size = UDim2.new(0, 36, 0, 36)
Logo.Image = "https://github.com/Etisss/reimagined-giggle/blob/main/enyxe_xyz_200x200.png?raw=true"
Logo.ZIndex = 2
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 58, 0, 17)
Title.Size = UDim2.new(0, 180, 0, 22)
Title.Font = Enum.Font.GothamBold
Title.Text = "Enyxe"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 2
local KeyBoxFrame = Instance.new("Frame")
KeyBoxFrame.Name = "KeyBoxFrame"
KeyBoxFrame.Parent = MainFrame
KeyBoxFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyBoxFrame.BorderSizePixel = 0
KeyBoxFrame.Position = UDim2.new(0.5, -150, 0, 58)
KeyBoxFrame.Size = UDim2.new(0, 300, 0, 34)
KeyBoxFrame.ZIndex = 2
local UICorner13 = Instance.new("UICorner")
UICorner13.Parent = KeyBoxFrame
UICorner13.CornerRadius = UDim.new(0, 4)
local UIStroke7 = Instance.new("UIStroke")
UIStroke7.Parent = KeyBoxFrame
UIStroke7.Color = Color3.fromRGB(45, 45, 45)
UIStroke7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
local KeyIcon = Instance.new("ImageLabel")
KeyIcon.Name = "KeyIcon"
KeyIcon.Parent = KeyBoxFrame
KeyIcon.BackgroundTransparency = 1
KeyIcon.Position = UDim2.new(0, 10, 0.5, -8)
KeyIcon.Size = UDim2.new(0, 16, 0, 16)
KeyIcon.Image = "https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/key.png"
KeyIcon.ImageColor3 = Color3.fromRGB(130, 130, 130)
KeyIcon.ScaleType = Enum.ScaleType.Fit
KeyIcon.ZIndex = 3
local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Parent = KeyBoxFrame
KeyBox.BackgroundTransparency = 1
KeyBox.BorderSizePixel = 0
KeyBox.Position = UDim2.new(0, 32, 0, 0)
KeyBox.Size = UDim2.new(1, -84, 1, 0)
KeyBox.Font = Enum.Font.Gotham
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(220, 220, 220)
KeyBox.TextSize = 13
KeyBox.TextXAlignment = Enum.TextXAlignment.Left
KeyBox.ClearTextOnFocus = false
KeyBox.ClipsDescendants = true
KeyBox.ZIndex = 2
local changedSignal = KeyBox:GetPropertyChangedSignal("Text")

changedSignal:Connect(function()
	KeyBox.TextSize = 13
end)

local PasteButton = Instance.new("TextButton")
PasteButton.Name = "PasteButton"
PasteButton.Parent = KeyBoxFrame
PasteButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PasteButton.BorderSizePixel = 0
PasteButton.Position = UDim2.new(1, -48, 0.5, -10)
PasteButton.Size = UDim2.new(0, 42, 0, 20)
PasteButton.Font = Enum.Font.GothamBold
PasteButton.Text = "Paste"
PasteButton.TextColor3 = Color3.fromRGB(220, 220, 220)
PasteButton.TextSize = 10
PasteButton.ZIndex = 3
local UICorner14 = Instance.new("UICorner")
UICorner14.Parent = PasteButton
UICorner14.CornerRadius = UDim.new(0, 4)
local UIStroke8 = Instance.new("UIStroke")
UIStroke8.Parent = PasteButton
UIStroke8.Color = Color3.fromRGB(60, 60, 60)
UIStroke8.Thickness = 1
local VerifyButton = Instance.new("TextButton")
VerifyButton.Name = "VerifyButton"
VerifyButton.Parent = MainFrame
VerifyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.BorderSizePixel = 0
VerifyButton.Position = UDim2.new(0, 25, 0, 104)
VerifyButton.Size = UDim2.new(0, 145, 0, 34)
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.Text = "    Verify Key"
VerifyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
VerifyButton.TextSize = 13
VerifyButton.ZIndex = 2
local UICorner15 = Instance.new("UICorner")
UICorner15.Parent = VerifyButton
UICorner15.CornerRadius = UDim.new(0, 4)
local Icon = Instance.new("ImageLabel")
Icon.Name = "Icon"
Icon.Parent = VerifyButton
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(0, 16, 0.5, -7)
Icon.Size = UDim2.new(0, 14, 0, 14)
Icon.Image = "https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/check.png"
Icon.ImageColor3 = Color3.fromRGB(0, 0, 0)
Icon.ScaleType = Enum.ScaleType.Fit
Icon.ZIndex = 3
local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Parent = MainFrame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Position = UDim2.new(0, 180, 0, 104)
GetKeyButton.Size = UDim2.new(0, 145, 0, 34)
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.Text = "    Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextSize = 13
GetKeyButton.ZIndex = 2
local UICorner16 = Instance.new("UICorner")
UICorner16.Parent = GetKeyButton
UICorner16.CornerRadius = UDim.new(0, 4)
local Icon2 = Instance.new("ImageLabel")
Icon2.Name = "Icon"
Icon2.Parent = GetKeyButton
Icon2.BackgroundTransparency = 1
Icon2.Position = UDim2.new(0, 20, 0.5, -7)
Icon2.Size = UDim2.new(0, 14, 0, 14)
Icon2.Image = "https://raw.githubusercontent.com/Everyx333/LucidePNG/main/parsedIcons/external-link.png"
Icon2.ImageColor3 = Color3.fromRGB(255, 255, 255)
Icon2.ScaleType = Enum.ScaleType.Fit
Icon2.ZIndex = 3
local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Parent = MainFrame
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0, 0, 0, 148)
Status.Size = UDim2.new(1, 0, 0, 22)
Status.Font = Enum.Font.GothamMedium
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(150, 150, 150)
Status.TextSize = 12
Status.ZIndex = 2
local ModalOverlay = Instance.new("Frame")
ModalOverlay.Name = "ModalOverlay"
ModalOverlay.Parent = MainFrame
ModalOverlay.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
ModalOverlay.BackgroundTransparency = 0.02
ModalOverlay.BorderSizePixel = 0
ModalOverlay.Position = UDim2.new(0, 0, 0, 0)
ModalOverlay.Size = UDim2.new(1, 0, 1, 0)
ModalOverlay.Visible = false
ModalOverlay.ZIndex = 10
local UICorner17 = Instance.new("UICorner")
UICorner17.Parent = ModalOverlay
UICorner17.CornerRadius = UDim.new(0, 8)
local ModalHeader = Instance.new("Frame")
ModalHeader.Name = "ModalHeader"
ModalHeader.Parent = ModalOverlay
ModalHeader.BackgroundTransparency = 1
ModalHeader.Position = UDim2.new(0, 14, 0, 8)
ModalHeader.Size = UDim2.new(1, -28, 0, 22)
ModalHeader.ZIndex = 11
local ModalTitle = Instance.new("TextLabel")
ModalTitle.Name = "ModalTitle"
ModalTitle.Parent = ModalHeader
ModalTitle.BackgroundTransparency = 1
ModalTitle.Position = UDim2.new(0, 0, 0, 0)
ModalTitle.Size = UDim2.new(1, -30, 1, 0)
ModalTitle.Font = Enum.Font.GothamBold
ModalTitle.Text = "Select Key Provider"
ModalTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ModalTitle.TextSize = 12
ModalTitle.TextXAlignment = Enum.TextXAlignment.Left
ModalTitle.ZIndex = 11
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = ModalHeader
CloseButton.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -20, 0, 1)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(180, 180, 180)
CloseButton.TextSize = 11
CloseButton.ZIndex = 12
local UICorner18 = Instance.new("UICorner")
UICorner18.Parent = CloseButton
UICorner18.CornerRadius = UDim.new(0, 4)

CloseButton.MouseEnter:Connect(function()
	CloseButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

CloseButton.MouseLeave:Connect(function()
	CloseButton.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
	CloseButton.TextColor3 = Color3.fromRGB(180, 180, 180)
end)

local LVCard = Instance.new("TextButton")
LVCard.Name = "LVCard"
LVCard.Parent = ModalOverlay
LVCard.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
LVCard.BorderSizePixel = 0
LVCard.Position = UDim2.new(0.5, -155, 0, 36)
LVCard.Size = UDim2.new(0, 310, 0, 60)
LVCard.AutoButtonColor = false
LVCard.Text = ""
LVCard.ZIndex = 12
local UICorner19 = Instance.new("UICorner")
UICorner19.Parent = LVCard
UICorner19.CornerRadius = UDim.new(0, 6)
local UIStroke9 = Instance.new("UIStroke")
UIStroke9.Parent = LVCard
UIStroke9.Color = Color3.fromRGB(45, 50, 65)
UIStroke9.Thickness = 1
local Logo2 = Instance.new("ImageLabel")
Logo2.Name = "Logo"
Logo2.Parent = LVCard
Logo2.BackgroundTransparency = 1
Logo2.Position = UDim2.new(0, 10, 0.5, -18)
Logo2.Size = UDim2.new(0, 36, 0, 36)
Logo2.Image = "https://enyxe.xyz/linkvertise.png"
Logo2.ScaleType = Enum.ScaleType.Fit
local lastTitle = Logo2

for _, item in ipairs({
	{ name = "Title", yOffset = 10, yOffset2 = 18, text = "Linkvertise", r = 255, textSize = 13 },
	{ name = "lastTitle", yOffset = 30, yOffset2 = 16, text = "Valid for 24hrs", r = 150, textSize = 11 },
}) do
	local previousTitle = lastTitle
	previousTitle.ZIndex = 13
	local Title2 = Instance.new("TextLabel")
	Title2.Name = item.name
	Title2.Parent = LVCard
	Title2.BackgroundTransparency = 1
	Title2.Position = UDim2.new(0, 54, 0, item.yOffset)
	Title2.Size = UDim2.new(0, 180, 0, item.yOffset2)
	Title2.Font = Enum.Font.GothamBold
	Title2.Text = item.text
	Title2.TextColor3 = Color3.fromRGB(item.r, item.r, item.r)
	Title2.TextSize = item.textSize
	Title2.TextXAlignment = Enum.TextXAlignment.Left
	lastTitle = Title2
end

lastTitle.ZIndex = 13
local Arrow = Instance.new("TextLabel")
Arrow.Name = "Arrow"
Arrow.Parent = LVCard
Arrow.BackgroundTransparency = 1
Arrow.Position = UDim2.new(1, -36, 0.5, -8)
Arrow.Size = UDim2.new(0, 24, 0, 16)
Arrow.Font = Enum.Font.GothamBold
Arrow.Text = "→"
Arrow.TextColor3 = Color3.fromRGB(150, 160, 180)
Arrow.TextSize = 14
Arrow.ZIndex = 13
local WICard = Instance.new("TextButton")
WICard.Name = "WICard"
WICard.Parent = ModalOverlay
WICard.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
WICard.BorderSizePixel = 0
WICard.Position = UDim2.new(0.5, -155, 0, 104)
WICard.Size = UDim2.new(0, 310, 0, 60)
WICard.AutoButtonColor = false
WICard.Text = ""
WICard.ZIndex = 12
local UICorner20 = Instance.new("UICorner")
UICorner20.Parent = WICard
UICorner20.CornerRadius = UDim.new(0, 6)
local UIStroke10 = Instance.new("UIStroke")
UIStroke10.Parent = WICard
UIStroke10.Color = Color3.fromRGB(45, 50, 65)
UIStroke10.Thickness = 1
local Logo3 = Instance.new("ImageLabel")
Logo3.Name = "Logo"
Logo3.Parent = WICard
Logo3.BackgroundTransparency = 1
Logo3.Position = UDim2.new(0, 10, 0.5, -18)
Logo3.Size = UDim2.new(0, 36, 0, 36)
Logo3.Image = "https://enyxe.xyz/workink.png"
Logo3.ScaleType = Enum.ScaleType.Fit
local lastTitle2 = Logo3

for _, item in ipairs({
	{ name = "Title", yOffset = 10, yOffset2 = 18, text = "Work.ink", r = 255, textSize = 13 },
	{ name = "lastTitle", yOffset = 30, yOffset2 = 16, text = "Valid for 24hrs", r = 150, textSize = 11 },
}) do
	local previousTitle2 = lastTitle2
	previousTitle2.ZIndex = 13
	local Title3 = Instance.new("TextLabel")
	Title3.Name = item.name
	Title3.Parent = WICard
	Title3.BackgroundTransparency = 1
	Title3.Position = UDim2.new(0, 54, 0, item.yOffset)
	Title3.Size = UDim2.new(0, 180, 0, item.yOffset2)
	Title3.Font = Enum.Font.GothamBold
	Title3.Text = item.text
	Title3.TextColor3 = Color3.fromRGB(item.r, item.r, item.r)
	Title3.TextSize = item.textSize
	Title3.TextXAlignment = Enum.TextXAlignment.Left
	lastTitle2 = Title3
end

lastTitle2.ZIndex = 13
local Arrow2 = Instance.new("TextLabel")
Arrow2.Name = "Arrow"
Arrow2.Parent = WICard
Arrow2.BackgroundTransparency = 1
Arrow2.Position = UDim2.new(1, -36, 0.5, -8)
Arrow2.Size = UDim2.new(0, 24, 0, 16)
Arrow2.Font = Enum.Font.GothamBold
Arrow2.Text = "→"
Arrow2.TextColor3 = Color3.fromRGB(150, 160, 180)
Arrow2.TextSize = 14
Arrow2.ZIndex = 13

task.spawn(function()
	local response7 = request({
	Headers = { Accept = "application/json", ["Enyxe-HWID"] = result },
	Method = "GET",
	Url = "https://enyxe.xyz/api/providers"
})

	HttpService:JSONDecode(response7.Body)
end)

LVCard.MouseEnter:Connect(function()
end)

LVCard.MouseLeave:Connect(function()
end)

WICard.MouseEnter:Connect(function()
end)

WICard.MouseLeave:Connect(function()
end)

CloseButton.MouseButton1Click:Connect(function()
	ModalOverlay.Visible = false
end)

for _, textButton in ipairs({
	LVCard, WICard,
}) do
	textButton.MouseButton1Click:Connect(function()
		task.spawn(function()
			local response8 = request({
		Headers = { Accept = "application/json", ["Enyxe-HWID"] = result },
		Method = "GET",
		Url = "https://enyxe.xyz/api/providers"
	})

			HttpService:JSONDecode(response8.Body)
		end)
	end)
end

local thread = task.spawn(function()
	task.wait(30)
	task.wait(30)
	-- [envlog] the statements above repeat forever (loop)
end)

getgenv()._EnyxeHeartbeatThread = thread

getgenv()._EnyxeCancelHeartbeat = function()
end

VerifyButton.MouseButton1Click:Connect(function()
	task.spawn(function()
		Status.Text = "Invalid key"
		Status.TextColor3 = Color3.fromRGB(255, 100, 100)
	end)
end)

VerifyButton.MouseEnter:Connect(function()
	VerifyButton.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
end)

VerifyButton.MouseLeave:Connect(function()
	VerifyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
end)

GetKeyButton.MouseButton1Click:Connect(function()
	task.spawn(function()
		local response10 = request({
	Headers = { Accept = "application/json", ["Enyxe-HWID"] = result },
	Method = "GET",
	Url = "https://enyxe.xyz/api/providers"
})

		HttpService:JSONDecode(response10.Body)
	end)

	ModalOverlay.Visible = true
end)

GetKeyButton.MouseEnter:Connect(function()
	GetKeyButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
end)

GetKeyButton.MouseLeave:Connect(function()
	GetKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

PasteButton.MouseButton1Click:Connect(function()
	getclipboard()
	KeyBox:CaptureFocus()
	keypress(17)
	keypress(86)
	task.wait(0.03)
	keyrelease(86)
	keyrelease(17)
	task.wait(0.05)
	Status.Text = "Press Ctrl+V to paste"
	Status.TextColor3 = Color3.fromRGB(250, 204, 21)
end)

PasteButton.MouseEnter:Connect(function()
	PasteButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
end)

PasteButton.MouseLeave:Connect(function()
	PasteButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

-- isfile("enykey.txt") -> false
local hui4 = gethui()
Enyxe2.Parent = hui4
