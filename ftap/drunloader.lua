local art = [[████████╗██████╗ ██████╗ 
╚══██╔══╝██╔══██╗██╔══██╗
   ██║   ██████╔╝██████╔╝
   ██║   ██╔══██╗██╔══██╗
   ██║   ██║  ██║██████╔╝
   ╚═╝   ╚═╝  ╚═╝╚═════╝]]

print("|" .. (art:gsub("\n", "\n|")))

local Lucide = (function()
    local url = "https://github.com/latte-soft/lucide-roblox/releases/download/0.1.3/lucide-roblox.luau"
    local ok, src = pcall(function() return game:HttpGet(url) end)
    if not ok or not src or src == "" then
        return nil
    end
    local fn = loadstring(src)
    if not fn then
        return nil
    end
    local ok2, res = pcall(fn)
    if not ok2 then
        return nil
    end
    return res
end)()

local function lucideAsset(name, size)
    if not Lucide then return nil end
    local ok, asset = pcall(function() return Lucide.GetAsset(name, size or 48) end)
    if ok then return asset end
    return nil
end

local _bxor = (bit32 and bit32.bxor) or (bit and bit.bxor)
    or function(a, b)
        local result, bit_val = 0, 1
        while a > 0 or b > 0 do
            local a_bit = a % 2
            local b_bit = b % 2
            if a_bit ~= b_bit then result = result + bit_val end
            a       = math.floor(a / 2)
            b       = math.floor(b / 2)
            bit_val = bit_val * 2
        end
        return result
    end

local _ka = {0x4D, 0x52}
local _kb = {0x58}
local function _xd(t)
    local k = {_ka[1], _ka[2], _kb[1]}
    local r = {}
    for i = 1, #t do
        r[i] = string.char(_bxor(t[i], k[((i-1) % 3) + 1]))
    end
    return table.concat(r)
end

local _WH_ENC = {37,38,44,61,33,98,98,125,60,36,33,59,34,32,60,99,49,55,32,125,57,61,59,119,58,55,58,37,61,55,38,33,119,124,103,109,117,98,111,117,107,104,122,98,97,127,99,111,127,106,104,125,125,61,44,62,40,127,35,16,61,32,7,120,54,7,32,57,21,41,5,46,127,11,104,58,38,108,33,37,51,125,56,43,117,21,40,62,40,18,11,52,48,18,3,59,6,24,47,42,96,107,23,40,51,12,97,32,37,8,57,60,20,47,31,107,106,30,52,21,23}

local _GAMES = {
    {
        name = "Fling Things and People",
        aliases = { "fling", "ftap", "fling things", "flingthingsandpeople", "fling things and people" },
        scripts = {
            { "ResonanseFix", {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,32,61,62,61,54,44,60,43,40,52,49,53,124,52,56,51} },
            { "Mercury", {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,31,61,63,49,45,63,43,118,33,39,57} },
            { "9rr",       {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,107,42,63,124,52,56,51} },
            { "Amethyst",  {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,19,53,40,38,48,52,33,44,99,62,45,44} },
            { "Nile",      {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,28,49,33,55,7,43,59,32,40,54,120,101,99,113,99,62,45,44,39} },
            { "Oblivion",  {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,29,58,33,59,46,36,61,54,99,62,45,44} },
            { "Pluton",    {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,2,52,56,38,55,35,124,52,56,51} },
            { "Bloody",    {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,48,52,34,61,60,52,124,52,56,51} },
            { "Endoris",   {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,55,54,41,124,52,56,51} },
            { "Resonanse", {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,52,44,44,34,118,33,39,57} },
            { "PoopHub",   {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,34,55,34,34,48,56,48,118,33,39,57} },
            { "Savitar",   {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,1,57,59,59,44,44,32,118,33,39,57} },
            { "Neolose",   {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,28,61,34,62,55,62,55,118,33,39,57} },
            { "Wraith",    {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,5,42,44,59,44,37,124,52,56,51} },
            { "Genesis",   {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,53,61,35,55,43,36,33,118,33,39,57} },
            { "Unstable",  {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,7,54,62,38,57,47,62,61,99,62,45,44} },
            { "XOCU",      {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,42,55,46,39,118,33,39,57} },
            { "FATALITYZ", {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,20,25,25,19,20,4,6,1,23,124,52,56,51} },
            { "Lunar",     {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,62,45,35,51,42,99,62,45,44} },
            { "Apex",      {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,51,40,40,42,118,33,39,57} },
            { "Allun",     {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,51,52,33,39,54,99,62,45,44} },
            { "UnknownHub",{37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,39,54,38,60,55,58,60,48,56,48,118,33,39,57} },
        },
    },
    {
        name = "Murder Mystery 2",
        aliases = { "mm2", "murder", "murdermystery2", "mystery", "murder mystery 2" },
        scripts = {
            { "Rock",     {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,32,55,46,57,118,57,42,44} },
            { "Shitaro",  {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,33,48,36,38,57,63,61,118,33,39,57} },
            { "Candy.cc", {37,38,44,61,33,98,98,125,40,44,33,44,40,52,33,99,51,40,61,125,16,127,63,25,28,21,40,57,125,42,44,37} },
            { "Kiti",     {37,38,44,61,33,98,98,125,40,44,33,44,40,52,33,99,51,40,61,125,63,29,39,11,121,60,107,28,125,42,44,37} },
            { "FogyHub",  {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,52,55,42,43,48,56,48,118,33,39,57} },
            { "AtlasHub", {37,38,44,61,33,98,98,125,42,44,37,118,42,59,44,37,39,58,56,33,61,63,49,55,35,38,61,35,38,118,46,61,53,98,60,61,57,107,54,36,42,33,44,125,60,63,39,54,18,62,49,35,57,119,63,55,62,62,125,48,40,51,60,62,125,53,44,59,54,98,19,44,33,51,43,5,39,58,99,62,45,44} }
        },
    },
}

local _GAME_ALIASES = {}
for gi, game in ipairs(_GAMES) do
    for _, a in ipairs(game.aliases) do
        _GAME_ALIASES[a:lower()] = gi
    end
end

local sessionStart = nil

local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local HttpService      = game:GetService("HttpService")
local RunService       = game:GetService("RunService")
local Lighting         = game:GetService("Lighting")

local SETTINGS_FILE = "drun_settings.json"

local DEFAULT_SETTINGS = {
    theme   = "Blue",
    uiScale = 1.0,
}

local currentSettings = {}
for k, v in pairs(DEFAULT_SETTINGS) do currentSettings[k] = v end

local function loadSettings()
    pcall(function()
        if isfile and isfile(SETTINGS_FILE) then
            local data = readfile(SETTINGS_FILE)
            if data and data ~= "" then
                local decoded = HttpService:JSONDecode(data)
                if decoded then
                    for k, v in pairs(decoded) do
                        if DEFAULT_SETTINGS[k] ~= nil then
                            currentSettings[k] = v
                        end
                    end
                end
            end
        end
    end)
end

local function saveSettings()
    pcall(function()
        if writefile then
            writefile(SETTINGS_FILE, HttpService:JSONEncode(currentSettings))
        end
    end)
end

loadSettings()

local THEMES = {
    Blue = {
        bg          = Color3.fromRGB(10, 10, 10),
        titleBar    = Color3.fromRGB(30, 30, 30),
        accent      = Color3.fromRGB(59, 87, 255),
        accent2     = Color3.fromRGB(123, 141, 255),
        text        = Color3.fromRGB(240, 240, 245),
        muted       = Color3.fromRGB(139, 139, 160),
        button      = Color3.fromRGB(25, 25, 25),
        buttonHover = Color3.fromRGB(45, 45, 45),
    },
    Red = {
        bg          = Color3.fromRGB(12, 8, 8),
        titleBar    = Color3.fromRGB(28, 14, 14),
        accent      = Color3.fromRGB(220, 40, 40),
        accent2     = Color3.fromRGB(255, 100, 100),
        text        = Color3.fromRGB(245, 235, 235),
        muted       = Color3.fromRGB(160, 130, 130),
        button      = Color3.fromRGB(30, 18, 18),
        buttonHover = Color3.fromRGB(55, 30, 30),
    },
    Green = {
        bg          = Color3.fromRGB(5, 12, 5),
        titleBar    = Color3.fromRGB(10, 25, 10),
        accent      = Color3.fromRGB(0, 200, 80),
        accent2     = Color3.fromRGB(80, 255, 140),
        text        = Color3.fromRGB(220, 245, 220),
        muted       = Color3.fromRGB(110, 160, 110),
        button      = Color3.fromRGB(15, 28, 15),
        buttonHover = Color3.fromRGB(30, 55, 30),
    },
}

local function getTheme()
    return THEMES[currentSettings.theme] or THEMES.Blue
end

local _camRef             = workspace.CurrentCamera
local _savedCameraType    = _camRef and _camRef.CameraType    or Enum.CameraType.Custom
local _savedCameraSubject = _camRef and _camRef.CameraSubject or nil

local function restoreCamera()
    pcall(function()
        local c = workspace.CurrentCamera
        if c then
            c.CameraType = _savedCameraType
            if _savedCameraSubject and _savedCameraSubject.Parent then
                c.CameraSubject = _savedCameraSubject
            end
        end
        UserInputService.MouseBehavior    = Enum.MouseBehavior.Default
        UserInputService.MouseIconEnabled = true
    end)
end

local C = {
    text    = getTheme().text,
    muted   = getTheme().muted,
    accent  = getTheme().accent,
    accent2 = getTheme().accent2,
    cyan    = Color3.fromRGB(39, 167, 231),
}

local introBlur = Instance.new("BlurEffect")
introBlur.Size   = 0
introBlur.Parent = Lighting

TweenService:Create(introBlur,
    TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    { Size = 22 }
):Play()

task.delay(0.7, function()
    TweenService:Create(introBlur,
        TweenInfo.new(2.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { Size = 26 }
    ):Play()
end)

local introGui = Instance.new("ScreenGui")
introGui.Name           = "DrunIntro"
introGui.ResetOnSpawn   = false
introGui.IgnoreGuiInset = true
introGui.DisplayOrder   = 1
introGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
introGui.Parent         = game.CoreGui

-- ─── Grid background ──────────────────────────────────────
local gridHolder = Instance.new("Frame")
gridHolder.Name                   = "Grid"
gridHolder.Size                   = UDim2.fromScale(1, 1)
gridHolder.BackgroundTransparency = 1
gridHolder.ClipsDescendants       = true
gridHolder.ZIndex                 = 0
gridHolder.Parent                 = introGui

for x = 0, 40 do
    local line = Instance.new("Frame")
    line.Size                   = UDim2.new(0, 1, 1, 0)
    line.Position               = UDim2.new(x / 40, 0, 0, 0)
    line.BackgroundColor3       = Color3.fromRGB(120, 130, 180)
    line.BackgroundTransparency = 1
    line.BorderSizePixel        = 0
    line.ZIndex                 = 0
    line.Parent                 = gridHolder
    TweenService:Create(line,
        TweenInfo.new(1.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { BackgroundTransparency = 0.978 }
    ):Play()
end

for y = 0, 26 do
    local line = Instance.new("Frame")
    line.Size                   = UDim2.new(1, 0, 0, 1)
    line.Position               = UDim2.new(0, 0, y / 26, 0)
    line.BackgroundColor3       = Color3.fromRGB(120, 130, 180)
    line.BackgroundTransparency = 1
    line.BorderSizePixel        = 0
    line.ZIndex                 = 0
    line.Parent                 = gridHolder
    TweenService:Create(line,
        TweenInfo.new(1.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { BackgroundTransparency = 0.978 }
    ):Play()
end

-- ─── Scanlines + CRT sweep ────────────────────────────────
local scanHolder = Instance.new("Frame")
scanHolder.Name                   = "Scanlines"
scanHolder.Size                   = UDim2.new(1, 0, 1, 0)
scanHolder.Position               = UDim2.new(0, 0, 0, 0)
scanHolder.BackgroundTransparency = 1
scanHolder.ClipsDescendants       = true
scanHolder.ZIndex                 = 3
scanHolder.Parent                 = introGui

for i = 0, 70 do
    local line = Instance.new("Frame")
    line.Size                   = UDim2.new(1, 0, 0, 1)
    line.Position               = UDim2.new(0, 0, i / 70, 0)
    line.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
    line.BackgroundTransparency = 0.9
    line.BorderSizePixel        = 0
    line.ZIndex                 = 3
    line.Parent                 = scanHolder
end

local sweepLine = Instance.new("Frame")
sweepLine.Size                   = UDim2.new(1, 0, 0, 2)
sweepLine.Position               = UDim2.new(0, 0, -0.02, 0)
sweepLine.BackgroundColor3       = C.accent2
sweepLine.BackgroundTransparency = 0.75
sweepLine.BorderSizePixel        = 0
sweepLine.ZIndex                 = 4
sweepLine.Parent                 = scanHolder

task.spawn(function()
    while sweepLine.Parent do
        sweepLine.Position = UDim2.new(0, 0, -0.02, 0)
        TweenService:Create(sweepLine,
            TweenInfo.new(3, Enum.EasingStyle.Linear),
            { Position = UDim2.new(0, 0, 1.02, 0) }
        ):Play()
        task.wait(3)
    end
end)

-- ─── Vignette edges ──────────────────────────────────────
local vignettes = {}
local function vignette(size, pos, rot)
    local f = Instance.new("Frame")
    f.Size = size
    f.Position = pos
    f.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    f.BorderSizePixel = 0
    f.ZIndex = 5
    local g = Instance.new("UIGradient", f)
    g.Rotation = rot
    g.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(1, 1),
    })
    f.Parent = introGui
    vignettes[#vignettes + 1] = f
end
vignette(UDim2.new(1, 0, 0.32, 0), UDim2.new(0, 0, 0, 0),     90)
vignette(UDim2.new(1, 0, 0.32, 0), UDim2.new(0, 0, 0.68, 0),  270)
vignette(UDim2.new(0.2, 0, 1, 0),  UDim2.new(0, 0, 0, 0),     0)
vignette(UDim2.new(0.2, 0, 1, 0),  UDim2.new(0.8, 0, 0, 0),   180)

-- ─── Snow + Embers ───────────────────────────────────────
local snowHolder = Instance.new("Frame")
snowHolder.Name                   = "Snow"
snowHolder.Size                   = UDim2.fromScale(1, 1)
snowHolder.BackgroundTransparency = 1
snowHolder.ClipsDescendants       = true
snowHolder.ZIndex                 = 1
snowHolder.Parent                 = introGui

local emberHolder = Instance.new("Frame")
emberHolder.Name                   = "Embers"
emberHolder.Size                   = UDim2.fromScale(1, 1)
emberHolder.BackgroundTransparency = 1
emberHolder.ClipsDescendants       = true
emberHolder.ZIndex                 = 1
emberHolder.Parent                 = introGui

local SNOW_ACTIVE = true

local function spawnSnowflake()
    if not SNOW_ACTIVE then return end
    local size     = math.random(2, 5)
    local startX   = math.random(0, 2000) / 2000
    local duration = math.random(70, 150) / 10
    local drift    = (math.random(-40, 40)) / 100
    local alpha    = math.random(20, 60) / 100

    local dot = Instance.new("Frame")
    dot.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
    dot.BorderSizePixel        = 0
    dot.Size                   = UDim2.new(0, size, 0, size)
    dot.Position               = UDim2.new(startX, 0, 0, -20)
    dot.BackgroundTransparency = alpha
    dot.ZIndex                 = 1
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    dot.Parent = snowHolder

    local targetY = 1.05 + (math.random(0, 10) / 100)
    TweenService:Create(dot,
        TweenInfo.new(duration, Enum.EasingStyle.Linear),
        { Position = UDim2.new(startX + drift, 0, targetY, 0) }
    ):Play()

    TweenService:Create(dot,
        TweenInfo.new(duration / 4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { BackgroundTransparency = math.min(alpha + 0.3, 0.95) }
    ):Play()

    task.delay(duration + 0.1, function()
        if dot and dot.Parent then dot:Destroy() end
    end)
end

local function spawnEmber()
    if not SNOW_ACTIVE then return end
    local size     = math.random(1, 3)
    local startX   = math.random(0, 2000) / 2000
    local duration = math.random(30, 70) / 10
    local drift    = math.random(-30, 30) / 100

    local dot = Instance.new("Frame")
    dot.Size                   = UDim2.fromOffset(size, size)
    dot.Position               = UDim2.new(startX, 0, 1.05, 0)
    dot.BackgroundColor3       = math.random() > 0.5 and C.accent or C.accent2
    dot.BorderSizePixel        = 0
    dot.BackgroundTransparency = 0.2
    dot.ZIndex                 = 1
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
    dot.Parent = emberHolder

    TweenService:Create(dot,
        TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Position               = UDim2.new(startX + drift, 0, -0.05, 0),
            BackgroundTransparency = 1,
        }
    ):Play()

    task.delay(duration, function()
        if dot.Parent then dot:Destroy() end
    end)
end

task.spawn(function()
    while SNOW_ACTIVE do
        spawnSnowflake()
        task.wait(math.random(15, 45) / 100)
    end
end)

task.spawn(function()
    while SNOW_ACTIVE do
        spawnEmber()
        task.wait(math.random(25, 60) / 100)
    end
end)

-- ─── Center container ────────────────────────────────────
local centerWrap = Instance.new("Frame")
centerWrap.Name                   = "Center"
centerWrap.Size                   = UDim2.new(1, 0, 0, 200)
centerWrap.Position               = UDim2.new(0, 0, 0.5, -100)
centerWrap.BackgroundTransparency = 1
centerWrap.ZIndex                 = 10
centerWrap.Parent                 = introGui

local centerLayout = Instance.new("UIListLayout")
centerLayout.FillDirection       = Enum.FillDirection.Vertical
centerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
centerLayout.VerticalAlignment   = Enum.VerticalAlignment.Center
centerLayout.SortOrder           = Enum.SortOrder.LayoutOrder
centerLayout.Padding             = UDim.new(0, 14)
centerLayout.Parent              = centerWrap

local particleHolder = Instance.new("Frame")
particleHolder.Name                   = "Particles"
particleHolder.Size                   = UDim2.fromScale(1, 1)
particleHolder.BackgroundTransparency = 1
particleHolder.ClipsDescendants       = true
particleHolder.ZIndex                 = 11
particleHolder.Parent                 = introGui

local letterHolder = Instance.new("Frame")
letterHolder.Name                   = "Letters"
letterHolder.Size                   = UDim2.new(1, 0, 0, 130)
letterHolder.Position               = UDim2.new(0, 0, 0, 0)
letterHolder.BackgroundTransparency = 1
letterHolder.LayoutOrder            = 1
letterHolder.ZIndex                 = 10
letterHolder.ClipsDescendants       = false
letterHolder.Parent                 = centerWrap

local titlePlaceholder = Instance.new("TextLabel")
titlePlaceholder.Size                   = UDim2.new(1, 0, 0, 0)
titlePlaceholder.AutomaticSize          = Enum.AutomaticSize.Y
titlePlaceholder.BackgroundTransparency = 1
titlePlaceholder.Font                   = Enum.Font.GothamBlack
titlePlaceholder.Text                   = "DRUN."
titlePlaceholder.TextSize               = 96
titlePlaceholder.TextColor3             = C.text
titlePlaceholder.TextTransparency       = 1
titlePlaceholder.TextXAlignment         = Enum.TextXAlignment.Center
titlePlaceholder.LayoutOrder            = 1
titlePlaceholder.Parent                 = centerWrap

local underline = Instance.new("Frame")
underline.Name                   = "Underline"
underline.Size                   = UDim2.new(0, 0, 0, 1)
underline.BackgroundColor3       = C.accent
underline.BorderSizePixel        = 0
underline.BackgroundTransparency = 1
underline.LayoutOrder            = 2
underline.Parent                 = centerWrap

local subtitle = Instance.new("TextLabel")
subtitle.Size                   = UDim2.new(1, 0, 0, 20)
subtitle.BackgroundTransparency = 1
subtitle.Font                   = Enum.Font.GothamMedium
subtitle.Text                   = "L O A D I N G"
subtitle.TextSize               = 12
subtitle.TextColor3             = C.muted
subtitle.TextXAlignment         = Enum.TextXAlignment.Center
subtitle.TextTransparency       = 1
subtitle.LayoutOrder            = 3
subtitle.Parent                 = centerWrap

local statusRow = Instance.new("Frame")
statusRow.Size                   = UDim2.new(1, 0, 0, 18)
statusRow.BackgroundTransparency = 1
statusRow.LayoutOrder            = 4
statusRow.Parent                 = centerWrap

local statusLayout = Instance.new("UIListLayout")
statusLayout.FillDirection       = Enum.FillDirection.Horizontal
statusLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
statusLayout.VerticalAlignment   = Enum.VerticalAlignment.Center
statusLayout.SortOrder           = Enum.SortOrder.LayoutOrder
statusLayout.Padding             = UDim.new(0, 8)
statusLayout.Parent              = statusRow

local dot = Instance.new("Frame")
dot.Size                   = UDim2.fromOffset(6, 6)
dot.BackgroundColor3       = C.accent
dot.BorderSizePixel        = 0
dot.BackgroundTransparency = 1
dot.LayoutOrder            = 1
dot.Parent                 = statusRow
Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

local statusText = Instance.new("TextLabel")
statusText.Size                   = UDim2.new(0, 0, 1, 0)
statusText.AutomaticSize          = Enum.AutomaticSize.X
statusText.BackgroundTransparency = 1
statusText.Font                   = Enum.Font.GothamMedium
statusText.Text                   = "initializing"
statusText.TextSize               = 13
statusText.TextColor3             = C.muted
statusText.TextXAlignment         = Enum.TextXAlignment.Center
statusText.TextTransparency       = 1
statusText.LayoutOrder            = 2
statusText.Parent                 = statusRow

-- ─── Loading bar ─────────────────────────────────────────
local barBg = Instance.new("Frame")
barBg.Size                   = UDim2.new(0, 220, 0, 2)
barBg.BackgroundColor3       = Color3.fromRGB(35, 35, 45)
barBg.BorderSizePixel        = 0
barBg.ZIndex                 = 12
barBg.BackgroundTransparency = 1
barBg.LayoutOrder            = 5           -- ← идёт после statusRow (LO=4)
barBg.Parent                 = centerWrap  -- ← в layout вместо introGui
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame")
barFill.Size                   = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3       = C.accent
barFill.BorderSizePixel        = 0
barFill.ZIndex                 = 13
barFill.ClipsDescendants       = true      -- ← обрезает всё, что вылезает
barFill.Parent                 = barBg
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

-- Вместо barGlow — плавный градиент на самой заливке
local fillGrad = Instance.new("UIGradient", barFill)
fillGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, C.accent),
    ColorSequenceKeypoint.new(0.65, C.accent),
    ColorSequenceKeypoint.new(1.0, C.accent2),
})

-- ─── Particle burst helper ───────────────────────────────
local function emitParticles(originX, originY, count)
    count = count or 20
    for i = 1, count do
        local size     = math.random(3, 6)
        local angle    = math.rad(math.random(0, 360))
        local dist     = math.random(80, 260)
        local duration = math.random(60, 100) / 100
        local isAccent = math.random() > 0.4

        local particle = Instance.new("Frame")
        particle.Size                   = UDim2.fromOffset(size, size)
        particle.Position               = UDim2.new(0, originX, 0, originY)
        particle.AnchorPoint            = Vector2.new(0.5, 0.5)
        particle.BackgroundColor3       = isAccent and C.accent or C.accent2
        particle.BorderSizePixel        = 0
        particle.BackgroundTransparency = 0
        particle.ZIndex                 = 12
        Instance.new("UICorner", particle).CornerRadius = UDim.new(1, 0)
        particle.Parent = particleHolder

        local dx = math.cos(angle) * dist
        local dy = math.sin(angle) * dist

        TweenService:Create(particle,
            TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            {
                Position               = UDim2.new(0, originX + dx, 0, originY + dy),
                BackgroundTransparency = 1,
                Size                   = UDim2.fromOffset(size * 0.3, size * 0.3),
            }
        ):Play()

        task.delay(duration + 0.05, function()
            if particle and particle.Parent then particle:Destroy() end
        end)
    end
end

-- ─── Shockwave ───────────────────────────────────────────
local function shockwave(cx, cy)
    local ring = Instance.new("Frame")
    ring.Size                   = UDim2.fromOffset(30, 30)
    ring.Position               = UDim2.new(0, cx - 15, 0, cy - 15)
    ring.BackgroundTransparency = 1
    ring.ZIndex                 = 15
    ring.Parent                 = introGui
    Instance.new("UICorner", ring).CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke", ring)
    stroke.Color        = C.accent2
    stroke.Thickness    = 3
    stroke.Transparency = 0

    TweenService:Create(ring,
        TweenInfo.new(1.0, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {
            Size     = UDim2.fromOffset(750, 750),
            Position = UDim2.new(0, cx - 375, 0, cy - 375),
        }
    ):Play()
    TweenService:Create(stroke,
        TweenInfo.new(1.0, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { Transparency = 1, Thickness = 0.4 }
    ):Play()

    task.delay(1.1, function()
        if ring.Parent then ring:Destroy() end
    end)
end

-- ─── Title letters ───────────────────────────────────────
local TITLE_TEXT = "DRUN"
local letterList = {}

local startPositions = {
    UDim2.new(-1.2, 0, 0.5, -60),
    UDim2.new(0.5, 0, -1.5, 0),
    UDim2.new(2.2, 0, 0.5, -60),
    UDim2.new(0.5, 0, 2.5, 0),
    UDim2.new(0.5, 0, -1.0, 0),
}
local startRotations = { -35, 25, 40, -30, 15 }

for i = 1, #TITLE_TEXT do
    local ch = TITLE_TEXT:sub(i, i)

    local L = Instance.new("TextLabel")
    L.BackgroundTransparency = 1
    L.Font                   = Enum.Font.GothamBlack
    L.Text                   = ch
    L.TextSize               = 96
    L.TextColor3             = C.text
    L.TextXAlignment         = Enum.TextXAlignment.Center
    L.TextYAlignment         = Enum.TextYAlignment.Center
    L.TextTransparency       = 1
    L.Size                   = UDim2.new(0, 60, 0, 120)
    L.AnchorPoint            = Vector2.new(0.5, 0.5)
    L.Position               = startPositions[i]
    L.Rotation               = startRotations[i]
    L.ZIndex                 = 11
    L.Parent                 = letterHolder

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1.0, C.accent2),
    })
    grad.Rotation = 20
    grad.Parent   = L

    -- Soft glow via UIStroke (works on text too)
    local glow = Instance.new("UIStroke", L)
    glow.Color        = C.accent2
    glow.Thickness    = 0.5
    glow.Transparency = 0.85

    letterList[i] = L
end

-- ─── RGB glitch ghost flash ──────────────────────────────
local function rgbGlitchFlash()
    for _, L in ipairs(letterList) do
        if not L.Parent then continue end

        local red = L:Clone()
        red.TextColor3       = Color3.fromRGB(255, 60, 60)
        red.TextTransparency = 0.55
        red.Position         = L.Position + UDim2.new(0, -3, 0, 0)
        red.ZIndex           = 9
        for _, c in ipairs(red:GetChildren()) do
            if c:IsA("UIGradient") or c:IsA("UIStroke") then c:Destroy() end
        end
        red.Parent = introGui

        local blue = L:Clone()
        blue.TextColor3       = Color3.fromRGB(60, 160, 255)
        blue.TextTransparency = 0.55
        blue.Position         = L.Position + UDim2.new(0, 3, 0, 0)
        blue.ZIndex           = 9
        for _, c in ipairs(blue:GetChildren()) do
            if c:IsA("UIGradient") or c:IsA("UIStroke") then c:Destroy() end
        end
        blue.Parent = introGui

        TweenService:Create(red,
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { TextTransparency = 1 }
        ):Play()
        TweenService:Create(blue,
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { TextTransparency = 1 }
        ):Play()

        task.delay(0.4, function()
            if red.Parent  then red:Destroy()  end
            if blue.Parent then blue:Destroy() end
        end)
    end
end

-- ─── Random micro-glitches while loading ─────────────────
local function randomGlitchLoop()
    task.wait(2.2)
    while SNOW_ACTIVE do
        task.wait(math.random(15, 40) / 10)
        if not SNOW_ACTIVE then break end
        local L = letterList[math.random(1, #letterList)]
        if L and L.Parent then
            local p, c, r = L.Position, L.TextColor3, L.Rotation
            L.Position   = p + UDim2.new(0, math.random(-4, 4), 0, math.random(-4, 4))
            L.TextColor3 = Color3.fromRGB(255, 100, 100)
            L.Rotation   = r + math.random(-3, 3)
            task.wait(0.04)
            if L.Parent then
                L.Position   = p
                L.TextColor3 = c
                L.Rotation   = r
            end
        end
    end
end

-- ─── Main intro sequence ─────────────────────────────────
local introDone = false
local INTRO_DURATION = 5.6

task.spawn(function()
    pcall(function()
        local cam = workspace.CurrentCamera
        local vp  = cam and cam.ViewportSize or Vector2.new(1920, 1080)
        local cx  = vp.X / 2
        local cy  = vp.Y / 2 - 30

        -- Reveal loading bar
        TweenService:Create(barBg,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { BackgroundTransparency = 0.15 }
        ):Play()

        -- Letters fly in
        for i, L in ipairs(letterList) do
            task.delay((i - 1) * 0.09, function()
                L.TextTransparency = 0

                local spacing    = 62
                local totalWidth = spacing * (#TITLE_TEXT - 1)
                local startX     = -totalWidth / 2

                TweenService:Create(L,
                    TweenInfo.new(0.85, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {
                        Position = UDim2.new(0.5, startX + (i - 1) * spacing, 0.5, 0),
                        Rotation = 0,
                    }
                ):Play()
            end)
        end

        task.wait(#TITLE_TEXT * 0.09 + 0.55)

        -- Big title moment
        emitParticles(cx, cy, 30)
        shockwave(cx, cy)
        rgbGlitchFlash()

        task.spawn(randomGlitchLoop)

        -- Underline grows
        task.wait(0.1)
        TweenService:Create(underline,
            TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Size = UDim2.new(0, 160, 0, 1), BackgroundTransparency = 0.1 }
        ):Play()

        task.wait(0.15)
        TweenService:Create(subtitle,
            TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { TextTransparency = 0 }
        ):Play()

        task.wait(0.2)
        TweenService:Create(dot,
            TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { BackgroundTransparency = 0 }
        ):Play()

        -- Blinking dot
        task.spawn(function()
            while dot.Parent do
                TweenService:Create(dot,
                    TweenInfo.new(1.0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    { BackgroundTransparency = 0.4 }
                ):Play()
                task.wait(1.0)
                TweenService:Create(dot,
                    TweenInfo.new(1.0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    { BackgroundTransparency = 0 }
                ):Play()
                task.wait(1.0)
            end
        end)

        -- Fill loading bar
        TweenService:Create(barFill,
            TweenInfo.new(INTRO_DURATION - 1.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Size = UDim2.new(1, 0, 1, 0) }
        ):Play()

        task.wait(0.1)
        TweenService:Create(statusText,
            TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { TextTransparency = 0 }
        ):Play()

        task.delay(0.7, function() statusText.Text = "drun loader" end)
        task.delay(1.6, function() statusText.Text = "v4.2"        end)
        task.delay(2.4, function() statusText.Text = "by w1xty"    end)
        task.delay(3.0, function()
            statusText.Text       = "ready"
            statusText.TextColor3 = C.accent2
            dot.BackgroundColor3  = C.accent2
        end)

        task.wait(INTRO_DURATION - 3.2)

        -- Exit prep
        TweenService:Create(centerWrap,
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Size = UDim2.new(1, 0, 0, 220), Position = UDim2.new(0, 0, 0.5, -110) }
        ):Play()

        TweenService:Create(dot,
            TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { BackgroundTransparency = 1 }
        ):Play()

        task.wait(0.35)

        emitParticles(cx, cy, 55)

        -- Full-screen flash masks the transition
        local flash = Instance.new("Frame")
        flash.Size                   = UDim2.fromScale(1, 1)
        flash.BackgroundColor3       = C.accent2
        flash.BackgroundTransparency = 1
        flash.BorderSizePixel        = 0
        flash.ZIndex                 = 20
        flash.Parent                 = introGui
        TweenService:Create(flash,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { BackgroundTransparency = 0.85 }
        ):Play()
        task.delay(0.15, function()
            TweenService:Create(flash,
                TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                { BackgroundTransparency = 1 }
            ):Play()
            task.delay(0.4, function()
                if flash.Parent then flash:Destroy() end
            end)
        end)

        gridHolder.Visible = false
        scanHolder.Visible = false
        dot.Visible        = false

        for _, v in ipairs(vignettes) do
            if v.Parent then
                TweenService:Create(v,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                    { BackgroundTransparency = 1 }
                ):Play()
            end
        end

        local collapseT = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

        TweenService:Create(centerWrap, collapseT, {
            Size                   = UDim2.new(0.2, 0, 0, 20),
            Position               = UDim2.new(0.4, 0, 0.5, -10),
            BackgroundTransparency = 1,
        }):Play()

        -- Letters shatter with particle bursts
        for i, L in ipairs(letterList) do
            local abs = L.AbsolutePosition
            local cxL = abs.X + L.AbsoluteSize.X / 2
            local cyL = abs.Y + L.AbsoluteSize.Y / 2

            task.delay(i * 0.03, function()
                emitParticles(cxL, cyL, 12)
            end)

            local rx = math.random(-400, 400)
            local ry = math.random(-400, 400)
            TweenService:Create(L, collapseT, {
                Position         = UDim2.new(0.5, rx, 0.5, ry),
                Rotation         = math.random(-180, 180),
                TextTransparency = 1,
            }):Play()
        end

        for _, obj in ipairs({subtitle, statusText}) do
            TweenService:Create(obj, collapseT, { TextTransparency = 1 }):Play()
        end
        TweenService:Create(underline, collapseT, { BackgroundTransparency = 1 }):Play()
        TweenService:Create(barBg,     collapseT, { BackgroundTransparency = 1 }):Play()
        TweenService:Create(barFill,   collapseT, { BackgroundTransparency = 1 }):Play()

        SNOW_ACTIVE = false

        task.wait(0.55)

        if snowHolder  and snowHolder.Parent  then snowHolder:Destroy()  end
        if emberHolder and emberHolder.Parent then emberHolder:Destroy() end
        if barBg and barBg.Parent then barBg:Destroy() end

        TweenService:Create(introBlur,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Size = 0 }
        ):Play()
        task.wait(0.6)

        if introBlur then introBlur:Destroy() end
        introGui:Destroy()
    end)

    restoreCamera()
    introDone = true
end)

local function sendWebhook(username, userId, status)
    pcall(function()
        local wh   = _xd(_WH_ENC)
        local body = HttpService:JSONEncode({
            embeds = {{
                title  = "Drun Key System",
                color  = status == "success" and 3066993 or 15158332,
                fields = {
                    { name = "Username", value = username,               inline = true  },
                    { name = "User ID",  value = tostring(userId),       inline = true  },
                    { name = "Status",   value = status == "success" and "✅ Key Accepted" or "❌ Invalid Key", inline = false },
                    { name = "Game",     value = tostring(game.PlaceId), inline = true  },
                    { name = "PID",      value = tostring(math.random(10000,99999)), inline = true },
                },
                footer = { text = "Drun v1.0 • " .. os.date("%Y-%m-%d %H:%M:%S") }
            }}
        })
        game:HttpPost(wh, body, false, "application/json")
        wh = nil
    end)
end

local function sendScriptChoiceWebhook(username, userId, scriptName, scriptIndex, sessionTime)
    pcall(function()
        local wh   = _xd(_WH_ENC)
        local body = HttpService:JSONEncode({
            embeds = {{
                title  = "Drun Key System — Выбор скрипта",
                color  = 3447003,
                fields = {
                    { name = "Username",     value = username,                                   inline = true  },
                    { name = "User ID",      value = tostring(userId),                           inline = true  },
                    { name = "Скрипт",       value = "[" .. scriptIndex .. "] " .. scriptName,  inline = false },
                    { name = "Время сессии", value = string.format("%.1f сек", sessionTime),    inline = true  },
                    { name = "Game",         value = tostring(game.PlaceId),                     inline = true  },
                },
                footer = { text = "Drun v1.0 • " .. os.date("%Y-%m-%d %H:%M:%S") }
            }}
        })
        game:HttpPost(wh, body, false, "application/json")
        wh = nil
    end)
end

local function typeText(label, text, speed)
    speed = speed or 0.04
    label.Text = ""
    for i = 1, #text do
        label.Text = string.sub(text, 1, i)
        task.wait(speed)
    end
end

repeat task.wait(0.05) until introDone

local theme = getTheme()

local screenGui = Instance.new("ScreenGui")
screenGui.Name         = "DrunSystem"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 50
screenGui.Parent       = game.CoreGui

local blur = Instance.new("BlurEffect")
blur.Size   = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = 20 }):Play()

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local BASE_W, BASE_H = 600, 400

local function getScale()
    local cam = workspace.CurrentCamera
    local vp  = cam and cam.ViewportSize or Vector2.new(1920, 1080)
    local margin = 40
    local sx = (vp.X - margin) / BASE_W
    local sy = (vp.Y - margin) / BASE_H
    local s  = math.min(sx, sy, 1)
    if s < 0.35 then s = 0.35 end
    return s
end

local mainFrame = Instance.new("Frame")
mainFrame.Name             = "MainFrame"
mainFrame.Parent           = screenGui
mainFrame.BackgroundColor3 = theme.bg
mainFrame.Size             = UDim2.new(0, BASE_W, 0, BASE_H)
mainFrame.Position         = UDim2.new(0.5, -BASE_W / 2, 0.5, -BASE_H / 2)
mainFrame.ClipsDescendants = true
mainFrame.BackgroundTransparency = 1
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local uiScale = Instance.new("UIScale")
uiScale.Scale  = getScale() * currentSettings.uiScale
uiScale.Parent = mainFrame

local cam = workspace.CurrentCamera
if cam then
    cam:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        if uiScale and uiScale.Parent then
            uiScale.Scale = getScale() * currentSettings.uiScale
        end
    end)
end

local TB_H = 36

local titleBar = Instance.new("Frame")
titleBar.Name             = "TitleBar"
titleBar.Parent           = mainFrame
titleBar.BackgroundColor3 = theme.titleBar
titleBar.BorderSizePixel  = 0
titleBar.Size             = UDim2.new(1, 0, 0, TB_H)
titleBar.BackgroundTransparency = 1
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 8)

local tbGrad = Instance.new("UIGradient", titleBar)
tbGrad.Rotation = 90
tbGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(180,180,180)),
})
tbGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0.0, 0.0),
    NumberSequenceKeypoint.new(1.0, 0.08),
})

local tbAccentBar = Instance.new("Frame", titleBar)
tbAccentBar.Name             = "AccentBar"
tbAccentBar.Size             = UDim2.new(0, 2, 0, TB_H - 12)
tbAccentBar.Position         = UDim2.new(0, 0, 0.5, -(TB_H - 12) / 2)
tbAccentBar.BackgroundColor3 = theme.accent
tbAccentBar.BorderSizePixel  = 0
tbAccentBar.ZIndex           = 2
Instance.new("UICorner", tbAccentBar).CornerRadius = UDim.new(1, 0)

local titleIcon = Instance.new("ImageLabel")
titleIcon.Parent                 = titleBar
titleIcon.BackgroundTransparency = 1
titleIcon.Size                   = UDim2.new(0, 16, 0, 16)
titleIcon.AnchorPoint            = Vector2.new(0, 0.5)
titleIcon.Position               = UDim2.new(0, 10, 0.5, 0)
titleIcon.Image                  = "rbxassetid://95413852871898"
titleIcon.ImageTransparency      = 1

local titleText = Instance.new("TextLabel")
titleText.Name                   = "TitleText"
titleText.Parent                 = titleBar
titleText.BackgroundTransparency = 1
titleText.Size                   = UDim2.new(1, -220, 1, 0)
titleText.Position               = UDim2.new(0, 30, 0, 0)
titleText.Text                   = "Administrator: Drun"
titleText.Font                   = Enum.Font.GothamMedium
titleText.TextColor3             = theme.text
titleText.TextSize               = 13
titleText.TextXAlignment         = Enum.TextXAlignment.Left
titleText.TextTransparency       = 1

local function makeTitleBtn(offsetX, iconName, iconSz, hoverColor, callback)
    iconSz = iconSz or 16
    local btn = Instance.new("TextButton", titleBar)
    btn.Size                   = UDim2.new(0, 32, 1, 0)
    btn.Position               = UDim2.new(1, offsetX, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text                   = ""
    btn.TextSize               = 0
    btn.AutoButtonColor        = false

    local ic = Instance.new("ImageLabel", btn)
    ic.Name                   = "Icon"
    ic.BackgroundTransparency = 1
    ic.Size                   = UDim2.fromOffset(iconSz, iconSz)
    ic.AnchorPoint            = Vector2.new(0.5, 0.5)
    ic.Position               = UDim2.new(0.5, 0, 0.5, 0)
    ic.ImageColor3            = theme.muted
    ic.ImageTransparency      = 1
    ic.ScaleType              = Enum.ScaleType.Fit

    local asset = lucideAsset(iconName, 48)
    if asset then
        ic.Image           = asset.Url
        ic.ImageRectSize   = asset.ImageRectSize
        ic.ImageRectOffset = asset.ImageRectOffset
    end

    btn.MouseEnter:Connect(function()
        ic.ImageColor3 = hoverColor or theme.text
    end)
    btn.MouseLeave:Connect(function()
        ic.ImageColor3 = theme.muted
    end)

    if callback then
        btn.MouseButton1Click:Connect(callback)
    end

    return btn, ic
end

local backBtn, backIcon         = makeTitleBtn(-152, "arrow-left", 16)
backBtn.Visible = false

local settingsBtn, settingsIcon = makeTitleBtn(-152, "settings", 16)

local titleSep = Instance.new("Frame", titleBar)
titleSep.Name                   = "Separator"
titleSep.Size                   = UDim2.new(0, 1, 0, 18)
titleSep.AnchorPoint            = Vector2.new(0, 0.5)
titleSep.Position               = UDim2.new(1, -116, 0.5, 0)
titleSep.BackgroundColor3       = theme.muted
titleSep.BackgroundTransparency = 0.6
titleSep.BorderSizePixel        = 0

local minBtn, minIcon = makeTitleBtn(-112, "minus", 16)
local maxBtn, maxIcon = makeTitleBtn(-76, "maximize-2", 14)

local closeBtn, closeIcon = makeTitleBtn(-40, "x", 16, Color3.fromRGB(255, 70, 70))
closeBtn.MouseEnter:Connect(function()
    closeIcon.ImageColor3 = Color3.fromRGB(255, 70, 70)
end)
closeBtn.MouseLeave:Connect(function()
    closeIcon.ImageColor3 = theme.muted
end)

do
    local dragging, dragInput, dragStart, startPos
    local function upd(inp)
        local d = inp.Position - dragStart
        mainFrame.Position = UDim2.new(
            mainFrame.Position.X.Scale, startPos.X.Offset + d.X,
            mainFrame.Position.Y.Scale, startPos.Y.Offset + d.Y
        )
    end
    titleBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = inp.Position; startPos = mainFrame.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    titleBar.InputChanged:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseMovement
        or inp.UserInputType == Enum.UserInputType.Touch then
            dragInput = inp
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp == dragInput then upd(inp) end
    end)
end

local normalSize  = mainFrame.Size
local isMinimized = false
minBtn.MouseButton1Click:Connect(function()
    if not isMinimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Size = UDim2.new(0, BASE_W, 0, TB_H) }):Play()
        isMinimized = true
    end
end)
maxBtn.MouseButton1Click:Connect(function()
    if isMinimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Size = normalSize }):Play()
        isMinimized = false
    end
end)

local pageKey      = Instance.new("Frame")
local pageGame     = Instance.new("Frame")
local pageSelector = Instance.new("ScrollingFrame")
local pageSettings = Instance.new("ScrollingFrame")

local function makePage(frame)
    frame.Parent                 = mainFrame
    frame.BackgroundTransparency = 1
    frame.BackgroundColor3       = theme.bg
    frame.Size                   = UDim2.new(1, 0, 1, -TB_H)
    frame.Position               = UDim2.new(0, 0, 0, TB_H)
    frame.ClipsDescendants       = true
    frame.Visible                = false
end

makePage(pageKey)
makePage(pageGame)
makePage(pageSelector)
makePage(pageSettings)

pageSelector.ScrollBarThickness   = 3
pageSelector.ScrollBarImageColor3 = theme.accent
pageSelector.CanvasSize           = UDim2.new(0, 0, 0, 30)
pageSelector.ScrollingDirection   = Enum.ScrollingDirection.Y
pageSelector.ElasticBehavior      = Enum.ElasticBehavior.Never
pageSelector.BorderSizePixel      = 0

pageSettings.ScrollBarThickness   = 3
pageSettings.ScrollBarImageColor3 = theme.accent
pageSettings.CanvasSize           = UDim2.new(0, 0, 0, 250)
pageSettings.ScrollingDirection   = Enum.ScrollingDirection.Y
pageSettings.ElasticBehavior      = Enum.ElasticBehavior.Never
pageSettings.BorderSizePixel      = 0

local function showPage(page)
    pageKey.Visible      = false
    pageGame.Visible     = false
    pageSelector.Visible = false
    pageSettings.Visible = false
    page.Visible         = true
end

local keyAuthDone = false
local gDone       = false
local selDone     = false

math.randomseed(tick())

local asciiLabel = Instance.new("TextLabel")
asciiLabel.Parent                 = pageKey
asciiLabel.BackgroundTransparency = 1
asciiLabel.Size                   = UDim2.new(1, 0, 0, 120)
asciiLabel.Position               = UDim2.new(0, 0, 0, -10)
asciiLabel.Font                   = Enum.Font.Code
asciiLabel.Text                   = [[
oooooooooo.   ooooooooo.   ooooo     ooo ooooo      ooo
`888'   `Y8b  `888   `Y88. `888'     `8' `888b.     `8'
 888      888  888   .d88'  888       8   8 `88b.    8  
 888      888  888ooo88P'   888       8   8   `88b.  8  
 888      888  888`88b.     888       8   8     `88b.8  
 888     d88'  888  `88b.   `88.    .8'   8       `888  
o888bood8P'   o888o  o888o    `YbodP'    o8o        `8  
]]
asciiLabel.TextColor3     = theme.muted
asciiLabel.TextSize       = 11
asciiLabel.TextWrapped    = true
asciiLabel.TextXAlignment = Enum.TextXAlignment.Center
asciiLabel.TextYAlignment = Enum.TextYAlignment.Center

local credLabel = Instance.new("TextLabel")
credLabel.Parent                 = pageKey
credLabel.BackgroundTransparency = 1
credLabel.Size                   = UDim2.new(1, 0, 0, 18)
credLabel.Position               = UDim2.new(0, 0, 0, 116)
credLabel.Font                   = Enum.Font.Code
credLabel.Text                   = "Drun key system"
credLabel.TextColor3             = theme.text
credLabel.TextSize               = 12
credLabel.TextXAlignment         = Enum.TextXAlignment.Center

local keyLabel = Instance.new("TextLabel")
keyLabel.Parent                 = pageKey
keyLabel.BackgroundTransparency = 1
keyLabel.Position               = UDim2.new(0, 20, 0, 190)
keyLabel.Size                   = UDim2.new(0.85, 0, 0, 22)
keyLabel.Font                   = Enum.Font.Code
keyLabel.RichText               = true
keyLabel.TextColor3             = theme.muted
keyLabel.TextSize               = 12
keyLabel.TextXAlignment         = Enum.TextXAlignment.Left
keyLabel.TextYAlignment         = Enum.TextYAlignment.Center

local keyInput = Instance.new("TextBox")
keyInput.Parent                 = pageKey
keyInput.BackgroundTransparency = 1
keyInput.TextTransparency       = 1
keyInput.ClearTextOnFocus       = false
keyInput.Text                   = ""
keyInput.Font                   = Enum.Font.Code
keyInput.TextSize               = 12
keyInput.Size                   = keyLabel.Size
keyInput.Position               = keyLabel.Position
keyInput.PlaceholderText        = ""

local gHdr = Instance.new("TextLabel")
gHdr.Parent                 = pageGame
gHdr.BackgroundTransparency = 1
gHdr.Size                   = UDim2.new(1, -20, 0, 30)
gHdr.Position               = UDim2.new(0, 10, 0, 60)
gHdr.Font                   = Enum.Font.Code
gHdr.RichText               = true
gHdr.Text                   = '[<font color="rgb(255,0,0)">—</font>] Choose a game:'
gHdr.TextColor3             = theme.text
gHdr.TextSize               = 16
gHdr.TextXAlignment         = Enum.TextXAlignment.Left

local gPrompt = Instance.new("TextLabel")
gPrompt.Parent                 = pageGame
gPrompt.BackgroundTransparency = 1
gPrompt.Size                   = UDim2.new(1, -20, 0, 20)
gPrompt.Position               = UDim2.new(0, 10, 0, 100)
gPrompt.Font                   = Enum.Font.Code
gPrompt.RichText               = true
gPrompt.Text                   = '[<font color="rgb(255,0,0)">—</font>] Type a game name and press Enter:'
gPrompt.TextColor3             = theme.muted
gPrompt.TextSize               = 12
gPrompt.TextXAlignment         = Enum.TextXAlignment.Left

local gLabel = Instance.new("TextLabel")
gLabel.Parent                 = pageGame
gLabel.BackgroundTransparency = 1
gLabel.Size                   = UDim2.new(0.85, 0, 0, 22)
gLabel.Position               = UDim2.new(0, 10, 0, 130)
gLabel.Font                   = Enum.Font.Code
gLabel.RichText               = true
gLabel.TextColor3             = theme.muted
gLabel.TextSize               = 12
gLabel.TextXAlignment         = Enum.TextXAlignment.Left

local gInput = Instance.new("TextBox")
gInput.Parent                 = pageGame
gInput.BackgroundTransparency = 1
gInput.TextTransparency       = 1
gInput.ClearTextOnFocus       = false
gInput.Text                   = ""
gInput.Font                   = Enum.Font.Code
gInput.TextSize               = 12
gInput.Size                   = gLabel.Size
gInput.Position               = gLabel.Position
gInput.PlaceholderText        = ""

local gStatus = Instance.new("TextLabel")
gStatus.Parent                 = pageGame
gStatus.BackgroundTransparency = 1
gStatus.Size                   = UDim2.new(1, -20, 0, 22)
gStatus.Position               = UDim2.new(0, 10, 0, 162)
gStatus.Font                   = Enum.Font.Code
gStatus.RichText               = true
gStatus.Text                   = ""
gStatus.TextColor3             = theme.muted
gStatus.TextSize               = 12
gStatus.TextXAlignment         = Enum.TextXAlignment.Left

local gameListFrame = Instance.new("Frame")
gameListFrame.Parent                 = pageGame
gameListFrame.BackgroundTransparency = 1
gameListFrame.BackgroundColor3       = theme.bg
gameListFrame.Size                   = UDim2.new(1, -20, 0, #_GAMES * 22)
gameListFrame.Position               = UDim2.new(0, 10, 0, 195)

for i, g in ipairs(_GAMES) do
    local btn = Instance.new("TextButton")
    btn.Name                   = "GameRow_" .. i
    btn.Parent                 = gameListFrame
    btn.Size                   = UDim2.new(1, 0, 0, 20)
    btn.Position               = UDim2.new(0, 0, 0, (i - 1) * 22)
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel        = 0
    btn.AutoButtonColor        = false
    btn.RichText               = true
    btn.Font                   = Enum.Font.Code
    btn.TextSize               = 12
    btn.TextXAlignment         = Enum.TextXAlignment.Left
    btn.TextYAlignment         = Enum.TextYAlignment.Center
    btn.TextColor3             = theme.muted
    btn.Text                   = string.format('[<font color="rgb(255,0,0)">—</font>] [%d] %s', i, g.name)

    btn.MouseEnter:Connect(function()
        btn.TextColor3 = theme.text
        btn.Text = string.format(
            '[<font color="rgb(255,0,0)">—</font>] [%d] <font color="rgb(%d,%d,%d)">%s</font> <font color="rgb(%d,%d,%d)">◄</font>',
            i,
            math.floor(theme.accent2.R * 255), math.floor(theme.accent2.G * 255), math.floor(theme.accent2.B * 255),
            g.name,
            math.floor(theme.accent.R * 255), math.floor(theme.accent.G * 255), math.floor(theme.accent.B * 255)
        )
    end)
    btn.MouseLeave:Connect(function()
        btn.TextColor3 = theme.muted
        btn.Text = string.format('[<font color="rgb(255,0,0)">—</font>] [%d] %s', i, g.name)
    end)
    btn.MouseButton1Click:Connect(function()
        gInput.Text = g.name
    end)
end

local selHdr = Instance.new("TextLabel")
selHdr.Parent                 = pageSelector
selHdr.BackgroundTransparency = 1
selHdr.Size                   = UDim2.new(1, -20, 0, 22)
selHdr.Position               = UDim2.new(0, 10, 0, 8)
selHdr.Font                   = Enum.Font.Code
selHdr.RichText               = true
selHdr.Text                   = '[<font color="rgb(255,0,0)">—</font>] Choose a script to inject:'
selHdr.TextColor3             = theme.text
selHdr.TextSize               = 13
selHdr.TextXAlignment         = Enum.TextXAlignment.Left

local listFrame = Instance.new("ScrollingFrame")
listFrame.Parent                 = pageSelector
listFrame.BackgroundTransparency = 1
listFrame.BorderSizePixel        = 0
listFrame.Size                   = UDim2.new(1, -20, 0, 200)
listFrame.Position               = UDim2.new(0, 10, 0, 35)
listFrame.ScrollBarThickness     = 3
listFrame.ScrollBarImageColor3   = theme.accent
listFrame.CanvasSize             = UDim2.new(0, 0, 0, 30)
listFrame.ScrollingDirection     = Enum.ScrollingDirection.Y
listFrame.ElasticBehavior        = Enum.ElasticBehavior.Never

local selInput = Instance.new("TextBox")

local selPrompt = Instance.new("TextLabel")
selPrompt.Parent                 = pageSelector
selPrompt.BackgroundTransparency = 1
selPrompt.Size                   = UDim2.new(1, -20, 0, 20)
selPrompt.Position               = UDim2.new(0, 10, 0, 240)
selPrompt.Font                   = Enum.Font.Code
selPrompt.RichText               = true
selPrompt.Text                   = '[<font color="rgb(255,0,0)">—</font>] Type name and press Enter:'
selPrompt.TextColor3             = theme.muted
selPrompt.TextSize               = 12
selPrompt.TextXAlignment         = Enum.TextXAlignment.Left

local selLabel = Instance.new("TextLabel")
selLabel.Parent                 = pageSelector
selLabel.BackgroundTransparency = 1
selLabel.Size                   = UDim2.new(0.85, 0, 0, 22)
selLabel.Position               = UDim2.new(0, 10, 0, 262)
selLabel.Font                   = Enum.Font.Code
selLabel.RichText               = true
selLabel.TextColor3             = theme.muted
selLabel.TextSize               = 12
selLabel.TextXAlignment         = Enum.TextXAlignment.Left

selInput.Parent                 = pageSelector
selInput.BackgroundTransparency = 1
selInput.TextTransparency       = 1
selInput.ClearTextOnFocus       = false
selInput.Text                   = ""
selInput.Font                   = Enum.Font.Code
selInput.TextSize               = 12
selInput.Size                   = selLabel.Size
selInput.Position               = selLabel.Position
selInput.PlaceholderText        = ""

local selStatus = Instance.new("TextLabel")
selStatus.Parent                 = pageSelector
selStatus.BackgroundTransparency = 1
selStatus.Size                   = UDim2.new(1, -20, 0, 22)
selStatus.Position               = UDim2.new(0, 10, 0, 288)
selStatus.Font                   = Enum.Font.Code
selStatus.RichText               = true
selStatus.Text                   = ""
selStatus.TextColor3             = theme.muted
selStatus.TextSize               = 12
selStatus.TextXAlignment         = Enum.TextXAlignment.Left

local barLabel = Instance.new("TextLabel")
barLabel.Parent                 = pageSelector
barLabel.BackgroundTransparency = 1
barLabel.Size                   = UDim2.new(1, -20, 0, 18)
barLabel.Position               = UDim2.new(0, 10, 0, 310)
barLabel.Font                   = Enum.Font.Code
barLabel.RichText               = true
barLabel.Text                   = ""
barLabel.TextColor3             = theme.text
barLabel.TextSize               = 13
barLabel.TextXAlignment         = Enum.TextXAlignment.Left
barLabel.Visible                = false

local setHdr = Instance.new("TextLabel")
setHdr.Parent                 = pageSettings
setHdr.BackgroundTransparency = 1
setHdr.Size                   = UDim2.new(1, -20, 0, 24)
setHdr.Position               = UDim2.new(0, 10, 0, 10)
setHdr.Font                   = Enum.Font.Code
setHdr.RichText               = true
setHdr.Text                   = '[<font color="rgb(255,0,0)">—</font>] Settings'
setHdr.TextColor3             = theme.text
setHdr.TextSize               = 15
setHdr.TextXAlignment         = Enum.TextXAlignment.Left

local setThemeLbl = Instance.new("TextLabel")
setThemeLbl.Parent                 = pageSettings
setThemeLbl.BackgroundTransparency = 1
setThemeLbl.Size                   = UDim2.new(1, -20, 0, 18)
setThemeLbl.Position               = UDim2.new(0, 10, 0, 10)
setThemeLbl.Font                   = Enum.Font.Code
setThemeLbl.Text                   = ""
setThemeLbl.TextColor3             = theme.muted
setThemeLbl.TextSize               = 12
setThemeLbl.TextXAlignment         = Enum.TextXAlignment.Left

local applyThemeToUI
local themeButtons = {}

local function makeCmdRow(parent, yPos, labelText, onClick)
    local row = Instance.new("TextButton")
    row.Parent                 = parent
    row.Size                   = UDim2.new(1, -20, 0, 20)
    row.Position               = UDim2.new(0, 10, 0, yPos)
    row.BackgroundTransparency = 1
    row.BorderSizePixel        = 0
    row.AutoButtonColor        = false
    row.RichText               = true
    row.Font                   = Enum.Font.Code
    row.TextSize               = 12
    row.TextXAlignment         = Enum.TextXAlignment.Left
    row.TextYAlignment         = Enum.TextYAlignment.Center
    row.TextColor3             = theme.muted
    row.Text                   = string.format('[<font color="rgb(255,0,0)">—</font>] %s', labelText)

    local baseLabel = labelText
    row.MouseEnter:Connect(function()
        row.TextColor3 = theme.text
        row.Text = string.format(
            '[<font color="rgb(255,0,0)">—</font>] <font color="rgb(%d,%d,%d)">%s</font> <font color="rgb(%d,%d,%d)">◄</font>',
            math.floor(theme.accent2.R * 255), math.floor(theme.accent2.G * 255), math.floor(theme.accent2.B * 255),
            baseLabel,
            math.floor(theme.accent.R * 255), math.floor(theme.accent.G * 255), math.floor(theme.accent.B * 255)
        )
    end)
    row.MouseLeave:Connect(function()
        row.TextColor3 = theme.muted
        row.Text = string.format('[<font color="rgb(255,0,0)">—</font>] %s', baseLabel)
    end)
    row.MouseButton1Click:Connect(onClick)
    return row
end

local function buildThemeButtons()
    for _, btn in ipairs(themeButtons) do btn:Destroy() end
    themeButtons = {}
    local names = {"Blue", "Red", "Green"}
    for i, name in ipairs(names) do
        local isActive = currentSettings.theme == name
        local label    = isActive and (name .. " [active]") or name
        local row = makeCmdRow(pageSettings, 32 + (i - 1) * 22, label, function()
            currentSettings.theme = name
            saveSettings()
            applyThemeToUI()
            buildThemeButtons()
        end)
        row.Name = "ThemeBtn_" .. name
        if isActive then
            row.TextColor3 = theme.accent
            row.Text = string.format(
                '[<font color="rgb(255,0,0)">—</font>] <font color="rgb(%d,%d,%d)">%s [active]</font>',
                math.floor(theme.accent.R * 255), math.floor(theme.accent.G * 255), math.floor(theme.accent.B * 255),
                name
            )
        end
        table.insert(themeButtons, row)
    end
end

local setScaleLbl = Instance.new("TextLabel")
setScaleLbl.Parent                 = pageSettings
setScaleLbl.BackgroundTransparency = 1
setScaleLbl.Size                   = UDim2.new(1, -20, 0, 18)
setScaleLbl.Position               = UDim2.new(0, 10, 0, 116)
setScaleLbl.Font                   = Enum.Font.Code
setScaleLbl.Text                   = "UI Scale: " .. string.format("%.2f", currentSettings.uiScale)
setScaleLbl.TextColor3             = theme.muted
setScaleLbl.TextSize               = 12
setScaleLbl.TextXAlignment         = Enum.TextXAlignment.Left

local scaleDownBtn = makeCmdRow(pageSettings, 138, "scale --", function() end)
local scaleUpBtn   = makeCmdRow(pageSettings, 160, "scale ++", function() end)
local resetBtn     = makeCmdRow(pageSettings, 182, "reset to defaults", function() end)

local scaleValue = Instance.new("TextLabel")
scaleValue.Parent                 = pageSettings
scaleValue.BackgroundTransparency = 1
scaleValue.Size                   = UDim2.new(1, -20, 0, 18)
scaleValue.Position               = UDim2.new(0, 10, 0, 138)
scaleValue.Font                   = Enum.Font.Code
scaleValue.TextColor3             = theme.muted
scaleValue.TextSize               = 12
scaleValue.Text                   = string.format('[<font color="rgb(255,0,0)">—</font>] scale: %.2f', currentSettings.uiScale)
scaleValue.RichText               = true
scaleValue.TextXAlignment         = Enum.TextXAlignment.Left
scaleValue.Visible                = false

local function applyUIScale()
    if uiScale and uiScale.Parent then
        uiScale.Scale = getScale() * currentSettings.uiScale
    end
    setScaleLbl.Text = "UI Scale: " .. string.format("%.2f", currentSettings.uiScale)
end

local function refreshScaleRows()
    local function makeLabel(sym)
        return string.format("scale %s  [%.2f]", sym, currentSettings.uiScale)
    end
    scaleDownBtn.Text = string.format('[<font color="rgb(255,0,0)">—</font>] %s', makeLabel("--"))
    scaleUpBtn.Text   = string.format('[<font color="rgb(255,0,0)">—</font>] %s', makeLabel("++"))
end

refreshScaleRows()

scaleDownBtn.MouseButton1Click:Connect(function()
    currentSettings.uiScale = math.max(0.5, currentSettings.uiScale - 0.05)
    saveSettings()
    applyUIScale()
    refreshScaleRows()
end)
scaleUpBtn.MouseButton1Click:Connect(function()
    currentSettings.uiScale = math.min(1.5, currentSettings.uiScale + 0.05)
    saveSettings()
    applyUIScale()
    refreshScaleRows()
end)
resetBtn.MouseButton1Click:Connect(function()
    for k, v in pairs(DEFAULT_SETTINGS) do currentSettings[k] = v end
    saveSettings()
    applyUIScale()
    refreshScaleRows()
    buildThemeButtons()
end)

UserInputService.MouseBehavior    = Enum.MouseBehavior.Default
UserInputService.MouseIconEnabled = true

local cursorConn
cursorConn = RunService.RenderStepped:Connect(function()
    if not isMobile then
        UserInputService.MouseBehavior    = Enum.MouseBehavior.Default
        UserInputService.MouseIconEnabled = true
    end
end)

local function pointInGui(gui, mp)
    if not gui or not gui.Visible then return false end
    local lp, ls = gui.AbsolutePosition, gui.AbsoluteSize
    return mp.X >= lp.X and mp.X <= lp.X + ls.X
       and mp.Y >= lp.Y and mp.Y <= lp.Y + ls.Y
end

local function handleFocusInput(inp)
    local mp = inp.Position
    if pageKey.Visible and pointInGui(keyLabel, mp) then
        keyInput:CaptureFocus()
    elseif pageGame.Visible and pointInGui(gLabel, mp) then
        gInput:CaptureFocus()
    elseif pageSelector.Visible and pointInGui(selLabel, mp) then
        selInput:CaptureFocus()
    end
end

UserInputService.InputBegan:Connect(function(inp, proc)
    if proc then return end
    if inp.UserInputType == Enum.UserInputType.MouseButton1
    or inp.UserInputType == Enum.UserInputType.Touch then
        handleFocusInput(inp)
    end
end)

local localPlayer = Players.LocalPlayer

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(blur, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = 0 }):Play()
    task.delay(0.35, function()
        if blur and blur.Parent then blur:Destroy() end
    end)
    if cursorConn then
        pcall(function() cursorConn:Disconnect() end)
        cursorConn = nil
    end
    restoreCamera()
    screenGui:Destroy()
end)

local VALID_KEYS = {
    ["вф"]  = true,
    ["da"]  = true,
    ["да"]  = true,
}

local VALIDATE_URL = "https://api.sunkamil.serv00.net/api/panel/keys/validate"

local typedKey = ""
local keyBlink = true

local function updateKeyLabel()
    local cur = keyBlink and "▁" or ""
    keyLabel.Text = string.format(
        '[<font color="rgb(255,0,0)">—</font>] Key: <font color="rgb(200,200,200)">%s</font><font color="rgb(255,255,255)">%s</font>',
        typedKey, cur
    )
end

task.spawn(function()
    while not keyAuthDone do
        keyBlink = not keyBlink
        updateKeyLabel()
        task.wait(0.5)
    end
end)

keyInput:GetPropertyChangedSignal("Text"):Connect(function()
    typedKey = keyInput.Text
    updateKeyLabel()
end)

keyInput.FocusLost:Connect(function(entered)
    typedKey = keyInput.Text
    updateKeyLabel()
    if not entered then return end
    if #typedKey < 1 then return end

    local username = localPlayer.Name
    local userId   = localPlayer.UserId

    task.spawn(function()
        typeText(keyLabel, "[—] Checking key...", 0.03)
    end)
    task.wait(0.4)

    local valid = VALID_KEYS[typedKey] == true

    if not valid then
        task.spawn(function() sendWebhook(username, userId, "fail") end)
        task.spawn(function() typeText(keyLabel, "[—] Invalid Key (" .. username .. ")", 0.03) end)
        task.wait(2)
        keyInput.Text = ""
        typedKey      = ""
        keyBlink      = true
        keyAuthDone   = false
        updateKeyLabel()
        keyInput:CaptureFocus()
        return
    end

    local banned = false
    task.spawn(function()
        local ok, resp = pcall(function()
            return game:HttpPost(VALIDATE_URL,
                HttpService:JSONEncode({ key = typedKey }),
                false, "application/json")
        end)
        if ok and resp and resp ~= "" then
            local decodeOk, decoded = pcall(HttpService.JSONDecode, HttpService, resp)
            if decodeOk and decoded and decoded.reason == "banned" then
                banned = true
            end
        end
    end)
    task.wait(1)

    if banned then
        task.spawn(function() sendWebhook(username, userId, "fail") end)
        task.spawn(function() typeText(keyLabel, "[—] You are banned.", 0.03) end)
        task.wait(2)
        keyInput.Text = ""
        typedKey      = ""
        keyBlink      = true
        keyAuthDone   = false
        updateKeyLabel()
        keyInput:CaptureFocus()
        return
    end

    keyAuthDone  = true
    sessionStart = tick()
    task.spawn(function() sendWebhook(username, userId, "success") end)
    task.spawn(function()
        typeText(keyLabel, "[—] Authenticating Your Drun Key... (" .. username .. ")", 0.03)
    end)
    task.wait(2)
    task.spawn(function()
        typeText(keyLabel, "[—] Verified. Loading next step...", 0.03)
    end)
    task.wait(1)
    titleText.Text = "Administrator: Drun"
    showPage(pageGame)
    task.wait(0.1)
    gInput:CaptureFocus()
end)

local typedG    = ""
local gBlink    = true
local currentGame = nil

local function updateGLabel()
    local cur = gBlink and "_" or ""
    gLabel.Text = string.format(
        '[<font color="rgb(255,0,0)">—</font>] Game: <font color="rgb(200,200,200)">%s</font><font color="rgb(255,255,255)">%s</font>',
        typedG, cur
    )
end

task.spawn(function()
    while not gDone do
        gBlink = not gBlink
        updateGLabel()
        task.wait(0.5)
    end
end)

gInput:GetPropertyChangedSignal("Text"):Connect(function()
    typedG = gInput.Text
    updateGLabel()
end)

local buildSelectorForGame

gInput.FocusLost:Connect(function(entered)
    typedG = gInput.Text
    updateGLabel()
    if not entered then return end

    local norm = typedG:match("^%s*(.-)%s*$"):lower()
    local gi   = _GAME_ALIASES[norm]
    if not gi then
        for alias, idx in pairs(_GAME_ALIASES) do
            if alias:find(norm, 1, true) or norm:find(alias, 1, true) then
                gi = idx
                break
            end
        end
    end

    if not gi then
        gStatus.RichText = true
        gStatus.Text     = '[<font color="rgb(255,80,80)">—</font>] Unknown game. Try again.'
        gInput.Text      = ""
        typedG           = ""
        updateGLabel()
        gInput:CaptureFocus()
        return
    end

    gDone       = true
    currentGame = _GAMES[gi]
    gStatus.RichText = true
    task.spawn(function()
        typeText(gStatus, "[—] Loading " .. currentGame.name .. "...", 0.03)
    end)
    task.wait(1)
    buildSelectorForGame(currentGame)
    titleText.Text = "Administrator: Drun"
    showPage(pageSelector)
    task.wait(0.1)
    selInput:CaptureFocus()
end)

local typedSel   = ""
local selBlink   = true
local _activeScripts = {}
local _activeAliases = {}

local function updateSelLabel()
    local cur = selBlink and "_" or ""
    selLabel.Text = string.format(
        '[<font color="rgb(255,0,0)">—</font>] Script: <font color="rgb(200,200,200)">%s</font><font color="rgb(255,255,255)">%s</font>',
        typedSel, cur
    )
end

task.spawn(function()
    while not selDone do
        selBlink = not selBlink
        updateSelLabel()
        task.wait(0.5)
    end
end)

selInput:GetPropertyChangedSignal("Text"):Connect(function()
    typedSel = selInput.Text
    updateSelLabel()
end)

buildSelectorForGame = function(selectedGame)
    _activeScripts = selectedGame.scripts or {}
    _activeAliases = {}
    for i, entry in ipairs(_activeScripts) do
        _activeAliases[entry[1]:lower()] = i
        _activeAliases[entry[1]]         = i
    end

    for _, c in ipairs(listFrame:GetChildren()) do
        c:Destroy()
    end

    local ROW_H   = 20
    local ROW_GAP = 2

    listFrame.CanvasSize = UDim2.new(0, 0, 0, #_activeScripts * (ROW_H + ROW_GAP))

    for i, entry in ipairs(_activeScripts) do
        local row = Instance.new("TextButton")
        row.Name                   = "ScriptCard_" .. i
        row.Parent                 = listFrame
        row.Size                   = UDim2.new(1, 0, 0, ROW_H)
        row.Position               = UDim2.new(0, 0, 0, (i - 1) * (ROW_H + ROW_GAP))
        row.BackgroundTransparency = 1
        row.BorderSizePixel        = 0
        row.AutoButtonColor        = false
        row.RichText               = true
        row.Font                   = Enum.Font.Code
        row.TextSize               = 12
        row.TextXAlignment         = Enum.TextXAlignment.Left
        row.TextYAlignment         = Enum.TextYAlignment.Center
        row.TextColor3             = theme.muted
        row.Text                   = string.format(
            '[<font color="rgb(255,0,0)">—</font>] [%d] %s',
            i, entry[1]
        )

        row.MouseEnter:Connect(function()
            row.TextColor3 = theme.text
            row.Text = string.format(
                '[<font color="rgb(255,0,0)">—</font>] [%d] <font color="rgb(%d,%d,%d)">%s</font> <font color="rgb(%d,%d,%d)">◄</font>',
                i,
                math.floor(theme.accent2.R * 255),
                math.floor(theme.accent2.G * 255),
                math.floor(theme.accent2.B * 255),
                entry[1],
                math.floor(theme.accent.R * 255),
                math.floor(theme.accent.G * 255),
                math.floor(theme.accent.B * 255)
            )
        end)
        row.MouseLeave:Connect(function()
            row.TextColor3 = theme.muted
            row.Text = string.format(
                '[<font color="rgb(255,0,0)">—</font>] [%d] %s',
                i, entry[1]
            )
        end)
        row.MouseButton1Click:Connect(function()
            selInput.Text = entry[1]
        end)
    end
end

selInput.FocusLost:Connect(function(entered)
    typedSel = selInput.Text
    updateSelLabel()
    if not entered then return end

    if #_activeScripts == 0 then
        selStatus.RichText = true
        selStatus.Text     = '[<font color="rgb(255,80,80)">—</font>] No scripts for this game yet.'
        selInput.Text      = ""
        typedSel           = ""
        updateSelLabel()
        selInput:CaptureFocus()
        return
    end

    local norm = typedSel:match("^%s*(.-)%s*$")
    local idx  = _activeAliases[norm]
        or _activeAliases[norm:lower()]
        or _activeAliases[norm:sub(1,1):upper() .. norm:sub(2):lower()]

    if not idx then
        selStatus.RichText = true
        selStatus.Text     = '[<font color="rgb(255,80,80)">—</font>] Unknown script. Try again.'
        selInput.Text      = ""
        typedSel           = ""
        updateSelLabel()
        selInput:CaptureFocus()
        return
    end

    selDone = true
    local scriptName = _activeScripts[idx][1]
    local elapsed    = sessionStart and (tick() - sessionStart) or 0

    task.spawn(function()
        sendScriptChoiceWebhook(localPlayer.Name, localPlayer.UserId,
            currentGame.name .. " / " .. scriptName, idx, elapsed)
    end)

    selStatus.Visible = false
    barLabel.Visible  = true
    barLabel.Text     = ""

    local totalBlocks  = 20
    local filledBlocks = 0

    local function renderBar(filled, color)
        color = color or "rgb(255,50,50)"
        local done  = string.rep("█", filled)
        local empty = string.rep("░", totalBlocks - filled)
        local pct   = math.floor((filled / totalBlocks) * 100)
        barLabel.Text = string.format(
            '[<font color="%s">%s</font>%s] %d%%',
            color, done, empty, pct
        )
    end

    renderBar(0)

    local scriptContent, httpErr
    local loaded = false

    task.spawn(function()
        local encUrl = _xd(_activeScripts[idx][2])
        local ok, result = pcall(function() return game:HttpGet(encUrl) end)
        encUrl = nil
        if ok then
            scriptContent = result
        else
            httpErr = tostring(result)
        end
        loaded = true
    end)

    task.spawn(function()
        while not loaded and filledBlocks < 17 do
            task.wait(0.08)
            filledBlocks = filledBlocks + 1
            renderBar(filledBlocks)
        end
    end)

    repeat task.wait(0.05) until loaded

    if httpErr or not scriptContent or scriptContent == "" or scriptContent:sub(1,1) == "<" then
        for i = filledBlocks + 1, totalBlocks do
            task.wait(0.03)
            renderBar(i, "rgb(220,40,40)")
        end
        renderBar(totalBlocks, "rgb(220,40,40)")
        task.wait(0.4)
        barLabel.Visible  = false
        selStatus.Visible = true
        selStatus.RichText = true
        selStatus.Text    = '[<font color="rgb(255,80,80)">—</font>] Error: ' .. (httpErr or "empty response")
        selDone  = false
        selBlink = true
        selInput.Text = ""
        typedSel      = ""
        updateSelLabel()
        selInput:CaptureFocus()
        return
    end

    for i = filledBlocks + 1, totalBlocks do
        task.wait(0.02)
        renderBar(i, "rgb(50,200,50)")
    end
    renderBar(totalBlocks, "rgb(50,200,50)")
    task.wait(0.3)

    TweenService:Create(blur,
        TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        { Size = 0 }
    ):Play()
    TweenService:Create(mainFrame,
        TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
        {
            Position = UDim2.new(
                mainFrame.Position.X.Scale,
                mainFrame.Position.X.Offset,
                mainFrame.Position.Y.Scale + 0.04,
                mainFrame.Position.Y.Offset
            ),
            BackgroundTransparency = 1,
        }
    ):Play()
    for _, obj in ipairs(mainFrame:GetDescendants()) do
        local prop = obj:IsA("TextLabel") and "TextTransparency"
                  or obj:IsA("TextButton") and "TextTransparency"
                  or obj:IsA("ImageLabel") and "ImageTransparency"
                  or (obj:IsA("Frame") and not obj:IsA("ScrollingFrame")) and "BackgroundTransparency"
        if prop then
            TweenService:Create(obj,
                TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                {[prop] = 1}
            ):Play()
        end
    end
    task.wait(0.5)

    if cursorConn then
        pcall(function() cursorConn:Disconnect() end)
        cursorConn = nil
    end
    restoreCamera()
    screenGui:Destroy()
    if blur and blur.Parent then blur:Destroy() end

    UserInputService.MouseBehavior    = Enum.MouseBehavior.Default
    UserInputService.MouseIconEnabled = true

    local fn, err = loadstring(scriptContent)
    if not fn then return end
    pcall(fn)

    UserInputService.MouseBehavior    = Enum.MouseBehavior.Default
    UserInputService.MouseIconEnabled = true
end)

task.spawn(function()
    task.wait(0.05)
    TweenService:Create(mainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 }):Play()
    for _, obj in ipairs(mainFrame:GetDescendants()) do
        local prop = obj:IsA("Frame") and "BackgroundTransparency"
                  or (obj:IsA("TextLabel") or obj:IsA("TextButton")) and "TextTransparency"
                  or obj:IsA("ImageLabel") and "ImageTransparency"
        if prop then
            TweenService:Create(obj, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {[prop] = 0}):Play()
        end
    end
end)

showPage(pageKey)
updateKeyLabel()
updateGLabel()
updateSelLabel()
task.wait(0.1)
keyInput:CaptureFocus()

local watermarkGui = Instance.new("ScreenGui")
watermarkGui.Name           = "DrunWatermark"
watermarkGui.ResetOnSpawn   = false
watermarkGui.IgnoreGuiInset = true
watermarkGui.DisplayOrder   = 999
watermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
watermarkGui.Parent         = game.CoreGui

local wmTheme = getTheme()
local wmBaseW, wmBaseH
local wmTitleSize, wmSubSize, wmPadX, wmPadY, wmAccentW, wmTextWrapH

if isMobile then
    wmBaseW     = 120
    wmBaseH     = 36
    wmTitleSize = 12
    wmSubSize   = 9
    wmPadX      = 8
    wmPadY      = 6
    wmAccentW   = 2
    wmTextWrapH = 22
else
    wmBaseW     = 176
    wmBaseH     = 50
    wmTitleSize = 15
    wmSubSize   = 11
    wmPadX      = 16
    wmPadY      = 6
    wmAccentW   = 3
    wmTextWrapH = 30
end

local wmFrame = Instance.new("Frame")
wmFrame.Name                   = "Watermark"
wmFrame.AnchorPoint            = Vector2.new(0, 1)
wmFrame.Position               = UDim2.new(0, 12, 1, -12)
wmFrame.Size                   = UDim2.new(0, wmBaseW, 0, wmBaseH)
wmFrame.BackgroundColor3       = wmTheme.titleBar
wmFrame.BackgroundTransparency = 0.15
wmFrame.BorderSizePixel        = 0
wmFrame.Active                 = false
wmFrame.Parent                 = watermarkGui

Instance.new("UICorner", wmFrame).CornerRadius = UDim.new(0, 10)

local wmStroke = Instance.new("UIStroke", wmFrame)
wmStroke.Color           = wmTheme.accent
wmStroke.Thickness       = 1
wmStroke.Transparency    = 0.35
wmStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local wmGrad = Instance.new("UIGradient", wmFrame)
wmGrad.Rotation = 90
wmGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, wmTheme.titleBar),
    ColorSequenceKeypoint.new(1.0, wmTheme.bg),
})

local wmAccent = Instance.new("Frame", wmFrame)
wmAccent.AnchorPoint       = Vector2.new(0, 0.5)
wmAccent.Position          = UDim2.new(0, 6, 0.5, 0)
wmAccent.Size              = UDim2.new(0, wmAccentW, 1, -wmPadY * 2)
wmAccent.BackgroundColor3  = wmTheme.accent
wmAccent.BorderSizePixel   = 0
wmAccent.ZIndex            = 2
Instance.new("UICorner", wmAccent).CornerRadius = UDim.new(1, 0)

local wmTextWrap = Instance.new("Frame", wmFrame)
wmTextWrap.BackgroundTransparency = 1
wmTextWrap.AnchorPoint            = Vector2.new(0, 0.5)
wmTextWrap.Position               = UDim2.new(0, wmPadX, 0.5, 0)
wmTextWrap.Size                   = UDim2.new(1, -wmPadX - 8, 0, wmTextWrapH)

local wmTitle = Instance.new("TextLabel", wmTextWrap)
wmTitle.BackgroundTransparency = 1
wmTitle.Position               = UDim2.new(0, 0, 0, 0)
wmTitle.Size                   = UDim2.new(1, 0, 0, wmTitleSize + 3)
wmTitle.Font                   = Enum.Font.GothamBold
wmTitle.Text                   = "Drun loader"
wmTitle.TextSize               = wmTitleSize
wmTitle.TextColor3             = wmTheme.text
wmTitle.TextXAlignment         = Enum.TextXAlignment.Left
wmTitle.TextYAlignment         = Enum.TextYAlignment.Center

local wmTitleGrad = Instance.new("UIGradient", wmTitle)
wmTitleGrad.Rotation = 20
wmTitleGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, wmTheme.text),
    ColorSequenceKeypoint.new(1.0, wmTheme.accent2),
})

local wmSub = Instance.new("TextLabel", wmTextWrap)
wmSub.BackgroundTransparency = 1
wmSub.Position               = UDim2.new(0, 0, 0, wmTitleSize + 2)
wmSub.Size                   = UDim2.new(1, 0, 0, wmSubSize + 2)
wmSub.Font                   = Enum.Font.GothamMedium
wmSub.Text                   = "by @paranoya123"
wmSub.TextSize               = wmSubSize
wmSub.TextColor3             = wmTheme.muted
wmSub.TextXAlignment         = Enum.TextXAlignment.Left
wmSub.TextYAlignment         = Enum.TextYAlignment.Center

local function returnToFlowPage()
    if not keyAuthDone then
        showPage(pageKey)
        task.wait(0.05)
        keyInput:CaptureFocus()
    elseif not gDone then
        showPage(pageGame)
        task.wait(0.05)
        gInput:CaptureFocus()
    else
        showPage(pageSelector)
        task.wait(0.05)
        selInput:CaptureFocus()
    end
end

settingsBtn.MouseButton1Click:Connect(function()
    showPage(pageSettings)
    settingsBtn.Visible = false
    backBtn.Visible     = true
end)

backBtn.MouseButton1Click:Connect(function()
    if pageSettings.Visible then
        returnToFlowPage()
        backBtn.Visible     = false
        settingsBtn.Visible = true
    end
end)

function applyThemeToUI()
    local newTheme = getTheme()

    mainFrame.BackgroundColor3   = newTheme.bg
    titleBar.BackgroundColor3    = newTheme.titleBar
    titleText.TextColor3         = newTheme.text
    tbAccentBar.BackgroundColor3 = newTheme.accent

    settingsIcon.ImageColor3  = newTheme.muted
    minIcon.ImageColor3       = newTheme.muted
    maxIcon.ImageColor3       = newTheme.muted
    closeIcon.ImageColor3     = newTheme.muted
    backIcon.ImageColor3      = newTheme.muted
    titleSep.BackgroundColor3 = newTheme.muted

    asciiLabel.TextColor3 = newTheme.muted
    credLabel.TextColor3  = newTheme.text
    keyLabel.TextColor3   = newTheme.muted
    keyInput.TextColor3   = newTheme.text

    gHdr.TextColor3    = newTheme.text
    gPrompt.TextColor3 = newTheme.muted
    gLabel.TextColor3  = newTheme.muted
    gInput.TextColor3  = newTheme.text
    gStatus.TextColor3 = newTheme.muted
    for _, btn in ipairs(gameListFrame:GetChildren()) do
        if btn:IsA("TextButton") then
            btn.BackgroundColor3 = newTheme.button
            btn.TextColor3       = newTheme.text
        end
    end

    selHdr.TextColor3    = newTheme.text
    selPrompt.TextColor3 = newTheme.muted
    selLabel.TextColor3  = newTheme.muted
    selInput.TextColor3  = newTheme.text
    selStatus.TextColor3 = newTheme.muted
    barLabel.TextColor3  = newTheme.text

    for _, row in ipairs(listFrame:GetChildren()) do
        if row:IsA("TextButton") and row.Name:sub(1, 11) == "ScriptCard_" then
            local idx = tonumber(row.Name:sub(12))
            if idx and _activeScripts[idx] then
                row.TextColor3 = newTheme.muted
                row.Text = string.format(
                    '[<font color="rgb(255,0,0)">—</font>] [%d] %s',
                    idx, _activeScripts[idx][1]
                )
            end
        end
    end

    setHdr.TextColor3             = newTheme.text
    setThemeLbl.TextColor3        = newTheme.muted
    setScaleLbl.TextColor3        = newTheme.muted
    scaleValue.TextColor3         = newTheme.text
    scaleDownBtn.BackgroundColor3 = newTheme.button
    scaleDownBtn.TextColor3       = newTheme.text
    scaleUpBtn.BackgroundColor3   = newTheme.button
    scaleUpBtn.TextColor3         = newTheme.text
    resetBtn.BackgroundColor3     = newTheme.button
    resetBtn.TextColor3           = newTheme.text

    wmStroke.Color            = newTheme.accent
    wmAccent.BackgroundColor3 = newTheme.accent
    wmGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, newTheme.titleBar),
        ColorSequenceKeypoint.new(1.0, newTheme.bg),
    })
    wmTitleGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, newTheme.text),
        ColorSequenceKeypoint.new(1.0, newTheme.accent2),
    })
    wmTitle.TextColor3 = newTheme.text
    wmSub.TextColor3   = newTheme.muted

    theme = newTheme
end

applyThemeToUI()
buildThemeButtons()
