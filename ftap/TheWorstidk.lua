-- t.me/scriptreconstruct

while not game:IsLoaded() do
	task.wait()
end
if game.PlaceId ~= 6961824067 then
	task.wait(9e9)
end
game.Players.LocalPlayer:WaitForChild("IsHeld", 9e9)
game:GetService("ReplicatedStorage"):WaitForChild("GrabEvents", 9e9)
local tbl = { Genv = getgenv() }
tbl.Conns = tbl.Conns or {}
tbl.StartTime = tick()
tbl.TheWorstULogger = nil
tbl.TheWorstPrints = {
	"\n",
	" _____ _        __        __             _     _   _       _   _ ",
	"|_   _| |__   __\\ \\      / /__  _ __ ___| |_  | | | |_   _| | | |",
	"  | | | '_ \\ / _ \\ \\ /\\ / / _ \\| '__/ __| __| | |_| \\ \\ / / |_| |",
	"  | | | | | |  __/\\ V  V / (_) | |  \\__ \\ |_  |  _  |\\ V /|  _  |",
	"  |_| |_| |_|\\___| \\_/\\_/ \\___/|_|  |___/\\__| |_| |_| \\_/ |_| |_|",
	"\n",
}
print(tbl.TheWorstPrints[1])
print(tbl.TheWorstPrints[2])
local tbl2 = {
	Players = game:GetService("Players"),
	UIS = game:GetService("UserInputService"),
	ReplicatedS = game:GetService("ReplicatedStorage"),
	RunS = game:GetService("RunService"),
	CoreGui = game:GetService("CoreGui"),
	StarterGui = game:GetService("StarterGui"),
	Http = game:GetService("HttpService"),
	TweenS = game:GetService("TweenService"),
	ChatS = game:GetService("TextChatService"),
	TPS = game:GetService("TeleportService"),
}
local localPlayer = game.Players.LocalPlayer
getgenv().UI = { Orion = nil, Window = nil, Tabs = {}, Sect = {}, Elm = {} }
local tbl3 = {
	Mouse1 = Enum.UserInputType.MouseButton1,
	Mouse2 = Enum.UserInputType.MouseButton2,
	Mouse3 = Enum.UserInputType.MouseButton3,
	MouseWheel = Enum.UserInputType.MouseWheel,
	W = Enum.KeyCode.W,
	A = Enum.KeyCode.A,
	S = Enum.KeyCode.S,
	D = Enum.KeyCode.D,
	Space = Enum.KeyCode.Space,
	Touch = Enum.UserInputType.Touch,
}
local tbl4 = {
	Inf = math.huge,
	VectorInf = Vector3.new(math.huge, math.huge, math.huge),
	VectorZero = Vector3.zero,
	Kicks = 0,
	ESPPCLDTransparency = 0.8,
	ESPPCLDColor = Color3.fromRGB(0, 0, 0),
	ESPStickyColorOutline = Color3.fromRGB(0, 0, 0),
	ESPStickyColorFill = Color3.fromRGB(0, 0, 0),
	ESPStickyTransparencyOutline = 0,
	ESPStickyTransparencyFill = 0,
	ESPPlayersColorOutline = Color3.fromRGB(0, 0, 0),
	ESPPlayersTransparencyOutline = 0,
	ESPPlayersColorFill = Color3.fromRGB(0, 0, 0),
	ESPPlayersTransparencyFill = 1,
	Lerp = 0.15,
	Sensivity = 0.15,
	Max = 85,
	Offset = Vector3.new(0, 1.6, 0),
	ThirdPersonOldValue = false,
	PCLDS = {},
	UnusedPCLDS = {},
	PlayersESP = {},
	StickyParts = {},
	TargetPlayers = {},
	BlobmanPlayers = {},
	ToysExplode = {},
	PartsToTouch = {},
	PlayersLagging = {},
	ReadfileESP = {},
	SelectedPlayer = "",
	OwnershipMode = "Solo Faster",
	TrainSeatNum = 0,
	LastGucci = "Blob",
	SpawnedGucci = false,
	MakingGucci = false,
	IsRagdollingForGucci = false,
	SpawningGucci = false,
	FigurePlayers = {},
	FigureRadius = 1,
	FigureRotationSpeed = 0,
	SelectedPos = "Holding",
	FG = {
		HoldPosX = 0,
		HoldRotX = 0,
		HoldPosY = 0,
		HoldRotY = 0,
		HoldPosZ = -5,
		HoldRotZ = 0,
		LArmPosX = 0,
		LArmRotX = 0,
		LArmPosY = 0,
		LArmRotY = 0,
		LArmPosZ = 0,
		LArmRotZ = 0,
		RArmPosX = 0,
		RArmRotX = 0,
		RArmPosY = 0,
		RArmRotY = 0,
		RArmPosZ = 0,
		RArmRotZ = 0,
		LLegPosX = 0,
		LLegRotX = 0,
		LLegPosY = 0,
		LLegRotY = 0,
		LLegPosZ = 0,
		LLegRotZ = 0,
		RLegPosX = 0,
		RLegRotX = 0,
		RLegPosY = 0,
		RLegRotY = 0,
		RLegPosZ = 0,
		RLegRotZ = 0,
		HeadPosX = 0,
		HeadRotX = 0,
		HeadPosY = 0,
		HeadRotY = 0,
		HeadPosZ = 0,
		HeadRotZ = 0,
	},
	FGVals = {
		HoldingPosX = "HoldPosX",
		HoldingRotX = "HoldRotX",
		HoldingPosY = "HoldPosY",
		HoldingRotY = "HoldRotY",
		HoldingPosZ = "HoldPosZ",
		HoldingRotZ = "HoldRotZ",
		["Left armPosX"] = "LArmPosX",
		["Left armRotX"] = "LArmRotX",
		["Left armPosY"] = "LArmPosY",
		["Left armRotY"] = "LArmRotY",
		["Left armPosZ"] = "LArmPosZ",
		["Left armRotZ"] = "LArmRotZ",
		["Right armPosX"] = "RArmPosX",
		["Right armRotX"] = "RArmRotX",
		["Right armPosY"] = "RArmPosY",
		["Right armRotY"] = "RArmRotY",
		["Right armPosZ"] = "RArmPosZ",
		["Right armRotZ"] = "RArmRotZ",
		["Left legPosX"] = "LLegPosX",
		["Left legRotX"] = "LLegRotX",
		["Left legPosY"] = "LLegPosY",
		["Left legRotY"] = "LLegRotY",
		["Left legPosZ"] = "LLegPosZ",
		["Left legRotZ"] = "LLegRotZ",
		["Right legPosX"] = "RLegPosX",
		["Right legRotX"] = "RLegRotX",
		["Right legPosY"] = "RLegPosY",
		["Right legRotY"] = "RLegRotY",
		["Right legPosZ"] = "RLegPosZ",
		["Right legRotZ"] = "RLegRotZ",
		HeadPosX = "HeadPosX",
		HeadRotX = "HeadRotX",
		HeadPosY = "HeadPosY",
		HeadRotY = "HeadRotY",
		HeadPosZ = "HeadPosZ",
		HeadRotZ = "HeadRotZ",
	},
	FigureName = "",
	PacketsScript = {
		TheWorst = { "FLOPPA LOVES YOU" },
		["SRV9 or TheWorstCrack or other skid"] = { "Balls" },
		Mercury = { "❤️😘", "aaaaaaaaaaaa" },
		["Funny big packet"] = { "😂😂😂😂🤣🤣🤣🤣" },
		HammaM = { "🐀🐛", "MISHA LUV PDD" },
		["RIP Hub"] = { ":joy:" },
		["Polar Hub"] = { "polarthebest" },
		["Ragalic / Neolose"] = { "sososososo" },
	},
}
local tbl5 = {
	Cam = workspace.CurrentCamera,
	Char = nil,
	Root = nil,
	Head = nil,
	Torso = nil,
	Hum = nil,
	Me = tbl2.Players.LocalPlayer,
	Mouse = localPlayer:GetMouse(),
	MyToys = workspace:WaitForChild(localPlayer.Name .. "SpawnedInToys"),
	PlayerScripts = localPlayer.PlayerScripts,
	PlayerGui = localPlayer.PlayerGui,
	BeamMove = localPlayer.PlayerScripts.CharacterAndBeamMove,
	Menu = localPlayer.PlayerGui.MenuGui.Menu,
}
local tbl6 = {
	SpawnToyEvent = tbl2.ReplicatedS:WaitForChild("MenuToys", 9e9):WaitForChild("SpawnToyRemoteFunction", 9e9),
	DestroyToyEvent = tbl2.ReplicatedS:WaitForChild("MenuToys", 9e9):WaitForChild("DestroyToy", 9e9),
	RagdollEvent = tbl2.ReplicatedS:WaitForChild("CharacterEvents", 9e9):WaitForChild("RagdollRemote", 9e9),
	SetNetworkOwnerEvent = tbl2.ReplicatedS:WaitForChild("GrabEvents", 9e9):WaitForChild("SetNetworkOwner", 9e9),
	StruggleEvent = tbl2.ReplicatedS:WaitForChild("CharacterEvents", 9e9):WaitForChild("Struggle", 9e9),
	ExtendLineEvent = tbl2.ReplicatedS:WaitForChild("GrabEvents", 9e9):WaitForChild("ExtendGrabLine", 9e9),
	CreateLineEvent = tbl2.ReplicatedS:WaitForChild("GrabEvents", 9e9):WaitForChild("CreateGrabLine", 9e9),
	DestroyLineEvent = tbl2.ReplicatedS:WaitForChild("GrabEvents", 9e9):WaitForChild("DestroyGrabLine", 9e9),
	StickyPartEvent = tbl2.ReplicatedS:WaitForChild("PlayerEvents", 9e9):WaitForChild("StickyPartEvent", 9e9),
	BuyToyEvent = tbl2.ReplicatedS:WaitForChild("MenuToys", 9e9):WaitForChild("BuyToyRemoteFunction", 9e9),
	UseFoodEvent = tbl2.ReplicatedS:WaitForChild("HoldEvents", 9e9):WaitForChild("Use", 9e9),
	ACEvent = tbl2.ReplicatedS:WaitForChild("GameCorrectionEvents"):WaitForChild("GameCorrectionsNotify", 9e9),
	EndGrabEvent = tbl2.ReplicatedS:WaitForChild("GrabEvents", 9e9):WaitForChild("EndGrabEarly", 9e9),
	UpdateLineColorEvent = tbl2.ReplicatedS:WaitForChild("DataEvents", 9e9):WaitForChild("UpdateLineColorsEvent", 9e9),
}
local tbl7 = {}
local tbl8 = {}
print(tbl.TheWorstPrints[3])
if not isfolder("TheWorstSaves") then
	makefolder("TheWorstSaves")
end
if not isfolder("TheWorstSaves/FTAP") then
	makefolder("TheWorstSaves/FTAP")
end
if not isfolder("TheWorstSaves/FTAP/Figures") then
	makefolder("TheWorstSaves/FTAP/Figures")
end
if not isfolder("TheWorstSaves/FTAP/Plugins") then
	makefolder("TheWorstSaves/FTAP/Plugins")
end
if not isfolder("TheWorstSaves/FTAP/Plugins/Plugins") then
	makefolder("TheWorstSaves/FTAP/Plugins/Plugins")
end
if not isfile("TheWorstSaves/FTAP/Plugins/Autoload.json") then
	writefile("TheWorstSaves/FTAP/Plugins/Autoload.json", "{}")
end
if readfile("TheWorstSaves/FTAP/Plugins/Autoload.json") == "" then
	writefile("TheWorstSaves/FTAP/Plugins/Autoload.json", "{}")
end
if not isfile("TheWorstSaves/FTAP/ESPSettings.json") then
	writefile("TheWorstSaves/FTAP/ESPSettings.json", tbl2.Http:JSONEncode({
		PCLDTransparency = 0.8,
		PCLDColor = Color3.fromRGB(0, 0, 0):ToHex(),
		StickyColorOutline = Color3.fromRGB(0, 0, 0):ToHex(),
		StickyColorFill = Color3.fromRGB(0, 0, 0):ToHex(),
		StickyTransparencyOutline = 0,
		StickyTransparencyFill = 0,
		PlayersColorOutline = Color3.fromRGB(0, 0, 0):ToHex(),
		PlayersTransparencyOutline = 0,
		PlayersColorFill = Color3.fromRGB(0, 0, 0):ToHex(),
		PlayersTransparencyFill = 1,
	}))
end
if not isfile("TheWorstSaves/FTAP/NotifySettings.json") then
	writefile("TheWorstSaves/FTAP/NotifySettings.json", tbl2.Http:JSONEncode({ SoundID = "96867813755421", SoundVolume = 1 }))
end
if not isfile("TheWorstSaves/FTAP/BlackholeURL.txt") then
	writefile("TheWorstSaves/FTAP/BlackholeURL.txt", "")
end
tbl4.ReadfileESP = tbl2.Http:JSONDecode(readfile("TheWorstSaves/FTAP/ESPSettings.json"))
tbl4.ReadfileSound = tbl2.Http:JSONDecode(readfile("TheWorstSaves/FTAP/NotifySettings.json"))
isnetworkowner = function(arg)
	local assemblyRootPart = arg.AssemblyRootPart
	if assemblyRootPart then
		return not assemblyRootPart.Anchored and assemblyRootPart.ReceiveAge == 0
	end
end
firetouchinterest = function(arg, arg2)
	local position = arg.Position
	arg.Position = arg2.Position
	task.wait()
	arg.Position = position
end
tbl8.FindWaitChild = function(arg, arg2, arg3)
	return arg:FindFirstChild(arg2) or arg:WaitForChild(arg2, arg3)
end
tbl8.GetChar = function(arg)
	return arg.Character or arg.CharacterAdded:Wait()
end
tbl8.GetRoot = function(arg)
	return tbl8.FindWaitChild(arg, "HumanoidRootPart", 5)
end
tbl8.GetHead = function(arg)
	return tbl8.FindWaitChild(arg, "Head", 5)
end
tbl8.GetTorso = function(arg)
	return tbl8.FindWaitChild(arg, "Torso", 5)
end
tbl8.GetHum = function(arg)
	return tbl8.FindWaitChild(arg, "Humanoid", 5)
end
tbl8.GetMagnitude = function(arg, arg2)
	if arg and arg2 then
		return vector.magnitude(arg.Position - arg2.Position)
	end
	return nil
end
tbl8.GetPlot = function()
	local v
	for i = 1, 5 do
		local v2 = workspace.Plots["Plot" .. i]
		local children = v2:FindFirstChild("PlotSign"):FindFirstChild("ThisPlotsOwners"):GetChildren()
		for i2 = 1, #children do
			if children[i2].Value == localPlayer.Name then
				return v2.Name
			end
		end
		local children2 = v:GetChildren()
		for i2 = 1, #children2 do
			local v3 = children2[i2]
			if v3.Name ~= "Sign" then
				continue
			end
			local frame = v3.Screen.SurfaceGui.Frame
			local text = frame.PlayerDisplayName.Text
			local text2 = frame.PlayerRole.Text
			if text == "ZEVEREUS" then
				continue
			end
			if text == localPlayer.DisplayName and text2 ~= "Requester" then
				return v2.Name
			end
		end
	end
	return nil
end
tbl8.GetAllToys = function(arg)
	local tbl9 = {}
	local tbl10 = {
		"Balloons",
		"Cave",
		"Cubes",
		"Drawers",
		"Farm",
		"Food",
		"Furniture",
		"Glass Boxes",
		"Ladders",
		"Large Animals",
		"Lincoln Planks",
		"Music",
		"NOT New",
		"Other",
		"Pallets",
		"Robloxians",
		"Rollers",
	}
	for _, v in tbl2.Players:GetPlayers() do
		for _, v2 in workspace[v.Name .. "SpawnedInToys"]:GetChildren() do
			if v2:IsA("Model") then
				tbl9[#tbl9 + 1] = v2
			end
		end
	end
	if arg then
		for i = 1, 5 do
			for _, v in workspace.PlotItems["Plot" .. i]:GetChildren() do
				if v:IsA("Model") then
					tbl9[#tbl9 + 1] = v
				end
			end
		end
	end
	for _, v in tbl10, nil, nil do
		for _, v2 in workspace[v]:GetChildren() do
			if not (v2.Name == "SpawningPlatform" or v2.Name == "StandHere") then
				if v2:IsA("Model") then
					tbl9[#tbl9 + 1] = v2
				end
			end
		end
	end
	return tbl9
end
tbl8.GetSizeMB = function(arg)
	return math.round(arg / 1048576 * 1000) / 1000
end
tbl8.GetScriptByString = function(arg)
	local str = "Unknown"
	for k, v in tbl4.PacketsScript, nil, nil do
		for _, v2 in v, nil, nil do
			if arg:match(v2) or arg:find(v2) then
				str = k
				break
			end
		end
	end
	pcall(function()
		if str == "Unknown" then
			if tonumber(arg:sub(50):gsub("e", "")) >= 1 then
				str = "Resonance"
			end
		end
	end)
	return str
end
tbl4.KickingPlayers = {}
tbl8.GetKickingPlayer = function(arg)
	local flag = false
	local v = nil
	while arg and arg.Parent and not flag do
		for _, v2 in tbl2.Players:GetPlayers() do
			if not (v2 == localPlayer or table.find(tbl4.KickingPlayers, v2)) then
				local v3 = tbl8.GetChar(v2)
				v3 = v3 and tbl8.GetRoot(v3)
				if v3 then
					if v3.Anchored then
						v = v2
						tbl4.KickingPlayers[#tbl4.KickingPlayers + 1] = v2
						task.delay(5, function()
							for k, v4 in tbl4.KickingPlayers, nil, nil do
								if v4 == v2 then
									table.remove(tbl4.KickingPlayers, k)
									break
								end
							end
						end)
						flag = true
						break
					end
				end
			end
		end
		task.wait(0.01)
	end
	return v
end
tbl8.Round = function(arg)
	local str = string.sub(tostring(arg), 1, 4)
	return tonumber(str)
end
tbl8.GetConfigs = function(arg)
	local str = arg == "Figure" and "TheWorstSaves/FTAP/Figures" or "TheWorstSaves/FTAP/Plugins/Plugins"
	if not (isfolder and isfolder(str)) then
		return {}
	end
	local tbl9 = {}
	for _, v in listfiles(str), nil, nil do
		local pos = arg == "Figure" and v:find(".json", 1, true) or v:find(".lua", 1, true)
		if pos then
			local str2 = v:sub(pos, pos)
			local v2 = pos
			while str2 ~= "/" and str2 ~= "\\" and str2 ~= "" do
				v2 -= 1
				str2 = v:sub(v2, v2)
			end
			if str2 == "/" or str2 == "\\" then
				tbl9[#tbl9 + 1] = v:sub(v2 + 1, pos - 1)
			end
		end
	end
	return tbl9
end
tbl8.LoadConfig = function(arg, arg2)
	if arg2 == "Figure" then
		for k, v in tbl2.Http:JSONDecode(readfile("TheWorstSaves/FTAP/Figures/" .. arg .. ".json")), nil, nil do
			tbl4.FG[k] = v
		end
	else
		if not tbl4.SelectedConfig then
			return
		end
		loadfile("TheWorstSaves/FTAP/Plugins/Plugins/" .. tbl4.SelectedConfig .. ".lua")()
	end
end
tbl8.SaveConfig = function(arg)
	if not isfolder("TheWorstSaves/FTAP/Figures/") then
		makefolder("TheWorstSaves/FTAP/Figures/")
	end
	writefile("TheWorstSaves/FTAP/Figures/" .. arg .. ".json", tbl2.Http:JSONEncode(tbl4.FG))
end
tbl8.DeletePlugin = function(arg)
	if not isfile("TheWorstSaves/FTAP/Plugins/Plugins/" .. arg .. ".lua") then
		return
	end
	delfile("TheWorstSaves/FTAP/Plugins/Plugins/" .. arg .. ".lua")
end
task.spawn(function()
	tbl4.AutoloadPlugins = tbl8.GetConfigs("Plugin")
end)
tbl8.MakePluginAutoload = function(arg, arg2)
	if arg2 then
		if not table.find(tbl4.AutoloadPlugins, arg) and not table.find(tbl2.Http:JSONDecode(readfile("TheWorstSaves/FTAP/Plugins/Autoload.json")), arg) then
			table.insert(tbl4.AutoloadPlugins, arg)
		end
	else
		for k, v in tbl4.AutoloadPlugins, nil, nil do
			if v == arg then
				table.remove(tbl4.AutoloadPlugins, k)
			end
		end
	end
	writefile("TheWorstSaves/FTAP/Plugins/Autoload.json", tbl2.Http:JSONEncode(tbl4.AutoloadPlugins))
end
tbl8.LoadAutoloadPlugins = function()
	for _, v in tbl2.Http:JSONDecode(readfile("TheWorstSaves/FTAP/Plugins/Autoload.json")), nil, nil do
		task.spawn(function()
			local ok, result = pcall(function()
				loadfile("TheWorstSaves/FTAP/Plugins/Plugins/" .. v .. ".lua")()
			end)
			if not ok then
				error("[TheWorst]: " .. v .. ".lua Plugin Error: " .. result)
			end
		end)
	end
end
tbl8.UpdateESPConfig = function()
	writefile("TheWorstSaves/FTAP/ESPSettings.json", tbl2.Http:JSONEncode({
		PCLDTransparency = tbl4.ESPPCLDTransparency,
		PCLDColor = tbl4.ESPPCLDColor:ToHex(),
		StickyColorOutline = tbl4.ESPStickyColorOutline:ToHex(),
		StickyColorFill = tbl4.ESPStickyColorFill:ToHex(),
		StickyTransparencyOutline = tbl4.ESPStickyTransparencyOutline,
		StickyTransparencyFill = tbl4.ESPStickyTransparencyFill,
		PlayersColorOutline = tbl4.ESPPlayersColorOutline:ToHex(),
		PlayersTransparencyOutline = tbl4.ESPPlayersTransparencyOutline,
		PlayersColorFill = tbl4.ESPPlayersColorFill:ToHex(),
		PlayersTransparencyFill = tbl4.ESPPlayersTransparencyFill,
	}))
end
tbl8.ExtendLine = function(arg)
	tbl6.ExtendLineEvent:FireServer(arg)
end
tbl8.SNO = function(arg)
	if arg then
		tbl6.SetNetworkOwnerEvent:FireServer(arg, arg.CFrame)
	end
end
tbl8.Ragdoll = function(arg)
	if tbl5.Root then
		tbl6.RagdollEvent:FireServer(tbl5.Root, arg)
	end
end
tbl8.CreateLine = function(arg)
	local v = arg or nil
	if v then
		tbl6.CreateLineEvent:FireServer(v, CFrame)
	end
end
tbl8.Stick = function(arg, arg2, arg3)
	if arg and arg2 and arg3 then
		tbl6.StickyPartEvent:FireServer(arg, arg2, arg3)
	end
end
tbl8.SpawnToy = function(arg, arg2, arg3)
	arg2 = arg2 or nil
	if not arg2 then
		return
	end
	task.spawn(function()
		if not localPlayer.CanSpawnToy.Value then
			return
		end
		if not localPlayer.InPlot.Value then
			tbl8.AddConnection("SpawnToyFunctionConn", tbl5.MyToys.ChildAdded, function(arg4)
				if arg4.Name == arg then
					tbl8.RemoveConnection("SpawnToyFunctionConn")
					if arg3 then
						arg3(arg4)
					end
				end
			end)
		else
			tbl8.AddConnection("SpawnToyFunctionConn", workspace.PlotItems[tbl8.GetPlot()].ChildAdded, function(arg4)
				if arg4.Name == arg then
					tbl8.RemoveConnection("SpawnToyFunctionConn")
					if arg3 then
						arg3(arg4)
					end
				end
			end)
		end
		task.spawn(function()
			tbl6.SpawnToyEvent:InvokeServer(arg, arg2 * CFrame.new(0, 10, 20), Vector3.zero)
		end)
	end)
end
tbl8.DestroyToy = function(arg)
	if arg ~= nil then
		tbl6.DestroyToyEvent:FireServer(arg)
	end
end
tbl8.AddVelocity = function(arg, name, vectorVelocity, arg2)
	if not arg then
		return
	end
	local linearVelocity = arg:FindFirstChild(name) or Instance.new("LinearVelocity", arg)
	linearVelocity.Name = name
	linearVelocity.VectorVelocity = vectorVelocity
	linearVelocity.MaxForce = tbl4.Inf
	linearVelocity.Attachment0 = arg:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", arg)
	task.delay(arg2 or 0.1, function()
		if linearVelocity then
			linearVelocity:Destroy()
		end
	end)
	return linearVelocity
end
tbl8.CheckPlotInventory = function(arg)
	local v = tbl8.GetPlot()
	if not v then
		return nil
	end
	local v2 = workspace.PlotItems[v]
	if v2 then
		return v2:FindFirstChild(arg)
	end
	return nil
end
tbl8.CreateESP = function(arg, text)
	task.spawn(function()
		local character = arg.Character or arg.CharacterAdded:Wait()
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 5)
		if not humanoidRootPart or humanoidRootPart and humanoidRootPart:FindFirstChild("PlayerEspGui") then
			return
		end
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Adornee = humanoidRootPart
		billboardGui.Size = UDim2.new(0, 100, 0, 25)
		billboardGui.StudsOffset = Vector3.new(0, 3, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 0
		billboardGui.Parent = humanoidRootPart
		billboardGui.Name = "PlayerEspGui"
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
		textLabel.TextStrokeTransparency = 0.5
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 8
		textLabel.Parent = billboardGui
		textLabel.Name = "PlayerEspName"
		local highlight = Instance.new("Highlight")
		highlight.Adornee = character
		highlight.Parent = humanoidRootPart
		highlight.OutlineColor = tbl4.ESPPlayersColorOutline
		highlight.FillColor = tbl4.ESPPlayersColorFill
		highlight.OutlineTransparency = tbl4.ESPPlayersTransparencyOutline
		highlight.FillTransparency = tbl4.ESPPlayersTransparencyFill
		highlight.Name = "PlayerEspHighlight"
	end)
end
tbl8.KeyPressed = function(arg)
	return tbl2.UIS:IsKeyDown(arg)
end
tbl8.AddConnection = function(arg, arg2, arg3)
	tbl.Conns[arg] = arg2:Connect(arg3)
end
tbl8.RemoveConnection = function(arg)
	if tbl.Conns[arg] == nil then
		return
	end
	tbl.Conns[arg]:Disconnect()
	tbl.Conns[arg] = nil
end
tbl8.Notify = function(arg, arg2, arg3)
	local data = tbl2.Http:JSONDecode(readfile("TheWorstSaves/FTAP/NotifySettings.json"))
	UI.Orion:MakeNotification({
		Name = arg,
		Content = arg2,
		Time = arg3,
		Image = "rbxassetid://76062046097010",
		Sound = "rbxassetid://" .. data.SoundID,
		SoundVolume = data.SoundVolume,
	})
end
tbl8.LoadPhotoFromUrl = function(arg)
	if arg == "" then
		return nil
	end
	local str = tostring(math.random(1, 99999))
	local str2 = string.format("customasset_%s.jpg", str)
	writefile(str2, game:HttpGet(arg))
	task.delay(2, function()
		delfile(str2)
	end)
	return getcustomasset(str2)
end
tbl8.ApplyShader = function(arg)
	if arg == "..." then
		return
	end
	local Lighting = game:GetService("Lighting")
	for _, v in Lighting:GetChildren() do
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("Sky") or v:IsA("DepthOfFieldEffect") then
			v:Destroy()
		end
	end
	Lighting.Brightness = 2
	Lighting.ExposureCompensation = 0
	Lighting.ClockTime = 14
	Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
	Lighting.FogColor = Color3.fromRGB(192, 192, 192)
	Lighting.FogEnd = 100000
	Lighting.FogStart = 0
	Lighting.ShadowSoftness = 0
	Lighting.Ambient = Color3.fromRGB(120, 120, 120)
	if arg == "Old" then
		local sky = Instance.new("Sky", Lighting)
		local bloomEffect = Instance.new("BloomEffect", Lighting)
		local blurEffect = Instance.new("BlurEffect", Lighting)
		local colorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
		local sunRaysEffect = Instance.new("SunRaysEffect", Lighting)
		Lighting.Brightness = 2.25
		Lighting.ExposureCompensation = 0.1
		Lighting.ClockTime = 17.55
		sky.StarCount = 5000
		sky.SunAngularSize = 5
		bloomEffect.Intensity = 0.3
		bloomEffect.Size = 10
		bloomEffect.Threshold = 0.8
		blurEffect.Size = 5
		colorCorrectionEffect.Brightness = 0
		colorCorrectionEffect.Contrast = 0.1
		colorCorrectionEffect.Saturation = 0.25
		colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
		sunRaysEffect.Intensity = 0.1
		sunRaysEffect.Spread = 0.8
	elseif arg:match("New") or arg:find("New") then
		local bloomEffect = Instance.new("BloomEffect")
		bloomEffect.Intensity = 0.1
		bloomEffect.Threshold = 0
		bloomEffect.Size = 100
		local sky = Instance.new("Sky")
		sky.Name = "Tropic"
		sky.SkyboxUp = "rbxassetid://169210149"
		sky.SkyboxLf = "rbxassetid://169210133"
		sky.SkyboxBk = "rbxassetid://169210090"
		sky.SkyboxFt = "rbxassetid://169210121"
		sky.StarCount = 100
		sky.SkyboxDn = "rbxassetid://169210108"
		sky.SkyboxRt = "rbxassetid://169210143"
		sky.Parent = bloomEffect
		local sky2 = Instance.new("Sky")
		sky2.SkyboxUp = "rbxassetid://196263782"
		sky2.SkyboxLf = "rbxassetid://196263721"
		sky2.SkyboxBk = "rbxassetid://196263721"
		sky2.SkyboxFt = "rbxassetid://196263721"
		sky2.CelestialBodiesShown = false
		sky2.SkyboxDn = "rbxassetid://196263643"
		sky2.SkyboxRt = "rbxassetid://196263721"
		sky2.Parent = bloomEffect
		bloomEffect.Parent = Lighting
		local bloomEffect2 = Instance.new("BloomEffect")
		bloomEffect2.Enabled = false
		bloomEffect2.Intensity = 0.35
		bloomEffect2.Threshold = 0.2
		bloomEffect2.Size = 56
		local sky3 = Instance.new("Sky")
		sky3.Name = "Tropic"
		sky3.SkyboxUp = "rbxassetid://169210149"
		sky3.SkyboxLf = "rbxassetid://169210133"
		sky3.SkyboxBk = "rbxassetid://169210090"
		sky3.SkyboxFt = "rbxassetid://169210121"
		sky3.StarCount = 100
		sky3.SkyboxDn = "rbxassetid://169210108"
		sky3.SkyboxRt = "rbxassetid://169210143"
		sky3.Parent = bloomEffect2
		local sky4 = Instance.new("Sky")
		sky4.SkyboxUp = "rbxassetid://196263782"
		sky4.SkyboxLf = "rbxassetid://196263721"
		sky4.SkyboxBk = "rbxassetid://196263721"
		sky4.SkyboxFt = "rbxassetid://196263721"
		sky4.CelestialBodiesShown = false
		sky4.SkyboxDn = "rbxassetid://196263643"
		sky4.SkyboxRt = "rbxassetid://196263721"
		sky4.Parent = bloomEffect2
		bloomEffect2.Parent = Lighting
		Instance.new("BlurEffect", Lighting).Size = 2
		local blurEffect = Instance.new("BlurEffect", Lighting)
		blurEffect.Name = "Efecto"
		blurEffect.Enabled = false
		blurEffect.Size = 2
		local colorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
		colorCorrectionEffect.Name = "Inari taisha"
		colorCorrectionEffect.Saturation = 0.05
		colorCorrectionEffect.TintColor = Color3.fromRGB(255, 224, 219)
		local colorCorrectionEffect2 = Instance.new("ColorCorrectionEffect", Lighting)
		colorCorrectionEffect2.Name = "Normal"
		colorCorrectionEffect2.Enabled = false
		colorCorrectionEffect2.Saturation = -0.2
		colorCorrectionEffect2.TintColor = Color3.fromRGB(255, 232, 215)
		Instance.new("SunRaysEffect", Lighting).Intensity = 0.05
		local sky5 = Instance.new("Sky", Lighting)
		sky5.Name = "Sunset"
		sky5.SkyboxUp = "rbxassetid://323493360"
		sky5.SkyboxLf = "rbxassetid://323494252"
		sky5.SkyboxBk = "rbxassetid://323494035"
		sky5.SkyboxFt = "rbxassetid://323494130"
		sky5.SkyboxDn = "rbxassetid://323494368"
		sky5.SunAngularSize = 14
		sky5.SkyboxRt = "rbxassetid://323494067"
		local colorCorrectionEffect3 = Instance.new("ColorCorrectionEffect", Lighting)
		colorCorrectionEffect3.Name = "Takayama"
		colorCorrectionEffect3.Enabled = false
		colorCorrectionEffect3.Saturation = -0.3
		colorCorrectionEffect3.Contrast = 0.1
		colorCorrectionEffect3.TintColor = Color3.fromRGB(235, 214, 204)
		if arg == "Purple New" then
			Lighting.Brightness = 3.5
			Lighting.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
			Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14)
			Lighting.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
			Lighting.ClockTime = 6.7
			Lighting.FogColor = Color3.fromRGB(94, 76, 106)
			Lighting.FogEnd = 1000
			Lighting.ExposureCompensation = 0.24
			Lighting.Ambient = Color3.fromRGB(59, 33, 27)
		elseif arg == "Fullbright New" then
			Lighting.Brightness = 2
			Lighting.ColorShift_Bottom = Color3.fromRGB(250, 250, 250)
			Lighting.ColorShift_Top = Color3.fromRGB(250, 250, 250)
			Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
			Lighting.ClockTime = 10
			Lighting.FogColor = Color3.fromRGB(20, 20, 20)
			Lighting.FogEnd = 10000
			Lighting.ExposureCompensation = 0.5
			Lighting.Ambient = Color3.fromRGB(50, 50, 50)
		elseif arg == "Desert New" then
			Lighting.Brightness = 2.5
			Lighting.ColorShift_Bottom = Color3.fromRGB(240, 120, 20)
			Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14)
			Lighting.OutdoorAmbient = Color3.fromRGB(100, 50, 10)
			Lighting.ClockTime = 7
			Lighting.FogColor = Color3.fromRGB(100, 55, 20)
			Lighting.FogEnd = 1000
			Lighting.ExposureCompensation = 0.5
			Lighting.Ambient = Color3.fromRGB(80, 40, 10)
		end
	elseif arg == "Fog map" then
		local sky = Instance.new("Sky", Lighting)
		sky.MoonAngularSize = 0
		sky.MoonTextureId = "rbxasset://sky/moon.jpg"
		sky.SkyboxBk = "rbxassetid://10491933248"
		sky.SkyboxDn = "rbxassetid://10491933248"
		sky.SkyboxFt = "rbxassetid://10491933248"
		sky.SkyboxLf = "rbxassetid://10491933248"
		sky.SkyboxRt = "rbxassetid://10491933248"
		sky.SkyboxUp = "rbxassetid://10491933248"
		Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
		Lighting.PrioritizeLightingQuality = true
		Lighting.GlobalShadows = true
		Lighting.FogStart = 200
		Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
		Lighting.ClockTime = 16.5
		Lighting.FogColor = Color3.fromRGB(255, 255, 255)
		Lighting.FogEnd = 5000
		Lighting.EnvironmentDiffuseScale = 0
		Lighting.Brightness = 1.5
		Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
		Lighting.ExposureCompensation = 0
		Lighting.LightingStyle = Enum.LightingStyle.Soft
		Lighting.EnvironmentSpecularScale = 0.25
		Lighting.TimeOfDay = "16:30:00"
		Lighting.Technology = Enum.Technology.Voxel
		Lighting.Ambient = Color3.fromRGB(120, 120, 120)
		Lighting.GeographicLatitude = 41.73699951171875
		Lighting.ShadowSoftness = 0.2
	end
end
tbl8.PacketNotifyQueue = function(arg)
	for _, v in tbl4.PlayersLagging, nil, nil do
		if arg == v then
			return false
		end
	end
	table.insert(tbl4.PlayersLagging, arg)
	task.delay(tbl4.PingNotifyDelay, function()
		for k, v in tbl4.PlayersLagging, nil, nil do
			if v == arg then
				table.remove(tbl4.PlayersLagging, k)
			end
		end
	end)
	return true
end
tbl8.DeleteLimbPlayer = function(arg)
	local target = tbl5.Mouse.Target
	if not target or not target.Parent then
		return
	end
	if not target.Parent:FindFirstChild("HumanoidRootPart") then
		return
	end
	local humanoidRootPart = target.Parent:FindFirstChild("HumanoidRootPart")
	local torso = target.Parent:FindFirstChild("Torso")
	local humanoid = target.Parent:FindFirstChild("Humanoid")
	if not tbl5.Root or not humanoidRootPart then
		return
	end
	if tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) > 20 then
		return
	end
	local RagdollPallet = tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")
	RagdollPallet = RagdollPallet and RagdollPallet:FindFirstChild("SoundPart")
	workspace.FallenPartsDestroyHeight = -100
	for i = 1, 20 do
		tbl8.SNO(humanoidRootPart)
		if RagdollPallet then
			firetouchinterest(RagdollPallet, humanoidRootPart, 0)
		end
		task.wait()
	end
	repeat
		task.wait()
	until humanoid.Ragdolled.Value
	task.wait(0.1)
	for _, v in arg, nil, nil do
		local v2 = target.Parent:FindFirstChild(v)
		if v2 then
			v2.CFrame = CFrame.new(0, -59900, 0)
		end
	end
	task.wait(0.1)
	if torso then
		local cFrame = torso.CFrame
		torso.CFrame = CFrame.new(0, -9e9, 0)
		task.wait(0.1)
		torso.CFrame = cFrame
		task.wait(0.1)
	end
	tbl6.DestroyLineEvent:FireServer(humanoidRootPart)
	workspace.FallenPartsDestroyHeight = tbl7.AntiVoidEn and "nan" or -100
end
local function fn()
	local function fn2(arg)
		return (arg:gsub(".", function(arg2)
			local v = arg2:byte()
			local str = ""
			for i = 8, 1, -1 do
				str ..= v % 2 ^ i - v % 2 ^ (i - 1) > 0 and "1" or "0"
			end
			return str
		end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg2)
			if #arg2 < 6 then
				return ""
			end
			local n = 0
			for i = 1, 6 do
				n += arg2:sub(i, i) == "1" and 2 ^ (6 - i) or 0
			end
			return ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(n + 1, n + 1)
		end) .. ({ "", "==", "=" })[#arg % 3 + 1]
	end
	local function fn3(arg)
		return (string.gsub(arg, "[^" .. "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]", ""):gsub(".", function(arg2)
			if arg2 == "=" then
				return ""
			end
			local n = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):find(arg2) - 1
			local str = ""
			for i = 6, 1, -1 do
				str ..= n % 2 ^ i - n % 2 ^ (i - 1) > 0 and "1" or "0"
			end
			return str
		end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(arg2)
			if #arg2 ~= 8 then
				return ""
			end
			local n = 0
			for i = 1, 8 do
				n += arg2:sub(i, i) == "1" and 2 ^ (8 - i) or 0
			end
			return string.char(n)
		end))
	end
	local function fn4(arg, arg2)
		local tbl9 = {}
		local n = #arg2
		for i = 1, #arg do
			tbl9[i] = bit32.bxor(arg[i], arg2[(i - 1) % n + 1])
		end
		return tbl9
	end
	return {
		encrypt = function(arg, arg2)
			local char = string.char
			local v = table.pack(unpack(fn4({ string.byte(arg, 1, -1) }, { string.byte(arg2, 1, -1) })))
			return fn2(char(table.unpack(v, 1, v.n)))
		end,
		decrypt = function(arg, arg2)
			return string.char(unpack(fn4({ string.byte(fn3(arg), 1, -1) }, { string.byte(arg2, 1, -1) })))
		end,
	}
end
tbl8.ObfModule = fn()
tbl8.CheckWhitelist = function(arg)
	if #tbl4.WhitelistPlayers > 0 then
		for _, v in tbl4.WhitelistPlayers, nil, nil do
			local name = arg.Name
			if v:split(" ")[1] == name then
				return true
			end
		end
	end
	return false
end
tbl8.CheckFriend = function(arg)
	return localPlayer:IsFriendsWith(arg.UserId)
end
tbl8.UpdatePlayersList = function()
	local tbl9 = {}
	for _, v in tbl2.Players:GetPlayers() do
		if v ~= localPlayer then
			if tbl8.CheckFriend(v) then
				tbl9[#tbl9 + 1] = v.Name .. " (" .. v.DisplayName .. ") [[FRIEND]]"
			else
				tbl9[#tbl9 + 1] = v.Name .. " (" .. v.DisplayName .. ")"
			end
		end
	end
	return tbl9
end
tbl8.UpdateList = function(arg)
	local tbl9 = {}
	for _, v in arg, nil, nil do
		tbl9[#tbl9 + 1] = v
	end
	return tbl9
end
tbl8.GetBlob = function()
	if tbl5.Hum then
		local seatPart = tbl5.Hum.SeatPart
		if seatPart and seatPart.Parent and seatPart.Parent.Name == "CreatureBlobman" then
			return seatPart.Parent
		end
	end
	return nil
end
tbl8.BlobBring = function(arg, arg2)
	local v = tbl2.Players:FindFirstChild(arg)
	if not v then
		return
	end
	local v2 = tbl8.GetChar(v)
	v2 = v2 and tbl8.GetRoot(v2)
	if tbl5.Root and tbl5.Hum and v2 and v2.Position.Y < 2000 then
		tbl4.BlobbedName = v.Name
		local creatureBlobman = tbl8.GetBlob() or tbl5.MyToys:FindFirstChild("CreatureBlobman")
		if not creatureBlobman then
			tbl8.SpawnToy("CreatureBlobman", v2.CFrame)
			task.wait(0.5)
			creatureBlobman = tbl5.MyToys:FindFirstChild("CreatureBlobman")
		end
		if creatureBlobman and tbl5.Root and v2 and tbl8.GetMagnitude(tbl5.Root, v2) < 30 then
			local blobmanSeatAndOwnerScript = creatureBlobman:FindFirstChild("BlobmanSeatAndOwnerScript")
			local v3 = creatureBlobman:FindFirstChild(arg2 .. "Detector")
			local v4 = v3 and v3:FindFirstChild(arg2 .. "Weld")
			if blobmanSeatAndOwnerScript and v3 and v4 then
				local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
				if creatureGrab then
					creatureGrab:FireServer(v3, v2, v4)
				end
			end
		end
	end
end
tbl8.BlobInputLag = function(arg, arg2, arg3)
	local v = tbl2.Players:FindFirstChild(arg)
	if not v then
		return
	end
	local v2 = tbl8.GetChar(v)
	local v3 = v2 and tbl8.GetRoot(v2)
	v2 = v2 and tbl8.GetHum(v2)
	if tbl5.Root and tbl5.Hum and v3 and v3.Position.Y < 2000 then
		tbl4.BlobbedName = v.Name
		local creatureBlobman = tbl8.GetBlob() or tbl5.MyToys:FindFirstChild("CreatureBlobman")
		if not creatureBlobman then
			tbl8.SpawnToy("CreatureBlobman", v3.CFrame)
			task.wait(0.5)
			creatureBlobman = tbl5.MyToys:FindFirstChild("CreatureBlobman")
		end
		if tbl7.AutoSitEn and not tbl8.GetBlob() then
			if tbl5.Hum and tbl5.Hum.Health ~= 0 and tbl5.MyToys:FindFirstChild("CreatureBlobman") then
				tbl5.MyToys:FindFirstChild("CreatureBlobman"):WaitForChild("VehicleSeat"):Sit(tbl5.Hum)
			end
		end
		if tbl5.Root and v3 and creatureBlobman and tbl8.GetMagnitude(tbl5.Root, v3) < 30 then
			local blobmanSeatAndOwnerScript = creatureBlobman:FindFirstChild("BlobmanSeatAndOwnerScript")
			local v4 = creatureBlobman:FindFirstChild(arg2 .. "Detector")
			local v5 = v4 and v4:FindFirstChild(arg2 .. "Weld")
			if blobmanSeatAndOwnerScript and v4 and v5 then
				local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
				local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
				if creatureGrab and creatureRelease then
					creatureGrab:FireServer(v4, v3, v5)
					creatureRelease:FireServer(v5)
					if arg3 and v2 and isnetworkowner(v3) then
						v2:ChangeState(Enum.HumanoidStateType.Dead)
						task.wait()
					end
				end
			end
			task.wait()
		end
	end
end
tbl8.BlobDrop = function(arg, arg2)
	local v = tbl8.GetBlob()
	if not v then
		return
	end
	local blobmanSeatAndOwnerScript = v:FindFirstChild("BlobmanSeatAndOwnerScript")
	local v2 = v:FindFirstChild(arg2 .. "Detector")
	v2 = v2 and v2:FindFirstChild(arg2 .. "Weld")
	if blobmanSeatAndOwnerScript and v2 then
		local creatureDrop = blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
		if creatureDrop then
			creatureDrop:FireServer(v2)
		end
	end
end
tbl8.KillServer = function()
	while tbl7.KillServerEn do
		local flag = true
		for _, v in tbl2.Players:GetPlayers() do
			if v ~= localPlayer and v.Character then
				if not (tbl7.WhitelistBlobmanEn and (tbl8.CheckWhitelist(v) or tbl8.CheckFriend(v))) then
					local v2 = tbl8.GetChar(v)
					local v3 = v2 and tbl8.GetRoot(v2)
					v2 = v2 and tbl8.GetHum(v2)
					if v3 and tbl5.Root and v2 and v2.Health ~= 0 then
						if tbl8.GetMagnitude(tbl5.Root, v3) < 30 then
							tbl8.BlobInputLag(v.Name, flag and "Left" or "Right", true)
							flag = not flag
							task.wait(tbl4.BlobmanDelay / 1000)
						end
					end
				end
			end
		end
		task.wait(tbl4.BlobmanDelay / 1000)
	end
end
tbl8.KillPlayer = function(arg)
	if not workspace:FindFirstChild(arg.Name) then
		return
	end
	local character = arg.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	local humanoid = character and character:FindFirstChild("Humanoid")
	character = character and character:FindFirstChild("Head")
	local RagdollPallet = tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")
	if RagdollPallet then
		RagdollPallet:FindFirstChild("SoundPart")
	end
	if tbl5.Root and humanoidRootPart and humanoidRootPart.Position.Y < 2000 then
		local position = humanoidRootPart.Position
		local cFrame = tbl5.Root.CFrame
		task.spawn(function()
			if tbl5.Char then
				for _, v in tbl5.Char:GetChildren() do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end)
		local n = 0
		local flag = false
		while true do
			local flag2 = n < 50 and humanoidRootPart and humanoid
			if flag2 then
				local dead = Enum.HumanoidStateType.Dead
				flag2 = humanoid:GetState() ~= dead
			end
			if flag2 and humanoidRootPart.Position.Y < 2000 and humanoidRootPart.Position.Y > -2000 and workspace:FindFirstChild(arg.Name) and (character:FindFirstChild("PartOwner") == nil or character:FindFirstChild("PartOwner") and character.PartOwner.Value ~= localPlayer.Name) then
				if tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) >= 20 then
					tbl5.Root.CFrame = humanoidRootPart.CFrame + (humanoidRootPart.Position - position) * localPlayer:GetNetworkPing() * 100
					tbl5.Root.Velocity = tbl4.VectorZero
					flag = true
				end
				for i = 1, 5 do
					task.spawn(tbl8.SNO, humanoidRootPart)
					task.wait()
					tbl6.DestroyLineEvent:FireServer(humanoidRootPart)
				end
				local bodyPosition = humanoidRootPart:FindFirstChild("BodyPosition")
				if humanoidRootPart and not bodyPosition then
					local bodyPosition2 = Instance.new("BodyPosition", humanoidRootPart)
					bodyPosition2.MaxForce = tbl4.VectorInf
					bodyPosition2.D = 100
					bodyPosition2.Position = Vector3.new(0, -10500, 0)
				end
				for i = 1, 10 do
					if character and character:FindFirstChild("PartOwner") and character.PartOwner.Value == localPlayer.Name then
						tbl8.SNO(humanoidRootPart)
						task.wait()
						humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						task.wait()
						tbl6.DestroyLineEvent:FireServer(humanoidRootPart)
						print("Kill 1")
					end
					task.wait()
				end
				if flag then
					tbl5.Root.CFrame = cFrame
					tbl5.Root.Velocity = tbl4.VectorZero
					flag = false
				end
				tbl6.DestroyLineEvent:FireServer(humanoidRootPart)
				n += 1
				continue
			end
			break
		end
	end
end
tbl4.AntikickMode = "Pickaxe"
tbl8.SpawnFunctions = function(adornee)
	if adornee.Parent.Name == localPlayer.Name .. "SpawnedInToys" or adornee.Parent.Name == tbl8.GetPlot() then
		local antiKickEn = tbl7.AntiKickEn
		if antiKickEn then
			antiKickEn = (adornee.Name == "ToolPickaxe" or adornee.Name == "NinjaShuriken" or adornee.Name == "NinjaKatana" or adornee.Name == "ToolPencil") and not tbl5.MyToys:FindFirstChild("AntikickToy")
		end
		if antiKickEn then
			local ragdollTouchedHitbox = tbl5.Root and tbl5.Root:FindFirstChild("RagdollTouchedHitbox")
			local soundPart = adornee:WaitForChild("SoundPart", 3)
			local stickyPart = adornee:WaitForChild("StickyPart", 3)
			local stickyWeld = stickyPart and stickyPart:WaitForChild("StickyWeld", 3)
			local flag = false
			if workspace:FindFirstChild(string.format("%s (%s) PCLD", localPlayer.DisplayName, localPlayer.Name)) then
			end
			local tbl9 = {}
			local function fn2(arg)
				if tbl4.AntikickMode == "Pickaxe" then
					local tbl10 = {}
					local n = CFrame.new(0.4, 0, 0.7) * CFrame.Angles(-1.5707963267948966, 0.78539816339744828, 0)
					tbl10[1] = arg
					tbl10[2] = ragdollTouchedHitbox
					tbl10[3] = n
					tbl9 = tbl10
				elseif tbl4.AntikickMode == "Shuriken" then
					local tbl10 = {}
					local n = CFrame.new(0.06, -0.3, 0) * CFrame.Angles(1.5707963267948966, 0, 0)
					tbl10[1] = arg
					tbl10[2] = ragdollTouchedHitbox
					tbl10[3] = n
					tbl9 = tbl10
				elseif tbl4.AntikickMode == "Shuriken 45" then
					local tbl10 = {}
					local n = CFrame.new(0.06, -0.4, 0) * CFrame.Angles(1.5707963267948966, 0.78539816339744828, 0)
					tbl10[1] = arg
					tbl10[2] = ragdollTouchedHitbox
					tbl10[3] = n
					tbl9 = tbl10
				elseif tbl4.AntikickMode == "Kunai" then
					local tbl10 = {}
					local n = CFrame.new(0.06, -1.2, 0) * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)
					tbl10[1] = arg
					tbl10[2] = ragdollTouchedHitbox
					tbl10[3] = n
					tbl9 = tbl10
				elseif tbl4.AntikickMode == "Katana back" then
					local tbl10 = {}
					local n = CFrame.new(-0.2, -0.8, 0.5) * CFrame.Angles(1.5707963267948966, 0.78539816339744828, 0)
					tbl10[1] = arg
					tbl10[2] = ragdollTouchedHitbox
					tbl10[3] = n
					tbl9 = tbl10
				elseif tbl4.AntikickMode == "Katana gear" then
					local tbl10 = {}
					local n = CFrame.new(-1, -1.7, 0.5) * CFrame.Angles(1.9198621771937625, 0, 4.7123889803846897)
					tbl10[1] = arg
					tbl10[2] = ragdollTouchedHitbox
					tbl10[3] = n
					tbl9 = tbl10
				elseif tbl4.AntikickMode == "Pencil" then
					local tbl10 = {}
					local n = CFrame.new(0.1, -1.4, 0.1) * CFrame.Angles(3.1415926535897931, 0, 0)
					tbl10[1] = arg
					tbl10[2] = ragdollTouchedHitbox
					tbl10[3] = n
					tbl9 = tbl10
				end
			end
			fn2()
			adornee.Name = "AntikickToy"
			local vector_ = Vector3.zero
			task.spawn(function()
				local position = tbl5.Root.Position
				while tbl7.AntiKickEn and tbl5.Root ~= nil and adornee and adornee.Parent and adornee:FindFirstChild("SoundPart") and adornee:FindFirstChild("StickyPart") do
					local position2 = tbl5.Root.Position
					local n = position2 - position
					local str = tostring(math.round(n.X * 10))
					local str2 = tostring(math.round(n.Y * 10))
					local str3 = tostring(math.round(n.Z * 10))
					local str4 = str:gsub("-", "")
					local str5 = str2:gsub("-", "")
					local str6 = str3:gsub("-", "")
					vector_ = Vector3.new(str4, str5, str6)
					wait()
					position = position2
				end
			end)
			task.spawn(function()
				while tbl7.AntiKickEn and tbl5.Root ~= nil and adornee and adornee.Parent and adornee:FindFirstChild("SoundPart") and adornee:FindFirstChild("StickyPart") do
					if workspace:FindFirstChild(string.format("%s (%s) PCLD", localPlayer.DisplayName, localPlayer.Name)) then
					end
					local partOwner
					if tbl4.AntikickMode == "Pencil" then
						partOwner = soundPart and soundPart:FindFirstChild("PartOwner")
					else
						partOwner = stickyPart and stickyPart:FindFirstChild("PartOwner")
					end
					if partOwner == nil or partOwner and partOwner.Value ~= localPlayer.Name then
						soundPart.CanQuery = true
						flag = false
						if tbl4.AntikickMode == "Pencil" then
							tbl6.SetNetworkOwnerEvent:FireServer(soundPart, soundPart.CFrame)
						else
							tbl6.SetNetworkOwnerEvent:FireServer(stickyPart, stickyPart.CFrame)
						end
					end
					task.wait(0.05)
				end
			end)
			local n = 0
			while tbl7.AntiKickEn and tbl5.Root ~= nil and adornee and adornee.Parent and adornee:FindFirstChild("SoundPart") and adornee:FindFirstChild("StickyPart") do
				local flag2 = workspace:FindFirstChild(string.format("%s (%s) PCLD", localPlayer.DisplayName, localPlayer.Name))
				flag2 = flag2 and flag2.Position ~= Vector3.zero and flag2 or nil
				fn2(stickyPart)
				local partOwner
				if tbl4.AntikickMode == "Pencil" then
					partOwner = soundPart and soundPart:FindFirstChild("PartOwner")
				else
					partOwner = stickyPart and stickyPart:FindFirstChild("PartOwner")
				end
				if partOwner == nil or partOwner and partOwner.Value ~= localPlayer.Name then
					soundPart.CanQuery = true
					flag = false
					if stickyPart and stickyWeld and stickyWeld.Part1 == nil then
						if flag2 then
							for _, v in adornee:GetChildren() do
								if v:IsA("BasePart") then
									v.CanCollide = false
								end
							end
							if tbl8.GetMagnitude(flag2, soundPart) < 20 then
								partOwner = partOwner and partOwner.Value == localPlayer.Name
								if partOwner then
									soundPart.CFrame = flag2.CFrame or tbl5.Root.CFrame
								end
							else
								tbl6.StickyPartEvent:FireServer(table.unpack(tbl9))
								n += 1
							end
						else
							for _, v in adornee:GetChildren() do
								if v:IsA("BasePart") then
									v.CanCollide = false
								end
							end
							if tbl8.GetMagnitude(tbl5.Root, soundPart) < 20 then
								partOwner = partOwner and partOwner.Value == localPlayer.Name
								if partOwner then
									soundPart.CFrame = tbl5.Root.CFrame
								end
							else
								tbl6.StickyPartEvent:FireServer(table.unpack(tbl9))
								n += 1
							end
						end
					end
					task.wait(0.075)
				elseif stickyPart and stickyWeld and stickyWeld.Part1 == nil then
					flag = false
					for _, v in adornee:GetChildren() do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
					tbl6.StickyPartEvent:FireServer(table.unpack(tbl9))
					n += 1
					task.wait(0.075)
				end
				if tbl5.Root and adornee:FindFirstChild("SoundPart") then
					if vector_.X < 25 and vector_.Y < 25 and vector_.Z < 25 then
						if flag2 then
							if adornee and soundPart and tbl8.GetMagnitude(flag2, soundPart) > 20 and stickyPart and stickyWeld and stickyWeld.Part1 == nil then
								tbl8.DestroyToy(adornee)
							end
						elseif adornee and soundPart and tbl8.GetMagnitude(tbl5.Root, soundPart) > 20 then
							tbl8.DestroyToy(adornee)
						end
					end
				end
				if tbl5.Hum.Health == 0 then
					tbl8.DestroyToy(adornee)
					task.wait(0.01)
				end
				if n >= 20 and (flag2 and tbl8.GetMagnitude(flag2, soundPart) > 20 or tbl8.GetMagnitude(tbl5.Root, soundPart) > 20) then
					tbl8.DestroyToy(adornee)
					task.wait(0.01)
				end
				if not flag then
					for _, v in adornee:GetChildren() do
						if (v:IsA("Part") or v:IsA("MeshPart")) and v.Name ~= "StickyPart" and v.Name ~= "Main" then
							v.CanCollide = false
							if not tbl7.ESPStickyEn then
								v.Transparency = 0.8
							end
						end
						if v:IsA("Part") or v:IsA("MeshPart") then
							v.CanQuery = false
						end
					end
					flag = true
				end
				task.wait()
			end
			if adornee then
				tbl8.DestroyToy(adornee)
			end
		end
		if tbl7.AutoGucciEn then
			if adornee.Name == "CreatureBlobman" and tbl4.LastGucci == "Blob" and not tbl5.MyToys:FindFirstChild("GucciBlobman") then
				tbl7.MadeGucci = false
				local vehicleSeat = adornee:WaitForChild("VehicleSeat", 5)
				task.wait()
				if not vehicleSeat then
					return
				end
				local cFrame = tbl5.Root.CFrame
				adornee.Name = "GucciBlobman"
				tbl8.AddConnection("AutoGucciSatConn", vehicleSeat:GetPropertyChangedSignal("Occupant"), function()
					if vehicleSeat.Occupant ~= tbl5.Hum and vehicleSeat.Occupant ~= nil then
						tbl8.DestroyToy(adornee)
						tbl4.SpawnedGucci = false
						for i = 1, 5 do
							tbl5.Hum.Sit = true
							task.wait()
							tbl5.Hum.Sit = false
							tbl6.StruggleEvent:FireServer()
						end
						while tbl5.Head and tbl5.Head:FindFirstChild("PartOwner") do
							for i = 1, 3 do
								tbl6.StruggleEvent:FireServer()
							end
							task.wait()
						end
						tbl7.MakingGucci = false
						tbl8.RemoveConnection("AutoGucciSatConn")
					end
				end)
				tbl8.AddConnection("AutoGucciDestroyedConn", adornee.AncestryChanged, function(arg, arg2)
					if not arg2 then
						for i = 1, 10 do
							tbl5.Hum.Sit = true
							task.wait()
							tbl5.Hum.Sit = false
						end
						task.wait(0.1)
						tbl7.MakingGucci = false
						tbl8.RemoveConnection("AutoGucciDestroyedConn")
						tbl4.SpawnedGucci = false
					end
				end)
				tbl8.Ragdoll(0)
				repeat
					if not vehicleSeat or vehicleSeat and vehicleSeat.Occupant == tbl5.Hum then
						return
					end
					if tbl5.Hum and not tbl5.Hum.Ragdolled.Value and vehicleSeat and vehicleSeat.Parent then
						if tbl5.Hum then
							vehicleSeat:Sit(tbl5.Hum)
							tbl8.Ragdoll(0)
						end
					end
					task.wait()
				until not vehicleSeat or not vehicleSeat.Parent or vehicleSeat.Occupant == tbl5.Hum
				if vehicleSeat and vehicleSeat.Parent then
					while true do
						if tbl5.Hum then
							tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
						end
						task.wait()
						if not (not vehicleSeat or not vehicleSeat.Parent or vehicleSeat.Occupant ~= tbl5.Hum) then
							continue
						end
						break
					end
					task.wait(0.02)
					tbl7.MadeGucci = true
					tbl4.SpawnedGucci = true
					tbl4.SpawningGucci = false
					tbl7.MakingGucci = false
				end
				tbl5.Root.CFrame = cFrame
				tbl5.Root.Velocity = tbl4.VectorZero
				local v = workspace[localPlayer.Name]
				task.wait(0.5)
				local localCreatureControl = v:WaitForChild("LocalCreatureControl", 5)
				if localCreatureControl then
					localCreatureControl:Destroy()
				end
				v.GrabbingScript.Enabled = false
				task.wait()
				v.GrabbingScript.Enabled = true
				task.wait(1)
				local camPart = v:FindFirstChild("CamPart")
				if camPart then
					camPart:Destroy()
				end
			end
			if adornee.Name == "TractorRed" and tbl4.LastGucci == "Tractor" and not tbl5.MyToys:FindFirstChild("GucciTractor") then
				repeat
					task.wait()
				until tbl5.Hum.Ragdolled.Value == false
				local vehicleSeat = adornee:WaitForChild("VehicleSeat", 5)
				task.wait()
				if not vehicleSeat then
					return
				end
				local cFrame = tbl5.Root.CFrame
				task.wait()
				vehicleSeat:Sit(tbl5.Hum)
				adornee.Name = "GucciTractor"
				tbl8.AddConnection("AutoGucciSatConn", vehicleSeat:GetPropertyChangedSignal("Occupant"), function()
					if vehicleSeat.Occupant ~= tbl5.Hum and vehicleSeat.Occupant ~= nil then
						tbl8.DestroyToy(adornee)
						tbl4.SpawnedGucci = false
						for i = 1, 5 do
							tbl5.Hum.Sit = true
							task.wait()
							tbl5.Hum.Sit = false
							tbl6.StruggleEvent:FireServer()
						end
						while tbl5.Head and tbl5.Head:FindFirstChild("PartOwner") do
							for i = 1, 3 do
								tbl6.StruggleEvent:FireServer()
							end
							task.wait()
						end
						tbl7.MakingGucci = false
						tbl8.RemoveConnection("AutoGucciSatConn")
					end
				end)
				tbl8.AddConnection("AutoGucciDestroyedConn", adornee.AncestryChanged, function(arg, arg2)
					if not arg2 then
						for i = 1, 10 do
							tbl5.Hum.Sit = true
							task.wait()
							tbl5.Hum.Sit = false
						end
						task.wait(0.1)
						tbl7.MakingGucci = false
						tbl8.RemoveConnection("AutoGucciDestroyedConn")
						tbl4.SpawnedGucci = false
					end
				end)
				task.spawn(function()
					if not tbl7.IsRagdollingForGucci then
						tbl7.IsRagdollingForGucci = true
						local n = tick() + 2
						while tick() < n do
							tbl8.Ragdoll(0)
							task.wait()
						end
						tbl7.IsRagdollingForGucci = false
					end
				end)
				task.wait()
				while true do
					if tbl5.Hum and not tbl5.Hum.Ragdolled.Value then
						vehicleSeat:Sit(tbl5.Hum)
					end
					task.wait()
					if not (not vehicleSeat or not vehicleSeat.Parent or vehicleSeat.Occupant == tbl5.Hum) then
						continue
					end
					break
				end
				task.wait()
				if vehicleSeat and vehicleSeat.Parent then
					while true do
						if tbl5.Hum then
							tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
						end
						task.wait()
						if not (not vehicleSeat or not vehicleSeat.Parent or vehicleSeat.Occupant ~= tbl5.Hum) then
							continue
						end
						break
					end
					task.wait(0.01)
					tbl4.SpawnedGucci = true
					tbl4.SpawningGucci = false
					tbl7.MakingGucci = false
				end
				tbl5.Root.CFrame = cFrame
				tbl5.Root.Velocity = tbl4.VectorZero
			end
		end
		if tbl7.InstaGucciEn and adornee.Name == "CreatureBlobman" and not tbl5.MyToys:FindFirstChild("GucciBlobman") then
			tbl7.MadeGucci = false
			local cFrame = tbl5.Root.CFrame
			local vehicleSeat = adornee:WaitForChild("VehicleSeat", 2)
			adornee.Name = "GucciBlobman"
			repeat
				if not vehicleSeat or vehicleSeat and vehicleSeat.Occupant == tbl5.Hum then
					return
				end
				if tbl5.Hum and not tbl5.Hum.Ragdolled.Value and vehicleSeat and vehicleSeat.Parent then
					if tbl5.Hum then
						vehicleSeat:Sit(tbl5.Hum)
						tbl8.Ragdoll(0)
					end
				end
				task.wait()
			until not vehicleSeat or not vehicleSeat.Parent or vehicleSeat.Occupant == tbl5.Hum
			if vehicleSeat and vehicleSeat.Parent then
				while true do
					if tbl5.Hum then
						tbl8.Ragdoll(0)
						tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
					end
					task.wait()
					if not (not vehicleSeat or not vehicleSeat.Parent or vehicleSeat.Occupant ~= tbl5.Hum) then
						continue
					end
					break
				end
				task.wait(0.05)
				tbl7.MadeGucci = true
				tbl4.SpawnedGucci = true
				tbl4.SpawningGucci = false
				tbl7.MakingGucci = false
			end
			tbl5.Root.CFrame = cFrame
			tbl5.Root.Velocity = tbl4.VectorZero
			local v = workspace[localPlayer.Name]
			task.wait(0.5)
			local localCreatureControl = v:WaitForChild("LocalCreatureControl", 5)
			if localCreatureControl then
				localCreatureControl:Destroy()
			end
			v.GrabbingScript.Enabled = false
			task.wait()
			v.GrabbingScript.Enabled = true
			task.wait(1)
			local camPart = v:FindFirstChild("CamPart")
			if camPart then
				camPart:Destroy()
			end
		end
		if tbl7.TractorGucciEn and adornee.Name == "TractorRed" and not tbl5.MyToys:FindFirstChild("GucciTractor") then
			repeat
				task.wait()
			until not tbl5.Hum.Ragdolled.Value
			local cFrame = tbl5.Root.CFrame
			local vehicleSeat = adornee:WaitForChild("VehicleSeat", 3)
			vehicleSeat:Sit(tbl5.Hum)
			adornee.Name = "GucciTractor"
			task.spawn(function()
				if not tbl7.IsRagdollingForGucci then
					tbl7.IsRagdollingForGucci = true
					local n = tick() + 2
					while tick() < n do
						tbl8.Ragdoll(0)
						task.wait()
					end
					tbl7.IsRagdollingForGucci = false
				end
			end)
			task.wait()
			while true do
				if not tbl5.Hum.Ragdolled.Value then
					vehicleSeat:Sit(tbl5.Hum)
				end
				task.wait()
				if vehicleSeat.Occupant ~= tbl5.Hum then
					continue
				end
				break
			end
			task.wait()
			repeat
				tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
				task.wait()
			until vehicleSeat.Occupant ~= tbl5.Hum
			tbl5.Root.CFrame = cFrame
			tbl5.Root.Velocity = tbl4.VectorZero
			tbl4.SpawnedGucci = true
			tbl7.TractorGucciEn = false
		end
		if tbl7.AntiInputLagEn and adornee.Name == tbl4.InstrumentName and not tbl5.MyToys:FindFirstChild("AntiInputLag") then
			local holdPart = adornee:WaitForChild("HoldPart", 3)
			local rigidConstraint = holdPart and holdPart:FindFirstChild("RigidConstraint")
			local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
			local dropItemRemoteFunction = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")
			if not (holdPart and holdItemRemoteFunction and dropItemRemoteFunction) then
				return
			end
			adornee.Name = "AntiInputLag"
			while true do
				if tbl7.AntiInputLagEn and adornee and adornee.Parent then
					if tbl7.AutoAntiInputEn then
						if tbl5.Root and isnetworkowner(tbl5.Root) then
							tbl7.AntiInputEn = false
						else
							local value = localPlayer.IsHeld.Value
							local partOwner = tbl5.Head and tbl5.Head:FindFirstChild("PartOwner")
							if value or partOwner then
								tbl7.AntiInputEn = false
							elseif not value and not partOwner then
								tbl7.AntiInputEn = true
							end
						end
					else
						tbl7.AntiInputEn = true
					end
					local flag
					if tbl7.AntiInputSpawnEn and tbl7.AntiInputEn then
						flag = true
					elseif tbl7.AntiInputSpawnEn and not tbl7.AntiInputEn then
						flag = false
					else
						flag = true
					end
					if tbl7.AntiInputTransparent then
						for _, v in adornee:GetChildren() do
							if v:IsA("Part") or v:IsA("BasePart") then
								v.Transparency = 1
							end
						end
					end
					if flag then
						local attachment1 = rigidConstraint and rigidConstraint.Attachment1
						if attachment1 and attachment1.Parent and attachment1.Parent.Parent and attachment1.Parent.Parent.Name ~= localPlayer.Name then
							tbl8.DestroyToy(adornee)
							break
						else
							task.spawn(function()
								holdItemRemoteFunction:InvokeServer(adornee, tbl5.Char)
							end)
							if not tbl7.InvisAntiInputEn then
								task.wait(tbl4.AntiinputDelay)
							end
							task.spawn(function()
								local vectorZero = tbl4.VectorZero
								dropItemRemoteFunction:InvokeServer(adornee, CFrame.new(0, 10000, 0), vectorZero)
							end)
							if not tbl7.AntiEatInputEn then
								task.wait(tbl4.AntiinputDelay)
								if not tbl7.AntiEatInputEn then
									task.wait()
								end
							elseif not tbl7.AntiEatInputEn then
								task.wait()
							end
							continue
						end
					else
						task.wait()
						if not tbl7.AntiEatInputEn then
							task.wait()
						end
						continue
					end
				end
				break
			end
			if adornee then
				tbl8.DestroyToy(adornee)
			end
			tbl.SpawnedAntiInput = false
			tbl.AntiInputToy = nil
		end
		if tbl7.AutoRagdollEn and adornee.Name == "PalletLightBrown" and not tbl5.MyToys:FindFirstChild("RagdollPallet") then
			local soundPart = adornee:WaitForChild("SoundPart", 3)
			local main = adornee:WaitForChild("Main", 3)
			adornee.Name = "RagdollPallet"
			for _, v in adornee:GetChildren() do
				if v:IsA("BasePart") then
					v.CanCollide = false
					v.CanQuery = false
					v.Massless = true
				end
				task.wait(0.01)
			end
			while soundPart and not soundPart:FindFirstChild("PartOwner") do
				tbl8.SNO(soundPart)
				task.wait(0.01)
			end
			local angularVelocity = Instance.new("AngularVelocity", soundPart)
			angularVelocity.Name = "RagdollVelocity"
			angularVelocity.MaxTorque = math.huge
			angularVelocity.AngularVelocity = Vector3.new(5000, 0, 5000)
			angularVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
			angularVelocity.Attachment0 = soundPart:FindFirstChild("Attachment") or Instance.new("Attachment", soundPart)
			local bodyPosition = Instance.new("BodyPosition", main)
			bodyPosition.Name = "RagdollPosition"
			bodyPosition.MaxForce = tbl4.VectorInf
			bodyPosition.Position = Vector3.new(0, 10000, 0)
			bodyPosition.D = 100
			soundPart.Size = Vector3.new(6, 2, 6)
			soundPart.Position = Vector3.new(0, 1000, 0)
		end
		if tbl7.ExplodePlayerEn and adornee.Name == tbl4.ExplodeMode and not tbl5.MyToys:FindFirstChild("ExplodeToy") then
			local balloon
			if adornee.Name == "BombBalloon" then
				balloon = adornee:WaitForChild("Balloon", 2)
			elseif adornee.Name == "BombDarkMatter" then
				balloon = adornee:WaitForChild("Spinner", 2)
			elseif adornee.Name == "BombMissile" then
				balloon = adornee:WaitForChild("Button", 2)
			else
				balloon = adornee:WaitForChild("SoundPart")
			end
			if not balloon then
				return
			end
			tbl4.ToysExplode[#tbl4.ToysExplode + 1] = balloon
			tbl4.PartsToTouch[#tbl4.PartsToTouch + 1] = balloon
			for k, v in tbl4.ToysExplode, nil, nil do
				while true do
					if v and v.Parent and not v:FindFirstChild("PartOwner") then
						if tbl5.Root and tbl8.GetMagnitude(v, tbl5.Root) <= 20 then
							tbl8.SNO(v)
							task.wait(0.1)
							task.wait(0.1)
							continue
						else
							tbl8.DestroyToy(v.Parent)
							table.remove(tbl4.ToysExplode, k)
							break
						end
					end
					break
				end
				v.Velocity = Vector3.new(0, 200, 0)
				table.remove(tbl4.PartsToTouch, k)
			end
			task.wait(0.3)
			for k, v in tbl4.ToysExplode, nil, nil do
				if v == nil then
					table.remove(tbl4.ToysExplode, k)
					continue
				end
				while v and v.Parent do
					local selectedPlayer = tbl4.SelectedPlayer and tbl2.Players:FindFirstChild(tbl4.SelectedPlayer:split(" ")[1])
					local character = selectedPlayer and selectedPlayer.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if not character then
						return
					end
					v.Velocity = Vector3.new(0, 350, 0)
					v.CFrame = CFrame.new(character.Position - Vector3.new(0, 3, 0) + character.Velocity / 100)
					firetouchinterest(v, character, 0)
					task.wait()
				end
				table.remove(tbl4.ToysExplode, k)
			end
		end
		if tbl7.ESPStickyEn and (adornee.Name:match("Tool") or adornee.Name:match("Ninja") or adornee.Name == "AntiKickPickaxe") then
			local stickyPart = adornee:WaitForChild("StickyPart", 3)
			if stickyPart then
				local highlight = Instance.new("Highlight")
				highlight.Adornee = adornee
				highlight.Parent = stickyPart
				highlight.OutlineColor = tbl4.ESPStickyColorOutline
				highlight.FillColor = tbl4.ESPStickyColorFill
				highlight.OutlineTransparency = tbl4.ESPStickyTransparencyOutline
				highlight.FillTransparency = tbl4.ESPStickyTransparencyFill
				highlight.Name = "StickyEspHighlight"
			end
		end
		if tbl7.StickAntiGrabEn and adornee.Name == "ToolPencil" then
			if tbl7.AntikickEn and not tbl5.MyToys:FindFirstChild("AntikickToy") then
				return
			end
			local soundPart = adornee:WaitForChild("SoundPart", 5)
			local stickyPart = adornee:WaitForChild("StickyPart", 5)
			local n = 0
			while n <= 100 and soundPart and soundPart.Parent and stickyPart and not soundPart:FindFirstChild("PartOwner") do
				tbl8.SNO(soundPart)
				task.wait()
				n += 1
			end
			tbl8.Stick(stickyPart, tbl5.Torso, CFrame.new(1e45, 1000000, 1e98))
		end
		if tbl7.CoconutsDickEn and adornee.Name == "FoodCoconut" then
			adornee:WaitForChild("SoundPart", 5)
			tbl4.CoconutsDick[#tbl4.CoconutsDick + 1] = adornee
		end
	elseif tbl7.AntiBlobmanEn and adornee.Name == "CreatureBlobman" then
		local leftDetector = adornee:WaitForChild("LeftDetector", 3)
		local rightDetector = adornee:WaitForChild("RightDetector", 3)
		leftDetector = leftDetector and leftDetector:WaitForChild("AttachPlayer", 3)
		rightDetector = rightDetector and rightDetector:WaitForChild("AttachPlayer", 3)
		if leftDetector then
			leftDetector:Destroy()
		end
		if rightDetector then
			rightDetector:Destroy()
		end
	end
end
task.spawn(function()
	while task.wait(0.033) do
		tbl5.Char = localPlayer.Character or nil
		tbl5.Root = tbl5.Char and tbl5.Char:FindFirstChild("HumanoidRootPart") or nil
		tbl5.Head = tbl5.Char and tbl5.Char:FindFirstChild("Head") or nil
		tbl5.Torso = tbl5.Char and tbl5.Char:FindFirstChild("Torso") or nil
		tbl5.Hum = tbl5.Char and tbl5.Char:FindFirstChild("Humanoid") or nil
	end
end)
print(tbl.TheWorstPrints[4])
UI.Orion = loadstring(game:HttpGet("https://gitlab.com/m1kp0/BetterOrion/raw/main/Library.lua"))()
UI.Window = UI.Orion:MakeWindow({
	Name = "TheWorst",
	SubName = "FTAP | v1.03",
	IntroEnabled = false,
	ShowIcon = true,
	Icon = "rbxassetid://76062046097010",
	SearchBar = true,
	ToggleUIKey = Enum.KeyCode.Tab,
	WatermarkConfig = {
		Enabled = true,
		Visible = false,
		ShowFPS = true,
		ShowPing = true,
		ShowName = true,
		Icon = "heart",
	},
})
print(tbl.TheWorstPrints[5])
UI.Tabs.GrabTab = UI.Window:MakeTab({ Name = "Line", Icon = "hand" })
UI.Sect.StrengthSection = UI.Tabs.GrabTab:AddSection({ Name = "Strength", Side = "Left" })
UI.Elm.StrengthToggle = UI.Sect.StrengthSection:AddToggle({
	Name = "Super Strength",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "SuperStrengthToggle",
	Settings = true,
	Callback = function(superLineStrengthEn)
		tbl7.SuperLineStrengthEn = superLineStrengthEn
	end,
})
UI.Elm.StrengthSlider = UI.Elm.StrengthToggle:AddSlider({
	Name = "Strength",
	Min = 1,
	Max = 5000,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 10,
	Default = 400,
	Flag = "SuperStrengthSlider",
})
UI.Sect.LineSection = UI.Tabs.GrabTab:AddSection({ Name = "Line", Side = "Left" })
tbl4.LineSpeed = 2
tbl4.LineDistance = 0
UI.Elm.InflineToggle = UI.Sect.LineSection:AddToggle({
	Name = "Infinite Line",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "InfLineToggle",
	Settings = true,
	Callback = function(infLineEn)
		tbl7.InfLineEn = infLineEn
		tbl8.RemoveConnection("InfLineConnExtend")
		if not tbl7.InfLineEn then
			return
		end
		tbl8.AddConnection("InfLineConnExtend", tbl2.UIS.InputChanged, function(arg)
			if arg.UserInputType == tbl3.MouseWheel then
				tbl4.LineDistance = arg.Position.Z > 0 and tbl4.LineDistance + tbl4.LineSpeed or tbl4.LineDistance - tbl4.LineSpeed
				tbl8.ExtendLine(tbl4.LineDistance)
			end
		end)
	end,
})
UI.Elm.InflineToggle:AddSlider({
	Name = "Line Speed",
	Min = 1,
	Max = 100,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = 2,
	Flag = "InfLineSlider",
	Callback = function(lineSpeed)
		tbl4.LineSpeed = lineSpeed
	end,
})
tbl4.RGBSpeedLine = 10
tbl4.RGBColorsLine = 4
tbl4.LineColorsSet = {}
tbl4.RGBDir = {}
tbl4.LineColors = {}
for i = 1, tbl4.RGBColorsLine do
	tbl4.LineColors[i] = Color3.fromRGB(100, 100, 100)
end
UI.Elm.RGBLineToggle = UI.Sect.LineSection:AddToggle({
	Name = "RGB Line",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "RGBLineToggle",
	Settings = true,
	Callback = function(rgbLineEn)
		tbl7.RGBLineEn = rgbLineEn
		tbl4.LineColorsSet = {}
		if tbl7.RGBLineEn then
			for i = 1, #tbl4.LineColors do
				tbl4.RGBDir[i] = { R = math.random() * 2 - 1, G = math.random() * 2 - 1, B = math.random() * 2 - 1 }
			end
			while tbl7.RGBLineEn do
				for i = 1, #tbl4.LineColors do
					if tbl4.RGBDir[i] == nil then
						tbl4.RGBDir[i] = { R = math.random() * 2 - 1, G = math.random() * 2 - 1, B = math.random() * 2 - 1 }
					end
					local n = tbl4.LineColors[i].R * 255 + tbl4.RGBDir[i].R * tbl4.RGBSpeedLine
					local n2 = tbl4.LineColors[i].G * 255 + tbl4.RGBDir[i].G * tbl4.RGBSpeedLine
					local n3 = tbl4.LineColors[i].B * 255 + tbl4.RGBDir[i].B * tbl4.RGBSpeedLine
					if n >= 255 then
						n = 255 - n - 255
						tbl4.RGBDir[i].R = tbl4.RGBDir[i].R * -1
					elseif n <= 0 then
						n = -n
						tbl4.RGBDir[i].R = tbl4.RGBDir[i].R * -1
					end
					if n2 >= 255 then
						n2 = 255 - n2 - 255
						tbl4.RGBDir[i].G = tbl4.RGBDir[i].G * -1
					elseif n2 <= 0 then
						n2 = -n2
						tbl4.RGBDir[i].G = tbl4.RGBDir[i].G * -1
					end
					if n3 >= 255 then
						n3 = 255 - n3 - 255
						tbl4.RGBDir[i].B = tbl4.RGBDir[i].B * -1
					elseif n3 <= 0 then
						n3 = -n3
						tbl4.RGBDir[i].B = tbl4.RGBDir[i].B * -1
					end
					tbl4.LineColors[i] = Color3.fromRGB(n, n2, n3)
					tbl4.LineColorsSet[i] = ColorSequenceKeypoint.new((i - 1) / (#tbl4.LineColors - 1), tbl4.LineColors[i])
				end
				if #tbl4.LineColors >= 2 and workspace:FindFirstChild("GrabParts") then
					tbl6.UpdateLineColorEvent:FireServer(ColorSequence.new(tbl4.LineColorsSet))
				end
				tbl4.LineColorsSet = {}
				task.wait()
			end
		end
	end,
})
UI.Elm.RGBLineToggle:AddSlider({
	Name = "RGB Speed",
	Min = 1,
	Max = 100,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.RGBSpeedLine,
	Flag = "RGBLineSpeedSlider",
	Callback = function(rgbSpeedLine)
		tbl4.RGBSpeedLine = rgbSpeedLine
	end,
})
UI.Elm.RGBLineToggle:AddSlider({
	Name = "Colors",
	Min = 2,
	Max = 20,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.RGBColorsLine,
	Flag = "RGBLineSpeedSlider",
	Callback = function(rgbColorsLine)
		tbl4.RGBColorsLine = rgbColorsLine
		tbl4.LineColors = {}
		for i = 1, tbl4.RGBColorsLine do
			tbl4.LineColors[i] = Color3.fromRGB(100, 100, 100)
		end
	end,
})
UI.Sect.GrabsSection = UI.Tabs.GrabTab:AddSection({ Name = "Grabs", Side = "Right" })
UI.Sect.GrabsSection:AddToggle({
	Name = "Massless Grab",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "MasslessGrabToggle",
	Callback = function(masslessGrabEn)
		tbl7.MasslessGrabEn = masslessGrabEn
	end,
})
UI.Sect.GrabsSection:AddToggle({
	Name = "Open Grab",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "OpenGrabToggle",
	Callback = function(openGrabEn)
		tbl7.OpenGrabEn = openGrabEn
	end,
})
UI.Tabs.DefenseTab = UI.Window:MakeTab({ Name = "Defense", Icon = "shield" })
UI.Sect.DefaultSection = UI.Tabs.DefenseTab:AddSection({ Name = "Default", Side = "Left" })
UI.Sect.DefaultSection:AddButton({
	Name = "Delete Legs",
	Callback = function()
		if tbl5.Root and tbl5.Torso then
			workspace.FallenPartsDestroyHeight = -100
			tbl7.AntiBananEn = true
			tbl8.Ragdoll(0.5)
			task.wait(0.1)
			local rightLeg = tbl5.Char:FindFirstChild("Right Leg")
			local leftLeg = tbl5.Char:FindFirstChild("Left Leg")
			if rightLeg then
				rightLeg.CFrame = CFrame.new(0, -59999, 0)
			end
			if leftLeg then
				leftLeg.CFrame = CFrame.new(0, -59999, 0)
			end
			task.wait(0.1)
			local cFrame = tbl5.Torso.CFrame
			tbl5.Torso.CFrame = CFrame.new(0, -59999, 0)
			task.wait(0.1)
			tbl5.Torso.CFrame = cFrame
			task.wait()
			tbl7.AntiBananEn = false
			local stand = tbl5.PlayerGui.ControlsGui.PCFrame.Stand
			while true do
				local flag = tbl5.Hum and tbl5.Hum.Health ~= 0
				local flag2
				if flag then
					local dead = Enum.HumanoidStateType.Dead
					flag2 = tbl5.Hum:GetState() ~= dead
				else
					flag2 = flag
				end
				if flag2 then
					tbl5.Hum.HipHeight = not stand.Visible and 2 or 0
					task.wait(0.1)
					continue
				end
				break
			end
			workspace.FallenPartsDestroyHeight = tbl7.AntiVoidEn and "nan" or -100
		end
	end,
})
UI.Sect.DefaultSection:AddToggle({
	Name = "Anti Ragdoll",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiRagdollToggle",
	Callback = function(antiRagdollEn)
		tbl7.AntiRagdollEn = antiRagdollEn
		if tbl7.AntiRagdollEn then
			while tbl7.AntiRagdollEn do
				if tbl7.AntiBananEn then
					return
				end
				local flag = tbl5.Hum and tbl5.Hum.Health ~= 0
				if flag then
					local dead = Enum.HumanoidStateType.Dead
					flag = tbl5.Hum:GetState() ~= dead
				end
				if flag and tbl5.Root and tbl5.Hum:FindFirstChild("Ragdolled") and tbl5.Hum.Ragdolled.Value then
					if not tbl5.Hum.SeatPart then
						tbl5.Hum:ChangeState(Enum.HumanoidStateType.GettingUp)
					end
					if not tbl7.VehicleFlyEn then
						tbl5.Torso.CFrame = CFrame.new(tbl5.Torso.CFrame.Position, tbl5.Torso.CFrame.Position + Vector3.new(tbl5.Cam.CFrame.LookVector.X, 0, tbl5.Cam.CFrame.LookVector.Z))
					end
					for _, v in tbl5.Char:GetChildren() do
						if v:IsA("BasePart") and v:FindFirstChild("BallSocketConstraint") and v.Name ~= "Head" then
							v.BallSocketConstraint.Enabled = false
							v.CFrame = CFrame.new(tbl5.Root.Position + Vector3.new(0, 10000000, 0))
							v.Massless = true
						elseif v.Name == "Head" then
							v.CFrame = tbl5.Torso.CFrame * CFrame.new(0, 1.6, 0)
							v.CanCollide = false
							v.CanQuery = false
							v.CanTouch = false
							v.Massless = true
						end
					end
				end
				task.wait()
			end
		end
	end,
})
UI.Sect.DefaultSection:AddToggle({
	Name = "Anti Grab",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiGrabToggle",
	Callback = function(newAntiGrab)
		tbl7.NewAntiGrab = newAntiGrab
		tbl8.RemoveConnection("AntiGrabCharacterAddedConn")
		if not tbl7.NewAntiGrab then
			return
		end
		local flag = false
		local function fn2()
			while true do
				task.wait()
				if not (tbl5.Head and tbl5.Root) then
					continue
				end
				break
			end
			tbl8.AddConnection("PartOwnerAddedConn", tbl5.Head.ChildAdded, function(arg)
				if arg.Name == "PartOwner" then
					if not flag then
						tbl5.Root.Velocity = tbl4.VectorZero
						flag = true
						tbl5.Root.Anchored = true
						while localPlayer.IsHeld.Value and tbl5.Hum and tbl5.Root do
							tbl5.Hum:ChangeState(Enum.HumanoidStateType.GettingUp)
							local root = tbl5.Root
							root.CFrame = root.CFrame + tbl5.Hum.MoveDirection * 0.2
							tbl5.Root.Velocity = tbl4.VectorZero
							task.wait()
						end
						tbl5.Root.Velocity = tbl4.VectorZero
						tbl5.Root.Anchored = false
						flag = false
					end
				end
			end)
		end
		task.spawn(function()
			while tbl7.NewAntiGrab do
				local root = tbl5.Head and tbl5.Root
				local partOwner
				if root then
					partOwner = tbl5.Head:FindFirstChild("PartOwner") or localPlayer.IsHeld.Value
				else
					partOwner = root
				end
				if partOwner then
					for i = 1, 2 do
						tbl6.StruggleEvent:FireServer()
						task.wait()
					end
					if tbl5.Hum and tbl5.Hum:FindFirstChild("Ragdolled") and not tbl5.Hum.Ragdolled.Value then
						tbl8.Ragdoll(0)
					end
				end
				task.wait(0.01)
			end
		end)
		fn2()
		tbl8.AddConnection("AntiGrabCharacterAddedConn", localPlayer.CharacterAdded, fn2)
	end,
})
UI.Sect.DefaultSection:AddToggle({
	Name = "Sticky Anti Grab",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiGrabStickyToggle",
	Callback = function(stickAntiGrabEn)
		tbl7.StickAntiGrabEn = stickAntiGrabEn
		if not tbl7.StickAntiGrabEn then
			if tbl5.MyToys:FindFirstChild("ToolPencil") then
				tbl8.DestroyToy(tbl5.MyToys:FindFirstChild("ToolPencil"))
			end
			return
		end
		while tbl7.StickAntiGrabEn do
			if not tbl5.MyToys:FindFirstChild("ToolPencil") and tbl5.Root and tbl5.Torso and tbl5.Hum then
				tbl8.SpawnToy("ToolPencil", tbl5.Root.CFrame)
			elseif tbl5.MyToys:FindFirstChild("ToolPencil") and not tbl5.Root then
				tbl8.DestroyToy(tbl5.MyToys:FindFirstChild("ToolPencil"))
			end
			local playingAnimationTracks = tbl5.Hum:GetPlayingAnimationTracks()
			for _, playingAnimationTrack in pairs(playingAnimationTracks) do
				playingAnimationTrack:AdjustSpeed(0)
			end
			task.wait(0.1)
		end
	end,
})
UI.Sect.DefaultSection:AddToggle({
	Name = "Lock Position",
	Default = false,
	Save = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "LockPositionToggle",
	Callback = function(lockPositionEn)
		tbl7.LockPositionEn = lockPositionEn
		local flag = false
		local cFrame
		while tbl7.LockPositionEn do
			if tbl5.Root then
				if not tbl7.IsTeleportingBind then
					if not flag then
						if not cFrame then
							cFrame = tbl5.Root.CFrame
						else
							tbl5.Root.CFrame = cFrame
							tbl5.Root.Velocity = Vector3.zero
						end
						task.wait()
					end
					if tbl8.KeyPressed(tbl3.W) or tbl8.KeyPressed(tbl3.A) or tbl8.KeyPressed(tbl3.S) or tbl8.KeyPressed(tbl3.D) then
						flag = true
						cFrame = nil
					else
						flag = false
					end
				else
					task.wait(0.1)
					flag = true
					cFrame = nil
				end
			end
			task.wait()
		end
	end,
})
UI.Sect.AntikickSection = UI.Tabs.DefenseTab:AddSection({ Name = "Anti kick", Side = "Left" })
UI.Elm.AntiKickToggle = UI.Sect.AntikickSection:AddToggle({
	Name = "Anti kick",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiKickPickaxeToggle",
	Settings = true,
	Callback = function(antiKickEn)
		tbl7.AntiKickEn = antiKickEn
		tbl8.RemoveConnection("AntiKickRespawnConn")
		if not tbl7.AntiKickEn then
			return
		end
		tbl4.SpawnShurikenCFrame = CFrame.new(0, 0, 0)
		local vector_ = Vector3.zero
		task.spawn(function()
			local position = tbl5.Root and tbl5.Root.Position or Vector3.zero
			while tbl7.AntiKickEn do
				if tbl5.Root then
					local position2 = tbl5.Root.Position
					local n = position2 - position
					local str = tostring(math.round(n.X * 10))
					local str2 = tostring(math.round(n.Y * 10))
					local str3 = tostring(math.round(n.Z * 10))
					local str4 = str:gsub("-", "")
					local str5 = str2:gsub("-", "")
					local str6 = str3:gsub("-", "")
					vector_ = Vector3.new(str4, str5, str6)
					position = position2
				end
				if tbl5.Torso then
					tbl5.Torso.CanCollide = false
				end
				wait()
			end
		end)
		local function fn2()
			tbl4.SpawnShurikenCFrame = tbl5.Root.CFrame
			local flag = workspace:FindFirstChild(string.format("%s (%s) PCLD", localPlayer.DisplayName, localPlayer.Name))
			local flag2 = flag and flag.Position ~= Vector3.zero and flag or nil
			if flag and flag2 then
				tbl4.SpawnShurikenCFrame = flag2.CFrame + tbl5.Root.Velocity / 2
			end
			flag = flag and flag2
			if flag then
				flag = vector_.X > 25 or vector_.Y > 25 or vector_.Z > 25
			end
			if flag then
				tbl4.SpawnShurikenCFrame = flag2.CFrame + tbl5.Root.Velocity / 1.5 * localPlayer:GetNetworkPing() * 1000
			end
			if tbl5.Head and tbl5.Head:FindFirstChild("PartOwner") and tbl5.Head.PartOwner.Value ~= localPlayer.Name then
				local v = tbl2.Players:FindFirstChild(tbl5.Head.PartOwner.Value)
				local v2 = tbl8.GetChar(v)
				v2 = v2 and tbl8.GetRoot(v2)
				if v2 then
					tbl4.SpawnShurikenCFrame = v2.CFrame
				end
			end
			if tbl4.AntikickMode == "Pickaxe" then
				tbl8.SpawnToy("ToolPickaxe", tbl5.Root.CFrame * CFrame.new(0, -5, 0))
			elseif tbl4.AntikickMode == "Shuriken" then
				tbl8.SpawnToy("NinjaShuriken", tbl5.Root.CFrame * CFrame.new(0, -5, 0))
			elseif tbl4.AntikickMode == "Shuriken 45" then
				tbl8.SpawnToy("NinjaShuriken", tbl5.Root.CFrame * CFrame.new(0, -5, 0))
			elseif tbl4.AntikickMode == "Kunai" then
				tbl8.SpawnToy("NinjaKunai", tbl5.Root.CFrame * CFrame.new(0, -5, 0))
			elseif tbl4.AntikickMode == "Katana back" then
				tbl8.SpawnToy("NinjaKatana", tbl5.Root.CFrame * CFrame.new(0, -5, 0))
			elseif tbl4.AntikickMode == "Katana gear" then
				tbl8.SpawnToy("NinjaKatana", tbl5.Root.CFrame * CFrame.new(0, -5, 0))
			elseif tbl4.AntikickMode == "Pencil" then
				tbl8.SpawnToy("ToolPencil", tbl5.Root.CFrame * CFrame.new(0, -5, 0))
			end
			task.wait(0.01)
		end
		while tbl7.AntiKickEn do
			if localPlayer.InPlot.Value and not localPlayer.InOwnedPlot.Value then
				return
			end
			while true do
				task.wait()
				if not (tbl5.Hum and tbl5.Hum.Health ~= 0 and tbl5.Root) then
					continue
				end
				break
			end
			repeat
				task.wait()
			until localPlayer.CanSpawnToy.Value
			tbl.SpawnedAntikick = tbl8.CheckPlotInventory("AntikickToy") or tbl5.MyToys:FindFirstChild("AntikickToy") or nil
			if not tbl.SpawnedAntikick then
				fn2()
			end
			task.wait(0.05)
		end
	end,
})
UI.Elm.AntiKickToggle:AddDropdown({
	Name = "Anti kick toy",
	Default = "Kill gucci",
	Options = { "Pickaxe", "Katana back", "Katana gear", "Pencil", "Shuriken", "Shuriken 45" },
	Flag = "AntikickToyDropdown",
	MaxSize = 6,
	Callback = function(antikickMode)
		tbl4.AntikickMode = antikickMode
		local antikickToy = tbl5.MyToys:FindFirstChild("AntikickToy")
		if antikickToy then
			tbl8.DestroyToy(antikickToy)
		end
	end,
})
UI.Sect.AntikickSection:AddToggle({
	Name = "Anti kick (reset)",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiKickResetToggle",
	Callback = function(antiKickResetEn)
		tbl7.AntiKickResetEn = antiKickResetEn
		if tbl7.AntiKickResetEn then
			tbl8.AddConnection("AntiKickResetConn", tbl6.ACEvent.OnClientEvent, function(arg)
				if arg == "Flying" then
					if tbl5.Hum then
						task.spawn(function()
							for i = 1, 2 do
								tbl6.StruggleEvent:FireServer(localPlayer)
								task.wait()
							end
						end)
						tbl6.StruggleEvent:FireServer(localPlayer)
						tbl5.Hum:ChangeState(Enum.HumanoidStateType.Dead)
					end
				end
			end)
		else
			tbl8.RemoveConnection("AntiKickResetConn")
		end
	end,
})
tbl7.SavePositionEn = false
tbl4.DiedCount = -1
UI.Sect.AntikickSection:AddToggle({
	Name = "Anti kick (break pcld)",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiKickPcldToggle",
	Callback = function(antiKickPCLDEn)
		tbl7.AntiKickPCLDEn = antiKickPCLDEn
		tbl4.DiedCount = -1
		if tbl7.AntiKickPCLDEn then
			if tbl5.Root then
				if tbl7.SavePositionEn then
					tbl4.OldCFrameTeleportSave = tbl5.Root.CFrame
				end
				tbl5.Root.CFrame = CFrame.new(0, 1000000, 1000000)
				tbl7.TeleportedPcld = true
				tbl4.DiedCount = 0
				task.wait(0.1)
			end
			tbl6.StruggleEvent:FireServer(localPlayer)
			if tbl5.Hum then
				tbl5.Hum:ChangeState(Enum.HumanoidStateType.Dead)
				print("Reset")
			end
			tbl8.AddConnection("AntiKickPcldConn", localPlayer.CharacterAdded, function(arg)
				local humanoidRootPart = arg and arg:WaitForChild("HumanoidRootPart", 5)
				arg = arg and arg:WaitForChild("Humanoid", 5)
				if not humanoidRootPart or not arg then
					tbl4.DiedCount = -1
					return
				end
				if tbl4.DiedCount == 1 then
					if tbl7.SavePositionEn and humanoidRootPart then
						for i = 1, 200 do
							humanoidRootPart.CFrame = tbl4.OldCFrameTeleportSave
							humanoidRootPart.Velocity = tbl4.VectorZero
							task.wait()
						end
					end
					return
				end
				task.spawn(function()
					for i = 1, 10 do
						if humanoidRootPart then
							humanoidRootPart.CFrame = CFrame.new(0, 1000000, 1000000)
						end
						task.wait()
					end
				end)
				tbl4.DiedCount = 1
				tbl6.StruggleEvent:FireServer(localPlayer)
				if arg then
					arg:ChangeState(Enum.HumanoidStateType.Dead)
				end
				task.delay(5, function()
					tbl4.DiedCount = -1
				end)
			end)
		else
			tbl8.RemoveConnection("AntiKickPcldConn")
		end
	end,
})
UI.Sect.GucciSection = UI.Tabs.DefenseTab:AddSection({ Name = "Gucci", Side = "Left" })
tbl4.TrainSeatNum = 0
tbl4.LastGucci = "Blob"
UI.Sect.GucciSection:AddToggle({
	Name = "Auto gucci",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "AutoGucciToggle",
	Callback = function(autoGucciEn)
		tbl7.AutoGucciEn = autoGucciEn
		if not tbl7.AutoGucciEn then
			tbl7.MakingGucci = false
			tbl4.SpawnedGucci = false
			tbl4.SpawningGucci = false
			local gucciBlobman = tbl5.MyToys:FindFirstChild("GucciBlobman") or tbl5.MyToys:FindFirstChild("GucciTractor")
			if gucciBlobman then
				tbl8.DestroyToy(gucciBlobman)
			end
			tbl8.RemoveConnection("AutoGucciRespawnConn")
			return
		end
		tbl4.SpawnedGucci = false
		tbl4.SpawningGucci = false
		tbl7.MakingGucci = false
		tbl8.AddConnection("AutoGucciRespawnConn", localPlayer.CharacterAdded, function()
			if tbl7.AutoGucciEn then
				tbl4.SpawnedGucci = false
				tbl7.MakingGucci = false
			end
		end)
		local flag = false
		local function fn2()
			local gucciBlobman = tbl5.MyToys:FindFirstChild("GucciBlobman") or tbl5.MyToys:FindFirstChild("GucciTractor")
			if gucciBlobman then
				tbl8.DestroyToy(gucciBlobman)
			end
			tbl4.SpawnedGucci = false
			tbl7.MakingGucci = false
			flag = false
		end
		local function fn3()
			local ragdolled = tbl5.Hum and tbl5.Hum:FindFirstChild("Ragdolled")
			if ragdolled then
				tbl8.AddConnection("AutoGucciConn2", ragdolled:GetPropertyChangedSignal("Value"), function()
					if not ragdolled.Value or tbl7.MakingGucci then
						return
					end
					fn2()
				end)
			end
			if tbl5.Hum then
				tbl8.AddConnection("AutoGucciConn3", tbl5.Hum:GetPropertyChangedSignal("Sit"), function()
					if tbl5.Hum.SeatPart or tbl5.Hum.Sit == false or tbl7.MakingGucci then
						return
					end
					fn2()
				end)
			end
		end
		local function fn4()
			if tbl4.SpawnedGucci then
				return
			end
			if tbl5.Hum and tbl5.Hum:FindFirstChild("Ragdolled") and tbl5.Hum.Ragdolled.Value then
				while true do
					task.wait()
					if not (not tbl5.Hum or not tbl5.Hum.Ragdolled.Value) then
						continue
					end
					break
				end
				task.wait(0.1)
			end
			if localPlayer.IsHeld.Value then
				repeat
					task.wait()
				until not localPlayer.IsHeld.Value
				task.wait(0.1)
			end
			if tbl5.MyToys:FindFirstChild("GucciBlobman") or tbl5.MyToys:FindFirstChild("GucciTractor") then
				tbl4.SpawnedGucci = true
				return
			end
			if tbl7.MakingGucci then
				return
			end
			while not tbl5.Root do
				task.wait(0.01)
			end
			tbl7.MakingGucci = true
			if tbl4.LastGucci == "Train" then
				flag = true
				repeat
					task.wait()
				until not tbl5.Hum.Ragdolled.Value
				local tbl9 = {}
				local objectModel = workspace.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel
				if objectModel then
					for _, v in objectModel:GetChildren() do
						if v.Name == "Seat" then
							tbl9[#tbl9 + 1] = v
						end
					end
				end
				if #tbl9 == 0 then
					tbl7.MakingGucci = false
					return
				end
				if #tbl9 <= tbl4.TrainSeatNum + 1 then
					tbl4.TrainSeatNum = 0
				end
				tbl4.TrainSeatNum = tbl4.TrainSeatNum + 1
				local cFrame = tbl5.Root.CFrame
				local v = tbl9[tbl4.TrainSeatNum]
				task.spawn(function()
					if not tbl7.IsRagdollingForGucci then
						tbl7.IsRagdollingForGucci = true
						local n = tick() + 2
						while tick() < n do
							tbl8.Ragdoll(0)
							task.wait(0.001)
						end
						tbl7.IsRagdollingForGucci = false
					end
				end)
				task.wait()
				if v then
					tbl8.AddConnection("AutoGucciConn1", v:GetPropertyChangedSignal("Occupant"), function()
						if v.Occupant ~= tbl5.Hum and v.Occupant ~= nil then
							tbl8.RemoveConnection("AutoGucciConn1")
							for i = 1, 2 do
								tbl5.Hum.Sit = true
								task.wait()
								tbl5.Hum.Sit = false
							end
							tbl7.MakingGucci = false
							flag = false
						end
					end)
				end
				while true do
					if not tbl5.Hum.Ragdolled.Value and v then
						v:Sit(tbl5.Hum)
					end
					task.wait()
					if not (v and v.Occupant == tbl5.Hum) then
						continue
					end
					break
				end
				task.wait(0.08)
				while true do
					tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait()
					if not (v and v.Occupant ~= tbl5.Hum) then
						continue
					end
					break
				end
				task.wait()
				tbl5.Root.CFrame = cFrame
				tbl5.Root.Velocity = tbl4.VectorZero
				tbl4.SpawnedGucci = true
				tbl7.MakingGucci = false
			else
				tbl4.SpawningGucci = true
				tbl8.SpawnToy(tbl4.LastGucci == "Blob" and "CreatureBlobman" or "TractorRed", CFrame.new(0, 9e9, 0))
				task.wait(0.5)
				tbl4.SpawningGucci = false
				tbl7.MakingGucci = false
			end
		end
		fn3()
		while tbl7.AutoGucciEn do
			if tbl5.Root and tbl5.Hum and not tbl4.SpawnedGucci then
				fn4()
			elseif not tbl5.Root or not tbl5.Hum or tbl5.Hum.Health == 0 then
				tbl8.RemoveConnection("AutoGucciConn2")
				tbl8.RemoveConnection("AutoGucciConn3")
				fn2()
				while true do
					task.wait()
					if not (tbl5.Root or tbl5.Hum and tbl5.Hum.Health ~= 0) then
						continue
					end
					break
				end
			end
			task.wait(0.01)
		end
	end,
})
UI.Elm.Gucci = UI.Sect.GucciSection:AddBind({
	Name = "Blobman gucci",
	Default = "",
	Hold = false,
	Flag = "BlobmanGucciBind",
	Button = true,
	Callback = function()
		tbl4.LastGucci = "Blob"
		if tbl5.Root and tbl5.Hum then
			local str = tbl5.MyToys:FindFirstChild("GucciBlobman") and "GucciBlobman"
			local str2
			if str then
				str2 = str
			else
				str2 = tbl5.MyToys:FindFirstChild("GucciTractor") and "GucciTractor" or nil
			end
			if str2 then
				tbl8.DestroyToy(tbl5.MyToys:FindFirstChild(str2))
				for i = 1, 10 do
					tbl5.Hum.Sit = true
					task.wait()
					tbl5.Hum.Sit = false
				end
			end
			if tbl5.Hum.Sit then
				tbl5.Hum.Sit = false
				if tbl5.Hum.JumpPower == 0 then
					tbl5.Hum.JumpPower = 24
				end
				task.wait(0.1)
			end
			tbl7.InstaGucciEn = true
			task.delay(1, function()
				tbl7.InstaGucciEn = false
			end)
			tbl8.SpawnToy("CreatureBlobman", CFrame.new(0, 9e9, 0))
		end
	end,
})
UI.Elm.TractorGucci = UI.Sect.GucciSection:AddBind({
	Name = "Tractor gucci",
	Default = "",
	Hold = false,
	Flag = "TractorGucciBind",
	Button = true,
	Callback = function()
		tbl4.LastGucci = "Tractor"
		if tbl5.Root and tbl5.Hum then
			local str = tbl5.MyToys:FindFirstChild("GucciBlobman") and "GucciBlobman"
			if not str then
				str = tbl5.MyToys:FindFirstChild("GucciTractor") and "GucciTractor" or nil
			end
			if str then
				tbl8.DestroyToy(tbl5.MyToys:FindFirstChild(str))
				for i = 1, 10 do
					tbl5.Hum.Sit = true
					task.wait()
					tbl5.Hum.Sit = false
				end
			end
			if tbl5.Hum.Sit then
				tbl5.Hum.Sit = false
				if tbl5.Hum.JumpPower == 0 then
					tbl5.Hum.JumpPower = 24
				end
				task.wait(0.1)
			end
			tbl7.TractorGucciEn = true
			task.delay(1, function()
				tbl7.TractorGucciEn = false
			end)
			tbl8.SpawnToy("TractorRed", CFrame.new(0, 9e9, 0))
		end
	end,
})
UI.Elm.TrainGucci = UI.Sect.GucciSection:AddBind({
	Name = "Train gucci",
	Default = "",
	Hold = false,
	Flag = "TrainGucciBind",
	Button = true,
	Callback = function()
		tbl4.LastGucci = "Train"
		if tbl5.Root and tbl5.Hum then
			local str = tbl5.MyToys:FindFirstChild("GucciBlobman") and "GucciBlobman" or tbl5.MyToys:FindFirstChild("GucciTractor") and "GucciTractor" or nil
			if str then
				tbl8.DestroyToy(tbl5.MyToys:FindFirstChild(str))
				for i = 1, 10 do
					tbl5.Hum.Sit = true
					task.wait()
					tbl5.Hum.Sit = false
				end
			end
			if tbl5.Hum.Sit then
				tbl5.Hum.Sit = false
				if tbl5.Hum.JumpPower == 0 then
					tbl5.Hum.JumpPower = 24
				end
				task.wait(0.1)
			end
			repeat
				task.wait()
			until tbl5.Hum.Ragdolled.Value == false
			local tbl9 = {}
			local objectModel = workspace.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel
			if objectModel then
				for _, v in objectModel:GetChildren() do
					if v.Name == "Seat" then
						tbl9[#tbl9 + 1] = v
					end
				end
			end
			if #tbl9 <= tbl4.TrainSeatNum + 1 then
				tbl4.TrainSeatNum = 0
			end
			tbl4.TrainSeatNum = tbl4.TrainSeatNum + 1
			local cFrame = tbl5.Root.CFrame
			local v = tbl9[tbl4.TrainSeatNum]
			task.spawn(function()
				if not tbl7.IsRagdollingForGucci then
					tbl7.IsRagdollingForGucci = true
					local n = tick() + 2
					while tick() < n do
						tbl8.Ragdoll(0)
						task.wait(0.001)
					end
					tbl7.IsRagdollingForGucci = false
				end
			end)
			task.wait()
			while true do
				if not tbl5.Hum.Ragdolled.Value then
					if v then
						v:Sit(tbl5.Hum)
					end
				end
				task.wait()
				if not (v and v.Occupant == tbl5.Hum) then
					continue
				end
				break
			end
			task.wait(0.08)
			while true do
				tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
				task.wait()
				if not (v and v.Occupant ~= tbl5.Hum) then
					continue
				end
				break
			end
			task.wait()
			tbl5.Root.CFrame = cFrame
			tbl5.Root.Velocity = tbl4.VectorZero
		end
	end,
})
UI.Sect.GucciSection:AddBind({
	Name = "Disable gucci",
	Button = true,
	Flag = "DisableGucciBind",
	Callback = function()
		local str = tbl5.MyToys:FindFirstChild("GucciBlobman") and "GucciBlobman"
		if not str then
			str = tbl5.MyToys:FindFirstChild("GucciTractor") and "GucciTractor" or nil
		end
		if str and tbl5.Hum then
			tbl8.DestroyToy(tbl5.MyToys:FindFirstChild(str))
		end
		if tbl5.Hum then
			for i = 1, 10 do
				tbl5.Hum.Sit = true
				task.wait()
				tbl5.Hum.Sit = false
				task.wait()
			end
		end
		if not tbl7.IsStrugglingAntiInitMagiya then
			while tbl5.Head and tbl5.Head:FindFirstChild("PartOwner") do
				tbl7.IsStrugglingAntiInitMagiya = true
				for i = 1, 2 do
					tbl6.StruggleEvent:FireServer()
				end
				task.wait()
			end
		end
		tbl7.IsStrugglingAntiInitMagiya = false
	end,
})
UI.Sect.AntiBlobSection = UI.Tabs.DefenseTab:AddSection({ Name = "Blobman", Side = "Left" })
UI.Sect.AntiBlobSection:AddToggle({
	Name = "Anti blobman",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiBlobToggle",
	Callback = function(antiBlobmanEn)
		tbl7.AntiBlobmanEn = antiBlobmanEn
		if tbl7.AntiBlobmanEn then
			for _, v in tbl8.GetAllToys(true), nil, nil do
				if v.Name == "CreatureBlobman" and not v.Parent.Name == localPlayer.Name .. "SpawnedInToys" then
					local leftDetector = v:WaitForChild("LeftDetector", 3)
					local rightDetector = v:WaitForChild("RightDetector", 3)
					leftDetector = leftDetector and leftDetector:WaitForChild("AttachPlayer", 3)
					rightDetector = rightDetector and rightDetector:WaitForChild("AttachPlayer", 3)
					if leftDetector then
						leftDetector:Destroy()
					end
					if rightDetector then
						rightDetector:Destroy()
					end
				end
			end
		end
		while tbl7.AntiBlobmanEn do
			if tbl5.Root and tbl5.Root.Massless then
				tbl5.Root.Massless = false
			end
			task.wait()
		end
	end,
})
UI.Sect.AntiBlobSection:AddToggle({
	Name = "Anti blobman Aura Grab",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiBlobAuraToggle",
	Callback = function(antiBlobmanGrabAuraEn)
		tbl7.AntiBlobmanGrabAuraEn = antiBlobmanGrabAuraEn
		while tbl7.AntiBlobmanGrabAuraEn do
			for _, v in tbl2.Players:GetPlayers() do
				if v and v.Character and v ~= localPlayer then
					local v2 = tbl8.GetChar(v)
					local v3 = v2 and tbl8.GetRoot(v2)
					v2 = v2 and tbl8.GetHum(v2)
					if v3 and tbl5.Root and v2 then
						if v2.SeatPart and v2.SeatPart.Parent and v2.SeatPart.Parent.Name == "CreatureBlobman" then
							if tbl8.GetMagnitude(v3, tbl5.Root) <= 19 then
								tbl8.SNO(v3)
								task.wait()
							end
						end
					end
				end
				task.wait()
			end
			task.wait()
		end
	end,
})
UI.Sect.AntiBlobSection:AddToggle({
	Name = "Auto sit blobman",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "AutoSitBlobToggle",
	Callback = function(autoSitBlobmanEn)
		tbl7.AutoSitBlobmanEn = autoSitBlobmanEn
		while tbl7.AutoSitBlobmanEn and task.wait() do
			local creatureBlobman = tbl5.MyToys:FindFirstChild("CreatureBlobman")
			if not creatureBlobman then
				tbl8.SpawnToy("CreatureBlobman", tbl5.Root.CFrame)
				tbl5.MyToys.ChildAdded:Once(function(child)
					if child.Name == "CreatureBlobman" then
						creatureBlobman = child
					end
				end)
			end
			creatureBlobman = tbl5.MyToys:WaitForChild("CreatureBlobman", 0.5)
			if creatureBlobman then
				local vehicleSeat = creatureBlobman:FindFirstChild("VehicleSeat") or creatureBlobman:WaitForChild("VehicleSeat", 0.5)
				local flag = vehicleSeat and tbl5.Hum and tbl5.Hum.Health ~= 0
				if flag then
					local dead = Enum.HumanoidStateType.Dead
					flag = tbl5.Hum:GetState() ~= dead
				end
				if flag then
					vehicleSeat:Sit(tbl5.Hum)
				end
			end
		end
	end,
})
UI.Sect.AntiLagSection = UI.Tabs.DefenseTab:AddSection({ Name = "Anti lagg", Side = "Right" })
UI.Elm.AntilagToggle = UI.Sect.AntiLagSection:AddToggle({
	Name = "Anti lagg",
	Default = true,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiLaggToggle",
	Settings = true,
	Callback = function(antiLaggEn)
		tbl4.LinesPerSec = 0
		tbl7.AntiLaggEn = antiLaggEn
		tbl5.BeamMove.Disabled = tbl7.AntiLaggEn
		if not tbl7.AntiLaggEn then
			return
		end
		for _, v in tbl2.Players:GetPlayers() do
			if v.Character then
				local grabParts = v.Character:FindFirstChild("GrabParts")
				if grabParts then
					grabParts:Destroy()
				end
			end
		end
	end,
})
UI.Elm.AntilagToggle:AddToggle({
	Name = "Auto anti lagg",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AutoAntiLaggToggle",
	Callback = function(autoAntiLagEn)
		tbl7.AutoAntiLagEn = autoAntiLagEn
		local n = tick() - 10
		tbl4.LinesPerSec = 0
		local antilagToggle = UI.Elm.AntilagToggle
		while tbl7.AutoAntiLagEn do
			if tbl4.LinesPerSec >= 100 then
				if not antilagToggle.Value then
					tbl8.Notify("Line lag detected", string.format("%s (%s) lagged", tbl4.LineOwner.DisplayName, tbl4.LineOwner.Name))
					antilagToggle:Set(true)
				end
			elseif antilagToggle.Value and tick() - n > 10 then
				antilagToggle:Set(false)
			end
			tbl4.LinesPerSec = 0
			task.wait(3)
		end
	end,
})
UI.Sect.AntiLagSection:AddToggle({
	Name = "Anti sticky lagg",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiStickyLagToggle",
	Callback = function(antiShurikenLagEn)
		tbl7.AntiShurikenLagEn = antiShurikenLagEn
		if tbl5.PlayerScripts then
			local stickyPartsTouchDetection = tbl5.PlayerScripts:FindFirstChild("StickyPartsTouchDetection")
			if stickyPartsTouchDetection then
				stickyPartsTouchDetection.Disabled = tbl7.AntiShurikenLagEn
			end
		end
	end,
})
tbl4.InstrumentName = "FoodHamburger"
UI.Elm.AntiInputToggle = UI.Sect.AntiLagSection:AddToggle({
	Name = "Anti input lagg",
	Default = false,
	Flag = "AntiInputLagToggle",
	Settings = true,
	Callback = function(antiInputLagEn)
		tbl7.AntiInputLagEn = antiInputLagEn
		tbl7.AntiInputEn = true
		tbl7.AntiInputSpawnEn = true
		if tbl5.MyToys:FindFirstChild("AntiInputLag") then
			tbl8.DestroyToy(tbl5.MyToys:FindFirstChild("AntiInputLag"))
		end
		if not tbl7.AntiInputLagEn then
			return
		end
		tbl.AntiInputToy = nil
		tbl.SpawnedAntiInput = false
		local function fn2()
			while tbl7.AntiInputLagEn and not tbl.AntiInputToy do
				if localPlayer.InPlot.Value then
					return
				end
				while true do
					task.wait()
					if not (tbl5.Hum and tbl5.Hum.Health ~= 0 and tbl5.Root) then
						continue
					end
					break
				end
				repeat
					task.wait()
				until localPlayer.CanSpawnToy.Value
				if tbl.AntiInputToy then
					return
				end
				if tbl4.InstrumentName == "..." or tbl4.InstrumentName == "" then
					return
				end
				tbl8.SpawnToy(tbl4.InstrumentName, tbl5.Root.CFrame * CFrame.new(0, 10000, 0), function(antiInputToy)
					tbl.AntiInputToy = antiInputToy
				end)
				CallbackWait = true
				task.wait(0.01)
			end
			tbl.SpawnedAntiInput = true
		end
		while tbl7.AntiInputLagEn do
			if not tbl.SpawnedAntiInput then
				fn2()
			end
			task.wait(0.01)
		end
	end,
})
UI.Elm.AntiInputToggle:AddToggle({
	Name = "Auto anti input",
	Default = false,
	Flag = "AutoAntiInputLagToggle",
	Callback = function(autoAntiInputEn)
		tbl7.AutoAntiInputEn = autoAntiInputEn
		tbl7.AntiInputEn = true
		tbl7.AntiInputSpawnEn = true
	end,
})
UI.Elm.AntiEatInputToggle = {}
UI.Elm.InvisAntiInputToggle = UI.Elm.AntiInputToggle:AddToggle({
	Name = "Invisible anti input",
	Default = false,
	Flag = "InvisAntiInputLagToggle",
	Callback = function(invisAntiInputEn)
		tbl7.InvisAntiInputEn = invisAntiInputEn
		if not tbl7.InvisAntiInputEn then
			return
		end
		if UI.Elm.AntiEatInputToggle.Value then
			UI.Elm.AntiEatInputToggle:Set(false)
		end
	end,
})
UI.Elm.AntiEatInputToggle = UI.Elm.AntiInputToggle:AddToggle({
	Name = "Anti eat",
	Default = false,
	Flag = "AntiEatInputToggle",
	Callback = function(antiEatInputEn)
		tbl7.AntiEatInputEn = antiEatInputEn
		if not tbl7.AntiEatInputEn then
			return
		end
		if UI.Elm.InvisAntiInputToggle.Value then
			UI.Elm.InvisAntiInputToggle:Set(false)
		end
	end,
})
UI.Elm.AntiInputToggle:AddToggle({
	Name = "Transparent anti input",
	Default = false,
	Flag = "AntiEatInputToggle",
	Callback = function(antiInputTransparent)
		tbl7.AntiInputTransparent = antiInputTransparent
	end,
})
UI.Elm.AntiInputToggle:AddDropdown({
	Name = "Anti input toy",
	Default = "FoodHamburger",
	Flag = "AntiinputToyDropdown",
	Options = {
		"FoodHamburger",
		"CupMugBrown",
		"CupMugWhite",
		"FoodBread",
		"FoodBroccoli",
		"FoodCakePink",
		"FoodCoconut",
		"FoodDippyEgg",
		"FoodDonut",
		"FoodFrenchFries",
		"FoodHotdog",
		"FoodMayonnaise",
		"FoodMeatStick",
		"FoodMushroomPoison",
		"FoodPizzaCheese",
		"FoodPizzaPepperoni",
		"FoodSodaCan",
		"PoopPile",
		"PoopPileSparkle",
		"InstrumentBrassBugle",
		"InstrumentBrassTrumpet",
		"InstrumentBrassVuvuzela",
		"InstrumentDrumBongos",
		"InstrumentDrumSnare",
		"InstrumentGuitarAcoustic",
		"InstrumentGuitarBanjo",
		"InstrumentGuitarLyre",
		"InstrumentGuitarUkulele",
		"InstrumentGuitarViolin",
		"InstrumentPianoKeyboard",
		"InstrumentPianoMelodica",
		"InstrumentVoiceMicrophone",
		"InstrumentWoodwindOcarina",
		"InstrumentWoodwindSaxophone",
	},
	Search = true,
	Callback = function(instrumentName)
		tbl4.InstrumentName = instrumentName
		if tbl.AntiInputToy then
			tbl8.DestroyToy(tbl.AntiInputToy)
			tbl.AntiInputToy = nil
		end
	end,
})
UI.Elm.AntiInputToggle:AddSlider({
	Name = "Anti input delay",
	Min = 0,
	Max = 1,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "Seconds",
	Increment = 0.01,
	Default = tbl4.AntiinputDelay,
	Flag = "AntiInputDelaySlider",
	Callback = function(antiinputDelay)
		tbl4.AntiinputDelay = antiinputDelay
	end,
})
UI.Sect.OtherSectionDefense = UI.Tabs.DefenseTab:AddSection({ Name = "Other", Side = "Right" })
UI.Sect.OtherSectionDefense:AddToggle({
	Name = "Anti explosion",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiExplosionToggle",
	Callback = function(antiExplosion)
		tbl7.AntiExplosion = antiExplosion
	end,
})
UI.Sect.OtherSectionDefense:AddToggle({
	Name = "Anti burn",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiBurnToggle",
	Callback = function(antiBurnEn)
		tbl7.AntiBurnEn = antiBurnEn
		while tbl7.AntiBurnEn do
			if tbl5.Root and tbl5.Root:FindFirstChild("FireParticleEmitter") then
				local fireExtinguisher = tbl5.MyToys:FindFirstChild("FireExtinguisher")
				if not fireExtinguisher then
					tbl8.SpawnToy("FireExtinguisher", tbl5.Root.CFrame * CFrame.new(0, 100, 0))
					task.wait(0.5)
					fireExtinguisher = tbl5.MyToys:FindFirstChild("FireExtinguisher")
				end
				if fireExtinguisher then
					local extinguishPart = fireExtinguisher:WaitForChild("ExtinguishPart", 1)
					if extinguishPart then
						while tbl5.Root and tbl5.Root:FindFirstChild("FireParticleEmitter") do
							extinguishPart.Position = tbl5.Root.Position
							extinguishPart.Size = Vector3.new(100, 100, 100)
							task.wait()
							extinguishPart.Position = Vector3.new(-1000, 0, 0)
							task.wait()
						end
					end
					tbl8.DestroyToy(fireExtinguisher)
					task.wait(0.05)
				end
			end
			task.wait(0.01)
		end
	end,
})
UI.Sect.OtherSectionDefense:AddToggle({
	Name = "Anti paint",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiPaintToggle",
	Callback = function(antiPaintEn)
		tbl7.AntiPaintEn = antiPaintEn
		if tbl7.AntiPaintEn then
			local function fn2()
				if not tbl5.Head then
					return
				end
				tbl8.AddConnection("AntiPaintConn", tbl5.Head.ChildAdded, function(arg)
					if arg.Name ~= "PaintParticleEmitter" then
						return
					end
					if arg.Lifetime ~= NumberRange.new(2.4, 2.4) then
						task.wait(2)
						local cFrame = tbl5.Head.CFrame
						tbl5.Head.Velocity = Vector3.new(0, 200, 0)
						tbl5.Head.CFrame = CFrame.new(63, -68, 274)
						task.wait(0.1)
						tbl5.Head.Velocity = Vector3.new(0, 200, 0)
						tbl5.Head.CFrame = CFrame.new(63, -68, 274)
						task.wait(0.1)
						tbl5.Head.CFrame = cFrame
						tbl5.Head.Velocity = tbl4.VectorZero
					end
				end)
			end
			fn2()
			tbl8.AddConnection("AntiPaintCharAddedConn", localPlayer.CharacterAdded, fn2)
		else
			tbl8.RemoveConnection("AntiPaintConn")
			tbl8.RemoveConnection("AntiPaintCharAddedConn")
		end
	end,
})
UI.Sect.OtherSectionDefense:AddToggle({
	Name = "Anti void",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AntiVoidToggle",
	Callback = function(antiVoidEn)
		tbl7.AntiVoidEn = antiVoidEn
		workspace.FallenPartsDestroyHeight = tbl7.AntiVoidEn and "nan" or -100
	end,
})
UI.Sect.OtherSectionDefense:AddToggle({
	Name = "Water walk",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "WaterWalkToggle",
	Callback = function(waterWalkEn)
		tbl7.WaterWalkEn = waterWalkEn
		xpcall(function()
			local objectModel = workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel
			if objectModel then
				for _, v in objectModel:GetChildren() do
					if v:IsA("Part") and v.Name == "Ocean" then
						v.CanCollide = tbl7.WaterWalkEn
					end
				end
			end
		end, function()
			tbl8.Notify("Missing Ocean", "idk why there's no ocean on the map lol xd", 2)
		end)
	end,
})
UI.Sect.OtherSectionDefense:AddToggle({
	Name = "Save position",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "SavePositionToggle",
	Callback = function(savePositionEn)
		tbl7.SavePositionEn = savePositionEn
		if tbl7.SavePositionEn then
			local cFrame = nil
			local function fn2()
				if tbl5.Hum then
					tbl8.AddConnection("DiedConnSavePos", tbl5.Hum.Died, function()
						cFrame = tbl5.Root and tbl5.Root.CFrame
						tbl8.RemoveConnection("DiedConnSavePos")
					end)
				end
			end
			tbl8.AddConnection("CharacterAddedConnSavePos", localPlayer.CharacterAdded, function(arg)
				tbl5.Root = tbl8.GetRoot(arg)
				tbl5.Hum = tbl8.GetHum(arg)
				if cFrame and cFrame.Position.Magnitude < 4000 then
					tbl7.IsTeleporting = true
					for i = 1, 20 do
						if tbl5.Root then
							tbl5.Root.CFrame = cFrame
							tbl5.Root.Velocity = tbl4.VectorZero
						end
						task.wait()
					end
					tbl7.IsTeleporting = false
				end
				fn2()
			end)
			fn2()
		else
			tbl8.RemoveConnection("CharacterAddedConnSavePos")
			tbl8.RemoveConnection("DiedConnSavePos")
		end
	end,
})
UI.Sect.FarmSection = UI.Tabs.DefenseTab:AddSection({ Name = "Houses", Side = "Right" })
UI.Sect.FarmSection:AddToggle({
	Name = "Auto save house time",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AutoHouseToggle",
	Callback = function(autoHouseEn)
		tbl7.AutoHouseEn = autoHouseEn
		while tbl7.AutoHouseEn do
			if not tbl5.Root then
				return
			end
			local v = tbl8.GetPlot()
			if not v then
				return
			end
			local v2 = workspace.Plots[v]
			if not v2 then
				return
			end
			local plotSign = v2:FindFirstChild("PlotSign")
			if not plotSign then
				return
			end
			local value = plotSign:FindFirstChild("ThisPlotsOwners") and plotSign.ThisPlotsOwners:FindFirstChild("Value")
			if not (value and value.Value == localPlayer.Name) then
				return
			end
			local timeRemainingNum = value:FindFirstChild("TimeRemainingNum")
			local metal = v2.TeslaCoil and v2.TeslaCoil:FindFirstChild("Metal")
			if not (timeRemainingNum and metal and timeRemainingNum.Value <= 15 and timeRemainingNum.Value > 0) then
				return
			end
			local grabParts = workspace:FindFirstChild("GrabParts")
			local grabPart = nil
			local bodyPosition = nil
			if grabParts then
				grabPart = grabParts:FindFirstChild("GrabPart")
				grabPart = grabPart and grabPart:FindFirstChild("WeldConstraint")
				grabPart = grabPart and grabPart.Part1
				bodyPosition = nil
				if grabPart then
					bodyPosition = grabPart:FindFirstChild("BodyPosition")
					if not bodyPosition then
						bodyPosition = Instance.new("BodyPosition", grabPart)
						bodyPosition.D = 100
						bodyPosition.MaxForce = tbl4.VectorInf
					end
					bodyPosition.Position = grabPart.Position
				end
			end
			local figureGrabEn = tbl7.FigureGrabEn
			local controlFlyEn = tbl7.ControlFlyEn
			tbl7.FigureGrabEn = false
			tbl7.ControlFlyEn = false
			local cFrame = tbl5.Root.CFrame * CFrame.new(0, 5, 0)
			local n = 0
			while timeRemainingNum and timeRemainingNum.Value <= 15 and tbl5.Root and n < 30 do
				tbl5.Root.CFrame = metal.CFrame * CFrame.new(0, -5, 0)
				tbl5.Root.Velocity = tbl4.VectorZero
				task.wait()
				n += 1
			end
			if tbl5.Root then
				tbl5.Root.CFrame = cFrame
				tbl5.Root.Velocity = tbl4.VectorZero
			end
			tbl7.FigureGrabEn = figureGrabEn
			tbl7.ControlFlyEn = controlFlyEn
			if bodyPosition then
				bodyPosition:Destroy()
				if grabPart then
					grabPart.Velocity = tbl4.VectorZero
				end
			end
			task.wait(0.1)
		end
	end,
})
UI.Sect.FarmSection:AddToggle({
	Name = "Noclip barrier",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "NoclipBarrierToggle",
	Callback = function(antiBarrierEn)
		tbl7.AntiBarrierEn = antiBarrierEn
		for i = 1, 5 do
			for _, v in workspace.Plots["Plot" .. i].Barrier:GetChildren() do
				if v:IsA("BasePart") then
					v.CanCollide = not tbl7.AntiBarrierEn
					v.CanQuery = not tbl7.AntiBarrierEn
				end
			end
		end
	end,
})
UI.Sect.RinneganSection = UI.Tabs.DefenseTab:AddSection({ Name = "Counter attack", Side = "Right" })
tbl4.RinneganMode = ""
UI.Elm.CounterAttackToggle = UI.Sect.RinneganSection:AddToggle({
	Name = "Counter attack",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "CounterAttackToggle",
	Settings = true,
	Callback = function(counterAttackEn)
		tbl7.CounterAttackEn = counterAttackEn
		if tbl7.CounterAttackEn then
			local function fn2()
				if not tbl5.Head then
					return
				end
				tbl8.AddConnection("RinneganConn", tbl5.Head.ChildAdded, function(arg)
					if arg.Name ~= "PartOwner" then
						return
					end
					local v = tbl2.Players:FindFirstChild(arg.Value)
					workspace:FindFirstChild(arg.Value)
					local v2 = workspace:FindFirstChild(arg.Value .. "SpawnedInToys")
					if tbl4.RinneganMode == "Grab" then
						v = v and tbl8.GetChar(v)
						v = v and tbl8.GetRoot(v)
						if not v then
							return
						end
						tbl8.SNO(v)
					elseif tbl4.RinneganMode == "Kill gucci" then
						if not tbl4.LoopingNow then
							local tbl9 = {}
							local cFrame = tbl5.Root.CFrame
							for _, v3 in v2:GetChildren() do
								if v3.Name == "CreatureBlobman" or v3.Name == "TractorGreen" or v3.Name == "TractorRed" or v3.Name == "TractorOrange" then
									if v3.Parent and v3.Parent.Name == v.Name .. "SpawnedInToys" then
										table.insert(tbl9, v3)
										print("Add")
									end
								end
							end
							tbl4.LoopingNow = true
							while #tbl9 > 0 do
								for i = #tbl9, 1, -1 do
									local v3 = tbl9[i]
									if not v3 or not v3.Parent then
										table.remove(tbl9, i)
									else
										local vehicleSeat = v3:FindFirstChild("VehicleSeat")
										if vehicleSeat and not vehicleSeat.Occupant then
											local flag = false
											for i2 = 1, 30 do
												if vehicleSeat.Occupant == tbl5.Hum then
													flag = true
													break
												else
													vehicleSeat:Sit(tbl5.Hum)
													if vehicleSeat.Occupant == tbl5.Hum then
														flag = true
														break
													else
														task.wait()
													end
												end
											end
											if flag then
												table.remove(tbl9, i)
											end
											while tbl5.Hum.Sit do
												tbl5.Hum.Sit = false
											end
											task.wait(0.01)
										end
									end
								end
								task.wait()
							end
							if tbl5.Root then
								tbl5.Root.CFrame = cFrame
								tbl5.Root.Velocity = tbl4.VectorZero
							end
							if workspace[localPlayer.Name] then
								local v3 = workspace[localPlayer.Name]
								task.wait(0.5)
								local localCreatureControl = v3:WaitForChild("LocalCreatureControl", 5)
								if localCreatureControl then
									localCreatureControl:Destroy()
								end
								v3.GrabbingScript.Enabled = false
								task.wait()
								v3.GrabbingScript.Enabled = true
								task.wait(1)
								local camPart = v3:FindFirstChild("CamPart")
								if camPart then
									camPart:Destroy()
								end
							end
							tbl4.LoopingNow = false
						end
					end
				end)
			end
			fn2()
			tbl8.AddConnection("CharAddedRinneganConn", localPlayer.CharacterAdded, function()
				task.wait(0.2)
				fn2()
			end)
		else
			tbl8.RemoveConnection("RinneganConn")
			tbl8.RemoveConnection("CharAddedRinneganConn")
		end
	end,
})
UI.Elm.CounterAttackToggle:AddDropdown({
	Name = "Counter mode",
	Default = "Kill gucci",
	Options = { "Grab", "Kill gucci" },
	Flag = "CounterModeDropdown",
	Callback = function(rinneganMode)
		tbl4.RinneganMode = rinneganMode
	end,
})
UI.Tabs.FunTab = UI.Window:MakeTab({ Name = "Fun", Icon = "banana" })
UI.Sect.OnGrabbedSection = UI.Tabs.FunTab:AddSection({ Name = "Loop ragdoll", Side = "Left" })
UI.Sect.OnGrabbedSection:AddToggle({
	Name = "Loop ragdoll",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "LoopRagdollToggle",
	Callback = function(loopRagdollMeEn)
		tbl7.LoopRagdollMeEn = loopRagdollMeEn
		while tbl7.LoopRagdollMeEn do
			if tbl5.Root then
				tbl8.Ragdoll(1)
			end
			task.wait(0.95)
		end
	end,
})
UI.Sect.FunLineSection = UI.Tabs.FunTab:AddSection({ Name = "Server", Side = "Right" })
tbl4.LobikStrength = 5
UI.Elm.LobikToggle = UI.Sect.FunLineSection:AddToggle({
	Name = "Lobotomy",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "LobikToggle",
	Settings = true,
	Callback = function(ragdollMeEn)
		tbl7.RagdollMeEn = ragdollMeEn
		while tbl7.RagdollMeEn do
			if tbl5.Root then
				for i = 1, tbl4.LobikStrength do
					tbl8.Ragdoll(0)
				end
			end
			task.wait()
		end
	end,
})
UI.Elm.LobikToggle:AddSlider({
	Name = "Lobotomy strength",
	Min = 1,
	Max = 10,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.LobikStrength,
	Flag = "LobikStrengthSlider",
	Callback = function(lobikStrength)
		tbl4.LobikStrength = lobikStrength
	end,
})
UI.Elm.LineLagToggle = UI.Sect.FunLineSection:AddToggle({
	Name = "Line lag server",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "LineLagToggle",
	Binded = true,
	Settings = true,
	Callback = function(lineLaggEn)
		tbl7.LineLaggEn = lineLaggEn
		while tbl7.LineLaggEn do
			local cframe = tbl7.MonsterLaggEn and CFrame.new(-2.3e9, 0, -2.3e9) or CFrame.new(0, 0, 0)
			local spawnLocation = workspace:FindFirstChild("SpawnLocation")
			for i = 1, tbl4.LineLagIntense do
				tbl6.CreateLineEvent:FireServer(spawnLocation, cframe)
			end
			task.wait(tbl4.LineLagDelay)
		end
	end,
})
UI.Elm.LineLagToggle:AddSlider({
	Name = "Lag intensity",
	Min = 1,
	Max = 4000,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.LineLagIntense,
	Flag = "LineLagIntensityToggle",
	Callback = function(lineLagIntense)
		tbl4.LineLagIntense = lineLagIntense
	end,
})
UI.Elm.LineLagToggle:AddSlider({
	Name = "Lag delay",
	Min = 0,
	Max = 2,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 0.1,
	Default = tbl4.LineLagDelay,
	Flag = "LineLagDelayToggle",
	Callback = function(lineLagDelay)
		tbl4.LineLagDelay = lineLagDelay
	end,
})
UI.Elm.LineLagToggle:AddToggle({
	Name = "Monster lag",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "MonsterLagToggle",
	Binded = true,
	Callback = function(monsterLaggEn)
		tbl7.MonsterLaggEn = monsterLaggEn
	end,
})
UI.Elm.PacketLagToggle = UI.Sect.FunLineSection:AddToggle({
	Name = "Packet lag server",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "PacketLagToggle",
	Binded = true,
	Settings = true,
	Callback = function(packetLaggEn)
		tbl7.PacketLaggEn = packetLaggEn
		while tbl7.PacketLaggEn do
			tbl6.ExtendLineEvent:FireServer(string.rep("FLOPPA LOVES YOU ", tbl4.LagIntense * 1176.55))
			task.wait(tbl4.LagDelay)
		end
	end,
})
UI.Elm.PacketLagToggle:AddSlider({
	Name = "Lag intensity",
	Min = 10,
	Max = 1000,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 10,
	Default = tbl4.LagIntense,
	Flag = "LagIntensityToggle",
	Callback = function(lagIntense)
		tbl4.LagIntense = lagIntense
		local v = tbl8.GetSizeMB(13 + 17 * tbl4.LagIntense * 1176.55)
		UI.Elm.PacketLagToggle:SetName(string.format("Packet lag server (%s mb)", v))
	end,
})
UI.Elm.PacketLagToggle:AddSlider({
	Name = "Lag delay",
	Min = 0,
	Max = 5,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 0.1,
	Default = tbl4.LagDelay,
	Flag = "LagDelayToggle",
	Callback = function(lagDelay)
		tbl4.LagDelay = lagDelay
	end,
})
UI.Sect.OtherSectionFun = UI.Tabs.FunTab:AddSection({ Name = "Other", Side = "Left" })
UI.Sect.OtherSectionFun:AddButton({
	Name = "Kill all gucci",
	Callback = function()
		local v = tbl8.GetAllToys(true)
		local tbl9 = {}
		if tbl5.Root then
			local cFrame = tbl5.Root.CFrame
			for _, v2 in v, nil, nil do
				if v2.Name == "CreatureBlobman" or v2.Name:match("Tractor") then
					tbl9[#tbl9 + 1] = v2
				end
			end
			for _, v2 in tbl9, nil, nil do
				for i = 1, 2 do
					local vehicleSeat = v2:FindFirstChild("VehicleSeat")
					if vehicleSeat and not vehicleSeat.Occupant and tbl5.Hum then
						vehicleSeat:Sit(tbl5.Hum)
						task.wait(0.2)
						tbl5.Hum.Sit = false
						task.wait(0.1)
					end
				end
			end
			task.wait(0.1)
			if tbl5.Root then
				tbl5.Root.CFrame = cFrame
				tbl5.Root.Velocity = tbl4.VectorZero
			end
		end
	end,
})
UI.Sect.OtherSectionFun:AddToggle({
	Name = "Remove all invisibilities",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "RemoveAllInvisToggle",
	Callback = function(removeAllInvisEn)
		tbl7.RemoveAllInvisEn = removeAllInvisEn
		while tbl7.RemoveAllInvisEn do
			for _, v in tbl2.Players:GetPlayers() do
				if v ~= localPlayer then
					local character = v.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if character and character.Massless then
						character.Massless = false
					end
				end
			end
			task.wait()
		end
	end,
})
UI.Sect.TractorSection = UI.Tabs.FunTab:AddSection({ Name = "Tractor", Side = "Left" })
UI.Elm.TractorJump = UI.Sect.TractorSection:AddBind({
	Name = "Tractor Jump",
	Default = "",
	Hold = false,
	Flag = "TractorJumpBind",
	Callback = function()
		if tbl5.Hum then
			local seatPart = tbl5.Hum.SeatPart
			if seatPart and seatPart.Parent then
				local parent = seatPart.Parent
				if parent.Name == "TractorGreen" or parent.Name == "TractorRed" or parent.Name == "TractorOrange" then
					tbl5.Hum.JumpPower = 0
					task.wait(0.05)
					local main = parent:FindFirstChild("Main")
					if main then
						tbl8.AddVelocity(main, "TractorJump", Vector3.new(0, 50, 0), 0.1)
					end
					task.wait(0.1)
					tbl5.Hum.JumpPower = 24
				end
			end
		end
	end,
})
UI.Sect.TractorSection:AddToggle({
	Name = "Killer tractor",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "KillerTractorToggle",
	Callback = function(tractorKillerEn)
		tbl7.TractorKillerEn = tractorKillerEn
		while tbl7.TractorKillerEn do
			if tbl5.Hum and tbl5.Root then
				local seatPart = tbl5.Hum.SeatPart
				local motorArea = seatPart and seatPart.Parent and seatPart.Parent:FindFirstChild("MotorArea")
				if not (seatPart and seatPart.Parent and motorArea) then
					return
				end
				for _, v in tbl2.Players:GetPlayers() do
					if v ~= localPlayer then
						local character = v.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						local humanoid = character and character:FindFirstChild("Humanoid")
						character = character and character:FindFirstChild("Head")
						if not (not humanoidRootPart or not humanoid or not character) then
							if tbl8.GetMagnitude(motorArea, humanoidRootPart) <= 5 then
								while true do
									local flag = not character:FindFirstChild("PartOwner")
									if not flag then
										flag = character:FindFirstChild("PartOwner")
										if flag then
											local name = localPlayer.Name
											flag = character:FindFirstChild("PartOwner").Value ~= name
										end
									end
									if flag then
										tbl8.SNO(humanoidRootPart)
										task.wait(0.01)
										continue
									end
									break
								end
								humanoid:ChangeState(Enum.HumanoidStateType.Dead)
								tbl6.DestroyLineEvent:FireServer(humanoidRootPart)
							end
						end
					end
				end
			end
			task.wait(0.1)
		end
	end,
})
UI.Sect.TractorSection:AddToggle({
	Name = "Moto tractor",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "MotoTractorBind",
	Callback = function(motoTractorEn)
		tbl7.MotoTractorEn = motoTractorEn
		while tbl7.MotoTractorEn do
			if tbl5.Hum then
				local seatPart = tbl5.Hum.SeatPart
				if seatPart then
					local parent = seatPart.Parent
					if parent then
						local axel1 = parent:FindFirstChild("Axel1")
						local axel2 = parent:FindFirstChild("Axel2")
						local hitbox = parent:FindFirstChild("Hitbox")
						if axel1 and axel1:FindFirstChild("HingeConstraint") then
							axel1.HingeConstraint.MotorMaxAcceleration = 50000
						end
						if axel2 and axel2:FindFirstChild("HingeConstraint") then
							axel2.HingeConstraint.MotorMaxAcceleration = 50000
						end
						if hitbox then
							hitbox.CustomPhysicalProperties = PhysicalProperties.new(10, 1, 1, 2, 1)
						end
					end
				end
			end
			task.wait(0.5)
		end
	end,
})
UI.Sect.LocalCharacterSection = UI.Tabs.FunTab:AddSection({ Name = "Me", Side = "Left" })
UI.Sect.LocalCharacterSection:AddToggle({
	Name = "Basketball silent aim",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "BasketballAimToggle",
	Callback = function(basketballSilentAimEn)
		tbl7.BasketballSilentAimEn = basketballSilentAimEn
		if tbl7.BasketballSilentAimEn then
			tbl8.AddConnection("BasketballAimConn", workspace.ChildAdded, function(arg)
				if arg.Name == "GrabParts" and tbl7.BasketballSilentAimEn then
					local grabPart = arg:FindFirstChild("GrabPart")
					grabPart = grabPart and grabPart:FindFirstChild("WeldConstraint")
					local part1 = grabPart and grabPart.Part1
					if part1 then
						local connection = nil
						connection = arg:GetPropertyChangedSignal("Parent"):Connect(function()
							if not arg.Parent and tbl2.UIS:GetLastInputType() == tbl3.Mouse2 then
								local function fn2()
									local v = nil
									if tbl5.Root then
										local huge = math.huge
										v = nil
										for _, v2 in workspace.Other:GetChildren() do
											if v2.Name == "Hoop" then
												local soundPart = v2:FindFirstChild("SoundPart")
												if soundPart then
													local v3 = tbl8.GetMagnitude(tbl5.Root, soundPart)
													if v3 < huge then
														huge = v3
														v = v2
													end
												end
											end
										end
									end
									return v
								end
								local v = fn2()
								if v then
									local n = v:GetChildren()[2].CFrame * CFrame.new(0, 10, 3)
									local linearVelocity = Instance.new("LinearVelocity", part1)
									linearVelocity.MaxForce = math.huge
									local n2 = n.Position - part1.Position
									local unit = Vector3.new(n2.X, 0, n2.Z).Unit
									local sqrt = math.sqrt
									local gravity = workspace.Gravity
									local v2 = sqrt(Vector3.new(n2.X, 0, n2.Z).Magnitude * gravity / 1)
									linearVelocity.VectorVelocity = unit * v2 * 0.70710678118654757 + Vector3.new(0, v2 * 0.70710678118654746, 0)
									linearVelocity.Attachment0 = part1:FindFirstChild("BasketballAttachment") or Instance.new("Attachment", part1)
									linearVelocity.Attachment0.Name = "BasketballAttachment"
									task.delay(0.05, function()
										linearVelocity:Destroy()
									end)
								end
								connection:Disconnect()
							end
						end)
					end
				end
			end)
		else
			tbl8.RemoveConnection("BasketballAimConn")
		end
	end,
})
UI.Sect.LocalCharacterSection:AddToggle({
	Name = "Coconuts",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "CoconutsBoobsToggle",
	Callback = function(coconutsEn)
		tbl7.CoconutsEn = coconutsEn
		local tbl9 = {}
		local tbl10 = {}
		local cframe = CFrame.new(-0.45, 0.25, -0.7)
		local cframe2 = CFrame.new(0.45, 0.25, -0.7)
		local cframe3 = CFrame.new(-0.45, -1, 0.7)
		local cframe4 = CFrame.new
		tbl10[1] = cframe
		tbl10[2] = cframe2
		tbl10[3] = cframe3
		do
			local values = table.pack(cframe4(0.45, -1, 0.7))
			table.move(values, 1, values.n, 4, tbl10)
		end
		while tbl7.CoconutsEn do
			for _, v in tbl5.MyToys:GetChildren() do
				if v.Name == "FoodCoconut" then
					tbl9[#tbl9 + 1] = v
				end
			end
			if #tbl9 ~= 4 and tbl5.Root then
				tbl8.SpawnToy("FoodCoconut", tbl5.Root.CFrame * CFrame.new(-5, 0, 10))
			end
			for i = 1, #tbl9 do
				local v = tbl9[i]
				local soundPart = v and v:FindFirstChild("SoundPart")
				local holdPart = v and v:FindFirstChild("HoldPart")
				local rigidConstraint = holdPart and holdPart:FindFirstChild("RigidConstraint")
				local partOwner = soundPart and soundPart:FindFirstChild("PartOwner")
				if tbl5.Root and v and soundPart and holdPart and rigidConstraint then
					if partOwner and partOwner.Value == localPlayer.Name then
						soundPart.CFrame = tbl5.Root.CFrame * tbl10[i] * CFrame.new(tbl5.Root.Velocity / 100)
						soundPart.Velocity = Vector3.zero
					end
					if not partOwner or partOwner and partOwner.Value ~= localPlayer.Name then
						tbl8.SNO(soundPart)
					end
					if rigidConstraint.Attachment1 then
						tbl8.DestroyToy(v)
					end
					for _, v2 in v:GetChildren() do
						if v2:IsA("BasePart") then
							v2.CanCollide = false
							v2.CanQuery = false
							if v2.Transparency ~= 1 then
								v2.Transparency = 0.7
							end
						end
					end
				end
			end
			tbl9 = {}
			task.wait(0.001)
		end
	end,
})
tbl4.CocoLength = 10
UI.Elm.CocodickToggle = UI.Sect.LocalCharacterSection:AddToggle({
	Name = "Cocodick",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "CocodickToggle",
	Settings = true,
	Callback = function(coconutsDickEn)
		tbl7.CoconutsDickEn = coconutsDickEn
		tbl4.CoconutsDick = {}
		local tbl9 = { CFrame.new(-0.45, -1.2, -0.7), CFrame.new(0.45, -1.2, -0.7), (CFrame.new(0, -1, 0.8)) }
		while tbl7.CoconutsDickEn do
			if #tbl4.CoconutsDick ~= tbl4.CocoLength + 2 and tbl5.Root then
				tbl8.SpawnToy("FoodCoconut", tbl5.Root.CFrame)
			end
			if tbl5.Root then
				for i = 1, #tbl4.CoconutsDick do
					local v = tbl4.CoconutsDick[i]
					if not v or not v.Parent then
						table.remove(tbl4.CoconutsDick, i)
					else
						local soundPart = v and v:WaitForChild("SoundPart", 2)
						local holdPart = v and v:WaitForChild("HoldPart", 2)
						local rigidConstraint = holdPart and holdPart:WaitForChild("RigidConstraint", 2)
						local partOwner = soundPart and soundPart:FindFirstChild("PartOwner")
						if v and soundPart and holdPart and rigidConstraint then
							if partOwner and partOwner.Value == localPlayer.Name then
								if i <= 2 then
									soundPart.CFrame = tbl5.Root.CFrame * tbl9[i] * CFrame.new(tbl5.Root.Velocity / 100)
								else
									soundPart.CFrame = tbl5.Root.CFrame * tbl9[3] * CFrame.new(tbl5.Root.Velocity / 100) * CFrame.new(0, 0, tbl9[3].Z - i + 0.2)
								end
								soundPart.Velocity = Vector3.zero
							end
							if not partOwner or partOwner and partOwner.Value ~= localPlayer.Name then
								tbl8.SNO(soundPart)
							end
							if rigidConstraint.Attachment1 then
								tbl8.DestroyToy(v)
							end
							for _, v2 in v:GetChildren() do
								if v2:IsA("BasePart") and (v2.CanCollide or v2.CanQuery) then
									v2.CanCollide = false
									v2.CanQuery = false
								elseif v2:IsA("BasePart") and v2.Transparency ~= 1 then
									v2.Transparency = 0
								end
							end
						end
					end
				end
			end
			task.wait(0.005)
		end
	end,
})
UI.Elm.CocodickToggle:AddSlider({
	Name = "Cocodick length",
	Min = 1,
	Max = 100,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.CocoLength,
	Flag = "CocoLengthSlider",
	Callback = function(cocoLength)
		tbl4.CocoLength = cocoLength
	end,
})
UI.Sect.ClearMapSection = UI.Tabs.FunTab:AddSection({ Name = "Clear Map", Side = "Right" })
UI.Sect.ClearMapSection:AddButton({
	Name = "Clear Map (toys)",
	Callback = function()
		local v = tbl8.GetAllToys(false)
		local tbl9 = {}
		if not tbl5.Char then
			return
		end
		if not v or #v == 0 then
			return
		end
		local cFrame = tbl5.Root and tbl5.Root.CFrame
		local cFrame2 = tbl5.Cam.CFrame
		local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
		if tbl5.PlayerScripts then
			local stickyPartsTouchDetection = tbl5.PlayerScripts:FindFirstChild("StickyPartsTouchDetection")
			if stickyPartsTouchDetection then
				stickyPartsTouchDetection.Disabled = true
			end
		end
		local cameraPartM1KP = workspace:FindFirstChild("CameraPartM1KP")
		if not cameraPartM1KP then
			cameraPartM1KP = Instance.new("Part", workspace)
			cameraPartM1KP.Name = "CameraPartM1KP"
			cameraPartM1KP.Anchored = true
			cameraPartM1KP.Transparency = 1
		end
		cameraPartM1KP.CFrame = CFrame.new(3, 763, -156)
		tbl5.Cam.CameraSubject = cameraPartM1KP
		localPlayer.CameraMaxZoomDistance = 0.5
		tbl5.Cam.CFrame = CFrame.new(0.12457823, 566.528442, -260.027649, -0.999988794, 0.00433969125, -0.00192745135, 0, 0.405909836, 0.91391319, 0.00474847201, 0.913902938, -0.405905247)
		local connection = tbl2.RunS.RenderStepped:Connect(function()
			if tbl5.Char then
				for _, v2 in tbl5.Char:GetChildren() do
					if v2:IsA("BasePart") and v2.CanCollide then
						v2.CanCollide = false
					end
				end
			end
		end)
		local n = 0
		for _, v2 in v, nil, nil do
			if v2.Name ~= "AntiKickPickaxe" and v2.Name ~= "RagdollPallet" and v2.Name ~= "NinjaShuriken" and v2.Name ~= "NinjaKunai" then
				for _, v3 in v2:GetDescendants() do
					if v3.Name == "TouchInterest" then
						v3:Destroy()
					end
				end
				task.wait()
				local children, v3, v4 = v2:GetChildren()
				local head = nil
				for _, v5 in children, v3, v4 do
					if v5:IsA("BasePart") and v5.CanQuery and v5.Position.Y < 1000 and v5.Position.Y > -500 then
						local flag = v5.Parent:FindFirstChild("VehicleSeat") and v5.Parent.VehicleSeat.Occupant ~= nil
						head = nil
						if not flag then
							head = v5
						end
						break
					else
						head = nil
					end
				end
				if head and tbl5.Root then
					local parent = head.Parent
					local flag = false
					if parent:FindFirstChild("Head") then
						head = head.Parent.Head
						flag = true
					end
					while n < 100 and head and head.Parent and (head:FindFirstChild("PartOwner") == nil or head.PartOwner.Value ~= localPlayer.Name) do
						tbl5.Root.CFrame = head.CFrame * CFrame.new(0, -15, 0)
						tbl5.Root.Velocity = tbl4.VectorZero
						task.wait()
						if flag then
							local humanoidRootPart = head.Parent:FindFirstChild("HumanoidRootPart")
							if humanoidRootPart and humanoidRootPart.CanQuery then
								tbl8.SNO(humanoidRootPart)
							elseif head.Parent:FindFirstChild("SoundPart") then
								tbl8.SNO(head.Parent.SoundPart)
							end
						else
							tbl8.SNO(head)
						end
						n += 1
					end
					local flag2 = head and head.Parent and head:FindFirstChild("PartOwner") and head.PartOwner.Value == localPlayer.Name
					n = 0
					if flag2 then
						tbl9[#tbl9 + 1] = v2
						if tbl7.InstaDeleteToysEn then
							workspace.FallenPartsDestroyHeight = -1500
							for _, v5 in v2:GetChildren() do
								if v5:IsA("BasePart") then
									v5.CFrame = CFrame.new(0, -1000, 0)
									tbl6.DestroyLineEvent:FireServer(v5)
								end
							end
						end
					end
				end
			end
		end
		tbl5.Cam.CameraSubject = tbl5.Hum
		tbl5.Cam.CFrame = cFrame2
		localPlayer.CameraMaxZoomDistance = 10000
		if tbl5.Root then
			tbl5.Root.CFrame = cFrame
		end
		workspace.FallenPartsDestroyHeight = -1500
		if not tbl7.InstaDeleteToysEn then
			for _, v2 in tbl9, nil, nil do
				for _, v3 in v2:GetChildren() do
					if v3:IsA("BasePart") then
						v3.CFrame = CFrame.new(0, -1000, 0)
						tbl6.DestroyLineEvent:FireServer(v3)
					end
				end
				if not tbl7.MaxSpeedClearToysEn then
					tbl2.RunS.RenderStepped:Wait()
				end
			end
		end
		if connection then
			connection:Disconnect()
		end
		if tbl5.PlayerScripts then
			local stickyPartsTouchDetection = tbl5.PlayerScripts:FindFirstChild("StickyPartsTouchDetection")
			if stickyPartsTouchDetection then
				stickyPartsTouchDetection.Disabled = false
			end
		end
		task.wait(2)
		workspace.FallenPartsDestroyHeight = -100
		task.wait(1.5)
		workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
		cameraPartM1KP:Destroy()
	end,
})
UI.Sect.ClearMapSection:AddToggle({
	Name = "Max speed delete toys (low fps)",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "MaxSpeedToysDeleteToggle",
	Callback = function(maxSpeedClearToysEn)
		tbl7.MaxSpeedClearToysEn = maxSpeedClearToysEn
	end,
})
UI.Sect.ClearMapSection:AddToggle({
	Name = "Instant delete",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "InstantToysDeleteToggle",
	Callback = function(instaDeleteToysEn)
		tbl7.InstaDeleteToysEn = instaDeleteToysEn
	end,
})
UI.Sect.RaidHouseSection = UI.Tabs.FunTab:AddSection({ Name = "Raid houses", Side = "Right" })
UI.Elm.HousesLabel = UI.Sect.RaidHouseSection:AddLabel("Target house: " .. (tbl4.SelectedHouse or "None"))
UI.Sect.RaidHouseSection:AddDropdown({
	Name = "Select house",
	Default = "",
	Options = { "Plot1 (Green)", "Plot2 (Pink)", "Plot3 (Purple)", "Plot4 (Blue)", "Plot5 (China)" },
	Callback = function(arg)
		local targetHouse = arg:split(" ")[1]
		tbl4.SelectedHouse = targetHouse
		if UI.Elm.HousesLabel then
			UI.Elm.HousesLabel:Set("Target house: " .. targetHouse)
		end
	end,
})
UI.Sect.RaidHouseSection:AddToggle({
	Name = "Raid house",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "RaidHouseToggle",
	Callback = function(houseRaidEn)
		tbl7.HouseRaidEn = houseRaidEn
		while tbl7.HouseRaidEn do
			if tbl5.Root and localPlayer.CanSpawnToy and not localPlayer.InPlot.Value then
				local youDecoy = tbl5.MyToys:FindFirstChild("YouDecoy")
				if not youDecoy then
					tbl8.SpawnToy("YouDecoy", tbl5.Root.CFrame * CFrame.new(0, -10, 5))
					task.wait(0.5)
					youDecoy = tbl5.MyToys:FindFirstChild("YouDecoy")
				end
				if youDecoy then
					local head = youDecoy:FindFirstChild("Head")
					local humanoidRootPart = youDecoy:FindFirstChild("HumanoidRootPart")
					if head and humanoidRootPart then
						if head:FindFirstChild("PartOwner") and head.PartOwner.Value == localPlayer.Name then
							for _, v in workspace.PlotItems[tbl4.SelectedHouse]:GetChildren() do
								if v:IsA("Model") then
									for _, v2 in v:GetChildren() do
										if v2:IsA("BasePart") then
											for _, v3 in youDecoy:GetChildren() do
												if v3.Name == "Head" or v3.Name == "HumanoidRootPart" or v3.Name == "Torso" or v3.Name == "Left Arm" or v3.Name == "Right Arm" or v3.Name == "Left Leg" or v3.Name == "Right Leg" then
													v3.CFrame = v2.CFrame
													v3.Velocity = tbl4.VectorZero
												end
											end
										end
									end
								end
							end
						else
							tbl8.SNO(humanoidRootPart)
						end
						if not humanoidRootPart:FindFirstChild("RaidSpin") then
							local angularVelocity = Instance.new("AngularVelocity", humanoidRootPart)
							angularVelocity.Name = "RaidSpin"
							angularVelocity.MaxTorque = math.huge
							angularVelocity.AngularVelocity = Vector3.new(100, 100, 100)
							angularVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
							angularVelocity.Attachment0 = humanoidRootPart:FindFirstChild("Attachment") or Instance.new("Attachment", humanoidRootPart)
						end
					end
				end
			end
			task.wait(0.3)
		end
	end,
})
UI.Sect.DestroyTweenedObjSection = UI.Tabs.FunTab:AddSection({ Name = "Sticky glitches", Side = "Right" })
UI.Sect.DestroyTweenedObjSection:AddDropdown({
	Name = "Select plot",
	Default = "Plot3",
	Flag = "SelectTweenedObjectToKillDropdown",
	Options = { "Plot1", "Plot2", "Plot3", "Plot4", "Plot5" },
	Callback = function(tweenedName)
		tbl4.TweenedName = tweenedName
	end,
})
UI.Sect.DestroyTweenedObjSection:AddButton({
	Name = "Break part",
	Callback = function()
		tbl8.AddConnection("MyToysChildAddedConnOnceBreakPart", tbl5.MyToys.ChildAdded, function(arg)
			if arg.Name == "NinjaShuriken" then
				arg.Parent = workspace
				local stickyPart = arg:WaitForChild("StickyPart", 5)
				local soundPart = arg:WaitForChild("SoundPart", 5)
				if tbl4.TweenedName == "Spawn" then
					local spawnLocation = workspace.SpawnLocation
					while not soundPart:FindFirstChild("PartOwner") or soundPart:FindFirstChild("PartOwner") and soundPart.PartOwner.Value ~= localPlayer.Name do
						task.wait()
						tbl8.SNO(soundPart)
					end
					tbl8.Stick(stickyPart, spawnLocation, CFrame.new(2199023255552, 2199023255552, 2199023255552, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				else
					local v = workspace.Plots[tbl4.TweenedName]
					while not soundPart:FindFirstChild("PartOwner") or soundPart:FindFirstChild("PartOwner") and soundPart.PartOwner.Value ~= localPlayer.Name do
						task.wait()
						tbl8.SNO(soundPart)
					end
					tbl8.Stick(stickyPart, v.PlotArea, CFrame.new(2147483648, 2147483648, 2147483648, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				end
				tbl8.RemoveConnection("MyToysChildAddedConnOnceBreakPart")
			end
		end)
		task.wait(0.1)
		tbl8.SpawnToy("NinjaShuriken", tbl5.Root.CFrame)
	end,
})
UI.Sect.DestroyTweenedObjSection:AddButton({
	Name = "Flag spawn",
	Callback = function()
		tbl8.AddConnection("MyToysChildAddedConnOnceBreakPart", tbl5.MyToys.ChildAdded, function(arg)
			if arg.Name == "ToolPencil" then
				arg.Parent = workspace
				local stickyPart = arg:WaitForChild("StickyPart", 5)
				local soundPart = arg:WaitForChild("SoundPart", 5)
				local v = workspace.Map.BaseGround:GetChildren()[154]
				while not soundPart:FindFirstChild("PartOwner") or soundPart:FindFirstChild("PartOwner") and soundPart.PartOwner.Value ~= localPlayer.Name do
					task.wait()
					tbl8.SNO(soundPart)
				end
				tbl8.Stick(stickyPart, v, CFrame.new(9.9e19, -3.19e9, 43.3749657, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				tbl8.RemoveConnection("MyToysChildAddedConnOnceBreakPart")
			end
		end)
		task.wait(0.1)
		tbl8.SpawnToy("ToolPencil", tbl5.Root.CFrame)
	end,
})
UI.Tabs.HumTab = UI.Window:MakeTab({ Name = "Local Player", Icon = "user-cog" })
UI.Sect.SpeedSection = UI.Tabs.HumTab:AddSection({ Name = "WalkSpeed", Side = "Left" })
UI.Elm.WalkspeedToggle = UI.Sect.SpeedSection:AddToggle({
	Name = "Walk speed",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "WalkspeedToggle",
	Binded = true,
	Settings = true,
	Callback = function(walkspeedEn)
		tbl7.WalkspeedEn = walkspeedEn
		if tbl7.WalkspeedEn then
			while tbl7.WalkspeedEn do
				if tbl5.Hum and tbl5.Root then
					tbl5.Root.CFrame = tbl5.Root.CFrame + tbl5.Hum.MoveDirection * tbl4.PlayerSpeed / 100
				end
				task.wait()
			end
		elseif tbl5.Hum then
			tbl5.Hum.WalkSpeed = 16
		end
	end,
})
UI.Elm.WalkspeedToggle:AddSlider({
	Name = "Speed",
	Min = 1,
	Max = 600,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.PlayerSpeed,
	Flag = "WalkSpeedSlider",
	Callback = function(playerSpeed)
		tbl4.PlayerSpeed = playerSpeed
	end,
})
UI.Elm.WalkspeedToggle:AddButton({
	Name = "Set default speed",
	Callback = function()
		if UI.Elm.WalkspeedToggle.Value then
			UI.Elm.WalkspeedToggle:Set(false)
		end
		if tbl5.Hum then
			tbl5.Hum.WalkSpeed = 16
		end
	end,
})
UI.Sect.JumpSection = UI.Tabs.HumTab:AddSection({ Name = "JumpPower", Side = "Left" })
UI.Elm.JpToggle = UI.Sect.JumpSection:AddToggle({
	Name = "Crouch Jump power",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "JumpPowerToggle",
	Settings = true,
	Callback = function(jumppowerEn)
		tbl7.JumppowerEn = jumppowerEn
		if tbl7.JumppowerEn then
			while tbl7.JumppowerEn do
				if tbl5.Hum then
					tbl5.Hum.JumpPower = tbl4.PlayerJumpPower
				end
				task.wait()
			end
		elseif tbl5.Hum then
			tbl5.Hum.JumpPower = 24
		end
	end,
})
UI.Elm.JpToggle:AddSlider({
	Name = "Power",
	Min = 1,
	Max = 150,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.PlayerJumpPower,
	Flag = "JumpPowerSlider",
	Callback = function(playerJumpPower)
		tbl4.PlayerJumpPower = playerJumpPower
	end,
})
UI.Elm.JpToggle:AddButton({
	Name = "Set default power",
	Callback = function()
		if UI.Elm.JpToggle.Value then
			UI.Elm.JpToggle:Set(false)
		end
		if tbl5.Hum then
			tbl5.Hum.JumpPower = 24
		end
	end,
})
UI.Sect.MovementModifiersSection = UI.Tabs.HumTab:AddSection({ Name = "Movement", Side = "Right" })
UI.Sect.MovementModifiersSection:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "InfJumpToggle",
	Callback = function(infjumpEn)
		if tbl7.InfjumpEn then
			tbl8.RemoveConnection("InfjumpConn")
		end
		tbl7.InfjumpEn = infjumpEn
		if tbl7.InfjumpEn then
			tbl8.AddConnection("InfjumpConn", tbl2.UIS.JumpRequest, function()
				if tbl5.Hum then
					tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end)
		end
	end,
})
UI.Sect.MovementModifiersSection:AddToggle({
	Name = "Auto wall-climb",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AutoClimbToggle",
	Callback = function(wallClimbEn)
		tbl7.WallClimbEn = wallClimbEn
		local function fn2()
			if not tbl5.Root then
				return false
			end
			local char = tbl5.Char
			local v = workspace:FindPartOnRay(Ray.new(tbl5.Root.Position, tbl5.Root.CFrame.LookVector * 2), char, false, true)
			if v and v.CanCollide and not table.find({
				"PlotBarrier",
				"HumanoidRootPart",
				"Torso",
				"Head",
				"Left Arm",
				"Right Arm",
				"Left Leg",
				"Right Leg",
			}, v.Name) then
				return true
			end
			return false
		end
		while tbl7.WallClimbEn do
			if tbl2.UIS:IsKeyDown(tbl3.W) and fn2() then
				if tbl5.Hum then
					tbl5.Hum:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
			task.wait()
		end
	end,
})
UI.Sect.MovementModifiersSection:AddToggle({
	Name = "Magnet pallet",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "PalletMagnetToggle",
	Binded = true,
	Callback = function(magnitPalletEn)
		tbl7.MagnitPalletEn = magnitPalletEn
		local function fn2(parent)
			local alignPosition = parent:FindFirstChild("AlignPosition") or Instance.new("AlignPosition")
			alignPosition.Name = "AlignPosition"
			alignPosition.MaxForce = 9
			alignPosition.Responsiveness = 80
			alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
			alignPosition.Parent = parent
			alignPosition.Attachment0 = parent:FindFirstChild("Attachment") or Instance.new("Attachment", parent)
			return alignPosition
		end
		local function fn3(parent)
			local alignOrientation = parent:FindFirstChild("AlignOrientation") or Instance.new("AlignOrientation")
			alignOrientation.Name = "AlignOrientation"
			alignOrientation.MaxTorque = 9
			alignOrientation.Responsiveness = 80
			alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
			alignOrientation.Parent = parent
			alignOrientation.Attachment0 = parent:FindFirstChild("Attachment") or Instance.new("Attachment", parent)
			return alignOrientation
		end
		if tbl7.MagnitPalletEn then
			tbl8.AddConnection("PalletMagnetConn", tbl2.RunS.Heartbeat, function()
				if not tbl5.Root then
					return
				end
				local char = tbl5.Char
				local v = workspace:FindPartOnRay(Ray.new(tbl5.Root.Position, Vector3.new(0, -6, 0)), char)
				if v and v.Parent and v.Parent.Name == "PalletLightBrown" and tbl5.Hum and tbl5.Hum.FloorMaterial ~= Enum.Material.Air then
					if not tbl7.MagnetAtt1 then
						tbl7.MagnetAtt1 = Instance.new("Attachment", v.Parent:FindFirstChild("PrimaryPart") or v)
						if tbl5.Root then
							local alignPosition = tbl5.Root:FindFirstChild("AlignPosition") or fn2(tbl5.Root)
							local alignOrientation = tbl5.Root:FindFirstChild("AlignOrientation") or fn3(tbl5.Root)
							alignPosition.Attachment1 = tbl7.MagnetAtt1
							alignOrientation.Attachment1 = tbl7.MagnetAtt1
							alignPosition.Enabled = true
							alignOrientation.Enabled = true
						end
					end
					tbl5.Root.AssemblyLinearVelocity = (v.Parent:FindFirstChild("PrimaryPart") or v).AssemblyLinearVelocity
				elseif tbl7.MagnetAtt1 then
					if tbl5.Root then
						local alignPosition = tbl5.Root:FindFirstChild("AlignPosition")
						local alignOrientation = tbl5.Root:FindFirstChild("AlignOrientation")
						if alignPosition then
							alignPosition.Enabled = false
						end
						if alignOrientation then
							alignOrientation.Enabled = false
						end
					end
					tbl7.MagnetAtt1:Destroy()
					tbl7.MagnetAtt1 = nil
				end
			end)
			tbl8.AddConnection("PalletMagnetAfterResetConn", localPlayer.CharacterAdded, function()
				tbl7.MagnetAtt1 = nil
			end)
		else
			if tbl7.MagnetAtt1 then
				if tbl5.Root then
					local alignPosition = tbl5.Root:FindFirstChild("AlignPosition")
					local alignOrientation = tbl5.Root:FindFirstChild("AlignOrientation")
					if alignPosition then
						alignPosition.Enabled = false
					end
					if alignOrientation then
						alignOrientation.Enabled = false
					end
				end
				tbl7.MagnetAtt1:Destroy()
				tbl7.MagnetAtt1 = nil
			end
			tbl8.RemoveConnection("PalletMagnetConn")
			tbl8.RemoveConnection("PalletMagnetAfterResetConn")
		end
	end,
})
UI.Sect.DefaultModifiersSection = UI.Tabs.HumTab:AddSection({ Name = "Default", Side = "Right" })
UI.Sect.DefaultModifiersSection:AddToggle({
	Name = "Enable chat bar",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "ChatBarToggle",
	Callback = function(chatBarEn)
		tbl7.ChatBarEn = chatBarEn
		local experienceChat = tbl2.CoreGui:FindFirstChild("ExperienceChat")
		if experienceChat then
			local appLayout = experienceChat:FindFirstChild("appLayout")
			if appLayout then
				local chatInputBar = appLayout:FindFirstChild("chatInputBar")
				if chatInputBar then
					chatInputBar.Visible = tbl7.ChatBarEn
				end
			end
		end
	end,
})
UI.Sect.DefaultModifiersSection:AddToggle({
	Name = "Enable shift lock",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "ShiftLockToggle",
	Callback = function(shiftLockEn)
		tbl7.ShiftLockEn = shiftLockEn
		localPlayer.DevEnableMouseLock = tbl7.ShiftLockEn
	end,
})
UI.Sect.DefaultModifiersSection:AddToggle({
	Name = "Enable inventory",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "InventoryToggle",
	Callback = function(inventoryEn)
		tbl7.InventoryEn = inventoryEn
		tbl2.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, tbl7.InventoryEn)
	end,
})
UI.Sect.DefaultModifiersSection:AddToggle({
	Name = "Hand Mode",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "HandModeToggle",
	Callback = function(handModeEn)
		tbl7.HandModeEn = handModeEn
		tbl8.RemoveConnection("HandModeConn")
		if not tbl7.HandModeEn then
			return
		end
		tbl8.AddConnection("HandModeConn", tbl2.RunS.RenderStepped, function()
			if tbl5.Char then
				local rightArm = tbl5.Char:FindFirstChild("Right Arm")
				if rightArm then
					rightArm.Transparency = 0.5
					rightArm.LocalTransparencyModifier = 0.5
				end
			end
		end)
		while tbl7.HandModeEn do
			if tbl5.Char and tbl5.Char:FindFirstChild("CamPart") and tbl5.Char.CamPart:FindFirstChild("Attachment") and tbl5.Char:FindFirstChild("Right Arm") then
				local attachment = tbl5.Char.CamPart:FindFirstChild("Attachment")
				attachment.Parent = tbl5.Char["Right Arm"]
				attachment.Position = Vector3.new(0, -1, 0)
			end
			task.wait(0.1)
		end
	end,
})
UI.Sect.DefaultModifiersSection:AddToggle({
	Name = "Disable ragdoll blur",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "BlurToggle",
	Callback = function(blurEn)
		tbl7.BlurEn = blurEn
		tbl5.Cam.Blur.Enabled = not tbl7.BlurEn
	end,
})
UI.Elm.ThirdPToggle = UI.Sect.DefaultModifiersSection:AddToggle({
	Name = "Enable third person",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "ThirdPersonToggle",
	Callback = function(thirdPersonEn)
		tbl7.ThirdPersonEn = thirdPersonEn
		if tbl7.ThirdPersonEn then
			localPlayer.CameraMode = "Classic"
			localPlayer.CameraMaxZoomDistance = 1000
			tbl8.AddConnection("ThirdPersonConn", tbl2.RunS.Heartbeat, function()
				if tbl5.Char then
					for _, v in tbl5.Char:GetChildren() do
						if (v:IsA("BasePart") or v:IsA("Accessory")) and v.Name ~= "HumanoidRootPart" and v.Name ~= "FirePlayerPart" and v.Name ~= "RagdollTouchedHitbox" then
							if v:IsA("BasePart") then
								v.Transparency = 0
							elseif v:IsA("Accessory") and v.Name ~= "TypingKeyboardMyWorld" and v:FindFirstChild("Handle") then
								v.Handle.Transparency = 0
							end
						end
					end
				end
			end)
		else
			tbl8.RemoveConnection("ThirdPersonConn")
			localPlayer.CameraMode = "LockFirstPerson"
			localPlayer.CameraMaxZoomDistance = 0.5
		end
	end,
})
UI.Sect.CameraModifiersSection = UI.Tabs.HumTab:AddSection({ Name = "Camera", Side = "Right" })
UI.Elm.FovToggle = UI.Sect.CameraModifiersSection:AddToggle({
	Name = "Change FOV",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "FOVToggle",
	Settings = true,
	Callback = function(fovEn)
		tbl7.FOVEn = fovEn
		tbl5.Cam.FieldOfView = tbl7.FOVEn and tbl4.FOV or 70
	end,
})
UI.Elm.FOVSlider = UI.Elm.FovToggle:AddSlider({
	Name = "FOV",
	Min = 1,
	Max = 120,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.FOV,
	Flag = "FOVSlider",
	Callback = function(fov)
		tbl4.FOV = fov
		if not tbl7.FOVEn then
			return
		end
		local tbl9 = { FieldOfView = tbl4.FOV }
		tbl2.TweenS:Create(tbl5.Cam, TweenInfo.new(0.3), tbl9):Play()
	end,
})
tbl4.ThirdPersonOldValue = false
UI.Sect.CameraModifiersSection:AddToggle({
	Name = "Mouse zoom toggle",
	Default = false,
	Hold = false,
	Flag = "ZoomBind",
	Binded = true,
	Callback = function(mouseZoomEn)
		tbl7.MouseZoomEn = mouseZoomEn
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		if tbl7.MouseZoomEn then
			tbl4.ThirdPersonOldValue = UI.Elm.ThirdPToggle.Value
			tbl4.OldFOV = tbl4.FOV
			localPlayer.CameraMaxZoomDistance = 0.5
			UI.Elm.ThirdPToggle:Set(false)
			task.wait(0.2)
			local vector2 = Vector2.zero
			tbl8.AddConnection("MouseZoomConn", tbl2.UIS.InputChanged, function(arg)
				if not workspace:FindFirstChild("GrabParts") and tbl4.FOV < 121 and tbl4.FOV > 0 then
					if arg.UserInputType == tbl3.MouseWheel and arg.Position.Z > 0 then
						tbl4.FOV = tbl4.FOV - 3.5
					elseif arg.UserInputType == tbl3.MouseWheel and arg.Position.Z < 0 then
						tbl4.FOV = tbl4.FOV + 3.5
					end
					if tbl4.FOV > 50 then
						tbl4.Sensivity = 0.4
						tbl4.Lerp = 0.4
					elseif tbl4.FOV > 30 then
						tbl4.Sensivity = 0.2
						tbl4.Lerp = 0.2
					elseif tbl4.FOV > 5 then
						tbl4.Sensivity = 0.1
						tbl4.Lerp = 0.1
					else
						tbl4.Sensivity = 0.01
						tbl4.Lerp = 0.01
					end
					UI.Elm.FOVSlider:Set(tbl4.FOV)
				end
				if arg.UserInputType == Enum.UserInputType.MouseMovement then
					vector2 = Vector2.new(arg.Delta.X, arg.Delta.Y)
				end
			end)
			if tbl5.Root then
				tbl5.Cam.CameraType = Enum.CameraType.Scriptable
				tbl2.UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
				local cFrame = tbl5.Cam.CFrame
				local lookVector = cFrame.LookVector
				local v = math.atan2(-lookVector.X, -lookVector.Z)
				local v2 = math.asin(lookVector.Y)
				local deg = math.deg
				local vector22 = Vector2.new(math.deg(v), deg(v2))
				local deg2 = math.deg
				local vector23 = Vector2.new(math.deg(v), deg2(v2))
				local cFrame2 = cFrame
				tbl8.AddConnection("CameraSmoothConn", tbl2.RunS.RenderStepped, function()
					if not tbl5.Root then
						return
					end
					vector22 = Vector2.new(vector22.X - vector2.X * tbl4.Sensivity, math.clamp(vector22.Y - vector2.Y * tbl4.Sensivity, -tbl4.Max, tbl4.Max))
					vector2 = Vector2.zero
					vector23 = Vector2.new(vector23.X + (vector22.X - vector23.X) * tbl4.Lerp, vector23.Y + (vector22.Y - vector23.Y) * tbl4.Lerp)
					local cframe = CFrame.Angles
					local n = CFrame.new(tbl5.Root.Position + tbl4.Offset) * cframe(0, math.rad(vector23.X), 0) * CFrame.Angles(math.rad(vector23.Y), 0, 0)
					tbl5.Cam.CFrame = cFrame2 and cFrame2:Lerp(n, tbl4.Lerp) or n
					cFrame2 = tbl5.Cam.CFrame
				end)
			end
		else
			if UI.Elm.ThirdPToggle then
				UI.Elm.ThirdPToggle:Set(tbl4.ThirdPersonOldValue)
			end
			tbl5.Cam.CameraType = Enum.CameraType.Custom
			tbl8.RemoveConnection("MouseZoomConn")
			tbl8.RemoveConnection("CameraSmoothConn")
			if UI.Elm.FovToggle then
				tbl4.FOV = tbl4.OldFOV
				UI.Elm.FOVSlider:Set(tbl4.OldFOV)
			end
		end
	end,
})
UI.Sect.GravSection = UI.Tabs.HumTab:AddSection({ Name = "Gravity", Side = "Left" })
UI.Elm.GravToggle = UI.Sect.GravSection:AddToggle({
	Name = "Change gravity",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "GravityToggle",
	Settings = true,
	Callback = function(gravityEn)
		tbl7.GravityEn = gravityEn
		if tbl7.GravityEn then
			while tbl7.GravityEn do
				workspace.Gravity = tbl4.Gravity
				task.wait()
			end
		else
			workspace.Gravity = 100
		end
	end,
})
UI.Elm.GravToggle:AddSlider({
	Name = "Gravity",
	Min = 1,
	Max = 150,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.Gravity,
	Flag = "GravitySlider",
	Callback = function(gravity)
		tbl4.Gravity = gravity
	end,
})
UI.Elm.GravToggle:AddButton({
	Name = "Set default gravity",
	Callback = function()
		if UI.Elm.GravToggle.Value then
			UI.Elm.GravToggle:Set(false)
		end
		workspace.Gravity = 100
	end,
})
UI.Tabs.BlobmanTab = UI.Window:MakeTab({ Name = "Blobman", Icon = "skull" })
UI.Sect.ListSectionBlobman = UI.Tabs.BlobmanTab:AddSection({ Name = "List", Side = "Left" })
UI.Elm.BlobmanListDropdown = UI.Sect.ListSectionBlobman:AddDropdown({
	Name = "Player list",
	Default = "",
	Options = tbl8.UpdatePlayersList(),
	Search = true,
	Callback = function(selectedPlayer)
		tbl4.SelectedPlayer = selectedPlayer
	end,
})
UI.Elm.BlobbedDropdown = UI.Sect.ListSectionBlobman:AddDropdown({
	Name = "Targets list",
	Default = "",
	Options = tbl4.BlobmanPlayers,
	Callback = function(selectedPlayer)
		tbl4.SelectedPlayer = selectedPlayer
	end,
})
UI.Elm.SelectTargetBlobman = UI.Sect.ListSectionBlobman:AddBind({
	Name = "Add target",
	Default = "",
	Hold = false,
	Flag = "BlobTargetBind",
	Callback = function()
		local target = tbl5.Mouse.Target
		if not target or not target.Parent then
			return
		end
		local playerFromCharacter = tbl2.Players:GetPlayerFromCharacter(target.Parent)
		if not playerFromCharacter then
			return
		end
		local name = playerFromCharacter.Name
		local displayName = playerFromCharacter.DisplayName
		if not tbl8.CheckFriend(playerFromCharacter) then
			tbl4.SelectedPlayer = name .. " (" .. displayName .. ")"
		else
			tbl4.SelectedPlayer = name .. " (" .. displayName .. ") [[FRIEND]]"
		end
		if not table.find(tbl4.BlobmanPlayers, tbl4.SelectedPlayer) then
			table.insert(tbl4.BlobmanPlayers, tbl4.SelectedPlayer)
			UI.Elm.BlobbedDropdown:Refresh(tbl8.UpdateList(tbl4.BlobmanPlayers), true)
		end
	end,
})
UI.Sect.ListSectionBlobman:AddButton({
	Name = "Add player to the loop",
	Callback = function()
		if not table.find(tbl4.BlobmanPlayers, tbl4.SelectedPlayer) then
			table.insert(tbl4.BlobmanPlayers, tbl4.SelectedPlayer)
			UI.Elm.BlobbedDropdown:Refresh(tbl8.UpdateList(tbl4.BlobmanPlayers), true)
		end
	end,
})
UI.Sect.ListSectionBlobman:AddButton({
	Name = "Remove player from loop",
	Callback = function()
		for k, v in tbl4.BlobmanPlayers, nil, nil do
			if v == tbl4.SelectedPlayer then
				table.remove(tbl4.BlobmanPlayers, k)
				break
			end
		end
		UI.Elm.BlobbedDropdown:Refresh(tbl4.BlobmanPlayers, true)
	end,
})
UI.Sect.ListSectionBlobman:AddButton({
	Name = "Remove all players from loop",
	Callback = function()
		tbl4.BlobmanPlayers = {}
		UI.Elm.BlobbedDropdown:Refresh(tbl4.BlobmanPlayers, true)
	end,
})
UI.Sect.ControlsSectionBlobman = UI.Tabs.BlobmanTab:AddSection({ Name = "Controls", Side = "Left" })
UI.Elm.FullControlBlobToggle = UI.Sect.ControlsSectionBlobman:AddToggle({
	Name = "Full control blobman",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "FullControlBlobmanToggle",
	Settings = true,
	Callback = function(fullControlBlobmanEn)
		tbl7.FullControlBlobmanEn = fullControlBlobmanEn
		while tbl7.FullControlBlobmanEn do
			if tbl8.GetBlob() and tbl5.Hum then
				tbl5.Hum.JumpPower = 0
			end
			task.wait(0.2)
		end
	end,
})
UI.Elm.FullControlBlobToggle:AddToggle({
	Name = "Blobman infinite Jump",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "InfJumpBlobToggle",
	Callback = function(infJumpBlobmanEn)
		tbl7.InfJumpBlobmanEn = infJumpBlobmanEn
		tbl8.RemoveConnection("InfJumpBlobConn")
		if tbl7.InfJumpBlobmanEn then
			tbl8.AddConnection("InfJumpBlobConn", tbl2.UIS.JumpRequest, function()
				local v = tbl8.GetBlob()
				if v then
					local humanoidCreature = v:FindFirstChild("HumanoidCreature")
					if humanoidCreature then
						humanoidCreature:ChangeState("Jumping")
					end
				end
			end)
		end
	end,
})
UI.Elm.BlobmanJump = UI.Elm.FullControlBlobToggle:AddBind({
	Name = "Blobman Jump bind",
	Default = "",
	Hold = false,
	Flag = "BlobJumpBind",
	Callback = function()
		local v = tbl8.GetBlob()
		if v and tbl7.FullControlBlobmanEn then
			local humanoidCreature = v:FindFirstChild("HumanoidCreature")
			if humanoidCreature then
				humanoidCreature.Jump = true
			end
		end
	end,
})
UI.Elm.StandBind = UI.Elm.FullControlBlobToggle:AddBind({
	Name = "Stand bind",
	Default = "",
	Hold = false,
	Flag = "StandBind",
	Callback = function()
		task.wait(0.05)
		if tbl5.Hum then
			if tbl5.Hum.SeatPart then
				tbl5.Hum.Sit = false
			end
			tbl5.Hum.JumpPower = 25
		end
	end,
})
UI.Elm.SpeedBlobToggle = UI.Sect.ControlsSectionBlobman:AddToggle({
	Name = "Speed blobman",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "SpeedBlobmanToggle",
	Settings = true,
	Callback = function(speedBlobmanEn)
		tbl7.SpeedBlobmanEn = speedBlobmanEn
		while tbl7.SpeedBlobmanEn do
			local v = tbl8.GetBlob()
			if v then
				local humanoidCreature = v:FindFirstChild("HumanoidCreature")
				if humanoidCreature then
					humanoidCreature.WalkSpeed = tbl4.BlobmanSpeed
				end
			end
			task.wait(0.1)
		end
	end,
})
UI.Elm.SpeedBlobToggle:AddSlider({
	Name = "Blobman speed",
	Min = 1,
	Max = 150,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 10,
	Default = tbl4.BlobmanSpeed,
	Flag = "BlobSpeedSlider",
	Callback = function(blobmanSpeed)
		tbl4.BlobmanSpeed = blobmanSpeed
	end,
})
UI.Sect.ControlsSectionBlobman:AddSlider({
	Name = "Blobman bring delay (ms)",
	Min = 0,
	Max = 1000,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.BlobmanDelay,
	Flag = "BlobDelaySlider",
	Callback = function(blobmanDelay)
		tbl4.BlobmanDelay = blobmanDelay
	end,
})
UI.Sect.ControlsSectionBlobman:AddToggle({
	Name = "Auto sit blobman",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AutoSitBlobToggle",
	Callback = function(autoSitEn)
		tbl7.AutoSitEn = autoSitEn
	end,
})
UI.Sect.ServerSectionBlobman = UI.Tabs.BlobmanTab:AddSection({ Name = "Server", Side = "Right" })
UI.Elm.KillServerBlobToggle = UI.Sect.ServerSectionBlobman:AddToggle({
	Name = "Kill server",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Settings = true,
	Callback = function(killServerEn)
		tbl7.KillServerEn = killServerEn
		task.spawn(tbl8.KillServer)
	end,
})
UI.Elm.KillServerBlobToggle:AddToggle({
	Name = "Whitelist friends",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "WhitelistBlobToggle",
	Callback = function(whitelistBlobmanEn)
		tbl7.WhitelistBlobmanEn = whitelistBlobmanEn
	end,
})
UI.Sect.ServerSectionBlobman:AddButton({
	Name = "Kick all",
	Callback = function()
		if not tbl5.Root or not tbl5.Hum then
			return
		end
		local cFrame = tbl5.Root.CFrame
		local tbl9 = {}
		for _, v in tbl2.Players:GetPlayers() do
			if v ~= localPlayer then
				if not v:IsFriendsWith(localPlayer.UserId) then
					if not (tbl7.WhitelistBlobmanEn and tbl8.CheckWhitelist(v)) then
						tbl9[#tbl9 + 1] = v
					end
				end
			end
		end
		tbl5.MyToys.ChildAdded:Once(function(child)
			if child.Name ~= "CreatureBlobman" then
				return
			end
			local vehicleSeat = child:WaitForChild("VehicleSeat", 3)
			local leftDetector = child:WaitForChild("LeftDetector", 3)
			local rightDetector = child:WaitForChild("RightDetector", 3)
			local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")
			local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
			local blobmanSeatAndOwnerScript = child:WaitForChild("BlobmanSeatAndOwnerScript", 3)
			local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
			local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
			local vector_ = Vector3.new(0, 135, 0)
			while vehicleSeat.Occupant ~= tbl5.Hum do
				vehicleSeat:Sit(tbl5.Hum)
				task.wait()
			end
			task.wait(0.5)
			for _, v in tbl9, nil, nil do
				local character = v.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if humanoidRootPart then
					for i = 1, 20 do
						tbl5.Root.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 5, 0)
						tbl5.Root.Velocity = tbl4.VectorZero
						tbl5.Root.RotVelocity = tbl4.VectorZero
						creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
						creatureRelease:FireServer(leftWeld)
						task.wait(0.01)
					end
					task.wait()
				end
			end
			for k, v in tbl9, nil, nil do
				local character = v.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if character then
					local n = k * 6.2831853071795862 / #tbl9
					character.CFrame = CFrame.new(vector_.X + math.cos(n) * 26, vector_.Y, vector_.Z + math.sin(n) * 26)
				end
			end
			tbl5.Root.CFrame = CFrame.new(vector_.X, vector_.Y, vector_.Z)
			tbl5.Root.Velocity = tbl4.VectorZero
			tbl5.Root.RotVelocity = tbl4.VectorZero
			task.wait(0.1)
			local flag = true
			for _, v in tbl9, nil, nil do
				local character = v.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if character then
					tbl5.Root.CFrame = CFrame.new(vector_.X, vector_.Y, vector_.Z)
					tbl5.Root.Velocity = tbl4.VectorZero
					tbl5.Root.RotVelocity = tbl4.VectorZero
					tbl6.SetNetworkOwnerEvent:FireServer(character, character.CFrame)
					task.wait()
					tbl6.DestroyLineEvent:FireServer(character)
					task.wait()
					creatureGrab:FireServer(flag and leftDetector or rightDetector, character, flag and leftWeld or rightWeld)
					flag = not flag
				end
			end
			task.wait(0.1)
			tbl6.DestroyToyEvent:FireServer(child)
			task.wait(0.1)
			tbl5.Root.CFrame = cFrame
			tbl5.Root.Velocity = tbl4.VectorZero
		end)
		tbl6.SpawnToyEvent:InvokeServer("CreatureBlobman", tbl5.Root.CFrame, tbl4.VectorZero)
	end,
})
UI.Sect.PlayersBlobSection = UI.Tabs.BlobmanTab:AddSection({ Name = "Players", Side = "Right" })
UI.Sect.PlayersBlobSection:AddToggle({
	Name = "Bring",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Callback = function(leftBringEn)
		tbl7.LeftBringEn = leftBringEn
		while tbl7.LeftBringEn do
			for _, v in tbl4.BlobmanPlayers, nil, nil do
				tbl8.BlobBring(v:split(" ")[1], "Left")
				task.wait(tbl4.BlobmanDelay / 1000)
			end
			task.wait()
		end
	end,
})
UI.Sect.PlayersBlobSection:AddToggle({
	Name = "Kick",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "KickPlayerToggleBlobman",
	Callback = function(kickPlayerEn)
		tbl7.KickPlayerEn = kickPlayerEn
		while tbl7.KickPlayerEn do
			for _, v in tbl4.BlobmanPlayers, nil, nil do
				local v2 = v:split(" ")[1]
				local v3 = tbl2.Players:FindFirstChild(v2)
				if v3 then
					local v4 = tbl8.GetChar(v3)
					local v5 = v4 and tbl8.GetRoot(v4)
					v4 = v4 and tbl8.GetHum(v4)
					if v5 and v4 and v4.Health ~= 0 then
						local cFrame = tbl5.Root and tbl5.Root.CFrame
						local n = 0
						while n <= 20 and tbl5.Root and v5 and tbl8.GetMagnitude(tbl5.Root, v5) >= 30 do
							tbl5.Root.CFrame = v5.CFrame * CFrame.new(0, -15, 0)
							tbl5.Root.Velocity = tbl4.VectorZero
							task.wait(0.1)
							n += 1
							for i = 1, 10 do
								if tbl5.Char then
									for _, v6 in tbl5.Char:GetDescendants() do
										if v6:IsA("BasePart") then
											v6.Velocity = tbl4.VectorZero
											v6.RotVelocity = tbl4.VectorZero
										end
									end
								end
								tbl5.Root.CFrame = v5.CFrame * CFrame.new(0, -15, 0)
								tbl8.SNO(v5)
								tbl8.BlobInputLag(v2, "Left", false)
								if isnetworkowner(v5) then
									v5.CFrame = cFrame * CFrame.new(0, 15, 0)
									v5.Velocity = tbl4.VectorZero
								end
								task.wait()
							end
						end
						if cFrame and tbl5.Root then
							tbl5.Root.CFrame = cFrame
							tbl5.Root.Velocity = tbl4.VectorZero
						end
						while tbl5.Root and v5 and tbl8.GetMagnitude(tbl5.Root, v5) < 30 and v4.Health ~= 0 do
							tbl8.SNO(v5)
							tbl6.DestroyLineEvent:FireServer(v5)
							tbl8.BlobBring(v2, "Left")
							tbl8.BlobDrop(v2, "Left")
							if isnetworkowner(v5) then
								v5.CFrame = tbl5.Root.CFrame * CFrame.new(0, 15, 0)
								v5.Velocity = tbl4.VectorZero
							end
							task.wait(0.05)
						end
					end
				end
			end
			task.wait()
		end
	end,
})
UI.Sect.PlayersBlobSection:AddToggle({
	Name = "Input lag lock",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "InputLockToggle",
	Callback = function(inputLockEn)
		tbl7.InputLockEn = inputLockEn
		while tbl7.InputLockEn do
			for _, blobmanPlayer in pairs(tbl4.BlobmanPlayers) do
				local v = blobmanPlayer:split(" ")[1]
				if tbl2.Players:FindFirstChild(v) then
					local character = tbl2.Players:FindFirstChild(v)
					character = character and character.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local humanoid = character and character:FindFirstChild("Humanoid")
					local v2 = tbl8.GetChar(localPlayer)
					local v3 = v2 and tbl8.GetRoot(v2)
					if v3 and humanoidRootPart and humanoid then
						if humanoid.Health ~= 0 then
							local tbl9 = { "Left Leg", "Right Leg", "Left Arm", "Right Arm", "Head" }
							local cFrame = v3.CFrame
							local flag = true
							local n = 0
							local flag2 = false
							while flag and v3 and tbl7.InputLockEn and character and humanoidRootPart and humanoid and humanoid.Health >= 1 and n <= 20 do
								if tbl8.GetMagnitude(v3, humanoidRootPart) >= 30 and not flag2 then
									v3.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 5, 5)
									v3.Velocity = tbl4.VectorZero
									n += 1
									for i = 1, 2 do
										for _, descendant in ipairs(v2:GetDescendants()) do
											if descendant:IsA("BasePart") then
												descendant.Velocity = tbl4.VectorZero
												descendant.RotVelocity = tbl4.VectorZero
											end
										end
										tbl8.BlobInputLag(v, "Left", false)
										tbl8.BlobBring(v, "Left")
										if isnetworkowner(humanoidRootPart) then
											humanoidRootPart.CFrame = cFrame
											humanoidRootPart.Velocity = tbl4.VectorZero
										end
										task.wait()
									end
								else
									if cFrame ~= nil then
										v3.CFrame = cFrame
										v3.Velocity = tbl4.VectorZero
										cFrame = nil
									end
									while flag and v3 and tbl7.InputLockEn and character and humanoidRootPart and humanoid and humanoid.Health >= 1 do
										tbl8.BlobInputLag(v, "Left", false)
										task.wait()
										tbl8.BlobInputLag(v, "Right", false)
										if isnetworkowner(humanoidRootPart) then
											humanoidRootPart.CFrame = v3.CFrame * CFrame.new(0, -5, -5)
											humanoidRootPart.Velocity = tbl4.VectorZero
											if humanoid.Ragdolled.Value then
												for _, v4 in ipairs(tbl9) do
													local v5 = character[v4]
													v5.Velocity = tbl4.VectorZero
													v5.RotVelocity = tbl4.VectorZero
													v5.CFrame = humanoidRootPart.CFrame
												end
											end
										end
										task.wait(0.05)
										local flag3 = v3 and humanoidRootPart and tbl8.GetMagnitude(v3, humanoidRootPart) >= 30
										flag2 = true
										if flag3 then
											flag = false
											flag2 = false
										end
									end
								end
								if cFrame ~= nil then
									v3.CFrame = cFrame
									v3.Velocity = tbl4.VectorZero
									cFrame = nil
								end
								task.wait()
							end
							if cFrame ~= nil then
								v3.CFrame = cFrame
								v3.Velocity = tbl4.VectorZero
							end
						end
					end
				end
			end
			task.wait()
		end
	end,
})
UI.Sect.PlayersBlobSection:AddToggle({
	Name = "Input lag kill",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "InputKillToggle",
	Callback = function(inputKillEn)
		tbl7.InputKillEn = inputKillEn
		while tbl7.InputKillEn do
			for _, blobmanPlayer in pairs(tbl4.BlobmanPlayers) do
				local v = blobmanPlayer:split(" ")[1]
				if tbl2.Players:FindFirstChild(v) then
					local character = tbl2.Players:FindFirstChild(v)
					character = character and character.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					local humanoid = character and character:FindFirstChild("Humanoid")
					local v2 = tbl8.GetChar(localPlayer)
					local v3 = v2 and tbl8.GetRoot(v2)
					local cFrame = v3 and v3.CFrame
					if v3 and humanoidRootPart and humanoid then
						if humanoid.Health ~= 0 then
							local flag = true
							local n = 0
							local flag2 = false
							while flag and v3 and tbl7.InputKillEn and character and humanoidRootPart and humanoid and humanoid.Health >= 1 and n <= 20 do
								if tbl8.GetMagnitude(v3, humanoidRootPart) >= 30 and not flag2 then
									v3.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 5, 5)
									v3.Velocity = tbl4.VectorZero
									n += 1
									for i = 1, 2 do
										for _, descendant in ipairs(v2:GetDescendants()) do
											if descendant:IsA("BasePart") then
												descendant.Velocity = tbl4.VectorZero
												descendant.RotVelocity = tbl4.VectorZero
											end
										end
										tbl8.BlobInputLag(v, "Left", false)
										tbl8.BlobBring(v, "Left")
										if isnetworkowner(humanoidRootPart) then
											humanoidRootPart.CFrame = cFrame
											humanoidRootPart.Velocity = tbl4.VectorZero
										end
										task.wait()
									end
								else
									if cFrame ~= nil then
										v3.CFrame = cFrame
										v3.Velocity = tbl4.VectorZero
										cFrame = nil
									end
									while flag and v3 and tbl7.InputKillEn and character and humanoidRootPart and humanoid and humanoid.Health >= 1 do
										tbl8.BlobInputLag(v, "Left", true)
										task.wait()
										tbl8.BlobInputLag(v, "Right", true)
										if isnetworkowner(humanoidRootPart) then
											humanoidRootPart.CFrame = v3.CFrame * CFrame.new(0, -5, -5)
											humanoidRootPart.Velocity = tbl4.VectorZero
										end
										task.wait(0.05)
										local flag3 = v3 and humanoidRootPart and tbl8.GetMagnitude(v3, humanoidRootPart) >= 30
										flag2 = true
										if flag3 then
											flag = false
											flag2 = false
										end
									end
								end
								if cFrame ~= nil then
									v3.CFrame = cFrame
									v3.Velocity = tbl4.VectorZero
									cFrame = nil
								end
								task.wait()
							end
						end
					end
				end
			end
			if OldCF ~= nil then
				Root.CFrame = OldCF
				Root.Velocity = tbl4.VectorZero
				OldCF = nil
			end
			task.wait()
		end
	end,
})
UI.Tabs.TargetTab = UI.Window:MakeTab({ Name = "Target", Icon = "alert-triangle" })
UI.Sect.ListSectionTarget = UI.Tabs.TargetTab:AddSection({ Name = "List", Side = "Left" })
UI.Elm.TargetListDropdown = UI.Sect.ListSectionTarget:AddDropdown({
	Name = "Player list",
	Default = "",
	Options = tbl8.UpdatePlayersList(),
	Search = true,
	Callback = function(selectedPlayer)
		tbl4.SelectedPlayer = selectedPlayer
	end,
})
UI.Elm.TargettedDropdown = UI.Sect.ListSectionTarget:AddDropdown({
	Name = "Targets list",
	Default = "",
	Options = tbl4.TargetPlayers,
	Multi = true,
	Callback = function(selectedPlayer)
		tbl4.SelectedPlayer = selectedPlayer
	end,
})
UI.Elm.SelectTargetTarget = UI.Sect.ListSectionTarget:AddBind({
	Name = "Add target",
	Default = "",
	Hold = false,
	Flag = "TargetBind",
	Callback = function()
		local target = tbl5.Mouse.Target
		if not target or not target.Parent then
			return
		end
		if not tbl2.Players:GetPlayerFromCharacter(target.Parent) then
			return
		end
		local playerFromCharacter = tbl2.Players:GetPlayerFromCharacter(target.Parent)
		local name = playerFromCharacter.Name
		local displayName = playerFromCharacter.DisplayName
		if not tbl8.CheckFriend(playerFromCharacter) then
			tbl4.SelectedPlayer = string.format("%s (%s)", name, displayName)
		else
			tbl4.SelectedPlayer = string.format("%s (%s) [[FRIEND]]", name, displayName)
		end
		if not table.find(tbl4.TargetPlayers, tbl4.SelectedPlayer) then
			table.insert(tbl4.TargetPlayers, tbl4.SelectedPlayer)
			UI.Elm.TargettedDropdown:Refresh(tbl8.UpdateList(tbl4.TargetPlayers), true)
		end
	end,
})
UI.Sect.ListSectionTarget:AddButton({
	Name = "Add player to the loop",
	Callback = function()
		if not table.find(tbl4.TargetPlayers, tbl4.SelectedPlayer) then
			table.insert(tbl4.TargetPlayers, tbl4.SelectedPlayer)
			UI.Elm.TargettedDropdown:Refresh(tbl8.UpdateList(tbl4.TargetPlayers), true)
		end
	end,
})
UI.Sect.ListSectionTarget:AddButton({
	Name = "Remove player from loop",
	Callback = function()
		for k, v in tbl4.TargetPlayers, nil, nil do
			if v == tbl4.SelectedPlayer then
				table.remove(tbl4.TargetPlayers, k)
				break
			end
		end
		UI.Elm.TargettedDropdown:Refresh(tbl4.TargetPlayers, true)
	end,
})
UI.Sect.ListSectionTarget:AddButton({
	Name = "Remove all players from loop",
	Callback = function()
		tbl4.TargetPlayers = {}
		UI.Elm.TargettedDropdown:Refresh(tbl4.TargetPlayers, true)
	end,
})
UI.Sect.KillPlayerSection = UI.Tabs.TargetTab:AddSection({ Name = "Default", Side = "Right" })
UI.Sect.KillPlayerSection:AddToggle({
	Name = "Kill",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Callback = function(killPlayerEn)
		tbl7.KillPlayerEn = killPlayerEn
		while tbl7.KillPlayerEn do
			local v = tbl2.Players:FindFirstChild(tbl4.SelectedPlayer:split(" ")[1])
			if v then
				tbl8.KillPlayer(v)
			end
			task.wait()
		end
		workspace.FallenPartsDestroyHeight = "nan"
	end,
})
UI.Sect.AdvancedSection = UI.Tabs.TargetTab:AddSection({ Name = "Advanced", Side = "Right" })
UI.Sect.AdvancedSection:AddToggle({
	Name = "Ragdoll (banana)",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Callback = function(ragdollPlayerEn)
		tbl7.RagdollPlayerEn = ragdollPlayerEn
		while tbl7.RagdollPlayerEn do
			if tbl5.Root and not localPlayer.InPlot.Value then
				local foodBanana = tbl5.MyToys:FindFirstChild("FoodBanana")
				if not foodBanana then
					tbl8.SpawnToy("FoodBanana", tbl5.Root.CFrame)
					task.wait(0.5)
					foodBanana = tbl5.MyToys:FindFirstChild("FoodBanana")
				end
				if foodBanana then
					local holdPart = foodBanana:FindFirstChild("HoldPart")
					local soundPart = foodBanana:FindFirstChild("SoundPart")
					local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
					local dropItemRemoteFunction = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")
					if holdPart and holdItemRemoteFunction and dropItemRemoteFunction then
						holdItemRemoteFunction:InvokeServer(foodBanana, tbl5.Char)
						task.wait(0.05)
						tbl6.UseFoodEvent:FireServer(foodBanana)
						task.wait(3)
						local vectorZero = tbl4.VectorZero
						dropItemRemoteFunction:InvokeServer(foodBanana, tbl5.Root.CFrame * CFrame.new(-5, 5, -5), vectorZero)
						task.wait(0.05)
						while soundPart and not soundPart:FindFirstChild("PartOwner") do
							tbl8.SNO(soundPart)
							task.wait()
						end
						if soundPart then
							tbl6.DestroyLineEvent:FireServer(soundPart)
						end
						for _, v in foodBanana:GetChildren() do
							if v.Name == "BananaPeel" and v:FindFirstChild("TouchInterest") then
								v.Size = Vector3.new(10, 10, 10)
								v.Transparency = 1
								v.CanCollide = false
								for _, v2 in tbl4.TargetPlayers, nil, nil do
									local v3 = tbl2.Players:FindFirstChild(v2:split(" ")[1])
									if v3 then
										local character = v3.Character
										character = character and character:FindFirstChild("HumanoidRootPart")
										if character then
											soundPart.CFrame = character.CFrame
											v.Position = character.Position
										end
									end
								end
							end
							if v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
					end
				end
			end
			task.wait()
		end
	end,
})
UI.Elm.ExplodePlayerToggle = UI.Sect.AdvancedSection:AddToggle({
	Name = "Explode player",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Settings = true,
	Flag = "ExplodePlayerToggle",
	Callback = function(explodePlayerEn)
		tbl7.ExplodePlayerEn = explodePlayerEn
		while tbl7.ExplodePlayerEn do
			if tbl5.Root then
				tbl8.SpawnToy(tbl4.ExplodeMode, tbl5.Root.CFrame)
			end
			task.wait(0.05)
		end
	end,
})
UI.Elm.ExplodePlayerToggle:AddDropdown({
	Name = "Explode mode",
	Default = "BallSnowball",
	Options = { "BallSnowball", "BombMissile", "BombDarkMatter", "BombBalloon" },
	Flag = "ExplodeModeDropdown",
	Callback = function(explodeMode)
		tbl4.ExplodeMode = explodeMode
	end,
})
UI.Elm.AntifoodToggle = UI.Sect.AdvancedSection:AddToggle({
	Name = "Anti food",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "AntiFoodToggle",
	Settings = true,
	Callback = function(grabAntikickEn)
		tbl7.GrabAntikickEn = grabAntikickEn
		while tbl7.GrabAntikickEn do
			for _, v in tbl4.TargetPlayers, nil, nil do
				if v then
					local v2 = tbl2.Players:FindFirstChild(v:split(" ")[1])
					if v2 then
						local v3 = workspace:FindFirstChild(v2.Name .. "SpawnedInToys")
						if v3 then
							for _, v4 in v3:GetChildren() do
								if v4 then
									if v4.Name ~= "LaggedHoldToy" then
										local holdPart = v4:FindFirstChild("HoldPart")
										local rigidConstraint = holdPart and holdPart:FindFirstChild("RigidConstraint")
										local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
										local dropItemRemoteFunction = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")
										if holdPart and holdPart.Parent and holdItemRemoteFunction and dropItemRemoteFunction and tbl5.Char then
											pcall(function()
												local n = 0
												while true do
													local flag = n <= 30 and rigidConstraint
													local flag2
													if flag then
														flag2 = rigidConstraint.Attachment1 == nil or rigidConstraint.Attachment1.Parent.Parent.Name ~= localPlayer.Name
													else
														flag2 = flag
													end
													if flag2 then
														holdItemRemoteFunction:InvokeServer(v4, tbl5.Char)
														task.wait()
														n += 1
														continue
													end
													break
												end
												task.wait(0.01)
												if v4 then
													if tbl4.AntiFoodMode == "Lag" then
														dropItemRemoteFunction:InvokeServer(v4, tbl4.VectorZero, tbl4.VectorZero)
														v4.Name = "LaggedHoldToy"
													elseif tbl4.AntiFoodMode == "Delete" then
														local vectorZero = tbl4.VectorZero
														dropItemRemoteFunction:InvokeServer(v4, CFrame.new(0, -9e9, 0), vectorZero)
													elseif tbl4.AntiFoodMode == "Anti input self" then
														local vectorZero = tbl4.VectorZero
														dropItemRemoteFunction:InvokeServer(v4, CFrame.new(0, 1000, 0), vectorZero)
													end
												end
											end)
										end
									end
								end
							end
						end
					end
				end
			end
			task.wait()
		end
	end,
})
UI.Elm.AntifoodToggle:AddDropdown({
	Name = "Anti food mode",
	Default = "Lag",
	Options = { "Lag", "Delete", "Hold", "Anti input self" },
	Flag = "AntiFoodModeDropdown",
	Callback = function(antiFoodMode)
		tbl4.AntiFoodMode = antiFoodMode
	end,
})
UI.Sect.AdvancedSection:AddToggle({
	Name = "Remove invisibility",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "RemoveInvisToggle",
	Callback = function(removeInvisEn)
		tbl7.RemoveInvisEn = removeInvisEn
		while tbl7.RemoveInvisEn do
			for _, v in tbl4.TargetPlayers, nil, nil do
				local v2 = tbl2.Players:FindFirstChild(v:split(" ")[1])
				if v2 then
					local character = v2.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if character and character.Massless then
						character.Massless = true
						task.wait()
						character.Massless = false
					end
				end
			end
			task.wait()
		end
	end,
})
UI.Sect.AdvancedSection:AddToggle({
	Name = "View",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "ViewToggle",
	Callback = function(viewEn)
		tbl7.ViewEn = viewEn
		if tbl7.ViewEn then
			local v = tbl2.Players:FindFirstChild(tbl4.SelectedPlayer:split(" ")[1])
			if v and v.Character then
				tbl5.Cam.CameraSubject = v.Character
			end
			tbl8.AddConnection("ViewConn", v.CharacterAdded, function()
				tbl5.Cam.CameraSubject = v.Character
			end)
		else
			tbl8.RemoveConnection("ViewConn")
			tbl5.Cam.CameraSubject = tbl5.Char
		end
	end,
})
UI.Sect.OwnershipSection = UI.Tabs.TargetTab:AddSection({ Name = "Ownership", Side = "Right" })
UI.Sect.OwnershipSection:AddDropdown({
	Name = "Ownership mode",
	Default = "Solo Faster",
	Options = { "Solo Stronger", "Solo Faster", "Multi Stronger", "Multi Faster" },
	Flag = "OwnershipModeDropdown",
	Callback = function(ownershipMode)
		tbl4.OwnershipMode = ownershipMode
	end,
})
UI.Sect.OwnershipSection:AddToggle({
	Name = "Kick",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "KickPlayerToggle",
	Callback = function(kickPlayerOwnershipEn)
		tbl7.KickPlayerOwnershipEn = kickPlayerOwnershipEn
		for _, v in tbl2.Players:GetPlayers() do
			v = v and v.Character
			v = v and v:FindFirstChild("HumanoidRootPart")
			local bodyPosition = v and v:FindFirstChild("BodyPosition")
			local bodyGyro = v and v:FindFirstChild("BodyGyro")
			if v and bodyPosition then
				bodyPosition:Destroy()
				if bodyGyro then
					bodyGyro:Destroy()
				end
			end
		end
		local tbl9 = { "Left Leg", "Right Leg", "Left Arm", "Right Arm", "Head", "HumanoidRootPart" }
		if tbl4.OwnershipMode == "Multi Faster" or tbl4.OwnershipMode == "Multi Stronger" then
			while tbl7.KickPlayerOwnershipEn do
				for k, targetPlayer in pairs(tbl4.TargetPlayers) do
					local parts = targetPlayer:split(" ")
					parts = parts and tbl2.Players:FindFirstChild(parts[1])
					local v = parts and tbl8.GetChar(parts)
					local humanoidRootPart = v and v:FindFirstChild("HumanoidRootPart")
					local humanoid = v and v:FindFirstChild("Humanoid")
					local head = v and v:FindFirstChild("Head")
					if v then
						v:FindFirstChild("Torso")
					end
					local RagdollPallet = tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")
					if parts and tbl5.Root and humanoidRootPart and not parts.InPlot.Value then
						local n = k * 6.2831853071795862 / #tbl4.TargetPlayers
						local n2 = tbl5.Root.Position.X + math.cos(n) * 7
						local n3 = tbl5.Root.Position.Z + math.sin(n) * 7
						local bodyPosition = humanoidRootPart:FindFirstChild("BodyPosition") or Instance.new("BodyPosition", humanoidRootPart)
						bodyPosition.Position = Vector3.new(n2, tbl5.Root.Position.Y + 17, n3)
						bodyPosition.MaxForce = tbl4.VectorInf
						bodyPosition.D = 100
						;(humanoidRootPart:FindFirstChild("BodyGyro") or Instance.new("BodyGyro", humanoidRootPart)).CFrame = tbl5.Root.CFrame
						if tbl7.KickPlayerOwnershipEn and humanoid and humanoidRootPart and humanoidRootPart.Position.Y < 2000 and tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) > 20 then
							if humanoid.Health == 0 then
								return
							end
							local cFrame = tbl5.Root.CFrame
							tbl5.Root.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -7)
							local n4 = 0
							while tbl7.KickPlayerOwnershipEn and n4 < 100 and humanoid and humanoidRootPart and tbl5.Root and humanoid.Health ~= 0 and (head:FindFirstChild("PartOwner") == nil or head:FindFirstChild("PartOwner") and head.PartOwner.Value ~= localPlayer.Name) do
								tbl5.Root.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -7)
								for _, descendant in ipairs(tbl5.Char:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.Velocity = Vector3.zero
										descendant.RotVelocity = Vector3.zero
									end
								end
								tbl8.SNO(humanoidRootPart)
								n4 += 1
								task.wait()
							end
							task.wait()
							tbl5.Root.CFrame = cFrame
							task.wait()
						end
						if humanoidRootPart and humanoidRootPart.Position.Y < 2000 and tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) <= 20 and humanoid and humanoid.Health ~= 0 then
							bodyPosition.Position = Vector3.new(n2, tbl5.Root.Position.Y + 17, n3)
							if tbl4.OwnershipMode == "Multi Faster" then
								humanoidRootPart.Velocity = Vector3.zero
								task.spawn(function()
									if humanoidRootPart then
										tbl8.SNO(humanoidRootPart)
										if RagdollPallet and RagdollPallet:FindFirstChild("SoundPart") and humanoidRootPart and tbl7.RagdollPlayerKickEn then
											task.spawn(firetouchinterest, RagdollPallet.SoundPart, humanoidRootPart, 0)
										end
										task.wait(0)
										tbl6.DestroyLineEvent:FireServer(humanoidRootPart)
									end
								end)
							else
								task.spawn(function()
									for i = 1, 3 do
										tbl8.SNO(humanoidRootPart)
										task.wait()
									end
								end)
								if RagdollPallet and RagdollPallet:FindFirstChild("SoundPart") and humanoidRootPart and tbl7.RagdollPlayerKickEn then
									task.spawn(firetouchinterest, RagdollPallet.SoundPart, humanoidRootPart, 0)
								end
								tbl6.DestroyLineEvent:FireServer(humanoidRootPart)
								task.wait()
								task.spawn(function()
									for i = 1, 3 do
										tbl8.SNO(humanoidRootPart)
										task.wait()
									end
								end)
								for i = 1, #tbl9 do
									local v2 = v[tbl9[i]]
									v2.CanTouch = false
									v2.CanCollide = false
									v2.Velocity = tbl4.VectorZero
									v2.RotVelocity = tbl4.VectorZero
								end
							end
						end
					end
				end
				task.wait(0.01)
			end
		else
			while true do
				if tbl7.KickPlayerOwnershipEn then
					if tbl7.KillPlayerEn then
						task.wait()
						return
					end
					local selectedPlayer = tbl4.SelectedPlayer and tbl2.Players:FindFirstChild(tbl4.SelectedPlayer:split(" ")[1])
					local v = selectedPlayer and tbl8.GetChar(selectedPlayer)
					local v2 = v and tbl8.GetRoot(v)
					if v then
						tbl8.GetTorso(v)
					end
					local v3 = v and tbl8.GetHum(v)
					local v4 = v and tbl8.GetHead(v)
					if selectedPlayer and tbl5.Root and v2 and v3 and v3.Health ~= 0 then
						if tbl7.KillPlayerEn then
							task.wait()
							return
						end
						local bodyPosition = v2:FindFirstChild("BodyPosition")
						local RagdollPallet = tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")
						local flag = true
						local n = 0
						local flag2 = false
						while flag and tbl5.Root and tbl7.KickPlayerOwnershipEn and tbl5.Char and v and v2 and v3 and v3.Health >= 1 and n <= 20 and selectedPlayer and not selectedPlayer.InPlot.Value do
							if tbl7.KillPlayerEn then
								task.wait()
								return
							end
							if v2 and not v2:FindFirstChild("BodyPosition") then
								bodyPosition = Instance.new("BodyPosition", v2)
								bodyPosition.MaxForce = tbl4.VectorInf
								bodyPosition.D = 100
								bodyPosition.Position = tbl5.Root.Position
							end
							local cFrame = tbl5.Root.CFrame
							while true do
								local char = tbl5.Root and n <= 50 and v4 and tbl5.Char
								if char then
									char = not (v4:FindFirstChild("PartOwner") or v4:FindFirstChild("PartOwner") and v4.PartOwner.Value == localPlayer.Name)
								end
								if char and not flag2 then
									if tbl7.KillPlayerEn then
										task.wait()
										return
									end
									if bodyPosition then
										bodyPosition.Position = cFrame.Position
									end
									tbl5.Root.CFrame = v2.CFrame * CFrame.new(0, 0, 5)
									tbl5.Root.Velocity = tbl4.VectorZero
									for _, v5 in tbl5.Char:GetDescendants() do
										if v5:IsA("BasePart") then
											v5.Velocity = Vector3.zero
											v5.RotVelocity = Vector3.zero
											v5.CanCollide = false
										end
									end
									n += 1
									tbl8.SNO(v2)
									if v4 and v4:FindFirstChild("PartOwner") and v4.PartOwner.Value == localPlayer.Name then
										if bodyPosition then
											bodyPosition.Position = cFrame.Position
										end
										v2.CFrame = cFrame
										v2.Velocity = tbl4.VectorZero
										flag2 = true
									end
									task.wait()
									continue
								end
								break
							end
							if cFrame ~= nil then
								tbl5.Root.CFrame = cFrame
								tbl5.Root.Velocity = tbl4.VectorZero
								if bodyPosition then
									bodyPosition.Position = cFrame.Position
								end
								cFrame = nil
							end
							if tbl5.Root and v4 and v4:FindFirstChild("PartOwner") and v4.PartOwner.Value == localPlayer.Name then
								if tbl7.KillPlayerEn then
									task.wait()
									return
								end
								if cFrame ~= nil then
									tbl5.Root.CFrame = cFrame
									tbl5.Root.Velocity = tbl4.VectorZero
									if bodyPosition then
										bodyPosition.Position = cFrame.Position
									end
									cFrame = nil
								end
								while flag and tbl5.Root and tbl7.KickPlayerOwnershipEn and tbl5.Char and selectedPlayer and v and v2 and v3 and v3.Health >= 1 and not selectedPlayer.InPlot.Value do
									if tbl7.KillPlayerEn then
										task.wait()
										return
									end
									if bodyPosition then
										bodyPosition.Position = tbl5.Root.Position + Vector3.new(0, 15, 5)
									end
									v2.RotVelocity = tbl4.VectorZero
									for i = 1, #tbl9 do
										local v5 = v:FindFirstChild(tbl9[i])
										if v5 then
											v5.Velocity = tbl4.VectorZero
											v5.RotVelocity = tbl4.VectorZero
											v5.CanCollide = false
											v5.CanTouch = false
										end
									end
									for _, child in ipairs(v:GetChildren()) do
										if child:IsA("BasePart") then
											child.CanCollide = false
										end
									end
									if RagdollPallet and RagdollPallet.SoundPart and tbl7.RagdollPlayerKickEn then
										firetouchinterest(RagdollPallet.SoundPart, v2, 0)
									end
									local flag3 = tbl5.Root and v2 and tbl8.GetMagnitude(tbl5.Root, v2) >= 30
									flag2 = true
									if flag3 then
										flag2 = false
										flag = false
										if cFrame ~= nil then
											tbl5.Root.CFrame = cFrame
											tbl5.Root.Velocity = tbl4.VectorZero
											if bodyPosition then
												bodyPosition.Position = cFrame.Position
											end
											cFrame = nil
										end
									end
									task.wait()
									if tbl4.OwnershipMode == "Solo Stronger" then
										tbl8.SNO(v2)
										task.wait()
										tbl8.SNO(v2)
										tbl6.DestroyLineEvent:FireServer(v2)
										tbl8.SNO(v2)
										task.wait()
										tbl8.SNO(v2)
										tbl8.SNO(v2)
										task.wait()
										tbl8.SNO(v2)
										tbl6.DestroyLineEvent:FireServer(v2)
									elseif tbl4.OwnershipMode == "Solo Faster" then
										task.spawn(function()
											tbl8.SNO(v2)
											task.wait()
										end)
										tbl6.DestroyLineEvent:FireServer(v2)
									end
								end
								if cFrame ~= nil then
									tbl5.Root.CFrame = cFrame
									tbl5.Root.Velocity = tbl4.VectorZero
									if bodyPosition then
										bodyPosition.Position = cFrame.Position
									end
								end
							end
							task.wait()
						end
					end
					if OldCF ~= nil then
						tbl5.Root.CFrame = OldCF
						tbl5.Root.Velocity = tbl4.VectorZero
						if Pos then
							Pos.Position = OldCF.Position
						end
						OldCF = nil
					end
					task.wait()
				else
					return
				end
			end
		end
	end,
})
UI.Sect.OwnershipSection:AddToggle({
	Name = "Grab",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Binded = true,
	Flag = "GrabPlayerToggle",
	Callback = function(grabPlayerEn)
		tbl7.GrabPlayerEn = grabPlayerEn
		for _, v in tbl2.Players:GetPlayers() do
			v = v and v.Character
			v = v and v:FindFirstChild("HumanoidRootPart")
			local bodyPosition = v and v:FindFirstChild("BodyPosition")
			local bodyGyro = v and v:FindFirstChild("BodyGyro")
			v = v and bodyPosition
			if v then
				bodyPosition:Destroy()
				if bodyGyro then
					bodyGyro:Destroy()
				end
			end
		end
		local tbl9 = { "Left Leg", "Right Leg", "Left Arm", "Right Arm", "Head", "HumanoidRootPart" }
		if tbl4.OwnershipMode:match("Multi") then
			while tbl7.GrabPlayerEn do
				for _, targetPlayer in pairs(tbl4.TargetPlayers) do
					local parts = targetPlayer:split(" ")
					parts = parts and tbl2.Players:FindFirstChild(parts[1])
					local head = parts and tbl8.GetChar(parts)
					local humanoidRootPart = head and head:FindFirstChild("HumanoidRootPart")
					local humanoid = head and head:FindFirstChild("Humanoid")
					head = head and head:FindFirstChild("Head")
					local RagdollPallet = tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")
					if parts and tbl5.Root and humanoidRootPart and not parts.InPlot.Value then
						local bodyPosition = humanoidRootPart:FindFirstChild("BodyPosition") or Instance.new("BodyPosition", humanoidRootPart)
						bodyPosition.Position = tbl5.Root.Position + Vector3.new(0, 0, -7)
						bodyPosition.MaxForce = tbl4.VectorInf
						bodyPosition.D = 200
						;(humanoidRootPart:FindFirstChild("BodyGyro") or Instance.new("BodyGyro", humanoidRootPart)).CFrame = tbl5.Root.CFrame
						if tbl7.GrabPlayerEn and humanoid and humanoidRootPart and humanoidRootPart.Position.Y < 2000 and tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) > 20 then
							if humanoid.Health == 0 then
								return
							end
							local cFrame = tbl5.Root.CFrame
							tbl5.Root.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -7)
							tbl5.Root.Velocity = tbl4.VectorZero
							local n = 0
							while tbl7.GrabPlayerEn and n < 100 and humanoid and humanoidRootPart and tbl5.Root and humanoid.Health ~= 0 and (head:FindFirstChild("PartOwner") == nil or head:FindFirstChild("PartOwner") and head.PartOwner.Value ~= localPlayer.Name) do
								tbl5.Root.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -7)
								for _, descendant in ipairs(tbl5.Char:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.Velocity = Vector3.zero
										descendant.RotVelocity = Vector3.zero
									end
								end
								tbl8.SNO(humanoidRootPart)
								n += 1
								task.wait(0.01)
							end
							task.wait(0.1)
							tbl5.Root.CFrame = cFrame
							tbl5.Root.Velocity = tbl4.VectorZero
							task.wait(0.01)
						end
						if humanoidRootPart and humanoidRootPart.Position.Y < 2000 and tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) <= 20 and humanoid and humanoid.Health ~= 0 then
							task.spawn(function()
								for i = 1, 2 do
									tbl8.SNO(humanoidRootPart)
									task.wait()
								end
								if RagdollPallet and RagdollPallet:FindFirstChild("SoundPart") and humanoidRootPart and tbl7.RagdollPlayerKickEn then
									task.spawn(firetouchinterest, RagdollPallet.SoundPart, humanoidRootPart, 0)
								end
							end)
						end
					end
				end
				task.wait()
			end
		else
			while tbl7.GrabPlayerEn do
				local selectedPlayer = tbl4.SelectedPlayer and tbl2.Players:FindFirstChild(tbl4.SelectedPlayer:split(" ")[1])
				local v = selectedPlayer and tbl8.GetChar(selectedPlayer)
				local v2 = v and tbl8.GetRoot(v)
				local v3 = v and tbl8.GetHum(v)
				local v4 = v and tbl8.GetHead(v)
				if selectedPlayer and tbl5.Root and v2 and v3 and v3.Health ~= 0 then
					local bodyPosition = v2:FindFirstChild("BodyPosition")
					local RagdollPallet = tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")
					local flag = true
					local n = 0
					local flag2 = false
					while flag and tbl5.Root and tbl7.GrabPlayerEn and tbl5.Char and v and v2 and v3 and v3.Health >= 1 and n <= 20 and selectedPlayer and not selectedPlayer.InPlot.Value do
						if v2 and not v2:FindFirstChild("BodyPosition") then
							bodyPosition = Instance.new("BodyPosition", v2)
							bodyPosition.MaxForce = tbl4.VectorInf
							bodyPosition.D = 100
							bodyPosition.Position = tbl5.Root.Position
						end
						local cFrame = tbl5.Root.CFrame
						while true do
							local char = tbl5.Root and n <= 50 and v4 and tbl5.Char
							if char then
								char = not (v4:FindFirstChild("PartOwner") or v4:FindFirstChild("PartOwner") and v4.PartOwner.Value == localPlayer.Name)
							end
							if char and not flag2 then
								if bodyPosition then
									bodyPosition.Position = cFrame.Position
								end
								tbl5.Root.CFrame = v2.CFrame * CFrame.new(0, -10, -5)
								tbl5.Root.Velocity = tbl4.VectorZero
								for _, v5 in tbl5.Char:GetDescendants() do
									if v5:IsA("BasePart") then
										v5.Velocity = Vector3.zero
										v5.RotVelocity = Vector3.zero
									end
								end
								n += 1
								for i = 1, 2 do
									tbl8.SNO(v2)
								end
								if v4 and v4:FindFirstChild("PartOwner") and v4.PartOwner.Value == localPlayer.Name then
									if bodyPosition then
										bodyPosition.Position = cFrame.Position
									end
									v2.CFrame = cFrame
									v2.Velocity = tbl4.VectorZero
									flag2 = true
								end
								task.wait()
								continue
							end
							break
						end
						if cFrame ~= nil then
							tbl5.Root.CFrame = cFrame
							tbl5.Root.Velocity = tbl4.VectorZero
							if bodyPosition then
								bodyPosition.Position = cFrame.Position
							end
							cFrame = nil
						end
						if tbl5.Root and v4 and v4:FindFirstChild("PartOwner") and v4.PartOwner.Value == localPlayer.Name then
							if cFrame ~= nil then
								tbl5.Root.CFrame = cFrame
								tbl5.Root.Velocity = tbl4.VectorZero
								if bodyPosition then
									bodyPosition.Position = cFrame.Position
								end
								cFrame = nil
							end
							while flag and tbl5.Root and tbl7.GrabPlayerEn and tbl5.Char and selectedPlayer and v and v2 and v3 and v3.Health >= 1 and not selectedPlayer.InPlot.Value do
								if bodyPosition then
									bodyPosition.Position = tbl5.Root.Position + Vector3.new(0, 0, 5)
								end
								v2.Velocity = tbl4.VectorZero
								v2.RotVelocity = tbl4.VectorZero
								for i = 1, #tbl9 do
									local v5 = v:FindFirstChild(tbl9[i])
									if v5 then
										v5.Velocity = tbl4.VectorZero
										v5.RotVelocity = tbl4.VectorZero
										v5.CanCollide = false
										v5.CanTouch = false
									end
								end
								tbl8.SNO(v2)
								if RagdollPallet and RagdollPallet.SoundPart and tbl7.RagdollPlayerKickEn then
									firetouchinterest(RagdollPallet.SoundPart, v2, 0)
								end
								local flag3 = tbl5.Root and v2 and tbl8.GetMagnitude(tbl5.Root, v2) >= 30
								flag2 = true
								if flag3 then
									flag2 = false
									flag = false
									if cFrame ~= nil then
										tbl5.Root.CFrame = cFrame
										tbl5.Root.Velocity = tbl4.VectorZero
										if bodyPosition then
											bodyPosition.Position = cFrame.Position
										end
										cFrame = nil
									end
								end
								tbl2.RunS.RenderStepped:Wait()
								tbl8.SNO(v2)
								if RagdollPallet and RagdollPallet.SoundPart and tbl7.RagdollPlayerKickEn then
									firetouchinterest(RagdollPallet.SoundPart, v2, 0)
								end
							end
							if cFrame ~= nil then
								tbl5.Root.CFrame = cFrame
								tbl5.Root.Velocity = tbl4.VectorZero
								if bodyPosition then
									bodyPosition.Position = cFrame.Position
								end
							end
						end
						task.wait()
					end
				end
				if OldCF ~= nil then
					tbl5.Root.CFrame = OldCF
					tbl5.Root.Velocity = tbl4.VectorZero
					if Pos then
						Pos.Position = OldCF.Position
					end
					OldCF = nil
				end
				task.wait()
			end
		end
	end,
})
UI.Elm.GrabToysTargetToggle = UI.Sect.OwnershipSection:AddToggle({
	Name = "Grab toys",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "GrabToysToggle",
	Settings = true,
	Callback = function(grabAllEn)
		tbl7.GrabAllEn = grabAllEn
		while tbl7.GrabAllEn do
			for _, v in tbl4.TargetPlayers, nil, nil do
				if v then
					local v2 = tbl2.Players:FindFirstChild(v:split(" ")[1])
					if v2 then
						local v3 = workspace:FindFirstChild(v2.Name .. "SpawnedInToys")
						if v3 then
							for _, v4 in v3:GetChildren() do
								if v4 then
									local stickyPart
									if tbl7.GrabAntikickEn and v4:FindFirstChild("StickyPart") then
										stickyPart = v4:FindFirstChild("StickyPart")
									else
										stickyPart = nil
										if not tbl7.GrabAntikickEn then
											stickyPart = v4:FindFirstChild("SoundPart") or v4:FindFirstChild("Part")
										end
									end
									local children, v5, v6 = v4:GetChildren()
									local v7 = nil
									for _, v8 in children, v5, v6 do
										if v8:IsA("BasePart") and v8.CanQuery then
											v7 = v8
										end
									end
									if v7 and stickyPart and stickyPart.Parent and tbl5.Root and tbl8.GetMagnitude(tbl5.Root, stickyPart) <= 35 then
										local n = 0
										while v7 and stickyPart.Parent and n <= 40 and tbl5.Root and tbl8.GetMagnitude(tbl5.Root, stickyPart) <= 35 do
											tbl8.SNO(v7)
											local bodyPosition = v7:FindFirstChild("BodyPosition") or Instance.new("BodyPosition", v7)
											bodyPosition.Position = Vector3.new(0, 100000, 0)
											bodyPosition.D = 100
											bodyPosition.MaxForce = tbl4.VectorInf
											n += 1
											task.wait()
										end
									end
								end
							end
						end
					end
				end
			end
			task.wait()
		end
	end,
})
UI.Elm.GrabToysTargetToggle:AddToggle({
	Name = "Grab only sticky",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "GrabAntiKickToggle",
	Callback = function(grabAntikickEn)
		tbl7.GrabAntikickEn = grabAntikickEn
	end,
})
UI.Sect.OwnershipSection:AddToggle({
	Name = "Ragdoll",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "RagdollPlayerToggle",
	Callback = function(ragdollPlayerKickEn)
		tbl7.RagdollPlayerKickEn = ragdollPlayerKickEn
		if not tbl7.RagdollPlayerKickEn then
			return
		end
		if UI.Orion.Flags.AutoRagdollFigureToggle and not UI.Orion.Flags.AutoRagdollFigureToggle.Value then
			UI.Orion.Flags.AutoRagdollFigureToggle:Set(true)
		end
	end,
})
UI.Sect.TeleportSection = UI.Tabs.TargetTab:AddSection({ Name = "Loop TP", Side = "Left" })
UI.Sect.TeleportSection:AddToggle({
	Name = "TP to player(s)",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Callback = function(tpToPlayerEn)
		tbl7.TPToPlayerEn = tpToPlayerEn
		while tbl7.TPToPlayerEn do
			for _, v in tbl4.TargetPlayers, nil, nil do
				local v2 = tbl2.Players:FindFirstChild(v:split(" ")[1])
				if v2 and tbl5.Root then
					local character = v2.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					if character and character.Position.Y < 2000 then
						local cFrame = tbl5.Root.CFrame
						tbl5.Root.CFrame = character.CFrame * CFrame.new(0, 5, 0)
						if tbl7.TPBackEn then
							task.wait(tbl4.TPDelay / 1000)
							tbl5.Root.CFrame = cFrame
						end
						tbl5.Root.Velocity = tbl4.VectorZero
					end
				end
				task.wait(tbl4.TPDelay / 1000)
			end
			task.wait()
		end
	end,
})
UI.Sect.TeleportSection:AddToggle({
	Name = "TP back",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "TPBackToggle",
	Callback = function(tpBackEn)
		tbl7.TPBackEn = tpBackEn
	end,
})
UI.Sect.TeleportSection:AddSlider({
	Name = "Delay (milliseconds)",
	Min = 0,
	Max = 1000,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = 10,
	Flag = "TPDelaySlider",
	Callback = function(tpDelay)
		tbl4.TPDelay = tpDelay
	end,
})
UI.Sect.SitBlobmanSection = UI.Tabs.TargetTab:AddSection({ Name = "Sit blobman", Side = "Left" })
UI.Sect.SitBlobmanSection:AddBind({
	Name = "Kill gucci player",
	Button = true,
	Callback = function()
		local v = tbl8.GetAllToys(false)
		local tbl9 = {}
		if not tbl5.Root or not tbl5.Hum then
			return
		end
		local cFrame = tbl5.Root.CFrame
		local v2 = tbl2.Players:FindFirstChild(tbl4.SelectedPlayer:split(" ")[1])
		if not v2 then
			return
		end
		for _, v3 in v, nil, nil do
			if v3.Name == "CreatureBlobman" or v3.Name == "TractorGreen" or v3.Name == "TractorRed" or v3.Name == "TractorOrange" then
				if v3.Parent and v3.Parent.Name == v2.Name .. "SpawnedInToys" then
					tbl9[#tbl9 + 1] = v3
				end
			end
		end
		tbl5.Hum.Sit = true
		task.wait(0.1)
		tbl5.Hum.Sit = false
		for _, v3 in tbl9, nil, nil do
			local vehicleSeat = v3:FindFirstChild("VehicleSeat")
			if vehicleSeat and not vehicleSeat.Occupant then
				for i = 1, 30 do
					if vehicleSeat.Occupant ~= tbl5.Hum then
						vehicleSeat:Sit(tbl5.Hum)
						if tbl5.Root then
							tbl5.Root.CFrame = cFrame
						end
						task.wait()
					end
				end
				task.wait()
				while tbl5.Hum.Sit do
					tbl5.Hum.Sit = false
				end
				task.wait(0.01)
			end
		end
		if tbl5.Root then
			tbl5.Root.CFrame = cFrame
			tbl5.Root.Velocity = tbl4.VectorZero
		end
		if workspace[localPlayer.Name] then
			local v3 = workspace[localPlayer.Name]
			task.wait(0.5)
			local localCreatureControl = v3:WaitForChild("LocalCreatureControl", 5)
			if localCreatureControl then
				localCreatureControl:Destroy()
			end
			v3.GrabbingScript.Enabled = false
			task.wait()
			v3.GrabbingScript.Enabled = true
			task.wait(1)
			local camPart = v3:FindFirstChild("CamPart")
			if camPart then
				camPart:Destroy()
			end
		end
	end,
})
UI.Tabs.BindTab = UI.Window:MakeTab({ Name = "Keybinds", Icon = "keyboard" })
UI.Sect.MySectionBinds = UI.Tabs.BindTab:AddSection({ Name = "Me", Side = "Left" })
UI.Elm.TP_Z = UI.Sect.MySectionBinds:AddBind({
	Name = "TP",
	Default = "",
	Hold = false,
	Flag = "TPBind",
	Callback = function()
		if not tbl5.Root then
			return
		end
		local hit = tbl5.Mouse.Hit
		if tbl5.Mouse.Target then
			tbl7.IsTeleportingBind = true
			task.wait()
			if not tbl7.SlideTPEn then
				tbl5.Root.CFrame = CFrame.new(hit.X, hit.Y + 5, hit.Z)
			else
				tbl2.TweenS:Create(tbl5.Root, TweenInfo.new(tbl4.SlideDuration / 10, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), { CFrame = CFrame.new(hit.X, hit.Y + 5, hit.Z) }):Play()
			end
			for i = 1, 5 do
				if tbl5.Char then
					for _, v in tbl5.Char:GetDescendants() do
						if v:IsA("BasePart") then
							v.Velocity = tbl4.VectorZero
							v.RotVelocity = tbl4.VectorZero
						end
					end
				end
				task.wait()
			end
			task.wait()
			tbl7.IsTeleportingBind = false
		end
	end,
})
UI.Elm.SlideTPToggle = UI.Sect.MySectionBinds:AddToggle({
	Name = "Slide TP",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "SlideTPToggle",
	Settings = true,
	Callback = function(slideTPEn)
		tbl7.SlideTPEn = slideTPEn
	end,
})
UI.Elm.SlideTPToggle:AddSlider({
	Name = "Slide Duration",
	Min = 1,
	Max = 10,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 0.5,
	Default = tbl4.SlideDuration,
	Flag = "SlideDurationSlider",
	Callback = function(slideDuration)
		tbl4.SlideDuration = slideDuration
	end,
})
UI.Elm.Dash = UI.Sect.MySectionBinds:AddBind({
	Name = "Dash",
	Default = "",
	Hold = false,
	Flag = "DashBind",
	Callback = function()
		if not tbl5.Root or not tbl5.Hum then
			return
		end
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://242455877"
		local v = tbl5.Hum:LoadAnimation(animation)
		v:Play()
		v:AdjustSpeed(2.1)
		for i = 1, 30 do
			tbl5.Root.CFrame = tbl5.Root.CFrame * CFrame.new(0, 0, -2)
			tbl5.Root.Velocity = tbl4.VectorZero
			task.wait()
		end
	end,
})
UI.Elm.LockMouse = UI.Sect.MySectionBinds:AddBind({
	Name = "Lock/unlock Mouse",
	Default = "",
	Hold = false,
	Flag = "UnlockMouseBind",
	Callback = function()
		tbl8.RemoveConnection("UnlockMouseConn")
		tbl7.LockMouse = not tbl7.LockMouse
		if tbl7.LockMouse then
			tbl8.AddConnection("UnlockMouseConn", tbl2.RunS.RenderStepped, function()
				tbl2.UIS.MouseBehavior = Enum.MouseBehavior.Default
				tbl2.UIS.MouseIconEnabled = true
			end)
		else
			tbl2.UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
			tbl2.UIS.MouseIconEnabled = false
		end
	end,
})
UI.Elm.ToggleUI = UI.Sect.MySectionBinds:AddBind({
	Name = "Toggle UI",
	Default = "",
	Hold = false,
	Flag = "ToggleUIBind",
	Callback = function()
		if UI.Window then
			UI.Window:SetToggleKey(UI.Orion.Flags.ToggleUIBind.Value)
		end
	end,
})
UI.Elm.Bring = UI.Sect.MySectionBinds:AddBind({
	Name = "Bring",
	Default = "",
	Hold = false,
	Flag = "BringBind",
	Callback = function()
		if not tbl5.Root then
			return
		end
		local target = tbl5.Mouse.Target
		if not target then
			return
		end
		if target.CollisionGroup == "Items" or target.Parent:FindFirstChild("HumanoidRootPart") then
			local cFrame = tbl5.Root.CFrame
			local n = 0
			while true do
				tbl5.Root.CFrame = target.CFrame
				tbl8.SNO(target)
				n += 1
				task.wait()
				local flag = target:FindFirstChild("PartOwner") and target.PartOwner.Value == localPlayer.Name
				local flag2
				if flag then
					flag2 = flag
				else
					flag2 = target.Parent:FindFirstChild("Head") and target.Parent.Head:FindFirstChild("PartOwner") and target.Parent.Head.PartOwner.Value == localPlayer.Name
				end
				flag2 = flag2 or n >= 100
				if not flag2 then
					continue
				end
				break
			end
			tbl5.Root.CFrame = cFrame
			tbl5.Root.Velocity = tbl4.VectorZero
			if n < 100 then
				for i = 1, 20 do
					target.CFrame = cFrame * CFrame.new(0, 0, -2)
					target.Velocity = tbl4.VectorZero
					task.wait()
				end
			end
			tbl6.DestroyLineEvent:FireServer(target)
		end
	end,
})
UI.Elm.BlobmanSit = UI.Sect.MySectionBinds:AddBind({
	Name = "Sit blobman",
	Default = "",
	Hold = false,
	Flag = "SitBlobBind",
	Button = true,
	Callback = function()
		if not tbl5.Root or not tbl5.Hum then
			return
		end
		local creatureBlobman = tbl5.MyToys:FindFirstChild("CreatureBlobman")
		if not creatureBlobman then
			tbl8.SpawnToy("CreatureBlobman", tbl5.Root.CFrame)
			tbl5.MyToys.ChildAdded:Once(function(child)
				if child.Name == "CreatureBlobman" then
					creatureBlobman = child
				end
			end)
		end
		creatureBlobman = tbl5.MyToys:WaitForChild("CreatureBlobman", 1.5)
		if creatureBlobman then
			local vehicleSeat = creatureBlobman:FindFirstChild("VehicleSeat") or creatureBlobman:WaitForChild("VehicleSeat", 2)
			if vehicleSeat then
				vehicleSeat:Sit(tbl5.Hum)
			end
		end
	end,
})
UI.Elm.VFLYToggle = UI.Sect.MySectionBinds:AddToggle({
	Name = "Vehiclefly",
	Flag = "VflyToggle",
	Binded = true,
	Settings = true,
	Callback = function(vehicleFlyEn)
		tbl7.VehicleFlyEn = vehicleFlyEn
		if tbl7.VehicleFlyEn then
			while tbl7.VehicleFlyEn do
				if tbl5.Root and tbl5.Hum and tbl5.Hum.Health ~= 0 then
					local flyPos = tbl5.Root:FindFirstChild("FlyPos") or Instance.new("BodyPosition")
					local flyGyro = tbl5.Root:FindFirstChild("FlyGyro") or Instance.new("BodyGyro")
					flyGyro.Name = "FlyGyro"
					flyGyro.Parent = tbl5.Root
					flyGyro.MaxTorque = tbl4.VectorInf
					flyGyro.CFrame = tbl5.Cam.CFrame
					flyGyro.P = 20000
					flyPos.Name = "FlyPos"
					flyPos.Parent = tbl5.Root
					flyPos.MaxForce = tbl4.VectorInf
					flyPos.Position = tbl5.Root.Position
					flyPos.P = 20000
					local exitTo = nil
					while true do
						if tbl7.VehicleFlyEn then
							if not flyPos or not flyGyro or not tbl5.Root or not tbl5.Hum or tbl5.Hum and tbl5.Hum.Health == 0 then
								exitTo = 1
								break
							else
								flyGyro.CFrame = tbl5.Cam.CFrame
								if not tbl2.UIS:GetFocusedTextBox() then
									if tbl2.UIS:IsKeyDown(tbl3.W) then
										tbl5.Root.CFrame = tbl5.Root.CFrame * CFrame.new(0, 0, -tbl4.ControlSpeed)
									end
									if tbl2.UIS:IsKeyDown(tbl3.A) then
										tbl5.Root.CFrame = tbl5.Root.CFrame * CFrame.new(-tbl4.ControlSpeed, 0, 0)
									end
									if tbl2.UIS:IsKeyDown(tbl3.S) then
										tbl5.Root.CFrame = tbl5.Root.CFrame * CFrame.new(0, 0, tbl4.ControlSpeed)
									end
									if tbl2.UIS:IsKeyDown(tbl3.D) then
										tbl5.Root.CFrame = tbl5.Root.CFrame * CFrame.new(tbl4.ControlSpeed, 0, 0)
									end
									flyPos.Position = tbl5.Root.Position
									task.wait()
									continue
								end
							end
							break
						else
							exitTo = 1
							break
						end
					end
					if exitTo ~= 1 then
						return
					end
				end
				task.wait()
			end
		elseif tbl5.Root then
			for _, v in tbl5.Root:GetChildren() do
				if v.Name == "FlyPos" or v.Name == "FlyGyro" then
					v:Destroy()
				end
			end
		end
	end,
})
UI.Elm.VFLYToggle:AddSlider({
	Name = "Fly Speed",
	Min = 0,
	Max = 10,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 0.1,
	Default = tbl4.ControlSpeed,
	Flag = "FlySpeedSlider",
	Callback = function(controlSpeed)
		tbl4.ControlSpeed = controlSpeed
	end,
})
UI.Sect.TouchSection = UI.Tabs.BindTab:AddSection({ Name = "Players - touch", Side = "Right" })
UI.Elm.AutoTouch = UI.Sect.TouchSection:AddBind({
	Name = "Autoclicker touch",
	Default = "",
	Hold = false,
	Flag = "AutoclickTouchBind",
	Callback = function()
		local target = tbl5.Mouse.Target
		if target then
			if not table.find(tbl4.AutoclickItems, target) then
				tbl4.AutoclickItems[#tbl4.AutoclickItems + 1] = target
				tbl7.AutoclickTouchEn = true
				while tbl7.AutoclickTouchEn do
					for _, v in tbl4.AutoclickItems, nil, nil do
						tbl8.SNO(v)
						if v.Parent and v.Parent:FindFirstChild("HumanoidRootPart") then
							local ragdollPallet = tbl5.MyToys:FindFirstChild("RagdollPallet")
							ragdollPallet = ragdollPallet and ragdollPallet:FindFirstChild("SoundPart")
							if ragdollPallet then
								firetouchinterest(ragdollPallet, v.Parent.HumanoidRootPart, 0)
							end
						end
						task.wait(0.01)
					end
					task.wait(0.01)
				end
			end
		else
			tbl7.AutoclickTouchEn = false
			tbl4.AutoclickItems = {}
		end
	end,
})
UI.Elm.SpinTouch = UI.Sect.TouchSection:AddBind({
	Name = "Spin touch",
	Default = "",
	Hold = false,
	Flag = "SpinTouchBind",
	Callback = function()
		local target = tbl5.Mouse.Target
		if not target then
			return
		end
		if not workspace:FindFirstChild("GrabParts") then
			tbl8.SNO(target)
			task.wait(0.1)
		end
		local spinthrust = target:FindFirstChild("SPINTHRUST") or Instance.new("BodyThrust")
		spinthrust.Name = "SPINTHRUST"
		spinthrust.Parent = target
		spinthrust.Force = Vector3.new(100, 0, 100)
		spinthrust.Location = target.Position
		task.spawn(function()
			task.wait(60)
			if spinthrust then
				spinthrust:Destroy()
			end
		end)
	end,
})
UI.Sect.AnchorSection = UI.Tabs.BindTab:AddSection({ Name = "Anchor", Side = "Right" })
UI.Elm.AnchorTouch = UI.Sect.AnchorSection:AddBind({
	Name = "Anchor touch",
	Default = "",
	Hold = false,
	Flag = "AnchorTouchBind",
	Button = true,
	Callback = function()
		local grabParts = workspace:FindFirstChild("GrabParts")
		local grabPart = nil
		if grabParts then
			grabPart = grabParts:FindFirstChild("GrabPart")
			grabPart = grabPart and grabPart:FindFirstChild("WeldConstraint")
			grabPart = grabPart and grabPart.Part1
		end
		grabPart = grabPart or tbl5.Mouse.Target
		if not grabPart then
			return
		end
		tbl8.SNO(grabPart)
		task.wait(0.1)
		local anchorPosition = grabPart:FindFirstChild("AnchorPosition") or Instance.new("BodyPosition")
		local anchorGyro = grabPart:FindFirstChild("AnchorGyro") or Instance.new("BodyGyro")
		anchorGyro.Name = "AnchorGyro"
		anchorGyro.Parent = grabPart
		anchorGyro.CFrame = grabPart.CFrame
		anchorGyro.MaxTorque = tbl4.VectorInf
		anchorGyro.D = 100
		anchorPosition.Name = "AnchorPosition"
		anchorPosition.Parent = grabPart
		anchorPosition.Position = grabPart.Position
		anchorPosition.D = 100
		anchorPosition.MaxForce = tbl4.VectorInf
		tbl4.LastAnchored = grabPart
		table.insert(tbl4.AnchoredParts, grabPart)
	end,
})
UI.Elm.OpenLastAnchor = UI.Sect.AnchorSection:AddBind({
	Name = "Open last part anchor",
	Default = "",
	Hold = false,
	Flag = "OpenLastAnchorBind",
	Button = true,
	Callback = function()
		if tbl4.LastAnchored and tbl4.LastAnchored:FindFirstChild("AnchorGyro") then
			tbl4.LastAnchored.AnchorGyro:Destroy()
		end
	end,
})
UI.Elm.OpenLastAnchorAll = UI.Sect.AnchorSection:AddBind({
	Name = "Open all anchored parts",
	Default = "",
	Hold = false,
	Flag = "OpenAllAnchorBind",
	Button = true,
	Callback = function()
		for _, v in tbl4.AnchoredParts, nil, nil do
			if v and v:FindFirstChild("AnchorGyro") then
				v.AnchorGyro:Destroy()
			end
		end
	end,
})
UI.Elm.UnanchorAll = UI.Sect.AnchorSection:AddBind({
	Name = "Unanchor all anchored parts",
	Default = "",
	Hold = false,
	Flag = "UnanchorAllBind",
	Button = true,
	Callback = function()
		for k, v in tbl4.AnchoredParts, nil, nil do
			if v then
				if v:FindFirstChild("AnchorPosition") then
					v.AnchorPosition:Destroy()
				end
				if v:FindFirstChild("AnchorGyro") then
					v.AnchorGyro:Destroy()
				end
			end
			table.remove(tbl4.AnchoredParts, k)
		end
	end,
})
UI.Sect.AnchorSection:AddToggle({
	Name = "Auto grab anchored",
	Flag = "AutoGrabAnchoredThings",
	Default = false,
	Callback = function(autoGrabAnchoredEn)
		tbl7.AutoGrabAnchoredEn = autoGrabAnchoredEn
		while tbl7.AutoGrabAnchoredEn do
			if not tbl5.Root then
				return
			end
			local cFrame = tbl5.Root.CFrame
			for _, v in tbl4.AnchoredParts, nil, nil do
				if v and not isnetworkowner(v) then
					while not isnetworkowner(v) do
						if tbl8.GetMagnitude(v, tbl5.Root) >= 20 then
							tbl5.Root.CFrame = v.CFrame
						end
						tbl8.SNO(v)
						task.wait(0.01)
					end
					tbl5.Root.CFrame = cFrame
					tbl5.Root.Velocity = tbl4.VectorZero
				end
				task.wait(0.01)
			end
			task.wait(0.01)
		end
	end,
})
UI.Sect.DeleteLimbsSection = UI.Tabs.BindTab:AddSection({ Name = "Delete limbs", Side = "Left" })
UI.Elm.DeleteLeftArm = UI.Sect.DeleteLimbsSection:AddBind({
	Name = "Delete left arm",
	Default = "",
	Hold = false,
	Flag = "DeleteLArmBind",
	Callback = function()
		tbl8.DeleteLimbPlayer({ "Left Arm" })
	end,
})
UI.Elm.DeleteRightArm = UI.Sect.DeleteLimbsSection:AddBind({
	Name = "Delete right arm",
	Default = "",
	Hold = false,
	Flag = "DeleteRArmBind",
	Callback = function()
		tbl8.DeleteLimbPlayer({ "Right Arm" })
	end,
})
UI.Elm.DeleteLeftLeg = UI.Sect.DeleteLimbsSection:AddBind({
	Name = "Delete left leg",
	Default = "",
	Hold = false,
	Flag = "DeleteLLegBind",
	Callback = function()
		tbl8.DeleteLimbPlayer({ "Left Leg" })
	end,
})
UI.Elm.DeleteRightLeg = UI.Sect.DeleteLimbsSection:AddBind({
	Name = "Delete right leg",
	Default = "",
	Hold = false,
	Flag = "DeleteRLegBind",
	Callback = function()
		tbl8.DeleteLimbPlayer({ "Right Leg" })
	end,
})
UI.Elm.DeleteAll = UI.Sect.DeleteLimbsSection:AddBind({
	Name = "Delete all",
	Default = "",
	Hold = false,
	Flag = "DeleteAllBind",
	Callback = function()
		tbl8.DeleteLimbPlayer({ "Left Arm", "Right Arm", "Left Leg", "Right Leg" })
	end,
})
UI.Sect.ResetBindsSection = UI.Tabs.BindTab:AddSection({ Name = "Reset all keybinds", Side = "Right" })
UI.Sect.ResetBindsSection:AddButton({
	Name = "Reset all",
	Callback = function()
		for _, v in UI.Elm, nil, nil do
			if v and v.Set then
				v:Set("")
			end
		end
	end,
})
UI.Tabs.FigureGrabTab = UI.Window:MakeTab({ Name = "Figure Grab", Icon = "boxes" })
UI.Sect.ToggleSection = UI.Tabs.FigureGrabTab:AddSection({ Name = "Toggle", Side = "Left" })
UI.Elm.FigureGrab = UI.Sect.ToggleSection:AddBind({
	Name = "Figure grab",
	Default = "",
	Hold = false,
	Flag = "FigureGrabBind",
	Callback = function()
		local target = tbl5.Mouse.Target
		if tbl7.FigureGrabEn then
			tbl7.FigureGrabEn = false
			if _G.FigureGrabConn then
				_G.FigureGrabConn:Disconnect()
				_G.FigureGrabConn = nil
			end
			local tbl9 = { "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Head" }
			for _, v in tbl4.FigurePlayers, nil, nil do
				if v and v.Parent then
					for _, v2 in v:GetChildren() do
						if v2:IsA("Accessory") and v2:FindFirstChild("Handle") then
							v2.Handle.Transparency = 0
						end
					end
					for _, v2 in tbl9, nil, nil do
						local v3 = v:FindFirstChild(v2)
						local torso = v:FindFirstChild("Torso")
						if torso then
							torso.Velocity = tbl4.VectorZero
							torso.CanCollide = true
							torso.CanQuery = true
							torso.LocalTransparencyModifier = 0
						end
						if v3 then
							v3.Velocity = tbl4.VectorZero
							v3.RotVelocity = tbl4.VectorZero
							v3.CanCollide = true
							v3.CanQuery = true
							v3.LocalTransparencyModifier = 0
						end
					end
				end
			end
			tbl4.FigurePlayers = {}
			return
		end
		if not target or not target.Parent or not target.Parent:FindFirstChild("HumanoidRootPart") then
			tbl4.FigurePlayers = {}
			return
		end
		tbl7.FigureGrabEn = true
		tbl4.LineDistance = 5
		local parent = target.Parent
		local torso = parent:FindFirstChild("Torso")
		local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
		local humanoid = parent:FindFirstChild("Humanoid")
		parent:FindFirstChild("Head")
		if not (torso and humanoidRootPart and humanoid) then
			tbl7.FigureGrabEn = false
			return
		end
		if not table.find(tbl4.FigurePlayers, parent) then
			tbl4.FigurePlayers[#tbl4.FigurePlayers + 1] = parent
		end
		local soundPart = nil
		if tbl7.AutoRagdollEn then
			local RagdollPallet = tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")
			soundPart = RagdollPallet and RagdollPallet:FindFirstChild("SoundPart")
		end
		local n = 0
		local function fn2(arg, arg2, arg3, arg4)
			local v = arg:FindFirstChild(arg2)
			if v and torso then
				v.Velocity = tbl4.VectorZero
				v.RotVelocity = tbl4.VectorZero
				v.CanCollide = false
				v.CanQuery = false
				v.CFrame = torso.CFrame * CFrame.new(arg3[1], arg3[2], arg3[3])
				v.CFrame = v.CFrame * CFrame.Angles(math.rad(arg4[1]), math.rad(arg4[2]), math.rad(arg4[3]))
				if tbl7.MoveSyncFigureEn and tbl5.Char and tbl5.Char:FindFirstChild(arg2) then
					local cFrame = tbl5.Char[arg2].CFrame
					v.CFrame = torso.CFrame * tbl5.Torso.CFrame:Inverse() * cFrame
				end
				if v:FindFirstChild("RagdollLimbPart") then
					v.RagdollLimbPart.CanCollide = false
				end
				if tbl7.LocalTransparencyModifierFigureEn then
					v.LocalTransparencyModifier = 0.8
				end
			end
		end
		_G.FigureGrabConn = tbl2.RunS.Heartbeat:Connect(function()
			if not tbl7.FigureGrabEn then
				return
			end
			local v = nil
			local v2 = nil
			for k, v3 in tbl4.FigurePlayers, v, v2 do
				if not (v3 and v3.Parent) then
					table.remove(tbl4.FigurePlayers, k)
					return
				end
				local torso2 = v3:FindFirstChild("Torso")
				local head = v3:FindFirstChild("Head")
				local humanoidRootPart2 = v3:FindFirstChild("HumanoidRootPart")
				local humanoid2 = v3:FindFirstChild("Humanoid")
				if not (torso2 and head and humanoidRootPart2) then
					return
				end
				local cFrame
				if not tbl7.CircleAuraFigureEn then
					local cframe = CFrame.Angles
					local rad = math.rad
					local holdRotZ = tbl4.FG.HoldRotZ
					cFrame = tbl5.Root.CFrame * CFrame.new(tbl4.FG.HoldPosX, tbl4.FG.HoldPosY, tbl4.FG.HoldPosZ) * cframe(math.rad(tbl4.FG.HoldRotX), math.rad(tbl4.FG.HoldRotY), rad(holdRotZ))
				else
					local n2 = k * 6.2831853071795862 / #tbl4.FigurePlayers
					if tbl7.RotationAuraFigureEn then
						n += tbl4.FigureRotationSpeed / 1000
						n2 += n
					end
					local figureRadius = tbl4.FigureRadius
					local n3 = tbl4.FG.HoldPosX + math.cos(n2) * figureRadius
					local figureRadius2 = tbl4.FigureRadius
					local rad = math.rad
					local holdRotZ = tbl4.FG.HoldRotZ
					cFrame = CFrame.new(tbl5.Root.Position.X + n3, tbl5.Root.Position.Y + tbl4.FG.HoldPosY, tbl5.Root.Position.Z + tbl4.FG.HoldPosZ + math.sin(n2) * figureRadius2) * CFrame.Angles(math.rad(tbl4.FG.HoldRotX), math.rad(tbl4.FG.HoldRotY), rad(holdRotZ))
				end
				if tbl7.LoopGrabFigureEn and not tbl7.CircleAuraFigureEn then
					tbl6.SetNetworkOwnerEvent:FireServer(torso2, torso2.CFrame)
				end
				if tbl7.AutoRagdollEn and soundPart and humanoidRootPart2 and humanoid2 and humanoid2:FindFirstChild("Ragdolled") and not humanoid2.Ragdolled.Value then
					firetouchinterest(soundPart, humanoidRootPart2, 0)
				end
				if tbl7.LocalTransparencyModifierFigureEn then
					for _, v4 in v3:GetChildren() do
						if v4:IsA("Accessory") and v4:FindFirstChild("Handle") then
							v4.Handle.Transparency = 0.9
						end
					end
				end
				if head:FindFirstChild("PartOwner") and head.PartOwner.Value == localPlayer.Name then
					if tbl7.MoveSyncFigureEn then
						humanoidRootPart2.CFrame = cFrame
					else
						torso2.CFrame = cFrame
					end
					if tbl7.LocalTransparencyModifierFigureEn then
						torso2.LocalTransparencyModifier = 0.8
					end
					if tbl7.MoveSyncFigureEn and tbl5.Torso then
						local cFrame2 = tbl5.Torso.CFrame
						torso2.CFrame = cFrame * tbl5.Root.CFrame:Inverse() * cFrame2
					end
					if tbl7.CircleAuraFigureEn and tbl7.LookSyncAuraEn then
						torso2.CFrame = CFrame.lookAt(torso2.Position, tbl5.Root.Position + Vector3.new(tbl4.FG.HoldPosX, tbl4.FG.HoldPosY, tbl4.FG.HoldPosZ))
					end
					torso2.Velocity = tbl4.VectorZero
					torso2.RotVelocity = tbl4.VectorZero
					torso2.CanCollide = false
					torso2.CanQuery = false
					fn2(v3, "Left Arm", {
						tbl4.FG.LArmPosX,
						tbl4.FG.LArmPosY,
						tbl4.FG.LArmPosZ,
					}, {
						tbl4.FG.LArmRotX,
						tbl4.FG.LArmRotY,
						tbl4.FG.LArmRotZ,
					})
					fn2(v3, "Right Arm", {
						tbl4.FG.RArmPosX,
						tbl4.FG.RArmPosY,
						tbl4.FG.RArmPosZ,
					}, {
						tbl4.FG.RArmRotX,
						tbl4.FG.RArmRotY,
						tbl4.FG.RArmRotZ,
					})
					fn2(v3, "Left Leg", {
						tbl4.FG.LLegPosX,
						tbl4.FG.LLegPosY,
						tbl4.FG.LLegPosZ,
					}, {
						tbl4.FG.LLegRotX,
						tbl4.FG.LLegRotY,
						tbl4.FG.LLegRotZ,
					})
					fn2(v3, "Right Leg", {
						tbl4.FG.RLegPosX,
						tbl4.FG.RLegPosY,
						tbl4.FG.RLegPosZ,
					}, {
						tbl4.FG.RLegRotX,
						tbl4.FG.RLegRotY,
						tbl4.FG.RLegRotZ,
					})
					fn2(v3, "Head", {
						tbl4.FG.HeadPosX,
						tbl4.FG.HeadPosY,
						tbl4.FG.HeadPosZ,
					}, {
						tbl4.FG.HeadRotX,
						tbl4.FG.HeadRotY,
						tbl4.FG.HeadRotZ,
					})
				else
					tbl8.SNO(head)
				end
			end
		end)
	end,
})
UI.Sect.ToggleSection:AddToggle({
	Name = "Auto ragdoll",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AutoRagdollFigureToggle",
	Callback = function(autoRagdollEn)
		tbl7.AutoRagdollEn = autoRagdollEn
		if tbl7.AutoRagdollEn then
			while tbl7.AutoRagdollEn do
				if not (tbl8.CheckPlotInventory("RagdollPallet") or tbl5.MyToys:FindFirstChild("RagdollPallet")) and tbl5.Root then
					tbl8.SpawnToy("PalletLightBrown", tbl5.Root.CFrame)
				end
				task.wait(0.15)
			end
		elseif tbl5.MyToys:FindFirstChild("RagdollPallet") then
			tbl8.DestroyToy(tbl5.MyToys:FindFirstChild("RagdollPallet"))
		end
	end,
})
UI.Sect.ToggleSection:AddToggle({
	Name = "Loop grab",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "LoopGrabFigureToggle",
	Callback = function(loopGrabFigureEn)
		tbl7.LoopGrabFigureEn = loopGrabFigureEn
	end,
})
UI.Sect.ToggleSection:AddToggle({
	Name = "Transparency modifier",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "TransparencyFigureToggle",
	Callback = function(localTransparencyModifierFigureE)
		tbl7.LocalTransparencyModifierFigureEn = localTransparencyModifierFigureE
	end,
})
UI.Sect.FigureAuraSection = UI.Tabs.FigureGrabTab:AddSection({ Name = "Aura", Side = "Left" })
UI.Elm.FigureAuraToggle = UI.Sect.FigureAuraSection:AddToggle({
	Name = "Grab Aura",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "GrabAuraFigureToggle",
	Settings = true,
	Callback = function(grabAuraFigureEn)
		tbl7.GrabAuraFigureEn = grabAuraFigureEn
		while tbl7.GrabAuraFigureEn do
			for _, v in tbl2.Players:GetPlayers() do
				if v and v.Character and tbl5.Root and v ~= localPlayer then
					local character = v.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if humanoidRootPart and tbl8.GetMagnitude(humanoidRootPart, tbl5.Root) < 20 then
						if not table.find(tbl4.FigurePlayers, character) then
							tbl4.FigurePlayers[#tbl4.FigurePlayers + 1] = character
						end
					end
				end
			end
			task.wait(0.01)
		end
	end,
})
UI.Elm.FigureAuraToggle:AddToggle({
	Name = "Circle Aura",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "CircleAuraFigureToggle",
	Callback = function(circleAuraFigureEn)
		tbl7.CircleAuraFigureEn = circleAuraFigureEn
	end,
})
UI.Elm.FigureAuraToggle:AddToggle({
	Name = "Aura rotation",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AuraRotationFigureToggle",
	Callback = function(rotationAuraFigureEn)
		tbl7.RotationAuraFigureEn = rotationAuraFigureEn
	end,
})
UI.Elm.FigureAuraToggle:AddToggle({
	Name = "Look sync",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "LookSyncFigureToggle",
	Callback = function(lookSyncAuraEn)
		tbl7.LookSyncAuraEn = lookSyncAuraEn
	end,
})
UI.Sect.FigureAuraSection:AddToggle({
	Name = "Move sync",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "MoveSyncFigureToggle",
	Callback = function(moveSyncFigureEn)
		tbl7.MoveSyncFigureEn = moveSyncFigureEn
	end,
})
UI.Elm.FigureAuraToggle:AddSlider({
	Name = "Circle radius",
	Min = 1,
	Max = 20,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = 1,
	Flag = "figurecircleradius_slider",
	Callback = function(figureRadius)
		tbl4.FigureRadius = figureRadius
	end,
})
UI.Elm.FigureAuraToggle:AddSlider({
	Name = "Rotation speed",
	Min = 2,
	Max = 100,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 2,
	Default = 0,
	Flag = "figurerotationspeed_slider",
	Callback = function(figureRotationSpeed)
		tbl4.FigureRotationSpeed = figureRotationSpeed
	end,
})
UI.Sect.SettingsSectionFigure = UI.Tabs.FigureGrabTab:AddSection({ Name = "Settings", Side = "Right" })
tbl4.SelectedPos = "Holding"
UI.Elm.PositionsDropdown = UI.Sect.SettingsSectionFigure:AddDropdown({
	Name = "Positions",
	Default = "Holding",
	Options = { "Holding", "Left arm", "Right arm", "Left leg", "Right leg", "Head" },
	MaxSize = 6,
	Callback = function(selectedPos)
		tbl4.SelectedPos = selectedPos
		local v = tbl4.FGVals[tbl4.SelectedPos .. "PosX"]
		if v then
			UI.Elm.PosX:Set(tbl4.FG[v])
			UI.Elm.PosY:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosY"]])
			UI.Elm.PosZ:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosZ"]])
			UI.Elm.RotX:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotX"]])
			UI.Elm.RotY:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotY"]])
			UI.Elm.RotZ:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotZ"]])
		end
	end,
})
UI.Elm.PosX = UI.Sect.SettingsSectionFigure:AddSlider({
	Name = "Position X",
	Min = -20,
	Max = 20,
	Color = Color3.fromRGB(102, 0, 0),
	ValueName = "",
	Increment = 0.2,
	Default = 0,
	Flag = "PositionXSlider",
	Callback = function(arg)
		if tbl4.SelectedPos == "..." then
			return
		end
		tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosX"]] = arg
	end,
})
UI.Elm.PosY = UI.Sect.SettingsSectionFigure:AddSlider({
	Name = "Position Y",
	Min = -20,
	Max = 20,
	Color = Color3.fromRGB(0, 102, 0),
	ValueName = "",
	Increment = 0.2,
	Default = 0,
	Flag = "PositionYSlider",
	Callback = function(arg)
		if tbl4.SelectedPos == "..." then
			return
		end
		tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosY"]] = arg
	end,
})
UI.Elm.PosZ = UI.Sect.SettingsSectionFigure:AddSlider({
	Name = "Position Z",
	Min = -20,
	Max = 20,
	Color = Color3.fromRGB(0, 0, 102),
	ValueName = "",
	Increment = 0.2,
	Default = -5,
	Flag = "PositionZSlider",
	Callback = function(arg)
		if tbl4.SelectedPos == "..." then
			return
		end
		tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosZ"]] = arg
	end,
})
UI.Elm.RotX = UI.Sect.SettingsSectionFigure:AddSlider({
	Name = "Rotation X",
	Min = 0,
	Max = 360,
	Color = Color3.fromRGB(102, 0, 0),
	ValueName = "",
	Increment = 0.2,
	Default = 0,
	Flag = "RotationXSlider",
	Callback = function(arg)
		if tbl4.SelectedPos == "..." then
			return
		end
		tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotX"]] = arg
	end,
})
UI.Elm.RotY = UI.Sect.SettingsSectionFigure:AddSlider({
	Name = "Rotation Y",
	Min = 0,
	Max = 360,
	Color = Color3.fromRGB(0, 102, 0),
	ValueName = "",
	Increment = 0.2,
	Default = 0,
	Flag = "RotationYSlider",
	Callback = function(arg)
		if tbl4.SelectedPos == "..." then
			return
		end
		tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotY"]] = arg
	end,
})
UI.Elm.RotZ = UI.Sect.SettingsSectionFigure:AddSlider({
	Name = "Rotation Z",
	Min = 0,
	Max = 360,
	Color = Color3.fromRGB(0, 0, 102),
	ValueName = "",
	Increment = 0.2,
	Default = 0,
	Flag = "RotationZSlider",
	Callback = function(arg)
		if tbl4.SelectedPos == "..." then
			return
		end
		tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotZ"]] = arg
	end,
})
UI.Sect.SettingsSectionFigure:AddButton({
	Name = "Reset positions",
	Callback = function()
		UI.Elm.PosX:Set(0)
		UI.Elm.PosY:Set(0)
		UI.Elm.PosZ:Set(0)
	end,
})
UI.Sect.SettingsSectionFigure:AddButton({
	Name = "Reset rotations",
	Callback = function()
		UI.Elm.RotX:Set(0)
		UI.Elm.RotY:Set(0)
		UI.Elm.RotZ:Set(0)
	end,
})
UI.Sect.SaveFiguresSection = UI.Tabs.FigureGrabTab:AddSection({ Name = "Save figures", Side = "Right" })
UI.Elm.FiguresDropdown = UI.Sect.SaveFiguresSection:AddDropdown({
	Name = "Figures list",
	Default = "",
	Options = tbl8.GetConfigs("Figure"),
	Flag = "FiguresDropdown",
	Search = true,
	Callback = function(figureName)
		tbl4.FigureName = figureName
	end,
})
UI.Sect.SaveFiguresSection:AddTextbox({
	Name = "Figure name",
	Default = "",
	TextDisappear = false,
	Callback = function(arg)
		tbl4.FigureName = arg:gsub(" ", "_")
	end,
})
UI.Sect.SaveFiguresSection:AddButton({
	Name = "Load figure",
	Callback = function()
		tbl8.LoadConfig(tbl4.FigureName, "Figure")
		UI.Elm.PosX:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosX"]])
		UI.Elm.PosY:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosY"]])
		UI.Elm.PosZ:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "PosZ"]])
		UI.Elm.RotX:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotX"]])
		UI.Elm.RotY:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotY"]])
		UI.Elm.RotZ:Set(tbl4.FG[tbl4.FGVals[tbl4.SelectedPos .. "RotZ"]])
	end,
})
UI.Sect.SaveFiguresSection:AddButton({
	Name = "Save figure",
	DoubleTap = true,
	TapDelay = 0.8,
	Callback = function()
		tbl8.SaveConfig(tbl4.FigureName, "Figure")
		UI.Elm.FiguresDropdown:Refresh(tbl8.GetConfigs("Figure"), true)
	end,
})
UI.Sect.SaveFiguresSection:AddButton({
	Name = "Refresh figures list",
	Callback = function()
		UI.Elm.FiguresDropdown:Refresh(tbl8.GetConfigs("Figure"), true)
	end,
})
UI.Tabs.VisualTab = UI.Window:MakeTab({ Name = "Visual", Icon = "eye" })
UI.Sect.CustomsSection = UI.Tabs.VisualTab:AddSection({ Name = "Customs", Side = "Left" })
UI.Sect.CustomsSection:AddDropdown({
	Name = "Select Shader",
	Default = "",
	Options = { "Old", "Purple New", "Fullbright New", "Desert New", "Fog map" },
	Flag = "ShaderDropdown",
	Callback = function(shader)
		tbl4.Shader = shader
		if tbl7.ShaderEn then
			tbl8.ApplyShader(tbl4.Shader)
		end
	end,
})
UI.Sect.CustomsSection:AddToggle({
	Name = "Shaders",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "ShaderToggle",
	Callback = function(shaderEn)
		tbl7.ShaderEn = shaderEn
		if tbl7.ShaderEn then
			tbl8.ApplyShader(tbl4.Shader)
		else
			for _, v in game.Lighting:GetChildren() do
				if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("Sky") or v:IsA("DepthOfFieldEffect") then
					v:Destroy()
				end
			end
			game.Lighting.Brightness = 2
			game.Lighting.ExposureCompensation = 0
			game.Lighting.ClockTime = 14
			game.Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
			game.Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
			game.Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
			game.Lighting.FogColor = Color3.fromRGB(192, 192, 192)
			game.Lighting.FogEnd = 100000
			game.Lighting.FogStart = 0
			game.Lighting.ShadowSoftness = 0
			game.Lighting.Ambient = Color3.fromRGB(120, 120, 120)
		end
	end,
})
UI.Sect.CustomsSection:AddSlider({
	Name = "Depth of field",
	Default = 0,
	Min = 0,
	Max = 10,
	Increment = 0.1,
	ValueName = "Blur",
	Flag = "DepthOfFieldSlider",
	Callback = function(arg)
		local lighting = game.Lighting
		local shaderDepthOfField = lighting:FindFirstChild("ShaderDepthOfField")
		if not shaderDepthOfField then
			local depthOfFieldEffect = Instance.new("DepthOfFieldEffect", lighting)
			depthOfFieldEffect.Name = "ShaderDepthOfField"
			depthOfFieldEffect.InFocusRadius = 20
			shaderDepthOfField = depthOfFieldEffect
		end
		shaderDepthOfField.FarIntensity = arg / 10
	end,
})
tbl4.BlackholeUrl = isfile("TheWorstSaves/FTAP/BlackholeURL.txt") and readfile("TheWorstSaves/FTAP/BlackholeURL.txt") or ""
task.spawn(function()
	tbl4.BlackholeAsset = tbl8.LoadPhotoFromUrl(tbl4.BlackholeUrl)
end)
UI.Sect.CustomsSection:AddToggle({
	Name = "Custom blackhole",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "CustomBlackholeToggle",
	Callback = function(customBlackholeEn)
		tbl7.CustomBlackholeEn = customBlackholeEn
		tbl4.BlackholeAsset = tbl8.LoadPhotoFromUrl(tbl4.BlackholeUrl)
	end,
})
UI.Sect.CustomsSection:AddTextbox({
	Name = "Blackhole url",
	Default = "",
	TextDisappear = false,
	Callback = function(blackholeUrl)
		tbl4.BlackholeUrl = blackholeUrl
		writefile("TheWorstSaves/FTAP/BlackholeURL.txt", blackholeUrl)
		tbl4.BlackholeAsset = tbl8.LoadPhotoFromUrl(tbl4.BlackholeUrl)
	end,
})
UI.Sect.ESPSection = UI.Tabs.VisualTab:AddSection({ Name = "ESP", Side = "Right" })
task.spawn(function()
	tbl4.ESPPlayersColorOutline = Color3.fromHex(tbl4.ReadfileESP.PlayersColorOutline)
	tbl4.ESPPlayersTransparencyOutline = tbl4.ReadfileESP.PlayersTransparencyOutline
	tbl4.ESPPlayersColorFill = Color3.fromHex(tbl4.ReadfileESP.PlayersColorFill)
	tbl4.ESPPlayersTransparencyFill = tbl4.ReadfileESP.PlayersTransparencyFill
	tbl4.ESPStickyColorOutline = Color3.fromHex(tbl4.ReadfileESP.StickyColorOutline)
	tbl4.ESPStickyColorFill = Color3.fromHex(tbl4.ReadfileESP.StickyColorFill)
	tbl4.ESPStickyTransparencyOutline = tbl4.ReadfileESP.StickyTransparencyOutline
	tbl4.ESPStickyTransparencyFill = tbl4.ReadfileESP.StickyTransparencyFill
	tbl4.ESPPCLDTransparency = tbl4.ReadfileESP.PCLDTransparency
	tbl4.ESPPCLDColor = Color3.fromHex(tbl4.ReadfileESP.PCLDColor)
end)
UI.Elm.ESPPlrToggle = UI.Sect.ESPSection:AddToggle({
	Name = "Players",
	Default = false,
	Color = tbl4.ESPPlayersColor,
	Flag = "ESPPlayersToggle",
	Settings = true,
	Callback = function(espPlayersEn)
		tbl7.ESPPlayersEn = espPlayersEn
		if tbl7.ESPPlayersEn then
			for _, v in tbl2.Players:GetPlayers() do
				tbl4.PlayersESP[#tbl4.PlayersESP + 1] = v
				tbl8.CreateESP(v, "| " .. v.Name .. " (" .. v.DisplayName .. ") |")
				local v2 = tbl8.GetChar(v)
				v2 = v2 and tbl8.GetHum(v2)
				if v2 then
					v2.DisplayDistanceType = "None"
				end
			end
		else
			for _, v in tbl2.Players:GetPlayers() do
				local v2 = tbl8.GetChar(v)
				v2 = v2 and tbl8.GetHum(v2)
				if v2 then
					for _, v3 in v.Character:GetDescendants() do
						if v3.Name == "PlayerEspGui" or v3.Name == "PlayerEspHighlight" then
							v3:Destroy()
						end
					end
					v2.DisplayDistanceType = "Viewer"
				end
			end
		end
	end,
})
tbl4.LastESPUpdated = tick()
UI.Elm.ESPPlrToggle:AddColorpicker({
	Name = "Players outline",
	Default = tbl4.ESPPlayersColorOutline,
	Callback = function(espPlayersColorOutline, espPlayersTransparencyOutline)
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		tbl4.ESPPlayersColorOutline = espPlayersColorOutline
		tbl4.ESPPlayersTransparencyOutline = espPlayersTransparencyOutline
		for _, v in tbl4.PlayersESP, nil, nil do
			local character = v.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if character and character:FindFirstChild("PlayerEspHighlight") then
				character.PlayerEspHighlight.OutlineColor = espPlayersColorOutline
				character.PlayerEspHighlight.OutlineTransparency = espPlayersTransparencyOutline
			end
		end
		task.delay(2, function()
			local lastESPUpdated = tbl4.LastESPUpdated
			if tick() - lastESPUpdated >= 1.9 then
				tbl8.UpdateESPConfig()
				tbl4.LastESPUpdated = tick()
			end
		end)
	end,
})
UI.Elm.ESPPlrToggle:AddColorpicker({
	Name = "Players fill",
	Default = tbl4.ESPPlayersColorFill,
	Callback = function(fillColor, fillTransparency)
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		for _, v in tbl4.PlayersESP, nil, nil do
			local character = v.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if character and character:FindFirstChild("PlayerEspHighlight") then
				character.PlayerEspHighlight.FillColor = fillColor
				character.PlayerEspHighlight.FillTransparency = fillTransparency
			end
		end
		task.delay(2, function()
			local lastESPUpdated = tbl4.LastESPUpdated
			if tick() - lastESPUpdated >= 1.9 then
				tbl8.UpdateESPConfig()
				tbl4.LastESPUpdated = tick()
			end
		end)
	end,
})
UI.Elm.ESPPCLDToggle = UI.Sect.ESPSection:AddToggle({
	Name = "PlayerCharacterLocationDetector",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "ESPPcldToggle",
	Settings = true,
	Callback = function(pcldEspEn)
		tbl7.PCLDEspEn = pcldEspEn
		if tbl7.PCLDEspEn then
			tbl4.PCLDS = {}
			for _, v in workspace:GetChildren() do
				if v.Name:match("PCLD") or v.Name == "PlayerCharacterLocationDetector" then
					tbl4.PCLDS[#tbl4.PCLDS + 1] = v
				end
			end
			for _, v in tbl4.PCLDS, nil, nil do
				local boxHandleAdornment = Instance.new("BoxHandleAdornment")
				boxHandleAdornment.Name = "ESP"
				boxHandleAdornment.Parent = v
				boxHandleAdornment.Adornee = v
				boxHandleAdornment.AlwaysOnTop = true
				boxHandleAdornment.ZIndex = 0
				boxHandleAdornment.Size = v.Size
				boxHandleAdornment.Transparency = tbl4.ESPPCLDTransparency
				boxHandleAdornment.Color3 = tbl4.ESPPCLDColor
				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Adornee = v
				billboardGui.Size = UDim2.new(0, 100, 0, 25)
				billboardGui.StudsOffset = Vector3.new(0, -1, 0)
				billboardGui.AlwaysOnTop = true
				billboardGui.LightInfluence = 0
				billboardGui.Parent = v
				billboardGui.Name = "ESPGui"
				billboardGui.MaxDistance = 70
				local textLabel = Instance.new("TextLabel")
				textLabel.Size = UDim2.new(1, 0, 1, 0)
				textLabel.BackgroundTransparency = 1
				textLabel.Text = v.Name
				textLabel.TextColor3 = Color3.new(1, 1, 1)
				textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
				textLabel.TextStrokeTransparency = 0.5
				textLabel.Font = Enum.Font.GothamBold
				textLabel.TextSize = 8
				textLabel.Parent = billboardGui
				textLabel.Name = "ESPName"
			end
		else
			for _, v in tbl4.PCLDS, nil, nil do
				for _, v2 in v:GetChildren() do
					if v2.Name == "ESP" or v2.Name == "ESPGui" or v2.Name == "ESPName" then
						v2:Destroy()
					end
				end
			end
		end
	end,
})
UI.Elm.ESPPCLDToggle:AddColorpicker({
	Name = "PCLD Color",
	Default = tbl4.ESPPCLDColor,
	Callback = function(esppcldColor, esppcldTransparency)
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		tbl4.ESPPCLDColor = esppcldColor
		tbl4.ESPPCLDTransparency = esppcldTransparency
		for _, v in workspace:GetChildren() do
			if (v.Name:match("PCLD") or v.Name == "PlayerCharacterLocationDetector") and v:FindFirstChild("ESP") then
				v.ESP.Color3 = esppcldColor
				v.ESP.Transparency = esppcldTransparency
			end
		end
		task.delay(2, function()
			local lastESPUpdated = tbl4.LastESPUpdated
			if tick() - lastESPUpdated >= 1.9 then
				tbl8.UpdateESPConfig()
				tbl4.LastESPUpdated = tick()
				print("ESp")
			end
		end)
	end,
})
UI.Elm.ESPStickyToggle = UI.Sect.ESPSection:AddToggle({
	Name = "Sticky parts",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "ESPStickyToggle",
	Settings = true,
	Callback = function(espStickyEn)
		tbl7.ESPStickyEn = espStickyEn
		if tbl7.ESPStickyEn then
			tbl4.StickyParts = {}
			for _, v in tbl8.GetAllToys(true), nil, nil do
				local stickyPart = v:FindFirstChild("StickyPart")
				if stickyPart then
					tbl4.StickyParts[#tbl4.StickyParts + 1] = stickyPart
				end
			end
			for _, v in tbl4.StickyParts, nil, nil do
				if v then
					local highlight = Instance.new("Highlight")
					highlight.Adornee = v.Parent
					highlight.Parent = v
					highlight.OutlineColor = tbl4.ESPStickyColorOutline
					highlight.FillColor = tbl4.ESPStickyColorFill
					highlight.OutlineTransparency = tbl4.ESPStickyTransparencyOutline
					highlight.FillTransparency = tbl4.ESPStickyTransparencyFill
					highlight.Name = "StickyEspHighlight"
					for _, v2 in v.Parent:GetChildren() do
						if v2:IsA("BasePart") and math.floor(v2.Transparency * 10) / 10 == 0.8 then
							v2.Transparency = 0
						end
					end
				end
			end
		else
			for _, v in tbl4.StickyParts, nil, nil do
				if v and v:FindFirstChild("StickyEspHighlight") then
					v.StickyEspHighlight:Destroy()
				end
				if v and v.Parent and v.Parent.Name == "AntiKickPickaxe" then
					for _, v2 in v.Parent:GetChildren() do
						if v2:IsA("BasePart") and v2.Name ~= "StickyPart" and v2.Name ~= "SoundPart" and v2.Name ~= "Main" then
							v2.CanCollide = false
							v2.Transparency = 0.8
						end
						if v2:IsA("BasePart") then
							v2.CanQuery = false
						end
					end
				end
			end
		end
	end,
})
UI.Elm.ESPStickyToggle:AddColorpicker({
	Name = "Sticky outline",
	Default = tbl4.ESPStickyColorOutline,
	Callback = function(espStickyColorOutline, espStickyTransparencyOutline)
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		tbl4.ESPStickyColorOutline = espStickyColorOutline
		tbl4.ESPStickyTransparencyOutline = espStickyTransparencyOutline
		for _, v in tbl4.StickyParts, nil, nil do
			if v and v:FindFirstChild("StickyEspHighlight") then
				v.StickyEspHighlight.OutlineColor = espStickyColorOutline
				v.StickyEspHighlight.OutlineTransparency = espStickyTransparencyOutline
			end
		end
		task.delay(2, function()
			local lastESPUpdated = tbl4.LastESPUpdated
			if tick() - lastESPUpdated >= 1.9 then
				tbl8.UpdateESPConfig()
				tbl4.LastESPUpdated = tick()
			end
		end)
	end,
})
UI.Elm.ESPStickyToggle:AddColorpicker({
	Name = "Sticky fill",
	Default = tbl4.ESPStickyColorFill,
	Callback = function(espStickyColorFill, espStickyTransparencyFill)
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		tbl4.ESPStickyColorFill = espStickyColorFill
		tbl4.ESPStickyTransparencyFill = espStickyTransparencyFill
		for _, v in tbl4.StickyParts, nil, nil do
			if v and v:FindFirstChild("StickyEspHighlight") then
				v.StickyEspHighlight.FillColor = espStickyColorFill
				v.StickyEspHighlight.FillTransparency = espStickyTransparencyFill
			end
		end
		task.delay(2, function()
			local lastESPUpdated = tbl4.LastESPUpdated
			if tick() - lastESPUpdated >= 1.9 then
				tbl8.UpdateESPConfig()
				tbl4.LastESPUpdated = tick()
			end
		end)
	end,
})
UI.Elm.TracerBlackToggle = UI.Sect.ESPSection:AddToggle({
	Name = "Blackhole tracer",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "BlackholeTracerToggle",
	Settings = true,
	Callback = function(blackholeTracerEn)
		tbl7.BlackholeTracerEn = blackholeTracerEn
	end,
})
UI.Elm.TracerBlackToggle:AddColorpicker({
	Name = "Tracer color",
	Default = tbl4.TracerColor,
	Callback = function(tracerColor)
		tbl4.TracerColor = tracerColor
	end,
})
UI.Sect.AimSection = UI.Tabs.VisualTab:AddSection({ Name = "Aim", Side = "Right" })
UI.Sect.AimSection:AddToggle({
	Name = "Trigger bot",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "TriggerBotToggle",
	Binded = true,
	Callback = function(triggerEn)
		tbl7.TriggerEn = triggerEn
		local flag = true
		local n = 20
		local n2 = 0.3
		local v = nil
		if tbl7.TriggerEn then
			tbl8.AddConnection("TriggerNotifierConn", tbl2.ReplicadedS.GamepassEvents.FurtherReachBoughtNotifier.OnClientEvent, function()
				n = 30
			end)
			local function fn2()
				if not tbl5.Root then
					return nil
				end
				if workspace:FindFirstChild("GrabParts") then
					return nil
				end
				local position = tbl5.Cam.CFrame.Position
				local lookVector = tbl5.Cam.CFrame.LookVector
				local raycastParams = RaycastParams.new()
				raycastParams.FilterDescendantsInstances = { tbl5.Char, workspace.Terrain }
				raycastParams.FilterType = Enum.RaycastFilterType.Exclude
				local hit = workspace:Raycast(position, lookVector * 1000, raycastParams) or workspace:Raycast(position, (lookVector - Vector3.new(0, 0.1, 0)).Unit * 1000, raycastParams) or workspace:Raycast(position, (lookVector + Vector3.new(0, 0.1, 0)).Unit * 1000, raycastParams)
				if not hit then
					return nil
				end
				local instance = hit.Instance
				local parent = instance.Parent
				if not parent or not parent:FindFirstChild("Humanoid") then
					parent = instance:FindFirstAncestorWhichIsA("Model")
					if not parent or not parent:FindFirstChild("Humanoid") or parent.Humanoid.Health <= 0 then
						return nil
					end
				elseif parent.Humanoid.Health <= 0 then
					return nil
				end
				if parent == tbl5.Char then
					return nil
				end
				local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return nil
				end
				if tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) > n then
					return nil
				end
				if tbl8.GetMagnitude(instance, humanoidRootPart) > 10 then
					return nil
				end
				return parent
			end
			tbl8.AddConnection("TriggerRenderConn", tbl2.RunS.RenderStepped, function()
				if not tbl7.TriggerEn or not flag or tbl2.UIS:GetFocusedTextBox() ~= nil then
					return
				end
				local v2 = fn2()
				if v2 then
					v = v2
				end
				if v then
					local humanoidRootPart = v:FindFirstChild("HumanoidRootPart")
					if humanoidRootPart and tbl8.GetMagnitude(tbl5.Root, humanoidRootPart) <= n then
						v2 = v
					else
						v = nil
					end
				end
				if v2 then
					flag = false
					task.spawn(function()
						task.wait(0.0002)
						tbl2.UIS.MouseButton1Click:Fire()
						local n3 = 0
						while true do
							task.wait(0.01)
							n3 += 1
							if not (not workspace:FindFirstChild("GrabParts") or n3 > 20) then
								continue
							end
							break
						end
						task.wait(n2 + n3 * 0.005)
						flag = true
						v = nil
					end)
				end
			end)
		else
			tbl8.RemoveConnection("TriggerRenderConn")
			tbl8.RemoveConnection("TriggerNotifierConn")
		end
	end,
})
UI.Tabs.ServerTab = UI.Window:MakeTab({ Name = "Server", Icon = "server" })
UI.Sect.ServerInfoSection = UI.Tabs.ServerTab:AddSection({ Name = "Server info", Side = "Left" })
tbl4.PlayingPlayers = #tbl2.Players:GetPlayers()
UI.Elm.BlobmanKicksLabel = UI.Sect.ServerInfoSection:AddLabel("Kicked people: 0")
UI.Elm.AllPlayersLabel = UI.Sect.ServerInfoSection:AddLabel("Playing people: " .. tbl4.PlayingPlayers)
UI.Sect.ServerInfoSection:AddButton({
	Name = "Copy join script",
	Callback = function()
		setclipboard(string.format("game:GetService'TeleportService':TeleportToPlaceInstance(%s, '%s', game.Players.LocalPlayer)", game.PlaceId, game.JobId))
	end,
})
UI.Sect.LocalInfoSection = UI.Tabs.ServerTab:AddSection({ Name = "Local info", Side = "Left" })
UI.Elm.YourPing = UI.Sect.LocalInfoSection:AddLabel("FPS: 0\nPing: 0")
UI.Elm.YourServerTime = UI.Sect.LocalInfoSection:AddLabel("Playtime: 0")
UI.Sect.UsersSection = UI.Tabs.ServerTab:AddSection({ Name = "TheWorst users", Side = "Left" })
tbl4.TWUsersList = { "You | Premium" }
UI.Elm.UsersDropdown = UI.Sect.UsersSection:AddDropdown({
	Name = "Users list (this server)",
	Default = "",
	Options = tbl8.UpdateList(tbl4.TWUsersList),
	Callback = function()
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		tbl8.Notify("It's just a list", "selecting people doesn't make any sense")
	end,
})
UI.Sect.NotifysSection = UI.Tabs.ServerTab:AddSection({ Name = "Notifications", Side = "Right" })
tbl4.SoundsVolume = tbl4.ReadfileSound.SoundVolume
UI.Sect.NotifysSection:AddDropdown({
	Name = "Sounds list",
	Default = "TheWorst default",
	Options = {
		"TheWorst default",
		"Neverlose (Resonance)",
		"CS:GO Headshot",
		"Half-life button",
		"Smack",
		"EZ",
		"Steam notification",
		"Steam notification 2",
		"Pizza scream",
		"Skeleton roar",
	},
	Callback = function(arg)
		if not getgenv().LoadedTheWorstHvH then
			return
		end
		tbl4.SelectedSoundId = ({
			["TheWorst default"] = "96867813755421",
			["Neverlose (Resonance)"] = "97643101798871",
			["CS:GO Headshot"] = "5764885315",
			["Half-life button"] = "8470808181",
			Smack = "6509749580",
			EZ = "18603736229",
			["Steam notification"] = "195868961",
			["Steam notification 2"] = "18317665126",
			["Pizza scream"] = "154157563",
			["Skeleton roar"] = "139143665558961",
		})[arg] or "96867813755421"
		writefile("TheWorstSaves/FTAP/NotifySettings.json", tbl2.Http:JSONEncode({ SoundID = tbl4.SelectedSoundId, SoundVolume = tbl4.SoundsVolume }))
	end,
})
tbl4.SoundID = tbl4.ReadfileSound.SoundID
UI.Sect.NotifysSection:AddButton({
	Name = "Play sound",
	DoubleTap = false,
	Callback = function()
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://" .. tbl4.SelectedSoundId
		sound.Parent = localPlayer:FindFirstChild("Backpack") or localPlayer
		sound.Volume = tonumber(tbl4.SoundsVolume)
		sound:Play()
		task.delay(5, function()
			sound:Destroy()
		end)
	end,
})
UI.Sect.NotifysSection:AddSlider({
	Name = "Sounds volume",
	Default = tbl4.SoundsVolume,
	Min = 0,
	Max = 10,
	Increment = 0.1,
	ValueName = "Volume",
	Callback = function(soundsVolume)
		tbl4.SoundsVolume = soundsVolume
	end,
	InputEndedCallback = function()
		writefile("TheWorstSaves/FTAP/NotifySettings.json", tbl2.Http:JSONEncode({ SoundID = tbl4.SelectedSoundId, SoundVolume = tbl4.SoundsVolume }))
	end,
})
UI.Sect.NotifysSection:AddToggle({
	Name = "Disable all notifications",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "DisableNotificationToggle",
	Callback = function(disableAllNotificationsEn)
		tbl7.DisableAllNotificationsEn = disableAllNotificationsEn
		UI.Orion:SetNotifyingState({ Enabled = not tbl7.DisableAllNotificationsEn, Printing = true })
	end,
})
UI.Sect.NotifysSection:AddToggle({
	Name = "Kick notify",
	Default = true,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "KickNotifyToggle",
	Callback = function(kickNotifyEn)
		tbl7.KickNotifyEn = kickNotifyEn
	end,
})
UI.Sect.NotifysSection:AddToggle({
	Name = "Packet lag notify",
	Default = true,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "PacketNotifyToggle",
	Callback = function(packetNotifyEn)
		tbl7.PacketNotifyEn = packetNotifyEn
	end,
})
UI.Sect.NotifysSection:AddToggle({
	Name = "High ping notify",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "PingNotifyToggle",
	Callback = function(pingNotifyEn)
		tbl7.PingNotifyEn = pingNotifyEn
	end,
})
UI.Sect.NotifysSection:AddSlider({
	Name = "Ping limit warning",
	Min = 200,
	Max = 1000,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 10,
	Default = tbl4.LimitPing,
	Flag = "MaxPingSlider",
	Callback = function(limitPing)
		tbl4.LimitPing = limitPing
	end,
})
UI.Sect.NotifysSection:AddSlider({
	Name = "Ping/packet notification delay",
	Min = 3,
	Max = 20,
	Default = 10,
	Color = Color3.fromRGB(70, 70, 70),
	ValueName = "",
	Increment = 1,
	Default = tbl4.PingNotifyDelay,
	Flag = "PingNotifyDelaySlider",
	Callback = function(pingNotifyDelay)
		tbl4.PingNotifyDelay = pingNotifyDelay
	end,
})
UI.Tabs.ConfigTab = UI.Window:MakeTab({ Name = "Config", Icon = "settings" })
UI.Sect.NewUISection = UI.Tabs.ConfigTab:AddSection({ Name = "UI Functions" })
UI.Sect.NewUISection:AddToggle({
	Name = "Auto Unlock Mouse",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "AutoUnlockMouseToggle",
	Callback = function(autoUnlockMouse)
		tbl7.AutoUnlockMouse = autoUnlockMouse
		tbl8.RemoveConnection("AutoUnlockMouseConn")
		tbl8.RemoveConnection("UnlockMouseConn2")
		if not tbl7.AutoUnlockMouse then
			return
		end
		local flag = true
		tbl8.AddConnection("UnlockMouseConn2", tbl2.RunS.RenderStepped, function()
			tbl2.UIS.MouseBehavior = Enum.MouseBehavior.Default
			tbl2.UIS.MouseIconEnabled = true
		end)
		tbl8.AddConnection("AutoUnlockMouseConn", tbl2.UIS.InputBegan, function(arg)
			if arg.KeyCode == Enum.KeyCode.Tab and not tbl2.UIS:GetFocusedTextBox() then
				flag = not flag
				if flag then
					tbl8.AddConnection("UnlockMouseConn2", tbl2.RunS.RenderStepped, function()
						tbl2.UIS.MouseBehavior = Enum.MouseBehavior.Default
						tbl2.UIS.MouseIconEnabled = true
					end)
				else
					tbl8.RemoveConnection("UnlockMouseConn2")
					tbl2.UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
					tbl2.UIS.MouseIconEnabled = false
				end
			end
		end)
	end,
})
UI.Sect.NewUISection:AddToggle({
	Name = "Toggle All UIs With Main",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "ToggleAllUIsWithMainToggle",
	Callback = function(toggleAllUIEn)
		tbl7.ToggleAllUIEn = toggleAllUIEn
		if tbl7.ToggleAllUIEn then
			tbl8.AddConnection("MainVisibilityConn", tbl2.CoreGui.BetterOrion.MainWindow:GetPropertyChangedSignal("Visible"), function()
				IsVisible = not IsVisible
				local visible = tbl2.CoreGui.BetterOrion.MainWindow.Visible
				tbl2.CoreGui:WaitForChild("TheWorstUI-Teleport", 5):WaitForChild("MainWindow", 5).Visible = visible
				tbl2.CoreGui:WaitForChild("TheWorstUI-Join-Leave", 5):WaitForChild("MainWindow", 5).Visible = tbl2.CoreGui.BetterOrion.MainWindow.Visible
			end)
		else
			tbl8.RemoveConnection("MainVisibilityConn")
		end
	end,
})
UI.Sect.NewUISection:AddToggle({
	Name = "Enable watermark",
	Default = false,
	Color = Color3.fromRGB(40, 40, 40),
	Flag = "WatermarkToggle",
	Callback = function(arg)
		UI.Window:SetWatermarkVisibility(arg)
	end,
})
UI.Orion:SetConfigTab("Config")
UI.Tabs.PluginsTab = UI.Window:MakeTab({ Name = "Plugins", Icon = "upload" })
UI.Sect.PluginConfdigSection = UI.Tabs.PluginsTab:AddSection({ Name = "Plugins", Side = "Left" })
tbl4.SelectedConfig = ""
UI.Sect.PluginConfdigSection:AddDropdown({
	Name = "Plugins List",
	Options = tbl8.GetConfigs("Plugin"),
	Default = "",
	Flag = "PluginDropdown",
	Callback = function(selectedConfig)
		tbl4.SelectedConfig = selectedConfig
	end,
})
UI.Sect.PluginConfdigSection:AddTextbox({
	Name = "Plugin Name",
	Default = "",
	TextDisappear = false,
	Flag = "PluginNameTextbox",
	Callback = function(arg)
		if not CheckSymbol(arg) then
			return
		end
		tbl4.SelectedConfig = arg:gsub(" ", "_")
	end,
})
UI.Sect.PluginConfdigSection:AddButton({
	Name = "Load Plugin",
	Callback = function()
		tbl8.LoadConfig(tbl4.SelectedConfig, "Plugin")
	end,
})
UI.Sect.PluginConfdigSection:AddButton({
	Name = "Delete Plugin",
	DoubleTap = true,
	TapDelay = 0.8,
	Callback = function()
		tbl8.DeletePlugin(tbl4.SelectedConfig)
	end,
})
UI.Sect.PluginConfdigSection:AddButton({
	Name = "Autoload Plugin",
	Callback = function()
		tbl8.MakePluginAutoload(tbl4.SelectedConfig, true)
	end,
})
UI.Sect.PluginConfdigSection:AddButton({
	Name = "Remove Autoload",
	Callback = function()
		tbl8.MakePluginAutoload(tbl4.SelectedConfig, false)
	end,
})
UI.Sect.PluginConfdigSection:AddButton({
	Name = "Refresh Plugins List",
	Callback = function()
		UI.Orion.Flags.PluginDropdown:Refresh(tbl8.GetConfigs("Plugin"), true)
	end,
})
print(tbl.TheWorstPrints[6])
tbl8.AddConnection("PlayerAddedConn", tbl2.Players.PlayerAdded, function(arg)
	tbl4.PlayersESP[#tbl4.PlayersESP + 1] = arg
	tbl4.PlayingPlayers = tbl4.PlayingPlayers + 1
	UI.Elm.AllPlayersLabel:Set("Playing people: " .. tostring(tbl4.PlayingPlayers))
	UI.Elm.BlobmanListDropdown:Refresh(tbl8.UpdatePlayersList(), true)
	UI.Elm.TargetListDropdown:Refresh(tbl8.UpdatePlayersList(), true)
	task.spawn(function()
		tbl8.AddConnection(arg.Name .. "ToysChildAddedConn", workspace:WaitForChild(arg.Name .. "SpawnedInToys").ChildAdded, function(adornee)
			if tbl7.ESPStickyEn and adornee:IsA("Model") and (adornee.Name:match("Tool") or adornee.Name:match("Ninja")) then
				local stickyPart = adornee:WaitForChild("StickyPart", 3)
				if stickyPart then
					tbl4.StickyParts[#tbl4.StickyParts + 1] = stickyPart
					local highlight = Instance.new("Highlight")
					highlight.Adornee = adornee
					highlight.Parent = stickyPart
					highlight.OutlineColor = tbl4.ESPStickyColorOutline
					highlight.FillColor = tbl4.ESPStickyColorFill
					highlight.OutlineTransparency = tbl4.ESPStickyTransparencyOutline
					highlight.FillTransparency = tbl4.ESPStickyTransparencyFill
					highlight.Name = "StickyEspHighlight"
				end
			end
		end)
	end)
	tbl8.AddConnection(arg.Name .. "CharacterAddedConn", arg.CharacterAdded, function(arg2)
		task.spawn(function()
			task.wait(0.1)
			if not tbl7.ESPPlayersEn then
				return
			end
			tbl4.PlayersESP[#tbl4.PlayersESP + 1] = arg
			tbl8.CreateESP(arg, string.format("%s (%s)", arg.DisplayName, arg.Name))
			if arg2 and tbl8.GetHum(arg2) then
				tbl8.GetHum(arg2).DisplayDistanceType = "None"
			end
		end)
		task.wait(0.45)
		tbl8.AddConnection(arg.Name .. "PCLDAddedConn", workspace.ChildAdded, function(arg3)
			if arg3.Name ~= "PlayerCharacterLocationDetector" then
				return
			end
			arg3.Name = string.format("%s (%s) PCLD", arg.DisplayName, arg.Name)
			tbl8.RemoveConnection(arg.Name .. "PCLDAddedConn")
		end)
	end)
	local selectedPlayer = tbl4.SelectedPlayer
	if table.find(tbl4.BlobmanPlayers, arg.Name) or table.find(tbl4.TargetPlayers, arg.Name) or selectedPlayer and arg.Name == selectedPlayer:split(" ")[1] then
		tbl.TheWorstULogger.Window:CreateLabel(arg.DisplayName .. " <font color=\"rgb(111, 252, 46)\"><b>joined</b></font>")
		tbl.TheWorstULogger.Window:ScrollToBottom()
	end
end)
tbl8.AddConnection("PlayerRemovingConn", tbl2.Players.PlayerRemoving, function(arg)
	tbl4.PlayingPlayers = tbl4.PlayingPlayers - 1
	UI.Elm.BlobmanListDropdown:Refresh(tbl8.UpdatePlayersList(), true)
	UI.Elm.TargetListDropdown:Refresh(tbl8.UpdatePlayersList(), true)
	tbl8.RemoveConnection(arg.Name .. "CharacterAddedConn")
	local selectedPlayer = tbl4.SelectedPlayer
	if table.find(tbl4.BlobmanPlayers, arg.Name) or table.find(tbl4.TargetPlayers, arg.Name) or selectedPlayer and arg.Name == selectedPlayer:split(" ")[1] then
		tbl.TheWorstULogger.Window:CreateLabel(arg.DisplayName .. " <font color=\"rgb(39, 78, 250)\"><b>left</b></font>")
		tbl.TheWorstULogger.Window:ScrollToBottom()
	end
	for k, v in tbl4.TWUsersList, nil, nil do
		if v == arg.Name .. " | Premium" or v == arg.Name .. " | Free" then
			table.remove(tbl4.TWUsersList, k)
			UI.Elm.UsersDropdown:Refresh(tbl8.UpdateList(tbl4.TWUsersList), true)
		end
	end
end)
tbl4.LastKickNotify = tick()
tbl8.AddConnection("WorkspaceChildAddedConn", workspace.ChildAdded, function(parent)
	if parent.Name == "GrabParts" then
		local v = tbl8.FindWaitChild(parent, "GrabPart", 5)
		local v2 = tbl8.FindWaitChild(parent, "DragPart", 5)
		local v3 = v and tbl8.FindWaitChild(v, "WeldConstraint", 5)
		if tbl7.SuperLineStrengthEn then
			if not v3 then
				return
			end
			local linearVelocity = Instance.new("LinearVelocity", v3.Part1)
			tbl8.AddConnection("SuperStrengthParentChangedConn", parent:GetPropertyChangedSignal("Parent"), function()
				if parent.Parent then
					return
				end
				local uis = tbl2.UIS
				local mouse2 = tbl3.Mouse2
				if uis:GetLastInputType() == mouse2 then
					linearVelocity.MaxForce = tbl4.Inf
					linearVelocity.VectorVelocity = tbl5.Cam.CFrame.LookVector * UI.Elm.StrengthSlider.Value
					linearVelocity.Attachment0 = v3.Part1:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", v3.Part1)
					task.delay(0.1, function()
						linearVelocity:Destroy()
					end)
				else
					linearVelocity:Destroy()
				end
				tbl8.RemoveConnection("SuperStrengthParentChangedConn")
			end)
		end
		if tbl7.InfLineEn then
			local clone = v2 and v2:Clone()
			clone.Name = "DragPart1"
			clone.AlignPosition.Attachment1 = clone.DragAttach
			clone.Parent = parent
			clone.AlignOrientation.Enabled = false
			v2.AlignPosition.Enabled = false
			tbl4.LineDistance = tbl8.GetMagnitude(clone, tbl5.Cam.CFrame)
			task.spawn(function()
				while parent.Parent do
					clone.Position = tbl5.Cam.CFrame.Position + tbl5.Cam.CFrame.LookVector * tbl4.LineDistance
					if tbl7.MasslessGrabEn then
						clone.AlignOrientation.Responsiveness = 2000
						clone.AlignOrientation.MaxTorque = tbl4.Inf
						clone.AlignPosition.MaxAxesForce = tbl4.VectorInf
						clone.AlignPosition.MaxForce = tbl4.Inf
						clone.AlignPosition.Responsiveness = 2000
					end
					if tbl7.OpenGrabEn then
						v2.AlignOrientation.MaxTorque = 0
					end
					tbl2.RunS.Heartbeat:Wait()
				end
				tbl4.LineDistance = 0
			end)
		else
			while parent and parent.Parent and tbl7.MasslessGrabEn or tbl7.OpenGrabEn do
				if tbl7.MasslessGrabEn then
					task.spawn(function()
						while parent and parent.Parent and v2 do
							v2.AlignOrientation.Responsiveness = 2000
							v2.AlignOrientation.MaxTorque = tbl4.Inf
							v2.AlignPosition.MaxAxesForce = tbl4.VectorInf
							v2.AlignPosition.MaxForce = tbl4.Inf
							v2.AlignPosition.Responsiveness = 2000
							task.wait(0.1)
						end
					end)
				end
				if tbl7.OpenGrabEn then
					task.spawn(function()
						while parent and parent.Parent and v2 do
							v2.AlignOrientation.MaxTorque = 0
							task.wait(0.1)
						end
					end)
				end
				task.wait()
			end
		end
	end
	if parent.Name == "PlayerCharacterLocationDetector" or parent.Name:match("PCLD") then
		local n = #tbl4.UnusedPCLDS + 1
		tbl4.UnusedPCLDS[n] = parent
		tbl8.AddConnection("PCLDDestroyed", parent.AncestryChanged, function(arg, arg2)
			if arg2 then
				return
			end
			tbl4.UnusedPCLDS[n] = nil
			tbl8.RemoveConnection("PCLDDestroyed")
		end)
		if tbl7.PCLDEspEn then
			task.wait(0.1)
			local boxHandleAdornment = Instance.new("BoxHandleAdornment")
			boxHandleAdornment.Name = "ESP"
			boxHandleAdornment.Adornee = parent
			boxHandleAdornment.AlwaysOnTop = true
			boxHandleAdornment.Size = parent.Size
			boxHandleAdornment.Transparency = tbl4.ESPPCLDTransparency
			boxHandleAdornment.Color3 = tbl4.ESPPCLDColor
			boxHandleAdornment.Parent = parent
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Name = "ESPGui"
			billboardGui.Adornee = parent
			billboardGui.Size = UDim2.new(0, 100, 0, 25)
			billboardGui.StudsOffset = Vector3.new(0, -1, 0)
			billboardGui.AlwaysOnTop = true
			billboardGui.Parent = parent
			billboardGui.MaxDistance = 70
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "ESPName"
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = parent.Name
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
			textLabel.TextStrokeTransparency = 0.5
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextSize = 8
			textLabel.Parent = billboardGui
		end
	end
	if tbl5.Root and parent:IsA("Part") and tbl8.GetMagnitude(parent, tbl5.Root) <= 18 then
		for _, child in pairs(tbl5.Char:GetChildren()) do
			if child:IsA("BasePart") then
				child.Anchored = true
			end
		end
		while localPlayer.IsHeld.Value do
			task.wait()
		end
		for _, child in pairs(tbl5.Char:GetChildren()) do
			if child:IsA("BasePart") then
				child.Anchored = false
			end
		end
	end
	if parent.Name == "BlackHoleKick" then
		UI.Elm.BlobmanKicksLabel:Set("Kicked people: " .. tostring(tbl4.Kicks))
		if tbl7.BlackholeTracerEn then
			task.spawn(function()
				local hole = parent:WaitForChild("Hole", 3)
				if not hole then
					return
				end
				tbl4.TrueBlackholes = tbl4.TrueBlackholes or {}
				table.insert(tbl4.TrueBlackholes, parent)
				if not tbl7.BlackholeTracerEn then
					return
				end
				local attachment = Instance.new("Attachment", hole)
				attachment.Position = Vector3.zero
				local attachment2 = Instance.new("Attachment", tbl5.Root)
				attachment2.Position = Vector3.zero
				local beam = Instance.new("Beam", workspace)
				beam.Attachment0 = attachment
				beam.Attachment1 = attachment2
				beam.Width0 = 0.3
				beam.Width1 = 0.3
				beam.Color = ColorSequence.new(tbl4.TracerColor)
				beam.Transparency = NumberSequence.new(0)
				parent.AncestryChanged:Connect(function(child, parent2)
					if not parent2 then
						beam:Destroy()
						attachment:Destroy()
						attachment2:Destroy()
					end
				end)
			end)
		end
		if tbl7.CustomBlackholeEn then
			task.spawn(function()
				local hole = parent:WaitForChild("Hole")
				hole.Transparency = 0.7
				local billboardGui = hole:WaitForChild("BillboardGui", 5)
				local small = billboardGui:WaitForChild("Small", 5)
				local large = billboardGui:WaitForChild("Large", 5)
				small.BackgroundTransparency = 1
				small.ImageColor3 = Color3.fromRGB(255, 255, 255)
				small.Size = UDim2.new(0.5, 0, 0.5, 0)
				large.BackgroundTransparency = 1
				large.ImageColor3 = Color3.fromRGB(255, 255, 255)
				large.Size = UDim2.new(0.5, 0, 0.5, 0)
				local blackholeAsset = tbl4.BlackholeAsset
				local image = blackholeAsset or small.Image
				local image2 = blackholeAsset or large.Image
				small.Image = image
				large.Image = image2
			end)
		end
		if not tbl7.KickNotifyEn then
			return
		end
		while true do
			local lastKickNotify = tbl4.LastKickNotify
			if tick() - lastKickNotify <= 0.05 then
				task.wait()
			else
				break
			end
		end
		tbl4.LastKickNotify = tick()
		tbl4.Kicks = tbl4.Kicks + 1
		local v = tbl8.GetKickingPlayer(parent:WaitForChild("Hole", 5), parent:WaitForChild("Hole", 5).CFrame, 2)
		if v then
			local selectedPlayer = tbl4.SelectedPlayer
			if table.find(tbl4.BlobmanPlayers, v.Name) or table.find(tbl4.TargetPlayers, v.Name) or selectedPlayer and v.Name == selectedPlayer:split(" ")[1] then
				tbl.TheWorstULogger.Window:CreateLabel(v.DisplayName .. " <font color=\"rgb(255, 80, 0)\"><b>kicked</b></font>")
				tbl.TheWorstULogger.Window:ScrollToBottom()
			end
			local v2 = tbl8.GetChar(v)
			v2 = v2 and tbl8.GetRoot(v2)
			tbl8.Notify("Kicked Player " .. tbl4.Kicks, string.format("%s (%s) on position (%s)", v.DisplayName, v.Name, v2 ~= nil and tostring(Vector3.new(math.round(v2.Position.X), math.round(v2.Position.Y), math.round(v2.Position.Z))) or "Unknown"))
		else
			tbl8.Notify("Kicked Player " .. tbl4.Kicks, "Unknown")
		end
	end
end)
tbl8.AddConnection("MyToysChildAddedConn", tbl5.MyToys.ChildAdded, function(arg)
	tbl8.SpawnFunctions(arg)
end)
tbl4.ToyDestroyContents = localPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
tbl8.AddConnection("MyToysMenuChildAddedConn", tbl4.ToyDestroyContents.ChildAdded, function(arg)
	local viewItemButton = arg.ViewItemButton
	local antiKickEn = tbl7.AntiKickEn
	if antiKickEn then
		antiKickEn = arg.Name == "ToolPickaxe" or arg.Name == "NinjaShuriken" or arg.Name == "NinjaKatana" or arg.Name == "ToolPencil"
	end
	local visible, text
	if antiKickEn and not tbl4.ToyDestroyContents:FindFirstChild("AntikickToy") then
		arg.Name = "AntikickToy"
		visible = false
		text = "Anti Kick"
	elseif tbl7.AutoRagdollEn and arg.Name == "PalletLightBrown" and not tbl4.ToyDestroyContents:FindFirstChild("RagdollPallet") then
		arg.Name = "RagdollPallet"
		visible = false
		text = "Ragdoll Pallet"
	elseif (tbl7.AutoGucciEn or tbl7.InstaGucciEn) and arg.Name == "CreatureBlobman" and not tbl4.ToyDestroyContents:FindFirstChild("GucciBlobman") then
		arg.Name = "GucciBlobman"
		visible = false
		text = "Gucci Blobman"
	elseif tbl7.HouseRaidEn and arg.Name == "YouDecoy" and not tbl4.ToyDestroyContents:FindFirstChild("RaidDecoy") then
		arg.Name = "RaidDecoy"
		viewItemButton.ViewportFrame.WorldModel:Destroy()
		visible = false
		text = "Raid Houses"
	elseif tbl7.TractorGucciEn and arg.Name == "TractorGreen" and not tbl4.ToyDestroyContents:FindFirstChild("GucciTractor") then
		arg.Name = "GucciTractor"
		visible = false
		text = "Gucci Tractor"
	elseif tbl7.AntiInputLagEn and arg.Name == tbl4.InstrumentName and not tbl4.ToyDestroyContents:FindFirstChild("AntiInputLag") then
		arg.Name = "AntiInputLag"
		visible = false
		text = "Anti Input"
	else
		local flag = tbl7.RagdollPlayerEn and arg.Name == "FoodBanana" and not tbl4.ToyDestroyContents:FindFirstChild("RagdollBanana")
		visible = true
		text = ""
		if flag then
			arg.Name = "RagdollBanana"
			visible = false
			text = "Ragdoll Players"
		end
	end
	viewItemButton.Text = text
	viewItemButton.TextSize = 24
	viewItemButton.LowResImage.Visible = visible
end)
tbl6.ExtendLineEvent.OnClientEvent:Connect(function(arg, arg2)
	if not tbl7.PacketNotifyEn then
		return
	end
	local str = tostring(arg)
	if typeof(arg2) == "string" then
		if arg.Name ~= localPlayer.Name then
			local name = arg.Name
			local v = tbl8.ObfModule.decrypt(arg2:sub(0, 300), name .. tostring(arg.UserId))
			if v:match("TheWorstUserDetectorEzz----Premium") then
				local str2 = arg.Name .. " | Premium"
				if not table.find(tbl4.TWUsersList, str2) and not table.find(tbl4.TWUsersList, arg.Name .. " | Free") then
					table.insert(tbl4.TWUsersList, str2)
					UI.Elm.UsersDropdown:Refresh(tbl8.UpdateList(tbl4.TWUsersList), true)
					tbl6.ExtendLineEvent:FireServer(tbl8.ObfModule.encrypt("TheWorstUserDetectorEzz----Premium", localPlayer.Name .. tostring(localPlayer.UserId)))
				end
			elseif v:match("TheWorstUserDetectorEzz----Free") then
				local str2 = arg.Name .. " | Free"
				if not table.find(tbl4.TWUsersList, str2) and not table.find(tbl4.TWUsersList, arg.Name .. " | Premium") then
					table.insert(tbl4.TWUsersList, str2)
					UI.Elm.UsersDropdown:Refresh(tbl8.UpdateList(tbl4.TWUsersList), true)
					tbl6.ExtendLineEvent:FireServer(tbl8.ObfModule.encrypt("TheWorstUserDetectorEzz----Premium", localPlayer.Name .. tostring(localPlayer.UserId)))
				end
			end
		end
		local v = string.len(arg2)
		if v < 300 then
			return
		end
		if not tbl8.PacketNotifyQueue(str) then
			return
		end
		local notify = tbl8.Notify
		local format = string.format
		local displayName = tbl2.Players:FindFirstChild(str) and tbl2.Players:FindFirstChild(str).DisplayName or str
		local getScriptByString = tbl8.GetScriptByString
		notify("Packet lag detected", format("Source: %s (%s)\nSize: %s mb\nScript: %s", displayName, str, tostring(tbl8.GetSizeMB(v)), getScriptByString(arg2)), 5)
	end
end)
tbl6.CreateLineEvent.OnClientEvent:Connect(function(lineOwner, arg, lineCFrame)
	if lineOwner and lineOwner.Name ~= localPlayer.Name then
		tbl4.LinesPerSec = tbl4.LinesPerSec + 1
		tbl4.LineOwner = lineOwner
		local character = lineOwner.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		if character and lineCFrame ~= nil and typeof(lineCFrame) ~= "Vector3" and lineCFrame.Position then
			if tbl8.GetMagnitude(character, lineCFrame) >= 10000 and tbl7.AutoAntiLagEn then
				if not UI.Elm.AntilagToggle.Value then
					UI.Elm.AntilagToggle:Set(true)
					tbl8.Notify("Line lag detected", string.format("%s (%s) lagged", tbl4.LineOwner.DisplayName, tbl4.LineOwner.Name))
				end
			end
		end
	else
		tbl4.LineCFrame = lineCFrame
	end
	if not tbl7.PacketNotifyEn then
		return
	end
	local name = lineOwner and lineOwner.Name or "Unknown"
	if typeof(arg) == "string" then
		local v = string.len(arg)
		if v < 300 then
			return
		end
		if not tbl8.PacketNotifyQueue(name) then
			return
		end
		tbl8.Notify("Packet lag detected", string.format("Source: %s (%s)\nSize: %s mb\nScript: %s", lineOwner and lineOwner.DisplayName or "Unknown", name, tostring(tbl8.GetSizeMB(v)), tbl8.GetScriptByString(arg)), 5)
	end
end)
tbl6.ExtendLineEvent:FireServer(tbl8.ObfModule.encrypt("TheWorstUserDetectorEzz----Premium", localPlayer.Name .. tostring(localPlayer.UserId)))
task.spawn(function()
	EGE = tbl2.ReplicatedS:WaitForChild("GrabEvents", 9e9):FindFirstChild("EndGrabEarly")
	if EGE then
		local clone = EGE:Clone()
		EGE:Destroy()
		task.wait(0.1)
		clone.Parent = tbl2.ReplicatedS:WaitForChild("GrabEvents", 9e9)
	end
end)
local bindableEvent = Instance.new("BindableEvent")
bindableEvent.Event:Connect(function()
	if tbl5.Hum then
		task.spawn(function()
			local n = tick() + 2
			while tick() < n do
				for i = 1, 2 do
					tbl6.StruggleEvent:FireServer(localPlayer)
				end
				task.wait()
			end
		end)
		tbl6.StruggleEvent:FireServer(localPlayer)
		tbl5.Hum:ChangeState(Enum.HumanoidStateType.Dead)
	end
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", bindableEvent)
task.spawn(function()
	for i = 1, 5 do
		local v = workspace.PlotItems["Plot" .. i]
		tbl8.AddConnection("PlotChildAddedConn", v.ChildAdded, function(adornee)
			if v.Name == tbl8.GetPlot() then
				tbl8.SpawnFunctions(adornee)
			else
				local stickyPart = adornee:WaitForChild("StickyPart", 3)
				if stickyPart then
					tbl4.StickyParts[#tbl4.StickyParts + 1] = stickyPart
					local highlight = Instance.new("Highlight")
					highlight.Adornee = adornee
					highlight.Parent = stickyPart
					highlight.OutlineColor = tbl4.ESPStickyColorOutline
					highlight.FillColor = tbl4.ESPStickyColorFill
					highlight.OutlineTransparency = tbl4.ESPStickyTransparencyOutline
					highlight.FillTransparency = tbl4.ESPStickyTransparencyFill
					highlight.Name = "StickyEspHighlight"
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait(0.1) do
		for _, player in ipairs(tbl2.Players:GetPlayers()) do
			local character = player and player.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not (not character and not humanoidRootPart) then
				for _, v in tbl4.UnusedPCLDS, nil, nil do
					if v.Position ~= Vector3.zero then
						if humanoidRootPart and tbl8.GetMagnitude(humanoidRootPart, v) <= 1 then
							v.Name = string.format("%s (%s) PCLD", player.DisplayName, player.Name)
							task.wait()
						end
					end
				end
				task.wait()
			end
		end
	end
end)
task.spawn(function()
	while task.wait(0.1) do
		for _, v in workspace:GetChildren() do
			local esp = v:FindFirstChild("ESP")
			if esp and v.Position == Vector3.zero then
				esp.Visible = false
			elseif esp then
				esp.Visible = true
			end
			esp = esp and v:FindFirstChild("ESPGui")
			esp = esp and esp:FindFirstChild("ESPName")
			if esp then
				esp.Text = v.Name
			end
			task.wait(0.01)
		end
	end
end)
task.spawn(function()
	for _, v in workspace:GetChildren() do
		if v.Name == "PlayerCharacterLocationDetector" then
			tbl4.UnusedPCLDS[#tbl4.UnusedPCLDS + 1] = v
		end
	end
end)
local dataPing = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
local fps = 0
local n = 0
local now = os.clock()
local now2 = tick()
tbl2.RunS.RenderStepped:Connect(function()
	tbl4.Ping = tonumber(dataPing:GetValueString():match("%d+")) or 0
	fps += 1
	local now3 = tick()
	if now3 - n >= 1 then
		tbl4.FPS = fps
		fps = 0
		n = now3
	end
end)
task.spawn(function()
	while task.wait(0.5) do
		local n2 = os.clock() - now
		local n3 = math.floor(n2 / 3600)
		local n4 = math.floor(n2 % 3600 / 60)
		local n5 = math.floor(n2 % 60)
		local playtime = string.format("%02d:%02d:%02d", n3, n4, n5)
		if UI.Elm.YourServerTime then
			UI.Elm.YourServerTime:Set("Playtime: " .. playtime)
		end
		local flag = tbl7.PingNotifyEn and tbl4.Ping >= tbl4.LimitPing
		if flag then
			local pingNotifyDelay = tbl4.PingNotifyDelay
			flag = tick() - now2 >= pingNotifyDelay
		end
		if flag then
			tbl8.Notify("High ping warning", "Current ping: " .. tostring(tbl4.Ping) .. " ms")
			now2 = tick()
		end
		if UI.Elm.YourPing then
			UI.Elm.YourPing:Set(string.format("FPS: %s\nPing: %s", tbl4.FPS, tbl4.Ping))
		end
	end
end)
task.spawn(function()
	for _, v in tbl2.Players:GetPlayers() do
		if v ~= localPlayer then
			task.spawn(function()
				tbl8.AddConnection(v.Name .. "ToysChildAddedConn", workspace:WaitForChild(v.Name .. "SpawnedInToys").ChildAdded, function(adornee)
					if tbl7.ESPStickyEn and adornee:IsA("Model") and (adornee.Name:match("Tool") or adornee.Name:match("Ninja")) then
						local stickyPart = adornee:WaitForChild("StickyPart", 3)
						if stickyPart then
							tbl4.StickyParts[#tbl4.StickyParts + 1] = stickyPart
							local highlight = Instance.new("Highlight")
							highlight.Adornee = adornee
							highlight.Parent = stickyPart
							highlight.OutlineColor = tbl4.ESPStickyColorOutline
							highlight.FillColor = tbl4.ESPStickyColorFill
							highlight.OutlineTransparency = tbl4.ESPStickyTransparencyOutline
							highlight.FillTransparency = tbl4.ESPStickyTransparencyFill
							highlight.Name = "StickyEspHighlight"
						end
					end
				end)
			end)
			tbl8.AddConnection(v.Name .. "CharacterAddedConn", v.CharacterAdded, function(arg)
				task.spawn(function()
					task.wait(0.1)
					if not tbl7.ESPPlayersEn then
						return
					end
					tbl4.PlayersESP[#tbl4.PlayersESP + 1] = v
					tbl8.CreateESP(v, string.format("%s (%s)", v.DisplayName, v.Name))
					if arg and tbl8.GetHum(arg) then
						tbl8.GetHum(arg).DisplayDistanceType = "None"
					end
				end)
				task.wait(0.45)
				tbl8.AddConnection(v.Name .. "PCLDAddedConn", workspace.ChildAdded, function(arg2)
					if arg2.Name ~= "PlayerCharacterLocationDetector" then
						return
					end
					arg2.Name = string.format("%s (%s) PCLD", v.DisplayName, v.Name)
					tbl8.RemoveConnection(v.Name .. "PCLDAddedConn")
				end)
			end)
		end
	end
end)
task.spawn(function()
	if not getgenv().LoadedTeleporter then
		TeleporterUI = loadstring(game:HttpGet("https://gitlab.com/m1kp0/libraries/raw/main/TheWorstUI.lua"))()
		local v = TeleporterUI:CreateWindow({ Name = "Teleport", SizeX = 150, CanResize = "X" })
		local tbl9 = {
			["Pink House"] = CFrame.new(-491, -7, -166),
			["Green House"] = CFrame.new(-535, -7, 93),
			["Purple House"] = CFrame.new(250, -6, 463),
			["China House"] = CFrame.new(554, 123, -72),
			["Blue House"] = CFrame.new(510, 83, -339),
			Spawn = CFrame.new(0, -7, 0),
		}
		local str = "Purple House"
		local flag = false
		local localPlayer2 = game.Players.LocalPlayer
		local character = nil
		local humanoidRootPart = nil
		local function fn2(arg)
			str = arg
			character = localPlayer2.Character or localPlayer2.CharacterAdded
			humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			humanoidRootPart.CFrame = tbl9[arg]
			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.Velocity = Vector3.zero
					descendant.RotVelocity = Vector3.zero
				end
			end
		end
		for k in tbl9, nil, nil do
			local v2 = nil
			v2 = v:CreateButton({
				Name = k,
				Callback = function()
					fn2(v2.Name)
				end,
			})
		end
		v:CreateToggle({
			Name = "Loop TP",
			Callback = function(arg)
				flag = arg
				while flag and task.wait() do
					fn2(str)
				end
			end,
		})
	end
	getgenv().LoadedTeleporter = true
end)
task.spawn(function()
	if not getgenv().LoadedLogger then
		tbl.TheWorstULogger = loadstring(game:HttpGet("https://gitlab.com/m1kp0/libraries/raw/main/TheWorstUI.lua"))()
		local v = tbl.TheWorstULogger:CreateWindow({ Name = "Join-Leave", SizeX = 300, SizeY = 210 })
		v:CreateLabel("TheWorst UI: Join-Leave-Kick Logger")
		v:ScrollToBottom()
	end
	getgenv().LoadedLogger = true
end)
task.spawn(function()
	UI.Orion:LoadAutoloadConfigs()
	UI.Orion:SaveAndLoadSizes()
	UI.Orion:Init()
end)
print(tbl.TheWorstPrints[7])
task.spawn(function()
	tbl8.LoadAutoloadPlugins()
	getgenv().TheWorstPluginsLoaded = true
	repeat
		task.wait()
	until getgenv().TheWorstPluginsLoaded
	local startTime = tbl.StartTime
	print("TheWorst HvH Loaded: " .. tbl8.Round(tick() - startTime) .. "s")
	local startTime2 = tbl.StartTime
	UI.Orion:MakeNotification({
		Name = "The Worst HvH",
		Content = string.format("Loaded Successfully: %s seconds", tbl8.Round(tick() - startTime2)),
		Time = 5,
		Image = "rbxassetid://76062046097010",
		Sound = "rbxassetid://6647897822",
	})
end)
task.wait(0.1)
getgenv().LoadedTheWorstHvH = true
