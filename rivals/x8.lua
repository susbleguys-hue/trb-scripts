-- X8 Criminality Key System
do
	local X8_API = "https://api.x8stuff.lol"
	-- The API must whitelist this game PlaceId for activation to succeed.
	local X8_GAME_ID = tostring(game.PlaceId)
	local X8_HTTP_SERVICE = game:GetService("HttpService")
	local X8_PLAYERS = game:GetService("Players")
	local X8_LOCAL_PLAYER = X8_PLAYERS.LocalPlayer
	local X8_HTTP = (syn and syn.request) or (http and http.request) or http_request or request
	local X8_KEY_SESSION = nil
	local X8_KEY_OK = true
	local X8_CACHE_FILE = "x8_criminality_key.json"
	local X8_CACHE_TTL = 24 * 60 * 60


	local function x8LoadCachedKey()
		if type(isfile) ~= "function" or type(readfile) ~= "function" then
			return nil
		end

		local ok, raw = pcall(readfile, X8_CACHE_FILE)
		if not ok or type(raw) ~= "string" or raw == "" then
			return nil
		end

		local data
		local decoded = pcall(function()
			data = X8_HTTP_SERVICE:JSONDecode(raw)
		end)

		if not decoded or type(data) ~= "table" or type(data.key) ~= "string" or data.key == "" or tonumber(data.savedAt) == nil then
			return nil
		end

		if os.time() - tonumber(data.savedAt) > X8_CACHE_TTL then
			if type(delfile) == "function" then
				pcall(delfile, X8_CACHE_FILE)
			end
			return nil
		end

		return data.key
	end

	local function x8SaveCachedKey(key)
		if type(writefile) ~= "function" then
			return
		end

		local ok, raw = pcall(function()
			return X8_HTTP_SERVICE:JSONEncode({
				key = key,
				savedAt = os.time(),
			})
		end)

		if ok and type(raw) == "string" then
			pcall(writefile, X8_CACHE_FILE, raw)
		end
	end

	local function x8ClearCachedKey()
		if type(delfile) == "function" then
			pcall(delfile, X8_CACHE_FILE)
		end
	end

	local function x8DeviceId()
		local ok, result = pcall(function()
			return game:GetService("RbxAnalyticsService"):GetClientId()
		end)

		if ok and type(result) == "string" and result ~= "" then
			return result
		end

		local env = type(getgenv) == "function" and getgenv() or _G
		local hwid = type(env.gethwid) == "function" and env.gethwid or nil

		if hwid then
			local ok2, result2 = pcall(hwid)
			if ok2 and type(result2) == "string" and result2 ~= "" then
				return result2
			end
		end

		return string.format(
			"roblox:%s:%s",
			tostring(X8_LOCAL_PLAYER and X8_LOCAL_PLAYER.UserId or "0"),
			X8_GAME_ID
		)
	end

	local function x8Request(path, payload)
		if type(X8_HTTP) ~= "function" then
			return nil, "This executor does not provide an HTTP request function."
		end

		local ok, response = pcall(function()
			return X8_HTTP({
				Url = X8_API .. path,
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
				},
				Body = X8_HTTP_SERVICE:JSONEncode(payload),
			})
		end)

		if not ok or type(response) ~= "table" then
			return nil, "Could not reach the x8 key server."
		end

		local body = response.Body
		if type(body) ~= "string" or body == "" then
			return nil, "The x8 key server returned an empty response."
		end

		local decoded
		local ok2 = pcall(function()
			decoded = X8_HTTP_SERVICE:JSONDecode(body)
		end)

		if not ok2 or type(decoded) ~= "table" then
			return nil, "The x8 key server returned an invalid response."
		end

		return decoded, tonumber(response.StatusCode) or 0
	end

	local function x8GuiParent()
		if type(gethui) == "function" then
			local ok, result = pcall(gethui)
			if ok and typeof(result) == "Instance" then
				return result
			end
		end
		return game:GetService("CoreGui")
	end

	local function x8Prompt()
		local parent = x8GuiParent()
		local old = parent:FindFirstChild("X8CriminalityKeySystem")

		if old then
			old:Destroy()
		end

		local gui = Instance.new("ScreenGui")
		gui.Name = "X8CriminalityKeySystem"
		gui.ResetOnSpawn = false
		gui.IgnoreGuiInset = true
		gui.Parent = parent

		local frame = Instance.new("Frame")
		frame.Size = UDim2.fromOffset(410, 215)
		frame.Position = UDim2.new(0.5, -205, 0.5, -108)
		frame.BackgroundColor3 = Color3.fromRGB(15, 18, 24)
		frame.BorderSizePixel = 0
		frame.Parent = gui
		Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

		local title = Instance.new("TextLabel")
		title.BackgroundTransparency = 1
		title.Size = UDim2.new(1, -32, 0, 34)
		title.Position = UDim2.fromOffset(16, 14)
		title.Font = Enum.Font.GothamBold
		title.TextSize = 22
		title.TextColor3 = Color3.fromRGB(255, 255, 255)
		title.Text = "X8 � Criminality"
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.Parent = frame

		local sub = Instance.new("TextLabel")
		sub.BackgroundTransparency = 1
		sub.Size = UDim2.new(1, -32, 0, 43)
		sub.Position = UDim2.fromOffset(16, 47)
		sub.Font = Enum.Font.Gotham
		sub.TextSize = 13
		sub.TextColor3 = Color3.fromRGB(175, 180, 190)
		sub.Text = "Enter your x8 key to continue. Your key is remembered for 24 hours."
		sub.TextWrapped = true
		sub.TextXAlignment = Enum.TextXAlignment.Left
		sub.Parent = frame

		local box = Instance.new("TextBox")
		box.Size = UDim2.new(1, -32, 0, 40)
		box.Position = UDim2.fromOffset(16, 94)
		box.BackgroundColor3 = Color3.fromRGB(25, 29, 38)
		box.BorderSizePixel = 0
		box.Font = Enum.Font.Code
		box.TextSize = 14
		box.TextColor3 = Color3.fromRGB(245, 245, 245)
		box.PlaceholderColor3 = Color3.fromRGB(105, 110, 120)
		box.PlaceholderText = "Paste your key here"
		box.ClearTextOnFocus = false

		local env = type(getgenv) == "function" and getgenv() or _G
		box.Text = tostring(env.X8CriminalityKey or "")
		box.Parent = frame
		Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)

		local status = Instance.new("TextLabel")
		status.BackgroundTransparency = 1
		status.Size = UDim2.new(1, -152, 0, 34)
		status.Position = UDim2.fromOffset(16, 143)
		status.Font = Enum.Font.Gotham
		status.TextSize = 12
		status.TextColor3 = Color3.fromRGB(255, 120, 120)
		status.TextWrapped = true
		status.TextXAlignment = Enum.TextXAlignment.Left
		status.Text = ""
		status.Parent = frame

		local button = Instance.new("TextButton")
		button.Size = UDim2.fromOffset(120, 38)
		button.Position = UDim2.new(1, -136, 1, -52)
		button.BackgroundColor3 = Color3.fromRGB(124, 58, 237)
		button.BorderSizePixel = 0
		button.Font = Enum.Font.GothamBold
		button.TextSize = 14
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.Text = "Activate"
		button.Parent = frame
		Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

		local closed = false

		local function activate()
			if closed then
				return
			end

			local key = tostring(box.Text or ""):match("^%s*(.-)%s*$")
			if key == "" then
				status.Text = "Enter a key first."
				return
			end

			button.Active = false
			button.AutoButtonColor = false
			button.Text = "Checking..."
			status.Text = ""

			local result = x8Request("/v1/activate", {
				key = key,
				deviceId = x8DeviceId(),
				gameId = X8_GAME_ID,
			})

			if result and result.ok and result.status == "ACTIVE" then
				env.X8CriminalityKey = key
				x8SaveCachedKey(key)
				X8_KEY_SESSION = result.sessionToken or result.token or result.session_token
				X8_KEY_OK = true

				status.TextColor3 = Color3.fromRGB(110, 240, 160)
				status.Text = "Key accepted. Loading..."

				task.wait(0.4)
				closed = true
				gui:Destroy()
				return
			end

			status.TextColor3 = Color3.fromRGB(255, 120, 120)
			status.Text = tostring(result and (result.message or result.code) or "Key server unavailable.")
			button.Active = true
			button.AutoButtonColor = true
			button.Text = "Activate"
		end

		button.MouseButton1Click:Connect(activate)
		box.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				activate()
			end
		end)

		return gui
	end

	local env = type(getgenv) == "function" and getgenv() or _G
	local cachedKey = x8LoadCachedKey()

	if not cachedKey and (type(isfile) ~= "function" or type(readfile) ~= "function") then
		cachedKey = tostring(env.X8CriminalityKey or ""):match("^%s*(.-)%s*$")
	end

	if cachedKey ~= nil and cachedKey ~= "" then
		local result = x8Request("/v1/activate", {
			key = cachedKey,
			deviceId = x8DeviceId(),
			gameId = X8_GAME_ID,
		})

		if result and result.ok and result.status == "ACTIVE" then
			env.X8CriminalityKey = cachedKey
			x8SaveCachedKey(cachedKey)
			X8_KEY_SESSION = result.sessionToken or result.token or result.session_token
			X8_KEY_OK = true
		else
			x8ClearCachedKey()
			env.X8CriminalityKey = nil
		end
	end

	if not X8_KEY_OK then
		x8Prompt()
		repeat
			task.wait(0.1)
		until X8_KEY_OK or not x8GuiParent():FindFirstChild("X8CriminalityKeySystem")
	end

	if not X8_KEY_OK then
		error("X8 Criminality key activation was cancelled.", 0)
	end

	if X8_KEY_SESSION then
		task.spawn(function()
			while X8_KEY_OK do
				task.wait(300)

				if not X8_KEY_OK then
					break
				end

				local result = x8Request("/v1/validate", {
					sessionToken = X8_KEY_SESSION,
					deviceId = x8DeviceId(),
					gameId = X8_GAME_ID,
				})

				if not (result and result.ok and result.status == "ACTIVE") then
					X8_KEY_OK = false
					x8ClearCachedKey()
					pcall(function()
						env.X8CriminalityKey = nil
						game:GetService("StarterGui"):SetCore("SendNotification", {
							Title = "X8 Key",
							Text = "Your Criminality key is no longer active.",
							Duration = 6,
						})
					end)
				end
			end
		end)
	end
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

if getgc then
    local patched = 0
    local required = 1

    local function tryPatch()
        patched = 0
        for _, value in next, getgc(true) do
            if typeof(value) == 'table' then
                if rawget(value, "indexInstance") or rawget(value, "newindexInstance") or rawget(value, "newIndexInstance") then
                    rawset(value, "tvk", { "kick", function() return task.wait(9e9) end })
                    patched += 1
                end
            end
        end
        return patched >= required
    end

    local maxAttempts = 10
    local attempt = 0
    local success = false

    repeat
        attempt += 1
        success = tryPatch()
        if not success then
            task.wait(0.5)
        end
    until success or attempt >= maxAttempts

    if not success then
        -- ? ???????
        task.delay(4, function()
            if UILibNotifications then
                UILibNotifications:Create({ Name = "AC Bypass failed - your executor doesn't support getgc, you may get kicked", LifeTime = 6 })
            end
        end)
    end
end
task.wait(5)

-- Global safety patch for executors with broken/strict folder creation
local old_makefolder = makefolder
getgenv().makefolder = function(path)
    pcall(old_makefolder, path)
end

local old_listfiles = listfiles
getgenv().listfiles = function(path)
    local success, files = pcall(old_listfiles, path)
    if success then return files end
    return {}
end


-- Library initialization
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

-- Prevent managers from crashing on auto-folder creation during load
local old_isfolder = isfolder
getgenv().isfolder = function(path)
    if path:find("LinoriaLibSettings") then return true end
    return old_isfolder(path)
end

local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

-- Restore isfolder environment
getgenv().isfolder = old_isfolder








local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Unloaded = false

local Window = Library:CreateWindow({
    Title = 'x8',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    Movement = Window:AddTab('Movement'),
    Misc = Window:AddTab('Misc'),
    Settings = Window:AddTab('Settings')
}

local AimbotBox = Tabs.Combat:AddLeftGroupbox('Aimbot')
AimbotBox:AddToggle('Aimbot', { Text = 'Enable Aimbot', Default = false }):AddKeyPicker('AimbotKey', { Default = 'MB2', SyncToggleState = false, Mode = 'Hold', Text = 'Aimbot Key' })
AimbotBox:AddDropdown('AimMethod', { Values = { 'Camera', 'Mouse' }, Default = 1, Multi = false, Text = 'Aim Method' })
AimbotBox:AddSlider('AimSmoothness', { Text = 'Smoothness', Default = 5, Min = 0, Max = 100, Rounding = 0 })
AimbotBox:AddSlider('AimFOVRadius', { Text = 'FOV Radius', Default = 100, Min = 10, Max = 600, Rounding = 0 })
AimbotBox:AddToggle('AimUseFOV', { Text = 'Use FOV', Default = false })
AimbotBox:AddToggle('AimDrawFOV', { Text = 'Draw FOV', Default = false }):AddColorPicker('AimFOVColor', { Default = Color3.new(1, 1, 1) })
AimbotBox:AddToggle('AimCheckTeam', { Text = 'Check Team', Default = false })
AimbotBox:AddToggle('AimCheckDowned', { Text = 'Check Downed', Default = true })
AimbotBox:AddDropdown('AimPart', { Values = { 'Head', 'Torso', 'Closest' }, Default = 1, Multi = false, Text = 'Aim Part' })

local SilentAimBox = Tabs.Combat:AddLeftGroupbox('Silent Aim')
SilentAimBox:AddToggle('SilentAim', { Text = 'Enable Silent Aim', Default = false }):AddKeyPicker('SilentAimKey', { Default = 'None', SyncToggleState = true, Mode = 'Hold', Text = 'Silent Aim' })
SilentAimBox:AddToggle('SilentAimDrawCircle', { Text = 'Draw Circle', Default = false }):AddColorPicker('SilentAimDrawColor', { Default = Color3.fromRGB(255, 0, 0) })
SilentAimBox:AddSlider('SilentAimFOV', { Text = 'FOV', Default = 50, Min = 10, Max = 150, Rounding = 0 })
SilentAimBox:AddDropdown('SilentAimTargetPart', { Values = {'Closest', 'Random', 'Head', 'Torso', 'Left Arm', 'Right Arm', 'Left Leg', 'Right Leg'}, Default = 3, Multi = false, Text = 'Hit Part' })
SilentAimBox:AddToggle('SilentAimUseHitChance', { Text = 'HitChance', Default = false })
SilentAimBox:AddSlider('SilentAimHitChance', { Text = 'HitChance %', Default = 80, Min = 0, Max = 100, Rounding = 0 })
SilentAimBox:AddToggle('SilentAimCheckWall', { Text = 'Check Wall', Default = false })
SilentAimBox:AddToggle('SilentAimCheckTeam', { Text = 'Check Team', Default = false })

local RagebotBox = Tabs.Combat:AddRightGroupbox('Ragebot')
RagebotBox:AddToggle('Ragebot', { Text = 'Enable Ragebot', Default = false }):AddKeyPicker('RagebotKey', { Default = 'None', SyncToggleState = true, Mode = 'Hold', Text = 'Ragebot' })
RagebotBox:AddToggle('RagebotDownedCheck', { Text = 'Downed Check', Default = true })
RagebotBox:AddToggle('RagebotCheckTeam', { Text = 'Check Team', Default = false })
RagebotBox:AddSlider('RagebotFireRate', { Text = 'Fire Rate (s)', Default = 0.2, Min = 0.05, Max = 0.5, Rounding = 2 })
local AuraBox = Tabs.Combat:AddRightGroupbox('Auras')
AuraBox:AddToggle('MeleeAura', { Text = 'Enable Melee Aura', Default = false })
AuraBox:AddToggle('MeleeAuraAnim', { Text = 'Show Melee Animation', Default = true })
AuraBox:AddSlider('MeleeDistance', { Text = 'Melee Distance', Default = 15, Min = 1, Max = 25, Rounding = 0 })
AuraBox:AddDropdown('MeleeTargetPart', { Values = { 'Head', 'Torso', 'Left Arm', 'Right Arm', 'Left Leg', 'Right Leg' }, Default = 1, Multi = false, Text = 'Melee Hit Part' })
AuraBox:AddToggle('PepperAura', { Text = 'Pepper Spray Aura', Default = false })
AuraBox:AddSlider('PepperDistance', { Text = 'Pepper Distance', Default = 15, Min = 1, Max = 25, Rounding = 0 })
AuraBox:AddToggle('InfinitePepper', { Text = 'Infinite Pepper Spray', Default = false })

local BodyModBox = Tabs.Misc:AddRightGroupbox('Body Mod')
BodyModBox:AddToggle('BodyMod', { Text = 'Enable Body Mod', Default = false })
BodyModBox:AddSlider('HeadAngle', { Text = 'Head Angle', Default = 0, Min = -180, Max = 180, Rounding = 0 })
BodyModBox:AddSlider('HeadPos', { Text = 'Head Offset Height', Default = 0, Min = -3, Max = 3, Rounding = 1 })
BodyModBox:AddSlider('ArmAngle', { Text = 'Arm Angle', Default = 0, Min = -180, Max = 180, Rounding = 0 })
BodyModBox:AddSlider('ArmPos', { Text = 'Arm Offset Height', Default = 0, Min = -3, Max = 3, Rounding = 1 })
BodyModBox:AddSlider('LegAngle', { Text = 'Leg Angle', Default = 0, Min = -180, Max = 180, Rounding = 0 })
BodyModBox:AddSlider('LegPos', { Text = 'Leg Offset Height', Default = 0, Min = -3, Max = 3, Rounding = 1 })

local ProjectileBox = Tabs.Misc:AddRightGroupbox('Projectiles')
ProjectileBox:AddToggle('ProjControl', { Text = 'Enable Control', Default = false }):AddKeyPicker('ProjControlKey', { Default = 'None', SyncToggleState = true, Mode = 'Toggle', Text = 'Control Key' })
ProjectileBox:AddDropdown('ProjType', { Values = { 'C4', 'RPG', 'Both' }, Default = 1, Multi = false, Text = 'Type' })
ProjectileBox:AddSlider('ProjSpeed', { Text = 'Speed', Default = 200, Min = 10, Max = 500, Rounding = 0 })

local TriggerBotBox = Tabs.Combat:AddLeftGroupbox('Triggerbot')
TriggerBotBox:AddToggle('Triggerbot', { Text = 'Enable Triggerbot', Default = false })
TriggerBotBox:AddSlider('TriggerDelay', { Text = 'Trigger Delay', Default = 50, Min = 0, Max = 500, Rounding = 0 })
TriggerBotBox:AddToggle('TriggerWallCheck', { Text = 'Wall Check', Default = true })

local GunModsBox = Tabs.Combat:AddLeftGroupbox('Gun Mods')
GunModsBox:AddToggle('NoRecoil', { Text = 'No Recoil', Default = false })
GunModsBox:AddToggle('InstantEquip', { Text = 'Instant Equip', Default = false })
GunModsBox:AddToggle('InstantReload', { Text = 'Instant Reload', Default = false })
GunModsBox:AddToggle('AutoMode', { Text = 'Auto Fire Mode', Default = false })
GunModsBox:AddToggle('ModifySpread', { Text = 'Modify Spread', Default = false })
GunModsBox:AddSlider('SpreadAmount', { Text = 'Spread Amount', Default = 0, Min = 0, Max = 10, Rounding = 1 })

local ESPBox = Tabs.Visuals:AddLeftGroupbox('ESP Settings')
ESPBox:AddToggle('ESPMain', { Text = 'Enable ESP', Default = false })
ESPBox:AddToggle('ESPBoxes', { Text = 'Boxes', Default = false }):AddColorPicker('ESPBoxColor', { Default = Color3.new(1, 1, 1) })
ESPBox:AddToggle('ESPNames', { Text = 'Names', Default = false }):AddColorPicker('ESPNameColor', { Default = Color3.new(1, 1, 1) })
ESPBox:AddToggle('ESPDistance', { Text = 'Distance', Default = false }):AddColorPicker('ESPDistColor', { Default = Color3.new(0.8, 0.8, 0.8) })
ESPBox:AddToggle('ESPHealth', { Text = 'Health Bar', Default = false })
ESPBox:AddToggle('ESPTracers', { Text = 'Player Tracers', Default = false }):AddColorPicker('ESPTracerColor', { Default = Color3.new(1, 1, 1) })
ESPBox:AddDropdown('ESPTracerOrigin', { Values = { 'Bottom', 'Center', 'Mouse' }, Default = 1, Multi = false, Text = 'Tracer Origin' })
ESPBox:AddToggle('ESPChams', { Text = 'Chams (Highlight)', Default = false }):AddColorPicker('ESPChamsFill', { Default = Color3.fromRGB(255, 0, 0) })
ESPBox:AddLabel('Chams Outline'):AddColorPicker('ESPChamsOutline', { Default = Color3.fromRGB(255, 255, 255) })
ESPBox:AddToggle('ESPSkeleton', { Text = 'Skeleton', Default = false }):AddColorPicker('ESPSkelColor', { Default = Color3.fromRGB(255, 255, 255) })
ESPBox:AddToggle('ESPTool', { Text = 'Equipped Tool', Default = false }):AddColorPicker('ESPToolColor', { Default = Color3.fromRGB(200, 200, 200) })
ESPBox:AddSlider('ESPMaxDist', { Text = 'Max Render Distance', Default = 1500, Min = 50, Max = 5000, Rounding = 0 })

local VisualsRight = Tabs.Visuals:AddRightGroupbox('World Visuals')
VisualsRight:AddToggle('FOVToggle', { Text = 'Enable Custom FOV', Default = false })
VisualsRight:AddSlider('FOVSlider', { Text = 'Field of View', Default = 70, Min = 10, Max = 120, Rounding = 0 })

VisualsRight:AddDivider()
VisualsRight:AddToggle('AmbianceToggle', { Text = 'Enable Ambiance', Default = false }):AddColorPicker('AmbianceColor', { Default = Color3.fromRGB(170, 85, 255) })
VisualsRight:AddSlider('EnvTime', { Text = 'Time of Day', Default = 12, Min = 0, Max = 24, Rounding = 1 })
VisualsRight:AddSlider('EnvBrightness', { Text = 'Brightness', Default = 2, Min = 0, Max = 10, Rounding = 1 })
VisualsRight:AddToggle('EnvNoFog', { Text = 'No Fog', Default = false })
VisualsRight:AddToggle('BloomToggle', { Text = 'Enable Bloom', Default = false })
VisualsRight:AddSlider('BloomIntensity', { Text = 'Bloom Intensity', Default = 1, Min = 0, Max = 10, Rounding = 1 })
VisualsRight:AddSlider('BloomSize', { Text = 'Bloom Size', Default = 24, Min = 0, Max = 56, Rounding = 0 })
VisualsRight:AddSlider('BloomThreshold', { Text = 'Bloom Threshold', Default = 2, Min = 0, Max = 10, Rounding = 1 })

VisualsRight:AddDivider()
VisualsRight:AddToggle('ViewmodelToggle', { Text = 'Modify Viewmodel & Tools', Default = false }):AddColorPicker('ViewmodelColor', { Default = Color3.fromRGB(170, 85, 255) })
VisualsRight:AddDropdown('ViewmodelMaterial', { Values = { 'ForceField', 'Neon', 'Plastic', 'SmoothPlastic', 'Glass', 'Foil', 'Metal', 'Wood' }, Default = 1, Multi = false, Text = 'Viewmodel Material' })
VisualsRight:AddToggle('PlayerRigToggle', { Text = 'Modify Player Rig', Default = false }):AddColorPicker('PlayerRigColor', { Default = Color3.fromRGB(170, 85, 255) })
VisualsRight:AddDropdown('PlayerRigMaterial', { Values = { 'ForceField', 'Neon', 'Plastic', 'SmoothPlastic', 'Glass', 'Foil', 'Metal', 'Wood' }, Default = 1, Multi = false, Text = 'Player Rig Material' })

VisualsRight:AddDivider()
VisualsRight:AddToggle('Hitlogs', { Text = 'Enable Hitlogs', Default = false })

local WorldESPBox = Tabs.Visuals:AddLeftGroupbox('World ESP')
WorldESPBox:AddToggle('DealerESP', { Text = 'Dealers (Shop)', Default = false }):AddColorPicker('DealerColor', { Default = Color3.fromRGB(255, 0, 255) })
WorldESPBox:AddToggle('CashESP', { Text = 'Dropped Cash', Default = false }):AddColorPicker('CashColor', { Default = Color3.fromRGB(0, 255, 0) })
WorldESPBox:AddToggle('ItemESP', { Text = 'Dropped Items', Default = false }):AddColorPicker('ItemColor', { Default = Color3.fromRGB(0, 255, 255) })
WorldESPBox:AddToggle('AlarmESP', { Text = 'Alarms', Default = false }):AddColorPicker('AlarmColor', { Default = Color3.fromRGB(255, 0, 0) })
WorldESPBox:AddToggle('ATMESP', { Text = 'ATMs', Default = false }):AddColorPicker('ATMColor', { Default = Color3.fromRGB(0, 255, 100) })
WorldESPBox:AddToggle('MysteryESP', { Text = 'Mystery Boxes', Default = false }):AddColorPicker('MysteryColor', { Default = Color3.fromRGB(128, 0, 128) })
WorldESPBox:AddToggle('PileESP', { Text = 'Lootable Piles', Default = false }):AddColorPicker('PileColor', { Default = Color3.fromRGB(128, 128, 128) })

local MovementBox = Tabs.Movement:AddLeftGroupbox('Main')
MovementBox:AddToggle('WalkSpeedToggle', { Text = 'Enable WalkSpeed', Default = false }):AddKeyPicker('WalkSpeedKey', { Default = 'Z', SyncToggleState = false, Mode = 'Toggle', Text = 'WalkSpeed Key' })
MovementBox:AddSlider('WalkSpeed', { Text = 'Speed Amount', Default = 16, Min = 10, Max = 50, Rounding = 0 })
MovementBox:AddToggle('Fly', { Text = 'Enable Fly', Default = false }):AddKeyPicker('FlyKey', { Default = 'X', SyncToggleState = false, Mode = 'Toggle', Text = 'Fly Key' })
MovementBox:AddSlider('FlySpeed', { Text = 'Fly Speed', Default = 50, Min = 1, Max = 150, Rounding = 0 })
MovementBox:AddSlider('JumpCooldown', { Text = 'Jump Cooldown', Default = 0, Min = 0, Max = 1, Rounding = 1 })
MovementBox:AddToggle('InfStamina', { Text = 'Infinite Stamina', Default = false })

local MiscBox = Tabs.Misc:AddLeftGroupbox('Farm')
MiscBox:AddToggle('NoFailLockpick', { Text = 'No Fail Lockpick', Default = false })
MiscBox:AddToggle('FastInteract', { Text = 'Fast Interact', Default = false })
MiscBox:AddToggle('Noclip', { Text = 'Noclip', Default = false }):AddKeyPicker('NoclipKey', { Default = 'E', SyncToggleState = false, Mode = 'Hold', Text = 'Noclip Key' })

local MiscBox2 = Tabs.Misc:AddRightGroupbox('Protection')
MiscBox2:AddToggle('AntiFling', { Text = 'Anti Fling', Default = false })
MiscBox2:AddToggle('AntiFallDamage', { Text = 'Anti Fall Damage', Default = false })
MiscBox2:AddToggle('AntiBreakLimbs', { Text = 'Anti Break Limbs', Default = false })
MiscBox2:AddToggle('AntiFlashbang', { Text = 'Anti Flashbang', Default = false })
MiscBox2:AddToggle('AntiSmoke', { Text = 'Anti Smoke', Default = false })
MiscBox2:AddToggle('AntiBarbwire', { Text = 'Anti Barbwire', Default = false })
MiscBox2:AddToggle('AutoRespawn', { Text = 'Auto Respawn', Default = false })
MiscBox2:AddToggle('ModCheck', { Text = 'Auto-Kick on Mod Join', Default = true })

local SettingsBox = Tabs.Settings:AddLeftGroupbox('Menu')
SettingsBox:AddButton('Unload Script', function() Library:Unload() end)
SettingsBox:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind

-- Save/Theme Manager Setup
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('Cravex')
SaveManager:SetFolder('Cravex/Criminality')

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

SaveManager:LoadAutoloadConfig()

Library:SetWatermarkVisibility(true)
Library.KeybindFrame.Visible = false

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Filled = false
FOVCircle.Transparency = 0.5

local AimbotPressed = false
local AimbotTarget = nil

local ESP_Drawings = {}
local oldAmbient = Lighting.Ambient
local oldOutdoorAmbient = Lighting.OutdoorAmbient
local oldClockTime = Lighting.ClockTime
local oldBrightness = Lighting.Brightness
local oldFogEnd = Lighting.FogEnd
local flyBV, flyBG = nil, nil

local myCharTorso, myCharRArm, myCharLArm, myCharRLeg, myCharLLeg = nil, nil, nil, nil, nil
local origC0s = {}
local bodyModCharSetup = false

local WorldESP_Drawings = {}
local WorldHighlights = {}

local DeathRespawn_Event = ReplicatedStorage:WaitForChild("Events"):WaitForChild("DeathRespawn")

local function CheckForMods()
    if not Toggles.ModCheck or not Toggles.ModCheck.Value then return end
    local GroupId = 4158545 
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            pcall(function()
                if player:GetRankInGroup(GroupId) >= 200 or player:GetRoleInGroup(GroupId):lower():match("mod") or player:GetRoleInGroup(GroupId):lower():match("admin") then
                    Library:Notify("MODERATOR DETECTED: " .. player.Name .. ". Leaving in 3 seconds to prevent ban.", 8)
                    task.wait(3)
                    LocalPlayer:Kick("Safety Kick: Moderator detected (" .. player.Name .. ")")
                end
            end)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if Unloaded then return end
    task.wait(2)
    CheckForMods()
end)

local function AutoRespawn()
    while Toggles.AutoRespawn.Value do
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health <= 0 and not humanoid:GetAttribute("Respawning") then
                humanoid:SetAttribute("Respawning", true)
                DeathRespawn_Event:InvokeServer("KMG4R904")
                task.wait(1)
                if char then
                    humanoid:SetAttribute("Respawning", false)
                end
            end
        end
        task.wait(1)
    end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:SetAttribute("Respawning", false)
    end
    if Toggles.AutoRespawn.Value then
        task.spawn(AutoRespawn)
    end
end)

Toggles.AutoRespawn:OnChanged(function()
    if Toggles.AutoRespawn.Value then
        task.spawn(AutoRespawn)
    end
end)

local function setupBodyMod()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    origC0s = {}
    for _, motor in pairs(char:GetDescendants()) do
        if motor:IsA("Motor6D") then
            if motor.Name == "Neck" or motor.Name:match("Shoulder") or motor.Name:match("Hip") then
                origC0s[motor] = motor.C0
            end
        end
    end
    bodyModCharSetup = true
end

LocalPlayer.CharacterAdded:Connect(function(char)
    bodyModCharSetup = false
end)

local function GetTargetPart(Character, PartString)
    if not Character then return nil end
    if PartString == "Head" then return Character:FindFirstChild("Head") end
    if PartString == "Torso" then return Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso") end
    if PartString == "Left Arm" then return Character:FindFirstChild("Left Arm") or Character:FindFirstChild("LeftLowerArm") end
    if PartString == "Right Arm" then return Character:FindFirstChild("Right Arm") or Character:FindFirstChild("RightLowerArm") end
    if PartString == "Left Leg" then return Character:FindFirstChild("Left Leg") or Character:FindFirstChild("LeftLowerLeg") end
    if PartString == "Right Leg" then return Character:FindFirstChild("Right Leg") or Character:FindFirstChild("RightLowerLeg") end
    return Character:FindFirstChild("HumanoidRootPart")
end

local function GetAimbotTarget()
    local nearestTarget = nil
    local shortestDistance = math.huge
    local mousePos = UserInputService:GetMouseLocation()
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hum = player.Character:FindFirstChild("Humanoid")
            if not hum or hum.Health <= 0 then continue end
            if Toggles.AimCheckTeam.Value and player.Team == LocalPlayer.Team then continue end
            if Toggles.AimCheckDowned.Value and player.Character:GetAttribute("Downed") then continue end
            
            local targetPart = GetTargetPart(player.Character, Options.AimPart.Value)
            if targetPart then
                local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                if onScreen then
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if distance < shortestDistance then
                        if not Toggles.AimUseFOV.Value or distance <= Options.AimFOVRadius.Value then
                            shortestDistance = distance
                            nearestTarget = player
                        end
                    end
                end
            end
        end
    end
    return nearestTarget
end

local ValidSilentTargetParts = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
local silentAimActive = false
local currentSilentTarget = nil
local silentAimTask = nil
local visualizeConnection = nil
local ragebotActive = false
local ragebotTask = nil

local silentAimCircle = Drawing.new("Circle")
silentAimCircle.Visible = false
silentAimCircle.Transparency = 1
silentAimCircle.Thickness = 1.5
silentAimCircle.Filled = false

local silentCircleRender = nil
local function UpdateSilentCircle()
    if silentCircleRender then silentCircleRender:Disconnect(); silentCircleRender = nil end
    if silentAimActive and Toggles.SilentAimDrawCircle and Toggles.SilentAimDrawCircle.Value then
        silentCircleRender = RunService.RenderStepped:Connect(function()
            silentAimCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
            silentAimCircle.Visible = true
            silentAimCircle.Radius = Options.SilentAimFOV.Value
            silentAimCircle.Color = Options.SilentAimDrawColor.Value
        end)
    else
        silentAimCircle.Visible = false
    end
end

local function GetClosestPlayerSilent()
    if not silentAimActive then return nil end
    local closestPlayer = nil
    local minDistance = Options.SilentAimFOV.Value
    local mousePos = UserInputService:GetMouseLocation()
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer or not player.Character or player.Character:FindFirstChildOfClass("ForceField") then continue end
        if Toggles.SilentAimCheckTeam.Value and player.Team == LocalPlayer.Team then continue end
        local targetPart = nil
        local partStr = Options.SilentAimTargetPart.Value
        if partStr == "Closest" then
            local minPartDistance = math.huge
            for _, partName in ipairs(ValidSilentTargetParts) do
                local part = player.Character:FindFirstChild(partName)
                if part then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local distance = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if distance < minPartDistance then
                            minPartDistance = distance
                            targetPart = part
                        end
                    end
                end
            end
        else
            targetPart = partStr == "Random" and player.Character:FindFirstChild(ValidSilentTargetParts[math.random(1, #ValidSilentTargetParts)]) or player.Character:FindFirstChild(partStr or "Head")
        end
        if targetPart then
            if Toggles.SilentAimCheckWall.Value and #Camera:GetPartsObscuringTarget({targetPart.Position}, {Camera, LocalPlayer.Character, player.Character}) > 0 then continue end
            local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            if onScreen and (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude < minDistance then
                minDistance = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                closestPlayer = player
            end
        end
    end
    if closestPlayer and Toggles.SilentAimUseHitChance.Value then
        if math.random(1, 100) > Options.SilentAimHitChance.Value then
            return nil
        end
    end
    return closestPlayer
end

local function GetClosestEnemyRagebot()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return nil end
    local closestEnemy = nil
    local shortestDistance = 100
    for _, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        local forceField = character and character:FindFirstChildOfClass("ForceField")
        if character and rootPart and humanoid and not forceField then
            if (not Toggles.RagebotDownedCheck.Value or humanoid.Health > 15) then
                local distance = (rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance > 100 then continue end
                if Toggles.RagebotCheckTeam.Value and player.Team == LocalPlayer.Team then continue end
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestEnemy = player
                end
            end
        end
    end
    return closestEnemy
end

local function RandomString(length)
    local res = ""
    for i = 1, length do
        res = res .. string.char(math.random(97, 122))
    end
    return res
end

local function PlayHeadshotSound()
    local audio = Instance.new("Sound")
    audio.Parent = game.CoreGui
    audio.SoundId = "rbxassetid://8285324545"
    audio.Volume = 2
    audio:Play()
    game:GetService("Debris"):AddItem(audio, 2)
end

local function Shoot(target)
    if not target or not target.Character then return end
    local head = target.Character:FindFirstChild("Head")
    if not head then return end
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not tool then return end
    local values = tool:FindFirstChild("Values")
    local hitMarker = tool:FindFirstChild("Hitmarker")
    if not values or not hitMarker then return end
    local ammo = values:FindFirstChild("SERVER_Ammo")
    local storedAmmo = values:FindFirstChild("SERVER_StoredAmmo")
    if not ammo or not storedAmmo or ammo.Value <= 0 then return end
    local hitPosition = head.Position
    local hitDirection = (hitPosition - Camera.CFrame.Position).unit
    local randomKey = RandomString(30) .. "0"
    game:GetService("ReplicatedStorage").Events.GNX_S:FireServer(
        tick(), randomKey, tool, "FDS9I83", Camera.CFrame.Position, {hitDirection}, false
    )
    game:GetService("ReplicatedStorage").Events["ZFKLF__H"]:FireServer(
        "\xF0\x9F\xA7\x88", tool, randomKey, 1, head, hitPosition, hitDirection
    )
    ammo.Value = math.max(ammo.Value - 1, 0)
    hitMarker:Fire(head)
    PlayHeadshotSound()
    storedAmmo.Value = values:FindFirstChild("SERVER_StoredAmmo").Value
end

local function RageBotLoop()
    while ragebotActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
        if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
            local target = GetClosestEnemyRagebot()
            if target then
                Shoot(target)
            end
        end
        task.wait(Options.RagebotFireRate and Options.RagebotFireRate.Value or 0.2)
    end
end

local function StartSilentAim()
    silentAimActive = true
    UpdateSilentCircle()
    local VisualizeEvent = ReplicatedStorage:FindFirstChild("Events2") and ReplicatedStorage.Events2:FindFirstChild("Visualize")
    local DamageEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("ZFKLF__H")
    if not VisualizeEvent or not DamageEvent then return end
    silentAimTask = task.spawn(function()
        while silentAimActive do
            currentSilentTarget = GetClosestPlayerSilent()
            RunService.Heartbeat:Wait()
        end
    end)
    visualizeConnection = VisualizeEvent.Event:Connect(function(_, ShotCode, _, Gun, _, StartPos, BulletsPerShot)
        if not silentAimActive or not Gun or not currentSilentTarget or not currentSilentTarget.Character or currentSilentTarget.Character:FindFirstChildOfClass("ForceField") then return end
        local playerTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if not playerTool or Gun ~= playerTool then return end
        

        
        local HitPart = nil
        local partStr = Options.SilentAimTargetPart.Value
        local mousePos = UserInputService:GetMouseLocation()
        if partStr == "Closest" then
            local minPartDistance = math.huge
            for _, partName in ipairs(ValidSilentTargetParts) do
                local part = currentSilentTarget.Character:FindFirstChild(partName)
                if part then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local distance = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if distance < minPartDistance then
                            minPartDistance = distance
                            HitPart = part
                        end
                    end
                end
            end
        else
            HitPart = partStr == "Random" and currentSilentTarget.Character:FindFirstChild(ValidSilentTargetParts[math.random(1, #ValidSilentTargetParts)]) or currentSilentTarget.Character:FindFirstChild(partStr or "Head")
        end
        if not HitPart then return end
        local HitPos = HitPart.Position
        local Bullets = {}
        for i = 1, math.clamp(#BulletsPerShot, 1, 100) do
            table.insert(Bullets, CFrame.new(StartPos, HitPos).LookVector)
        end
        task.wait(0.005)
        for Index, LookVector in ipairs(Bullets) do
            DamageEvent:FireServer("\xF0\x9F\xA7\x88", Gun, ShotCode, Index, HitPart, HitPos, LookVector)
        end
        if Gun:FindFirstChild("Hitmarker") then
            Gun.Hitmarker:Fire(HitPart)
            if HitPart.Name == "Head" then PlayHeadshotSound() end
        end
    end)
end

local function StopSilentAim()
    silentAimActive = false
    currentSilentTarget = nil
    if silentAimTask then pcall(task.cancel, silentAimTask); silentAimTask = nil end
    if visualizeConnection then visualizeConnection:Disconnect(); visualizeConnection = nil end
    UpdateSilentCircle()
end

local function StartRagebot()
    ragebotActive = true
    if not ragebotTask then
        ragebotTask = task.spawn(RageBotLoop)
    end
end

local function StopRagebot()
    ragebotActive = false
    if ragebotTask then pcall(task.cancel, ragebotTask); ragebotTask = nil end
end

Toggles.SilentAim:OnChanged(function()
    if Toggles.SilentAim.Value then StartSilentAim() else StopSilentAim() end
end)

Toggles.Ragebot:OnChanged(function()
    if Toggles.Ragebot.Value then StartRagebot() else StopRagebot() end
end)

local function CalculatePrediction(TargetPart, PredictionEnabled, Amount)
    if not TargetPart then return Vector3.zero end
    if PredictionEnabled and TargetPart.Parent and TargetPart.Parent:FindFirstChild("HumanoidRootPart") then
        local velocity = TargetPart.Parent.HumanoidRootPart.AssemblyLinearVelocity
        return TargetPart.Position + (velocity * Amount)
    end
    return TargetPart.Position
end

local ESP_Highlights = {}
local boneIndices_R6 = {
    {"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"}, {"Torso", "Left Leg"}, {"Torso", "Right Leg"}
}
local boneIndices_R15 = {
    {"Head","UpperTorso"}, {"UpperTorso","LowerTorso"},
    {"UpperTorso","LeftUpperArm"}, {"LeftUpperArm","LeftLowerArm"}, {"LeftLowerArm","LeftHand"},
    {"UpperTorso","RightUpperArm"}, {"RightUpperArm","RightLowerArm"}, {"RightLowerArm","RightHand"},
    {"LowerTorso","LeftUpperLeg"}, {"LeftUpperLeg","LeftLowerLeg"}, {"LeftLowerLeg","LeftFoot"},
    {"LowerTorso","RightUpperLeg"}, {"RightUpperLeg","RightLowerLeg"}, {"RightLowerLeg","RightFoot"}
}

local function CreateESP(Player)
    ESP_Drawings[Player] = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Distance = Drawing.new("Text"),
        HealthBg = Drawing.new("Square"),
        Health = Drawing.new("Square"),
        Tracer = Drawing.new("Line"),
        Tool = Drawing.new("Text"),
        Skeleton = {}
    }
    -- Pre-create up to 15 skeleton lines
    for i = 1, 15 do
        ESP_Drawings[Player].Skeleton[i] = Drawing.new("Line")
        ESP_Drawings[Player].Skeleton[i].Thickness = 1.5
    end
    local esp = ESP_Drawings[Player]
    esp.Box.Thickness = 1.5; esp.Box.Filled = false
    esp.Name.Size = 16; esp.Name.Center = true; esp.Name.Outline = true
    esp.Distance.Size = 14; esp.Distance.Center = true; esp.Distance.Outline = true
    esp.HealthBg.Filled = true; esp.HealthBg.Color = Color3.new(0, 0, 0)
    esp.Health.Filled = true; esp.Health.Color = Color3.new(0, 1, 0)
    esp.Tracer.Thickness = 1.5
    esp.Tool.Size = 14; esp.Tool.Center = true; esp.Tool.Outline = true
end

local function RemoveESP(Player)
    if ESP_Drawings[Player] then
        for k, drawing in pairs(ESP_Drawings[Player]) do 
            if k == "Skeleton" then
                for _, line in ipairs(drawing) do line:Remove() end
            else
                drawing:Remove() 
            end
        end
        ESP_Drawings[Player] = nil
    end
    if ESP_Highlights[Player] then
        ESP_Highlights[Player]:Destroy()
        ESP_Highlights[Player] = nil
    end
end

for _, Player in ipairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer then CreateESP(Player) end
end
Players.PlayerAdded:Connect(function(Player) CreateESP(Player) end)
Players.PlayerRemoving:Connect(RemoveESP)

local function UpdateESP()
    for Player, Drawings in pairs(ESP_Drawings) do
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChild("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        
        if Toggles.ESPMain.Value and Character and Humanoid and RootPart and Humanoid.Health > 0 then
            local RootPos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
            local Dist = (Camera.CFrame.Position - RootPart.Position).Magnitude

            if OnScreen and Dist <= Options.ESPMaxDist.Value then
                local Head = Character:FindFirstChild("Head")
                local HeadPos = Head and Camera:WorldToViewportPoint(Head.Position + Vector3.new(0, 0.5, 0)) or Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2, 0))
                local LegPos = Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0))
                
                local Height = math.abs(HeadPos.Y - LegPos.Y)
                local Width = Height / 2

                if Toggles.ESPBoxes.Value then
                    Drawings.Box.Size = Vector2.new(Width, Height)
                    Drawings.Box.Position = Vector2.new(RootPos.X - Width / 2, HeadPos.Y)
                    Drawings.Box.Color = Options.ESPBoxColor.Value
                    Drawings.Box.Visible = true
                else Drawings.Box.Visible = false end

                if Toggles.ESPNames.Value then
                    Drawings.Name.Text = Player.Name
                    Drawings.Name.Position = Vector2.new(RootPos.X, HeadPos.Y - 20)
                    Drawings.Name.Color = Options.ESPNameColor.Value
                    Drawings.Name.Visible = true
                else Drawings.Name.Visible = false end

                if Toggles.ESPDistance.Value then
                    Drawings.Distance.Text = "[" .. math.floor(Dist) .. "s]"
                    Drawings.Distance.Position = Vector2.new(RootPos.X, LegPos.Y + 5)
                    Drawings.Distance.Color = Options.ESPDistColor.Value
                    Drawings.Distance.Visible = true
                else Drawings.Distance.Visible = false end

                if Toggles.ESPHealth.Value then
                    local HealthScale = Humanoid.Health / Humanoid.MaxHealth
                    Drawings.HealthBg.Size = Vector2.new(4, Height)
                    Drawings.HealthBg.Position = Vector2.new(RootPos.X - Width / 2 - 6, HeadPos.Y)
                    Drawings.HealthBg.Visible = true
                    
                    Drawings.Health.Size = Vector2.new(2, Height * HealthScale)
                    Drawings.Health.Position = Vector2.new(RootPos.X - Width / 2 - 5, HeadPos.Y + (Height - (Height * HealthScale)))
                    Drawings.Health.Color = Color3.new(1 - HealthScale, HealthScale, 0)
                    Drawings.Health.Visible = true
                else
                    Drawings.HealthBg.Visible = false; Drawings.Health.Visible = false
                end

                if Toggles.ESPTracers.Value then
                    local TracerOrigin = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    if Options.ESPTracerOrigin.Value == "Center" then TracerOrigin = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    elseif Options.ESPTracerOrigin.Value == "Mouse" then TracerOrigin = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) end
                    
                    Drawings.Tracer.From = TracerOrigin
                    Drawings.Tracer.To = Vector2.new(RootPos.X, LegPos.Y)
                    Drawings.Tracer.Color = Options.ESPTracerColor.Value
                    Drawings.Tracer.Visible = true
                else Drawings.Tracer.Visible = false end

                local ToolItem = Character:FindFirstChildOfClass("Tool")
                if Toggles.ESPTool.Value and ToolItem then
                    Drawings.Tool.Text = ToolItem.Name
                    Drawings.Tool.Position = Vector2.new(RootPos.X, LegPos.Y + (Toggles.ESPDistance.Value and 20 or 5))
                    Drawings.Tool.Color = Options.ESPToolColor.Value
                    Drawings.Tool.Visible = true
                else Drawings.Tool.Visible = false end

                if Toggles.ESPSkeleton.Value then
                    local isR15 = Character:FindFirstChild("UpperTorso") ~= nil
                    local boneIndices = isR15 and boneIndices_R15 or boneIndices_R6
                    for i = 1, #Drawings.Skeleton do
                        local line = Drawings.Skeleton[i]
                        local pair = boneIndices[i]
                        if pair then
                            local part1 = Character:FindFirstChild(pair[1])
                            local part2 = Character:FindFirstChild(pair[2])
                            if part1 and part2 then
                                local p1, onScreen1 = Camera:WorldToViewportPoint(part1.Position)
                                local p2, onScreen2 = Camera:WorldToViewportPoint(part2.Position)
                                if onScreen1 or onScreen2 then
                                    line.From = Vector2.new(p1.X, p1.Y)
                                    line.To = Vector2.new(p2.X, p2.Y)
                                    line.Color = Options.ESPSkelColor.Value
                                    line.Visible = true
                                else line.Visible = false end
                            else line.Visible = false end
                        else line.Visible = false end
                    end
                else
                    for _, line in ipairs(Drawings.Skeleton) do line.Visible = false end
                end

                if Toggles.ESPChams.Value then
                    if not ESP_Highlights[Player] then
                        local hl = Instance.new("Highlight")
                        hl.Adornee = Character
                        pcall(function() hl.Parent = game.CoreGui end)
                        if not hl.Parent then hl.Parent = LocalPlayer:WaitForChild("PlayerGui") end
                        ESP_Highlights[Player] = hl
                    end
                    ESP_Highlights[Player].FillColor = Options.ESPChamsFill.Value
                    ESP_Highlights[Player].OutlineColor = Options.ESPChamsOutline.Value
                    ESP_Highlights[Player].FillTransparency = 0.5
                    ESP_Highlights[Player].OutlineTransparency = 0
                    ESP_Highlights[Player].Enabled = true
                else
                    if ESP_Highlights[Player] then ESP_Highlights[Player].Enabled = false end
                end

            else
                for k, drawing in pairs(Drawings) do 
                    if k == "Skeleton" then
                        for _, line in ipairs(drawing) do line.Visible = false end
                    else
                        drawing.Visible = false 
                    end
                end
                if ESP_Highlights[Player] then ESP_Highlights[Player].Enabled = false end
            end
        else
            for k, drawing in pairs(Drawings) do 
                if k == "Skeleton" then
                    for _, line in ipairs(drawing) do line.Visible = false end
                else
                    drawing.Visible = false 
                end
            end
            if ESP_Highlights[Player] then ESP_Highlights[Player].Enabled = false end
        end
    end
end

local function CreateWorldESP(name)
    WorldESP_Drawings[name] = {
        Box = Drawing.new("Square"),
        Text = Drawing.new("Text")
    }
    local esp = WorldESP_Drawings[name]
    esp.Box.Thickness = 1; esp.Box.Filled = false
    esp.Text.Size = 14; esp.Text.Center = true; esp.Text.Outline = true
end

local function RemoveWorldESP(name)
    if WorldESP_Drawings[name] then
        WorldESP_Drawings[name].Box:Remove()
        WorldESP_Drawings[name].Text:Remove()
        WorldESP_Drawings[name] = nil
    end
end

local WorldHighlights = {}
local function handleCategoryESP(folder, toggle, color)
    if not folder then return end
    if toggle then
        for _, inst in ipairs(folder:GetChildren()) do
            if not WorldHighlights[inst] then
                local h = Instance.new("Highlight")
                h.Adornee = inst
                h.FillColor = color
                h.OutlineColor = color
                h.FillTransparency = 0.5
                h.OutlineTransparency = 0
                h.Parent = (inst:IsA("Model") and inst.PrimaryPart or inst) or inst
                WorldHighlights[inst] = h
            elseif WorldHighlights[inst] then
                WorldHighlights[inst].FillColor = color
                WorldHighlights[inst].OutlineColor = color
            end
        end
    else
        for _, inst in ipairs(folder:GetChildren()) do
            if WorldHighlights[inst] then
                WorldHighlights[inst]:Destroy()
                WorldHighlights[inst] = nil
            end
        end
    end
end

local function UpdateWorldESP()
    pcall(function()
        handleCategoryESP(Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Shopz"), Toggles.DealerESP.Value, Options.DealerColor.Value)
        handleCategoryESP(Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("SpawnedBread"), Toggles.CashESP.Value, Options.CashColor.Value)
        handleCategoryESP(Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("SpawnedTools"), Toggles.ItemESP.Value, Options.ItemColor.Value)
        handleCategoryESP(Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("ATMz"), Toggles.ATMESP.Value, Options.ATMColor.Value)
        handleCategoryESP(Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("MysteryBoxes"), Toggles.MysteryESP.Value, Options.MysteryColor.Value)
        handleCategoryESP(Workspace:FindFirstChild("Filter") and Workspace.Filter:FindFirstChild("SpawnedPiles"), Toggles.PileESP.Value, Options.PileColor.Value)
        
        -- Clean up destroyed items from table to prevent mem leaks
        for inst, highlight in pairs(WorldHighlights) do
            if not inst or not inst.Parent then
                if highlight then highlight:Destroy() end
                WorldHighlights[inst] = nil
            end
        end
    end)
end

local function ApplyGunMods(Item)
    if Item and Item:IsA("Tool") then
        for i, v in pairs(getgc(true)) do
            if type(v) == 'table' and rawget(v, 'EquipTime') then
                if Toggles.NoRecoil and Toggles.NoRecoil.Value then
                    v.Recoil = 0
                    v.CameraRecoilingEnabled = false
                    v.AngleX_Min = 0; v.AngleX_Max = 0
                    v.AngleY_Min = 0; v.AngleY_Max = 0
                    v.AngleZ_Min = 0; v.AngleZ_Max = 0
                end
                if Toggles.InstantEquip and Toggles.InstantEquip.Value then v.EquipTime = 0 end
                if Toggles.ModifySpread and Toggles.ModifySpread.Value then v.Spread = Options.SpreadAmount.Value end
                if Toggles.AutoMode and Toggles.AutoMode.Value then v.FireModeSettings = {FireMode = "Auto", BurstAmount = 6, BurstRate = 25, CanSwitch = true, SwitchTo = "Auto"} end
            end
        end
        if Toggles.InstantReload and Toggles.InstantReload.Value then
            local ReloadEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("GNX_R")
            if ReloadEvent and Item:FindFirstChild("IsGun") then ReloadEvent:FireServer(Item) end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(Char) Char.ChildAdded:Connect(ApplyGunMods) end)
if LocalPlayer.Character then LocalPlayer.Character.ChildAdded:Connect(ApplyGunMods) end

local MeleeTick = tick()
local PepperTick = tick()
local AttachCD = {["Fists"] = .05, ["Knuckledusters"] = .05, ["Nunchucks"] = 0.05, ["Shiv"] = .05, ["Bat"] = 1, ["Metal-Bat"] = 1, ["Chainsaw"] = 2.5, ["Balisong"] = .05, ["Rambo"] = .3, ["Shovel"] = 3, ["Sledgehammer"] = 2, ["Katana"] = .1, ["Wrench"] = .1}

local function ProcessAura()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local TOOL = LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not TOOL then return end
    
    local remote1 = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("XMHH.2")
    local remote2 = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("XMHH2.2")
    if not remote1 or not remote2 then return end

    if Toggles.MeleeAura.Value and AttachCD[TOOL.Name] then
        local attachcd = AttachCD[TOOL.Name] or 0.5
        if tick() - MeleeTick >= attachcd then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                    if dist < Options.MeleeDistance.Value and p.Character:FindFirstChildOfClass("Humanoid").Health > 0 and not p.Character:FindFirstChildOfClass("ForceField") then
                        local targetPart = p.Character:FindFirstChild(Options.MeleeTargetPart.Value) or p.Character:FindFirstChild("Right Arm")
                        if not targetPart then continue end
                        local result = remote1:InvokeServer("??", tick(), TOOL, "43TRFWX", "Normal", tick(), true)
                        if Toggles.MeleeAuraAnim.Value then
                            local anim = TOOL:FindFirstChild("AnimsFolder") and TOOL.AnimsFolder:FindFirstChild("Slash1")
                            if anim then
                                local animator = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChild("Animator")
                                if animator then animator:LoadAnimation(anim):Play(0.1, 1, 1.3) end
                            end
                        end
                        local Handle = TOOL:FindFirstChild("WeaponHandle") or TOOL:FindFirstChild("Handle") or LocalPlayer.Character:FindFirstChild("Left Arm")
                        local arg2 = { "??", tick(), TOOL, "2389ZFX34", result, true, Handle, targetPart, p.Character, LocalPlayer.Character.HumanoidRootPart.Position, targetPart.Position }
                        if TOOL.Name == "Chainsaw" then
                            for i = 1, 15 do remote2:FireServer(unpack(arg2)) end
                        else
                            remote2:FireServer(unpack(arg2))
                        end
                        MeleeTick = tick()
                    end
                end
            end
        end
    end


end

RunService.Heartbeat:Connect(function()
    if Unloaded then return end
    ProcessAura()
    
    if Toggles.WalkSpeedToggle.Value and (Options.WalkSpeedKey:GetState() or Options.WalkSpeedKey.Mode == "Toggle") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local humanoid = LocalPlayer.Character.Humanoid
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local moveDirection = humanoid.MoveDirection
        if moveDirection.Magnitude > 0 then
            hrp.AssemblyLinearVelocity = (moveDirection * Options.WalkSpeed.Value) + Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
        end
    end



    if Toggles.AntiFling.Value and LocalPlayer.Character then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end

    


    if Options.JumpCooldown and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        pcall(function()
            LocalPlayer.Character.Humanoid.JumpCooldown = Options.JumpCooldown.Value
        end)
    end
end)

Toggles.Fly:OnChanged(function()
    if not Toggles.Fly then return end
    if Toggles.Fly.Value then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = true
        end
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end
end)



RunService.Heartbeat:Connect(function()
    if Toggles.Fly.Value and (Options.FlyKey:GetState() or Options.FlyKey.Mode == "Toggle") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        local moveDir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        hrp.AssemblyLinearVelocity = moveDir * Options.FlySpeed.Value
    end
end)



local lockpickGUI = nil
local function setupNoFailLockpick(gui)
    if gui:IsA("ScreenGui") and gui.Name == "LockpickGUI" then
        lockpickGUI = gui
        for _, a in pairs(gui:GetDescendants()) do
            if a:IsA("ImageLabel") and a.Name == "Bar" and a.Parent.Name ~= "Attempts" then
                local oldSize = a.Size
                RunService.RenderStepped:Connect(function()
                    if Toggles.NoFailLockpick.Value and a then
                        a.Size = UDim2.new(0, 280, 0, 280)
                    elseif a then
                        a.Size = oldSize or a.Size
                    end
                end)
            end
        end
    end
end

LocalPlayer.PlayerGui.ChildAdded:Connect(setupNoFailLockpick)

local fastInteractEnabled = false
local function bypassProximityPrompts()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") and Toggles.FastInteract.Value then
            v.HoldDuration = 0
        end
    end
end

local function enableFastInteract()
    fastInteractEnabled = true
    bypassProximityPrompts()
    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(v)
        if fastInteractEnabled and Toggles.FastInteract.Value then
            v.HoldDuration = 0
        end
    end)
end

Toggles.FastInteract:OnChanged(function()
    fastInteractEnabled = Toggles.FastInteract.Value
    if fastInteractEnabled then
        enableFastInteract()
    end
end)

local function handleProtection(descendant)
    pcall(function()
        if descendant:IsA("BasePart") and Toggles.AntiBarbwire and Toggles.AntiBarbwire.Value then
            if descendant.Name:lower():match("barbwire") or descendant.Name:lower():match("spikes") then
                descendant.CanTouch = false
            end
        end
        if descendant.Name == "Smoke" or descendant.Name == "SmokeExplosion" then
            if Toggles.AntiSmoke and Toggles.AntiSmoke.Value then task.wait(); descendant:Destroy() end
        end
        if descendant:IsA("BlurEffect") or descendant:IsA("ColorCorrectionEffect") or descendant.Name == "BlindEffect" then
            if Toggles.AntiFlashbang and Toggles.AntiFlashbang.Value then task.wait(); descendant.Enabled = false end
        end
    end)
end
Workspace.DescendantAdded:Connect(handleProtection)

local hitlogDebounce = {}
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    if Unloaded then return oldNamecall(self, ...) end
    local method = getnamecallmethod()
    local args = {...}
    
    if not checkcaller() then
        if method == "FireServer" or method == "InvokeServer" then
            local selfName = tostring(self)
            if Toggles.AntiFallDamage and Toggles.AntiFallDamage.Value and (selfName == "FallDamage" or selfName == "FD_Event") then return end
            if Toggles.AntiBreakLimbs and Toggles.AntiBreakLimbs.Value and selfName == "BreakLimb" then return end
            
            if Toggles.Hitlogs and Toggles.Hitlogs.Value and selfName == "ZFKLF__H" then
                local hitPart = args[5]
                if hitPart and typeof(hitPart) == "Instance" and hitPart:IsA("BasePart") then
                    local targetChar = hitPart.Parent
                    local hum = targetChar:FindFirstChild("Humanoid") or targetChar.Parent:FindFirstChild("Humanoid")
                    if hum then
                        local targetPlayer = Players:GetPlayerFromCharacter(targetChar) or Players:GetPlayerFromCharacter(targetChar.Parent)
                        local targetName = targetPlayer and targetPlayer.Name or targetChar.Name
                        local shotCode = args[3]
                        if not hitlogDebounce[shotCode] then
                            hitlogDebounce[shotCode] = true
                            task.delay(0.1, function() hitlogDebounce[shotCode] = nil end)
                            task.spawn(function()
                                Library:Notify(string.format("Hit %s in the %s", targetName, hitPart.Name), 3)
                            end)
                        end
                    end
                end
            end
        end
    end
    return oldNamecall(self, ...)
end)

local oldNewIndex
oldNewIndex = hookmetamethod(game, "__newindex", function(t, k, v)
    if Unloaded then return oldNewIndex(t, k, v) end
    if not checkcaller() then
        if t == Camera and k == "FieldOfView" and Toggles.FOVToggle.Value then
            return
        end
        if t == Lighting and Toggles.AmbianceToggle and Toggles.AmbianceToggle.Value then
            if k == "Brightness" or k == "ClockTime" or k == "TimeOfDay" or k == "Ambient" or k == "OutdoorAmbient" then
                return
            end
        end
    end
    return oldNewIndex(t, k, v)
end)

Toggles.FOVToggle:OnChanged(function()
    if Toggles.FOVToggle.Value then Camera.FieldOfView = Options.FOVSlider.Value end
end)

Options.FOVSlider:OnChanged(function()
    if Toggles.FOVToggle.Value then Camera.FieldOfView = Options.FOVSlider.Value end
end)

Toggles.AmbianceToggle:OnChanged(function()
    if not Toggles.AmbianceToggle.Value then
        Lighting.Ambient = oldAmbient
        Lighting.OutdoorAmbient = oldOutdoorAmbient
        Lighting.ClockTime = oldClockTime
        Lighting.Brightness = oldBrightness
        Lighting.FogEnd = oldFogEnd
    end
end)

pcall(function()
    local oldStamina
    oldStamina = hookfunction(
        getupvalue(getrenv()._G.S_Take, 2),
        function(v1, ...)
            if Unloaded then return oldStamina(v1, ...) end
            if Toggles.InfStamina.Value then v1 = 0 end
            return oldStamina(v1, ...)
        end
    )
end)

RunService.RenderStepped:Connect(function()
    if not Toggles or not Options then return end
    
    if Toggles.FOVToggle and Toggles.FOVToggle.Value then Camera.FieldOfView = Options.FOVSlider and Options.FOVSlider.Value or 70 end
    
    if FOVCircle then
        FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
        FOVCircle.Radius = Options.AimFOVRadius and Options.AimFOVRadius.Value or 100
        FOVCircle.Color = Options.AimFOVColor and Options.AimFOVColor.Value or Color3.new(1,1,1)
        FOVCircle.Visible = Toggles.Aimbot and Toggles.Aimbot.Value and Toggles.AimDrawFOV and Toggles.AimDrawFOV.Value
    end

    if Toggles.BodyMod and Toggles.BodyMod.Value then
        if not bodyModCharSetup then setupBodyMod() end
        local c = LocalPlayer.Character
        if c then
            for motor, orig in pairs(origC0s) do
                if motor.Parent and motor.Parent.Parent == c then
                    if motor.Name == "Neck" then
                        motor.C0 = orig * CFrame.new(0, Options.HeadPos.Value, 0) * CFrame.Angles(math.rad(Options.HeadAngle.Value), 0, 0)
                    elseif motor.Name:match("Shoulder") then
                        motor.C0 = orig * CFrame.new(0, Options.ArmPos.Value, 0) * CFrame.Angles(math.rad(Options.ArmAngle.Value), 0, 0)
                    elseif motor.Name:match("Hip") then
                        motor.C0 = orig * CFrame.new(0, Options.LegPos.Value, 0) * CFrame.Angles(math.rad(Options.LegAngle.Value), 0, 0)
                    end
                end
            end
        end
    elseif bodyModCharSetup then
        local c = LocalPlayer.Character
        if c then
            for motor, orig in pairs(origC0s) do
                if motor.Parent and motor.Parent.Parent == c then
                    motor.C0 = orig
                end
            end
        end
        bodyModCharSetup = false
    end

    if Toggles.Fly and Toggles.Fly.Value and LocalPlayer.Character and flyBV then
        local moveDir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
        flyBV.Velocity = moveDir * (Options.FlySpeed and Options.FlySpeed.Value or 50)
    end

    if Toggles.InfinitePepper and Toggles.InfinitePepper.Value then
        local pepper = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Pepper-spray")
        if pepper then
            local ammo = pepper:FindFirstChild("Ammo")
            if ammo then
                pcall(function() ammo.Value = 100 end)
            end
        end
    end


    if Toggles.PepperAura and Toggles.PepperAura.Value then
        local pepper = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Pepper-spray")
        if pepper then
            local anyInRange = false
            for _, v in ipairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    if Toggles.RagebotCheckTeam.Value and v.Team == LocalPlayer.Team then continue end
                    if v.Character:GetAttribute("Downed") then continue end
                    
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if dist < Options.PepperDistance.Value then
                        anyInRange = true
                        pepper.RemoteEvent:FireServer("Spray", true)
                        pepper.RemoteEvent:FireServer("Hit", v.Character)
                    end
                end
            end
            if not anyInRange then
                pepper.RemoteEvent:FireServer("Spray", false)
            end
        end
    end

    UpdateESP()
end)

RunService:BindToRenderStep("CravexAimbot", Enum.RenderPriority.Camera.Value + 1, function()
    if Unloaded then RunService:UnbindFromRenderStep("CravexAimbot") return end
    
    if Toggles.Aimbot.Value and Options.AimbotKey:GetState() then
        local target = GetAimbotTarget()
        if target and target.Character then
            local targetPart = GetTargetPart(target.Character, Options.AimPart.Value)
            if targetPart then
                local TargetPosition = targetPart.Position
                local smoothness = Options.AimSmoothness.Value / 100
                
                if Options.AimMethod.Value == "Camera" then
                    if smoothness > 0 then
                        Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, TargetPosition), smoothness)
                    else
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, TargetPosition)
                    end
                else
                    local screenPos, onScreen = Camera:WorldToViewportPoint(TargetPosition)
                    if onScreen then
                        local mousePos = UserInputService:GetMouseLocation()
                        local delta = (Vector2.new(screenPos.X, screenPos.Y) - mousePos)
                        
                        if mousemoverel then
                            if smoothness > 0 then
                                mousemoverel(delta.X * smoothness, delta.Y * smoothness)
                            else
                                mousemoverel(delta.X, delta.Y)
                            end
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if Unloaded then break end
        
        UpdateWorldESP()
        
        if Toggles.BloomToggle then
            local b = Lighting:FindFirstChild("CustomBloom") or Instance.new("BloomEffect", Lighting)
            b.Name = "CustomBloom"
            if Toggles.BloomToggle.Value then
                b.Enabled = true
                b.Intensity = Options.BloomIntensity.Value
                b.Size = Options.BloomSize.Value
                b.Threshold = Options.BloomThreshold.Value
            else
                b.Enabled = false
            end
        end

        if Toggles.AmbianceToggle then
            local cc = Lighting:FindFirstChild("CustomAmbiance") or Instance.new("ColorCorrectionEffect", Lighting)
            cc.Name = "CustomAmbiance"
            if Toggles.AmbianceToggle.Value then
                cc.Enabled = true
                cc.TintColor = Options.AmbianceColor.Value
                Lighting.Ambient = Options.AmbianceColor.Value
                Lighting.OutdoorAmbient = Options.AmbianceColor.Value
                Lighting.ClockTime = Options.EnvTime.Value
                Lighting.Brightness = Options.EnvBrightness.Value
                if Toggles.EnvNoFog.Value then
                    Lighting.FogEnd = 100000
                else
                    Lighting.FogEnd = oldFogEnd
                end
            else
                cc.Enabled = false
            end
        end

        if Toggles.ViewmodelToggle and Toggles.ViewmodelToggle.Value then
            local vm = Camera:FindFirstChild("ViewModel")
            if vm then
                for _, v in pairs(vm:GetDescendants()) do
                    if v:IsA("BasePart") then
                        if not v:GetAttribute("OrigMat") then
                            v:SetAttribute("OrigMat", v.Material.Name)
                            v:SetAttribute("OrigColor", v.Color)
                        end
                        v.Color = Options.ViewmodelColor.Value
                        v.Material = Enum.Material[Options.ViewmodelMaterial.Value]
                    end
                end
            end
            if LocalPlayer.Character then
                local equippedTool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                if equippedTool then
                    for _, v in pairs(equippedTool:GetDescendants()) do
                        if v:IsA("BasePart") then
                            if not v:GetAttribute("OrigMat") then
                                v:SetAttribute("OrigMat", v.Material.Name)
                                v:SetAttribute("OrigColor", v.Color)
                            end
                            v.Color = Options.ViewmodelColor.Value
                            v.Material = Enum.Material[Options.ViewmodelMaterial.Value]
                        end
                    end
                end
            end
        elseif Toggles.ViewmodelToggle and not Toggles.ViewmodelToggle.Value then
            local vm = Camera:FindFirstChild("ViewModel")
            if vm then
                for _, v in pairs(vm:GetDescendants()) do
                    if v:IsA("BasePart") and v:GetAttribute("OrigMat") then
                        v.Material = Enum.Material[v:GetAttribute("OrigMat")]
                        v.Color = v:GetAttribute("OrigColor")
                        v:SetAttribute("OrigMat", nil)
                    end
                end
            end
            if LocalPlayer.Character then
                local equippedTool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                if equippedTool then
                    for _, v in pairs(equippedTool:GetDescendants()) do
                        if v:IsA("BasePart") and v:GetAttribute("OrigMat") then
                            v.Material = Enum.Material[v:GetAttribute("OrigMat")]
                            v.Color = v:GetAttribute("OrigColor")
                            v:SetAttribute("OrigMat", nil)
                        end
                    end
                end
            end
        end

        if Toggles.PlayerRigToggle and Toggles.PlayerRigToggle.Value and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                    local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                    if not tool or not v:IsDescendantOf(tool) then
                        if not v:GetAttribute("OrigMat") then
                            v:SetAttribute("OrigMat", v.Material.Name)
                            v:SetAttribute("OrigColor", v.Color)
                        end
                        v.Color = Options.PlayerRigColor.Value
                        v.Material = Enum.Material[Options.PlayerRigMaterial.Value]
                    end
                end
            end
        elseif Toggles.PlayerRigToggle and not Toggles.PlayerRigToggle.Value and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v:GetAttribute("OrigMat") then
                    local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                    if not tool or not v:IsDescendantOf(tool) then
                        v.Material = Enum.Material[v:GetAttribute("OrigMat")]
                        v.Color = v:GetAttribute("OrigColor")
                        v:SetAttribute("OrigMat", nil)
                    end
                end
            end
        end
    end
end)

RunService.Stepped:Connect(function()
    if Unloaded then return end
    if Toggles.Noclip and Toggles.Noclip.Value and Options.NoclipKey and Options.NoclipKey:GetState() and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local ProjForward = 0
local ProjSideways = 0
local ProjBreak = false

UserInputService.InputBegan:Connect(function(Key, processed)
    if processed then return end
    if Key.KeyCode == Enum.KeyCode.W then ProjForward = 1
    elseif Key.KeyCode == Enum.KeyCode.S then ProjForward = -1
    elseif Key.KeyCode == Enum.KeyCode.D then ProjSideways = 1
    elseif Key.KeyCode == Enum.KeyCode.A then ProjSideways = -1 end
end)

UserInputService.InputEnded:Connect(function(Key, processed)
    if Key.KeyCode == Enum.KeyCode.W or Key.KeyCode == Enum.KeyCode.S then ProjForward = 0
    elseif Key.KeyCode == Enum.KeyCode.D or Key.KeyCode == Enum.KeyCode.A then ProjSideways = 0 end
end)

Debris.ChildAdded:Connect(function(Result)
    if Unloaded then return end
    task.wait()
    if not LocalPlayer.Character then return end
    pcall(function()
        if (Result.Name == "C4Explosion" or Result.Name == "RPG_Explosion_Long" or Result.Name == "RPG_Explosion_Short" or Result.Name == "GL_Explosion_Long" or Result.Name == "GL_Explosion_Short") then
            ProjBreak = true
            task.wait(1)
            ProjBreak = false
        end
    end)
end)

local VParts = Debris:WaitForChild("VParts")
VParts.ChildAdded:Connect(function(Projectile)
    if Unloaded then return end
    if not Toggles.ProjControl or not Toggles.ProjControl.Value then return end
    if not Options.ProjControlKey or not Options.ProjControlKey:GetState() then return end
    
    local Type = Options.ProjType.Value
    local isC4 = Projectile.Name == "TransIgnore" and (Type == "C4" or Type == "Both")
    local isRPG = (Projectile.Name == "RPG_Rocket" or Projectile.Name == "GrenadeLauncherGrenade") and (Type == "RPG" or Type == "Both")
    
    if not isC4 and not isRPG then return end
    task.wait()
    if not LocalPlayer.Character then return end
    
    if isC4 and not LocalPlayer.Character:FindFirstChild("C4") then return end
    if isRPG and Projectile.Name == "RPG_Rocket" and not LocalPlayer.Character:FindFirstChild("RPG-7") then return end

    Camera.CameraSubject = Projectile
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.Anchored = true end

    pcall(function()
        if Projectile:FindFirstChild("BodyForce") then Projectile.BodyForce:Destroy() end
        if Projectile:FindFirstChild("BodyAngularVelocity") then Projectile.BodyAngularVelocity:Destroy() end
        if Projectile:FindFirstChild("RotPart") and Projectile.RotPart:FindFirstChild("BodyAngularVelocity") then
            Projectile.RotPart.BodyAngularVelocity:Destroy()
        end
        if Projectile:FindFirstChild("Sound") then Projectile.Sound:Destroy() end
    end)

    local BV = Instance.new("BodyVelocity", Projectile)
    BV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    BV.Velocity = Vector3.new()

    local BG = Instance.new("BodyGyro", Projectile)
    BG.P = 9e4
    BG.MaxTorque = Vector3.new(1e9, 1e9, 1e9)

    task.spawn(function()
        while Projectile and Projectile.Parent and Toggles.ProjControl.Value and Options.ProjControlKey:GetState() do
            RunService.RenderStepped:Wait()
            local speed = Options.ProjSpeed and Options.ProjSpeed.Value or 200
            local vel = ((Camera.CFrame.LookVector * ProjForward) + (Camera.CFrame.RightVector * ProjSideways)) * speed
            
            pcall(function() BV.Velocity = vel end)
            pcall(function() BG.CFrame = Camera.CoordinateFrame end)
            
            pcall(function() Camera.CFrame = Camera.CFrame:Lerp(Projectile.CFrame * CFrame.new(0, 5, 1), 0.1) end)
            if ProjBreak then
                ProjBreak = false
                break
            end
        end
        if LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then Camera.CameraSubject = hum end
            if hrp then hrp.Anchored = false end
        end
    end)
end)

local activeTracers = {}
local maxTracers = 10
local isShooting = false
local lastShotTime = 0
local shotCooldown = 0.05
local lastBulletHoleTime = 0



Library:OnUnload(function()
    Unloaded = true
    StopSilentAim()
    StopRagebot()
    FOVCircle:Remove()
    silentAimCircle:Remove()
    if silentCircleRender then silentCircleRender:Disconnect() end
    pcall(function() RunService:UnbindFromRenderStep("CravexAimbot") end)
    if flyBV then flyBV:Destroy() end
    if flyBG then flyBG:Destroy() end
    for _, plr in ipairs(Players:GetPlayers()) do RemoveESP(plr) end
    fastInteractEnabled = false
    bodyModCharSetup = false
    Lighting.Ambient = oldAmbient
    Lighting.OutdoorAmbient = oldOutdoorAmbient
    Lighting.ClockTime = oldClockTime
    Lighting.Brightness = oldBrightness
    Lighting.FogEnd = oldFogEnd
    for inst, highlight in pairs(WorldHighlights) do
        if highlight then highlight:Destroy() end
    end
end)
