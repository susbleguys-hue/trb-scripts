-- ASTRIS HUB key system · Ride A Pet
-- protected by pasteblox · https://pasteblox.com/k/nxzqs3dsmu

local cfg = {
  slug = "nxzqs3dsmu",
  origin = "https://pasteblox.com",
  file = "nxzqs3dsmu",
  layout = "card",
  name = "ASTRIS HUB",
  title = "Ride A Pet",
  tagline = nil,
  discord = nil,
  icon = nil,
  accent = "#8ccfff",
  accentText = "#0e1115",
  accentInk = "#8ccfff",
  poweredBy = true,
  freeKeys = true,
  hint = "keys last 6h · get one in your browser",
  palette = { s1 = "#11161c", s2 = "#181e26", s3 = "#222933", inset = "#06090d", line = "#2b333e", line2 = "#3e4856", fg = "#f0f5fa", muted = "#a9b4c2", subtle = "#8a95a4", ok = "#7fdca4", danger = "#ff7a6b", warn = "#ffcf5c", discord = "#5865f2", onDiscord = "#ffffff", scrim = "#07090c", shadow = "#000000" },
  copy = { getKey = "Get Key", redeem = "Redeem Key", checking = "checking…", close = "×", placeholder = "paste your key", footer = "secured by pasteblox", kicker = "KEY REQUIRED", idleFree = "get a key, paste it in, then redeem", idleOwner = "paste the key the owner gave you", pasteFirst = "paste your key first", thatsTheLink = "that's the link · open it in your browser, then paste the key here", checkingStatus = "checking your key…", accepted = "key accepted", linkCopied = "link copied · open it in your browser to get a key", linkCopiedOwner = "link copied · keys are given out by the owner, the page explains", linkToast = "key link copied", discordCopied = "discord invite copied · paste it in your browser", discordToast = "discord invite copied", noClipboard = "no clipboard here · copy the %s from the box", unreachable = "couldn't reach pasteblox. try again.", unknown = "something went wrong. try again.", invalid_key = "that key doesn't exist. check it or get a new one.", expired = "this key has expired. get a new one.", revoked = "this key was revoked by the owner.", wrong_device = "this key is locked to another device. ask the owner to reset it.", blacklisted = "you're blacklisted from this script.", disabled = "the key system for this script is off right now." },
  ui = {
    layout = "card",
    w = 400,
    h = 283,
    anchor = { 0.5, 0.5 },
    pos = { 0.5, 0, 0.5, 0 },
    scrim = nil,
    draggable = true,
    toast = { w = 300, h = 34, y = 64 },
    idle = "get a key, paste it in, then redeem",
    nodes = {
      { t = "frame", x = -6, y = 4, w = 412, h = 295, r = 16, bg = "#000000", transparency = 0.72 },
      { t = "frame", x = 0, y = 0, w = 400, h = 283, r = 12, bg = "#11161c", stroke = "#3e4856" },
      { t = "frame", role = "drag", x = 0, y = 0, w = 400, h = 64, bg = "#11161c", transparency = 1 },
      { t = "frame", x = 20, y = 20, w = 40, h = 40, r = 10, bg = "#253440" },
      { t = "text", text = "A", x = 20, y = 20, w = 40, h = 40, size = 18, weight = 700, color = "#8ccfff", align = "center" },
      { t = "text", text = "ASTRIS HUB", x = 72, y = 22, w = 272, h = 20, size = 17, weight = 700, color = "#f0f5fa" },
      { t = "text", text = "Ride A Pet", x = 72, y = 43, w = 272, h = 16, size = 13, weight = 500, color = "#a9b4c2" },
      { t = "button", role = "close", text = "×", style = "ghost", x = 352, y = 26, w = 28, h = 28, size = 18, r = 8 },
      { t = "frame", x = 20, y = 74, w = 360, h = 1, bg = "#2b333e" },
      { t = "input", role = "box", x = 20, y = 89, w = 360, h = 42, r = 8, size = 14 },
      { t = "text", text = "keys last 6h · get one in your browser", x = 20, y = 139, w = 360, h = 16, size = 12, weight = 500, color = "#8a95a4" },
      { t = "button", role = "get", text = "Get Key", style = "secondary", x = 20, y = 169, w = 176, h = 40, size = 14, r = 8 },
      { t = "button", role = "redeem", text = "Redeem Key", style = "primary", x = 204, y = 169, w = 176, h = 40, size = 14, r = 8 },
      { t = "text", role = "status", text = "", x = 20, y = 221, w = 360, h = 16, size = 12, weight = 500, color = "#a9b4c2" },
      { t = "text", text = "secured by pasteblox", x = 20, y = 249, w = 360, h = 14, size = 11, weight = 500, color = "#8a95a4", align = "center" },
    },
  },
}

-- hand the readable config above to the core below (obfuscated in production)
local __boot = (getgenv and getgenv()) or _G
__boot.__pasteblox_boot = cfg

--This file was protected using Luraph Obfuscator v14.9 [https://lura.ph/]

-- Recovered Luau source by ZeroVector
local v = getgenv
local genv = v and getgenv() or _G
local pastebloxBoot = genv.__pasteblox_boot
genv.__pasteblox_boot = nil

if type(pastebloxBoot) ~= "table" then
    return
end

local function fn(arg)
    local flag = type(arg) == "function"
    return flag
end

local function fn2(arg, ...)
    local ok, result, result2 = pcall(arg, ...)
    if not ok then
        return nil
    end
    return result, result2
end

local v2 = fn(getgenv) and fn2(getgenv) or nil

if type(v2) ~= "table" then
    v2 = nil
end

local str = "__pasteblox_ks_" .. pastebloxBoot.file

if v2 then
    if v2[str] then
        return
    end
    v2[str] = true
end

local function fn3()
    if v2 then
        v2[str] = nil
    end
end

local v3 = fn(cloneref)

local fn4 = v3 and cloneref or function(arg)
    return arg
end

local function fn5(arg)
    local v4 = fn2(function()
        return fn4(game:GetService(arg))
    end)

    local service = v4 or game:GetService(arg)
    return service
end

local Players = fn5("Players")
local HttpService = fn5("HttpService")
local TweenService = fn5("TweenService")
local UserInputService = fn5("UserInputService")
local StarterGui = fn5("StarterGui")
local localPlayer = Players.LocalPlayer

while not localPlayer do
    task.wait(0.1)
    localPlayer = Players.LocalPlayer
end

local v4 = fn(request)
local request_ = v4 and request

if not request_ then
    local v5 = fn(http_request)
    request_ = v5 and http_request
end

if not request_ then
    request_ = type(syn) == "table" and fn(syn.request) and syn.request
end

if not request_ then
    request_ = type(http) == "table" and fn(http.request) and http.request
end

if not request_ then
    request_ = nil
end

local v5 = fn(setclipboard)
local set = v5 and setclipboard

if not set then
    local v6 = fn(toclipboard)
    set = v6 and toclipboard
end

if not set then
    local v6 = fn(set_clipboard)
    set = v6 and set_clipboard
end

if not set then
    set = type(Clipboard) == "table" and fn(Clipboard.set) and Clipboard.set
end

if not set then
    set = nil
end

local v6 = fn(isfile)
local v7 = v6 and isfile or nil
local v8 = fn(readfile)
local v9 = v8 and readfile or nil
local v10 = fn(writefile)
local v11 = v10 and writefile or nil
local v12 = fn(isfolder)
local v13 = v12 and isfolder or nil
local v14 = fn(makefolder)
local v15 = v14 and makefolder or nil
local v16 = fn(delfile)
local v17 = v16 and delfile or nil
local v18 = loadstring
local v19 = v18 or load

local function fn6(arg)
    local ok, result = pcall(function()
        return game:HttpGet(arg)
    end)

    if ok and type(result) == "string" then
        return result
    end

    if request_ then
        local ok2, result2 = pcall(request_, {Url = arg, Method = "GET"})
        if ok2 and type(result2) == "table" and type(result2.Body) == "string" then
            return result2.Body
        end
    end

    return nil
end

local function fn7(arg)
    local v20 = tostring
    local str2 = arg or ""
    local v21 = v20(str2)

    local ok, result = pcall(function()
        return HttpService:UrlEncode(v21)
    end)

    if ok and type(result) == "string" then
        return result
    end

    return v21:gsub("[^%w%-_%.~]", function(arg2)
        return string.format("%%%02X", string.byte(arg2))
    end)
end

local function fn8(arg)
    local v20 = tostring
    local str2 = arg or ""
    return v20(str2):gsub("%s+", "")
end

local function fn9(arg)
    if not set then
        return false
    end
    return pcall(set, arg)
end

local function fn10(arg)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = pastebloxBoot.name, Text = arg, Duration = 5})
    end)
end

local v20 = (function()
    local v20 = fn(gethwid)
    local v21 = v20 and fn2(gethwid) or nil
    if type(v21) == "string" and v21 ~= "" then
        return v21
    end

    local v22 = fn2(function()
        return fn5("RbxAnalyticsService"):GetClientId()
    end)

    if type(v22) == "string" and v22 ~= "" then
        return v22
    end
    return tostring(localPlayer.UserId)
end)()

local v21 = (function()
    local v21 = fn(identifyexecutor)
    local v22 = v21 and identifyexecutor

    if not v22 then
        local v23 = fn(getexecutorname)
        v22 = v23 and getexecutorname
    end

    if not v22 then
        return ""
    end
    local v23, v24 = fn2(v22)
    if v23 == nil then
        return ""
    end

    if v24 == nil then
        return tostring(v23)
    end
    return tostring(v23) .. " " .. tostring(v24)
end)()

local str2 = pastebloxBoot.origin .. "/api/ks/" .. fn7(pastebloxBoot.slug)
local str3 = pastebloxBoot.origin .. "/k/" .. fn7(pastebloxBoot.slug) .. "?h=" .. fn7(v20)
local str4 = "pasteblox/" .. pastebloxBoot.file .. ".key"

local function fn11()
    if not v7 or not v9 or not fn2(v7, str4) then
        return nil
    end
    local v22 = fn8(fn2(v9, str4))
    if v22 == "" then
        return nil
    end
    return v22
end

local function fn12(arg)
    if not v11 then
        return
    end

    if v15 and (not v13 or not fn2(v13, "pasteblox")) then
        pcall(v15, "pasteblox")
    end

    pcall(v11, str4, arg)
end

local function fn13()
    if v17 and v7 and fn2(v7, str4) then
        pcall(v17, str4)
    elseif v11 then
        pcall(v11, str4, "")
    end
end

local function fn14(arg)
    local v22 = fn6(str2 .. "/redeem?key=" .. fn7(arg) .. "&hwid=" .. fn7(v20) .. "&uid=" .. fn7(localPlayer.UserId) .. "&name=" .. fn7(localPlayer.Name) .. "&exec=" .. fn7(v21))
    if not v22 then
        return nil
    end

    local ok, result = pcall(function()
        return HttpService:JSONDecode(v22)
    end)

    if ok and type(result) == "table" then
        return result
    end
    return nil
end

local tbl = {
    invalid_key = pastebloxBoot.copy.invalid_key,
    expired = pastebloxBoot.copy.expired,
    revoked = pastebloxBoot.copy.revoked,
    wrong_device = pastebloxBoot.copy.wrong_device,
    blacklisted = pastebloxBoot.copy.blacklisted,
    disabled = pastebloxBoot.copy.disabled,
}

local tbl2 = {
    invalid_key = true,
    expired = true,
    revoked = true,
    wrong_device = true,
}

local function fn15(arg)
    if not arg then
        return pastebloxBoot.copy.unreachable
    end

    if tbl[arg.code] then
        return tbl[arg.code]
    end

    if type(arg.message) == "string" and arg.message ~= "" then
        return arg.message
    end
    return pastebloxBoot.copy.unknown
end

local function fn16(arg)
    if arg.kind == "lifetime" or type(arg.expiresAt) ~= "string" then
        return "lifetime key"
    end

    local v22 = fn2(function()
        return DateTime.fromIsoDate(arg.expiresAt).UnixTimestamp
    end)

    if type(v22) ~= "number" then
        return "expires " .. arg.expiresAt:sub(1, 10)
    end
    local n = v22 - os.time()
    if n < 3600 then
        return math.max(1, math.floor(n / 60)) .. "m left"
    end

    if n < 172800 then
        return math.floor(n / 3600) .. "h left"
    end
    return math.floor(n / 86400) .. "d left"
end

local flag = false

local function fn17(arg)
    if flag then
        return
    end
    flag = true
    fn3()
    local v22 = fn6(str2 .. "/script?t=" .. fn7(arg))
    if not v22 then
        warn("[" .. pastebloxBoot.name .. "] couldn't reach pasteblox to load the script. try again.")
        return
    end
    local v23, v24 = v19(v22)

    if not v23 then
        error("[" .. pastebloxBoot.name .. "] " .. tostring(v24), 0)
    end

    task.spawn(function()
        local ok, result = pcall(v23)

        if not ok then
            warn("[" .. pastebloxBoot.name .. "] " .. tostring(result))
        end
    end)
end

local copy = pastebloxBoot.copy
local ui = pastebloxBoot.ui

local function fn18(arg)
    local color = Color3.fromRGB
    local num = tonumber(arg:sub(2, 3), 16)
    local n = num or 0
    local num2 = tonumber(arg:sub(4, 5), 16)
    local n2 = num2 or 0
    local num3 = tonumber(arg:sub(6, 7), 16)
    local n3 = num3 or 0
    return color(n, n2, n3)
end

local tbl3 = {}

for k, v22 in pairs(pastebloxBoot.palette) do
    tbl3[k] = fn18(v22)
end

local v22 = fn18(pastebloxBoot.accent)
local v23 = fn18(pastebloxBoot.accentText)
local v24 = fn18(pastebloxBoot.accentInk)
tbl3.accent = v22
tbl3.onAccent = v23
tbl3.ink = v24

local tbl4 = {
    muted = tbl3.muted,
    accent = tbl3.ink,
    ok = tbl3.ok,
    danger = tbl3.danger,
    warn = tbl3.warn,
}

local tbl5 = {
    primary = {bg = tbl3.accent, fg = tbl3.onAccent, weight = 600},
    secondary = {
        bg = tbl3.s2,
        fg = tbl3.fg,
        stroke = tbl3.line2,
        weight = 600,
    },
    discord = {bg = tbl3.discord, fg = tbl3.onDiscord, weight = 600},
    ghost = {bg = tbl3.s2, fg = tbl3.muted, weight = 500},
}

local tbl6 = {
    left = Enum.TextXAlignment.Left,
    center = Enum.TextXAlignment.Center,
    right = Enum.TextXAlignment.Right,
}

local tbl7 = {
    [400] = "Regular",
    [500] = "Medium",
    [600] = "SemiBold",
    [700] = "Bold",
}

local tbl8 = {
    [400] = Enum.Font.Gotham,
    [500] = Enum.Font.GothamMedium,
    [600] = Enum.Font.GothamMedium,
    [700] = Enum.Font.GothamBold,
}

local function fn19(arg, arg2, arg3)
    if not pcall(function()
        local font = Font.new
        local str5 = arg3 and "rbxasset://fonts/families/RobotoMono.json" or "rbxasset://fonts/families/Montserrat.json"
        local fontWeight = Enum.FontWeight
        local v25 = tbl7[arg2]
        local str6 = v25 or "Medium"
        arg.FontFace = font(str5, fontWeight[str6])
    end) then
        local code = arg3 and Enum.Font.Code or tbl8[arg2] or Enum.Font.GothamMedium
        arg.Font = code
    end
end

local function fn20(arg)
    if type(syn) == "table" and fn(syn.protect_gui) then
        pcall(syn.protect_gui, arg)
    end

    local v25 = fn(gethui)
    local v26 = v25 and fn2(gethui) or nil
    if v26 and pcall(function()
        arg.Parent = v26
    end) then
        return
    end

    if pcall(function()
        arg.Parent = fn5("CoreGui")
    end) then
        return
    end
    arg.Parent = localPlayer:WaitForChild("PlayerGui")
end

local function fn21(arg, arg2, arg3)
    local tbl9 = {}

    local function fn22(arg4, arg5, parent)
        local instance = Instance.new(arg4)

        for k, v25 in pairs(arg5) do
            instance[k] = v25
        end

        if parent then
            instance.Parent = parent
        end

        return instance
    end

    local function fn23(arg4, arg5, parent)
        local v25 = fn22(arg4, arg5)
        local tbl10 = {}

        if v25:IsA("GuiObject") and v25.BackgroundTransparency < 1 then
            tbl10.BackgroundTransparency = v25.BackgroundTransparency
        end

        if v25:IsA("TextLabel") or v25:IsA("TextButton") or v25:IsA("TextBox") then
            tbl10.TextTransparency = v25.TextTransparency
        end

        if v25:IsA("ImageLabel") then
            tbl10.ImageTransparency = v25.ImageTransparency
        end

        if v25:IsA("UIStroke") then
            tbl10.Transparency = v25.Transparency
        end

        if next(tbl10) then
            table.insert(tbl9, {o = v25, base = tbl10})
        end

        if parent then
            v25.Parent = parent
        end

        return v25
    end

    local function fn24(arg4, arg5)
        fn22("UICorner", {CornerRadius = UDim.new(0, arg5)}, arg4)
    end

    local function fn25(arg4, arg5, arg6)
        local v25 = arg6 or fn23

        return v25("UIStroke", {
            Color = arg5,
            Thickness = 1,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }, arg4)
    end

    local function fn26(arg4)
        return TweenInfo.new(arg4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    end

    local function fn27(arg4, arg5)
        local v25, v26, v27 = ipairs(tbl9)
        local v28 = v27
        local v29 = v25
        local v30 = v26

        while true do
            local v31, v32 = v29(v30, v28)
            if v31 == nil then
                break
            end
            local tbl10 = {}

            for k, v33 in pairs(v32.base) do
                local n = arg4 and v33 or 1
                tbl10[k] = n
            end

            v28 = v31
            TweenService:Create(v32.o, fn26(arg5), tbl10):Play()
        end
    end

    local w = ui.w
    local h = ui.h
    local tbl10 = {}

    local v25 = fn2(function()
        return HttpService:GenerateGUID(false)
    end)

    local name = v25 or "pasteblox"
    tbl10.Name = name
    tbl10.ResetOnSpawn = false
    tbl10.IgnoreGuiInset = true
    tbl10.DisplayOrder = 9999
    tbl10.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local ScreenGui = fn23("ScreenGui", tbl10)

    if ui.scrim then
        fn23("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = fn18(ui.scrim.color),
            BackgroundTransparency = ui.scrim.transparency,
            BorderSizePixel = 0,
            Active = true,
        }, ScreenGui)
    end

    local Frame = fn23("Frame", {
        AnchorPoint = Vector2.new(ui.anchor[1], ui.anchor[2]),
        Position = UDim2.new(ui.pos[1], ui.pos[2], ui.pos[3], ui.pos[4]),
        Size = UDim2.fromOffset(w, h),
        BackgroundTransparency = 1,
    }, ScreenGui)

    local UIScale = fn23("UIScale", {}, Frame)
    local tbl11 = {}
    local tbl12 = {}

    for i, node in ipairs(ui.nodes) do
        local tbl13 = {
            Position = UDim2.fromOffset(node.x, node.y),
            Size = UDim2.fromOffset(node.w, node.h),
            ZIndex = i,
            BorderSizePixel = 0,
        }

        local ImageLabel = nil

        if node.t == "frame" then
            tbl13.BackgroundColor3 = fn18(node.bg)
            local transparency = node.transparency
            local backgroundTransparency = transparency or 0
            tbl13.BackgroundTransparency = backgroundTransparency
            local active = node.role == "drag"
            tbl13.Active = active
            local Frame2 = fn23("Frame", tbl13, Frame)
            ImageLabel = Frame2

            if node.role == "drag" then
                table.insert(tbl12, Frame2)
            end
        elseif node.t == "text" then
            tbl13.BackgroundTransparency = 1
            tbl13.Text = node.text
            tbl13.TextSize = node.size
            tbl13.TextColor3 = fn18(node.color)
            local align = node.align
            local str5 = align or "left"
            tbl13.TextXAlignment = tbl6[str5]
            local wrap = node.wrap
            local top = wrap and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
            tbl13.TextYAlignment = top
            local textWrapped = node.wrap == true
            tbl13.TextWrapped = textWrapped
            tbl13.TextTruncate = Enum.TextTruncate.AtEnd
            local TextLabel = fn23("TextLabel", tbl13, Frame)
            ImageLabel = TextLabel
            fn19(TextLabel, node.weight, false)
        elseif node.t == "icon" then
            tbl13.Image = "rbxassetid://" .. node.asset
            tbl13.ScaleType = Enum.ScaleType.Crop
            tbl13.BackgroundColor3 = fn18(node.bg)
            ImageLabel = fn23("ImageLabel", tbl13, Frame)
        elseif node.t == "input" then
            tbl13.BackgroundColor3 = tbl3.inset
            local Frame2 = fn23("Frame", tbl13, Frame)
            ImageLabel = Frame2
            tbl11.boxStroke = fn25(Frame2, tbl3.line)
            local tbl14 = {}
            local text = arg3 or ""
            tbl14.Text = text
            tbl14.PlaceholderText = copy.placeholder
            tbl14.PlaceholderColor3 = tbl3.subtle
            tbl14.ClearTextOnFocus = false
            tbl14.TextSize = node.size
            tbl14.TextColor3 = tbl3.fg
            local align = node.align
            local str5 = align or "left"
            tbl14.TextXAlignment = tbl6[str5]
            tbl14.BackgroundTransparency = 1
            tbl14.ClipsDescendants = true
            tbl14.ZIndex = i
            tbl14.Position = UDim2.fromOffset(12, 0)
            tbl14.Size = UDim2.new(1, -24, 1, 0)
            tbl11.box = fn23("TextBox", tbl14, Frame2)
            fn19(tbl11.box, 500, true)
        elseif node.t == "button" then
            local v26 = tbl5[node.style]
            local secondary = v26 or tbl5.secondary
            tbl13.Text = node.text
            tbl13.TextSize = node.size
            tbl13.TextColor3 = secondary.fg
            tbl13.BackgroundColor3 = secondary.bg
            tbl13.AutoButtonColor = true
            local TextButton = fn23("TextButton", tbl13, Frame)
            ImageLabel = TextButton
            fn19(TextButton, secondary.weight, false)

            if secondary.stroke then
                fn25(TextButton, secondary.stroke)
            end

            tbl11[node.role] = TextButton
        end

        if ImageLabel and node.r then
            fn24(ImageLabel, node.r)
        end

        if ImageLabel and node.stroke then
            fn25(ImageLabel, fn18(node.stroke))
        end

        if ImageLabel and node.role == "status" then
            tbl11.status = ImageLabel
        end
    end

    local box = tbl11.box
    local boxStroke = tbl11.boxStroke
    local status = tbl11.status
    local get = tbl11.get
    local redeem = tbl11.redeem
    local discord = tbl11.discord
    local close = tbl11.close
    local toast = ui.toast

    local Frame2 = fn22("Frame", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, toast.y - 8),
        Size = UDim2.fromOffset(toast.w, toast.h),
        Visible = false,
        BackgroundColor3 = tbl3.s2,
        BorderSizePixel = 0,
        ZIndex = #ui.nodes + 1,
    }, ScreenGui)

    fn24(Frame2, math.floor(toast.h / 2))
    local v26 = fn25(Frame2, tbl3.line2, fn22)

    local Frame3 = fn22("Frame", {
        Position = UDim2.fromOffset(14, math.floor(toast.h / 2) - 4),
        Size = UDim2.fromOffset(8, 8),
        BackgroundColor3 = tbl3.accent,
        BorderSizePixel = 0,
        ZIndex = #ui.nodes + 2,
    }, Frame2)

    fn24(Frame3, 4)

    local TextLabel = fn22("TextLabel", {
        Text = "",
        TextSize = 12,
        TextColor3 = tbl3.fg,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Position = UDim2.fromOffset(30, 0),
        Size = UDim2.new(1, -44, 1, 0),
        ZIndex = #ui.nodes + 2,
    }, Frame2)

    fn19(TextLabel, 600, false)

    local tbl13 = {
        {Frame2, "BackgroundTransparency"},
        {v26, "Transparency"},
        {Frame3, "BackgroundTransparency"},
        {TextLabel, "TextTransparency"},
    }

    local function fn28(text, arg4)
        status.Text = text
        local v27 = tbl4[arg4]
        local muted = v27 or tbl3.muted
        status.TextColor3 = muted
    end

    local tbl14 = {}
    local scale = 1

    local function fn29()
        local currentCamera = workspace.CurrentCamera
        local viewportSize = currentCamera and currentCamera.ViewportSize
        if not viewportSize then
            return
        end
        scale = math.max(0.5, math.min(1, (viewportSize.X - 24) / w, (viewportSize.Y - 24) / h))
        UIScale.Scale = scale
    end

    fn29()

    if workspace.CurrentCamera then
        table.insert(tbl14, workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fn29))
    end

    local v27 = nil
    local v28 = nil
    local v29 = nil

    if ui.draggable then
        for i, v30 in ipairs(tbl12) do
            v30.InputBegan:Connect(function(input)
                local userInputType = input.UserInputType
                if userInputType ~= Enum.UserInputType.MouseButton1 and userInputType ~= Enum.UserInputType.Touch then
                    return
                end
                local position = input.Position
                local position2 = Frame.Position
                v27 = input
                v28 = position
                v29 = position2

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        v27 = nil
                    end
                end)
            end)
        end

        table.insert(tbl14, UserInputService.InputChanged:Connect(function(input)
            if not v27 then
                return
            end
            local userInputType = input.UserInputType

            if userInputType == Enum.UserInputType.MouseMovement or userInputType == Enum.UserInputType.Touch and input == v27 then
                local n = input.Position - v28
                Frame.Position = UDim2.new(v29.X.Scale, v29.X.Offset + n.X, v29.Y.Scale, v29.Y.Offset + n.Y)
            end
        end))
    end

    local flag2 = false
    local flag3 = false
    local n = 0

    local function fn30(text, backgroundColor3)
        n = n + 1
        local v30 = n
        TextLabel.Text = text
        Frame3.BackgroundColor3 = backgroundColor3
        Frame2.Position = UDim2.new(0.5, 0, 0, toast.y - 8)
        Frame2.Visible = true

        for i, v31 in ipairs(tbl13) do
            v31[1][v31[2]] = 1
            local tbl15 = {}
            local create = TweenService.Create
            local v32 = v31[1]
            local v33 = fn26(0.16)
            tbl15[v31[2]] = 0
            create(TweenService, v32, v33, tbl15):Play()
        end

        TweenService:Create(Frame2, fn26(0.16), {Position = UDim2.new(0.5, 0, 0, toast.y)}):Play()

        task.delay(2.4, function()
            if v30 ~= n or flag3 then
                return
            end

            for i, v31 in ipairs(tbl13) do
                local tbl15 = {}
                local create = TweenService.Create
                local v32 = v31[1]
                local v33 = fn26(0.2)
                tbl15[v31[2]] = 1
                create(TweenService, v32, v33, tbl15):Play()
            end

            task.delay(0.22, function()
                if v30 == n then
                    Frame2.Visible = false
                end
            end)
        end)
    end

    local function fn31(arg4)
        flag2 = arg4

        for i, v30 in ipairs({get, redeem, discord}) do
            local autoButtonColor

            if arg4 then
                autoButtonColor = false
            else
                autoButtonColor = true
            end

            v30.AutoButtonColor = autoButtonColor
            local textTransparency = arg4 and 0.45 or 0
            v30.TextTransparency = textTransparency
        end

        local checking = arg4 and copy.checking or copy.redeem
        redeem.Text = checking
    end

    local function fn32(arg4)
        if flag3 then
            return
        end
        flag3 = true

        for i, v30 in ipairs(tbl14) do
            pcall(function()
                v30:Disconnect()
            end)
        end

        Frame2.Visible = false
        fn27(false, 0.18)
        TweenService:Create(UIScale, fn26(0.18), {Scale = scale * 0.94}):Play()

        task.delay(0.2, function()
            pcall(function()
                ScreenGui:Destroy()
            end)

            if arg4 then
                arg4()
            else
                fn3()
            end
        end)
    end

    local function fn33(text, arg4, arg5, arg6, arg7)
        if fn9(text) then
            fn28(arg4, "accent")
            fn30(arg6, arg7)
        else
            box.Text = text
            fn28(copy.noClipboard:format(arg5), "warn")
        end
    end

    close.Activated:Connect(function()
        fn32(nil)
    end)

    get.Activated:Connect(function()
        if flag2 or flag3 then
            return
        end
        local freeKeys = pastebloxBoot.freeKeys
        local linkCopied = freeKeys and copy.linkCopied or copy.linkCopiedOwner
        fn33(str3, linkCopied, "link", copy.linkToast, tbl3.accent)
    end)

    if discord then
        discord.Activated:Connect(function()
            if flag2 or flag3 then
                return
            end
            fn33(pastebloxBoot.discord, copy.discordCopied, "invite", copy.discordToast, tbl3.discord)
        end)
    end

    local function fn34()
        if flag2 or flag3 then
            return
        end
        local v30 = fn8(box.Text)
        if v30 == "" then
            fn28(copy.pasteFirst, "danger")
            return
        end

        if v30 ~= fn8(str3) and v30 ~= fn8(pastebloxBoot.discord) then
            fn31(true)
            fn28(copy.checkingStatus, "accent")

            task.spawn(function()
                local v31 = fn14(v30)
                if flag3 then
                    return
                end

                if v31 and v31.ok == true and type(v31.token) == "string" then
                    fn12(v30)
                    fn28(copy.accepted .. " · " .. fn16(v31), "ok")
                    task.wait(0.6)

                    fn32(function()
                        fn17(v31.token)
                    end)

                    return
                end

                if v31 and tbl2[v31.code] and v30 == fn11() then
                    fn13()
                end

                fn31(false)
                local v32 = fn15(v31)
                local str5 = v31 and v31.code == "rate_limited" and "warn" or "danger"
                fn28(v32, str5)
            end)

            return
        end

        fn28(copy.thatsTheLink, "warn")
    end

    redeem.Activated:Connect(fn34)

    box.Focused:Connect(function()
        boxStroke.Color = tbl3.accent
    end)

    box.FocusLost:Connect(function(enterPressed)
        boxStroke.Color = tbl3.line

        if enterPressed then
            fn34()
        end
    end)

    local idle = arg or ui.idle
    local str5 = arg2 or "muted"
    fn28(idle, str5)
    local v30, v31, v32 = ipairs(tbl9)
    local v33 = v32
    local v34 = v30
    local v35 = v31

    while true do
        local v36, v37 = v34(v35, v33)
        if v36 == nil then
            break
        end

        for k in pairs(v37.base) do
            v37.o[k] = 1
        end

        v33 = v36
    end

    UIScale.Scale = scale * 0.94
    fn20(ScreenGui)
    fn27(true, 0.22)
    TweenService:Create(UIScale, fn26(0.22), {Scale = scale}):Play()
end

local ok, result = pcall(function()
    local v25 = fn11()
    if not v25 then
        return fn21(nil, nil, nil)
    end
    local v26 = fn14(v25)
    if v26 and v26.ok == true and type(v26.token) == "string" then
        fn10(pastebloxBoot.copy.accepted .. " · " .. fn16(v26))
        return fn17(v26.token)
    end

    if v26 and tbl2[v26.code] then
        fn13()
        return fn21(fn15(v26), "danger", nil)
    end
    local v27 = fn15(v26)
    local str5 = v26 and v26.code == "rate_limited" and "warn" or "danger"
    fn21(v27, str5, v25)
end)

if not ok then
    fn3()
    error(result, 0)
end
