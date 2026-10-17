local art = [[████████╗██████╗ ██████╗ 
╚══██╔══╝██╔══██╗██╔══██╗
   ██║   ██████╔╝██████╔╝
   ██║   ██╔══██╗██╔══██╗
   ██║   ██║  ██║██████╔╝
   ╚═╝   ╚═╝  ╚═╝╚═════╝]]

print("|" .. (art:gsub("\n", "\n|")))
local function main()
	-- ============================================================
	-- СЕРВИСЫ
	-- ============================================================
	local TweenService = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local Lighting = game:GetService("Lighting")

	local player = Players.LocalPlayer
	if not player then
		return
	end

	local playerGui = player:WaitForChild("PlayerGui")

	-- чистка гуёв ПРЕДЫДУЩИХ запусков. ВАЖНО: только в начале, до создания
	-- своих confirmGui/gui — иначе скрипт убивает собственные интерфейсы
	-- (именно так "ломался" крестик: диалог строился в уничтоженный ScreenGui)
	pcall(function()
		local oldMain = playerGui:FindFirstChild("FosforGui")
		if oldMain then oldMain:Destroy() end
		local oldConfirm = playerGui:FindFirstChild("FosforConfirmGui")
		if oldConfirm then oldConfirm:Destroy() end
	end)

	-- ============================================================
	-- ОСВЕЩЕНИЕ ПРИ ЗАПУСКЕ: НЕ ТРОГАЕМ
	-- ============================================================
	local savedLighting = nil
	pcall(function()
		savedLighting = {
			ClockTime = Lighting.ClockTime,
			Ambient = Lighting.Ambient,
			OutdoorAmbient = Lighting.OutdoorAmbient,
		}
	end)

	-- ============================================================
	-- УТИЛИТЫ
	-- ============================================================
	local function clamp(value, minValue, maxValue)
		return math.min(maxValue, math.max(minValue, value))
	end

	local function trim(text)
		return (string.gsub(tostring(text or ""), "^%s*(.-)%s*$", "%1"))
	end

	local function formatTime(sec)
		sec = math.floor(sec or 0)
		local h = math.floor(sec / 3600)
		local m = math.floor((sec % 3600) / 60)
		local s = sec % 60
		return string.format("%d:%02d:%02d", h, m, s)
	end

	local _fs_a = 3952975000

	-- ============================================================
	-- МОДУЛЬ: ОКРУЖЕНИЕ ФУНКЦИЙ
	-- ============================================================
	local function getFeatureEnvironment()
		local ok, env = pcall(function()
			if typeof(getgenv) == "function" then
				return getgenv()
			end
			return nil
		end)
		if ok and type(env) == "table" then
			return env
		end
		if type(shared) == "table" then
			return shared
		end
		return _G
	end

	local FeatureEnv = getFeatureEnvironment()

	local defaultFeatures = {
		ESP_FOV = 70,
		Fullbright = false,
		AntiAFK = false,
		FPSUnlocker = false,
	}

	for key, value in pairs(defaultFeatures) do
		pcall(function()
			if FeatureEnv["Fosfor_" .. key] == nil then
				FeatureEnv["Fosfor_" .. key] = value
			end
		end)
	end

	local function getFeature(key)
		local value
		pcall(function()
			value = FeatureEnv["Fosfor_" .. key]
		end)
		return value
	end

	local function setFeature(key, value)
		pcall(function()
			FeatureEnv["Fosfor_" .. key] = value
		end)
	end

	local featureOrder = {
		"ESP_FOV",
		"Fullbright", "AntiAFK", "FPSUnlocker",
	}

	-- ============================================================
	-- МОДУЛЬ: ЛОКАЛЬНЫЕ НАСТРОЙКИ UI
	-- ============================================================
	local settings = {
		Theme = "Тёмная",
		WindowTransparency = 0.25,
		Sounds = true,
		Animations = true,
	}

	-- ============================================================
	-- МЕНЕДЖЕР ЗВУКОВ
	-- ============================================================
	local SoundService = game:GetService("SoundService")

	local SOUNDS = {
		-- ПИСКАЩИЙ НАЙДЕН: success пищал на каждом уведомлении. Не включать
		-- (или заменить id на другой, если звук успеха всё же нужен)
		-- success  = "rbxassetid://138081500",
		notify   = "rbxassetid://5273899897",
		click    = "rbxassetid://6895079853",
		toggle   = "rbxassetid://3398620867",
		error    = "rbxassetid://7128958209",
	}

	local bootClock = os.clock()

	local function playSound(kind, volume)
		if not settings.Sounds then return end
		-- тишина при загрузке: первые секунды после запуска скрипта ничего не пищит
		if os.clock() - bootClock < 3 then return end
		local id = SOUNDS[kind]
		if not id then return end
		task.spawn(function()
			local s = Instance.new("Sound")
			s.SoundId = id
			s.Volume = volume or 0.5
			s:SetAttribute("FosforSFX", true)
			s.Parent = SoundService
			s.PlaybackSpeed = 1
			s:Play()
			s.Ended:Connect(function() s:Destroy() end)
			task.delay(3, function() if s then s:Destroy() end end)
		end)
	end

	local _fs_b = 29

	-- ============================================================
	-- МОДУЛЬ: АНИМАЦИИ
	-- ============================================================
	local Animations = {}

	local _fs_t1a = 5149567000
	function Animations.tween(object, properties, duration)
		if not object then
			return nil
		end
		local actualDuration = duration or 0.25
		if not settings.Animations then
			actualDuration = 0
		end
		if actualDuration <= 0 then
			pcall(function()
				for propertyName, value in pairs(properties) do
					object[propertyName] = value
				end
			end)
			return nil
		end
		local ok, tweenObject = pcall(function()
			return TweenService:Create(
				object,
				TweenInfo.new(actualDuration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				properties
			)
		end)
		if ok and tweenObject then
			tweenObject:Play()
			return tweenObject
		end
		pcall(function()
			for propertyName, value in pairs(properties) do
				object[propertyName] = value
			end
		end)
		return nil
	end

	function Animations.tweenCompleted(object, properties, duration, callback)
		local tweenObject = Animations.tween(object, properties, duration)
		if tweenObject then
			tweenObject.Completed:Connect(function()
				if callback then callback() end
			end)
		else
			if callback then callback() end
		end
		return tweenObject
	end

	-- ============================================================
	-- МОДУЛЬ: ТЕМА ОФОРМЛЕНИЯ
	-- ============================================================
	local themed = {
		bg = {}, panel = {}, element = {}, text = {}, sub = {},
		stroke = {}, star = {}, consoleBg = {}, accent = {},
		scrollbar = {}, gradient = {}, particle = {},
		logoStar = {}, logoStarGlow = {}, closeCross = {},
	}

	local function addThemed(kind, object)
		if themed[kind] and object then
			table.insert(themed[kind], object)
		end
	end

	local _fs_t1b = 974

	local function buildPalette(isLight)
		if isLight then
			return {
				bg = Color3.fromRGB(232, 232, 238),
				panel = Color3.fromRGB(251, 251, 253),
				element = Color3.fromRGB(228, 228, 235),
				text = Color3.fromRGB(10, 10, 14),
				sub = Color3.fromRGB(78, 78, 90),
				dim = Color3.fromRGB(132, 132, 142),
				stroke = Color3.fromRGB(22, 22, 28),
				star = Color3.fromRGB(70, 70, 80),
				consoleBG = Color3.fromRGB(18, 18, 24),
				consoleText = Color3.fromRGB(240, 240, 246),
				gradientTop = Color3.fromRGB(255, 255, 255),
				gradientBottom = Color3.fromRGB(226, 226, 234),
				particle = Color3.fromRGB(40, 40, 50),
				logoStar = Color3.fromRGB(40, 40, 55),
				closeCross = Color3.fromRGB(10, 10, 14),
				closeCrossHover = Color3.fromRGB(255, 59, 48),
				accent = Color3.fromRGB(175, 82, 222),
			}
		else
			return {
				bg = Color3.fromRGB(10, 10, 14),
				panel = Color3.fromRGB(28, 28, 34),
				element = Color3.fromRGB(46, 46, 56),
				text = Color3.fromRGB(255, 255, 255),
				sub = Color3.fromRGB(220, 220, 230),
				dim = Color3.fromRGB(150, 150, 162),
				stroke = Color3.fromRGB(255, 255, 255),
				star = Color3.fromRGB(255, 255, 255),
				consoleBG = Color3.fromRGB(12, 12, 17),
				consoleText = Color3.fromRGB(240, 240, 248),
				gradientTop = Color3.fromRGB(48, 48, 60),
				gradientBottom = Color3.fromRGB(17, 17, 23),
				particle = Color3.fromRGB(255, 255, 255),
				logoStar = Color3.fromRGB(255, 255, 255),
				closeCross = Color3.fromRGB(255, 255, 255),
				closeCrossHover = Color3.fromRGB(255, 69, 58),
				accent = Color3.fromRGB(191, 90, 242),
			}
		end
	end

	local function getPalette(themeName)
		return buildPalette(themeName == "Светлая")
	end

	local currentPalette = getPalette(settings.Theme)

	-- ============================================================
	-- МОДУЛЬ: UI-ФАБРИКА
	-- ============================================================
	local UI = {}

	local _fs_t2a = 3376312000

	function UI.corner(parent, radius)
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, radius or 20)
		corner.Parent = parent
		return corner
	end

	function UI.stroke(parent, transparency, thickness)
		local stroke = Instance.new("UIStroke")
		stroke.Color = currentPalette.stroke
		stroke.Thickness = thickness or 1
		stroke.Transparency = transparency or 0.72
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Parent = parent
		addThemed("stroke", stroke)
		return stroke
	end

	function UI.gradient(parent, rotation)
		local gradient = Instance.new("UIGradient")
		gradient.Rotation = rotation or 90
		gradient.Color = ColorSequence.new(currentPalette.gradientTop, currentPalette.gradientBottom)
		gradient.Parent = parent
		addThemed("gradient", gradient)
		return gradient
	end

	-- жидкое стекло: тонкий белый блик сверху, ползет вниз и растворяется.
	-- ложится ПОД контент (ZIndex 1), поверх фона; input не перехватывает
	function UI.sheen(parent, strength)
		local sheen = Instance.new("Frame")
		sheen.Name = "GlassSheen"
		sheen.Size = UDim2.fromScale(1, 1)
		sheen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		sheen.BackgroundTransparency = 0
		sheen.BorderSizePixel = 0
		sheen.Active = false
		sheen.ZIndex = 1
		sheen.Parent = parent
		local s = strength or 0.1
		local glassGradient = Instance.new("UIGradient")
		glassGradient.Rotation = 90
		glassGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
		glassGradient.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, math.clamp(1 - (s + 0.06), 0, 1)),
			NumberSequenceKeypoint.new(0.22, math.clamp(1 - s * 0.45, 0, 1)),
			NumberSequenceKeypoint.new(0.55, math.clamp(1 - s * 0.12, 0, 1)),
			NumberSequenceKeypoint.new(1, 1),
		})
		glassGradient.Parent = sheen
		return sheen
	end

	function UI.padding(parent, left, right, top, bottom)
		local padding = Instance.new("UIPadding")
		padding.PaddingLeft = UDim.new(0, left or 0)
		padding.PaddingRight = UDim.new(0, right or 0)
		padding.PaddingTop = UDim.new(0, top or 0)
		padding.PaddingBottom = UDim.new(0, bottom or 0)
		padding.Parent = parent
		return padding
	end

	function UI.button(props)
		props = props or {}
		local button = Instance.new("TextButton")
		button.Name = props.Name or "Button"
		button.Size = props.Size or UDim2.fromOffset(100, 30)
		button.Position = props.Position or UDim2.new()
		button.BackgroundColor3 = props.BackgroundColor3 or currentPalette.element
		button.BackgroundTransparency = props.BackgroundTransparency or 0.28
		button.BorderSizePixel = 0
		button.Text = props.Text or ""
		button.Font = props.Font or Enum.Font.Gotham
		button.TextSize = props.TextSize or 14
		button.TextColor3 = props.TextColor3 or currentPalette.text
		button.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center
		button.TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center
		button.TextWrapped = props.TextWrapped == true
		button.AutoButtonColor = false
		button.Active = props.Active == nil and true or props.Active
		button.ZIndex = props.ZIndex or 1
		if props.Parent then
			button.Parent = props.Parent
		end
		UI.corner(button, props.Corner or 16)
		if props.Stroke ~= false then
			UI.stroke(button, props.StrokeTransparency or 0.6, props.StrokeThickness or 1)
		end
		if props.PaddingLeft or props.PaddingRight or props.PaddingTop or props.PaddingBottom then
			UI.padding(button, props.PaddingLeft or 0, props.PaddingRight or 0, props.PaddingTop or 0, props.PaddingBottom or 0)
		end
		if props.ThemeBackground and themed[props.ThemeBackground] then
			addThemed(props.ThemeBackground, button)
		end
		if props.ThemeText and themed[props.ThemeText] then
			addThemed(props.ThemeText, button)
		end
		return button
	end

	function UI.basicHover(object, baseTransparency, hoverTransparency, baseStrokeTransparency, hoverStrokeTransparency)
		local stroke = object:FindFirstChildOfClass("UIStroke")
		local padding = object:FindFirstChildOfClass("UIPadding")
		local baseBg = baseTransparency or object.BackgroundTransparency
		local hoverBg = hoverTransparency or math.max(0, baseBg - 0.1)
		local baseStroke = stroke and stroke.Transparency or (baseStrokeTransparency or 0.6)
		local hoverStroke = hoverStrokeTransparency or 0.1
		local basePaddingLeft = padding and padding.PaddingLeft.Offset or 0
		object.MouseEnter:Connect(function()
			Animations.tween(object, {BackgroundTransparency = hoverBg}, 0.18)
			if stroke then Animations.tween(stroke, {Transparency = hoverStroke}, 0.18) end
			if padding then Animations.tween(padding, {PaddingLeft = UDim.new(0, basePaddingLeft + 3)}, 0.18) end
		end)
		object.MouseLeave:Connect(function()
			Animations.tween(object, {BackgroundTransparency = baseBg}, 0.22)
			if stroke then Animations.tween(stroke, {Transparency = baseStroke}, 0.22) end
			if padding then Animations.tween(padding, {PaddingLeft = UDim.new(0, basePaddingLeft)}, 0.22) end
		end)
	end

	-- бегущая строка: если название не влезает — плавно прокручивается туда-обратно
	function UI.scrollingLabel(button, themeKind)
		if not button then return end
		local text = button.Text
		button.Text = ""
		button.ClipsDescendants = true
		local label = Instance.new("TextLabel")
		label.Name = "ScrollText"
		label.BackgroundTransparency = 1
		label.Font = button.Font
		label.TextSize = button.TextSize
		label.TextColor3 = button.TextColor3
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.TextYAlignment = Enum.TextYAlignment.Center
		label.Text = text
		label.Size = UDim2.new(1, 0, 1, 0)
		label.Active = false
		label.Parent = button
		if themeKind and themed[themeKind] then
			addThemed(themeKind, label)
		end
		task.spawn(function()
			task.wait()
			if not button.Parent then return end
			local avail = button.AbsoluteSize.X
			local textW = label.TextBounds.X
			if textW <= avail then return end
			local overflow = textW - avail + 10
			label.Size = UDim2.new(0, textW, 1, 0)
			local forward = true
			while button and button.Parent do
				local duration = math.clamp(overflow / 28, 0.6, 5)
				local target = forward and -overflow or 0
				local tween = Animations.tween(label, {Position = UDim2.new(0, target, 0, 0)}, duration)
				if tween and tween.Completed then
					tween.Completed:Wait()
				else
					task.wait(duration)
				end
				if not button.Parent then break end
				task.wait(0.8)
				forward = not forward
			end
		end)
		return label
	end

	function UI.invertHover(button, mode, baseTransparency)
		local stroke = button:FindFirstChildOfClass("UIStroke")
		local padding = button:FindFirstChildOfClass("UIPadding")
		local baseBg = baseTransparency or button.BackgroundTransparency
		local basePaddingLeft = padding and padding.PaddingLeft.Offset or 0
		button.MouseEnter:Connect(function()
			local backgroundColor, textColor
			if mode == "accent" then
				backgroundColor = currentPalette.bg
				textColor = currentPalette.text
			else
				backgroundColor = currentPalette.text
				textColor = currentPalette.bg
			end
			Animations.tween(button, {BackgroundColor3 = backgroundColor, TextColor3 = textColor, BackgroundTransparency = 0}, 0.18)
			if stroke then Animations.tween(stroke, {Transparency = 0}, 0.18) end
			if padding then Animations.tween(padding, {PaddingLeft = UDim.new(0, basePaddingLeft + 3)}, 0.18) end
		end)
		button.MouseLeave:Connect(function()
			local backgroundColor, textColor
			if mode == "accent" then
				backgroundColor = currentPalette.text
				textColor = currentPalette.bg
			else
				backgroundColor = currentPalette.element
				textColor = currentPalette.text
			end
			Animations.tween(button, {BackgroundColor3 = backgroundColor, TextColor3 = textColor, BackgroundTransparency = baseBg}, 0.22)
			if stroke then Animations.tween(stroke, {Transparency = 0.35}, 0.22) end
			if padding then Animations.tween(padding, {PaddingLeft = UDim.new(0, basePaddingLeft)}, 0.22) end
		end)
	end

	function UI.focusFX(textBox)
		local stroke = textBox:FindFirstChildOfClass("UIStroke")
		textBox.Focused:Connect(function()
			if stroke then Animations.tween(stroke, {Transparency = 0}, 0.18) end
		end)
		textBox.FocusLost:Connect(function()
			if stroke then Animations.tween(stroke, {Transparency = 0.65}, 0.2) end
		end)
	end

	function UI.row(parent, order, height)
		local row = Instance.new("Frame")
		row.Name = "Row"
		row.Size = UDim2.new(1, 0, 0, height or 38)
		row.BackgroundColor3 = currentPalette.element
		row.BackgroundTransparency = 0.3
		row.BorderSizePixel = 0
		row.LayoutOrder = order or 1
		row.Parent = parent
		addThemed("element", row)
		UI.corner(row, 16)
		UI.stroke(row, 0.82, 1)
		return row
	end

	local toggles = {}
	local themeButtons = {}
	local updateThemeButtons

	function UI.createScrollArea(page)
		local scroll = Instance.new("ScrollingFrame")
		scroll.Name = "ScrollArea"
		scroll.Size = UDim2.fromScale(1, 1)
		scroll.BackgroundTransparency = 1
		scroll.BorderSizePixel = 0
		scroll.ScrollBarThickness = 2
		scroll.ScrollBarImageColor3 = currentPalette.stroke
		scroll.ScrollBarImageTransparency = 0.45
		scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
		scroll.Parent = page
		addThemed("scrollbar", scroll)
		local container = Instance.new("Frame")
		container.Name = "Container"
		container.Size = UDim2.new(1, 0, 0, 0)
		container.AutomaticSize = Enum.AutomaticSize.Y
		container.BackgroundTransparency = 1
		container.Parent = scroll
		local layout = Instance.new("UIListLayout")
		layout.Padding = UDim.new(0, 8)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Parent = container
		UI.padding(container, 12, 12, 12, 10)
		local function updateCanvas()
			scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
		end
		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
		updateCanvas()
		return container
	end

	function UI.createToggle(parent, labelText, defaultValue, callback, order)
		local row = UI.row(parent, order, 38)
		UI.basicHover(row, 0.1, 0.08, 0.75, 0.25)
		UI.scrollingLabel(UI.button({
			Name = "Label", Parent = row,
			Size = UDim2.new(1, -96, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false, Text = labelText,
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		}), "text")
		local toggleButton = UI.button({
			Name = "Toggle", Parent = row,
			Size = UDim2.fromOffset(54, 24), Position = UDim2.new(1, -68, 0.5, -12),
			BackgroundColor3 = currentPalette.element, BackgroundTransparency = 0.1,
			Text = "", Corner = 12, StrokeTransparency = 0.35,
		})
		local knob = Instance.new("Frame")
		knob.Name = "Knob"
		knob.Size = UDim2.fromOffset(18, 18)
		knob.AnchorPoint = Vector2.new(0.5, 0.5)
		knob.Position = UDim2.new(0, 14, 0.5, 0)
		knob.BackgroundColor3 = currentPalette.sub
		knob.BorderSizePixel = 0
		knob.Parent = toggleButton
		UI.corner(knob, 9)
		local data = { state = defaultValue }
		data.row = row
		local function updateVisual()
			if data.state then
				Animations.tween(toggleButton, {BackgroundColor3 = currentPalette.text, BackgroundTransparency = 0}, 0.2)
				Animations.tween(knob, {Position = UDim2.new(1, -14, 0.5, 0), BackgroundColor3 = currentPalette.bg}, 0.2)
			else
				Animations.tween(toggleButton, {BackgroundColor3 = currentPalette.element, BackgroundTransparency = 0.1}, 0.2)
				Animations.tween(knob, {Position = UDim2.new(0, 14, 0.5, 0), BackgroundColor3 = currentPalette.sub}, 0.2)
			end
		end
		data.update = updateVisual
		toggleButton.MouseButton1Click:Connect(function()
			data.state = not data.state
			updateVisual()
			playSound("toggle")
			if callback then callback(data.state) end
		end)
		updateVisual()
		table.insert(toggles, data)
		return data
	end

	function UI.createBWToggle(parent, labelText, defaultValue, callback, order)
		local row = UI.row(parent, order, 38)
		UI.basicHover(row, 0.1, 0.08, 0.75, 0.25)
		UI.scrollingLabel(UI.button({
			Name = "Label", Parent = row,
			Size = UDim2.new(1, -96, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false, Text = labelText,
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		}), "text")
		local toggleButton = UI.button({
			Name = "Toggle", Parent = row,
			Size = UDim2.fromOffset(54, 24), Position = UDim2.new(1, -68, 0.5, -12),
			BackgroundColor3 = Color3.fromRGB(40, 40, 40), BackgroundTransparency = 0,
			Text = "", Corner = 12, StrokeTransparency = 0.3,
		})
		local knob = Instance.new("Frame")
		knob.Name = "Knob"
		knob.Size = UDim2.fromOffset(18, 18)
		knob.AnchorPoint = Vector2.new(0.5, 0.5)
		knob.Position = UDim2.new(0, 14, 0.5, 0)
		knob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
		knob.BorderSizePixel = 0
		knob.Parent = toggleButton
		UI.corner(knob, 9)
		local data = { state = defaultValue }
		local function updateVisual()
			if data.state then
				Animations.tween(toggleButton, {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0}, 0.2)
				Animations.tween(knob, {Position = UDim2.new(1, -14, 0.5, 0), BackgroundColor3 = Color3.fromRGB(20, 20, 20)}, 0.2)
			else
				Animations.tween(toggleButton, {BackgroundColor3 = Color3.fromRGB(40, 40, 40), BackgroundTransparency = 0}, 0.2)
				Animations.tween(knob, {Position = UDim2.new(0, 14, 0.5, 0), BackgroundColor3 = Color3.fromRGB(200, 200, 200)}, 0.2)
			end
		end
		data.update = updateVisual
		toggleButton.MouseButton1Click:Connect(function()
			data.state = not data.state
			updateVisual()
			playSound("toggle")
			if callback then callback(data.state) end
		end)
		updateVisual()
		table.insert(toggles, data)
		return data
	end

	function UI.createSlider(parent, props)
		props = props or {}
		local minValue = props.Min or 0
		local maxValue = props.Max or 100
		local value = clamp(props.Value or minValue, minValue, maxValue)
		local row = UI.row(parent, props.Order, 52)
		UI.basicHover(row, 0.1, 0.08, 0.75, 0.3)
		local label = UI.button({
			Name = "SliderLabel", Parent = row,
			Size = UDim2.new(1, -28, 0, 18), Position = UDim2.new(0, 14, 0, 6),
			BackgroundTransparency = 1, Stroke = false,
			Text = props.Label .. ": " .. math.floor(value + 0.5),
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		})
		local track = UI.button({
			Name = "SliderTrack", Parent = row,
			Size = UDim2.new(1, -28, 0, 8), Position = UDim2.new(0, 14, 1, -22),
			BackgroundColor3 = currentPalette.element, BackgroundTransparency = 0.05,
			Text = "", Corner = 8, StrokeTransparency = 0.55, ThemeBackground = "element",
		})
		local fill = Instance.new("Frame")
		fill.Name = "Fill"
		fill.Size = UDim2.new(0, 0, 1, 0)
		fill.BackgroundColor3 = currentPalette.text
		fill.BorderSizePixel = 0
		fill.Parent = track
		addThemed("accent", fill)
		UI.corner(fill, 8)
		local knob = Instance.new("Frame")
		knob.Name = "Knob"
		knob.Size = UDim2.fromOffset(14, 14)
		knob.AnchorPoint = Vector2.new(0.5, 0.5)
		knob.Position = UDim2.new(0, 0, 0.5, 0)
		knob.BackgroundColor3 = currentPalette.text
		knob.BorderSizePixel = 0
		knob.Parent = track
		addThemed("accent", knob)
		UI.corner(knob, 7)
		local function updateVisual(newValue)
			value = clamp(newValue, minValue, maxValue)
			local ratio = 0
			if maxValue > minValue then
				ratio = (value - minValue) / (maxValue - minValue)
			end
			fill.Size = UDim2.new(ratio, 0, 1, 0)
			knob.Position = UDim2.new(ratio, 0, 0.5, 0)
			label.Text = props.Label .. ": " .. math.floor(value + 0.5)
		end
		local dragging = false
		local function setFromX(x)
			if not track or not track.Parent then return end
			local trackX = track.AbsolutePosition.X
			local trackWidth = track.AbsoluteSize.X
			if trackWidth <= 0 then return end
			local ratio = clamp((x - trackX) / trackWidth, 0, 1)
			local newValue = minValue + ratio * (maxValue - minValue)
			updateVisual(newValue)
			if props.Callback then props.Callback(newValue) end
		end
		track.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				setFromX(input.Position.X)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if dragging then
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					setFromX(input.Position.X)
				end
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)
		updateVisual(value)
		local ret = { row = row }
		ret.set = function(newValue)
			updateVisual(newValue)
			if props.Callback then props.Callback(newValue) end
		end
		return ret
	end

	-- ============================================================
	-- МОДУЛЬ: ПОДТВЕРЖДЕНИЕ ВАЖНЫХ ДЕЙСТВИЙ
	-- ============================================================
	local confirmGui = Instance.new("ScreenGui")
	confirmGui.Name = "FosforConfirmGui"
	confirmGui.ResetOnSpawn = false
	confirmGui.DisplayOrder = 1000
	confirmGui.Parent = playerGui
	confirmGui.IgnoreGuiInset = true

	local confirmOpen = false
	local confirmOverlayRef = nil

	local function confirmAction(props)
		props = props or {}
		if confirmOpen then
			if confirmOverlayRef and confirmOverlayRef.Parent then
				return
			end
			-- диалог умер, не закрывшись — сбрасываем застрявшее состояние
			confirmOpen = false
		end
		confirmOpen = true
		playSound("silent")

		local overlay = Instance.new("Frame")
		overlay.Name = "ConfirmOverlay"
		overlay.Size = UDim2.fromScale(1, 1)
		overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		overlay.BackgroundTransparency = 1
		overlay.BorderSizePixel = 0
		overlay.ZIndex = 50
		overlay.Parent = confirmGui

		local box = Instance.new("CanvasGroup")
		box.Name = "ConfirmBox"
		box.Size = UDim2.fromOffset(360, 180)
		box.AnchorPoint = Vector2.new(0.5, 0.5)
		box.Position = UDim2.new(0.5, 0, 0.5, 20)
		box.BackgroundColor3 = currentPalette.panel
		box.BackgroundTransparency = 0.08
		box.BorderSizePixel = 0
		box.GroupTransparency = 1
		box.ClipsDescendants = true
		box.ZIndex = 51
		box.Parent = overlay
		addThemed("panel", box)
		UI.corner(box, 20)
		UI.gradient(box, 90)
		UI.stroke(box, 0.28, 1)
		UI.stroke(box, 0.72, 3)
		UI.sheen(box, 0.12)

		local icon = Instance.new("ImageLabel")
		icon.Name = "ConfirmIcon"
		icon.Size = UDim2.fromOffset(68, 68)
		icon.Position = UDim2.new(0, 16, 0, 18)
		icon.BackgroundTransparency = 1
		icon.Image = props.icon or "rbxassetid://117047005144143"
		icon.ImageColor3 = currentPalette.text
		icon.ScaleType = Enum.ScaleType.Fit
		icon.ZIndex = 52
		icon.Parent = box

		local titleLabel = Instance.new("TextLabel")
		titleLabel.Size = UDim2.new(1, -110, 0, 20)
		titleLabel.Position = UDim2.new(0, 96, 0, 24)
		titleLabel.BackgroundTransparency = 1
		titleLabel.Text = props.title or "Подтверждение"
		titleLabel.TextXAlignment = Enum.TextXAlignment.Left
		titleLabel.Font = Enum.Font.GothamBold
		titleLabel.TextSize = 16
		titleLabel.TextColor3 = currentPalette.text
		titleLabel.ZIndex = 52
		titleLabel.Parent = box
		addThemed("text", titleLabel)

		local descLabel = Instance.new("TextLabel")
		descLabel.Size = UDim2.new(1, -110, 0, 46)
		descLabel.Position = UDim2.new(0, 96, 0, 50)
		descLabel.BackgroundTransparency = 1
		descLabel.Text = props.text or "Ты уверен?"
		descLabel.TextWrapped = true
		descLabel.TextXAlignment = Enum.TextXAlignment.Left
		descLabel.TextYAlignment = Enum.TextYAlignment.Top
		descLabel.Font = Enum.Font.Gotham
		descLabel.TextSize = 13
		descLabel.TextColor3 = currentPalette.sub
		descLabel.ZIndex = 52
		descLabel.Parent = box
		addThemed("sub", descLabel)

		local acceptBtn = UI.button({
			Name = "AcceptBtn", Parent = box,
			Size = UDim2.new(0.5, -20, 0, 36), Position = UDim2.new(0, 14, 1, -50),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.1,
			Text = props.accept or "Да, выполнить", TextSize = 13,
			Font = Enum.Font.GothamBold, Corner = 10, StrokeTransparency = 0.4,
		})
		acceptBtn.TextColor3 = Color3.fromRGB(12, 12, 16)
		acceptBtn.ZIndex = 52
		UI.basicHover(acceptBtn, 0.1, 0.02, 0.4, 0.1)

		local cancelBtn = UI.button({
			Name = "CancelBtn", Parent = box,
			Size = UDim2.new(0.5, -20, 0, 36), Position = UDim2.new(0.5, 6, 1, -50),
			BackgroundTransparency = 0.1, Text = props.cancel or "Отмена", TextSize = 13,
			ThemeBackground = "element", ThemeText = "text",
			Font = Enum.Font.GothamBold, Corner = 10, StrokeTransparency = 0.4,
		})
		cancelBtn.ZIndex = 52
		UI.basicHover(cancelBtn, 0.1, 0.02, 0.4, 0.1)

		Animations.tween(overlay, {BackgroundTransparency = 0.45}, 0.2)
		Animations.tween(box, {Position = UDim2.new(0.5, 0, 0.5, 0), GroupTransparency = 0}, 0.3)
		confirmOverlayRef = overlay
		-- страховка видимости: даже если твины не отыграют, диалог обязан появиться
		task.delay(0.4, function()
			if box and box.Parent then
				box.GroupTransparency = 0
				box.Position = UDim2.new(0.5, 0, 0.5, 0)
			end
			if overlay and overlay.Parent then
				overlay.BackgroundTransparency = 0.45
			end
		end)
		-- клик мимо диалога = отмена (аварийный выход из любого зависшего диалога)
		overlay.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				if box and box.Parent then
					local m = UserInputService:GetMouseLocation()
					local ap, as = box.AbsolutePosition, box.AbsoluteSize
					if m.X < ap.X or m.X > ap.X + as.X or m.Y < ap.Y or m.Y > ap.Y + as.Y then
						close(false)
					end
				end
			end
		end)

		local function close(result)
			confirmOpen = false
			confirmOverlayRef = nil
			Animations.tween(overlay, {BackgroundTransparency = 1}, 0.2)
			Animations.tween(box, {Position = UDim2.new(0.5, 0, 0.5, 20), GroupTransparency = 1}, 0.25)
			task.delay(0.25, function()
				if overlay and overlay.Parent then overlay:Destroy() end
			end)
			if result then
				playSound("silent")
				if props.onAccept then pcall(props.onAccept) end
			else
				playSound("silent")
				if props.onCancel then pcall(props.onCancel) end
			end
		end

		acceptBtn.MouseButton1Click:Connect(function()
			close(true)
		end)
		cancelBtn.MouseButton1Click:Connect(function()
			close(false)
		end)
	end

	-- ===== боковая панель больших настроек (справа от основной панели) =====
	local sidePanel, sideContent = nil, nil
	local function closeSidePanel()
		if sidePanel then
			Animations.tween(sidePanel, {GroupTransparency = 1}, 0.18)
			task.delay(0.2, function() if sidePanel then sidePanel:Destroy() end end)
			sidePanel = nil
			sideContent = nil
		end
	end
	local function openSidePanel(title, buildFn)
		closeSidePanel()
		pcall(function()
			local abs = main.AbsolutePosition
			local size = main.AbsoluteSize
			sidePanel = Instance.new("CanvasGroup")
			sidePanel.Name = "FosforSidePanel"
			sidePanel.Size = UDim2.fromOffset(300, size.Y)
			sidePanel.Position = UDim2.fromOffset(abs.X + size.X + 10, abs.Y)
			sidePanel.BackgroundColor3 = currentPalette.panel
			sidePanel.BackgroundTransparency = 0.06
			sidePanel.BorderSizePixel = 0
			sidePanel.GroupTransparency = 1
			sidePanel.ZIndex = 45
			sidePanel.Parent = gui
			UI.corner(sidePanel, 16)
			UI.gradient(sidePanel, 90)
			UI.stroke(sidePanel, 0.28, 1)
			UI.stroke(sidePanel, 0.72, 3)
			local ttl = Instance.new("TextLabel")
			ttl.Size = UDim2.new(1, -56, 0, 44)
			ttl.Position = UDim2.new(0, 16, 0, 4)
			ttl.BackgroundTransparency = 1
			ttl.Text = title
			ttl.Font = Enum.Font.GothamBold
			ttl.TextSize = 16
			ttl.TextColor3 = currentPalette.text
			ttl.TextXAlignment = Enum.TextXAlignment.Left
			ttl.TextWrapped = true
			ttl.Parent = sidePanel
			addThemed("text", ttl)
			local xBtn = Instance.new("TextButton")
			xBtn.Size = UDim2.fromOffset(30, 30)
			xBtn.Position = UDim2.new(1, -38, 0, 8)
			xBtn.BackgroundColor3 = currentPalette.element
			xBtn.BackgroundTransparency = 0.1
			xBtn.Text = "X"
			xBtn.Font = Enum.Font.GothamBold
			xBtn.TextSize = 13
			xBtn.TextColor3 = currentPalette.text
			xBtn.Parent = sidePanel
			UI.corner(xBtn, 8)
			xBtn.MouseButton1Click:Connect(function() closeSidePanel() end)
			local scroll = UI.createScrollArea(sidePanel)
			scroll.Position = UDim2.new(0, 0, 0, 52)
			scroll.Size = UDim2.new(1, 0, 1, -52)
			sideContent = scroll
			Animations.tween(sidePanel, {GroupTransparency = 0}, 0.25)
			if buildFn then buildFn(scroll) end
		end)
	end

	-- ============================================================
	-- СОСТОЯНИЕ UI + КОНТРАКТ ОПЕРЕЖАЮЩИХ ОБЪЯВЛЕНИЙ
	-- (всё, что определяется НИЖЕ, но нужно ВЫШЕ по коду)
	-- ============================================================
	local main = nil
	local island = nil
	local islandLabel = nil
	local pages = {}
	local navButtons = {}
	local currentTab = nil
	local uiOpen = false
	local introDone = false
	local minimized = false
	local savedPosition = nil
	local unloaded = false
	local fullUnload -- forward: определен ниже; нужен и кнопке закрытия, и анти-дублем
	-- анти-дубль: каждый новый запуск скрипта глушит все предыдущие копии.
	-- kill-ticket через атрибут PlayerGui работает даже если getgenv у скриптов раздельный
	pcall(function()
		playerGui:SetAttribute("FosforKillTicket", tostring(os.clock()) .. "_" .. tostring(math.random(100000, 999999)))
		playerGui:GetAttributeChangedSignal("FosforKillTicket"):Connect(function()
			if fullUnload then
				pcall(function() fullUnload(true) end)
			end
		end)
	end)
	pcall(function()
		if getgenv and getgenv().FosforUnloadPrevious then
			getgenv().FosforUnloadPrevious()
		end
	end)
	local switchTab
	local updateNavStyles
	local updateAllToggles
	local applyTheme
	local setTheme
	local addConsoleLine
	local clearConsole
	local setWindowTransparency
	local addRecent
	local updateRecent
	local showIsland
	local hideIsland
	local notify
	local recentScripts = {}
	local recentTextButtons = {}

	local _fs_t2b = 81

	local _fs_oid = _fs_a + _fs_b
	local _fs_tids = {_fs_t1a + _fs_t1b, _fs_t2a + _fs_t2b}

	local function log(text, kind)
		if addConsoleLine then addConsoleLine(text, kind or "sub") end
		if notify then notify(text) end
	end

	-- ============================================================
	-- Lib: общие хелперы (IIFE, 1 локал)
	-- ============================================================
	local Lib = (function()
		local lib = {}
		function lib.cam() return workspace.CurrentCamera end
		function lib.rootOf(c) return c and c:FindFirstChild("HumanoidRootPart") end
		function lib.headOf(c) return c and c:FindFirstChild("Head") end
		function lib.charsSet()
			local set = {}
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr.Character then set[plr.Character] = true end
			end
			return set
		end
		function lib.inAnyCharacter(inst, chars)
			local node = inst
			while node and node ~= workspace do
				if chars[node] then return true end
				node = node.Parent
			end
			return false
		end
		function lib.cheapRootOf(inst, chars)
			local node = inst.Parent
			local best = nil
			local depth = 0
			while node and node ~= workspace and depth < 10 do
				if chars[node] then return nil end
				best = node
				if node:IsA("Model") then
					local parent = node.Parent
					if parent == workspace or (parent and parent.Parent == workspace) then break end
				end
				node = node.Parent
				depth = depth + 1
			end
			if best and chars[best] then return nil end
			return best
		end
		lib.TOY_IDS = {
			"PalletLightBrown","BallSnowball","BombBalloon","BombDarkMatter","BombMissile",
			"ArmChairBlue","ArmChairBrownGray","ArmChairDarkGray","ArmChairLightBrownGray","ArmChairPink","ArmChairWhite",
			"BathroomShower","BathroomSink","BedBlanketBlue","BedFramedOrange","BedFuton",
			"ChildrensChair","ChildrensCouch","ChildrensDesk","ChildrensShelf","ChildrensTable","ChildrensTableBench","ChildrensTableBenchSmall",
			"ClockAlarm","ComputerLaptopOld","CouchBlue","CouchBrownGray","CouchDarkGray","CouchLightBrownGray","CouchPink","CouchWhite",
			"CounterCorner","CounterSink","CounterStraight",
			"FactoryBench","FactoryCabinet","FactoryChair","FactoryCouch","FactoryDesk","FactoryDeskMini","FactoryLight","FactoryShelf","FactoryTable",
			"FanElectricLittle","FanPaper","FridgeBlack","FutureAngularDesk","JukeboxBlue","JukeboxOrange",
			"JapaneseBanner","JapaneseBench","JapaneseChair","JapaneseCouch","JapaneseDeskMini","JapaneseDresser","JapaneseLantern","JapaneseShelf","JapaneseTable",
			"LadderLightBrown","LightLampGray","MachineWasher","NormalBench","NormalDesk","NormalCabinet","NormalShelves",
			"OvenBlack","OvenDarkGray","OvenLightGray","OvenMicrowaveWhite","OvenRusty",
			"PlantPottedBonsai","PlantPottedCactus","PlantPottedTree","PlantPottedTreeChristmas","RedGateGong",
			"SpookyBench","SpookyCabinet","SpookyChair","SpookyCouch","SpookyDesk","SpookyStool","SpookyShelf","SpookyTable",
			"TableLunchTable","TableSmallLabTable","TableWoodFourLegsBrown","TableWoodTwoLegs",
			"TelevisionFlatscreen","TelevisionGray","ToiletGold","ToiletWhite",
			"Airhorn","Boombox","BubbleBlower","BucketPaint","Campfire","CreatureBlobman","CreatureRobot","DiscoColorBall",
			"FireExtinguisher","FireworkSmokeBomb","FireworkMissile","FireworkSparkler","FloatingIsland",
			"FlyingToyHelicopter","FlyingToyPlane","FlyingToyUfo","FoodHotSauce",
			"InstrumentBrassBugle","InstrumentBrassTrumpet","InstrumentBrassVuvuzela","InstrumentDrumBongos","InstrumentDrumSnare",
			"InstrumentGuitarAcoustic","InstrumentGuitarBanjo","InstrumentGuitarLyre","InstrumentGuitarUkulele","InstrumentGuitarViolin",
			"InstrumentPianoKeyboard","InstrumentPianoMelodica","InstrumentVoiceMicrophone","InstrumentWoodwindOcarina","InstrumentWoodwindSaxophone",
			"MidiMaker","MusicKeyboard","NinjaKatana","NinjaKunai","NinjaShuriken","NpcRobloxianMascot","PaperPlane",
			"PetSnowman","PetTurkeyLeg","PlayhouseGingerbread","PresentBig","PresentSmall","SantaSleigh","SoundWaveMaker","SprayCanWD",
			"ToolCleaver","ToolDiggingForkRusty","ToolPencil","ToolPickaxe","TractorGreen","TractorOrange","TractorRed","YouDecoy","YouLittle",
			"AnvilGray","BallBasketball","BellBig","BellSmall","BookNormal","BookManyPages","BoxCrateWood","DiceBig","DiceSmall",
			"DrawerLightBrown","FlagUnitedStatesOfAmerica","FoodPlate","GlassBoxGray","HayBale",
			"MineralDiamond","MineralCrystalPink","MineralIngotGold","PoopPile","PoopPileSparkle","RollerGrayPurple","Snowflake","TeapotUtah",
			"TetracubeI","TetracubeJ","TetracubeL","TetracubeO","TetracubeS","TetracubeT","TetracubeZ",
			"ToyAnimalBear","ToyAnimalDuck","ToyAnimalFrog","ToyAnimalTiger","ToyAnimalUnicorn","YouFigurine",
			"BallMagicLight","LightLampDeskLampBent","SpotlightBlue","SpotlightCyan","SpotlightCyanBlue","SpotlightCyanGreen",
			"SpotlightGreen","SpotlightMagenta","SpotlightRed","SpotlightWhite","SpotlightYellow","SpotlightYellowGreen","SpotlightYellowRed",
			"SpookyCandle1","SpookyCandle3","SpookyCandle5",
			"CupMugBrown","CupMugWhite","FoodBanana","FoodBread","FoodBroccoli","FoodCakePink","FoodCoconut","FoodDippyEgg",
			"FoodDonut","FoodFrenchFries","FoodHamburger","FoodHotdog","FoodMayonnaise","FoodMeatStick","FoodMushroomPoison",
			"FoodPizzaCheese","FoodPizzaPepperoni",
		}
		lib.TOY_SET = {}
		lib.TOY_LOWER = {}
		for _, id in ipairs(lib.TOY_IDS) do
			lib.TOY_SET[id] = true
			lib.TOY_LOWER[string.lower(id)] = true
		end
		function lib.collectPalletPartsTop()
			local result = {}
			pcall(function()
				local chars = lib.charsSet()
				for _, d in ipairs(workspace:GetDescendants()) do
					if d:IsA("BasePart") and d.Transparency < 1 then
						local nm = (d.Name or ""):lower()
						local pn = (d.Parent and d.Parent.Name or ""):lower()
						if nm:find("pallet", 1, true) or pn:find("pallet", 1, true) then
							if not lib.inAnyCharacter(d, chars) then
								local root = d.Parent or d
								local entry = result[root]
								if not entry then entry = {}; result[root] = entry end
								table.insert(entry, d)
							end
						end
					end
				end
			end)
			return result
		end
		return lib
	end)()

	-- ============================================================
	-- Mods: оболочка модулей (IIFE, 1 локал)
	-- ============================================================
	local Mods = (function()
		local list = {}
		local byId = {}
		local api = {}
		api._containers = {}
		api._pages = nil
		api.Colors = {
			accent = Color3.fromRGB(168, 85, 247),
			soft = Color3.fromRGB(168, 85, 247):Lerp(Color3.fromRGB(255, 255, 255), 0.35),
			accent2 = Color3.fromRGB(168, 85, 247):Lerp(Color3.fromRGB(255, 255, 255), 0.5),
		}
		api._colorHooks = {}
		api.OnColorChange = function(fn)
			table.insert(api._colorHooks, fn)
		end
		api.SyncColors = function(palette)
			local acc = palette and (palette.accent or palette.particle or palette.star)
			if typeof(acc) == "Color3" then
				api.Colors.accent = acc
				api.Colors.soft = acc:Lerp(Color3.fromRGB(255, 255, 255), 0.35)
				api.Colors.accent2 = acc:Lerp(Color3.fromRGB(255, 255, 255), 0.5)
			end
			for _, fn in ipairs(api._colorHooks) do pcall(fn) end
		end

		local function persist(mod)
			pcall(function()
				setFeature("FosforMod_" .. mod.Id, {enabled = mod.Enabled, state = mod.State})
			end)
		end
		local function restore(mod)
			pcall(function()
				local data = getFeature("FosforMod_" .. mod.Id)
				if type(data) == "table" then
					if type(data.state) == "table" then
						for k, v in pairs(data.state) do mod.State[k] = v end
					end
					mod._wantEnabled = (data.enabled == true)
				end
			end)
		end

		local function Cleanup(mod)
			for _, c in ipairs(mod.Conns) do pcall(function() c:Disconnect() end) end
			mod.Conns = {}
			for _, i in ipairs(mod.Instances) do pcall(function() i:Destroy() end) end
			mod.Instances = {}
		end
		api.Cleanup = Cleanup

		local function syncMaster(mod, on)
			local mt = mod._masterToggle
			if mt and mt.update then
				if mt.state ~= on then mt.state = on end
				mt.update()
			end
		end

		local function Enable(mod)
			if mod.Enabled then return end
			mod.Enabled = true
			if mod.OnEnable then
				local ok, err = pcall(mod.OnEnable, mod)
				if not ok then
					warn("[Fosfor Mods] " .. tostring(mod.Id) .. " OnEnable: " .. tostring(err))
					mod.Enabled = false
					Cleanup(mod)
					pcall(function() notify("Модуль".. mod.Name ..":".. tostring(err)) end)
					persist(mod)
					return
				end
			end
			syncMaster(mod, true)
			persist(mod)
		end
		local function Disable(mod)
			if not mod.Enabled then return end
			mod.Enabled = false
			if mod.OnDisable then pcall(mod.OnDisable, mod) end
			Cleanup(mod)
			syncMaster(mod, false)
			persist(mod)
		end
		api.Enable = Enable
		api.Disable = Disable
		api.Toggle = function(mod) if mod.Enabled then Disable(mod) else Enable(mod) end end
		api.Get = function(id) return byId[id] end
		api.All = function() return list end
		api.Track = function(mod, inst) table.insert(mod.Instances, inst) return inst end
		api.Connect = function(mod, conn) table.insert(mod.Conns, conn) return conn end

		api.Register = function(def)
			def.State = {}
			for k, v in pairs(def.Defaults or {}) do def.State[k] = v end
			def.Enabled = false
			def.Instances = {}
			def.Conns = {}
			def.UI = nil
			def._uiOrder = 0
			restore(def)
			table.insert(list, def)
			byId[def.Id] = def
			return def
		end

		api._twoCol = { ESP = true, Defence = true, Visual = true, Shaders = true, Maps = true, Misc = true, Themes = true, Settings = true, Console = true }
		api._modCol = {}
		local function containerFor(tab, page)
			if not api._containers[tab] then
				local pg = page or (api._pages and api._pages[tab])
				if pg then api._containers[tab] = UI.createScrollArea(pg) end
			end
			return api._containers[tab]
		end
		api.ContainerForCol = function(mod, page)
			local tab = mod.Tab or "?"
			if not api._twoCol[tab] then
				return containerFor(tab, page)
			end
			api._modCol[tab] = (api._modCol[tab] or 0) + 1
			local isRight = (api._modCol[tab] % 2) == 0
			local key = tab .. ((isRight and "|R") or "|L")
			if not api._containers[key] then
				local pg = page or (api._pages and api._pages[tab])
				if pg then
					local cont = UI.createScrollArea(pg)
					local sc = cont.Parent
					if sc and sc:IsA("ScrollingFrame") then
						if isRight then
							sc.Position = UDim2.new(0.5, 3, 0, 0)
							sc.Size = UDim2.new(0.5, -6, 1, 0)
						else
							sc.Position = UDim2.new(0, 3, 0, 0)
							sc.Size = UDim2.new(0.5, -6, 1, 0)
						end
					end
					api._containers[key] = cont
				end
			end
			return api._containers[key]
		end
		api.ContainerFor = function(tab, page)
			-- двухколоночные вкладки: контент вкладки идет в общую колонку,
			-- отдельный полноширинный контейнер не создается (иначе наложение)
			if api._twoCol[tab] then
				return api.ContainerForCol({Tab = tab}, page)
			end
			if not api._containers[tab] then
				local pg = page or (api._pages and api._pages[tab])
				if pg then api._containers[tab] = UI.createScrollArea(pg) end
			end
			return api._containers[tab]
		end

		local function makeUiApi(mod, page)
			local function nextOrder()
				api._tabOrder = api._tabOrder or {}
				local tab = mod.Tab or "?"
				api._tabOrder[tab] = (api._tabOrder[tab] or 100) + 1
				return api._tabOrder[tab]
			end
			local u = {}
			local myContainer = api.ContainerForCol(mod, page)
			u.Row = function(height)
				return UI.row(myContainer, nextOrder(), height or 38)
			end
			u.Section = function(title)
				local row = UI.row(myContainer, nextOrder(), 30)
				pcall(function()
					UI.button({
						Name = "ModSection", Parent = row,
						Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
						BackgroundTransparency = 1, Stroke = false, Text = title,
						TextXAlignment = Enum.TextXAlignment.Left, TextSize = 15,
						Active = false, ThemeText = "text", Font = Enum.Font.GothamBold,
					})
				end)
				return row
			end
			u.Toggle = function(label, default, cb)
				local cur = mod.State[label]
				if cur == nil then cur = default end
				local data
				pcall(function()
					data = UI.createToggle(myContainer, label, cur, function(v)
						mod.State[label] = v
						persist(mod)
						if cb then cb(v) end
					end, nextOrder())
				end)
				mod._toggles = mod._toggles or {}
				mod._toggles[label] = data
				return data
			end
			u.Slider = function(label, min, max, default, cb)
				local cur = mod.State[label]
				if cur == nil then cur = default end
				local obj
				pcall(function()
					obj = UI.createSlider(myContainer, {
						Label = label, Min = min, Max = max, Value = cur, Order = nextOrder(),
						Callback = function(v)
							mod.State[label] = v
							persist(mod)
							if cb then cb(v) end
						end,
					})
				end)
				return obj
			end
			u.Button = function(label, cb, btnText)
				local row = UI.row(myContainer, nextOrder(), 42)
				pcall(function() UI.basicHover(row, 0.1, 0.08, 0.75, 0.25) end)
			pcall(function()
				UI.scrollingLabel(UI.button({
					Name = "ModBtnLabel", Parent = row,
					Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 14, 0, 0),
					BackgroundTransparency = 1, Stroke = false, Text = label,
					TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
					Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
				}), "text")
			end)
				local btn = UI.button({
					Name = "ModBtn", Parent = row,
					Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
					BackgroundTransparency = 0.1, Text = btnText or "Нажать", TextSize = 12,
					ThemeBackground = "element", ThemeText = "text",
					Font = Enum.Font.Gotham, Corner = 10,
				})
				pcall(function() UI.basicHover(btn, 0.1, 0.03, 0.6, 0.08) end)
				if cb then btn.MouseButton1Click:Connect(function() cb() end) end
				return btn
			end
			return u
		end

		api.AttachAll = function(pagesTable)
			api._pages = pagesTable
			for key, page in pairs(pagesTable or {}) do
				if not api._containers[key] and not api._twoCol[key] then
					api._containers[key] = UI.createScrollArea(page)
				end
			end
			for _, mod in ipairs(list) do
				local page = pagesTable and pagesTable[mod.Tab]
				if page and not mod.UI then
					mod.UI = makeUiApi(mod, page)
					if mod.Build then
						local okB, errB = pcall(mod.Build, mod, mod.UI)
						if not okB then
							warn("[Fosfor Mods] " .. tostring(mod.Id) .. " Build: " .. tostring(errB))
							pcall(function() notify("Модуль " .. tostring(mod.Name) .. ": ошибка UI — см. F9") end)
						end
						if mod._subRows then
							local vis = (mod.Enabled or mod._wantEnabled == true)
							for _, r in ipairs(mod._subRows) do
								if r and r.Parent then r.Visible = vis end
							end
						end
					end
					if mod._wantEnabled then Enable(mod) end
				end
			end
			for _, mod in ipairs(list) do
				if mod.Auto and not mod.Enabled then
					Enable(mod)
				end
			end
			for _, mod in ipairs(list) do
				if mod._masterToggle then
					if mod._masterToggle.state ~= mod.Enabled then
						mod._masterToggle.state = mod.Enabled
					end
					mod._masterToggle.update()
				end
				if mod._subRows then
					for _, r in ipairs(mod._subRows) do
						if r and r.Parent then r.Visible = mod.Enabled end
					end
				end
			end
		end

		local function fail(mod, err)
			warn("[Fosfor Mods] " .. tostring(mod.Id) .. ": " .. tostring(err))
			pcall(function() Disable(mod) end)
			pcall(function() notify("".. mod.Name ..":".. tostring(err)) end)
		end
		RunService.RenderStepped:Connect(function(dt)
			for _, mod in ipairs(list) do
				if mod.Enabled and mod.OnRender then
					local ok, err = pcall(mod.OnRender, mod, dt)
					if not ok then fail(mod, err) end
				end
			end
		end)
		RunService.Heartbeat:Connect(function(dt)
			for _, mod in ipairs(list) do
				if mod.Enabled and mod.OnHeartbeat then
					local ok, err = pcall(mod.OnHeartbeat, mod, dt)
					if not ok then fail(mod, err) end
				end
			end
		end)

		api.SyncColors(currentPalette)
		return api
	end)()

	-- ============================================================
	-- МОДУЛЬ: БЕЗОПАСНЫЙ LOADSTRING + HTTP
	-- ============================================================
	local function safeHttpGet(url)
		if typeof(game) == "Instance" and typeof(game.HttpGet) == "function" then
			local ok, source = pcall(function() return game:HttpGet(url) end)
			if ok then return true, source end
			return false, source
		end
		return false, "HttpGet недоступен"
	end

	local function safeLoadstring(source)
		if typeof(loadstring) ~= "function" then
			return false, "loadstring недоступен в этом окружении"
		end
		local ok, compiled = pcall(loadstring, source)
		if not ok then return false, compiled end
		if typeof(compiled) ~= "function" then
			return false, "loadstring не вернул функцию"
		end
		local runOk, runError = pcall(compiled)
		if not runOk then return false, runError end
		return true
	end

	local function executeScriptFromURL(name, url)
		if not url or url == "" then return false, "URL не задан" end
		if addConsoleLine then addConsoleLine("Загрузка скрипта: " .. name .. "...", "sub") end
		local httpOk, source = safeHttpGet(url)
		if not httpOk then
			local err = "Ошибка загрузки: " .. tostring(source)
			if addConsoleLine then addConsoleLine(err, "sub") end
			return false, err
		end
		local runOk, runError = safeLoadstring(source)
		if not runOk then
			local err = "Ошибка выполнения: " .. tostring(runError)
			if addConsoleLine then addConsoleLine(err, "sub") end
			warn("[Fosfor] Error executing " .. name .. ": " .. tostring(runError))
			return false, err
		end
		if addConsoleLine then addConsoleLine("Скрипт " .. name .. " успешно загружен и выполнен.", "info") end
		if notify then notify("Скрипт " .. name .. " выполнен") end
		return true
	end

	-- ============================================================
	-- БИБЛИОТЕКА СКРИПТОВ
	-- ============================================================
	local scriptLibrary = {
		{Name = "Fosfor PVO", Description = "Predator FPV — ракетный модуль от Fosfor", URL = "https://raw.githubusercontent.com/qwett943/Fosfor-Visuals/qwett943-patch-1/Fosfor%20PVO.txt"},
		{Name = "Infinity Yield", Description = "Админ-скрипт Infinity Yield", URL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
	}
	local scriptRows = {}

-- ===== КОНЕЦ ЧАСТИ 1 ===== (следующая часть: GUI окна, шапка, навигация-каркас, статус, бейджи, show/hide, островок, уведомления)
	-- ============================================================
	-- ОСНОВНОЙ GUI
	-- ============================================================
	local gui = Instance.new("ScreenGui")
	gui.Name = "FosforGui"
	gui.ResetOnSpawn = false
	gui.DisplayOrder = 999
	gui.IgnoreGuiInset = true
	gui.Parent = playerGui
	-- ===== i18n: реестр текста UI и переключатель RU/EN =====
	local langRegistry = {}
	local currentLang = (getFeature("Fosfor_Lang") == "EN") and "EN" or "RU"
	local function registerLangText(obj)
		if langRegistry[obj] then return end
		langRegistry[obj] = true
		pcall(function()
			if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) and obj.Text ~= "" and #obj.Text <= 200 then
				obj:SetAttribute("FosforLangRU", obj.Text)
			end
			obj:GetPropertyChangedSignal("Text"):Connect(function()
				if obj:IsDescendantOf(gui) and obj.Text ~= "" and #obj.Text <= 200 and obj:GetAttribute("FosforLangRU") == nil then
					obj:SetAttribute("FosforLangRU", obj.Text)
				end
			end)
		end)
	end
	local TR = {
		["Профиль"] = "Profile", ["Скрипты"] = "Scripts", ["Телепорты"] = "Teleports",
		["Защита"] = "Defense", ["Визуал"] = "Visuals", ["Шейдеры"] = "Shaders",
		["Разное"] = "Misc", ["Темы и UI"] = "Themes & UI", ["Настройки"] = "Settings", ["Конфиги"] = "Configs",
		["AEGIS-2 (полная самозащита)"] = "AEGIS-2 (full self-defense)",
		["Единая сессия-FSM: IDLE-ENGAGED-ESCAPE-SAFE"] = "Single session FSM: IDLE-ENGAGED-ESCAPE-SAFE",
		["Телеметрия"] = "Telemetry", ["Авто-уход из спавна"] = "Auto leave spawn", ["Чистка FireAllRemotes"] = "FireAllRemotes cleanup",
		["Blackbox в файл"] = "Blackbox to file", ["Телеметрия в файл:"] = "Telemetry to file:", ["Сбросить"] = "Flush",
		["Anti Blob (анти-похищение)"] = "Anti Blob (anti-kidnap)",
		["Ломать детекторы"] = "Break detectors", ["Побег с чужого сида"] = "Escape foreign seat", ["Детектор привязок"] = "Weld detector",
		["Anti Fire (тушение)"] = "Anti Fire (extinguish)", ["Anti Boom (взрыв рядом)"] = "Anti Explosion (nearby blast)",
		["Anti Lag (линии/пакеты)"] = "Anti Lag (lines/packets)", ["Очистить линии сейчас:"] = "Clean lines now:", ["Очистить"] = "Clean",
		["Авто-лив при атаке"] = "Auto leave on attack", ["Пакет-лаг (ExtendGrabLine)"] = "Packet lag (ExtendGrabLine)",
		["Спам линий (лаг линиями)"] = "Line spam", ["Попытка кика (BodyMovers на мне)"] = "Kick attempt (BodyMovers on me)",
		["Просадка FPS"] = "FPS drop", ["Порог пакет-лага (МБ)"] = "Packet lag threshold (MB)",
		["Линий за 2 сек = триггер"] = "Lines per 2 sec = trigger", ["Минимум FPS"] = "Minimum FPS",
		["Ходьба по океану"] = "Ocean walk",
		["Удаление ног (меньше хитбокс)"] = "Delete legs (smaller hitbox)", ["Удалить ноги сейчас:"] = "Delete legs now:", ["Удалить"] = "Delete",
		["Авто при респавне"] = "Auto on respawn", ["HipHeight-компенсация"] = "HipHeight compensation",
		["Якорить взятые предметы"] = "Anchor held items", ["Разъякорить всё:"] = "Unanchor all:", ["Разъякорить"] = "Unanchor",
		["Разъякорить при выключении"] = "Unanchor on disable",
		["Korblox и Headless (только для тебя)"] = "Korblox & Headless (you only)",
		["Korblox (правая нога)"] = "Korblox (right leg)", ["Headless (пенёк-шея)"] = "Headless (neck stub)",
		["Голова полностью невидима"] = "Fully invisible head", ["Повторять при респавне"] = "Reapply on respawn",
		["Раскраска досок (цвет + текст)"] = "Board painter (color + text)",
		["Цвет доски (центр = темнее)"] = "Board color (center = darker)", ["Цвет текста"] = "Text color",
		["Чёрная + Fosfor"] = "Black + Fosfor", ["Текст на доске:"] = "Board text:", ["до 10 символов"] = "up to 10 chars",
		["Покрасить мои доски:"] = "Paint my boards:", ["Покрасить"] = "Paint",
		["Мотивация при смерти"] = "Death motivation", ["Снежные частицы на экране смерти"] = "Snow particles on death screen",
		["HUD-плашки (время/сервер)"] = "HUD plaques (time/server)", ["Размер плашек"] = "Plaque size",
		["Текстура на палетках"] = "Pallet texture", ["RGB Палетка (перелив цвета)"] = "RGB pallet (color cycle)", ["Скорость RGB %"] = "RGB speed %",
		["Режим съёмки (C — показать/скрыть UI)"] = "Filming mode (C — show/hide UI)",
		["Прицел (центр экрана)"] = "Crosshair (screen center)", ["Точка в центре"] = "Center dot", ["Круг вокруг"] = "Circle around",
		["Размер прицела"] = "Crosshair size", ["Прозрачность прицела %"] = "Crosshair transparency %",
		["ESP Хайлайты игроков"] = "ESP player highlights", ["Прозрачность заливки %"] = "Fill transparency %", ["Скорость пульса"] = "Pulse speed",
		["Подсветка предметов"] = "Item highlight", ["Только мои предметы"] = "Only my items", ["Прозрачность контура %"] = "Outline transparency %",
		["Стрелки у ног"] = "Foot arrows", ["И на других игроках"] = "Also on other players",
		["Target рамка на игрока"] = "Target frame on player", ["Target рамка на предмет"] = "Target frame on item",
		["Скорость вращения"] = "Spin speed",
		["PVP Матч"] = "PVP Match", ["Окно килла (сек)"] = "Kill window (sec)",
		["Баннеры и фразы при сериях"] = "Kill banners & streak phrases", ["Окно мульти-килла (сек)"] = "Multi-kill window (sec)",
		["День / Ночь"] = "Day / Night", ["Час ночи"] = "Night hour", ["Час утра"] = "Morning hour", ["Час вечера"] = "Evening hour",
		["Дождь"] = "Rain", ["Снег"] = "Snow", ["Оттенок из темы"] = "Tint from theme", ["Плотность"] = "Density",
		["Океан (управление)"] = "Ocean (control)", ["Скрыть океан"] = "Hide ocean", ["Физическая вода (Water + блики)"] = "Physical water (Water + highlights)", ["Прозрачность океана %"] = "Ocean transparency %",
		["Режим спектатора (свободная камера)"] = "Spectator mode (free camera)", ["Скорость полёта"] = "Fly speed", ["Ускорение на Shift"] = "Shift speed boost",
		["Трейл"] = "Trail", ["Ширина %"] = "Width %", ["Время жизни %"] = "Lifetime %", ["Прозрачность %"] = "Transparency %", ["Радуга"] = "Rainbow", ["Цвет из темы"] = "Color from theme",
		["R красный"] = "R red", ["G зелёный"] = "G green", ["B синий"] = "B blue",
		["Тема оформления"] = "Theme", ["Прозрачность окна"] = "Window transparency", ["Звуки"] = "Sounds", ["Анимации"] = "Animations",
		["Убрать настройки по умолчанию"] = "Disable default setup",
		["не даёт хабу включать стартовый набор при запуске"] = "stops the hub from auto-enabling the starter set on launch",
		["Язык / Language"] = "Language / Язык",
		["Материал палеток"] = "Pallet material",
		["Раскраска досок"] = "Board painter",
		["применяется ко всем палеткам сразу"] = "applies to all pallets at once",
		["Материал палеток (превью)"] = "Pallet material (preview)",
		["Настроить цвет и текст досок"] = "Customize board color & text",
		["By Fosfor"] = "By Fosfor",
		["FOSFOR"] = "FOSFOR",
		["Материал палеток:"] = "Pallet material:",
		["Турнир"] = "Tournament",
		["Новый год"] = "New Year",
		["Хэллоуин"] = "Halloween",
		["Зимняя"] = "Winter",
		["Dust2"] = "Dust2",
		["Покрасить карту выбранным стилем"] = "Paint map with selected style",
		["Рестайл карты (стили покраски)"] = "Map restyle (paint styles)",
		["Стиль покраски:"] = "Paint style:",
		["Рестайл карты (dust2)"] = "Map restyle (dust2)",
		["Рестайл карты (стиль dust2)"] = "Map restyle (dust2 style)",
		["Покрасить карту (стиль dust2)"] = "Paint map (dust2 style)",
		["Вернуть оригинальные цвета"] = "Restore original colors",
		["MapRestyle: workspace.Map не найден"] = "MapRestyle: workspace.Map not found",
		["MapRestyle: покрашено частей: "] = "MapRestyle: parts painted: ",
		["MapRestyle: оригинальные цвета возвращены"] = "MapRestyle: original colors restored",
		["Boost FPS Map: большая карта построена над островом (телепорт — кнопкой)"] = "Boost FPS Map: big map built above the island (teleport via button)",
		["Анимации"] = "Animations",
		["Звуки"] = "Sounds",
		["Прозрачность окна"] = "Window transparency",
		["B синий"] = "B blue",
		["G зелёный"] = "G green",
		["Цвет из темы"] = "Color from theme",
		["Радуга"] = "Rainbow",
		["Прозрачность %"] = "Transparency %",
		["Время жизни %"] = "Lifetime %",
		["Ширина %"] = "Width %",
		["Час вечера"] = "Evening hour",
		["Час утра"] = "Morning hour",
		["Час ночи"] = "Night hour",
		["Оттенок из темы"] = "Tint from theme",
		["Плотность"] = "Density",
		["Снег"] = "Snow",
		["Прозрачность океана %"] = "Ocean transparency %",
		["Физическая вода (Water + блики)"] = "Physical water (Water + highlights)",
		["Скрыть океан"] = "Hide ocean",
		["Скорость полёта"] = "Fly speed",
		["Ускорение на Shift"] = "Shift speed boost",
		["Скорость RGB %"] = "RGB speed %",
		["RGB Палетка (перелив цвета)"] = "RGB pallet (color cycle)",
		["Окно мульти-килла (сек)"] = "Multi-kill window (sec)",
		["Стиль меню игры (стиль Fosfor)"] = "Menu restyle (Fosfor style)",
		["Разъякорить"] = "Unanchor",
		["Разъякорить всё:"] = "Unanchor all:",
		["HipHeight-компенсация"] = "HipHeight compensation",
		["Удалить"] = "Delete",
		["Удалить ноги сейчас:"] = "Delete legs now:",
		["Очистить"] = "Clean",
		["Очистить линии сейчас:"] = "Clean lines now:",
		["Anti Boom (взрыв рядом)"] = "Anti Explosion (nearby blast)",
		["Детектор привязок"] = "Weld detector",
		["Побег с чужого сида"] = "Escape foreign seat",
		["Сбросить"] = "Flush",
		["Телеметрия в файл:"] = "Telemetry to file:",
		["Чистка FireAllRemotes"] = "FireAllRemotes cleanup",
		["Авто-уход из спавна"] = "Auto leave spawn",
		["Повторять при респавне"] = "Reapply on respawn",
		["Headless (пенёк-шея)"] = "Headless (neck stub)",
		["Стиль монет"] = "Coin style",
		["FPS Unlocker"] = "FPS Unlocker",
		["Anti-AFK"] = "Anti-AFK",
		["Fullbright"] = "Fullbright",
		["Учёт грабов и убийств"] = "Grab & kill counting",
		["Карты"] = "Maps",
		["Boost FPS Map"] = "Boost FPS Map",
		["Построить карту Boost FPS"] = "Build Boost FPS map",
		["Убрать карту"] = "Remove map",
		["Телепорт на карту"] = "Teleport to map",
		["Boost FPS Map: сначала постройте карту"] = "Boost FPS Map: build the map first",
		["Boost FPS Map: карта убрана"] = "Boost FPS Map: removed",
		["Boost FPS Map: карта построена над островом (телепорт — кнопкой)"] = "Boost FPS Map: built above the island (teleport via button)",
		["Стиль меню"] = "Menu style",
		["Килл-стрики (Dota 2)"] = "Kill streaks (Dota 2)",
		[" День / Ночь"] = " Day / Night",
		["День / Ночь"] = "Day / Night",
		["Вид от 3 лица (далёкая камера)"] = "Third person (far camera)", ["Дистанция зума"] = "Zoom distance",
		["Замена звуков по категориям"] = "Sound remap by category",
		["Рестайл меню игры (стиль Fosfor)"] = "Menu restyle (Fosfor style)",
		["Иконка кристалла + новый шрифт у баланса"] = "Coin icon + new balance font",
		["Баннеры и фразы при сериях"] = "Streak banners & phrases", ["Окно мульти-килла (сек)"] = "Multi-kill window (sec)",
	}
	local function applyLanguage()
		pcall(function()
			for _, obj in ipairs(gui:GetDescendants()) do
				if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
					registerLangText(obj)
				end
			end
			for obj in pairs(langRegistry) do
				pcall(function()
					local ru = obj:GetAttribute("FosforLangRU")
					if ru and obj.Parent then
						local target = (currentLang == "EN") and (TR[ru] or ru) or ru
						if obj.Text ~= target then obj.Text = target end
					end
				end)
			end
		end)
	end
	local function setLanguage(lang)
		currentLang = lang
		setFeature("Fosfor_Lang", lang)
		applyLanguage()
	end

	main = Instance.new("CanvasGroup")
	main.Name = "FosforWindow"
	main.Size = UDim2.fromOffset(720, 460)
	main.Position = UDim2.new(0.5, -360, 0.55, -230)
	main.BackgroundColor3 = currentPalette.panel
	main.BackgroundTransparency = 0.3
	main.BorderSizePixel = 0
	main.GroupTransparency = 1
	main.ClipsDescendants = true
	main.ZIndex = 2
	main.Parent = gui
	addThemed("panel", main)
	UI.corner(main, 22)
	UI.gradient(main, 90)
	UI.stroke(main, 0.28, 1)
	UI.stroke(main, 0.72, 3)
	UI.stroke(main, 0.9, 8)
	UI.sheen(main, 0.1)

	-- ============================================================
	-- ЗАГОЛОВОК
	-- ============================================================
	local titleBar = Instance.new("Frame")
	titleBar.Name = "TitleBar"
	titleBar.Size = UDim2.new(1, 0, 0, 48)
	titleBar.BackgroundTransparency = 1
	titleBar.ZIndex = 2
	titleBar.Parent = main

	local dragArea = Instance.new("TextButton")
	dragArea.Name = "DragArea"
	dragArea.Size = UDim2.fromScale(1, 1)
	dragArea.BackgroundColor3 = currentPalette.bg
	dragArea.BackgroundTransparency = 0.999
	dragArea.Text = ""
	dragArea.AutoButtonColor = false
	dragArea.Active = true
	dragArea.ZIndex = 1
	dragArea.Parent = titleBar

	local logo = UI.button({
		Name = "Logo", Parent = titleBar,
		Size = UDim2.new(0, 200, 1, 0), Position = UDim2.new(0, 16, 0, 0),
		BackgroundTransparency = 1, Stroke = false, Text = "Fosfor",
		Font = Enum.Font.Gotham, TextSize = 24,
		TextXAlignment = Enum.TextXAlignment.Left,
		Active = false, ThemeText = "text", ZIndex = 3,
	})
	pcall(function()
		logo.TextStrokeTransparency = 0.65
		logo.TextStrokeColor3 = currentPalette.stroke
	end)

	task.spawn(function()
		local duration = 2.5
		while logo and logo.Parent do
			local elapsed = 0
			while elapsed < duration and logo and logo.Parent do
				local t = elapsed / duration
				local glow = (math.sin(t * math.pi * 2) + 1) / 2
				local strokeTransparency = 0.8 - glow * 0.65
				pcall(function() logo.TextStrokeTransparency = strokeTransparency end)
				local step = task.wait(0.05)
				if typeof(step) == "number" then
					elapsed = elapsed + step
				else
					elapsed = elapsed + 0.05
				end
			end
		end
	end)

	local logoStarsFrame = Instance.new("Frame")
	logoStarsFrame.Name = "LogoStarsFrame"
	logoStarsFrame.Size = UDim2.new(0, 220, 1, 0)
	logoStarsFrame.Position = UDim2.new(0, 6, 0, 0)
	logoStarsFrame.BackgroundTransparency = 1
	logoStarsFrame.ClipsDescendants = true
	logoStarsFrame.Active = false
	logoStarsFrame.ZIndex = 4
	logoStarsFrame.Parent = titleBar

	local logoStars = {}
	local LOGO_STAR_COUNT = 8
	for i = 1, LOGO_STAR_COUNT do
		local size = math.random(1, 3)
		local star = Instance.new("Frame")
		star.Name = "LogoStar_" .. i
		star.Size = UDim2.fromOffset(size, size)
		star.BackgroundColor3 = currentPalette.logoStar
		star.BackgroundTransparency = 0.3
		star.BorderSizePixel = 0
		star.ZIndex = 4
		star.Parent = logoStarsFrame
		addThemed("logoStar", star)
		UI.corner(star, size)
		local glow = Instance.new("Frame")
		glow.Name = "Glow"
		glow.Size = UDim2.fromScale(4, 4)
		glow.Position = UDim2.new(0.5, 0, 0.5, 0)
		glow.AnchorPoint = Vector2.new(0.5, 0.5)
		glow.BackgroundColor3 = currentPalette.logoStar
		glow.BackgroundTransparency = 0.7
		glow.BorderSizePixel = 0
		glow.ZIndex = 3
		glow.Parent = star
		addThemed("logoStarGlow", glow)
		UI.corner(glow, size * 4)
		local data = {
			frame = star, glow = glow,
			angle = math.random() * math.pi * 2,
			angularSpeed = (math.random(10, 25) / 10) * (math.random(1, 2) == 1 and 1 or -1),
			radiusX = math.random(30, 90),
			radiusY = math.random(8, 16),
			centerX = math.random(40, 180),
			centerY = 24 + math.random(-4, 4),
			twinkleSpeed = math.random(4, 9),
			twinklePhase = math.random() * math.pi * 2,
		}
		table.insert(logoStars, data)
	end

	RunService.Heartbeat:Connect(function(deltaTime)
		for _, data in ipairs(logoStars) do
			if not data.frame or not data.frame.Parent then continue end
			data.angle = data.angle + data.angularSpeed * deltaTime
			local x = data.centerX + math.cos(data.angle) * data.radiusX
			local y = data.centerY + math.sin(data.angle * 1.5) * data.radiusY
			data.frame.Position = UDim2.fromOffset(x, y)
			local twinkle = (math.sin(data.angle * data.twinkleSpeed + data.twinklePhase) + 1) / 2
			data.frame.BackgroundTransparency = 0.2 + twinkle * 0.55
			if data.glow then
				data.glow.BackgroundTransparency = 0.55 + twinkle * 0.35
			end
		end
	end)

	local function createMinimizeButton(offsetX)
		local btn = UI.button({
			Name = "MinimizeButton", Parent = titleBar,
			Size = UDim2.fromOffset(30, 30), Position = UDim2.new(1, offsetX, 0.5, -15),
			BackgroundColor3 = currentPalette.element, BackgroundTransparency = 0.15,
			Text = "_", Font = Enum.Font.GothamBold, TextSize = 20,
			TextColor3 = currentPalette.text, Corner = 9, StrokeTransparency = 0.45,
			ThemeBackground = "element", ThemeText = "text", ZIndex = 5,
		})
		UI.invertHover(btn, "icon", 0.15)
		return btn
	end

	local function createCloseButton(offsetX)
		local btn = Instance.new("TextButton")
		btn.Name = "CloseButton"
		btn.Size = UDim2.fromOffset(30, 30)
		btn.Position = UDim2.new(1, offsetX, 0.5, -15)
		btn.BackgroundColor3 = currentPalette.element
		btn.BackgroundTransparency = 0.15
		btn.BorderSizePixel = 0
		btn.Text = ""
		btn.AutoButtonColor = false
		btn.Active = true
		btn.ZIndex = 50
		btn.Parent = titleBar
		UI.corner(btn, 9)
		local btnStroke = UI.stroke(btn, 0.45, 1)
		addThemed("element", btn)
		local crossContainer = Instance.new("Frame")
		crossContainer.Name = "CrossContainer"
		crossContainer.Size = UDim2.fromOffset(16, 16)
		crossContainer.Position = UDim2.new(0.5, -8, 0.5, -8)
		crossContainer.BackgroundTransparency = 1
		crossContainer.Active = false
		crossContainer.ZIndex = 60
		crossContainer.Parent = btn
		btn.ClipsDescendants = false
		crossContainer.ClipsDescendants = false
		local crossParts = {}
		for i = 1, 2 do
			local line = Instance.new("Frame")
			line.Name = "CrossLine_" .. i
			line.Size = UDim2.fromOffset(16, 2.5)
			line.Position = UDim2.new(0.5, -8, 0.5, -1.25)
			line.AnchorPoint = Vector2.new(0, 0)
			line.BackgroundColor3 = currentPalette.closeCross
			line.BackgroundTransparency = 0
			line.BorderSizePixel = 0
			line.Rotation = (i == 1) and 45 or -45
			line.ZIndex = 65
			line.Parent = crossContainer
			addThemed("closeCross", line)
			table.insert(crossParts, line)
			local lineGlow = Instance.new("Frame")
			lineGlow.Name = "LineGlow"
			lineGlow.Size = UDim2.fromOffset(18, 5)
			lineGlow.Position = UDim2.new(0.5, -9, 0.5, -2.5)
			lineGlow.BackgroundColor3 = currentPalette.closeCross
			lineGlow.BackgroundTransparency = 0.7
			lineGlow.BorderSizePixel = 0
			lineGlow.Rotation = (i == 1) and 45 or -45
			lineGlow.ZIndex = 62
			lineGlow.Parent = crossContainer
			addThemed("closeCross", lineGlow)
			table.insert(crossParts, lineGlow)
		end
		local baseTrans = 0.15
		btn.MouseEnter:Connect(function()
			Animations.tween(btn, {BackgroundColor3 = currentPalette.closeCrossHover, BackgroundTransparency = 0}, 0.18)
			if btnStroke then Animations.tween(btnStroke, {Transparency = 0}, 0.18) end
			for _, part in ipairs(crossParts) do
				Animations.tween(part, {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0}, 0.18)
			end
		end)
		btn.MouseLeave:Connect(function()
			Animations.tween(btn, {BackgroundColor3 = currentPalette.element, BackgroundTransparency = baseTrans}, 0.22)
			if btnStroke then Animations.tween(btnStroke, {Transparency = 0.45}, 0.22) end
			for _, part in ipairs(crossParts) do
				Animations.tween(part, {BackgroundColor3 = currentPalette.closeCross, BackgroundTransparency = (part.Name == "LineGlow" and 0.7 or 0)}, 0.22)
			end
		end)
		return btn
	end

	local minBtn = createMinimizeButton(-84)
	local closeBtn = createCloseButton(-44)
	local collapseToBadge, openFromBadge
	-- квадрат-бейдж: панель схлопывается в него (анимация коллапса как у XOCO), клик — открыть
	local badge = Instance.new("TextButton")
	badge.Name = "FosforMinimizedBadge"
	badge.Size = UDim2.fromOffset(76, 76)
	badge.Position = UDim2.fromOffset(200, 200)
	badge.BackgroundColor3 = currentPalette.panel
	badge.BackgroundTransparency = 0.05
	badge.BorderSizePixel = 0
	badge.Text = ""
	badge.AutoButtonColor = false
	badge.Visible = false
	badge.ZIndex = 80
	badge.Parent = gui
	UI.corner(badge, 16)
	UI.gradient(badge, 90)
	UI.sheen(badge, 0.14)
	local badgeStroke = Instance.new("UIStroke")
	badgeStroke.Color = Mods.Colors.accent
	badgeStroke.Thickness = 2
	badgeStroke.Transparency = 0.25
	badgeStroke.Parent = badge
	local badgeLogo = Instance.new("ImageLabel")
	badgeLogo.Name = "BadgeLogo"
	badgeLogo.Size = UDim2.fromOffset(46, 46)
	badgeLogo.Position = UDim2.new(0.5, 0, 0.5, -12)
	badgeLogo.AnchorPoint = Vector2.new(0.5, 0.5)
	badgeLogo.BackgroundTransparency = 1
	badgeLogo.Image = "rbxassetid://117047005144143"
	badgeLogo.ScaleType = Enum.ScaleType.Fit
	badgeLogo.ZIndex = 81
	badgeLogo.Parent = badge
	local badgeText = Instance.new("TextLabel")
	badgeText.Name = "BadgeText"
	badgeText.Size = UDim2.new(1, 0, 0, 12)
	badgeText.Position = UDim2.new(0, 0, 0.5, 14)
	badgeText.BackgroundTransparency = 1
	badgeText.Text = "FOSFOR"
	badgeText.TextColor3 = Color3.fromRGB(255, 255, 255)
	badgeText.Font = Enum.Font.GothamBold
	badgeText.TextSize = 11
	badgeText.ZIndex = 81
	badgeText.Parent = badge
	local badgeDragging = false
	local badgeDragStart, badgeStartPos
	local badgeMoved = false
	badge.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			badgeDragging = true
			badgeMoved = false
			badgeDragStart = input.Position
			badgeStartPos = badge.Position
		end
	end)
	badge.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			badgeDragging = false
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if badgeDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local dx = input.Position.X - badgeDragStart.X
			local dy = input.Position.Y - badgeDragStart.Y
			if math.abs(dx) + math.abs(dy) > 6 then badgeMoved = true end
			badge.Position = UDim2.fromOffset(badgeStartPos.X.Offset + dx, badgeStartPos.Y.Offset + dy)
		end
	end)
	badge.MouseButton1Click:Connect(function()
		if badgeMoved then
			badgeMoved = false
			return
		end
		openFromBadge()
	end)

	local dragging = false
	local dragStart = nil
	local startPos = nil
	dragArea.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and dragStart and startPos then
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				local dx = input.Position.X - dragStart.X
				local dy = input.Position.Y - dragStart.Y
				main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + dx, startPos.Y.Scale, startPos.Y.Offset + dy)
			end
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	-- ============================================================
	-- HANDLE ИЗМЕНЕНИЯ РАЗМЕРА
	-- ============================================================
	local resizeHandle = Instance.new("Frame")
	resizeHandle.Name = "ResizeHandle"
	resizeHandle.Size = UDim2.fromOffset(22, 22)
	resizeHandle.Position = UDim2.new(1, -11, 1, -11)
	resizeHandle.BackgroundColor3 = currentPalette.element
	resizeHandle.BackgroundTransparency = 0.35
	resizeHandle.BorderSizePixel = 0
	resizeHandle.ZIndex = 5
	resizeHandle.Parent = main
	UI.corner(resizeHandle, 6)
	addThemed("element", resizeHandle)

	local resizeIcon = Instance.new("ImageLabel")
	resizeIcon.Name = "ResizeIcon"
	resizeIcon.Size = UDim2.fromOffset(16, 16)
	resizeIcon.Position = UDim2.new(0.5, -8, 0.5, -8)
	resizeIcon.BackgroundTransparency = 1
	resizeIcon.Image = "rbxassetid://6031094675"
	resizeIcon.ImageColor3 = currentPalette.text
	resizeIcon.ImageTransparency = 0.2
	resizeIcon.ScaleType = Enum.ScaleType.Fit
	resizeIcon.Rotation = 45
	resizeIcon.ZIndex = 7
	resizeIcon.Parent = resizeHandle
	addThemed("text", resizeIcon)

	local resizeOutline = Instance.new("Frame")
	resizeOutline.Name = "ResizeOutline"
	resizeOutline.Size = UDim2.fromOffset(22, 22)
	resizeOutline.BackgroundTransparency = 1
	resizeOutline.BorderSizePixel = 0
	resizeOutline.ZIndex = 6
	resizeOutline.Parent = resizeHandle
	UI.corner(resizeOutline, 6)
	local resizeOutlineStroke = Instance.new("UIStroke")
	resizeOutlineStroke.Color = currentPalette.stroke
	resizeOutlineStroke.Thickness = 1
	resizeOutlineStroke.Transparency = 0.7
	resizeOutlineStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	resizeOutlineStroke.Parent = resizeOutline
	addThemed("stroke", resizeOutlineStroke)

	local resizing = false
	local resizeStart = nil
	local startSize = nil
	resizeHandle.InputBegan:Connect(function(input)
		if minimized then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			resizing = true
			resizeStart = input.Position
			startSize = main.Size
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if resizing and not minimized and resizeStart and startSize then
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				local dx = input.Position.X - resizeStart.X
				local dy = input.Position.Y - resizeStart.Y
				local newWidth = clamp(startSize.X.Offset + dx, 400, 800)
				local newHeight = clamp(startSize.Y.Offset + dy, 300, 600)
				main.Size = UDim2.fromOffset(newWidth, newHeight)
			end
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			resizing = false
		end
	end)
	resizeHandle.MouseEnter:Connect(function()
		Animations.tween(resizeHandle, {BackgroundTransparency = 0.05}, 0.18)
		Animations.tween(resizeOutlineStroke, {Transparency = 0.15}, 0.18)
		Animations.tween(resizeIcon, {ImageColor3 = currentPalette.text, ImageTransparency = 0}, 0.18)
	end)
	resizeHandle.MouseLeave:Connect(function()
		Animations.tween(resizeHandle, {BackgroundTransparency = 0.35}, 0.22)
		Animations.tween(resizeOutlineStroke, {Transparency = 0.7}, 0.22)
		Animations.tween(resizeIcon, {ImageTransparency = 0.2}, 0.22)
	end)

	-- ============================================================
	-- КОНТЕНТ, НАВИГАЦИЯ, СТАТУС
	-- ============================================================
	local contentArea = Instance.new("CanvasGroup")
	contentArea.Name = "ContentArea"
	contentArea.Position = UDim2.new(0, 14, 0, 54)
	contentArea.Size = UDim2.new(1, -28, 1, -96)
	contentArea.BackgroundTransparency = 1
	contentArea.GroupTransparency = 0
	contentArea.ZIndex = 2
	contentArea.Parent = main

	local navFrame = Instance.new("Frame")
	navFrame.Name = "NavFrame"
	navFrame.Size = UDim2.new(0, 164, 1, 0)
	navFrame.BackgroundColor3 = currentPalette.panel
	navFrame.BackgroundTransparency = 0.3
	navFrame.BorderSizePixel = 0
	navFrame.Parent = contentArea
	addThemed("panel", navFrame)
	UI.corner(navFrame, 16)
	UI.stroke(navFrame, 0.7, 1)
	UI.gradient(navFrame, 90)
	UI.sheen(navFrame, 0.07)

	local navScroll = Instance.new("ScrollingFrame")
	navScroll.Name = "NavScroll"
	navScroll.Size = UDim2.fromScale(1, 1)
	navScroll.BackgroundTransparency = 1
	navScroll.BorderSizePixel = 0
	navScroll.ScrollBarThickness = 4
	navScroll.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 130)
	navScroll.ScrollBarImageTransparency = 0
	navScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	navScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	navScroll.ScrollingDirection = Enum.ScrollingDirection.Y
	navScroll.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	navScroll.ElasticBehavior = Enum.ElasticBehavior.Never
	navScroll.Parent = navFrame

	local navContainer = Instance.new("Frame")
	navContainer.Name = "NavContainer"
	navContainer.Size = UDim2.new(1, -10, 0, 0)
	navContainer.AutomaticSize = Enum.AutomaticSize.Y
	navContainer.BackgroundTransparency = 1
	navContainer.Parent = navScroll

	local navList = Instance.new("UIListLayout")
	navList.Padding = UDim.new(0, 6)
	navList.HorizontalAlignment = Enum.HorizontalAlignment.Left
	navList.VerticalAlignment = Enum.VerticalAlignment.Top
	navList.SortOrder = Enum.SortOrder.LayoutOrder
	navList.Parent = navContainer

	local navScrollPadding = Instance.new("UIPadding")
	navScrollPadding.PaddingLeft = UDim.new(0, 8)
	navScrollPadding.PaddingRight = UDim.new(0, 4)
	navScrollPadding.PaddingTop = UDim.new(0, 10)
	navScrollPadding.PaddingBottom = UDim.new(0, 8)
	navScrollPadding.Parent = navScroll

	local SCROLL_DEFAULT_THICKNESS = 6
	local SCROLL_HOVER_THICKNESS = 10

	local function getScrollColors()
		return {
			default = currentPalette.sub,
			hover = currentPalette.text,
			bgDefault = currentPalette.panel,
			bgHover = currentPalette.element,
		}
	end

	local scrollColors = getScrollColors()
	navScroll.ScrollBarImageColor3 = scrollColors.default

	local SCROLL_BG_DEFAULT = currentPalette.panel
	local SCROLL_BG_HOVER = currentPalette.element

	local scrollBg = Instance.new("Frame")
	scrollBg.Name = "ScrollBackground"
	scrollBg.Size = UDim2.fromScale(1, 1)
	scrollBg.BackgroundColor3 = SCROLL_BG_DEFAULT
	scrollBg.BackgroundTransparency = 1
	scrollBg.BorderSizePixel = 0
	scrollBg.ZIndex = 0
	scrollBg.Parent = navScroll
	UI.corner(scrollBg, 14)

	navScroll.ZIndex = 1

	navScroll.MouseEnter:Connect(function()
		scrollColors = getScrollColors()
		Animations.tween(scrollBg, {BackgroundTransparency = 0.05}, 0.25)
		Animations.tween(scrollBg, {BackgroundColor3 = SCROLL_BG_HOVER}, 0.25)
		local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		TweenService:Create(navScroll, tweenInfo, {ScrollBarThickness = SCROLL_HOVER_THICKNESS}):Play()
		TweenService:Create(navScroll, tweenInfo, {ScrollBarImageColor3 = scrollColors.hover}):Play()
	end)

	navScroll.MouseLeave:Connect(function()
		scrollColors = getScrollColors()
		Animations.tween(scrollBg, {BackgroundTransparency = 1}, 0.3)
		Animations.tween(scrollBg, {BackgroundColor3 = SCROLL_BG_DEFAULT}, 0.3)
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		TweenService:Create(navScroll, tweenInfo, {ScrollBarThickness = SCROLL_DEFAULT_THICKNESS}):Play()
		TweenService:Create(navScroll, tweenInfo, {ScrollBarImageColor3 = scrollColors.default}):Play()
	end)

	local pagesFrame = Instance.new("Frame")
	pagesFrame.Name = "PagesFrame"
	pagesFrame.Position = UDim2.new(0, 176, 0, 0)
	pagesFrame.Size = UDim2.new(1, -176, 1, 0)
	pagesFrame.BackgroundTransparency = 1
	pagesFrame.ClipsDescendants = true
	pagesFrame.Parent = contentArea

	local statusBar = Instance.new("CanvasGroup")
	statusBar.Name = "StatusBar"
	statusBar.Position = UDim2.new(0, 14, 1, -40)
	statusBar.Size = UDim2.new(1, -28, 0, 26)
	statusBar.BackgroundColor3 = currentPalette.panel
	statusBar.BackgroundTransparency = 0.3
	statusBar.BorderSizePixel = 0
	statusBar.GroupTransparency = 0
	statusBar.ZIndex = 2
	statusBar.Parent = main
	addThemed("panel", statusBar)
	UI.corner(statusBar, 14)
	UI.stroke(statusBar, 0.7, 1)
	UI.gradient(statusBar, 90)
	UI.sheen(statusBar, 0.07)

	local avatarImage = Instance.new("ImageLabel")
	avatarImage.Name = "AvatarImage"
	avatarImage.Size = UDim2.fromOffset(20, 20)
	avatarImage.Position = UDim2.new(0, 10, 0.5, -10)
	avatarImage.BackgroundTransparency = 1
	avatarImage.ZIndex = 3
	avatarImage.Parent = statusBar
	local avatarCorner = Instance.new("UICorner")
	avatarCorner.CornerRadius = UDim.new(1, 0)
	avatarCorner.Parent = avatarImage
	pcall(function()
		local thumbType = Enum.ThumbnailType.HeadShot
		local thumbSize = Enum.ThumbnailSize.Size420x420
		local content = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
		avatarImage.Image = content
	end)

	local nicknameLabel = Instance.new("TextLabel")
	nicknameLabel.Name = "NicknameLabel"
	nicknameLabel.Size = UDim2.new(1, -40, 1, 0)
	nicknameLabel.Position = UDim2.new(0, 36, 0, 0)
	nicknameLabel.BackgroundTransparency = 1
	nicknameLabel.Text = player.DisplayName or player.Name
	nicknameLabel.TextColor3 = currentPalette.text
	nicknameLabel.Font = Enum.Font.GothamMedium
	nicknameLabel.TextSize = 12
	nicknameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nicknameLabel.TextTruncate = Enum.TextTruncate.AtEnd
	nicknameLabel.ZIndex = 3
	nicknameLabel.Parent = statusBar

	-- ============================================================
	-- OWNER / TESTER BADGE
	-- ============================================================
	local isOwner = (player.UserId == _fs_oid)
	local isTester = false
	for _, tid in ipairs(_fs_tids) do
		if player.UserId == tid then
			isTester = true
			break
		end
	end

	if isOwner then
		nicknameLabel.Size = UDim2.new(1, -110, 1, 0)
		local ownerLabel = Instance.new("TextLabel")
		ownerLabel.Name = "OwnerLabel"
		ownerLabel.Size = UDim2.fromOffset(70, 20)
		ownerLabel.Position = UDim2.new(1, -80, 0.5, -10)
		ownerLabel.BackgroundTransparency = 1
		ownerLabel.Text = "OWNER"
		ownerLabel.Font = Enum.Font.GothamBold
		ownerLabel.TextSize = 11
		ownerLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
		ownerLabel.TextXAlignment = Enum.TextXAlignment.Center
		ownerLabel.ZIndex = 4
		ownerLabel.Parent = statusBar
		local ownerStroke = Instance.new("UIStroke")
		ownerStroke.Color = Color3.fromRGB(255, 180, 0)
		ownerStroke.Thickness = 1.5
		ownerStroke.Transparency = 0.4
		ownerStroke.Parent = ownerLabel
		task.spawn(function()
			while ownerLabel and ownerLabel.Parent do
				local t = tick()
				local glow = (math.sin(t * 3) + 1) / 2
				if ownerStroke then
					ownerStroke.Transparency = 0.2 + glow * 0.5
					ownerStroke.Color = Color3.fromRGB(255, 180, 0):Lerp(Color3.fromRGB(255, 255, 150), glow)
				end
				task.wait(0.05)
			end
		end)
		task.delay(2, function()
			pcall(function()
				local ReplicatedStorage = game:GetService("ReplicatedStorage")
				local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
				if chatEvents then
					local say = chatEvents:FindFirstChild("SayMessageRequest")
					if say and typeof(say.FireServer) == "function" then
						say:FireServer("[FOSFOR SYSTEM]: Создатель Fosfor находится на этом сервере!","All")
					end
				end
			end)
			pcall(function()
				local StarterGui = game:GetService("StarterGui")
				StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "[FOSFOR NETWORK]: Создатель Fosfor находится на этом сервере!";
					Color = Color3.fromRGB(255, 215, 0);
					Font = Enum.Font.GothamBold;
					FontSize = Enum.FontSize.Size18;
				})
			end)
		end)
		task.delay(2.5, function()
			if addConsoleLine then addConsoleLine("Статус OWNER активирован. Сообщение отправлено в чат сервера.", "info") end
			if notify then notify("OWNER: Добро пожаловать, создатель Fosfor!") end
		end)
	elseif isTester then
		nicknameLabel.Size = UDim2.new(1, -110, 1, 0)
		local testerLabel = Instance.new("TextLabel")
		testerLabel.Name = "TesterLabel"
		testerLabel.Size = UDim2.fromOffset(70, 20)
		testerLabel.Position = UDim2.new(1, -80, 0.5, -10)
		testerLabel.BackgroundTransparency = 1
		testerLabel.Text = "TESTER"
		testerLabel.Font = Enum.Font.GothamBold
		testerLabel.TextSize = 11
		testerLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
		testerLabel.TextXAlignment = Enum.TextXAlignment.Center
		testerLabel.ZIndex = 4
		testerLabel.Parent = statusBar
		local testerStroke = Instance.new("UIStroke")
		testerStroke.Color = Color3.fromRGB(0, 200, 80)
		testerStroke.Thickness = 1.5
		testerStroke.Transparency = 0.4
		testerStroke.Parent = testerLabel
		task.spawn(function()
			while testerLabel and testerLabel.Parent do
				local t = tick()
				local glow = (math.sin(t * 3) + 1) / 2
				if testerStroke then
					testerStroke.Transparency = 0.2 + glow * 0.5
					testerStroke.Color = Color3.fromRGB(0, 200, 80):Lerp(Color3.fromRGB(100, 255, 150), glow)
				end
				task.wait(0.05)
			end
		end)
		task.delay(2.5, function()
			if addConsoleLine then addConsoleLine("Статус TESTER активирован.", "info") end
			if notify then notify("TESTER: Добро пожаловать, тестер Fosfor!") end
		end)
	end

	-- ============================================================
	-- ОКНО: ПОКАЗАТЬ / СКРЫТЬ / СВЕРНУТЬ
	-- ============================================================
	local normalSize = UDim2.fromOffset(720, 460)
	local minimizedSize = UDim2.fromOffset(720, 48)

	local function getCenterPosition()
		if minimized then
			return UDim2.new(0.5, -360, 0.5, -24)
		else
			return UDim2.new(0.5, -360, 0.5, -230)
		end
	end

	local function setMinimized(state)
		if minimized == state then return end
		minimized = state
		if minimized then
			resizeHandle.Visible = false
			resizing = false
			Animations.tween(contentArea, {GroupTransparency = 1}, 0.2)
			Animations.tween(statusBar, {GroupTransparency = 1}, 0.2)
			task.delay(0.2, function()
				contentArea.Visible = false
				statusBar.Visible = false
				Animations.tween(main, {Size = minimizedSize}, 0.3)
			end)
		else
			resizeHandle.Visible = true
			contentArea.Visible = true
			statusBar.Visible = true
			contentArea.GroupTransparency = 1
			statusBar.GroupTransparency = 1
			Animations.tween(main, {Size = normalSize}, 0.3)
			task.delay(0.3, function()
				Animations.tween(contentArea, {GroupTransparency = 0}, 0.2)
				Animations.tween(statusBar, {GroupTransparency = 0}, 0.2)
			end)
		end
	end


	local function showUI(animated)
		if uiOpen then return end
		uiOpen = true
		gui.Enabled = true
		main.Visible = true
		if hideIsland then hideIsland() end
		playSound("silent")
		local targetPosition = savedPosition or getCenterPosition()
		if animated then
			main.GroupTransparency = 1
			main.Position = UDim2.new(targetPosition.X.Scale, targetPosition.X.Offset, targetPosition.Y.Scale, targetPosition.Y.Offset + 20)
			Animations.tweenCompleted(main, {Position = targetPosition, GroupTransparency = settings.WindowTransparency}, 0.35, function()
				introDone = true
			end)
		else
			main.Position = targetPosition
			main.GroupTransparency = settings.WindowTransparency
			introDone = true
		end
	end

	local function hideUI(animated)
		if not uiOpen then return end
		uiOpen = false
		introDone = false
		savedPosition = main.Position
		playSound("silent")
		local currentPosition = main.Position
		local targetPosition = UDim2.new(currentPosition.X.Scale, currentPosition.X.Offset, currentPosition.Y.Scale, currentPosition.Y.Offset + 16)
		if animated then
			Animations.tweenCompleted(main, {Position = targetPosition, GroupTransparency = 1}, 0.3, function()
				if not uiOpen then
					main.Visible = false
					if showIsland then showIsland() end
				end
			end)
		else
			main.Visible = false
			if showIsland then showIsland() end
		end
	end

	local savedSize = UDim2.fromOffset(720, 460)
	function collapseToBadge()
		if not uiOpen or badge.Visible then return end
		uiOpen = false
		introDone = false
		savedPosition = main.Position
		savedSize = main.Size
				badge.Position = UDim2.fromOffset(main.AbsolutePosition.X + main.AbsoluteSize.X / 2 - 38, main.AbsolutePosition.Y + main.AbsoluteSize.Y / 2 - 38)
		badge.Visible = true
		badge.BackgroundTransparency = 1
		badgeLogo.ImageTransparency = 1
		badgeText.TextTransparency = 1
		main.ClipsDescendants = true
		playSound("toggle")
		Animations.tweenCompleted(main, {Size = UDim2.fromOffset(76, 76), Position = UDim2.new(0, badge.Position.X.Offset, 0, badge.Position.Y.Offset)}, 0.3, function()
			main.Visible = false
			main.ClipsDescendants = false
			main.Size = savedSize
			Animations.tween(badge, {BackgroundTransparency = 0.05}, 0.15)
			Animations.tween(badgeLogo, {ImageTransparency = 0}, 0.15)
			Animations.tween(badgeText, {TextTransparency = 0}, 0.15)
		end)
	end
	function openFromBadge()
		if not badge.Visible then return end
		badgeMoved = false
		badge.Visible = false
		uiOpen = true
		introDone = false
		gui.Enabled = true
		main.Visible = true
		main.Size = UDim2.fromOffset(76, 76)
		main.Position = UDim2.fromOffset(badge.Position.X.Offset, badge.Position.Y.Offset)
		main.ClipsDescendants = true
		main.GroupTransparency = 0
		playSound("success", 0.4)
		Animations.tweenCompleted(main, {Size = savedSize, GroupTransparency = settings.WindowTransparency}, 0.3, function()
			main.ClipsDescendants = false
			introDone = true
		end)
	end
	minBtn.MouseButton1Click:Connect(function()
		collapseToBadge()
	end)

	-- единая выгрузка: сброс фич, восстановление света, удаление GUI.
	-- instant = без анимации (при повторном запуске скрипта / kill-ticket)
	fullUnload = function(instant)
		if unloaded then return end
		unloaded = true
		uiOpen = false
		introDone = false
		local cleanupDone = false
		local function cleanup()
			if cleanupDone then return end
			cleanupDone = true
			for key, value in pairs(defaultFeatures) do
				pcall(function() FeatureEnv["Fosfor_" .. key] = value end)
			end
			pcall(function()
				for _, m in ipairs(Mods.All()) do
					Mods.Disable(m)
				end
			end)
			if savedLighting then
				pcall(function()
					Lighting.ClockTime = savedLighting.ClockTime
					Lighting.Ambient = savedLighting.Ambient
					Lighting.OutdoorAmbient = savedLighting.OutdoorAmbient
				end)
			end
			pcall(function() if gui and gui.Parent then gui:Destroy() end end)
			pcall(function() if confirmGui and confirmGui.Parent then confirmGui:Destroy() end end)
		end
		if instant or not main.Visible then
			cleanup()
			return
		end
		local currentPosition = main.Position
		local targetPosition = UDim2.new(currentPosition.X.Scale, currentPosition.X.Offset, currentPosition.Y.Scale, currentPosition.Y.Offset + 16)
		Animations.tweenCompleted(main, {Position = targetPosition, GroupTransparency = 1}, 0.3, cleanup)
		-- страховка: даже если колбек твина не придет, панель гарантированно умирает
		task.delay(0.8, function()
			if not cleanupDone then cleanup() end
		end)
	end

	-- повторный запуск скрипта мгновенно выгружает этот инстанс
	pcall(function()
		if getgenv then
			getgenv().FosforUnloadPrevious = function()
				pcall(function() fullUnload(true) end)
			end
		end
	end)

	closeBtn.MouseButton1Click:Connect(function()
		if unloaded then
			-- инстанс считал себя выгруженным, но окно живо — сносим принудительно
			pcall(function() if gui and gui.Parent then gui:Destroy() end end)
			pcall(function() if confirmGui and confirmGui.Parent then confirmGui:Destroy() end end)
			return
		end
		pcall(function()
			confirmAction({
				title = "Выгрузка Fosfor",
				text = "Скрипт будет выгружен, функции сброшены, освещение восстановлено.",
				accept = "Выгрузить",
				onAccept = function()
					fullUnload(false)
				end
			})
		end)
	end)

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if unloaded then return end
		if gameProcessed then return end
		if input.KeyCode == Enum.KeyCode.RightShift then
			if badge.Visible then return end
			if uiOpen then
				hideUI(true)
			else
				showUI(true)
			end
		end
	end)

	setWindowTransparency = function(value)
		value = clamp(value or 0, 0, 1)
		settings.WindowTransparency = value
		if main and uiOpen and introDone then
			main.GroupTransparency = value
		end
	end

	-- ============================================================
	-- ОСТРОВОК-ИНДИКАТОР
	-- ============================================================
	island = Instance.new("TextButton")
	island.Name = "FosforIsland"
	island.Size = UDim2.fromOffset(320, 38)
	island.Position = UDim2.new(0.5, -160, 0, -60)
	island.BackgroundColor3 = currentPalette.panel
	island.BackgroundTransparency = 0.1
	island.BorderSizePixel = 0
	island.Text = ""
	island.AutoButtonColor = false
	island.Active = true
	island.Visible = false
	island.ZIndex = 100
	island.Parent = gui
	UI.corner(island, 19)
	UI.stroke(island, 0.35, 2)
	UI.gradient(island, 90)
	addThemed("panel", island)

	islandLabel = Instance.new("TextLabel")
	islandLabel.Name = "IslandLabel"
	islandLabel.Size = UDim2.fromScale(1, 1)
	islandLabel.BackgroundTransparency = 1
	islandLabel.Text = "Fosfor 1.3.0  •  FPS: 0  •  Ping: 0ms  •  RightShift"
	islandLabel.Font = Enum.Font.Gotham
	islandLabel.TextSize = 13
	islandLabel.TextColor3 = currentPalette.text
	islandLabel.TextTransparency = 1
	islandLabel.ZIndex = 101
	islandLabel.Parent = island
	addThemed("text", islandLabel)

	island.MouseButton1Click:Connect(function()
		if unloaded then return end
		showUI(true)
	end)

	local islandFpsCounter = 0
	local islandFpsDisplay = 0
	local islandLastFpsUpdate = tick()

	RunService.RenderStepped:Connect(function()
		islandFpsCounter = islandFpsCounter + 1
		if island and island.Visible and islandLabel then
			local now = tick()
			if now - islandLastFpsUpdate >= 0.5 then
				islandFpsDisplay = math.floor(islandFpsCounter / (now - islandLastFpsUpdate) + 0.5)
				islandFpsCounter = 0
				islandLastFpsUpdate = now
			end
			local ping = 0
			pcall(function()
				local stats = game:GetService("Stats")
				local pingStat = stats.Network.ServerStatsItem["Data Ping"]
				if pingStat then
					ping = math.floor(pingStat:GetValue() + 0.5)
				end
			end)
			islandLabel.Text = string.format("Fosfor 1.3.0  •  FPS: %d  •  Ping: %dms  •  RightShift", islandFpsDisplay, ping)
		end
	end)

	local islandAnimToken = 0

	showIsland = function()
		if not island then return end
		islandAnimToken = islandAnimToken + 1
		local token = islandAnimToken
		island.Visible = true
		island.Position = UDim2.new(0.5, -160, 0, -60)
		island.BackgroundTransparency = 0.7
		if islandLabel then islandLabel.TextTransparency = 1 end
		Animations.tween(island, {Position = UDim2.new(0.5, -160, 0, 12), BackgroundTransparency = 0.1}, 0.45)
		if islandLabel then Animations.tween(islandLabel, {TextTransparency = 0}, 0.45) end
	end

	hideIsland = function()
		if not island or not island.Visible then return end
		islandAnimToken = islandAnimToken + 1
		local token = islandAnimToken
		Animations.tween(island, {Position = UDim2.new(0.5, -160, 0, -60), BackgroundTransparency = 0.7}, 0.35)
		if islandLabel then Animations.tween(islandLabel, {TextTransparency = 1}, 0.35) end
		task.delay(0.4, function()
			if token == islandAnimToken and island then
				island.Visible = false
			end
		end)
	end

	-- ============================================================
	-- СИСТЕМА УВЕДОМЛЕНИЙ
	-- ============================================================
	local notifications = {}
	local NOTIF_WIDTH = 300
	local NOTIF_HEIGHT = 66
	local NOTIF_SPACING = 12
	local NOTIF_TOP = 90
	local NOTIF_RIGHT_MARGIN = 16
	local NOTIF_LIFETIME = 5

	local function getScreenHeight()
		local s = gui.AbsoluteSize.Y
		if s <= 0 then
			local cam = workspace.CurrentCamera
			if cam then s = cam.ViewportSize.Y end
		end
		return s or 720
	end

	local function getNotifPosition(index)
		local y = NOTIF_TOP + (index - 1) * (NOTIF_HEIGHT + NOTIF_SPACING)
		return UDim2.new(1, -NOTIF_WIDTH - NOTIF_RIGHT_MARGIN, 0, y)
	end

	local function layoutNotifications()
		for i, entry in ipairs(notifications) do
			if not entry.removing and entry.frame and entry.frame.Parent then
				Animations.tween(entry.frame, {Position = getNotifPosition(i)}, 0.3)
			end
		end
	end

	local function removeNotification(entry)
		if not entry or entry.removing then return end
		entry.removing = true
		if entry.progressTween then
			pcall(function() entry.progressTween:Cancel() end)
		end
		local frame = entry.frame
		if not frame or not frame.Parent then
			for i, e in ipairs(notifications) do
				if e == entry then table.remove(notifications, i) break end
			end
			return
		end
		local yPos = frame.Position.Y.Offset
		local offPos = UDim2.new(1, 60, 0, yPos)
		Animations.tweenCompleted(frame, {Position = offPos, GroupTransparency = 1}, 0.3, function()
			if frame and frame.Parent then frame:Destroy() end
			for i, e in ipairs(notifications) do
				if e == entry then table.remove(notifications, i) break end
			end
			layoutNotifications()
		end)
	end

	local function handleOverflow()
		local screenH = getScreenHeight()
		local toRemove = {}
		for i = #notifications, 1, -1 do
			local entry = notifications[i]
			if not entry.removing then
				local yPos = NOTIF_TOP + (i - 1) * (NOTIF_HEIGHT + NOTIF_SPACING)
				if yPos + NOTIF_HEIGHT > screenH - 10 then
					table.insert(toRemove, entry)
				end
			end
		end
		for _, entry in ipairs(toRemove) do
			removeNotification(entry)
		end
	end

	notify = function(messageText)
		if unloaded then return end
		if not gui or not gui.Parent then return end
		playSound("success")
		local notif = Instance.new("CanvasGroup")
		notif.Name = "FosforNotification"
		notif.Size = UDim2.fromOffset(NOTIF_WIDTH, NOTIF_HEIGHT)
		notif.BackgroundColor3 = currentPalette.panel
		notif.BackgroundTransparency = 0.06
		notif.BorderSizePixel = 0
		notif.GroupTransparency = 1
		notif.ClipsDescendants = false
		notif.ZIndex = 30
		local topPos = getNotifPosition(1)
		notif.Position = UDim2.new(1, 60, 0, topPos.Y.Offset)
		notif.Parent = gui
		local notifCorner = Instance.new("UICorner")
		notifCorner.CornerRadius = UDim.new(0, 16)
		notifCorner.Parent = notif
		local notifStroke = Instance.new("UIStroke")
		notifStroke.Color = currentPalette.stroke
		notifStroke.Thickness = 1.5
		notifStroke.Transparency = 0.35
		notifStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		notifStroke.Parent = notif
		local notifGradient = Instance.new("UIGradient")
		notifGradient.Rotation = 90
		notifGradient.Color = ColorSequence.new(currentPalette.gradientTop, currentPalette.gradientBottom)
		notifGradient.Parent = notif
		local icon = Instance.new("ImageLabel")
		icon.Name = "Icon"
		icon.Size = UDim2.fromOffset(61, 61)
		icon.Position = UDim2.new(0, 6, 0.5, -30)
		icon.BackgroundTransparency = 1
		icon.Image = "rbxassetid://117047005144143"
		icon.ScaleType = Enum.ScaleType.Fit
		icon.ZIndex = 31
		icon.Parent = notif
		local msg = Instance.new("TextLabel")
		msg.Name = "Message"
		msg.Size = UDim2.new(1, -100, 1, -18)
		msg.Position = UDim2.new(0, 80, 0, 5)
		msg.BackgroundTransparency = 1
		msg.Text = tostring(messageText or "")
		msg.Font = Enum.Font.GothamMedium
		msg.TextSize = 14
		msg.TextColor3 = currentPalette.text
		msg.TextXAlignment = Enum.TextXAlignment.Left
		msg.TextYAlignment = Enum.TextYAlignment.Center
		msg.TextWrapped = true
		msg.ZIndex = 31
		msg.Parent = notif
		local progress = Instance.new("Frame")
		progress.Name = "Progress"
		progress.Size = UDim2.new(0, 0, 0, 4)
		progress.Position = UDim2.new(0, 80, 1, -12)
		progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		progress.BorderSizePixel = 0
		progress.ZIndex = 32
		progress.Parent = notif
		local progressCorner = Instance.new("UICorner")
		progressCorner.CornerRadius = UDim.new(0, 2)
		progressCorner.Parent = progress
		local entry = {frame = notif, progress = progress, progressTween = nil, removing = false, remaining = NOTIF_LIFETIME, startedAt = tick()}
		table.insert(notifications, 1, entry)
		layoutNotifications()
		local function startProgress(fromRemaining)
			entry.startedAt = tick()
			entry.remaining = fromRemaining
			local okTween, tw = pcall(function()
				return TweenService:Create(progress, TweenInfo.new(fromRemaining, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(1, -96, 0, 4)})
			end)
			if okTween and tw then
				entry.progressTween = tw
				tw.Completed:Connect(function() removeNotification(entry) end)
				tw:Play()
			else
				task.delay(fromRemaining, function() removeNotification(entry) end)
			end
		end
		-- наведение ставит таймер на паузу, уход с курсора возобновляет
		notif.MouseEnter:Connect(function()
			if entry.removing then return end
			pcall(function() if entry.progressTween then entry.progressTween:Cancel() end end)
			entry.remaining = math.max(1, entry.remaining - (tick() - entry.startedAt))
		end)
		notif.MouseLeave:Connect(function()
			if entry.removing then return end
			startProgress(entry.remaining)
		end)
		startProgress(NOTIF_LIFETIME)
		Animations.tween(notif, {GroupTransparency = 0}, 0.25)
		handleOverflow()
	end
	-- ============================================================
	-- ХЕЛПЕРЫ СКРЫТИЯ ПОД-НАСТРОЕК
	-- ============================================================
	local function subAdd(mod, data)
		mod._subRows = mod._subRows or {}
		if data and data.row then
			table.insert(mod._subRows, data.row)
		end
		return data
	end

	local function subShow(mod, on)
		-- каскадное появление/сворачивание; генерация защищает от гонок быстрого клика
		mod._subGen = (mod._subGen or 0) + 1
		local gen = mod._subGen
		local idx = 0
		for _, r in ipairs(mod._subRows or {}) do
			if r and r.Parent then
				idx = idx + 1
				local row, order = r, idx
				row.ClipsDescendants = true
				if on then
					row.Visible = false
					task.delay((order - 1) * 0.045, function()
						if gen ~= mod._subGen or not row.Parent then return end
						local full = row.Size
						row.Size = UDim2.new(full.X.Scale, full.X.Offset, 0, 0)
						row.Visible = true
						Animations.tween(row, {Size = full}, 0.25)
					end)
				else
					task.delay((order - 1) * 0.03, function()
						if gen ~= mod._subGen or not row.Parent then return end
						local full = row.Size
						Animations.tweenCompleted(row, {Size = UDim2.new(full.X.Scale, full.X.Offset, 0, 0)}, 0.16, function()
							row.Visible = false
							row.Size = full
						end)
					end)
				end
			end
		end
	end

	-- ============================================================
	-- МОДУЛЬ: СТАТИСТИКА ПРОФИЛЯ (фоновый)
	-- ============================================================
	Mods.Register({
		Id = "ProfileStats",
		Tab = nil,
		Name = "Статистика профиля",
		Auto = true,
		Defaults = {},
		OnEnable = function(self)
			self.Stats = {
				fpsMin = math.huge,
				fpsMax = 0,
				deaths = 0,
				lifeStart = tick(),
				scriptStart = tick(),
			}
			self._fpsFrames = 0
			self._fpsLast = tick()
			self._fpsWarmup = tick()
			local function hookCharacter(char)
				self.Stats.lifeStart = tick()
				local hum = char:WaitForChild("Humanoid", 5)
				if hum then
					Mods.Connect(self, hum.Died:Connect(function()
						self.Stats.deaths = self.Stats.deaths + 1
					end))
				end
			end
			if player.Character then hookCharacter(player.Character) end
			Mods.Connect(self, player.CharacterAdded:Connect(hookCharacter))
		end,
		OnRender = function(self)
			local s = self.Stats
			if not s then return end
			self._fpsFrames = self._fpsFrames + 1
			local now = tick()
			if now - self._fpsLast >= 0.5 then
				local fps = self._fpsFrames / (now - self._fpsLast)
				self._fpsFrames = 0
				self._fpsLast = now
				if now - self._fpsWarmup > 2 then
					if fps < s.fpsMin then s.fpsMin = fps end
					if fps > s.fpsMax then s.fpsMax = fps end
				end
			end
		end,
		GetFriends = function(self)
			local count = 0
			for _, other in ipairs(Players:GetPlayers()) do
				if other ~= player then
					local ok, isFriend = pcall(function() return other:IsFriendsWith(player.UserId) end)
					if ok and isFriend then count = count + 1 end
				end
			end
			return count
		end,
		OnDisable = function(self)
			self.Stats = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: УЧЁТ ГРАБОВ (фоновый, тумблер в Misc)
	-- ============================================================
	Mods.Register({
		Id = "GrabStats",
		Tab = "PVP",
		Name = "Учёт грабов",
		Auto = true,
		Defaults = {Counting = true},
		Build = function(self, u)
			u.Section("Учёт грабов и убийств")
			u.Toggle("Учёт грабов и убийств", self.State.Counting ~= false, function(v)
				self.State.Counting = v
				log("Учёт грабов: " .. (v and "включён" or "выключен"))
			end)
		end,
		OnEnable = function(self)
			self.Stats = {airGrabs = 0, groundGrabs = 0, kills = 0, source = "session"}
			pcall(function()
				if typeof(readfile) == "function" and typeof(isfile) == "function" and isfile("FosforGrabs.txt") then
					local data = readfile("FosforGrabs.txt")
					local a, g, k = data:match("^(%d+),(%d+),(%d+)$")
					if a and g and k then
						self.Stats.airGrabs = tonumber(a) or 0
						self.Stats.groundGrabs = tonumber(g) or 0
						self.Stats.kills = tonumber(k) or 0
						self.Stats.source = "fosfor"
					end
				end
			end)
			self.Marks = {}
			local function save()
				pcall(function()
					if typeof(writefile) == "function" then
						writefile("FosforGrabs.txt", string.format("%d,%d,%d", self.Stats.airGrabs, self.Stats.groundGrabs, self.Stats.kills))
					end
				end)
			end
			self.Save = save
			local function attach(plr)
				local char = plr.Character
				if not char then return end
				Mods.Connect(self, char.DescendantAdded:Connect(function(d)
					if d.Name ~= "PartOwner" then return end
					if not self.State.Counting then return end
					task.spawn(function()
						local v = d.Value
						if v == "" then task.wait(0.15) v = d.Value end
						if v ~= player.Name then return end
						local now = tick()
						if self.Marks[plr.UserId] and (now - self.Marks[plr.UserId]) < 1.5 then return end
						self.Marks[plr.UserId] = now
						local hum = char:FindFirstChildOfClass("Humanoid")
						local isAir = false
						if hum then
							local st = hum:GetState()
							isAir = (hum.FloorMaterial == Enum.Material.Air)
								or st == Enum.HumanoidStateType.Freefall
								or st == Enum.HumanoidStateType.Jumping
						end
						if isAir then
							self.Stats.airGrabs = self.Stats.airGrabs + 1
							log("Air grab: " .. plr.Name)
						else
							self.Stats.groundGrabs = self.Stats.groundGrabs + 1
							log("Ground grab: " .. plr.Name)
						end
						save()
					end)
				end))
				local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 5)
				if hum then
					Mods.Connect(self, hum.Died:Connect(function()
						if not self.State.Counting then return end
						local now = tick()
						if self.Marks[plr.UserId] and (now - self.Marks[plr.UserId]) <= 5 then
							self.Stats.kills = self.Stats.kills + 1
							log("Kill: " .. plr.Name)
							save()
						end
					end))
				end
			end
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player then
					if plr.Character then attach(plr) end
					Mods.Connect(self, plr.CharacterAdded:Connect(function() attach(plr) end))
				end
			end
			Mods.Connect(self, Players.PlayerAdded:Connect(function(plr)
				if plr ~= player then
					if plr.Character then attach(plr) end
					Mods.Connect(self, plr.CharacterAdded:Connect(function() attach(plr) end))
				end
			end))
			Mods.Connect(self, gui.Destroying:Connect(save))
		end,
		OnDisable = function(self)
			self.Stats = nil
			self.Marks = {}
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: FULLBRIGHT
	-- ============================================================
	Mods.Register({
		Id = "Fullbright",
		Tab = "Shaders",
		Name = "Fullbright",
		Defaults = {},
		Build = function(self, u)
			u.Section("Освещение")
			self._masterToggle = u.Toggle("Fullbright", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		OnEnable = function(self)
			if not self.Saved then
				self.Saved = {
					Brightness = Lighting.Brightness,
					ClockTime = Lighting.ClockTime,
					Ambient = Lighting.Ambient,
					OutdoorAmbient = Lighting.OutdoorAmbient,
					FogEnd = Lighting.FogEnd,
					GlobalShadows = Lighting.GlobalShadows,
					ExposureCompensation = Lighting.ExposureCompensation,
				}
			end
			pcall(function()
				Lighting.Brightness = 3
				Lighting.ClockTime = 14
				Lighting.Ambient = Color3.fromRGB(255, 255, 255)
				Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
				Lighting.FogEnd = 1000000
				Lighting.GlobalShadows = false
				Lighting.ExposureCompensation = 0.25
			end)
			log("Fullbright включён")
		end,
		OnDisable = function(self)
			if self.Saved then
				for prop, value in pairs(self.Saved) do
					pcall(function() Lighting[prop] = value end)
				end
				self.Saved = nil
			end
			log("Fullbright выключен")
		end,
	})
	do
		local m = Mods.Get("Fullbright")
		if m and getFeature("FosforMod_Fullbright") == nil and getFeature("Fullbright") == true then
			m._wantEnabled = true
		end
	end

	-- ============================================================
	-- МОДУЛЬ: ANTI-AFK
	-- ============================================================
	Mods.Register({
		Id = "AntiAFK",
		Tab = "Settings",
		Name = "Anti-AFK",
		Defaults = {},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Anti-AFK", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		OnEnable = function(self)
			if not self.Conn then
				pcall(function()
					self.Conn = Mods.Connect(self, player.Idled:Connect(function(idleTime)
						local ok, vu = pcall(function() return game:GetService("VirtualUser") end)
						if ok and vu then
							pcall(function()
								vu:CaptureController()
								vu:ClickButton2(Vector2.new())
							end)
						end
					end))
				end)
			end
			log("Anti-AFK включён")
		end,
		OnDisable = function(self)
			if self.Conn then
				pcall(function() self.Conn:Disconnect() end)
				self.Conn = nil
			end
			log("Anti-AFK выключен")
		end,
	})
	do
		local m = Mods.Get("AntiAFK")
		if m and getFeature("FosforMod_AntiAFK") == nil and getFeature("AntiAFK") == true then
			m._wantEnabled = true
		end
	end

	-- ============================================================
	-- МОДУЛЬ: FPS UNLOCKER
	-- ============================================================
	Mods.Register({
		Id = "FPSUnlocker",
		Tab = "Settings",
		Name = "FPS Unlocker",
		Defaults = {},
		TrySetCap = function(self, value)
			local success = false
			pcall(function()
				if typeof(setfpscap) == "function" then
					setfpscap(value)
					success = true
					return
				end
				if FeatureEnv and typeof(FeatureEnv.setfpscap) == "function" then
					FeatureEnv.setfpscap(value)
					success = true
					return
				end
				if _G and typeof(_G.setfpscap) == "function" then
					_G.setfpscap(value)
					success = true
					return
				end
			end)
			return success
		end,
		Build = function(self, u)
			self._masterToggle = u.Toggle("FPS Unlocker", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		OnEnable = function(self)
			local unlocked = self:TrySetCap(999)
			self.Active = unlocked
			if unlocked then
				log("FPS Unlocker включён")
			else
				log("FPS Unlocker: функция недоступна в этой среде")
			end
		end,
		OnDisable = function(self)
			self:TrySetCap(60)
			self.Active = false
			log("FPS Unlocker выключен")
		end,
	})
	do
		local m = Mods.Get("FPSUnlocker")
		if m and getFeature("FosforMod_FPSUnlocker") == nil and getFeature("FPSUnlocker") == true then
			m._wantEnabled = true
		end
	end

	-- ============================================================
	-- МОДУЛЬ: МОТИВАЦИЯ ПРИ СМЕРТИ
	-- ============================================================
	Mods.Register({
		Id = "DeathMotivation",
		Tab = "Misc",
		Name = "Мотивация при смерти",
		Defaults = {Particles = true},
		PHRASES = {
			"Ты упал. Никто не поднимет тебя, кроме тебя самого.",
			"Смерть не унижает. Она просто показывает цену ошибки.",
			"Ты был медленнее. Это не обида — это факт. Стань быстрее.",
			"Земля холодная. Память долгая. Выводы — твои.",
			"Слабые остаются лежать. Сильные возвращаются.",
			"Ты не проиграл войну. Ты проиграл три секунды.",
			"Боль — это плата за опыт. Ты только что заплатил.",
			"Не оправдывайся. Оправдания не поднимают с земли.",
			"Соперник не был сильнее. Ты был невнимательнее.",
			"Каждое падение — урок, который ты не хотел учить.",
			"Ты умер. Мир не остановился. Поднимайся.",
			"Смерть — пауза, а не финал.",
			"Лежать легко. Вставать — вот что делает сильнее.",
			"Ошибка стоит жизни только тогда, когда ты её повторяешь.",
			"Ты заплатил за невнимательность самой дорогой ценой. Запомни её.",
			"Холодная земля учит лучше тёплых слов.",
			"Сегодня упал ты. В следующий раз упадёт тот, кто убил тебя.",
			"Смерть не спрашивает, готов ли ты. Будь готов.",
			"Ты не жертва обстоятельств. Ты их автор.",
			"Проигран бой, но не игра.",
			"Ты отдохнул. Хватит. Возвращайся и забери своё.",
			"Каждый, кто наверху, когда-то лежал там, где сейчас ты.",
			"Смерть — не позор. Позор — не встать.",
			"Ты проиграл один момент, а не всё.",
			"Смерть показала твою слабость. Теперь ты знаешь, где работать.",
			"Сильный не тот, кто не падает, а тот, кто встаёт быстрее.",
			"Не ной. Проанализируй. Вернись.",
			"Гравитация победила в этот раз. Счёт открыт.",
			"Ты умер с оружием в руках — значит, жил правильно.",
			"Соперник запомнил твоё имя. Сделай так, чтобы начал бояться.",
			"Ты не первый, кто упал. Стань тем, кто встал.",
			"Смерть — зеркало. Оно показало ошибку. Смотри и запоминай.",
			"Виноват не тот, кто убил, а тот, кто позволил.",
			"Ты не слабый. Ты просто ещё не сильный.",
			"Падение — не приговор. Это разминка.",
			"Смерть проверяет не тело. Она проверяет волю.",
			"Ты узнал, где твоя слабость. Это дороже одной жизни.",
			"Встань. Отряхнись. Вернись. Другого пути нет.",
			"Тот, кто боится смерти, уже проиграл. Ты — нет.",
			"Смерть — это дверь. Ты просто вошёл не с той стороны.",
		},
		Build = function(self, u)
			u.Section("Мотивация при смерти")
			self._subRows = {}
			self._masterToggle = u.Toggle("Мотивация при смерти", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Снежные частицы на экране смерти", self.State.Particles ~= false, function(v)
				self.State.Particles = v
				log("Частицы на экране смерти: " .. (v and "включены" or "выключены"))
			end))
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		BuildOverlay = function(self)
			if self.Overlay then return end
			local frame = Instance.new("Frame")
			frame.Name = "DeathOverlay"
			frame.Size = UDim2.fromScale(1, 1)
			frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			frame.BackgroundTransparency = 1
			frame.BorderSizePixel = 0
			frame.Visible = false
			frame.ZIndex = 500
			frame.Parent = gui
			local particles = Instance.new("Frame")
			particles.Name = "Particles"
			particles.Size = UDim2.fromScale(1, 1)
			particles.BackgroundTransparency = 1
			particles.ClipsDescendants = true
			particles.ZIndex = 501
			particles.Parent = frame
			local label = Instance.new("TextLabel")
			label.Name = "Phrase"
			label.Size = UDim2.new(0.8, 0, 0.3, 0)
			label.Position = UDim2.new(0.1, 0, 0.35, 0)
			label.BackgroundTransparency = 1
			label.Text = ""
			label.TextColor3 = Color3.fromRGB(235, 235, 235)
			label.Font = Enum.Font.GothamMedium
			label.TextSize = 26
			label.TextWrapped = true
			label.TextTransparency = 1
			label.ZIndex = 502
			label.Parent = frame
			self.Overlay = frame
			self.ParticlesFrame = particles
			self.Label = label
		end,
		StartParticles = function(self)
			self.SpawnToken = (self.SpawnToken or 0) + 1
			local token = self.SpawnToken
			local container = self.ParticlesFrame
			task.spawn(function()
				while token == self.SpawnToken and self.Visible do
					local w = container.AbsoluteSize.X
					local h = container.AbsoluteSize.Y
					if w > 0 and h > 0 then
						local size = math.random(2, 5)
						local p = Instance.new("Frame")
						p.Name = "Snow"
						p.Size = UDim2.fromOffset(size, size)
						local startY = math.random(-20, math.max(h, 1))
						p.Position = UDim2.fromOffset(-10, startY)
						p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						p.BackgroundTransparency = math.random(30, 80) / 100
						p.BorderSizePixel = 0
						p.ZIndex = 501
						local corner = Instance.new("UICorner")
						corner.CornerRadius = UDim.new(1, 0)
						corner.Parent = p
						p.Parent = container
						local drift = math.random(-160, 160)
						local duration = math.random(45, 95) / 10
						local tween = TweenService:Create(p, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
							Position = UDim2.fromOffset(w + 10, startY + drift),
						})
						tween.Completed:Connect(function()
							if p and p.Parent then p:Destroy() end
						end)
						tween:Play()
					end
					task.wait(0.12)
				end
			end)
		end,
		StopParticles = function(self)
			self.SpawnToken = (self.SpawnToken or 0) + 1
			local container = self.ParticlesFrame
			if container then
				for _, child in ipairs(container:GetChildren()) do
					if child:IsA("Frame") then child:Destroy() end
				end
			end
		end,
		PickPhrase = function(self)
			local phrase
			repeat
				phrase = self.PHRASES[math.random(1, #self.PHRASES)]
			until phrase ~= self.LastPhrase
			self.LastPhrase = phrase
			return phrase
		end,
		Show = function(self)
			self:BuildOverlay()
			local frame = self.Overlay
			local label = self.Label
			self.Visible = true
			frame.Visible = true
			frame.BackgroundTransparency = 1
			label.TextTransparency = 1
			label.Text = self:PickPhrase()
			Animations.tween(frame, {BackgroundTransparency = 0}, 0.5)
			Animations.tween(label, {TextTransparency = 0.05}, 0.9)
			if self.State.Particles ~= false then
				self:StartParticles()
			end
		end,
		Hide = function(self, fast)
			self.Visible = false
			self:StopParticles()
			local frame = self.Overlay
			local label = self.Label
			if not frame then return end
			if label then label.TextTransparency = 1 end
			Animations.tweenCompleted(frame, {BackgroundTransparency = 1}, fast and 0 or 0.4, function()
				frame.Visible = false
			end)
		end,
		OnEnable = function(self)
			self.SpawnToken = (self.SpawnToken or 0) + 1
			local function hookChar(char)
				local hum = char:WaitForChild("Humanoid", 5)
				if not hum then return end
				Mods.Connect(self, hum.Died:Connect(function()
					self:Show()
				end))
			end
			if player.Character then hookChar(player.Character) end
			Mods.Connect(self, player.CharacterAdded:Connect(function(char)
				self:Hide(false)
				hookChar(char)
			end))
		end,
		OnDisable = function(self)
			self:Hide(true)
		end,
	})
	do
		local m = Mods.Get("DeathMotivation")
		if m and getFeature("FosforMod_DeathMotivation") == nil and getFeature("DeathMotivation") == true then
			m._wantEnabled = true
		end
	end

	-- ============================================================
	-- МОДУЛЬ: АВТО-СПАВН ПАЛЕТКИ ПО БИНДУ (фикс: бинд обновляет Key сразу)
	-- ============================================================
	Mods.Register({
		Id = "PalletBind",
		Tab = "Misc",
		Name = "Авто-спавн палетки",
		Auto = true,
		Defaults = {BindName = ""},
		Spawn = function(self)
			local char = player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			if not root then
				log("Нет персонажа — палетка не заспавнена")
				return
			end
			local rs = game:GetService("ReplicatedStorage")
			local mt = rs:FindFirstChild("MenuToys")
			local spawnRF = mt and mt:FindFirstChild("SpawnToyRemoteFunction")
			if not spawnRF then
				pcall(function() spawnRF = rs:FindFirstChild("SpawnToyRemoteFunction", true) end)
			end
			if not spawnRF then
				log("SpawnToyRemoteFunction не найден")
				return
			end
			playSound("silent")
			task.spawn(function()
				pcall(function()
					spawnRF:InvokeServer("PalletLightBrown", root.CFrame * CFrame.new(0, 0, 0), Vector3.zero)
				end)
			end)
			log("Палетка заспавнена")
		end,
		Persist = function(self)
			setFeature("FosforMod_PalletBind", {enabled = self.Enabled, state = self.State})
		end,
		Build = function(self, u)
			u.Section("Палетка")
			local row = u.Row(42)
			pcall(function() UI.basicHover(row, 0.1, 0.08, 0.75, 0.25) end)
			pcall(function()
				UI.button({
					Name = "PalletLabel", Parent = row,
					Size = UDim2.new(1, -160, 1, 0), Position = UDim2.new(0, 14, 0, 0),
					BackgroundTransparency = 1, Stroke = false,
					Text = "Авто-спавн палетки (бинд)",
					TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
					Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
				})
			end)
			local bindBtn = UI.button({
				Name = "PalletBindBtn", Parent = row,
				Size = UDim2.fromOffset(90, 28), Position = UDim2.new(1, -144, 0.5, -14),
				BackgroundTransparency = 0.1,
				Text = (self.State.BindName ~= "" and self.State.BindName) or "Нет клавиши",
				TextSize = 12, ThemeBackground = "element", ThemeText = "text",
				Font = Enum.Font.Gotham, Corner = 10,
			})
			pcall(function() UI.basicHover(bindBtn, 0.1, 0.03, 0.6, 0.08) end)
			local clearBtn = UI.button({
				Name = "PalletClearBtn", Parent = row,
				Size = UDim2.fromOffset(40, 28), Position = UDim2.new(1, -50, 0.5, -14),
				BackgroundTransparency = 0.1, Text ="", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text",
				Font = Enum.Font.Gotham, Corner = 10,
			})
			pcall(function() UI.basicHover(clearBtn, 0.1, 0.03, 0.6, 0.08) end)
			local listening = false
			local listenConn = nil
			bindBtn.MouseButton1Click:Connect(function()
				if listening then return end
				listening = true
				bindBtn.Text = "Нажми клавишу…"
				playSound("silent")
				listenConn = UserInputService.InputBegan:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
					if input.KeyCode == Enum.KeyCode.Escape then
						listening = false
						bindBtn.Text = (self.State.BindName ~= "" and self.State.BindName) or "Нет клавиши"
						if listenConn then listenConn:Disconnect() listenConn = nil end
						return
					end
					self.State.BindName = input.KeyCode.Name
					pcall(function() self.Key = Enum.KeyCode[input.KeyCode.Name] end)
					self:Persist()
					bindBtn.Text = input.KeyCode.Name
					listening = false
					if listenConn then listenConn:Disconnect() listenConn = nil end
					playSound("silent")
					log("Бинд палетки: " .. input.KeyCode.Name)
				end)
				task.delay(5, function()
					if listening then
						listening = false
						bindBtn.Text = (self.State.BindName ~= "" and self.State.BindName) or "Нет клавиши"
						if listenConn then listenConn:Disconnect() listenConn = nil end
					end
				end)
			end)
			clearBtn.MouseButton1Click:Connect(function()
				self.State.BindName = ""
				self.Key = nil
				self:Persist()
				bindBtn.Text = "Нет клавиши"
				playSound("silent")
				log("Бинд палетки сброшен")
			end)
		end,
		OnEnable = function(self)
			self.Key = nil
			if type(self.State.BindName) == "string" and self.State.BindName ~= "" then
				pcall(function() self.Key = Enum.KeyCode[self.State.BindName] end)
			end
			Mods.Connect(self, UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed then return end
				if UserInputService:GetFocusedTextBox() then return end
				if self.Key and input.KeyCode == self.Key then
					self:Spawn()
				end
			end))
		end,
		OnDisable = function(self)
			self.Key = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: HUD-ПЛАШКИ (время ИРЛ / время сервера)
	-- ============================================================
	Mods.Register({
		Id = "HudPlaques",
		Tab = "Themes",
		Name = "HUD-плашки",
		Defaults = {},
		Build = function(self, u)
			u.Section("HUD-плашки")
			self._masterToggle = u.Toggle("HUD-плашки (время/сервер)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Размер плашек", 10, 28, self.State.PlaqueSize or 16, function(v) self.State.PlaqueSize = v end))
		end,
		Update = function(self)
			if not self.Panels then return end
			local p = self.Panels
			if p.irl then p.irl.label.Text = os.date("%H:%M:%S") end
			if p.server then p.server.label.Text = formatTime(workspace.DistributedGameTime) end
		end,
		BuildUi = function(self)
			if self.Container then return end
			local container = Instance.new("Frame")
			container.Name = "HudPlaques"
			container.AnchorPoint = Vector2.new(0.5, 1)
			container.Position = UDim2.new(0.5, 0, 1, 60)
			container.Size = UDim2.new(0, 0, 0, 40)
			container.AutomaticSize = Enum.AutomaticSize.X
			container.BackgroundTransparency = 1
			container.ZIndex = 100
			container.Active = false
			container.Parent = gui
			local layout = Instance.new("UIListLayout")
			layout.FillDirection = Enum.FillDirection.Horizontal
			layout.Padding = UDim.new(0, 8)
			layout.SortOrder = Enum.SortOrder.LayoutOrder
			layout.VerticalAlignment = Enum.VerticalAlignment.Center
			layout.Parent = container
			self.Panels = {}
			local items = {
				{key = "irl", order = 1},
				{key = "server", order = 2},
			}
			for _, item in ipairs(items) do
				local panel = Instance.new("Frame")
				panel.Name = item.key
				panel.Size = UDim2.new(0, 0, 1, 0)
				panel.AutomaticSize = Enum.AutomaticSize.X
				panel.BackgroundColor3 = currentPalette.panel
				panel.BackgroundTransparency = 0.1
				panel.BorderSizePixel = 0
				panel.LayoutOrder = item.order
				panel.ZIndex = 100
				panel.Parent = container
				UI.corner(panel, 14)
				UI.stroke(panel, 0.35, 1.5)
				UI.gradient(panel, 90)
				local pad = Instance.new("UIPadding")
				pad.PaddingLeft = UDim.new(0, 16)
				pad.PaddingRight = UDim.new(0, 16)
				pad.Parent = panel
				addThemed("panel", panel)
				local lbl = Instance.new("TextLabel")
				lbl.Name = "Text"
				lbl.Size = UDim2.fromScale(1, 1)
				lbl.BackgroundTransparency = 1
				lbl.Text = "--:--:--"
				lbl.Font = Enum.Font.GothamBold
				lbl.TextSize = self.State.PlaqueSize or 16
				lbl.TextColor3 = currentPalette.text
				lbl.ZIndex = 101
				lbl.Parent = panel
				addThemed("text", lbl)
				self.Panels[item.key] = {frame = panel, label = lbl}
			end
			self.Container = container
		end,
		OnEnable = function(self)
			self:BuildUi()
			self:Update()
			local c = self.Container
			c.Visible = true
			c.Position = UDim2.new(0.5, 0, 1, 60)
			for _, p in pairs(self.Panels) do
				p.frame.BackgroundTransparency = 0.7
				p.label.TextTransparency = 1
			end
			Animations.tween(c, {Position = UDim2.new(0.5, 0, 1, -16)}, 0.45)
			for _, p in pairs(self.Panels) do
				Animations.tween(p.frame, {BackgroundTransparency = 0.1}, 0.45)
				Animations.tween(p.label, {TextTransparency = 0}, 0.45)
			end
			self._acc = 0
		end,
		OnHeartbeat = function(self, dt)
			self._acc = (self._acc or 0) + dt
			if self._acc < 1 then return end
			self._acc = 0
			self:Update()
		end,
		OnDisable = function(self)
			if not self.Container then return end
			local c = self.Container
			Animations.tween(c, {Position = UDim2.new(0.5, 0, 1, 60)}, 0.35)
			for _, p in pairs(self.Panels or {}) do
				Animations.tween(p.frame, {BackgroundTransparency = 0.7}, 0.35)
				Animations.tween(p.label, {TextTransparency = 1}, 0.35)
			end
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ВРЕМЯ В ИГРЕ (Settings, фоновый)
	-- ============================================================
	Mods.Register({
		Id = "Playtime",
		Tab = "Settings",
		Name = "Время в игре",
		Auto = true,
		Defaults = {},
		Build = function(self, u)
			local row = u.Row(36)
			self.PlaytimeLabel = UI.button({
				Name = "PlaytimeLabel", Parent = row,
				Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
				BackgroundTransparency = 1, Stroke = false,
				Text = "Считаем время...",
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
				Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
			})
		end,
		OnEnable = function(self)
			self.Start = tick()
			self.Saved = 0
			self.Source = "session"
			pcall(function()
				local got = nil
				local ls = player:FindFirstChild("leaderstats")
				if ls then
					for _, stat in ipairs(ls:GetChildren()) do
						local lower = string.lower(stat.Name)
						if (lower:find("time") or lower:find("play") or lower:find("час")) and typeof(stat.Value) == "number" then
							got = stat.Value
						end
					end
				end
				if not got then
					for name, value in pairs(player:GetAttributes()) do
						local lower = string.lower(tostring(name))
						if type(value) == "number" and (lower:find("time") or lower:find("play")) then
							got = value
						end
					end
				end
				if got then
					self.Saved = got
					self.Source = "game"
				else
					if typeof(readfile) == "function" and typeof(isfile) == "function" and isfile("FosforPlaytime.txt") then
						self.Saved = tonumber(readfile("FosforPlaytime.txt")) or 0
						self.Source = "fosfor"
					end
				end
			end)
			self._accSave = 0
			self._accUi = 0
			Mods.Connect(self, gui.Destroying:Connect(function()
				self:Save()
			end))
		end,
		Total = function(self)
			return self.Saved + (tick() - self.Start)
		end,
		Save = function(self)
			if self.Source == "game" then return end
			pcall(function()
				if typeof(writefile) == "function" then
					writefile("FosforPlaytime.txt", tostring(math.floor(self:Total())))
				end
			end)
		end,
		OnHeartbeat = function(self, dt)
			self._accSave = (self._accSave or 0) + dt
			if self._accSave >= 30 then
				self._accSave = 0
				self:Save()
			end
			self._accUi = (self._accUi or 0) + dt
			if self._accUi < 1 then return end
			self._accUi = 0
			if not self.PlaytimeLabel or not self.PlaytimeLabel.Parent then return end
			local sec = math.floor(self:Total())
			local h = math.floor(sec / 3600)
			local m = math.floor((sec % 3600) / 60)
			local s = sec % 60
			local text
			if h > 0 then
				text = h .. " ч " .. m .. " мин"
			else
				text = m .. " мин " .. s .. " сек"
			end
			local src = ""
			if self.Source == "game" then
				src = "  •  данные игры"
			elseif self.Source == "fosfor" then
				src = "  •  учёт Fosfor"
			else
				src = "  •  эта сессия"
			end
			self.PlaytimeLabel.Text = "В игре проведено: " .. text .. src
		end,
		OnDisable = function(self)
			self:Save()
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: РЕЖИМ СЪЁМКИ (Misc; не прячет прицел)
	-- ============================================================
	Mods.Register({
		Id = "FilmingMode",
		Tab = "Visual",
		Name = "Режим съёмки",
		Defaults = {},
		CORE_TYPES = {
			Enum.CoreGuiType.Health,
			Enum.CoreGuiType.Backpack,
			Enum.CoreGuiType.Chat,
			Enum.CoreGuiType.PlayerList,
			Enum.CoreGuiType.EmotesMenu,
		},
		SetCoreGui = function(self, enabled)
			local sg = game:GetService("StarterGui")
			for _, t in ipairs(self.CORE_TYPES) do
				pcall(function() sg:SetCoreGuiEnabled(t, enabled) end)
			end
		end,
		HideGameUI = function(self)
			self.SavedGui = self.SavedGui or {}
			for _, g in ipairs(playerGui:GetChildren()) do
				if g:IsA("LayerCollector") and g.Name ~= "FosforGui" and g.Name ~= "FosforCrosshairGui" then
					if self.SavedGui[g] == nil then self.SavedGui[g] = g.Enabled end
					g.Enabled = false
				end
			end
			self:SetCoreGui(false)
		end,
		ShowGameUI = function(self)
			for g, was in pairs(self.SavedGui or {}) do
				pcall(function() if g and g.Parent then g.Enabled = was end end)
			end
			self.SavedGui = {}
			self:SetCoreGui(true)
		end,
		Build = function(self, u)
			u.Section("Съёмка и камера")
			self._masterToggle = u.Toggle("Режим съёмки (C — показать/скрыть UI)", false, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		OnEnable = function(self)
			self.SavedGui = {}
			self.UiShown = false
			self:HideGameUI()
			Mods.Connect(self, UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed then return end
				if input.KeyCode == Enum.KeyCode.C then
					self.UiShown = not self.UiShown
					if self.UiShown then
						self:ShowGameUI()
					else
						self:HideGameUI()
					end
				end
			end))
			log("Режим съёмки включён. Нажимай C, чтобы показать/скрыть UI.")
		end,
		OnDisable = function(self)
			self:ShowGameUI()
			self.UiShown = false
			log("Режим съёмки выключен. UI восстановлен.")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ВИД ОТ 3 ЛИЦА (новый, Misc)
	-- ============================================================
	Mods.Register({
		Id = "ThirdPerson",
		Tab = "Visual",
		Name = "Вид от 3 лица",
		Defaults = {Zoom = 128},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Вид от 3 лица (далёкая камера)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Дистанция зума", 16, 128, self.State.Zoom or 128, function(v) self.State.Zoom = v end))
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		OnEnable = function(self)
			self.PrevMode = player.CameraMode
			self.PrevMax = player.CameraMaxZoomDistance
			player.CameraMode = Enum.CameraMode.Classic
			pcall(function()
				player.CameraMaxZoomDistance = self.State.Zoom or 128
				player.CameraMinZoomDistance = 0.5
			end)
			log("Вид от 3 лица включён")
		end,
		OnDisable = function(self)
			pcall(function()
				if self.PrevMode then player.CameraMode = self.PrevMode end
				if self.PrevMax then player.CameraMaxZoomDistance = self.PrevMax end
			end)
			self.PrevMode = nil
			self.PrevMax = nil
			log("Вид от 3 лица выключен")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ПРИЦЕЛ (Target; мастер + под-настройки)
	-- ============================================================
	Mods.Register({
		Id = "Crosshair",
		Tab = "Target",
		Name = "Прицел",
		Defaults = {Dot = true, Circle = false, Size = 26, Transparency = 15},
		Build = function(self, u)
			if self.State.Enabled == nil then self.State.Enabled = getFeature("Crosshair") == true end
			if self.State.Dot == nil then self.State.Dot = getFeature("CrosshairDot") ~= false end
			if self.State.Circle == nil then self.State.Circle = getFeature("CrosshairCircle") == true end
			if self.State.Size == nil then self.State.Size = getFeature("CrosshairSize") or 26 end
			if self.State.Transparency == nil then self.State.Transparency = getFeature("CrosshairTransparency") or 15 end
			u.Section("Прицел")
			self._subRows = {}
			self._masterToggle = u.Toggle("Прицел (центр экрана)", self.State.Enabled == true, function(v)
				self.State.Enabled = v
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Точка в центре", self.State.Dot ~= false, function(v)
				self.State.Dot = v
				if self.Enabled then self:Apply() end
			end))
			subAdd(self, u.Toggle("Круг вокруг", self.State.Circle == true, function(v)
				self.State.Circle = v
				if self.Enabled then self:Apply() end
			end))
			subAdd(self, u.Slider("Размер прицела", 12, 64, self.State.Size or 26, function(v)
				self.State.Size = math.floor(v + 0.5)
				if self.Enabled then self:Apply() end
			end))
			subAdd(self, u.Slider("Прозрачность прицела %", 0, 90, self.State.Transparency or 15, function(v)
				self.State.Transparency = math.floor(v + 0.5)
				if self.Enabled then self:Apply() end
			end))
			subShow(self, self.State.Enabled == true)
		end,
		Apply = function(self)
			if not self.Gui then return end
			self.Gui.Enabled = true
			local s = self.State.Size or 26
			local tr = (self.State.Transparency or 15) / 100
			local thick = 2
			local len = math.max(4, math.floor(s * 0.38))
			local gap = math.max(3, math.floor(s * 0.16))
			local off = gap + len / 2
			local parts = self.Parts
			parts.Dot.frame.Size = UDim2.fromOffset(4, 4)
			parts.Dot.frame.Visible = self.State.Dot ~= false
			parts.Dot.frame.BackgroundTransparency = tr
			parts.LineTop.frame.Size = UDim2.fromOffset(thick, len)
			parts.LineTop.frame.Position = UDim2.new(0.5, 0, 0.5, -off)
			parts.LineTop.frame.BackgroundTransparency = tr
			parts.LineBottom.frame.Size = UDim2.fromOffset(thick, len)
			parts.LineBottom.frame.Position = UDim2.new(0.5, 0, 0.5, off)
			parts.LineBottom.frame.BackgroundTransparency = tr
			parts.LineLeft.frame.Size = UDim2.fromOffset(len, thick)
			parts.LineLeft.frame.Position = UDim2.new(0.5, -off, 0.5, 0)
			parts.LineLeft.frame.BackgroundTransparency = tr
			parts.LineRight.frame.Size = UDim2.fromOffset(len, thick)
			parts.LineRight.frame.Position = UDim2.new(0.5, off, 0.5, 0)
			parts.LineRight.frame.BackgroundTransparency = tr
			parts.Circle.frame.Size = UDim2.fromOffset(s, s)
			parts.Circle.frame.Visible = self.State.Circle == true
			parts.Circle.stroke.Transparency = tr
		end,
		OnEnable = function(self)
			if not self.Gui then
				local g = Instance.new("ScreenGui")
				g.Name = "FosforCrosshairGui"
				g.ResetOnSpawn = false
				g.IgnoreGuiInset = true
				g.DisplayOrder = 997
				g.Enabled = false
				g.Parent = playerGui
				self.Gui = g
				self.Parts = {}
				local function newPart(name, isCircle)
					local f = Instance.new("Frame")
					f.Name = name
					f.AnchorPoint = Vector2.new(0.5, 0.5)
					f.Position = UDim2.new(0.5, 0, 0.5, 0)
					f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					f.BorderSizePixel = 0
					f.ZIndex = 1
					f.Parent = g
					if isCircle then
						f.BackgroundTransparency = 1
						local c = Instance.new("UICorner")
						c.CornerRadius = UDim.new(1, 0)
						c.Parent = f
						local st = Instance.new("UIStroke")
						st.Thickness = 1.5
						st.Color = Color3.fromRGB(255, 255, 255)
						st.Parent = f
						self.Parts[name] = {frame = f, stroke = st}
					else
						local c = Instance.new("UICorner")
						c.CornerRadius = UDim.new(0, 2)
						c.Parent = f
						self.Parts[name] = {frame = f}
					end
					return f
				end
				newPart("Dot", false)
				newPart("LineTop", false)
				newPart("LineBottom", false)
				newPart("LineLeft", false)
				newPart("LineRight", false)
				newPart("Circle", true)
				if not self._destroyHook then
					self._destroyHook = true
					gui.Destroying:Connect(function()
						pcall(function() if self.Gui then self.Gui:Destroy() end end)
					end)
				end
			end
			-- в OnEnable, перед self:Apply():
			self.HiddenCross = {}
			pcall(function()
				for _, g in ipairs(playerGui:GetDescendants()) do
					local ln = string.lower(g.Name)
					if g:IsA("GuiObject") and (ln:find("crosshair") or ln:find("cross") or ln:find("reticle")) then
						if g.Visible then
							g.Visible = false
							table.insert(self.HiddenCross, g)
						end
					end
				end
			end)
			self:Apply()
		end,
		OnDisable = function(self)
			if self.Gui then
				self.Gui.Enabled = false
			end
		end,
	})

-- ===== КОНЕЦ ЧАСТИ 3 ===== (следующая Часть 4: ESP-модули, Target-рамки, трейл, PVP)
-- ===== ЧАСТЬ 4 ===== (PVP, ESP, Target, Trail, Палетки, Шейдеры, Океан)

	-- ============================================================
	-- МОДУЛЬ: PVP (матч + засчитывание + HUD)
	-- ============================================================
	Mods.Register({
		Id = "PVP",
		Tab = "PVP",
		Name = "PVP Матч",
		Icon = "",
		Desc = "",
		Auto = true,
		Defaults = {["Окно килла (сек)"] = 15},
		KILL_WINDOW = 5,
		DB_WINDOW = 3,
		SIM_WINDOW = 1,
		OWN_RECENT = 3,
		OnEnable = function(self)
			self.PvpState = "idle"
			self.Opponent = nil
			self.LocationLabel = ""
			self.TargetScore = 5
			self.CountSS, self.CountAS, self.CountDB = true, true, true
			self.ScoreMe, self.ScoreOpp = 0, 0
			self.StartTime, self.EndTime = 0, 0
			self.SsY = -50
			self.MyGrabOnOpp, self.OppGrabOnMe = -999, -999
			self.RecentKillMe, self.RecentKillOpp = -999, -999
			self.DeathMe, self.DeathOpp = -999, -999
			self.AgMe, self.AgOpp = 0, 0
			self.AsCdMe, self.AsCdOpp = -999, -999
			self.AsSamples = {me = 0, opp = 0}
			self.MatchConns = {}
			self.Hud = {built = false, shown = false}
			Mods.Connect(self, Players.PlayerRemoving:Connect(function(pl)
				if self.PvpState == "live" and self.Opponent and pl == self.Opponent then
					self:Log("соперник вышел с сервера")
					self:Finish("me", true)
				end
			end))
		end,
		Log = function(self, msg)
			if addConsoleLine then addConsoleLine("PVP:".. msg,"info") end
		end,
		ConnectMatch = function(self, conn)
			table.insert(self.MatchConns, conn)
			return conn
		end,
		ClearMatchConns = function(self)
			for _, c in ipairs(self.MatchConns or {}) do
				pcall(function() c:Disconnect() end)
			end
			self.MatchConns = {}
		end,
		HudShow = function(self)
			local hud = self.Hud
			if not hud.root then return end
			hud.root.Visible = true
			hud.root.GroupTransparency = 1
			hud.root.Position = UDim2.new(0.5, -280, 0, -140)
			Animations.tween(hud.root, {Position = UDim2.new(0.5, -280, 0, 54), GroupTransparency = 0}, 0.45)
		end,
		HudHide = function(self, instant)
			local hud = self.Hud
			if not hud.root then return end
			if instant then hud.root.Visible = false return end
			Animations.tweenCompleted(hud.root, {Position = UDim2.new(0.5, -280, 0, -140), GroupTransparency = 1}, 0.35, function()
				hud.root.Visible = false
			end)
		end,
		HudScore = function(self, side)
			local hud = self.Hud
			local p = (side == "me") and hud.me or hud.opp
			if not p then return end
			p.lbl.Text = tostring((side == "me") and self.ScoreMe or self.ScoreOpp)
			p.scale.Scale = 1.3
			Animations.tween(p.scale, {Scale = 1}, 0.25)
		end,
		HudFinish = function(self, winner)
			local hud = self.Hud
			if hud.time then hud.time.Text = formatTime(self.EndTime - self.StartTime) end
			if hud.result then
				hud.result.Text = (winner == "me") and "Вы выиграли" or "Вы проиграли"
				hud.result.TextColor3 = (winner == "me") and Color3.fromRGB(90, 255, 120) or Color3.fromRGB(255, 90, 90)
				Animations.tween(hud.result, {TextTransparency = 0}, 0.4)
				task.delay(4, function()
					if hud.result then Animations.tween(hud.result, {TextTransparency = 1}, 0.6) end
				end)
			end
			local wp = (winner == "me") and hud.me or hud.opp
			if wp then
				task.spawn(function()
					local t0 = tick()
					while self.PvpState == "finished" and tick() - t0 < 6 and wp.stroke and wp.stroke.Parent do
						Animations.tween(wp.stroke, {Transparency = 0, Color = Color3.fromRGB(90, 255, 120)}, 0.4)
						task.wait(0.45)
						Animations.tween(wp.stroke, {Transparency = 0.55, Color = Color3.fromRGB(90, 255, 120)}, 0.4)
						task.wait(0.45)
					end
				end)
			end
		end,
		HudBuild = function(self)
			local hud = self.Hud
			if hud.built then return end
			hud.built = true
			local root = Instance.new("CanvasGroup")
			root.Name = "PvpHud"
			root.Size = UDim2.fromOffset(560, 130)
			root.Position = UDim2.new(0.5, -280, 0, -140)
			root.BackgroundTransparency = 1
			root.GroupTransparency = 1
			root.Visible = false
			root.ZIndex = 400
			root.Parent = gui
			Mods.Track(self, root)
			hud.root = root
			local function mkLabel(name, w, h, x, y, size, font, anchorX)
				local l = Instance.new("TextLabel")
				l.Name = name
				l.Size = UDim2.fromOffset(w, h)
				l.Position = UDim2.new(0.5, x, 0, y)
				l.AnchorPoint = Vector2.new(anchorX or 0.5, 0)
				l.BackgroundTransparency = 1
				l.TextColor3 = currentPalette.text
				l.Font = font or Enum.Font.GothamBold
				l.TextSize = size or 14
				l.ZIndex = 401
				l.Parent = root
				return l
			end
			hud.time = mkLabel("Time", 140, 16, 0, 0, 13, Enum.Font.Gotham)
			hud.dash = mkLabel("Dash", 140, 26, 0, 18, 20)
			hud.dash.Text = "—"
			hud.loc = mkLabel("Loc", 300, 14, 0, 46, 11, Enum.Font.Gotham)
			hud.loc.TextColor3 = currentPalette.sub
			hud.result = mkLabel("Result", 300, 22, 0, 102, 16)
			hud.result.TextTransparency = 1
			local function makePlate(side)
				local right = (side == "opp")
				local plate = Instance.new("Frame")
				plate.Name = "Plate_" .. side
				plate.AnchorPoint = Vector2.new(right and 0 or 1, 0)
				plate.Position = UDim2.new(0.5, right and 150 or -150, 0, 12)
				plate.Size = UDim2.new(0, 90, 0, 52)
				plate.AutomaticSize = Enum.AutomaticSize.X
				plate.BackgroundColor3 = currentPalette.panel
				plate.BackgroundTransparency = 0.1
				plate.BorderSizePixel = 0
				plate.ZIndex = 401
				plate.Parent = root
				UI.corner(plate, 12)
				local st = UI.stroke(plate, 0.35, 2)
				local pad = Instance.new("UIPadding")
				pad.PaddingLeft = UDim.new(0, 18)
				pad.PaddingRight = UDim.new(0, 18)
				pad.Parent = plate
				local lbl = Instance.new("TextLabel")
				lbl.Size = UDim2.new(0, 0, 1, 0)
				lbl.AutomaticSize = Enum.AutomaticSize.X
				lbl.BackgroundTransparency = 1
				lbl.Text = "0"
				lbl.Font = Enum.Font.GothamBold
				lbl.TextSize = 28
				lbl.TextColor3 = currentPalette.text
				lbl.Parent = plate
				local sc = Instance.new("UIScale")
				sc.Parent = plate
				return {plate = plate, lbl = lbl, stroke = st, scale = sc}
			end
			hud.me = makePlate("me")
			hud.opp = makePlate("opp")
			local function makeAvatar(side)
				local right = (side == "opp")
				local a = Instance.new("ImageLabel")
				a.Name = "Avatar_" .. side
				a.Size = UDim2.fromOffset(48, 48)
				a.AnchorPoint = Vector2.new(right and 0 or 1, 0)
				a.Position = UDim2.new(0.5, right and 252 or -252, 0, 14)
				a.BackgroundTransparency = 1
				a.ZIndex = 401
				a.Parent = root
				local c = Instance.new("UICorner")
				c.CornerRadius = UDim.new(1, 0)
				c.Parent = a
				return a
			end
			hud.avMe = makeAvatar("me")
			hud.avOpp = makeAvatar("opp")
			hud.nameMe = mkLabel("NameMe", 220, 30, -150, 68, 11, Enum.Font.Gotham, 1)
			hud.nameMe.TextXAlignment = Enum.TextXAlignment.Right
			hud.nameMe.TextColor3 = currentPalette.sub
			hud.nameOpp = mkLabel("NameOpp", 220, 30, 150, 68, 11, Enum.Font.Gotham, 0)
			hud.nameOpp.TextXAlignment = Enum.TextXAlignment.Left
			hud.nameOpp.TextColor3 = currentPalette.sub
		end,
		DetectSea = function(self, loc)
			self.SsY = -50
			if not loc or typeof(loc) ~= "Vector3" then
				self:Log("море: координаты недоступны, СС при Y ≤ -50")
				return
			end
			pcall(function()
				local params = RaycastParams.new()
				params.FilterType = Enum.RaycastFilterType.Exclude
				local filterList = {}
				if player and player.Character then
					table.insert(filterList, player.Character)
				end
				if self.Opponent and self.Opponent.Character then
					table.insert(filterList, self.Opponent.Character)
				end
				params.FilterDescendantsInstances = filterList
				local res = workspace:Raycast(Vector3.new(loc.X, 400, loc.Z), Vector3.new(0, -900, 0), params)
				if res then
					self.SsY = math.min(res.Position.Y - 8, -20)
					self:Log(string.format("море рядом: (%.0f, %.0f, %.0f) → СС при Y ≤ %.0f", res.Position.X, res.Position.Y, res.Position.Z, self.SsY))
				else
					self:Log("море: не найдено, СС при Y ≤ -50")
				end
			end)
		end,
		WatchChar = function(self, char, isMe)
			local c = char.DescendantAdded:Connect(function(d)
				if d.Name ~= "PartOwner" then return end
				task.spawn(function()
					local v = d.Value
					if v == "" then task.wait(0.2) v = d.Value end
					local now = tick()
					if isMe and self.Opponent and v == self.Opponent.Name then
						self.OppGrabOnMe = now
					elseif not isMe and v == player.Name then
						self.MyGrabOnOpp = now
					end
				end)
			end)
			self:ConnectMatch(c)
		end,
		Award = function(self, side, reason)
			if self.PvpState ~= "live" then return end
			if reason == "ss" and not self.CountSS then return end
			if reason == "as" and not self.CountAS then return end
			if reason == "db" and not self.CountDB then return end
			if side == "me" then
				self.ScoreMe = self.ScoreMe + 1
			else
				self.ScoreOpp = self.ScoreOpp + 1
			end
			if reason == "kill" then
				if side == "me" then
					self.RecentKillMe = tick()
					playSound("silent")
					if notify then notify("Килл: +1") end
				else
					self.RecentKillOpp = tick()
				end
			end
			self:Log(string.format("%s +1 (%s) → %d:%d", side == "me" and "ТЕБЕ" or "СОПЕРНИКУ", reason, self.ScoreMe, self.ScoreOpp))
			self:HudScore(side)
			if self.ScoreMe >= self.TargetScore then
				self:Finish("me")
			elseif self.ScoreOpp >= self.TargetScore then
				self:Finish("opp")
			end
		end,
		OnDeath = function(self, who, root)
			if self.PvpState ~= "live" then return end
			local now = tick()
			-- дедуп: один факт смерти может прийти несколькими сигналами
			-- (Died + HP-поллинг + войд + респавн-бэктфил) — засчитываем первый
			local lastHandled = (who == "me") and self.DeathMe or self.DeathOpp
			if now - lastHandled < 1.5 then return end
			local other = (who == "me") and "opp" or "me"
			local pos = root and root.Position or Vector3.new(0, -999, 0)
			local killWin = self.State["Окно килла (сек)"] or self.KILL_WINDOW
			local ownedByOther = (who == "me") and (now - self.OppGrabOnMe <= killWin)
				or (who == "opp") and (now - self.MyGrabOnOpp <= killWin)
			local killed = false
			if ownedByOther then
				killed = true
				self:Award(other, "kill")
				if who == "opp" and self.MyGrabOnOpp > 0 then
					self:Log(string.format("килл засчитан: я брал его %.1f c назад (причина смерти неважна: регдолл/море/что угодно)", now - self.MyGrabOnOpp))
				end
			end
			if self.CountDB then
				local selfRecent = (who == "me") and (now - self.RecentKillMe <= self.DB_WINDOW)
					or (who == "opp") and (now - self.RecentKillOpp <= self.DB_WINDOW)
				local otherDeath = (other == "me") and self.DeathMe or self.DeathOpp
				local simultaneous = (now - otherDeath) <= self.SIM_WINDOW
				if selfRecent or simultaneous then
					self:Award("me", "db")
					self:Award("opp", "db")
				end
			end
			if not killed and self.CountSS then
				local markOnWho = (who == "me") and self.OppGrabOnMe or self.MyGrabOnOpp
				local ownedRecently = (now - markOnWho) <= self.OWN_RECENT
				if pos.Y <= self.SsY and not ownedRecently then
					self:Award(other, "ss")
				end
			end
			if who == "me" then self.DeathMe = now else self.DeathOpp = now end
		end,
		-- FTAP-баг: смерть часто без Died (флинг/регдолл/войт без обнуления HP).
		-- Респавн после моего граба = он точно умер от меня — засчитываем задним числом
		BackfillDeath = function(self, who)
			if self.PvpState ~= "live" then return end
			local now = tick()
			local lastHandled = (who == "me") and self.DeathMe or self.DeathOpp
			if now - lastHandled < 1.5 then return end
			local killWin = self.State["Окно килла (сек)"] or self.KILL_WINDOW
			if who == "opp" then
				if self.MyGrabOnOpp > 0 and (now - self.MyGrabOnOpp) <= killWin then
					self:Log(string.format("догоняющий килл: он заспавнился %.1f c после моего граба (Died не пришёл)", now - self.MyGrabOnOpp))
					self:OnDeath("opp", nil)
				end
			else
				if self.OppGrabOnMe > 0 and (now - self.OppGrabOnMe) <= killWin then
					self:Log(string.format("догоняющий килл соперника: я заспавнился %.1f c после его граба", now - self.OppGrabOnMe))
					self:OnDeath("me", nil)
				end
			end
		end,
		-- поллинг HP и высоты: ловит смерти, про которые игра не написала.
		-- Войд FTAP ≈ уровень SsY (−50): ниже линии = смерть, персонаж вот-вот
		-- уничтожится. Регдолл учитываем: меряем САМУЮ НИЖНЮЮ часть тела,
		-- а не только HumanoidRootPart (у регдолла корень отстаёт от тела)
		StartDeathWatcher = function(self)
			self.WatchLastY = {me = 0, opp = 0}
			self.WatchBelow = {me = 0, opp = 0}
			task.spawn(function()
				while self.PvpState == "live" do
					local now = tick()
					local sides = {
						{who = "me", char = player.Character},
						{who = "opp", char = self.Opponent and self.Opponent.Character},
					}
					for _, s in ipairs(sides) do
						local char = s.char
						local lastHandled = (s.who == "me") and self.DeathMe or self.DeathOpp
						local dead = false
						if char and char.Parent then
							local hum = char:FindFirstChildOfClass("Humanoid")
							local root = char:FindFirstChild("HumanoidRootPart")
							if hum and root then
								if hum.Health <= 0 then
									dead = true
								else
									local dip = _G.FosforLegsDip
									local suppressed = dip and (now - dip) < 4
									if not suppressed and (now - lastHandled) > 4 then
										-- самая низкая точка тела: у регдолла корень врет
										local minY = root.Position.Y
										for _, p in ipairs(char:GetChildren()) do
											if p:IsA("BasePart") and p.Position.Y < minY then
												minY = p.Position.Y
											end
										end
										self.WatchLastY[s.who] = minY
										if minY < self.SsY then
											self.WatchBelow[s.who] = (self.WatchBelow[s.who] or 0) + 1
										else
											self.WatchBelow[s.who] = 0
										end
										-- ниже линии два опроса подряд (0.3с) = реально летит в войд,
										-- а не проскочил кадр. Глубже чем на 15 — без ожиданий
										local belowStreak = self.WatchBelow[s.who] or 0
										if belowStreak >= 2 or minY < (self.SsY - 15) then
											dead = true
										end
									end
								end
							end
						else
							-- персонаж уничтожен (войд его съел): если последний замер
							-- был уже ниже линии — считаем смерть
							if (now - lastHandled) > 4 and (self.WatchLastY[s.who] or 0) ~= 0 and (self.WatchLastY[s.who] or 0) < self.SsY then
								dead = true
							end
							self.WatchBelow[s.who] = 0
						end
						if dead and (now - lastHandled) > 1.5 then
							self:OnDeath(s.who, nil)
							self.WatchBelow[s.who] = 0
						end
					end
					task.wait(0.15)
				end
			end)
		end,
		HookDeaths = function(self)
			local function hookChar(char, who)
				local hum = char:WaitForChild("Humanoid", 5)
				if not hum then return end
				local c = hum.Died:Connect(function()
					self:OnDeath(who, char:FindFirstChild("HumanoidRootPart"))
				end)
				self:ConnectMatch(c)
				self:WatchChar(char, who == "me")
			end
			if player.Character then hookChar(player.Character, "me") end
			self:ConnectMatch(player.CharacterAdded:Connect(function(ch)
				self:BackfillDeath("me")
				hookChar(ch, "me")
			end))
			if self.Opponent then
				if self.Opponent.Character then hookChar(self.Opponent.Character, "opp") end
				self:ConnectMatch(self.Opponent.CharacterAdded:Connect(function(ch)
					self:BackfillDeath("opp")
					hookChar(ch, "opp")
				end))
			end
		end,
		AsSample = function(self)
			local now = tick()
			local sides = {
				{who = "me", char = player.Character, mark = self.OppGrabOnMe, cd = self.AsCdMe, setcd = function(v) self.AsCdMe = v end},
				{who = "opp", char = self.Opponent and self.Opponent.Character, mark = self.MyGrabOnOpp, cd = self.AsCdOpp, setcd = function(v) self.AsCdOpp = v end},
			}
			for _, s in ipairs(sides) do
				local root = s.char and s.char:FindFirstChild("HumanoidRootPart")
				local hum = s.char and s.char:FindFirstChildOfClass("Humanoid")
				if root and hum and not hum.SeatPart then
					local v = root.AssemblyLinearVelocity.Magnitude
					local chaotic = v > 200 or (hum:GetState() == Enum.HumanoidStateType.Freefall and v > 120)
					self.AsSamples[s.who] = chaotic and (self.AsSamples[s.who] + 1) or 0
					if self.AsSamples[s.who] >= 60 and (now - s.mark) <= 5 and (now - s.cd) > 5 then
						s.setcd(now)
						self.AsSamples[s.who] = 0
						self:Award(s.who == "me" and "opp" or "me", "as")
					end
				else
					self.AsSamples[s.who] = 0
				end
			end
		end,
		StartAGwatcher = function(self)
			local c = workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "GrabParts" or self.PvpState ~= "live" then return end
				task.spawn(function()
					local t0 = tick()
					local drag = child:FindFirstChild("DragPart")
					local mine = false
					pcall(function()
						local cam = workspace.CurrentCamera
						if drag and cam and drag:IsA("BasePart") then
							mine = (drag.Position - cam.CFrame.Position).Magnitude < 20
						end
					end)
					local gp = child:WaitForChild("GrabPart", 2)
					local weld = gp and gp:FindFirstChild("WeldConstraint")
					local part = weld and weld.Part1
					local myChar = player.Character
					local opChar = self.Opponent and self.Opponent.Character
					local involves = part and ((myChar and part:IsDescendantOf(myChar)) or (opChar and part:IsDescendantOf(opChar)))
					if not involves then return end
					while child.Parent do task.wait(0.05) end
					if tick() - t0 < 0.5 then
						if mine then self.AgMe = self.AgMe + 1 else self.AgOpp = self.AgOpp + 1 end
						self:Log("АГ (отцеп): " .. (mine and "ты" or "соперник"))
					end
				end)
			end)
			self:ConnectMatch(c)
		end,
		Finish = function(self, winner, byLeave)
			if self.PvpState ~= "live" then return end
			self.PvpState = "finished"
			self.EndTime = tick()
			self:HudFinish(winner)
			self:Log(string.format("МАТЧ ОКОНЧЕН: %s • счёт %d:%d • время %s • АГ ты/он: %d/%d%s",
				winner == "me" and "ТЫ ВЫИГРАЛ" or "ТЫ ПРОИГРАЛ",
				self.ScoreMe, self.ScoreOpp,
				formatTime(self.EndTime - self.StartTime),
				self.AgMe, self.AgOpp,
				byLeave and " • соперник вышел" or ""))
			task.delay(6, function()
				self.PvpState = "idle"
				self:HudHide(true)
				self:ClearMatchConns()
			end)
		end,
		Start = function(self, cfg)
			if self.PvpState == "live" then self:Log("матч уже идёт") return end
			self.PvpState = "live"
			self.Opponent = cfg.opponent
			self.LocationLabel = cfg.locationLabel
			self.TargetScore = cfg.targetScore
			self.CountSS, self.CountAS, self.CountDB = cfg.countSS, cfg.countAS, cfg.countDB
			self.ScoreMe, self.ScoreOpp = 0, 0
			self.StartTime, self.EndTime = tick(), 0
			self.MyGrabOnOpp, self.OppGrabOnMe = -999, -999
			self.RecentKillMe, self.RecentKillOpp = -999, -999
			self.DeathMe, self.DeathOpp = -999, -999
			self.AgMe, self.AgOpp = 0, 0
			self.AsSamples = {me = 0, opp = 0}
			self.AsCdMe, self.AsCdOpp = -999, -999
			self:ClearMatchConns()
			local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local basePos = cfg.teleportPos or (myRoot and myRoot.Position) or Vector3.new(0, 0, 0)
			self:DetectSea(basePos)
			if cfg.teleportPos then
				local currentRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if currentRoot then
					pcall(function()
						currentRoot.CFrame = CFrame.new(cfg.teleportPos + Vector3.new(0, 3, 0))
					end)
				else
					self:Log("телепорт пропущен: нет персонажа")
				end
			end
			self:HookDeaths()
			self:StartDeathWatcher()
			self:StartAGwatcher()
			self:HudBuild()
			local hud = self.Hud
			if hud.me then hud.me.lbl.Text = "0" hud.me.scale.Scale = 1 end
			if hud.opp then hud.opp.lbl.Text = "0" hud.opp.scale.Scale = 1 end
			if hud.loc then hud.loc.Text = self.LocationLabel end
			if hud.nameMe then hud.nameMe.Text = player.DisplayName .. "\n@" .. player.Name end
			if hud.nameOpp and self.Opponent then hud.nameOpp.Text = self.Opponent.DisplayName .. "\n@" .. self.Opponent.Name end
			pcall(function()
				hud.avMe.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			end)
			pcall(function()
				if self.Opponent then
					hud.avOpp.Image = Players:GetUserThumbnailAsync(self.Opponent.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
				end
			end)
			task.spawn(function()
				while self.PvpState == "live" do
					if hud.time then hud.time.Text = formatTime(tick() - self.StartTime) end
					task.wait(0.25)
				end
			end)
			self:Log(string.format("матч начат: против %s • %s • до %d", self.Opponent.Name, self.LocationLabel, self.TargetScore))
			if notify then notify("PVP против".. self.Opponent.Name .."начат") end
		end,
		OnHeartbeat = function(self, dt)
			local hud = self.Hud
			local should = hud and hud.built and (self.PvpState == "live" or self.PvpState == "finished") and not uiOpen
			if should and not hud.shown then hud.shown = true self:HudShow() end
			if not should and hud.shown then hud.shown = false self:HudHide(false) end
			if self.PvpState == "live" then
				self:AsSample()
			end
		end,
		OnDisable = function(self)
			self:ClearMatchConns()
			if self.Hud then self:HudHide(true) end
			self.PvpState = "idle"
		end,
		Build = function(self, u)
			local headerRow = u.Section("PVP Матч")
			-- окно атрибуции килла: смерть соперника в N c после моего граба = мой килл
			u.Slider("Окно килла (сек)", 5, 30, 15, function() end)
			local container = headerRow.Parent
			local cfg = {
				opponent = nil,
				locKey = nil,
				locLabel = "",
				teleportPos = nil,
				targetScore = 5,
				countSS = true, countAS = true, countDB = true,
				ready = false,
			}
			self.Cfg = cfg
			local regRow = u.Row(42)
			local regBtn = UI.button({
				Name = "RegisterBtn", Parent = regRow,
				Size = UDim2.new(1, -24, 1, -10), Position = UDim2.new(0, 12, 0.5, -14),
				BackgroundTransparency = 0.1, Text ="Зарегистрировать PVP", TextSize = 13,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.GothamBold, Corner = 10,
			})
			UI.basicHover(regBtn, 0.1, 0.03, 0.6, 0.08)
			-- резерв порядка: setup-блок всегда сразу после кнопки регистрации, не мешая строкам других модулей
			local setupSlot = u.Row(1)
			setupSlot.Visible = false
			local setupFrame = Instance.new("Frame")
			setupFrame.Name = "Setup"
			setupFrame.Size = UDim2.new(1, 0, 0, 0)
			setupFrame.AutomaticSize = Enum.AutomaticSize.Y
			setupFrame.BackgroundTransparency = 1
			setupFrame.LayoutOrder = setupSlot.LayoutOrder
			setupFrame.Visible = false
			setupFrame.Parent = container
			local setupLayout = Instance.new("UIListLayout")
			setupLayout.Padding = UDim.new(0, 8)
			setupLayout.SortOrder = Enum.SortOrder.LayoutOrder
			setupLayout.Parent = setupFrame
			local function sRow(order, height)
				local r = Instance.new("Frame")
				r.Size = UDim2.new(1, 0, 0, height or 38)
				r.BackgroundColor3 = currentPalette.element
				r.BackgroundTransparency = 0.1
				r.BorderSizePixel = 0
				r.LayoutOrder = order
				r.Parent = setupFrame
				addThemed("element", r)
				UI.corner(r, 14)
				UI.stroke(r, 0.75, 1)
				return r
			end
			local function highlight(btn, on)
				local st = btn:FindFirstChildOfClass("UIStroke")
				if st then st.Transparency = on and 0.1 or 0.7 end
				btn.BackgroundTransparency = on and 0.02 or 0.15
			end
			local oppHeader = sRow(1, 26)
			UI.button({
				Name = "OppHeader", Parent = oppHeader,
				Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
				BackgroundTransparency = 1, Stroke = false,
				Text ="Противник (выбери одного)",
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
				Active = false, ThemeText = "sub", Font = Enum.Font.GothamBold,
			})
			local oppScroll = Instance.new("ScrollingFrame")
			oppScroll.Name = "OppScroll"
			oppScroll.Size = UDim2.new(1, 0, 0, 150)
			oppScroll.BackgroundTransparency = 1
			oppScroll.BorderSizePixel = 0
			oppScroll.ScrollBarThickness = 3
			oppScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
			oppScroll.LayoutOrder = 2
			oppScroll.Parent = setupFrame
			local oppList = Instance.new("Frame")
			oppList.Size = UDim2.new(1, 0, 0, 0)
			oppList.AutomaticSize = Enum.AutomaticSize.Y
			oppList.BackgroundTransparency = 1
			oppList.Parent = oppScroll
			local oppLayout = Instance.new("UIListLayout")
			oppLayout.Padding = UDim.new(0, 4)
			oppLayout.SortOrder = Enum.SortOrder.LayoutOrder
			oppLayout.Parent = oppList
			local oppPad = Instance.new("UIPadding")
			oppPad.PaddingLeft = UDim.new(0, 4)
			oppPad.PaddingRight = UDim.new(0, 4)
			oppPad.PaddingTop = UDim.new(0, 4)
			oppPad.PaddingBottom = UDim.new(0, 4)
			oppPad.Parent = oppScroll
			oppLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				oppScroll.CanvasSize = UDim2.new(0, 0, 0, oppLayout.AbsoluteContentSize.Y + 8)
			end)
			local oppSelBtn = nil
			local function rebuildOpponents()
				for _, c in ipairs(oppList:GetChildren()) do
					if c:IsA("TextButton") then c:Destroy() end
				end
				oppSelBtn = nil
				local i = 0
				for _, plr in ipairs(Players:GetPlayers()) do
					if plr ~= player then
						i = i + 1
						local row = Instance.new("TextButton")
						row.Name = "Opp_" .. plr.Name
						row.Size = UDim2.new(1, 0, 0, 34)
						row.BackgroundColor3 = currentPalette.element
						row.BackgroundTransparency = 0.15
						row.BorderSizePixel = 0
						row.Text = ""
						row.AutoButtonColor = false
						row.LayoutOrder = i
						row.Parent = oppList
						UI.corner(row, 10)
						UI.stroke(row, 0.7, 1)
						local n1 = Instance.new("TextLabel")
						n1.Size = UDim2.new(1, -16, 0, 18)
						n1.Position = UDim2.new(0, 10, 0, 3)
						n1.BackgroundTransparency = 1
						n1.Text = plr.DisplayName
						n1.TextXAlignment = Enum.TextXAlignment.Left
						n1.TextSize = 13
						n1.Font = Enum.Font.GothamBold
						n1.TextColor3 = currentPalette.text
						n1.Parent = row
						local n2 = Instance.new("TextLabel")
						n2.Size = UDim2.new(1, -16, 0, 13)
						n2.Position = UDim2.new(0, 10, 0, 19)
						n2.BackgroundTransparency = 1
						n2.Text = "@" .. plr.Name
						n2.TextXAlignment = Enum.TextXAlignment.Left
						n2.TextSize = 10
						n2.Font = Enum.Font.Gotham
						n2.TextColor3 = currentPalette.sub
						n2.Parent = row
						row.MouseButton1Click:Connect(function()
							cfg.opponent = plr
							cfg.ready = false
							if oppSelBtn then highlight(oppSelBtn, false) end
							oppSelBtn = row
							highlight(row, true)
							playSound("silent")
						end)
					end
				end
			end
			self.RebuildOpponents = rebuildOpponents
			local locHeader = sRow(3, 26)
			UI.button({
				Name = "LocHeader", Parent = locHeader,
				Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
				BackgroundTransparency = 1, Stroke = false,
				Text ="Место матча",
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
				Active = false, ThemeText = "sub", Font = Enum.Font.GothamBold,
			})
			local locRowF = sRow(4, 40)
			local locLayout = Instance.new("UIListLayout")
			locLayout.FillDirection = Enum.FillDirection.Horizontal
			locLayout.Padding = UDim.new(0, 6)
			locLayout.SortOrder = Enum.SortOrder.LayoutOrder
			locLayout.Parent = locRowF
			local locPad = Instance.new("UIPadding")
			locPad.PaddingLeft = UDim.new(0, 8)
			locPad.PaddingRight = UDim.new(0, 8)
			locPad.PaddingTop = UDim.new(0, 6)
			locPad.PaddingBottom = UDim.new(0, 6)
			locPad.Parent = locRowF
			local LOCATIONS = {
				{key = "Beach", label = "Пляж", pos = Vector3.new(-659, -8, -57)},
				{key = "Cliff", label = "Клиф", pos = Vector3.new(355, -8, -473)},
				{key = "SmallCliff", label = "Малый клиф", pos = Vector3.new(386, -8, 335)},
				{key = "Map", label = "Вся карта", pos = Vector3.new(1, -8, 0)},
				{key = "Other", label = "Другое", pos = nil},
			}
			local locSelBtn = nil
			for idx, loc in ipairs(LOCATIONS) do
				local b = UI.button({
					Name = "Loc_" .. loc.key, Parent = locRowF,
					Size = UDim2.new(1 / 5, -6, 1, 0),
					BackgroundTransparency = 0.15, Text = loc.label, TextSize = 11,
					ThemeBackground = "element", ThemeText = "text",
					Font = Enum.Font.Gotham, Corner = 9,
				})
				b.LayoutOrder = idx
				b.MouseButton1Click:Connect(function()
					cfg.locKey = loc.key
					cfg.locLabel = (loc.key == "Other") and "Своё место" or loc.label
					cfg.teleportPos = loc.pos
					cfg.ready = false
					if locSelBtn then highlight(locSelBtn, false) end
					locSelBtn = b
					highlight(b, true)
					playSound("silent")
				end)
			end
			UI.createSlider(setupFrame, {
				Label = "До скольки баллов", Min = 1, Max = 15, Value = 5, Order = 5,
				Callback = function(v)
					cfg.targetScore = math.floor(v + 0.5)
					cfg.ready = false
				end,
			})
			UI.createToggle(setupFrame, "Считать СС (самоубийство)", true, function(s) cfg.countSS = s cfg.ready = false end, 6)
			UI.createToggle(setupFrame, "Считать АС (лаг/флинг)", true, function(s) cfg.countAS = s cfg.ready = false end, 7)
			UI.createToggle(setupFrame, "Считать ДБ (дабл каждому)", true, function(s) cfg.countDB = s cfg.ready = false end, 8)
			local actRow = sRow(9, 42)
			local readyBtn = UI.button({
				Name = "ReadyBtn", Parent = actRow,
				Size = UDim2.new(0.5, -18, 1, -10), Position = UDim2.new(0, 12, 0.5, -14),
				BackgroundTransparency = 0.1, Text ="Готово", TextSize = 13,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.GothamBold, Corner = 10,
			})
			UI.basicHover(readyBtn, 0.1, 0.03, 0.6, 0.08)
			local startBtn = UI.button({
				Name = "StartBtn", Parent = actRow,
				Size = UDim2.new(0.5, -18, 1, -10), Position = UDim2.new(0.5, 6, 0.5, -14),
				BackgroundColor3 = Color3.fromRGB(70, 140, 80), BackgroundTransparency = 0.3,
				Text = "▶ Начать", TextSize = 13,
				ThemeText = "text", Font = Enum.Font.GothamBold, Corner = 10,
			})
			UI.basicHover(startBtn, 0.1, 0.03, 0.6, 0.08)
			readyBtn.MouseButton1Click:Connect(function()
				if not cfg.opponent then
					log("Выбери противника") playSound("silent") return
				end
				if not cfg.locKey then
					log("Выбери место матча") playSound("silent") return
				end
				cfg.ready = true
				startBtn.BackgroundTransparency = 0.05
				playSound("silent")
				log(string.format("Готово: против %s • %s • до %d", cfg.opponent.Name, cfg.locLabel, cfg.targetScore))
			end)
			startBtn.MouseButton1Click:Connect(function()
				if not cfg.ready then
					log("Сначала нажми Готово") playSound("silent") return
				end
				if not cfg.opponent or not Players:FindFirstChild(cfg.opponent.Name) then
					log("Соперник недоступен — выбери другого") cfg.ready = false return
				end
				playSound("silent")
				self:Start({
					opponent = cfg.opponent,
					locationLabel = cfg.locLabel,
					teleportPos = cfg.teleportPos,
					targetScore = cfg.targetScore,
					countSS = cfg.countSS,
					countAS = cfg.countAS,
					countDB = cfg.countDB,
				})
				cfg.ready = false
				startBtn.BackgroundTransparency = 0.3
			end)
			regBtn.MouseButton1Click:Connect(function()
				setupFrame.Visible = not setupFrame.Visible
				if setupFrame.Visible then rebuildOpponents() end
				playSound("silent")
			end)
			Mods.Connect(self, Players.PlayerAdded:Connect(function()
				if setupFrame.Visible then rebuildOpponents() end
			end))
			Mods.Connect(self, Players.PlayerRemoving:Connect(function(pl)
				if cfg.opponent == pl then
					cfg.opponent = nil
					cfg.ready = false
					startBtn.BackgroundTransparency = 0.3
					log("Соперник вышел — выбери другого")
				end
				if setupFrame.Visible then rebuildOpponents() end
			end))
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ESP ХАЙЛАЙТЫ ИГРОКОВ
	-- ============================================================
	Mods.Register({
		Id = "EspHighlight",
		Tab = "ESP",
		Name = "ESP Хайлайты",
		Icon = "",
		Desc = "",
		Defaults = {Fill = 68, Pulse = 22},
		Build = function(self, u)
			u.Section("ESP Хайлайты")
			self._masterToggle = u.Toggle("ESP Хайлайты игроков", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Прозрачность заливки %", 0, 100, self.State.Fill or 68, function(v) self.State.Fill = v end))
			subAdd(self, u.Slider("Скорость пульса", 1, 50, self.State.Pulse or 22, function(v) self.State.Pulse = v end))
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		OnEnable = function(self)
			self.Refs = {}
			local folder = Instance.new("Folder")
			folder.Name = "FosforHighlights"
			folder.Parent = gui
			Mods.Track(self, folder)
			self.Folder = folder
			local function build(plr)
				local old = self.Refs[plr]
				if old and old.hl then pcall(function() old.hl:Destroy() end) end
				local char = plr.Character
				local head = char and char:FindFirstChild("Head")
				if not char or not head then
					self.Refs[plr] = nil
					return
				end
				local hl = Instance.new("Highlight")
				hl.Adornee = char
				hl.FillColor = Mods.Colors.accent
				hl.FillTransparency = (tonumber(self.State.Fill) or 68) / 100
				hl.OutlineColor = Color3.fromRGB(255, 255, 255)
				hl.OutlineTransparency = 0
				hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				hl.Parent = folder
				self.Refs[plr] = {hl = hl, phase = math.random() * 6.28}
			end
			self.Build = build
			for _, plr in ipairs(Players:GetPlayers()) do
				build(plr)
				Mods.Connect(self, plr.CharacterAdded:Connect(function()
					task.wait(0.15)
					if self.Enabled then build(plr) end
				end))
			end
			Mods.Connect(self, Players.PlayerAdded:Connect(function(plr)
				build(plr)
				Mods.Connect(self, plr.CharacterAdded:Connect(function()
					task.wait(0.15)
					if self.Enabled then build(plr) end
				end))
			end))
			Mods.Connect(self, Players.PlayerRemoving:Connect(function(plr)
				local r = self.Refs[plr]
				if r and r.hl then pcall(function() r.hl:Destroy() end) end
				self.Refs[plr] = nil
			end))
			self._acc = 0
		end,
		OnRender = function(self)
			local t = tick()
			local accent = Mods.Colors.accent
			for _, r in pairs(self.Refs) do
				if r.hl and r.hl.Parent then
					local k = (math.sin(t * ((tonumber(self.State.Pulse) or 22) / 10) + r.phase) + 1) / 2
					r.hl.FillColor = Color3.fromRGB(255, 255, 255):Lerp(accent, k)
					r.hl.FillTransparency = (tonumber(self.State.Fill) or 68) / 100
				end
			end
		end,
		OnHeartbeat = function(self, dt)
			self._acc = (self._acc or 0) + dt
			if self._acc < 0.2 then return end
			self._acc = 0
			for _, plr in ipairs(Players:GetPlayers()) do
				local char = plr.Character
				local head = char and char:FindFirstChild("Head")
				if char and head then
					local r = self.Refs[plr]
					if not r or not r.hl or not r.hl.Parent or r.hl.Adornee ~= char then
						self.Build(plr)
					end
				end
			end
		end,
		OnDisable = function(self)
			self.Refs = {}
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ESP ПАНЕЛИ
	-- ============================================================
	Mods.Register({
		Id = "EspPanels",
		Tab = "ESP",
		Name = "ESP Панели",
		Icon = "",
		Desc = "",
		Defaults = {},
		Build = function(self, u)
			u.Section("ESP Панели")
			u.Toggle("ESP Панели игроков", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		ShowCard = function(self, r)
			if not r or not r.card then return end
			r.card.Visible = true
			r.card.GroupTransparency = 1
			r.pop.Scale = 0.9
			Animations.tween(r.card, {GroupTransparency = 0}, 0.25)
			Animations.tween(r.pop, {Scale = 1}, 0.3)
		end,
		HideCard = function(self, r)
			if not r or not r.card then return end
			Animations.tween(r.card, {GroupTransparency = 1}, 0.16)
			Animations.tween(r.pop, {Scale = 0.9}, 0.16)
			local card = r.card
			task.delay(0.17, function()
				if card and card.Parent and not r.shown then
					card.Visible = false
				end
			end)
		end,
		OnEnable = function(self)
			self.Refs = {}
			local function clearPlr(plr)
				local r = self.Refs[plr]
				if r and r.bg then pcall(function() r.bg:Destroy() end) end
				self.Refs[plr] = nil
			end
			self.ClearPlr = clearPlr
			local function build(plr)
				clearPlr(plr)
				if plr == player then return end
				local char = plr.Character
				local head = char and char:FindFirstChild("Head")
				if not char or not head then return end
				local bg = Instance.new("BillboardGui")
				bg.Adornee = head
				bg.Size = UDim2.fromOffset(210, 54)
				bg.StudsOffset = Vector3.new(0, 5.4, 0)
				bg.AlwaysOnTop = true
				bg.Parent = head
				Mods.Track(self, bg)
				local card = Instance.new("CanvasGroup")
				card.Size = UDim2.new(1, 0, 1, 0)
				card.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
				card.BackgroundTransparency = 0.1
				card.BorderSizePixel = 0
				card.GroupTransparency = 1
				card.Visible = false
				card.ClipsDescendants = true
				card.Parent = bg
				UI.corner(card, 16)
				local cst = Instance.new("UIStroke")
				cst.Color = Mods.Colors.accent
				cst.Thickness = 1.4
				cst.Transparency = 0.15
				cst.Parent = card
				local pop = Instance.new("UIScale")
				pop.Scale = 0.9
				pop.Parent = card
				local dscale = Instance.new("UIScale")
				dscale.Name = "DistScale"
				dscale.Parent = card
				local avaRing = Instance.new("Frame")
				avaRing.Size = UDim2.fromOffset(38, 38)
				avaRing.Position = UDim2.new(0, 10, 0.5, -19)
				avaRing.BackgroundColor3 = Mods.Colors.accent
				avaRing.BackgroundTransparency = 0.5
				avaRing.BorderSizePixel = 0
				avaRing.ZIndex = 2
				avaRing.Parent = card
				UI.corner(avaRing, 12)
				local ava = Instance.new("ImageLabel")
				ava.Size = UDim2.new(1, -4, 1, -4)
				ava.Position = UDim2.new(0, 2, 0, 2)
				ava.BackgroundTransparency = 1
				ava.ZIndex = 3
				ava.Parent = avaRing
				UI.corner(ava, 10)
				task.spawn(function()
					pcall(function()
						ava.Image = Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
					end)
				end)
				local name = Instance.new("TextLabel")
				name.Size = UDim2.new(1, -112, 0, 18)
				name.Position = UDim2.new(0, 56, 0, 10)
				name.BackgroundTransparency = 1
				name.Text = plr.DisplayName
				name.Font = Enum.Font.GothamBold
				name.TextSize = 13
				name.TextColor3 = Color3.fromRGB(255, 255, 255)
				name.TextXAlignment = Enum.TextXAlignment.Left
				name.TextTruncate = Enum.TextTruncate.AtEnd
				name.ZIndex = 2
				name.Parent = card
				local user = Instance.new("TextLabel")
				user.Size = UDim2.new(1, -112, 0, 13)
				user.Position = UDim2.new(0, 56, 0, 30)
				user.BackgroundTransparency = 1
				user.Text = "@" .. plr.Name
				user.Font = Enum.Font.Gotham
				user.TextSize = 10
				user.TextColor3 = Color3.fromRGB(180, 170, 205)
				user.TextXAlignment = Enum.TextXAlignment.Left
				user.TextTruncate = Enum.TextTruncate.AtEnd
				user.ZIndex = 2
				user.Parent = card
				local dist = Instance.new("TextLabel")
				dist.Size = UDim2.new(0, 40, 1, 0)
				dist.Position = UDim2.new(1, -56, 0, 0)
				dist.BackgroundTransparency = 1
				dist.Text = "-- m"
				dist.Font = Enum.Font.GothamBold
				dist.TextSize = 14
				dist.TextColor3 = Mods.Colors.accent
				dist.TextXAlignment = Enum.TextXAlignment.Right
				dist.ZIndex = 2
				dist.Parent = card
				local dot = Instance.new("Frame")
				dot.Size = UDim2.fromOffset(6, 6)
				dot.Position = UDim2.new(1, -12, 0.5, -3)
				dot.BackgroundColor3 = Color3.fromRGB(90, 255, 120)
				dot.BorderSizePixel = 0
				dot.ZIndex = 2
				dot.Parent = card
				UI.corner(dot, 3)
				self.Refs[plr] = {
					bg = bg, card = card, pop = pop, dscale = dscale,
					dist = dist, dot = dot, shown = false, stroke = cst, ring = avaRing,
				}
			end
			self.Build = build
			for _, plr in ipairs(Players:GetPlayers()) do
				build(plr)
				Mods.Connect(self, plr.CharacterAdded:Connect(function()
					task.wait(0.15)
					if self.Enabled then build(plr) end
				end))
			end
			Mods.Connect(self, Players.PlayerAdded:Connect(function(plr)
				build(plr)
				Mods.Connect(self, plr.CharacterAdded:Connect(function()
					task.wait(0.15)
					if self.Enabled then build(plr) end
				end))
			end))
			Mods.Connect(self, Players.PlayerRemoving:Connect(function(plr)
				clearPlr(plr)
			end))
			Mods.OnColorChange(function()
				for _, r in pairs(self.Refs) do
					if r.stroke and r.stroke.Parent then r.stroke.Color = Mods.Colors.accent end
					if r.ring and r.ring.Parent then r.ring.BackgroundColor3 = Mods.Colors.accent end
					if r.dist and r.dist.Parent then r.dist.TextColor3 = Mods.Colors.accent end
				end
			end)
			self._acc = 0
		end,
		OnHeartbeat = function(self, dt)
			self._acc = (self._acc or 0) + dt
			if self._acc < 0.12 then return end
			self._acc = 0
			local c = workspace.CurrentCamera
			local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			for plr, r in pairs(self.Refs) do
				if r.bg and r.bg.Parent then
					local char = plr.Character
					local head = char and char:FindFirstChild("Head")
					local root = char and char:FindFirstChild("HumanoidRootPart")
					if head and root and myRoot and c then
						local d = (root.Position - myRoot.Position).Magnitude
						if r.dist then r.dist.Text = math.floor(d) .. " m" end
						if r.dscale then r.dscale.Scale = clamp(50 / math.max(d, 1), 0.45, 1) end
						if r.dot then
							local dotColor
							if d < 60 then dotColor = Color3.fromRGB(90, 255, 120)
							elseif d < 150 then dotColor = Color3.fromRGB(255, 220, 90)
							else dotColor = Color3.fromRGB(255, 90, 90) end
							r.dot.BackgroundColor3 = dotColor
						end
						local sp, on = c:WorldToScreenPoint(head.Position)
						local looking = false
						if on then
							local cx = c.ViewportSize.X / 2
							local cy = c.ViewportSize.Y / 2
							looking = (Vector2.new(sp.X, sp.Y) - Vector2.new(cx, cy)).Magnitude < 300
						end
						local should = looking and d <= 133
						if should and not r.shown then
							r.shown = true
							self:ShowCard(r)
						elseif not should and r.shown then
							r.shown = false
							self:HideCard(r)
						end
					end
				end
			end
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player then
					local char = plr.Character
					local head = char and char:FindFirstChild("Head")
					if char and head then
						local r = self.Refs[plr]
						if not r or not r.bg or not r.bg.Parent or r.bg.Adornee ~= head then
							self.Build(plr)
						end
					end
				end
			end
		end,
		OnDisable = function(self)
			for _, r in pairs(self.Refs) do
				if r.bg then pcall(function() r.bg:Destroy() end) end
			end
			self.Refs = {}
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ПОДСВЕТКА ПРЕДМЕТОВ (тойсы)
	-- ============================================================
	Mods.Register({
		Id = "ItemHighlight",
		Tab = "ESP",
		Name = "Предметы",
		Icon = "",
		Desc = "",
		Defaults = {OnlyMine = false, Fill = 85, Outline = 35},
		Build = function(self, u)
			u.Section("Подсветка предметов")
			self._masterToggle = u.Toggle("Подсветка предметов", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Прозрачность заливки %", 0, 100, self.State.Fill or 85, function(v) self.State.Fill = v end))
			subAdd(self, u.Slider("Прозрачность контура %", 0, 100, self.State.Outline or 35, function(v) self.State.Outline = v end))
			subShow(self, self.Enabled or self._wantEnabled == true)
			subAdd(self, u.Toggle("Только мои предметы", self.State.OnlyMine == true, function(v)
				self.State.OnlyMine = v
			end))
		end,
		OnEnable = function(self)
			self.HLs = {}
			self.Seen = setmetatable({}, {__mode = "k"})
			self._dirty = true
			self._lastRescan = 0
			local folder = Instance.new("Folder")
			folder.Name = "FosforItemHL"
			folder.Parent = gui
			Mods.Track(self, folder)
			self.Folder = folder
			local function countHl()
				local n = 0
				for _ in pairs(self.HLs) do n = n + 1 end
				return n
			end
			local function addHighlight(root, ownerName)
				if not root or self.HLs[root] then return end
				if countHl() >= 35 then return end
				local ok, hl = pcall(function()
					local h = Instance.new("Highlight")
					h.FillColor = Color3.fromRGB(255, 255, 255)
					h.FillTransparency = (tonumber(self.State.Fill) or 85) / 100
					h.OutlineColor = Color3.fromRGB(255, 255, 255)
					h.OutlineTransparency = (tonumber(self.State.Outline) or 35) / 100
					h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					h.Adornee = root
					h.Parent = folder
					return h
				end)
				if ok and hl then
					self.HLs[root] = {hl = hl, phase = math.random() * 6.28}
				end
			end
			self.AddHighlight = addHighlight
			local function rescan()
				pcall(function()
					local chars = Lib.charsSet()
					if not chars then return end
					local roots = {}
					local order = {}
					local ownerCache = {}
					for _, d in ipairs(workspace:GetDescendants()) do
						if d and d.Parent and d:IsA("BasePart") and not d.Anchored and d.Transparency < 1 then
							local nm = d.Name or ""
							if nm ~= "Baseplate" and nm ~= "Water" and nm ~= "Terrain" then
								if not Lib.inAnyCharacter(d, chars) then
									local sx = d.Size.X
									local sy = d.Size.Y
									local sz = d.Size.Z
									local vol = sx * sy * sz
									if vol > 0.05 and vol < 20000 then
										local root = Lib.cheapRootOf(d, chars)
										if root and not roots[root] then
											roots[root] = true
											table.insert(order, root)
											if #order >= 60 then break end
										end
									end
								end
							end
						end
					end
					local valid = {}
					for _, root in ipairs(order) do
						if root.Parent then
							local hasOwner, ownerName = false, nil
							local ownerKey = root
							if ownerCache[ownerKey] ~= nil then
								hasOwner, ownerName = ownerCache[ownerKey][1], ownerCache[ownerKey][2]
							else
								pcall(function()
									local marker = root:FindFirstChild("PartOwner", true)
									if marker and type(marker.Value) == "string" and marker.Value ~= "" then
										hasOwner = true
										ownerName = marker.Value
									end
								end)
								ownerCache[ownerKey] = {hasOwner, ownerName}
							end
							local ownerOk = hasOwner and (Players:FindFirstChild(ownerName) ~= nil)
							local toyOk = Lib.TOY_SET[root.Name] or Lib.TOY_LOWER[string.lower(root.Name or "")]
							local pass = false
							if ownerOk then
								pass = (not self.State.OnlyMine) or (ownerName == player.Name or ownerName == player.DisplayName)
							elseif toyOk then
								pass = not self.State.OnlyMine
							end
							if pass then
								valid[root] = true
								if not self.HLs[root] then addHighlight(root, ownerName) end
							end
						end
					end
					for root, data in pairs(self.HLs) do
						if not valid[root] or not root.Parent then
							pcall(function() data.hl:Destroy() end)
							self.HLs[root] = nil
						end
					end
					self._ownerCache = ownerCache
					self._dirty = false
					self._lastRescan = tick()
				end)
			end
			self.Rescan = rescan
			rescan()
			Mods.Connect(self, workspace.DescendantAdded:Connect(function(d)
				if not self.Enabled then return end
				if self.Seen[d] then return end
				self.Seen[d] = true
				self._dirty = true
				if Lib.TOY_SET[d.Name] then
					task.delay(0.25, function()
						if not self.Enabled then return end
						local chars = Lib.charsSet()
						if Lib.inAnyCharacter(d, chars) then return end
						local root = Lib.cheapRootOf(d, chars)
						if root then addHighlight(root, nil) end
					end)
				end
				if d.Name == "PartOwner" then
					task.spawn(function()
						local v = d.Value
						if v == "" then task.wait(0.2) v = d.Value end
						if type(v) ~= "string" or v == "" then return end
						if not self.Enabled then return end
						if self.State.OnlyMine and v ~= player.Name and v ~= player.DisplayName then return end
						if not Players:FindFirstChild(v) then return end
						if not d.Parent then return end
						local chars = Lib.charsSet()
						if Lib.inAnyCharacter(d, chars) then return end
						local root = Lib.cheapRootOf(d, chars)
						if root then addHighlight(root, v) end
					end)
				end
			end))
			Mods.Connect(self, workspace.DescendantRemoving:Connect(function(d)
				if not self.Enabled then return end
				local hl = self.HLs and self.HLs[d]
				if hl then
					pcall(function() hl.hl:Destroy() end)
					self.HLs[d] = nil
				end
			end))
			self._acc = 0
		end,
		OnHeartbeat = function(self, dt)
			self._acc = (self._acc or 0) + dt
			if self._acc < 8 then return end
			self._acc = 0
			if not self._dirty then
				local valid = true
				for root, data in pairs(self.HLs) do
					if not root.Parent then
						pcall(function() data.hl:Destroy() end)
						self.HLs[root] = nil
						valid = false
					end
				end
				if not valid then self._dirty = true end
			end
			if self._dirty and self.Rescan then
				self.Rescan()
			end
		end,
		OnRender = function(self)
			local t = tick()
			for _, data in pairs(self.HLs) do
				if data.hl and data.hl.Parent then
					local k = (math.sin(t * 3 + data.phase) + 1) / 2
					data.hl.FillTransparency = ((tonumber(self.State.Fill) or 85) / 100) - k * 0.25
					data.hl.OutlineTransparency = ((tonumber(self.State.Outline) or 35) / 100) - k * 0.3
				end
			end
		end,
		OnDisable = function(self)
			self.HLs = {}
			self.Seen = nil
			self._ownerCache = nil
			self._dirty = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: СТРЕЛКИ У НОГ (две части: задняя непрозрачная чуть шире, передняя полупрозрачная)
	-- ============================================================
	Mods.Register({
		Id = "FootArrows",
		Tab = "ESP",
		Name = "Стрелки у ног",
		Icon = "",
		Desc = "",
		Defaults = {SelfArrow = true},
		Build = function(self, u)
			u.Section("Стрелки у ног")
			self._masterToggle = u.Toggle("Стрелки у ног", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("И на других игроках", self.State.SelfArrow ~= false, function(v)
				self.State.SelfArrow = v
			end))
		end,
		OnEnable = function(self)
			self.Arrows = {}
			-- ===== НАСТРОЙКИ СТРЕЛКИ =====
			local FRONT_W  = 0.42        -- длина передней планки (прозрачная, как раньше)
			local FRONT_T  = 0.17        -- толщина передней
			local BACK_W   = 0.42        -- задняя той же ширины, что и передняя
			local BACK_T   = 0.17        -- задняя той же толщины, что и передняя
			local X_L, X_R = 0.30, 0.70  -- разлёт полок
			local Y_FRONT  = 0.62        -- ряд передней пары (как был)
			local Y_BACK   = 0.36        -- ряд задней пары (немного позади)
			local DROP   = 2.5           -- ниже к земле
			local FWD    = 1.8           -- вперёд по ходу
			local YAW_EXTRA = math.rad(90)
			local function makeArrow()
				local holder = Instance.new("Part")
				holder.Name = "FosforArrow"
				holder.Anchored = true
				holder.CanCollide = false
				holder.CanTouch = false
				holder.CanQuery = false
				holder.Transparency = 1
				holder.Size = Vector3.new(2.4, 0.1, 2.4)
				holder.Parent = workspace
				Mods.Track(self, holder)
				local sg = Instance.new("SurfaceGui")
				sg.Name = "ArrowGui"
				sg.Face = Enum.NormalId.Top
				sg.AlwaysOnTop = true
				sg.Brightness = 2
				sg.LightInfluence = 0
				sg.Enabled = false
				sg.Parent = holder
				local bars = {}
				local function makeBar(sizeW, sizeT, posX, posY, rot, trans)
					local f = Instance.new("Frame")
					f.Size = UDim2.new(sizeW, 0, sizeT, 0)
					f.Position = UDim2.new(posX, 0, posY, 0)
					f.AnchorPoint = Vector2.new(0.5, 0.5)
					f.BackgroundColor3 = Mods.Colors.accent
					f.BackgroundTransparency = trans or 0
					f.BorderSizePixel = 0
					f.Rotation = rot
					f.Parent = sg
					local c = Instance.new("UICorner")
					c.CornerRadius = UDim.new(1, 0)
					c.Parent = f
					table.insert(bars, f)
					return f
				end
				-- задняя пара: чуть шире, непрозрачная
				makeBar(BACK_W,  BACK_T,  X_L, Y_BACK,  45, 0)
				makeBar(BACK_W,  BACK_T,  X_R, Y_BACK, -45, 0)
				-- передняя пара: как было — чуть прозрачная, чуть уже
				makeBar(FRONT_W, FRONT_T, X_L, Y_FRONT,  45, 0.45)
				makeBar(FRONT_W, FRONT_T, X_R, Y_FRONT, -45, 0.45)
				return {holder = holder, sg = sg, bars = bars}
			end
			self.MakeArrow = makeArrow
			self.Drop = DROP
			self.Fwd = FWD
			self.YawExtra = YAW_EXTRA
			Mods.OnColorChange(function()
				for _, a in pairs(self.Arrows) do
					for _, bar in ipairs(a.bars) do
						if bar.Parent then bar.BackgroundColor3 = Mods.Colors.accent end
					end
				end
			end)
			Mods.Connect(self, Players.PlayerRemoving:Connect(function(plr)
				local a = self.Arrows[plr]
				if a then
					pcall(function() a.holder:Destroy() end)
					self.Arrows[plr] = nil
				end
			end))
		end,
		OnRender = function(self)
			for _, plr in ipairs(Players:GetPlayers()) do
				local want = (plr == player) or (self.State.SelfArrow ~= false)
				local root = want and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") or nil
				local a = self.Arrows[plr]
				if root then
					if not a then
						a = self.MakeArrow()
						self.Arrows[plr] = a
					end
					local look = root.CFrame.LookVector
					local flat = Vector3.new(look.X, 0, look.Z)
					if flat.Magnitude < 0.1 then
						flat = Vector3.new(0, 0, -1)
					else
						flat = flat.Unit
					end
					local pos = root.Position - Vector3.new(0, self.Drop or 2.5, 0) + flat * (self.Fwd or 1.8)
					local yaw = math.atan2(-flat.X, -flat.Z) + (self.YawExtra or math.rad(90))
					a.holder.CFrame = CFrame.new(pos) * CFrame.Angles(0, yaw, 0)
					a.sg.Enabled = true
				else
					if a then a.sg.Enabled = false end
				end
			end
		end,
		OnDisable = function(self)
			self.Arrows = {}
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: TARGET РАМКА (новая, на торсе)
	-- ============================================================
	Mods.Register({
		Id = "TargetFrame",
		Tab = "Target",
		Name = "Target Рамка",
		Icon = "",
		Desc = "",
		Defaults = {Size = 110, FadeStart = 70, FadeEnd = 100, RotSpeed = 40},
		FADE_IN = 0.20,
		FADE_OUT = 0.25,
		Build = function(self, u)
			u.Section("Target рамка (игрок)")
			self._masterToggle = u.Toggle("Target рамка на игрока", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Скорость вращения", 0, 120, self.State.RotSpeed or 40, function(v) self.State.RotSpeed = v end))
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		OnEnable = function(self)
			self.Frame = nil
			self.Target = nil
			local bg = Instance.new("BillboardGui")
			bg.Name = "FosforTarget"
			bg.Size = UDim2.fromOffset(400, 400)
			bg.AlwaysOnTop = true
			bg.Enabled = false
			bg.LightInfluence = 0
			bg.Brightness = 1
			bg.Parent = gui
			Mods.Track(self, bg)
			local spinner = Instance.new("Frame")
			spinner.AnchorPoint = Vector2.new(0.5, 0.5)
			spinner.Position = UDim2.new(0.5, 0, 0.5, 0)
			spinner.Size = UDim2.fromOffset(140, 140)
			spinner.BackgroundTransparency = 1
			spinner.Parent = bg
			local scaleU = Instance.new("UIScale")
			scaleU.Scale = 1
			scaleU.Parent = spinner
			local pieces = {}
			local CORNER, THICK = 52, 12
			local function addBar(cf, bSize, bPos)
				local b = Instance.new("Frame")
				b.Size = bSize
				b.Position = bPos
				b.BackgroundColor3 = Mods.Colors.soft
				b.BorderSizePixel = 0
				b.Parent = cf
				UI.corner(b, 5)
				local s = Instance.new("UIStroke")
				s.Color = Mods.Colors.soft
				s.Thickness = 1.5
				s.Transparency = 0.45
				s.Parent = b
				table.insert(pieces, {bar = b, stroke = s})
			end
			local function mk(kind)
				local c = Instance.new("Frame")
				c.Size = UDim2.fromOffset(CORNER, CORNER)
				c.BackgroundTransparency = 1
				local isTop = (kind == "TL" or kind == "TR")
				local isLeft = (kind == "TL" or kind == "BL")
				if kind == "TL" then c.Position = UDim2.new(0, 0, 0, 0)
				elseif kind == "TR" then c.Position = UDim2.new(1, -CORNER, 0, 0)
				elseif kind == "BL" then c.Position = UDim2.new(0, 0, 1, -CORNER)
				else c.Position = UDim2.new(1, -CORNER, 1, -CORNER) end
				c.Parent = spinner
				addBar(c, UDim2.fromOffset(CORNER, THICK), isTop and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 0, 1, -THICK))
				addBar(c, UDim2.fromOffset(THICK, CORNER), isLeft and UDim2.new(0, 0, 0, 0) or UDim2.new(1, -THICK, 0, 0))
			end
			mk("TL") mk("TR") mk("BL") mk("BR")
			self.Frame = {gui = bg, spinner = spinner, scaleU = scaleU, pieces = pieces, rot = 0, alpha = 0}
		end,
		OnRender = function(self, dt)
			local f = self.Frame
			if not f then return end
			local c = workspace.CurrentCamera
			if not c then return end
			dt = dt or 0.016
			local st = self.State
			local size = tonumber(st.Size) or 110
			local fs = tonumber(st.FadeStart) or 70
			local fe = tonumber(st.FadeEnd) or 100
			local rotSpeed = tonumber(st.RotSpeed) or 40
			if fs >= fe then fs = fe - 1 end
			local span = math.max(1, fe - fs)
			local targetAlpha = 0
			local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local best, bestOff = nil, math.huge
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player then
					local char = plr.Character
					local root = char and char:FindFirstChild("HumanoidRootPart")
					local head = char and char:FindFirstChild("Head")
					if root and head and myRoot then
						local d = (root.Position - myRoot.Position).Magnitude
						if d <= fe + 15 then
							local sp, on = c:WorldToScreenPoint(head.Position)
							if on then
								local cx = c.ViewportSize.X / 2
								local cy = c.ViewportSize.Y / 2
								local off = (Vector2.new(sp.X, sp.Y) - Vector2.new(cx, cy)).Magnitude
								if off < 240 and off < bestOff then
									bestOff = off
									best = plr
								end
							end
						end
					end
				end
			end
			local root = best and best.Character and best.Character:FindFirstChild("HumanoidRootPart") or nil
			if root then
				local d2 = (root.Position - c.CFrame.Position).Magnitude
				local distAlpha = 1 - clamp((d2 - fs) / span, 0, 1)
				if distAlpha > 0.02 then
					targetAlpha = distAlpha
					if self.Target ~= best or f.gui.Adornee ~= root then
						self.Target = best
						f.gui.Adornee = root
					end
					self._lastDist = d2
				end
			end
			local dur = (targetAlpha > f.alpha) and self.FADE_IN or self.FADE_OUT
			dur = math.max(0.01, dur)
			local step = dt / dur
			local diff = targetAlpha - f.alpha
			if math.abs(diff) <= step then f.alpha = targetAlpha
			else f.alpha = f.alpha + math.sign(diff) * step end
			if f.alpha <= 0.01 then
				f.gui.Enabled = false
				self.Target = nil
				return
			end
			f.gui.Enabled = true
			f.rot = f.rot + rotSpeed * dt
			f.spinner.Rotation = f.rot
			f.scaleU.Scale = size / 140
			local t = tick()
			local k = ((math.sin(t * 1.3) + 1) / 2) ^ 3
			local col = Mods.Colors.soft:Lerp(Color3.fromRGB(255, 255, 255), k * 0.9)
			local a = f.alpha
			for _, piece in ipairs(f.pieces) do
				piece.bar.BackgroundColor3 = col
				piece.bar.BackgroundTransparency = 1 - a
				piece.stroke.Color = col
				piece.stroke.Transparency = 1 - a * 0.55
			end
		end,
		OnDisable = function(self)
			self.Frame = nil
			self.Target = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ТАРГЕТ НА ПРЕДМЕТ (в руке)
	-- ============================================================
	Mods.Register({
		Id = "ItemTarget",
		Tab = "Target",
		Name = "Таргет на предмет",
		Icon = "",
		Desc = "",
		FADE_IN = 0.18,
		FADE_OUT = 0.22,
		Defaults = {Size = 110, FadeStart = 70, FadeEnd = 100, RotSpeed = 30},
		Build = function(self, u)
			u.Section("Target рамка (предмет)")
			self._masterToggle = u.Toggle("Target рамка на предмет", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Скорость вращения", 0, 120, self.State.RotSpeed or 30, function(v) self.State.RotSpeed = v end))
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		OnEnable = function(self)
			self.Held = nil
			local bg = Instance.new("BillboardGui")
			bg.Name = "FosforItemTarget"
			bg.Size = UDim2.fromOffset(400, 400)
			bg.AlwaysOnTop = true
			bg.Enabled = false
			bg.LightInfluence = 0
			bg.Brightness = 1
			bg.Parent = gui
			Mods.Track(self, bg)
			local spinner = Instance.new("Frame")
			spinner.AnchorPoint = Vector2.new(0.5, 0.5)
			spinner.Position = UDim2.new(0.5, 0, 0.5, 0)
			spinner.Size = UDim2.fromOffset(140, 140)
			spinner.BackgroundTransparency = 1
			spinner.Parent = bg
			local scaleU = Instance.new("UIScale")
			scaleU.Scale = 0.8
			scaleU.Parent = spinner
			local pieces = {}
			local CORNER, THICK = 52, 12
			local function addBar(cf, bSize, bPos)
				local b = Instance.new("Frame")
				b.Size = bSize
				b.Position = bPos
				b.BackgroundColor3 = Mods.Colors.soft
				b.BorderSizePixel = 0
				b.Parent = cf
				UI.corner(b, 5)
				local s = Instance.new("UIStroke")
				s.Color = Mods.Colors.soft
				s.Thickness = 1.5
				s.Transparency = 0.45
				s.Parent = b
				table.insert(pieces, {bar = b, stroke = s})
			end
			local function mk(kind)
				local c = Instance.new("Frame")
				c.Size = UDim2.fromOffset(CORNER, CORNER)
				c.BackgroundTransparency = 1
				local isTop = (kind == "TL" or kind == "TR")
				local isLeft = (kind == "TL" or kind == "BL")
				if kind == "TL" then c.Position = UDim2.new(0, 0, 0, 0)
				elseif kind == "TR" then c.Position = UDim2.new(1, -CORNER, 0, 0)
				elseif kind == "BL" then c.Position = UDim2.new(0, 0, 1, -CORNER)
				else c.Position = UDim2.new(1, -CORNER, 1, -CORNER) end
				c.Parent = spinner
				addBar(c, UDim2.fromOffset(CORNER, THICK), isTop and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 0, 1, -THICK))
				addBar(c, UDim2.fromOffset(THICK, CORNER), isLeft and UDim2.new(0, 0, 0, 0) or UDim2.new(1, -THICK, 0, 0))
			end
			mk("TL") mk("TR") mk("BL") mk("BR")
			self.Frame = {gui = bg, spinner = spinner, scaleU = scaleU, pieces = pieces, rot = 0, alpha = 0}
		end,
		FindHeld = function(self)
			local chars = Lib.charsSet()
			local c = workspace.CurrentCamera
			if not c then return nil end
			local held = nil
			pcall(function()
				for _, child in ipairs(workspace:GetChildren()) do
					if child.Name == "GrabParts" then
						local drag = child:FindFirstChild("DragPart")
						if drag and drag:IsA("BasePart") and (drag.Position - c.CFrame.Position).Magnitude < 32 then
							local gp = child:FindFirstChild("GrabPart")
							local weld = gp and gp:FindFirstChildOfClass("WeldConstraint")
							if weld then
								local candidates = {weld.Part1, weld.Part0}
								for _, part in ipairs(candidates) do
									if part and part ~= drag and not Lib.inAnyCharacter(part, chars) then
										held = Lib.cheapRootOf(part, chars) or part
										break
									end
								end
							end
							if held then break end
						end
					end
				end
			end)
			return held
		end,
		OnRender = function(self, dt)
			local f = self.Frame
			if not f then return end
			dt = dt or 0.016
			local held = self:FindHeld()
			local targetAlpha = 0
			if held and held.Parent then
				targetAlpha = 1
				if self.Held ~= held then
					self.Held = held
					f.gui.Adornee = held
				end
			end
			local dur = (targetAlpha > f.alpha) and self.FADE_IN or self.FADE_OUT
			dur = math.max(0.01, dur)
			local step = dt / dur
			local diff = targetAlpha - f.alpha
			if math.abs(diff) <= step then f.alpha = targetAlpha
			else f.alpha = f.alpha + math.sign(diff) * step end
			if f.alpha <= 0.01 then
				f.gui.Enabled = false
				self.Held = nil
				return
			end
			f.gui.Enabled = true
			f.rot = f.rot + (tonumber(self.State.RotSpeed) or 30) * dt
			f.spinner.Rotation = f.rot
			local t = tick()
			local k = ((math.sin(t * 1.6) + 1) / 2) ^ 3
			local col = Mods.Colors.soft:Lerp(Color3.fromRGB(255, 255, 255), k * 0.9)
			local a = f.alpha
			for _, piece in ipairs(f.pieces) do
				piece.bar.BackgroundColor3 = col
				piece.bar.BackgroundTransparency = 1 - a
				piece.stroke.Color = col
				piece.stroke.Transparency = 1 - a * 0.55
			end
		end,
		OnDisable = function(self)
			self.Frame = nil
			self.Held = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: КАСТОМНЫЙ ТРЕЙЛ (Player)
	-- ============================================================
	Mods.Register({
		Id = "CustomTrail",
		Tab = "Visual",
		Name = "Трейл",
		Icon = "",
		Desc = "",
		Defaults = {Width = 100, Life = 80, Transp = 0, Rainbow = false, ThemeColor = true, R = 168, G = 85, B = 247},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Трейл", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Ширина %", 10, 300, self.State.Width or 100, function(v) self.State.Width = v end))
			subAdd(self, u.Slider("Время жизни %", 20, 300, self.State.Life or 80, function(v) self.State.Life = v end))
			subAdd(self, u.Slider("Прозрачность %", 0, 90, self.State.Transp or 0, function(v) self.State.Transp = v end))
			subAdd(self, u.Toggle("Радуга", self.State.Rainbow == true, function(v) self.State.Rainbow = v end))
			subAdd(self, u.Toggle("Цвет из темы", self.State.ThemeColor ~= false, function(v) self.State.ThemeColor = v end))
			subAdd(self, u.Slider("R красный", 0, 255, self.State.R or 168, function(v) self.State.R = math.floor(v + 0.5) end))
			subAdd(self, u.Slider("G зелёный", 0, 255, self.State.G or 85, function(v) self.State.G = math.floor(v + 0.5) end))
			subAdd(self, u.Slider("B синий", 0, 255, self.State.B or 247, function(v) self.State.B = math.floor(v + 0.5) end))
		end,
		Attach = function(self, char)
			self:Detach()
			local root = char and char:FindFirstChild("HumanoidRootPart")
			if not root then return end
			local att0 = Instance.new("Attachment")
			att0.Name = "FosforTrailAtt0"
			att0.Position = Vector3.new(0.9, 0, 0)
			att0.Parent = root
			Mods.Track(self, att0)
			local att1 = Instance.new("Attachment")
			att1.Name = "FosforTrailAtt1"
			att1.Position = Vector3.new(-0.9, 0, 0)
			att1.Parent = root
			Mods.Track(self, att1)
			local tr = Instance.new("Trail")
			tr.Name = "FosforTrail"
			tr.Attachment0 = att0
			tr.Attachment1 = att1
			tr.Color = ColorSequence.new(Mods.Colors.accent, Mods.Colors.accent2)
			tr.WidthScale = NumberSequence.new(1, 0)
			tr.Lifetime = 0.8
			tr.Transparency = NumberSequence.new(0, 1)
			tr.LightEmission = 0.4
			tr.Parent = root
			Mods.Track(self, tr)
			self.Trail = tr
		end,
		Detach = function(self)
			self.Trail = nil
		end,
		OnEnable = function(self)
			self:Attach(player.Character)
			Mods.Connect(self, player.CharacterAdded:Connect(function(char)
				task.wait(0.2)
				if self.Enabled then self:Attach(char) end
			end))
		end,
		OnRender = function(self)
			local tr = self.Trail
			if not tr or not tr.Parent then return end
			local w = (tonumber(self.State.Width) or 100) / 100
			tr.WidthScale = NumberSequence.new(w, 0)
			tr.Lifetime = (tonumber(self.State.Life) or 80) / 100
			local tp = (tonumber(self.State.Transp) or 0) / 100
			tr.Transparency = NumberSequence.new(tp, 1)
			local c1, c2
			if self.State.Rainbow then
				local h = (tick() * 0.2) % 1
				c1 = Color3.fromHSV(h, 0.8, 1)
				c2 = Color3.fromHSV((h + 0.15) % 1, 0.8, 1)
			elseif self.State.ThemeColor then
				c1 = Mods.Colors.accent
				c2 = Mods.Colors.accent2
			else
				local base = Color3.fromRGB(tonumber(self.State.R) or 168, tonumber(self.State.G) or 85, tonumber(self.State.B) or 247)
				c1 = base
				c2 = base:Lerp(Color3.fromRGB(255, 255, 255), 0.45)
			end
			tr.Color = ColorSequence.new(c1, c2)
		end,
		OnDisable = function(self)
			self:Detach()
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: RGB ПАЛЕТКА (Misc)
	-- ============================================================
	Mods.Register({
		Id = "RgbPallet",
		Tab = "Visual",
		Name = "RGB Палетка",
		Icon = "",
		Desc = "",
		Defaults = {Speed = 40},
		Build = function(self, u)
			-- управление RGB-палеткой перенесено в под-настройки "Текстура на палетках")
		end,
		OnEnable = function(self)
			self.Pallets = {}
			self.Saved = {}
			local pallets = Lib.collectPalletPartsTop()
			for root, parts in pairs(pallets) do
				for _, p in ipairs(parts) do
					if not self.Saved[p] then
						self.Saved[p] = p.Color
					end
				end
				self.Pallets[root] = parts
			end
			self._acc = 0
			self._hue = 0
			self._cacc = 0
		end,
		OnHeartbeat = function(self, dt)
			self._acc = (self._acc or 0) + dt
			if self._acc >= 8 then
				self._acc = 0
				local pallets = Lib.collectPalletPartsTop()
				for root, parts in pairs(pallets) do
					if not self.Pallets[root] then
						for _, p in ipairs(parts) do
							if not self.Saved[p] then self.Saved[p] = p.Color end
						end
						self.Pallets[root] = parts
					end
				end
				for root in pairs(self.Pallets) do
					if not root or not root.Parent then self.Pallets[root] = nil end
				end
			end
			self._cacc = (self._cacc or 0) + dt
			if self._cacc < 0.033 then return end
			local step = self._cacc
			self._cacc = 0
			local speed = tonumber(self.State.Speed) or 40
			self._hue = (self._hue + step * (speed / 100)) % 1
			local col = Color3.fromHSV(self._hue, 1, 1)
			for _, parts in pairs(self.Pallets) do
				for _, p in ipairs(parts) do
					if p.Parent then p.Color = col end
				end
			end
		end,
		OnDisable = function(self)
			for p, col in pairs(self.Saved) do
				if p and p.Parent then pcall(function() p.Color = col end) end
			end
			self.Saved = {}
			self.Pallets = {}
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ТЕКСТУРА ПАЛЕТКИ (Misc)
	-- ============================================================
	Mods.Register({
		Id = "PalletTexture",
		Tab = "Visual",
		Name = "Текстура палетки",
		Icon = "",
		Desc = "",
		Defaults = {},
		-- Набор реальных текстур из каталога Roblox. Цифры — публичные rbxassetid.
		TextureLibrary = {
			{Name = "Дерево",          Url = "rbxassetid://10747350564", Tile = 8},
			{Name = "Дерево светлое",  Url = "rbxassetid://10747353930",     Tile = 8},
			{Name = "Кирпич",          Url = "rbxassetid://10747350056",     Tile = 6},
			{Name = "Кирпич красный",  Url = "rbxassetid://10747349607",     Tile = 6},
			{Name = "Бетон",           Url = "rbxassetid://10747349237",     Tile = 4},
			{Name = "Металл",          Url = "rbxassetid://10747349752",     Tile = 4},
			{Name = "Металл сетка",    Url = "rbxassetid://10747350377",     Tile = 4},
			{Name = "Мрамор",          Url = "rbxassetid://10747350791",     Tile = 6},
			{Name = "Гранит",          Url = "rbxassetid://10747351446",     Tile = 6},
			{Name = "Трава",           Url = "rbxassetid://10747351667",     Tile = 6},
			{Name = "Песок",           Url = "rbxassetid://10747351595",     Tile = 8},
			{Name = "Земля",           Url = "rbxassetid://10747350277",     Tile = 8},
			{Name = "Лёд",             Url = "rbxassetid://10747350318",     Tile = 6},
			{Name = "Лава",            Url = "rbxassetid://10747350304",     Tile = 6},
			{Name = "Неон синий",      Url = "rbxassetid://10747350626",     Tile = 4},
			{Name = "Неон розовый",    Url = "rbxassetid://10747350517",     Tile = 4},
		},
		ApplyTex = function(self, url, tile)
			local pallets = Lib.collectPalletPartsTop()
			tile = tile or 4
			for _, parts in pairs(pallets) do
				for _, p in ipairs(parts) do
					if p.Parent then
						local existing = p:FindFirstChild("FosforPalletTexture")
						if existing then pcall(function() existing:Destroy() end) end
						local ok, tex = pcall(function()
							local t = Instance.new("Texture")
							t.Name = "FosforPalletTexture"
							t.Texture = url
							t.Face = Enum.NormalId.Top
							t.StudsPerTileU = tile
							t.StudsPerTileV = tile
							t.Parent = p
							return t
						end)
						if ok and tex then Mods.Track(self, tex) end
					end
				end
			end
		end,
		ClearTex = function(self)
			pcall(function()
				for _, d in ipairs(workspace:GetDescendants()) do
					if d.Name == "FosforPalletTexture" then d:Destroy() end
				end
			end)
		end,
		Build = function(self, u)
			self._masterToggle = u.Toggle("Текстура на палетках", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			local rgb = Mods.Get("RgbPallet")
			subAdd(self, u.Toggle("RGB Палетка (перелив цвета)", rgb and (rgb.Enabled or rgb._wantEnabled == true) or false, function(v)
				if rgb then
					if v then Mods.Enable(rgb) else Mods.Disable(rgb) end
				end
			end))
			subAdd(self, u.Slider("Скорость RGB %", 5, 150, rgb and (rgb.State.Speed or 40) or 40, function(v)
				if rgb then
					rgb.State.Speed = v
					pcall(function() setFeature("FosforMod_RgbPallet", { enabled = rgb.Enabled, state = rgb.State }) end)
				end
			end))
			-- материал палеток из Roblox на выбор (с превью)
			local MATERIALS = { "SmoothPlastic", "Plastic", "Wood", "WoodPlanks", "Metal", "DiamondPlate", "Foil", "Neon", "Glass", "Marble", "Slate", "Concrete", "Granite", "Brick", "Ice", "Snow" }
			u.Button("Материал палеток (превью)", function()
				openSidePanel("Материал палеток", function(content)
			local matRow = UI.row(content, 1, 116)
			local matCaption = Instance.new("TextLabel")
			matCaption.Size = UDim2.new(1, -140, 0, 18)
			matCaption.Position = UDim2.new(0, 14, 0, 4)
			matCaption.BackgroundTransparency = 1
			matCaption.Text = "Материал палеток:"
			matCaption.TextColor3 = currentPalette.text
			matCaption.Font = Enum.Font.Gotham
			matCaption.TextSize = 13
			matCaption.TextXAlignment = Enum.TextXAlignment.Left
			matCaption.Parent = matRow
			addThemed("text", matCaption)
			local vp = Instance.new("ViewportFrame")
			vp.Size = UDim2.fromOffset(84, 84)
			vp.Position = UDim2.new(0, 16, 0, 26)
			vp.BackgroundColor3 = currentPalette.bg
			vp.BackgroundTransparency = 0.1
			vp.BorderSizePixel = 0
			vp.Parent = matRow
			UI.corner(vp, 10)
			UI.stroke(vp, 0.6, 1)
			local pcam = Instance.new("Camera")
			pcam.CFrame = CFrame.new(Vector3.new(5, 4, 7), Vector3.new(0, 0, 0))
			pcam.Parent = vp
			vp.CurrentCamera = pcam
			local pvPart = Instance.new("Part")
			pvPart.Anchored = true
			pvPart.Size = Vector3.new(4, 1, 3)
			pvPart.Color = Color3.fromRGB(196, 152, 102)
			pvPart.Parent = vp
			local matLabel = Instance.new("TextLabel")
			matLabel.Size = UDim2.new(0, 130, 0, 26)
			matLabel.Position = UDim2.new(0, 112, 0, 10)
			matLabel.BackgroundTransparency = 1
			matLabel.Text = "SmoothPlastic"
			matLabel.TextColor3 = currentPalette.text
			matLabel.Font = Enum.Font.Gotham
			matLabel.TextSize = 14
			matLabel.TextXAlignment = Enum.TextXAlignment.Left
			matLabel.Parent = matRow
			addThemed("text", matLabel)
			local matHint = Instance.new("TextLabel")
			matHint.Size = UDim2.new(0, 130, 0, 40)
			matHint.Position = UDim2.new(0, 112, 0, 36)
			matHint.BackgroundTransparency = 1
			matHint.Text = "применяется ко всем палеткам сразу"
			matHint.TextColor3 = currentPalette.sub
			matHint.Font = Enum.Font.Gotham
			matHint.TextSize = 11
			matHint.TextXAlignment = Enum.TextXAlignment.Left
			matHint.TextWrapped = true
			matHint.Parent = matRow
			addThemed("sub", matHint)
			local matIndex = 1
			local function setPalletMaterial(idx)
				matIndex = ((idx - 1) % #MATERIALS) + 1
				local matName = MATERIALS[matIndex]
				self._matName = matName
				matLabel.Text = matName
				pvPart.Material = Enum.Material[matName]
				pcall(function()
					for _, dd in ipairs(workspace:GetDescendants()) do
						if dd.Name == "PalletLightBrown" then
							for _, pp in ipairs(dd:GetDescendants()) do
								if pp:IsA("BasePart") then pp.Material = Enum.Material[matName] end
							end
						end
					end
				end)
			end
			local matPrev = UI.button({Name = "MatPrev", Parent = matRow, Size = UDim2.fromOffset(30, 26), Position = UDim2.new(1, -140, 0, 8), Text = "<", TextSize = 14, ThemeBackground = "element", ThemeText = "text", Corner = 8})
			local matNext = UI.button({Name = "MatNext", Parent = matRow, Size = UDim2.fromOffset(30, 26), Position = UDim2.new(1, -104, 0, 8), Text = ">", TextSize = 14, ThemeBackground = "element", ThemeText = "text", Corner = 8})
			matPrev.MouseButton1Click:Connect(function() setPalletMaterial(matIndex - 1) end)
			matNext.MouseButton1Click:Connect(function() setPalletMaterial(matIndex + 1) end)
			local spinConn = RunService.RenderStepped:Connect(function()
				if not pvPart.Parent then return end
				pvPart.CFrame = CFrame.new(Vector3.new(0, 0.4, 0)) * CFrame.Angles(0, (tick() % 6.283), 0) * CFrame.Angles(0, 0, math.rad(8))
			end)
			sidePanel.Destroying:Once(function()
				spinConn:Disconnect()
			end)
				end)
			end)
			-- применение материала к новым паллетам: живёт на модуле, не в панели
			if not self._matWatch then
				self._matWatch = Mods.Connect(self, workspace.DescendantAdded:Connect(function(dd)
					if dd.Name == "PalletLightBrown" then
						task.defer(function()
							pcall(function()
								if not self.Enabled or not self._matName then return end
								local mm = Enum.Material[self._matName]
								if not mm then return end
								for _, pp in ipairs(dd:GetDescendants()) do
									if pp:IsA("BasePart") then pp.Material = mm end
								end
							end)
						end)
					end
				end))
			end
			local cycleRow = u.Row(42)
			UI.button({
				Name = "CycleLabel", Parent = cycleRow,
				Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 14, 0, 0),
				BackgroundTransparency = 1, Stroke = false,
				Text = "Текстура из набора",
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
				Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
			})
			local cycleBtn = UI.button({
				Name = "CycleBtn", Parent = cycleRow,
				Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Выбрать ▶", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
			})
			UI.basicHover(cycleBtn, 0.1, 0.03, 0.6, 0.08)
			cycleBtn.MouseButton1Click:Connect(function()
				local lib = self.TextureLibrary or {}
				local n = #lib
				if n == 0 then
					log("Библиотека текстур пуста")
					playSound("silent")
					return
				end
				self.TexIndex = ((self.TexIndex or 0) + 1) % (n + 1)
				if self.TexIndex == 0 then
					self.LastTex = nil
					cycleBtn.Text = "Выбрать ▶"
					self:ClearTex()
				else
					local entry = lib[self.TexIndex]
					self.LastTex = entry.Url
					self.LastTile = entry.Tile
					cycleBtn.Text = entry.Name .. "  " .. self.TexIndex .. "/" .. n
					if self.Enabled then self:ApplyTex(self.LastTex, self.LastTile) end
				end
				playSound("silent")
			end)
			local customRow = u.Row(48)
			local texBox = Instance.new("TextBox")
			texBox.Name = "TexBox"
			texBox.Size = UDim2.new(1, -130, 1, -12)
			texBox.Position = UDim2.new(0, 12, 0, 6)
			texBox.BackgroundColor3 = currentPalette.element
			texBox.BackgroundTransparency = 0.1
			texBox.BorderSizePixel = 0
			texBox.Text = ""
			texBox.PlaceholderText = "свой rbxassetid (число)"
			texBox.PlaceholderColor3 = currentPalette.sub
			texBox.TextColor3 = currentPalette.text
			texBox.Font = Enum.Font.Code
			texBox.TextSize = 12
			texBox.TextXAlignment = Enum.TextXAlignment.Left
			texBox.ClearTextOnFocus = false
			texBox.Parent = customRow
			addThemed("element", texBox)
			addThemed("text", texBox)
			UI.corner(texBox, 10)
			UI.stroke(texBox, 0.6, 1)
			UI.padding(texBox, 10, 8, 0, 0)
			UI.focusFX(texBox)
			local applyBtn = UI.button({
				Name = "ApplyBtn", Parent = customRow,
				Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Применить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
			})
			UI.basicHover(applyBtn, 0.1, 0.03, 0.6, 0.08)
			applyBtn.MouseButton1Click:Connect(function()
				local id = trim(texBox.Text)
				if id == "" or not tonumber(id) then
					log("Введи число (id текстуры)")
					playSound("silent")
					return
				end
				self.TexIndex = 0
				self.LastTex = "rbxassetid://" .. id
				self.LastTile = 4
				if self.Enabled then self:ApplyTex(self.LastTex, self.LastTile) end
				log("Текстура палетки применена")
				playSound("silent")
			end)
			local clearRow = u.Row(42)
			local clearBtn = UI.button({
				Name = "ClearBtn", Parent = clearRow,
				Size = UDim2.new(1, -24, 1, -10), Position = UDim2.new(0, 12, 0.5, -14),
				BackgroundTransparency = 0.1, Text ="Убрать текстуру", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
			})
			UI.basicHover(clearBtn, 0.1, 0.03, 0.6, 0.08)
			clearBtn.MouseButton1Click:Connect(function()
				self.TexIndex = 0
				self.LastTex = nil
				self:ClearTex()
				log("Текстура палетки убрана")
				playSound("silent")
			end)
		end,
		OnEnable = function(self)
			self.TexIndex = 0
			self._acc = 0
			if self.LastTex then self:ApplyTex(self.LastTex, self.LastTile or 4) end
		end,
		OnHeartbeat = function(self, dt)
			self._acc = (self._acc or 0) + dt
			if self._acc < 4 then return end
			self._acc = 0
			if self.LastTex then self:ApplyTex(self.LastTex, self.LastTile or 4) end
		end,
		OnDisable = function(self)
			self:ClearTex()
		end,
	})

	-- ============================================================
	-- ПОГОДА: общие точки по карте
	-- ============================================================
	local WEATHER_POINTS = (function()
		local pts = {}
		local base = {
			Vector3.new(1, 0, 0),
			Vector3.new(-182, 0, -271),
			Vector3.new(494, 0, -351),
			Vector3.new(82, 0, 355),
			Vector3.new(-273, 0, 307),
			Vector3.new(271, 0, 444),
		}
		for _, b in ipairs(base) do
			table.insert(pts, Vector3.new(b.X, 70, b.Z))
		end
		return pts
	end)()
	local WEATHER_GRAVITY = Vector3.new(0, -workspace.Gravity, 0)

	-- ============================================================
	-- МОДУЛЬ: ДОЖДЬ (Shaders)
	-- ============================================================
	Mods.Register({
		Id = "Rain",
		Tab = "Shaders",
		Name = "Дождь",
		Icon = "",
		Desc = "",
		Defaults = {ThemeTint = false, Density = 1.0},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Дождь", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Оттенок из темы", self.State.ThemeTint == true, function(v) self.State.ThemeTint = v end))
			subAdd(self, u.Slider("Плотность", 0.25, 2.0, self.State.Density or 1.0, function(v) self.State.Density = v end))
		end,
		OnEnable = function(self)
			self.Ems = {}
			self.Parts = {}
			self._baseRate = 18
			self._colorSeq = ColorSequence.new(Color3.fromRGB(150, 190, 255))
			for _, pos in ipairs(WEATHER_POINTS) do
				local ok, part = pcall(function()
					local p = Instance.new("Part")
					p.Name = "FosforRainBase"
					p.Anchored = true
					p.CanCollide = false
					p.CanTouch = false
					p.CanQuery = false
					p.Transparency = 1
					p.Size = Vector3.new(380, 1, 380)
					p.CFrame = CFrame.new(pos)
					p.Parent = workspace
					return p
				end)
				if not ok or not part then
					if part then pcall(function() part:Destroy() end) end
				else
					table.insert(self.Parts, part)
					Mods.Track(self, part)
					local ok2, em = pcall(function()
						local e = Instance.new("ParticleEmitter")
						e.Name = "FosforRain"
						e.Color = self._colorSeq
						e.LightEmission = 0.35
						e.LightInfluence = 0
						e.Rate = self._baseRate
						e.Lifetime = NumberRange.new(1.4, 1.8)
						e.Speed = NumberRange.new(45, 55)
						e.Acceleration = WEATHER_GRAVITY
						e.EmissionDirection = Enum.NormalId.Bottom
						e.SpreadAngle = Vector2.new(2, 2)
						e.Size = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.18),
							NumberSequenceKeypoint.new(0.5, 0.22),
							NumberSequenceKeypoint.new(1, 0.18),
						})
						e.Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.1),
							NumberSequenceKeypoint.new(0.8, 0.3),
							NumberSequenceKeypoint.new(1, 0.9),
						})
						e.Orientation = Enum.ParticleOrientation.VelocityParallel
						e.Enabled = true
						e.Parent = part
						return e
					end)
					if ok2 and em then
						table.insert(self.Ems, em)
					end
				end
			end
		end,
		OnRender = function(self)
			if not self.Ems then return end
			local density = tonumber(self.State.Density) or 1.0
			local col = self.State.ThemeTint and Mods.Colors.accent or Color3.fromRGB(150, 190, 255)
			local targetRate = (self._baseRate or 18) * density
			local cachedSeq = self._colorSeq
			cachedSeq = ColorSequence.new(col)
			self._colorSeq = cachedSeq
			for _, em in ipairs(self.Ems) do
				if em and em.Parent then
					em.Color = cachedSeq
					em.Rate = targetRate
				end
			end
		end,
		OnDisable = function(self)
			self.Ems = {}
			self.Parts = {}
			self._colorSeq = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: СНЕГ (Shaders)
	-- ============================================================
	Mods.Register({
		Id = "Snow",
		Tab = "Shaders",
		Name = "Снег",
		Icon = "",
		Desc = "",
		Defaults = {ThemeTint = false, Density = 1.0},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Снег", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Оттенок из темы", self.State.ThemeTint == true, function(v) self.State.ThemeTint = v end))
			subAdd(self, u.Slider("Плотность", 0.25, 2.0, self.State.Density or 1.0, function(v) self.State.Density = v end))
		end,
		OnEnable = function(self)
			self.Ems = {}
			self.Parts = {}
			self._baseRate = 8
			self._colorSeq = ColorSequence.new(Color3.fromRGB(255, 255, 255))
			for _, pos in ipairs(WEATHER_POINTS) do
				local ok, part = pcall(function()
					local p = Instance.new("Part")
					p.Name = "FosforSnowBase"
					p.Anchored = true
					p.CanCollide = false
					p.CanTouch = false
					p.CanQuery = false
					p.Transparency = 1
					p.Size = Vector3.new(380, 1, 380)
					p.CFrame = CFrame.new(pos)
					p.Parent = workspace
					return p
				end)
				if not ok or not part then
					if part then pcall(function() part:Destroy() end) end
				else
					table.insert(self.Parts, part)
					Mods.Track(self, part)
					local ok2, em = pcall(function()
						local e = Instance.new("ParticleEmitter")
						e.Name = "FosforSnow"
						e.Color = self._colorSeq
						e.LightEmission = 0.15
						e.LightInfluence = 0.2
						e.Rate = self._baseRate
						e.Lifetime = NumberRange.new(7, 10)
						e.Speed = NumberRange.new(8, 12)
						e.Acceleration = Vector3.new(0, -15, 0)
						e.Drag = 2
						e.EmissionDirection = Enum.NormalId.Bottom
						e.SpreadAngle = Vector2.new(15, 15)
						e.Size = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.35),
							NumberSequenceKeypoint.new(1, 0.3),
						})
						e.Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.05),
							NumberSequenceKeypoint.new(0.85, 0.4),
							NumberSequenceKeypoint.new(1, 0.95),
						})
						e.RotSpeed = NumberRange.new(-30, 30)
						e.Enabled = true
						e.Parent = part
						return e
					end)
					if ok2 and em then
						table.insert(self.Ems, em)
					end
				end
			end
		end,
		OnRender = function(self)
			if not self.Ems then return end
			local density = tonumber(self.State.Density) or 1.0
			local col = self.State.ThemeTint and Mods.Colors.accent:Lerp(Color3.fromRGB(255, 255, 255), 0.5) or Color3.fromRGB(255, 255, 255)
			local targetRate = (self._baseRate or 8) * density
			local cachedSeq = self._colorSeq
			cachedSeq = ColorSequence.new(col)
			self._colorSeq = cachedSeq
			for _, em in ipairs(self.Ems) do
				if em and em.Parent then
					em.Color = cachedSeq
					em.Rate = targetRate
				end
			end
		end,
		OnDisable = function(self)
			self.Ems = {}
			self.Parts = {}
			self._colorSeq = nil
		end,
	})

	-- ============================================================
	-- ШЕЙДЕРЫ: фабрика пресетов (взаимное исключение)
	-- ============================================================
	local SHADER_IDS = {"ShaderRainy", "ShaderSunset", "ShaderDreamy", "ShaderPurple", "ShaderAdaptive"}
	local function registerShader(id, label, applyFn)
		Mods.Register({
			Id = id,
			Tab = "Shaders",
			Name = label,
			Icon = "",
			Desc = "",
			Defaults = {},
			Build = function(self, u)
				u.Section(label)
				self._masterToggle = u.Toggle(label, self.Enabled or self._wantEnabled == true, function(v)
					if v then
						for _, otherId in ipairs(SHADER_IDS) do
							if otherId ~= id then
								local m = Mods.Get(otherId)
								if m and m.Enabled then Mods.Disable(m) end
							end
						end
						Mods.Enable(self)
					else
						Mods.Disable(self)
					end
				end)
			end,
			SaveLighting = function(self)
				if self.SavedLighting then return end
				self.SavedLighting = {
					ClockTime = Lighting.ClockTime,
					Ambient = Lighting.Ambient,
					OutdoorAmbient = Lighting.OutdoorAmbient,
					Brightness = Lighting.Brightness,
					FogColor = Lighting.FogColor,
					FogStart = Lighting.FogStart,
					FogEnd = Lighting.FogEnd,
					ExposureCompensation = Lighting.ExposureCompensation,
					ColorShift_Top = Lighting.ColorShift_Top,
					ColorShift_Bottom = Lighting.ColorShift_Bottom,
					EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
					EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
					GeographicLatitude = Lighting.GeographicLatitude,
					GlobalShadows = Lighting.GlobalShadows,
					ShadowSoftness = Lighting.ShadowSoftness,
				}
			end,
			RestoreLighting = function(self)
				if not self.SavedLighting then return end
				for prop, value in pairs(self.SavedLighting) do
					pcall(function() Lighting[prop] = value end)
				end
				self.SavedLighting = nil
			end,
			FindToyWindow = function(self, menu)
			local best, bestA = nil, 0
			pcall(function()
				for _, d in ipairs(menu:GetDescendants()) do
					if d:IsA("Frame") and d.Visible then
						local a = d.AbsoluteSize.X * d.AbsoluteSize.Y
						if a > bestA then bestA = a best = d end
					end
				end
			end)
			return best
		end,
			OnEnable = function(self)
				self:SaveLighting()
				applyFn(self)
				log("Шейдер " .. label .. " активирован")
			end,
			OnDisable = function(self)
				self:RestoreLighting()
				log("Шейдер " .. label .. " сброшен")
			end,
		})
	end

	local function addEffect(self, instance)
		instance.Parent = Lighting
		Mods.Track(self, instance)
		return instance
	end



	registerShader("ShaderRainy","Rainy Shader", function(self)
		Lighting.ClockTime = 10
		Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
		Lighting.FogColor = Color3.new(1, 1, 1)
		Lighting.FogEnd = 100000
		Lighting.EnvironmentDiffuseScale = 0.403
		Lighting.GlobalShadows = true
		Lighting.EnvironmentSpecularScale = 0.25
		Lighting.FogStart = 0
		Lighting.GeographicLatitude = -45
		Lighting.Ambient = Color3.new(0.949, 0.953, 0.953)
		Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
		Lighting.ExposureCompensation = 0.2
		Lighting.Brightness = -0.1
		Lighting.ColorShift_Top = Color3.new(0, 0, 0)
		Lighting.ShadowSoftness = 0.2
		local sky = Instance.new("Sky")
		sky.Name = "FosforShader_Sky"
		sky.StarCount = 3000
		sky.SkyboxUp = "rbxassetid://8995814929"
		sky.MoonTextureId = "rbxasset://sky/moon.jpg"
		sky.SkyboxDn = "rbxassetid://8995686153"
		sky.SkyboxBk = "rbxassetid://8995816670"
		sky.SkyboxFt = "rbxassetid://8995816670"
		sky.SunTextureId = "rbxassetid://8923082571"
		sky.SunAngularSize = 30
		sky.SkyboxLf = "rbxassetid://8995816670"
		sky.SkyboxRt = "rbxassetid://8995816670"
		sky.MoonAngularSize = 0
		addEffect(self, sky)
		local cc = Instance.new("ColorCorrectionEffect")
		cc.Name = "FosforShader_CC"
		cc.Enabled = true
		cc.Saturation = -0.3
		cc.Contrast = 0.2
		cc.TintColor = Color3.new(0.784314, 0.784314, 1)
		cc.Brightness = -0.1
		addEffect(self, cc)
		local atm = Instance.new("Atmosphere")
		atm.Name = "FosforShader_Atmo"
		atm.Density = 0.564
		atm.Haze = 1.72
		atm.Color = Color3.new(0.631373, 0.647059, 0.635294)
		atm.Decay = Color3.new(0.949, 0.953, 0.953)
		atm.Glare = 0.36
		atm.Offset = 0.556
		addEffect(self, atm)
		local bloom = Instance.new("BloomEffect")
		bloom.Name = "FosforShader_Bloom"
		bloom.Enabled = true
		bloom.Threshold = 0.8
		bloom.Intensity = 0.3
		bloom.Size = 10
		addEffect(self, bloom)
		local dof = Instance.new("DepthOfFieldEffect")
		dof.Name = "FosforShader_DOF"
		dof.Enabled = true
		dof.FarIntensity = 0.217
		dof.FocusDistance = 11.54
		dof.InFocusRadius = 16.77
		dof.NearIntensity = 0.277
		addEffect(self, dof)
	end)

	registerShader("ShaderSunset","Sunset Shader", function(self)
		Lighting.ClockTime = 6.7
		Lighting.ColorShift_Bottom = Color3.new(0.043137, 0, 0.078431)
		Lighting.FogColor = Color3.new(0.368627, 0.298039, 0.415686)
		Lighting.FogEnd = 1000
		Lighting.EnvironmentDiffuseScale = 0
		Lighting.GlobalShadows = true
		Lighting.EnvironmentSpecularScale = 0.25
		Lighting.FogStart = 0
		Lighting.GeographicLatitude = 41.735
		Lighting.Ambient = Color3.new(0.231373, 0.129412, 0.105882)
		Lighting.OutdoorAmbient = Color3.new(0.133333, 0, 0.192157)
		Lighting.ExposureCompensation = 0.24
		Lighting.Brightness = 3.5
		Lighting.ColorShift_Top = Color3.new(0.941176, 0.498039, 0.054902)
		Lighting.ShadowSoftness = 0
		local bloom = Instance.new("BloomEffect")
		bloom.Name = "FosforShader_Bloom"
		bloom.Enabled = true
		bloom.Threshold = 0
		bloom.Intensity = 0.1
		bloom.Size = 100
		addEffect(self, bloom)
		local blur = Instance.new("BlurEffect")
		blur.Name = "FosforShader_Blur"
		blur.Enabled = true
		blur.Size = 2
		addEffect(self, blur)
		local cc = Instance.new("ColorCorrectionEffect")
		cc.Name = "FosforShader_CC"
		cc.Enabled = true
		cc.Saturation = 0.05
		cc.Contrast = 0
		cc.TintColor = Color3.new(1, 0.878431, 0.858824)
		cc.Brightness = 0
		addEffect(self, cc)
		local sunRays = Instance.new("SunRaysEffect")
		sunRays.Name = "FosforShader_SunRays"
		sunRays.Enabled = true
		sunRays.Intensity = 0.05
		sunRays.Spread = 1
		addEffect(self, sunRays)
		local sky = Instance.new("Sky")
		sky.Name = "FosforShader_Sky"
		sky.StarCount = 3000
		sky.SkyboxUp = "rbxassetid://323493360"
		sky.MoonTextureId = "rbxasset://sky/moon.jpg"
		sky.SkyboxDn = "rbxassetid://323494368"
		sky.SkyboxBk = "rbxassetid://323494035"
		sky.SkyboxFt = "rbxassetid://323494130"
		sky.SunTextureId = "rbxasset://sky/sun.jpg"
		sky.SunAngularSize = 14
		sky.SkyboxLf = "rbxassetid://323494252"
		sky.SkyboxRt = "rbxassetid://323494067"
		sky.MoonAngularSize = 11
		addEffect(self, sky)
	end)

	registerShader("ShaderDreamy","Dreamy Shader", function(self)
		Lighting.ClockTime = 14
		Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
		Lighting.FogColor = Color3.new(0.752941, 0.752941, 0.752941)
		Lighting.FogEnd = 100000
		Lighting.EnvironmentDiffuseScale = 0
		Lighting.GlobalShadows = true
		Lighting.EnvironmentSpecularScale = 0.25
		Lighting.FogStart = 0
		Lighting.GeographicLatitude = 41.735
		Lighting.Ambient = Color3.new(0.470588, 0.470588, 0.470588)
		Lighting.OutdoorAmbient = Color3.new(0.784314, 0.784314, 0.784314)
		Lighting.ExposureCompensation = 0
		Lighting.Brightness = 2
		Lighting.ColorShift_Top = Color3.new(0, 0, 0)
		Lighting.ShadowSoftness = 0.2
		local sky = Instance.new("Sky")
		sky.Name = "FosforShader_Sky"
		sky.StarCount = 3000
		sky.SkyboxUp = "rbxassetid://8995814929"
		sky.MoonTextureId = "rbxasset://sky/moon.jpg"
		sky.SkyboxDn = "rbxassetid://8995686153"
		sky.SkyboxBk = "rbxassetid://8995816670"
		sky.SkyboxFt = "rbxassetid://8995816670"
		sky.SunTextureId = "rbxassetid://8923082571"
		sky.SunAngularSize = 30
		sky.SkyboxLf = "rbxassetid://8995816670"
		sky.SkyboxRt = "rbxassetid://8995816670"
		sky.MoonAngularSize = 0
		addEffect(self, sky)
		local cc = Instance.new("ColorCorrectionEffect")
		cc.Name = "FosforShader_CC"
		cc.Enabled = true
		cc.Saturation = 0.5
		cc.Contrast = 0.3
		cc.TintColor = Color3.new(0.941176, 0.862745, 1)
		cc.Brightness = 0
		addEffect(self, cc)
		local atm = Instance.new("Atmosphere")
		atm.Name = "FosforShader_Atmo"
		atm.Density = 0.3
		atm.Haze = 0
		atm.Color = Color3.new(0.678, 0.847, 0.902)
		atm.Decay = Color3.new(0.678, 0.847, 0.902)
		atm.Glare = 0
		atm.Offset = 0
		addEffect(self, atm)
	end)

	registerShader("ShaderPurple","Purple Map", function(self)
		Lighting.ClockTime = 18.5
		Lighting.Brightness = 2.8
		Lighting.FogColor = Color3.fromRGB(138, 43, 226)
		Lighting.Ambient = Color3.fromRGB(138, 43, 226)
		Lighting.OutdoorAmbient = Color3.fromRGB(100, 90, 110)
		Lighting.FogStart = 50
		Lighting.FogEnd = 500
		local cc = Instance.new("ColorCorrectionEffect")
		cc.Name = "FosforShader_CC"
		cc.Enabled = true
		cc.TintColor = Color3.fromRGB(230, 210, 255)
		cc.Saturation = 0.2
		cc.Contrast = 0.05
		cc.Brightness = 0
		addEffect(self, cc)
	end)

	registerShader("ShaderAdaptive","Adaptive Map", function(self)
		local function colorChanged(a, b)
			if not a or not b then return true end
			local dr = a.R - b.R
			local dg = a.G - b.G
			local db = a.B - b.B
			return (dr * dr + dg * dg + db * db) > 0.0008
		end
		local function applyAdaptive()
			local accent = Mods.Colors and Mods.Colors.accent or Color3.fromRGB(168, 85, 247)
			if self._lastAccent and not colorChanged(accent, self._lastAccent) then
				return
			end
			self._lastAccent = accent
			local tint = accent:Lerp(Color3.fromRGB(255, 255, 255), 0.45)
			local ambient = accent:Lerp(Color3.fromRGB(255, 255, 255), 0.5)
			local outdoor = accent:Lerp(Color3.fromRGB(0, 0, 0), 0.45)
			pcall(function()
				Lighting.ClockTime = 18
				Lighting.Brightness = 2.5
				Lighting.FogColor = accent
				Lighting.Ambient = ambient
				Lighting.OutdoorAmbient = outdoor
				Lighting.FogStart = 50
				Lighting.FogEnd = 500
			end)
			local cc = self._cc
			if cc and cc.Parent then
				pcall(function()
					cc.TintColor = tint
					cc.Saturation = 0.15
					cc.Contrast = 0.05
					cc.Brightness = 0
				end)
			end
		end
		self._cc = self._cc or (function()
			local c = Instance.new("ColorCorrectionEffect")
			c.Name = "FosforShader_CC"
			c.Enabled = true
			return c
		end)()
		pcall(function() self._cc.Parent = Lighting end)
		Mods.Track(self, self._cc)
		applyAdaptive()
		Mods.OnColorChange(function()
			if self.Enabled then
				applyAdaptive()
			end
		end)
	end)

	-- ============================================================
	-- МОДУЛЬ: ДЕНЬ / НОЧЬ (Shaders)
	-- ============================================================
	Mods.Register({
		Id = "DayNight",
		Tab = "Shaders",
		Name = "День / Ночь",
		Icon = "",
		Desc = "",
		Defaults = {EveningMorning = false, NightHour = 0, MorningHour = 7, EveningHour = 17},
		Build = function(self, u)
			u.Section(" День / Ночь")
			self._subRows = {}
			self._masterToggle = u.Toggle("День / Ночь", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Вечер / Утро", self.State.EveningMorning == true, function(v)
				self.State.EveningMorning = v
				if self.Enabled then self:Apply() end
			end))
			subAdd(self, u.Slider("Час ночи", 0, 23, self.State.NightHour or 0, function(v) self.State.NightHour = v end))
			subAdd(self, u.Slider("Час утра", 0, 23, self.State.MorningHour or 7, function(v) self.State.MorningHour = v end))
			subAdd(self, u.Slider("Час вечера", 0, 23, self.State.EveningHour or 17, function(v) self.State.EveningHour = v end))
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		Apply = function(self)
			if self.State.EveningMorning then
				Lighting.ClockTime = self.State.MorningHour or 7
				log("Режим: День (Утро)")
			else
				Lighting.ClockTime = self.State.EveningHour or 17
				log("Режим: День (Вечер)")
			end
		end,
		OnEnable = function(self)
			if not self.SavedClock then
				self.SavedClock = Lighting.ClockTime
			end
			Lighting.ClockTime = self.State.NightHour or 0
			log("Режим: Ночь")
		end,
		OnDisable = function(self)
			if self.SavedClock then
				Lighting.ClockTime = self.SavedClock
				self.SavedClock = nil
			end
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ОКЕАН (Shaders)
	-- ============================================================
	Mods.Register({
		Id = "Ocean",
		Tab = "Shaders",
		Name = "Океан",
		Icon = "",
		Desc = "",
		Defaults = {Hide = false, Transparency = nil, PhysWater = false, CustomColor = nil},
		FindOcean = function(self)
			local ocean = nil
			pcall(function()
				local map = workspace:FindFirstChild("Map")
				if map then
					local tweened = map:FindFirstChild("AlwaysHereTweenedObjects")
					if tweened then
						ocean = tweened:FindFirstChild("Ocean")
					end
				end
				if not ocean then
					for _, d in ipairs(workspace:GetDescendants()) do
						if d and d.Parent and d:IsA("BasePart") then
							local ln = string.lower(d.Name or "")
							if (ln == "ocean" or ln == "water" or ln == "sea") and d.Size.X > 200 and d.Size.Z > 200 then
								ocean = d
								break
							end
						end
					end
				end
			end)
			return ocean
		end,
		OceanParts = function(self)
			if not self.OceanPart then return {} end
			local list = {}
			if self.OceanPart:IsA("BasePart") then
				list[#list + 1] = self.OceanPart
			elseif self.OceanPart:IsA("Model") or self.OceanPart:IsA("Folder") then
				for _, child in ipairs(self.OceanPart:GetDescendants()) do
					if child:IsA("BasePart") then list[#list + 1] = child end
				end
				if #list == 0 then list[#list + 1] = self.OceanPart end
			else
				list[#list + 1] = self.OceanPart
			end
			return list
		end,
		ApplyToOcean = function(self, fn)
			local parts = self:OceanParts()
			for _, part in ipairs(parts) do
				if part and part.Parent then
					pcall(fn, part)
				end
			end
		end,
		ApplyState = function(self)
			local st = self.State
			self:ApplyToOcean(function(part)
				if st.Hide then
					part.Transparency = 1
				else
					local tr = st.Transparency
					part.Transparency = (tr ~= nil) and (math.clamp(tr, 0, 95) / 100) or (self.Original and self.Original.Transparency) or 0
				end
				if st.PhysWater then
					part.Material = Enum.Material.Water
					part.Reflectance = 0.2
				end
				if st.CustomColor then
					part.Color = st.CustomColor
				end
			end)
		end,
		Reset = function(self)
			if not self.Original then
				pcall(function()
					for _, d in ipairs(workspace:GetDescendants()) do
						if d.Name == "FosforOceanTexture" then d:Destroy() end
					end
				end)
				return
			end
			self:ApplyToOcean(function(part)
				pcall(function()
					part.Color = self.Original.Color
					part.Material = self.Original.Material
					part.Transparency = self.Original.Transparency
					part.Reflectance = self.Original.Reflectance or 0
					for _, child in ipairs(part:GetChildren()) do
						if child.Name == "FosforOceanTexture" then child:Destroy() end
					end
				end)
			end)
		end,
		Build = function(self, u)
			u.Section("Океан")
			self._masterToggle = u.Toggle("Океан (управление)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Скрыть океан", self.State.Hide == true, function(v)
				self.State.Hide = v
				if self.Enabled then self:ApplyState() end
				log("Океан: " .. (v and "скрыт" or "показан"))
			end))
			subAdd(self, u.Toggle("Физическая вода (Water + блики)", self.State.PhysWater == true, function(v)
				self.State.PhysWater = v
				if self.Enabled then self:ApplyState() end
			end))
			u.Slider("Прозрачность океана %", 0, 95, self.State.Transparency or 20, function(v)
				self.State.Transparency = math.floor(v + 0.5)
				self.State.Hide = false
				if self.Enabled then self:ApplyState() end
			end)
			-- preview swatch
			local previewRow = u.Row(36)
			local previewSwatch = Instance.new("Frame")
			previewSwatch.Name = "OceanPreview"
			previewSwatch.Size = UDim2.new(1, -28, 1, -16)
			previewSwatch.Position = UDim2.new(0, 14, 0, 8)
			previewSwatch.BackgroundColor3 = self.State.CustomColor or (self.Original and self.Original.Color) or Color3.fromRGB(0, 100, 200)
			previewSwatch.BorderSizePixel = 0
			previewSwatch.Parent = previewRow
			UI.corner(previewSwatch, 8)
			UI.stroke(previewSwatch, 0.4, 1)
			local function refreshPreview()
				if previewSwatch and previewSwatch.Parent then
					previewSwatch.BackgroundColor3 = self.State.CustomColor or (self.Original and self.Original.Color) or Color3.fromRGB(0, 100, 200)
				end
			end

			local colorRow = u.Row(52)
			UI.button({
				Name = "ColorLabel", Parent = colorRow,
				Size = UDim2.new(1, -20, 0, 16), Position = UDim2.new(0, 14, 0, 4),
				BackgroundTransparency = 1, Stroke = false,
				Text = "Цвет океана",
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
				Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
			})
			local oceanColors = {
				{Name = "Синий", Color = Color3.fromRGB(0, 100, 200)},
				{Name = "Бирюза", Color = Color3.fromRGB(0, 180, 200)},
				{Name = "Изумруд", Color = Color3.fromRGB(0, 180, 120)},
				{Name = "Фиолет", Color = Color3.fromRGB(120, 60, 200)},
				{Name = "Розовый", Color = Color3.fromRGB(200, 100, 150)},
				{Name = "Красный", Color = Color3.fromRGB(180, 40, 40)},
				{Name = "Ночь", Color = Color3.fromRGB(10, 10, 30)},
				{Name = "Луна", Color = Color3.fromRGB(200, 210, 230)},
			}
			for i, colorData in ipairs(oceanColors) do
				local btn = UI.button({
					Name = "Color_" .. colorData.Name, Parent = colorRow,
					Size = UDim2.fromOffset(26, 26),
					Position = UDim2.new(0, 14 + (i - 1) * 32, 1, -32),
					BackgroundColor3 = colorData.Color,
					BackgroundTransparency = 0,
					Text = "", Corner = 7,
					StrokeTransparency = 0.5,
				})
				btn.MouseButton1Click:Connect(function()
					self.State.CustomColor = colorData.Color
					if self.Enabled then self:ApplyState() end
					refreshPreview()
					playSound("silent")
					log("Цвет океана: " .. colorData.Name)
				end)
			end
			local matRow = u.Row(56)
			UI.button({
				Name = "MatLabel", Parent = matRow,
				Size = UDim2.new(1, -20, 0, 16), Position = UDim2.new(0, 14, 0, 4),
				BackgroundTransparency = 1, Stroke = false,
				Text = "Материал океана",
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
				Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
			})
			local oceanMaterials = {
				{Name = "Вода", Mat = Enum.Material.Water},
				{Name = "Стекло", Mat = Enum.Material.Glass},
				{Name = "Неон", Mat = Enum.Material.Neon},
				{Name = "Лёд", Mat = Enum.Material.Ice},
				{Name = "Мрамор", Mat = Enum.Material.Marble},
				{Name = "Пластик", Mat = Enum.Material.SmoothPlastic},
				{Name = "Фольга", Mat = Enum.Material.Foil},
				{Name = "Металл", Mat = Enum.Material.Metal},
			}
			for i, matData in ipairs(oceanMaterials) do
				local row = math.floor((i - 1) / 4)
				local col = (i - 1) % 4
				local btn = UI.button({
					Name = "Mat_" .. matData.Name, Parent = matRow,
					Size = UDim2.fromOffset(90, 20),
					Position = UDim2.new(0, 14 + col * 96, 1, -26 - row * 22),
					BackgroundTransparency = 0.1, Text = matData.Name, TextSize = 11,
					ThemeBackground = "element", ThemeText = "text",
					Font = Enum.Font.Gotham, Corner = 6,
					StrokeTransparency = 0.6,
				})
				btn.MouseButton1Click:Connect(function()
					self:ApplyToOcean(function(part) part.Material = matData.Mat end)
					playSound("silent")
					log("Материал океана: " .. matData.Name)
				end)
			end
			local texRow = u.Row(48)
			local texInput = Instance.new("TextBox")
			texInput.Name = "OceanTexInput"
			texInput.Size = UDim2.new(1, -130, 1, -12)
			texInput.Position = UDim2.new(0, 12, 0, 6)
			texInput.BackgroundColor3 = currentPalette.element
			texInput.BackgroundTransparency = 0.1
			texInput.BorderSizePixel = 0
			texInput.Text = ""
			texInput.PlaceholderText = "rbxassetid своей текстуры (число)"
			texInput.PlaceholderColor3 = currentPalette.sub
			texInput.TextColor3 = currentPalette.text
			texInput.Font = Enum.Font.Code
			texInput.TextSize = 12
			texInput.TextXAlignment = Enum.TextXAlignment.Left
			texInput.ClearTextOnFocus = false
			texInput.Parent = texRow
			addThemed("element", texInput)
			addThemed("text", texInput)
			UI.corner(texInput, 10)
			UI.stroke(texInput, 0.6, 1)
			UI.padding(texInput, 10, 8, 0, 0)
			UI.focusFX(texInput)
			local applyTexBtn = UI.button({
				Name = "ApplyOceanTexBtn", Parent = texRow,
				Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Применить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
			})
			UI.basicHover(applyTexBtn, 0.1, 0.03, 0.6, 0.08)
			applyTexBtn.MouseButton1Click:Connect(function()
				local assetId = trim(texInput.Text)
				if assetId == "" or not tonumber(assetId) then
					log("Вставь rbxassetid текстуры")
					playSound("silent")
					return
				end
				self:ApplyToOcean(function(part)
					for _, child in ipairs(part:GetChildren()) do
						if child.Name == "FosforOceanTexture" then child:Destroy() end
					end
					local tex = Instance.new("Texture")
					tex.Name = "FosforOceanTexture"
					tex.Texture = "rbxassetid://" .. assetId
					tex.Face = Enum.NormalId.Top
					tex.StudsPerTileU = 8
					tex.StudsPerTileV = 8
					tex.Transparency = 0
					tex.Parent = part
					Mods.Track(self, tex)
				end)
				log("Текстура океана применена")
				playSound("silent")
			end)
			local resetRow = u.Row(42)
			local resetBtn = UI.button({
				Name = "ResetOceanBtn", Parent = resetRow,
				Size = UDim2.new(1, -24, 1, -10), Position = UDim2.new(0, 12, 0.5, -14),
				BackgroundTransparency = 0.1, Text ="Сбросить океан", TextSize = 13,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
			})
			UI.basicHover(resetBtn, 0.1, 0.03, 0.6, 0.08)
			resetBtn.MouseButton1Click:Connect(function()
				self.State.Hide = false
				self.State.Transparency = nil
				self.State.PhysWater = false
				self.State.CustomColor = nil
				self:Reset()
				refreshPreview()
				log("Океан сброшен к оригиналу")
				playSound("silent")
			end)
		end,
		OnEnable = function(self)
			self.OceanPart = self:FindOcean()
			if not self.OceanPart then
				log("Океан не найден на карте")
				return
			end
			if not self.Original then
				local sample = nil
				local parts = self:OceanParts()
				if #parts > 0 then sample = parts[1] end
				if not sample and self.OceanPart:IsA("BasePart") then sample = self.OceanPart end
				if sample then
					self.Original = {
						Color = sample.Color,
						Material = sample.Material,
						Transparency = sample.Transparency,
						Reflectance = sample.Reflectance or 0,
					}
				end
			end
			self:ApplyState()
		end,
		OnHeartbeat = function(self, dt)
			if not self.Enabled then return end
			if self.OceanPart and self.OceanPart.Parent then return end
			-- ocean was destroyed or never existed; try refind
			local newOcean = self:FindOcean()
			if newOcean and newOcean ~= self.OceanPart then
				self.OceanPart = newOcean
				self.Original = nil
				local parts = self:OceanParts()
				local sample = parts[1] or (newOcean:IsA("BasePart") and newOcean)
				if sample then
					self.Original = {
						Color = sample.Color,
						Material = sample.Material,
						Transparency = sample.Transparency,
						Reflectance = sample.Reflectance or 0,
					}
				end
				self:ApplyState()
				log("Океан перенайден")
			end
		end,
		OnDisable = function(self)
			if self.OceanPart and self.Original then
				self:ApplyToOcean(function(part)
					pcall(function()
						part.Color = self.Original.Color
						part.Material = self.Original.Material
						part.Transparency = self.Original.Transparency
						part.Reflectance = self.Original.Reflectance or 0
						for _, child in ipairs(part:GetChildren()) do
							if child.Name == "FosforOceanTexture" then child:Destroy() end
						end
					end)
				end)
			end
			self.OceanPart = nil
			self.Original = nil
			self.State.Hide = false
			self.State.PhysWater = false
			self.State.Transparency = nil
			self.State.CustomColor = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: СПЕКТАТОР (свободная камера)
	-- ============================================================
	Mods.Register({
		Id = "Spectator",
		Tab = "Visual",
		Name = "Спектатор",
		Icon = "",
		Desc = "",
		Defaults = {Speed = 50, ShiftBoost = true},
		Build = function(self, u)
			u.Section("Спектатор")
			self._masterToggle = u.Toggle("Режим спектатора (свободная камера)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Скорость полёта", 10, 200, self.State.Speed or 50, function(v) self.State.Speed = v end))
			subAdd(self, u.Toggle("Ускорение на Shift", self.State.ShiftBoost ~= false, function(v) self.State.ShiftBoost = v end))
		end,
		OnEnable = function(self)
			local cam = workspace.CurrentCamera
			self.PrevCamType = cam.CameraType
			self.PrevSubject = cam.CameraSubject
			cam.CameraType = Enum.CameraType.Scriptable
			Mods.Connect(self, RunService.RenderStepped:Connect(function(dt)
				if not self.Enabled then return end
				local c = workspace.CurrentCamera
				local uis = UserInputService
				if uis:GetFocusedTextBox() then return end
				local speed = tonumber(self.State.Speed) or 50
				if self.State.ShiftBoost ~= false and uis:IsKeyDown(Enum.KeyCode.LeftShift) then
					speed = speed * 3
				end
				local move = Vector3.new()
				if uis:IsKeyDown(Enum.KeyCode.W) then move = move + Vector3.new(0, 0, -1) end
				if uis:IsKeyDown(Enum.KeyCode.S) then move = move + Vector3.new(0, 0, 1) end
				if uis:IsKeyDown(Enum.KeyCode.A) then move = move + Vector3.new(-1, 0, 0) end
				if uis:IsKeyDown(Enum.KeyCode.D) then move = move + Vector3.new(1, 0, 0) end
				if uis:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
				if uis:IsKeyDown(Enum.KeyCode.LeftControl) then move = move + Vector3.new(0, -1, 0) end
				if move.Magnitude > 0 then move = move.Unit end
				local world = c.CFrame:VectorToWorldSpace(move)
				c.CFrame = c.CFrame + world * (speed * dt)
			end))
			Mods.Connect(self, UserInputService.InputBegan:Connect(function(inp, gp)
				if gp then return end
				if inp.UserInputType == Enum.UserInputType.MouseButton2 then
					UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				end
			end))
			Mods.Connect(self, UserInputService.InputEnded:Connect(function(inp)
				if inp.UserInputType == Enum.UserInputType.MouseButton2 then
					UserInputService.MouseBehavior = Enum.MouseBehavior.Default
				end
			end))
			Mods.Connect(self, UserInputService.InputChanged:Connect(function(inp)
				if inp.UserInputType == Enum.UserInputType.MouseMovement
					and UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
					local c = workspace.CurrentCamera
					local rx, ry, rz = c.CFrame:ToEulerAnglesYXZ()
					ry = ry - math.rad(inp.Delta.X) * 0.4
					rx = math.clamp(rx - math.rad(inp.Delta.Y) * 0.4, -math.rad(89), math.rad(89))
					c.CFrame = CFrame.fromEulerAnglesYXZ(rx, ry, 0)
				end
			end))
			log("Спектатор включён: WASD/Space/Ctrl — полёт, ПКМ — обзор")
		end,
		OnDisable = function(self)
			local cam = workspace.CurrentCamera
			cam.CameraType = self.PrevCamType or Enum.CameraType.Custom
			cam.CameraSubject = self.PrevSubject or (player.Character and player.Character:FindFirstChildOfClass("Humanoid"))
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			log("Спектатор выключен")
		end,
	})

-- ===== КОНЕЦ ЧАСТИ 4 ===== (следующая Часть 5: Вкладки (TabBuilders), Навигация, Старт)
	-- ============================================================
	-- ВКЛАДКИ (TabBuilders)
	-- ============================================================
	local TabBuilders = {}

	TabBuilders.Player = function(page)
		local list = Mods.ContainerFor("Player") or UI.createScrollArea(page)
		local headerRow = UI.row(list, 1, 150)
		local avatar = Instance.new("ImageLabel")
		avatar.Name = "ProfileAvatar"
		avatar.Size = UDim2.fromOffset(64, 64)
		avatar.Position = UDim2.new(0.5, -32, 0, 8)
		avatar.BackgroundTransparency = 1
		avatar.Parent = headerRow
		local avatarCorner = Instance.new("UICorner")
		avatarCorner.CornerRadius = UDim.new(1, 0)
		avatarCorner.Parent = avatar
		local ringColor = Color3.fromRGB(255, 255, 255)
		local isOwnerLocal = (player.UserId == _fs_oid)
		local isTesterLocal = false
		for _, tid in ipairs(_fs_tids) do
			if player.UserId == tid then isTesterLocal = true break end
		end
		if isOwnerLocal then
			ringColor = Color3.fromRGB(255, 215, 0)
		elseif isTesterLocal then
			ringColor = Color3.fromRGB(0, 255, 100)
		end
		local ringFrame = Instance.new("Frame")
		ringFrame.Name = "AvatarRing"
		ringFrame.Size = UDim2.fromOffset(76, 76)
		ringFrame.Position = UDim2.new(0.5, -38, 0, 2)
		ringFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		ringFrame.BackgroundTransparency = 1
		ringFrame.BorderSizePixel = 0
		ringFrame.ZIndex = 1
		ringFrame.Parent = headerRow
		local ringCorner = Instance.new("UICorner")
		ringCorner.CornerRadius = UDim.new(1, 0)
		ringCorner.Parent = ringFrame
		local ringStroke = Instance.new("UIStroke")
		ringStroke.Name = "AvatarRingStroke"
		ringStroke.Color = ringColor
		ringStroke.Thickness = 2
		ringStroke.Transparency = 0.25
		ringStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		ringStroke.Parent = ringFrame
		avatar.ZIndex = 2
		local ringBrightColor = ringColor:Lerp(Color3.fromRGB(255, 255, 255), 0.45)
		task.spawn(function()
			while ringFrame and ringFrame.Parent do
				local glow = (math.sin(tick() * 3) + 1) / 2
				if ringStroke and ringStroke.Parent then
					ringStroke.Transparency = 0.15 + glow * 0.55
					ringStroke.Color = ringColor:Lerp(ringBrightColor, glow)
				end
				task.wait(0.05)
			end
		end)
		pcall(function()
			avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.Bust, Enum.ThumbnailSize.Size420x420)
		end)
		local displayName = Instance.new("TextLabel")
		displayName.Size = UDim2.new(1, -20, 0, 20)
		displayName.Position = UDim2.new(0, 10, 0, 76)
		displayName.BackgroundTransparency = 1
		displayName.Text = player.DisplayName or player.Name
		displayName.TextColor3 = currentPalette.text
		displayName.Font = Enum.Font.GothamBold
		displayName.TextSize = 18
		displayName.TextXAlignment = Enum.TextXAlignment.Center
		displayName.Parent = headerRow
		addThemed("text", displayName)
		local userName = Instance.new("TextLabel")
		userName.Size = UDim2.new(1, -20, 0, 14)
		userName.Position = UDim2.new(0, 10, 0, 98)
		userName.BackgroundTransparency = 1
		userName.Text = "@" .. player.Name
		userName.TextColor3 = currentPalette.sub
		userName.Font = Enum.Font.Gotham
		userName.TextSize = 12
		userName.TextXAlignment = Enum.TextXAlignment.Center
		userName.Parent = headerRow
		addThemed("sub", userName)
		local roleText, roleColor = "ИГРОК", currentPalette.dim
		if isOwnerLocal then roleText, roleColor = "OWNER", Color3.fromRGB(255, 215, 0)
		elseif isTesterLocal then roleText, roleColor = "TESTER", Color3.fromRGB(0, 255, 100) end
		local roleBadge = Instance.new("TextLabel")
		roleBadge.Size = UDim2.new(1, -20, 0, 14)
		roleBadge.Position = UDim2.new(0, 10, 0, 118)
		roleBadge.BackgroundTransparency = 1
		roleBadge.Text = roleText
		roleBadge.TextColor3 = roleColor
		roleBadge.Font = Enum.Font.GothamBold
		roleBadge.TextSize = 11
		roleBadge.TextXAlignment = Enum.TextXAlignment.Center
		roleBadge.Parent = headerRow
		local colsRow = Instance.new("Frame")
		colsRow.Name = "Columns"
		colsRow.Size = UDim2.new(1, 0, 0, 170)
		colsRow.BackgroundTransparency = 1
		colsRow.LayoutOrder = 2
		colsRow.Parent = list
		local function makeCard(side)
			local card = Instance.new("Frame")
			card.Size = UDim2.new(0.5, -10, 1, 0)
			card.Position = (side == "L") and UDim2.new(0, 4, 0, 0) or UDim2.new(0.5, 6, 0, 0)
			card.BackgroundColor3 = currentPalette.element
			card.BackgroundTransparency = 0.1
			card.BorderSizePixel = 0
			card.Parent = colsRow
			addThemed("element", card)
			UI.corner(card, 12)
			UI.stroke(card, 0.7, 1)
			local lay = Instance.new("UIListLayout")
			lay.Padding = UDim.new(0, 4)
			lay.SortOrder = Enum.SortOrder.LayoutOrder
			lay.Parent = card
			UI.padding(card, 10, 10, 8, 8)
			return card
		end
		local function makeStat(card, order, labelText)
			local rowF = Instance.new("Frame")
			rowF.Size = UDim2.new(1, 0, 0, 20)
			rowF.BackgroundTransparency = 1
			rowF.LayoutOrder = order
			rowF.Parent = card
			local lab = Instance.new("TextLabel")
			lab.Size = UDim2.new(0.5, 0, 1, 0)
			lab.BackgroundTransparency = 1
			lab.Text = labelText
			lab.TextColor3 = currentPalette.sub
			lab.Font = Enum.Font.Gotham
			lab.TextSize = 12
			lab.TextXAlignment = Enum.TextXAlignment.Left
			lab.Parent = rowF
			addThemed("sub", lab)
			local val = Instance.new("TextLabel")
			val.Size = UDim2.new(0.5, 0, 1, 0)
			val.Position = UDim2.new(0.5, 0, 0, 0)
			val.BackgroundTransparency = 1
			val.Text = "0"
			val.TextColor3 = currentPalette.text
			val.Font = Enum.Font.GothamBold
			val.TextSize = 12
			val.TextXAlignment = Enum.TextXAlignment.Right
			val.Parent = rowF
			addThemed("text", val)
			return val
		end
		local leftCard = makeCard("L")
		local rightCard = makeCard("R")
		local vFpsMin = makeStat(leftCard, 1, "FPS мин")
		local vFpsMax = makeStat(leftCard, 2, "FPS макс")
		local vServer = makeStat(leftCard, 3, "Сервер")
		local vLife = makeStat(leftCard, 4, "Жизнь")
		local vScript = makeStat(leftCard, 5, "Скрипт")
		local vPlayers = makeStat(leftCard, 6, "Игроков на сервере")
		local vDeaths = makeStat(rightCard, 1, "Смерти")
		local vKills = makeStat(rightCard, 2, "Убийства")
		local vAir = makeStat(rightCard, 3, "Air грабы")
		local vGround = makeStat(rightCard, 4, "Земные грабы")
		local vFriends = makeStat(rightCard, 5, "Друзей")
		local vAccAge = makeStat(rightCard, 6, "Возраст Аккаунта")
		vKills.Text, vAir.Text, vGround.Text = "—", "—", "—"
		local byRow = Instance.new("Frame")
		byRow.Size = UDim2.new(1, 0, 0, 24)
		byRow.BackgroundTransparency = 1
		byRow.LayoutOrder = 3
		byRow.Parent = list
		local byLabel = Instance.new("TextLabel")
		byLabel.Size = UDim2.new(1, 0, 1, 0)
		byLabel.BackgroundTransparency = 1
		byLabel.Text = "By Fosfor!"
		byLabel.TextColor3 = currentPalette.dim
		byLabel.Font = Enum.Font.Gotham
		byLabel.TextSize = 11
		byLabel.TextXAlignment = Enum.TextXAlignment.Center
		byLabel.Parent = byRow
		task.spawn(function()
			while page and page.Parent do
				local pst = Mods.Get("ProfileStats")
				local s = pst and pst.Stats
				local gs = Mods.Get("GrabStats")
				local g = gs and gs.Stats
				if s then
					vFpsMin.Text = (s.fpsMin == math.huge) and "—" or tostring(math.floor(s.fpsMin))
					vFpsMax.Text = tostring(math.floor(s.fpsMax))
					vLife.Text = formatTime(tick() - s.lifeStart)
					vScript.Text = formatTime(tick() - s.scriptStart)
					vDeaths.Text = tostring(s.deaths)
				end
				vServer.Text = formatTime(workspace.DistributedGameTime)
				vPlayers.Text = tostring(#Players:GetPlayers())
				vFriends.Text = tostring(pst and pst:GetFriends() or 0)
				vAccAge.Text = tostring(player.AccountAge) .. " дн."
				if g then
					vKills.Text = tostring(g.kills)
					vAir.Text = tostring(g.airGrabs)
					vGround.Text = tostring(g.groundGrabs)
				end
				task.wait(1)
			end
		end)
	end

	TabBuilders.Scripts = function(page)
		local list = Mods.ContainerFor("Scripts") or UI.createScrollArea(page)
		local headerRow = UI.row(list, 1, 30)
		UI.button({
			Name = "ScriptsHeader", Parent = headerRow,
			Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Загрузчик скриптов",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 15,
			Active = false, ThemeText = "text", Font = Enum.Font.GothamBold,
		})
		local pvoRow = UI.row(list, 2, 42)
		UI.basicHover(pvoRow, 0.1, 0.08, 0.75, 0.25)
		UI.button({
			Name = "PvoLabel", Parent = pvoRow,
			Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Fosfor PVO (ракеты)",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		})
		local pvoBtn = UI.button({
			Name = "PvoButton", Parent = pvoRow,
			Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
			BackgroundTransparency = 0.1, Text = "Выполнить", TextSize = 12,
			ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
		})
		UI.basicHover(pvoBtn, 0.1, 0.03, 0.6, 0.08)
		pvoBtn.MouseButton1Click:Connect(function()
			pvoBtn.Text = "Выполняется..."
			playSound("silent")
			task.spawn(function()
				executeScriptFromURL("Fosfor PVO", scriptLibrary[1].URL)
				if pvoBtn and pvoBtn.Parent then pvoBtn.Text = "Выполнить" end
			end)
		end)
		local iyRow = UI.row(list, 3, 42)
		UI.basicHover(iyRow, 0.1, 0.08, 0.75, 0.25)
		UI.button({
			Name = "IYLabel", Parent = iyRow,
			Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Infinity Yield (админ)",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		})
		local iyBtn = UI.button({
			Name = "IYButton", Parent = iyRow,
			Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
			BackgroundTransparency = 0.1, Text = "Выполнить", TextSize = 12,
			ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
		})
		UI.basicHover(iyBtn, 0.1, 0.03, 0.6, 0.08)
		iyBtn.MouseButton1Click:Connect(function()
			iyBtn.Text = "Выполняется..."
			playSound("silent")
			task.spawn(function()
				executeScriptFromURL("Infinity Yield", scriptLibrary[2].URL)
				if iyBtn and iyBtn.Parent then iyBtn.Text = "Выполнить" end
			end)
		end)
		local urlRow = UI.row(list, 4, 48)
		local urlBox = Instance.new("TextBox")
		urlBox.Name = "URLBox"
		urlBox.Size = UDim2.new(1, -126, 1, -12)
		urlBox.Position = UDim2.new(0, 12, 0, 6)
		urlBox.BackgroundColor3 = currentPalette.element
		urlBox.BackgroundTransparency = 0.1
		urlBox.BorderSizePixel = 0
		urlBox.Text = ""
		urlBox.PlaceholderText = "Вставь ссылку на скрипт (raw...)"
		urlBox.PlaceholderColor3 = currentPalette.sub
		urlBox.TextColor3 = currentPalette.text
		urlBox.Font = Enum.Font.Code
		urlBox.TextSize = 12
		urlBox.TextXAlignment = Enum.TextXAlignment.Left
		urlBox.ClearTextOnFocus = false
		urlBox.Parent = urlRow
		addThemed("element", urlBox)
		addThemed("text", urlBox)
		UI.corner(urlBox, 10)
		UI.stroke(urlBox, 0.6, 1)
		UI.padding(urlBox, 10, 8, 0, 0)
		UI.focusFX(urlBox)
		local loadBtn = UI.button({
			Name = "LoadButton", Parent = urlRow,
			Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
			BackgroundTransparency = 0.1, Text = "Загрузить", TextSize = 12,
			ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
		})
		UI.basicHover(loadBtn, 0.1, 0.03, 0.6, 0.08)
		loadBtn.MouseButton1Click:Connect(function()
			local url = trim(urlBox.Text)
			if url == "" then
				log("Вставь ссылку на скрипт.")
				return
			end
			loadBtn.Text = "Загрузка..."
			playSound("silent")
			task.spawn(function()
				executeScriptFromURL("Свой скрипт", url)
				if loadBtn and loadBtn.Parent then loadBtn.Text = "Загрузить" end
			end)
		end)
		local hintRow = UI.row(list, 5, 30)
		UI.button({
			Name = "HintLabel", Parent = hintRow,
			Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Ссылка должна быть прямой (raw). Пример: raw.githubusercontent.com/.../source",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 11,
			Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
		})
	end

	TabBuilders.Teleports = function(page)
		local list = Mods.ContainerFor("Teleports") or UI.createScrollArea(page)
		local lookTeleportEnabled = false
		local teleportPoints = {
			{Name = "Спавн", Position = Vector3.new(1, -8, 0)},
			{Name = "Ферма", Position = Vector3.new(-182, 59, -271)},
			{Name = "Синий дом", Position = Vector3.new(494, 83, -351)},
			{Name = "Жёлтый дом", Position = Vector3.new(536, 123, -93)},
			{Name = "Остров", Position = Vector3.new(82, 346, 355)},
			{Name = "Большой дом", Position = Vector3.new(-273, 80, 307)},
			{Name = "Зелёный дом", Position = Vector3.new(-539, -8, 75)},
			{Name = "Розовый дом", Position = Vector3.new(-483, -8, -150)},
			{Name = "Заброшенный дом", Position = Vector3.new(271, -8, 444)},
			{Name = "Клиф", Position = Vector3.new(355, -8, -473)},
			{Name = "Малый Клиф", Position = Vector3.new(386, -8, 335)},
			{Name = "Пляж", Position = Vector3.new(-659, -8, -57)},
			{Name = "Малая пещера", Position = Vector3.new(-5, 19, -281)},
			{Name = "Шахта", Position = Vector3.new(-370, -8, 181)},
			{Name = "Вершина горы", Position = Vector3.new(-436, 230, 529)},
			{Name = "Большая пещера", Position = Vector3.new(-96, -8, 563)},
			{Name = "Пещера 3", Position = Vector3.new(579, 101, -178)},
		}
		local function teleportTo(pos)
			local char = player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			if root then
				root.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
				playSound("silent")
			end
		end
		local function teleportToLook()
			local cam = workspace.CurrentCamera
			local rp = RaycastParams.new()
			rp.FilterDescendantsInstances = {player.Character}
			rp.FilterType = Enum.RaycastFilterType.Exclude
			local res = workspace:Raycast(cam.CFrame.Position, cam.CFrame.LookVector * 500, rp)
			if res then
				teleportTo(res.Position)
			else
				log("Смотри на поверхность.")
			end
		end
		UserInputService.InputBegan:Connect(function(input, gp)
			if gp then return end
			if lookTeleportEnabled and input.KeyCode == Enum.KeyCode.V then
				teleportToLook()
			end
		end)
		local headerRow = UI.row(list, 1, 30)
		UI.button({
			Name = "TPHeader", Parent = headerRow,
			Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Телепорты",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 15,
			Active = false, ThemeText = "text", Font = Enum.Font.GothamBold,
		})
		local recRow = UI.row(list, 2, 48)
		local nameBox = Instance.new("TextBox")
		nameBox.Name = "TPNameBox"
		nameBox.Size = UDim2.new(1, -126, 1, -12)
		nameBox.Position = UDim2.new(0, 12, 0, 6)
		nameBox.BackgroundColor3 = currentPalette.element
		nameBox.BackgroundTransparency = 0.1
		nameBox.BorderSizePixel = 0
		nameBox.Text = ""
		nameBox.PlaceholderText = "Имя точки..."
		nameBox.PlaceholderColor3 = currentPalette.sub
		nameBox.TextColor3 = currentPalette.text
		nameBox.Font = Enum.Font.Gotham
		nameBox.TextSize = 13
		nameBox.TextXAlignment = Enum.TextXAlignment.Left
		nameBox.ClearTextOnFocus = false
		nameBox.Parent = recRow
		addThemed("element", nameBox)
		addThemed("text", nameBox)
		UI.corner(nameBox, 10)
		UI.stroke(nameBox, 0.6, 1)
		UI.padding(nameBox, 10, 8, 0, 0)
		UI.focusFX(nameBox)
		local recBtn = UI.button({
			Name = "RecordButton", Parent = recRow,
			Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
			BackgroundTransparency = 0.1, Text ="Записать", TextSize = 12,
			ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
		})
		UI.basicHover(recBtn, 0.1, 0.03, 0.6, 0.08)
		UI.createToggle(list, "Телепорт куда смотришь (бинд V)", false, function(state)
			lookTeleportEnabled = state
			log("Телепорт по взгляду: " .. (state and "включён" or "выключен"))
		end, 3)
		local pointsHeader = UI.row(list, 4, 24)
		UI.button({
			Name = "PointsHeader", Parent = pointsHeader,
			Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Точки:",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
			Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
		})
		local orderCounter = 10
		local function makePointRow(p)
			local row = UI.row(list, orderCounter, 42)
			orderCounter = orderCounter + 1
			UI.basicHover(row, 0.1, 0.08, 0.75, 0.25)
			UI.button({
				Name = "TPLabel", Parent = row,
				Size = UDim2.new(1, -110, 1, 0), Position = UDim2.new(0, 14, 0, 0),
				BackgroundTransparency = 1, Stroke = false,
				Text = string.format("%s  •  %.0f, %.0f, %.0f", p.Name, p.Position.X, p.Position.Y, p.Position.Z),
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13,
				Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
			})
			local tpBtn = UI.button({
				Name = "TPButton", Parent = row,
				Size = UDim2.fromOffset(84, 26), Position = UDim2.new(1, -96, 0.5, -13),
				BackgroundTransparency = 0.1, Text = "Телепорт", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
			})
			UI.basicHover(tpBtn, 0.1, 0.03, 0.6, 0.08)
			tpBtn.MouseButton1Click:Connect(function()
				teleportTo(p.Position)
				log("Телепорт: " .. p.Name)
			end)
			return row
		end
		recBtn.MouseButton1Click:Connect(function()
			local char = player.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			if not root then
				log("Нет персонажа!")
				return
			end
			local nm = trim(nameBox.Text)
			if nm == "" then nm = "Точка " .. (#teleportPoints + 1) end
			local p = {Name = nm, Position = root.Position}
			table.insert(teleportPoints, p)
			makePointRow(p)
			nameBox.Text = ""
			log("Точка записана: " .. nm)
			playSound("silent")
		end)
		for _, p in ipairs(teleportPoints) do
			makePointRow(p)
		end
	end

	TabBuilders.ESP = function(page)
		local list = Mods.ContainerFor("ESP") or UI.createScrollArea(page)
		local fovRow = UI.row(list, 900, 70)
		UI.basicHover(fovRow, 0.1, 0.08, 0.75, 0.3)
		local fovLabel = UI.button({
			Name = "FOVLabel", Parent = fovRow,
			Size = UDim2.new(1, -28, 0, 18), Position = UDim2.new(0, 14, 0, 6),
			BackgroundTransparency = 1, Stroke = false,
			Text = "FOV камеры: " .. math.floor(getFeature("ESP_FOV") or 70),
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		})
		local fovInput = Instance.new("TextBox")
		fovInput.Name = "FOVInput"
		fovInput.Size = UDim2.new(0, 60, 0, 24)
		fovInput.Position = UDim2.new(1, -74, 0, 4)
		fovInput.BackgroundColor3 = currentPalette.element
		fovInput.BackgroundTransparency = 0.1
		fovInput.BorderSizePixel = 0
		fovInput.Text = tostring(math.floor(getFeature("ESP_FOV") or 70))
		fovInput.PlaceholderText = "70"
		fovInput.PlaceholderColor3 = currentPalette.sub
		fovInput.TextColor3 = currentPalette.text
		fovInput.Font = Enum.Font.Gotham
		fovInput.TextSize = 14
		fovInput.TextXAlignment = Enum.TextXAlignment.Center
		fovInput.ClearTextOnFocus = false
		fovInput.Parent = fovRow
		addThemed("element", fovInput)
		addThemed("text", fovInput)
		UI.corner(fovInput, 8)
		UI.stroke(fovInput, 0.6, 1)
		UI.focusFX(fovInput)
		local fovTrack = UI.button({
			Name = "FOVTrack", Parent = fovRow,
			Size = UDim2.new(1, -100, 0, 8), Position = UDim2.new(0, 14, 1, -22),
			BackgroundColor3 = currentPalette.element, BackgroundTransparency = 0.05,
			Text = "", Corner = 8, StrokeTransparency = 0.55, ThemeBackground = "element",
		})
		local fovFill = Instance.new("Frame")
		fovFill.Name = "Fill"
		fovFill.Size = UDim2.new(0, 0, 1, 0)
		fovFill.BackgroundColor3 = currentPalette.text
		fovFill.BorderSizePixel = 0
		fovFill.Parent = fovTrack
		addThemed("accent", fovFill)
		UI.corner(fovFill, 8)
		local fovKnob = Instance.new("Frame")
		fovKnob.Name = "Knob"
		fovKnob.Size = UDim2.fromOffset(14, 14)
		fovKnob.AnchorPoint = Vector2.new(0.5, 0.5)
		fovKnob.Position = UDim2.new(0, 0, 0.5, 0)
		fovKnob.BackgroundColor3 = currentPalette.text
		fovKnob.BorderSizePixel = 0
		fovKnob.Parent = fovTrack
		addThemed("accent", fovKnob)
		UI.corner(fovKnob, 7)
		local currentFOV = getFeature("ESP_FOV") or 70
		local function updateFOV(newValue)
			currentFOV = clamp(newValue, 1, 120)
			local ratio = (currentFOV - 1) / (120 - 1)
			fovFill.Size = UDim2.new(ratio, 0, 1, 0)
			fovKnob.Position = UDim2.new(ratio, 0, 0.5, 0)
			fovLabel.Text = "FOV камеры: " .. math.floor(currentFOV)
			fovInput.Text = tostring(math.floor(currentFOV))
			setFeature("ESP_FOV", math.floor(currentFOV))
			local camera = workspace.CurrentCamera
			if camera then
				local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				local fovTween = TweenService:Create(camera, tweenInfo, {FieldOfView = currentFOV})
				fovTween:Play()
			end
		end
		fovInput.FocusLost:Connect(function(enterPressed)
			local inputValue = tonumber(fovInput.Text)
			if inputValue then
				updateFOV(inputValue)
				log("FOV установлен: " .. math.floor(currentFOV))
			else
				fovInput.Text = tostring(math.floor(currentFOV))
			end
		end)
		local draggingFOV = false
		local function setFOVFromX(x)
			if not fovTrack or not fovTrack.Parent then return end
			local trackX = fovTrack.AbsolutePosition.X
			local trackWidth = fovTrack.AbsoluteSize.X
			if trackWidth <= 0 then return end
			local ratio = clamp((x - trackX) / trackWidth, 0, 1)
			local newFOV = 1 + ratio * (120 - 1)
			updateFOV(newFOV)
		end
		fovTrack.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				draggingFOV = true
				setFOVFromX(input.Position.X)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if draggingFOV then
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					setFOVFromX(input.Position.X)
				end
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				if draggingFOV then draggingFOV = false end
			end
		end)
		fovTrack.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseWheel then
				local delta = input.Position.Z
				local step = 2
				local newFOV = currentFOV + (delta * step)
				updateFOV(newFOV)
			end
		end)
		updateFOV(currentFOV)
	end

	TabBuilders.Target = function(page)
		local list = Mods.ContainerFor("Target") or UI.createScrollArea(page)
	end

	TabBuilders.PVP = function(page)
		local list = Mods.ContainerFor("PVP") or UI.createScrollArea(page)
	end

	TabBuilders.Misc = function(page)
		local list = Mods.ContainerFor("Misc") or UI.createScrollArea(page)
	end


	TabBuilders.Shaders = function(page)
		local list = Mods.ContainerFor("Shaders") or UI.createScrollArea(page)
	end
	TabBuilders.Visual = function(page)
		local list = Mods.ContainerFor("Visual") or UI.createScrollArea(page)
	end


	TabBuilders.Themes = function(page)
		local list = Mods.ContainerFor("Themes") or UI.createScrollArea(page)
		local buildOk, buildErr = pcall(function()
		local paletteState = {
			CustomR = nil, CustomG = nil, CustomB = nil,
			Anim = false, Speed = 0.5,
			Grad1R = 168, Grad1G = 85, Grad1B = 247,
			Grad2R = 80, Grad2G = 200, Grad2B = 255,
		}
		local animatedActive = false
		local animConn = nil

		local function applyCustomAccent(r, g, b)
			local col = Color3.fromRGB(
				clamp(tonumber(r) or 168, 0, 255),
				clamp(tonumber(g) or 85, 0, 255),
				clamp(tonumber(b) or 247, 0, 255)
			)
			if applyTheme then
				local savedTheme = settings.Theme
				local palette = getPalette(savedTheme)
				palette.accent = col
				currentPalette = palette
				if Mods then Mods.SyncColors(palette) end
			end
		end

		local function resetAccent()
			local savedTheme = settings.Theme or "Тёмная"
			local palette = getPalette(savedTheme)
			currentPalette = palette
			if applyTheme then applyTheme(savedTheme) end
			animatedActive = false
			if animConn then animConn:Disconnect(); animConn = nil end
		end

		local function startAnimated(speed, c1, c2)
			animatedActive = true
			if animConn then animConn:Disconnect() end
			local cachedPalette = getPalette(settings.Theme)
			animConn = RunService.RenderStepped:Connect(function()
				if not animatedActive or not paletteState.Anim then return end
				local t = tick()
				local k = (math.sin(t * (tonumber(speed) or 0.5) * math.pi) + 1) / 2
				local mixed = c1:Lerp(c2, k)
				cachedPalette.accent = mixed
				currentPalette = cachedPalette
				if Mods then Mods.SyncColors(cachedPalette) end
			end)
		end

		local function stopAnimated()
			animatedActive = false
			if animConn then animConn:Disconnect(); animConn = nil end
		end

		local headerRow = UI.row(list, 1, 32)
		UI.button({
			Name = "ThemesHeader", Parent = headerRow,
			Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text ="Темы и палитра",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 15,
			Active = false, ThemeText = "text", Font = Enum.Font.GothamBold,
		})

		-- live preview swatch
		local previewRow = UI.row(list, 2, 64)
		local previewSwatch = Instance.new("Frame")
		previewSwatch.Name = "PreviewSwatch"
		previewSwatch.Size = UDim2.new(1, -28, 1, -16)
		previewSwatch.Position = UDim2.new(0, 14, 0, 8)
		previewSwatch.BackgroundColor3 = Mods.Colors.accent
		previewSwatch.BorderSizePixel = 0
		previewSwatch.Parent = previewRow
		addThemed("accent", previewSwatch)
		UI.corner(previewSwatch, 12)
		local pstroke = UI.stroke(previewSwatch, 0.4, 1.5)
		Mods.OnColorChange(function()
			if previewSwatch and previewSwatch.Parent then
				previewSwatch.BackgroundColor3 = Mods.Colors.accent
			end
		end)

		-- Section: Static custom accent
		local secStatic = UI.row(list, 3, 22)
		UI.button({
			Name = "SecStatic", Parent = secStatic,
			Size = UDim2.new(1, -28, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text ="Статичный акцент (RGB)",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13,
			Active = false, ThemeText = "sub", Font = Enum.Font.GothamBold,
		})

		local sliderR = UI.createSlider(list, {Label = "R", Min = 0, Max = 255, Value = paletteState.CustomR or 168, Order = 4, Callback = function(v) paletteState.CustomR = v end})
		local sliderG = UI.createSlider(list, {Label = "G", Min = 0, Max = 255, Value = paletteState.CustomG or 85, Order = 5, Callback = function(v) paletteState.CustomG = v end})
		local sliderB = UI.createSlider(list, {Label = "B", Min = 0, Max = 255, Value = paletteState.CustomB or 247, Order = 6, Callback = function(v) paletteState.CustomB = v end})

		local applyRow = UI.row(list, 7, 38)
		UI.button({
			Name = "ApplyLabel", Parent = applyRow,
			Size = UDim2.new(0.5, -16, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Применить цвет",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		})
		local applyBtn = UI.button({
			Name = "ApplyBtn", Parent = applyRow,
			Size = UDim2.fromOffset(90, 36), Position = UDim2.new(1, -104, 0.5, -18),
			BackgroundTransparency = 0.1, Text = "Применить", TextSize = 12,
			ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.GothamBold, Corner = 10,
		})
		UI.basicHover(applyBtn, 0.1, 0.03, 0.6, 0.08)
		applyBtn.MouseButton1Click:Connect(function()
			stopAnimated()
			applyCustomAccent(paletteState.CustomR, paletteState.CustomG, paletteState.CustomB)
			playSound("silent")
			log("Акцент применён")
		end)

		local resetRow = UI.row(list, 8, 38)
		UI.button({
			Name = "ResetLabel", Parent = resetRow,
			Size = UDim2.new(0.5, -16, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Сброс к теме по умолчанию",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13,
			Active = false, ThemeText = "text", Font = Enum.Font.Gotham,
		})
		local resetBtn = UI.button({
			Name = "ResetBtn", Parent = resetRow,
			Size = UDim2.fromOffset(90, 36), Position = UDim2.new(1, -104, 0.5, -18),
			BackgroundTransparency = 0.1, Text = "Сброс", TextSize = 12,
			ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.GothamBold, Corner = 10,
		})
		UI.basicHover(resetBtn, 0.1, 0.03, 0.6, 0.08)
		resetBtn.MouseButton1Click:Connect(function()
			resetAccent()
			playSound("silent")
			log("Палитра сброшена")
		end)

		-- Section: Animated/gradient accent
		local secAnim = UI.row(list, 9, 22)
		UI.button({
			Name = "SecAnim", Parent = secAnim,
			Size = UDim2.new(1, -28, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text ="Переливающийся акцент",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13,
			Active = false, ThemeText = "sub", Font = Enum.Font.GothamBold,
		})

		local animToggle = UI.createToggle(list, "Включить переливание", false, function(state)
			paletteState.Anim = state
			if state then
				local c1 = Color3.fromRGB(paletteState.Grad1R, paletteState.Grad1G, paletteState.Grad1B)
				local c2 = Color3.fromRGB(paletteState.Grad2R, paletteState.Grad2G, paletteState.Grad2B)
				startAnimated(paletteState.Speed, c1, c2)
			else
				stopAnimated()
				resetAccent()
			end
		end, 10)

		UI.createSlider(list, {Label = "Скорость", Min = 0.1, Max = 3.0, Value = paletteState.Speed, Order = 11, Callback = function(v)
			paletteState.Speed = v
			if paletteState.Anim then
				local c1 = Color3.fromRGB(paletteState.Grad1R, paletteState.Grad1G, paletteState.Grad1B)
				local c2 = Color3.fromRGB(paletteState.Grad2R, paletteState.Grad2G, paletteState.Grad2B)
				startAnimated(paletteState.Speed, c1, c2)
			end
		end})

		local secGrad1 = UI.row(list, 12, 22)
		UI.button({
			Name = "SecGrad1", Parent = secGrad1,
			Size = UDim2.new(1, -28, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Цвет A",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
			Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
		})
		UI.createSlider(list, {Label = "  R", Min = 0, Max = 255, Value = paletteState.Grad1R, Order = 13, Callback = function(v) paletteState.Grad1R = v end})
		UI.createSlider(list, {Label = "  G", Min = 0, Max = 255, Value = paletteState.Grad1G, Order = 14, Callback = function(v) paletteState.Grad1G = v end})
		UI.createSlider(list, {Label = "  B", Min = 0, Max = 255, Value = paletteState.Grad1B, Order = 15, Callback = function(v) paletteState.Grad1B = v end})

		local secGrad2 = UI.row(list, 16, 22)
		UI.button({
			Name = "SecGrad2", Parent = secGrad2,
			Size = UDim2.new(1, -28, 1, 0), Position = UDim2.new(0, 14, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Цвет B",
			TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
			Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
		})
		UI.createSlider(list, {Label = "  R", Min = 0, Max = 255, Value = paletteState.Grad2R, Order = 17, Callback = function(v) paletteState.Grad2R = v end})
		UI.createSlider(list, {Label = "  G", Min = 0, Max = 255, Value = paletteState.Grad2G, Order = 18, Callback = function(v) paletteState.Grad2G = v end})
		UI.createSlider(list, {Label = "  B", Min = 0, Max = 255, Value = paletteState.Grad2B, Order = 19, Callback = function(v) paletteState.Grad2B = v end})

		local hintRow = UI.row(list, 20, 36)
		UI.button({
			Name = "HintLabel", Parent = hintRow,
			Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0),
			BackgroundTransparency = 1, Stroke = false,
			Text = "Акцент применяется к UI, ESP, трейлу, паллетам, рамкам и другим элементам, использующим Mods.Colors.accent.",
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Center,
			TextSize = 11,
			Active = false, ThemeText = "sub", Font = Enum.Font.Gotham,
		})
	end) -- pcall Themes body
		if not buildOk then
			warn("[Fosfor] Themes tab build error:", buildErr)
			if addConsoleLine then addConsoleLine("Темы: ошибка построения —".. tostring(buildErr),"error") end
		end
	end

	TabBuilders.Maps = function(page)
		local list = Mods.ContainerFor("Maps") or UI.createScrollArea(page)
	end

	TabBuilders.Settings = function(page)
		local list = Mods.ContainerFor("Settings") or UI.createScrollArea(page)
		local themeRow = UI.row(list, 900, 38)
		UI.basicHover(themeRow, 0.1, 0.08, 0.75, 0.3)
		UI.button({Name = "ThemeLabel", Parent = themeRow, Size = UDim2.new(1, -220, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Stroke = false, Text = "Тема оформления", TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14, Active = false, ThemeText = "text", Font = Enum.Font.Gotham})
		local darkThemeButton = UI.button({Name = "DarkThemeButton", Parent = themeRow, Size = UDim2.fromOffset(84, 26), Position = UDim2.new(1, -190, 0.5, -13), Text = "Тёмная", TextSize = 13, BackgroundTransparency = 0.1, ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham})
		local lightThemeButton = UI.button({Name = "LightThemeButton", Parent = themeRow, Size = UDim2.fromOffset(84, 26), Position = UDim2.new(1, -98, 0.5, -13), Text = "Светлая", TextSize = 13, BackgroundTransparency = 0.1, ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham})
		themeButtons = {["Тёмная"] = darkThemeButton, ["Светлая"] = lightThemeButton}
		updateThemeButtons = function()
			for themeName, button in pairs(themeButtons) do
				if settings.Theme == themeName then
					button.BackgroundColor3 = currentPalette.text
					button.TextColor3 = currentPalette.bg
					button.BackgroundTransparency = 0
				else
					button.BackgroundColor3 = currentPalette.element
					button.TextColor3 = currentPalette.text
					button.BackgroundTransparency = 0.1
				end
			end
		end
		darkThemeButton.MouseButton1Click:Connect(function() if setTheme then setTheme("Тёмная") end end)
		lightThemeButton.MouseButton1Click:Connect(function() if setTheme then setTheme("Светлая") end end)
		updateThemeButtons()
		UI.createSlider(list, {Label = "Прозрачность окна", Min = 0, Max = 100, Value = math.floor(settings.WindowTransparency * 100), Order = 901, Callback = function(value) setWindowTransparency(value / 100) end})
		UI.createToggle(list, "Звуки", settings.Sounds, function(state) settings.Sounds = state log("Звуки: " .. (state and "включены" or "выключены")) end, 902)
		UI.createToggle(list, "Анимации", settings.Animations, function(state) settings.Animations = state log("Анимации: " .. (state and "включены" or "выключены")) end, 903)
		local langRow = UI.row(list, 904, 38)
		UI.basicHover(langRow, 0.1, 0.08, 0.75, 0.3)
		UI.button({Name = "LangLabel", Parent = langRow, Size = UDim2.new(1, -220, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Stroke = false, Text = "Язык / Language", TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14, Active = false, ThemeText = "text", Font = Enum.Font.Gotham})
		local ruButton = UI.button({Name = "RUButton", Parent = langRow, Size = UDim2.fromOffset(84, 26), Position = UDim2.new(1, -190, 0.5, -13), Text = "Русский", TextSize = 13, BackgroundTransparency = 0.1, ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham})
		local enButton = UI.button({Name = "ENButton", Parent = langRow, Size = UDim2.fromOffset(84, 26), Position = UDim2.new(1, -98, 0.5, -13), Text = "English", TextSize = 13, BackgroundTransparency = 0.1, ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham})
		local function updateLangButtons()
			ruButton.BackgroundColor3 = (currentLang == "RU") and currentPalette.text or currentPalette.element
			ruButton.TextColor3 = (currentLang == "RU") and currentPalette.bg or currentPalette.text
			ruButton.BackgroundTransparency = (currentLang == "RU") and 0 or 0.1
			enButton.BackgroundColor3 = (currentLang == "EN") and currentPalette.text or currentPalette.element
			enButton.TextColor3 = (currentLang == "EN") and currentPalette.bg or currentPalette.text
			enButton.BackgroundTransparency = (currentLang == "EN") and 0 or 0.1
		end
		ruButton.MouseButton1Click:Connect(function() setLanguage("RU") updateLangButtons() end)
		enButton.MouseButton1Click:Connect(function() setLanguage("EN") updateLangButtons() end)
		updateLangButtons()
		local defaultsRow = UI.row(list, 905, 44)
		UI.basicHover(defaultsRow, 0.1, 0.08, 0.75, 0.3)
		UI.button({Name = "DefaultsLabel", Parent = defaultsRow, Size = UDim2.new(1, -96, 1, -14), Position = UDim2.new(0, 14, 0, 4), BackgroundTransparency = 1, Stroke = false, Text = "Убрать настройки по умолчанию", TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14, Active = false, ThemeText = "text", Font = Enum.Font.Gotham})
		UI.button({Name = "DefaultsHint", Parent = defaultsRow, Size = UDim2.new(1, -96, 0, 12), Position = UDim2.new(0, 14, 1, -14), BackgroundTransparency = 1, Stroke = false, Text = "не даёт хабу включать стартовый набор при запуске", TextXAlignment = Enum.TextXAlignment.Left, TextSize = 10, Active = false, ThemeText = "dim", Font = Enum.Font.Gotham})
		UI.createToggle(defaultsRow, "", getFeature("Fosfor_NoDefaults") == true, function(state)
			setFeature("Fosfor_NoDefaults", state)
			if state then
				log("Стартовый набор по умолчанию отключён (уже включённое сейчас — не трогаем)")
			else
				log("Стартовый набор вернётся при следующем запуске")
			end
		end, 1)
	end

	TabBuilders.CFG = function(page)
		local HttpService = game:GetService("HttpService")
		local CFG_DIR = "FosforConfigs"
		local canFS = (typeof(writefile) == "function" and typeof(readfile) == "function" and typeof(listfiles) == "function")
		pcall(function()
			if canFS and typeof(isfile) == "function" and typeof(makefolder) == "function" and not isfile(CFG_DIR) then
				makefolder(CFG_DIR)
			end
		end)
		local selected = nil
		local statusLabel = nil
		local listContainer = nil
		local function setStatus(text)
			if statusLabel then statusLabel.Text = text end
			if addConsoleLine then addConsoleLine("CFG: " .. text, "sub") end
		end
		local function cfgPath(name) return CFG_DIR .. "/" .. name .. ".fosfor.txt" end
		local function listConfigs()
			local out = {}
			if not canFS then return out end
			pcall(function()
				for _, path in ipairs(listfiles()) do
					local nm = tostring(path):match("[/\\]([^/\\]+)%.fosfor%.txt$")
					if nm then table.insert(out, nm) end
				end
			end)
			table.sort(out)
			return out
		end
		local function applyState(data)
			if type(data) ~= "table" or type(data.mods) ~= "table" then return false, "битый формат" end
			for _, mod in ipairs(Mods.All()) do
				local d = data.mods[mod.Id]
				if d then
					pcall(function()
						if type(d.state) == "table" then
							for k, v in pairs(d.state) do mod.State[k] = v end
						end
						if d.enabled and not mod.Enabled then
							Mods.Enable(mod)
						elseif not d.enabled and mod.Enabled then
							Mods.Disable(mod)
						else
							setFeature("FosforMod_" .. mod.Id, {enabled = mod.Enabled, state = mod.State})
						end
						if mod._masterToggle and mod._masterToggle.update then
							if mod._masterToggle.state ~= mod.Enabled then mod._masterToggle.state = mod.Enabled end
							mod._masterToggle.update()
						end
						if mod._subRows then
							for _, r in ipairs(mod._subRows) do
								if r and r.Parent then r.Visible = mod.Enabled end
							end
						end
					end)
				end
			end
			return true
		end
		local function refreshList()
			if not listContainer then return end
			for _, c in ipairs(listContainer:GetChildren()) do
				if c:IsA("TextButton") then c:Destroy() end
			end
			local names = listConfigs()
			if #names == 0 then
				UI.button({Name = "CfgEmpty", Parent = listContainer, Size = UDim2.new(1, 0, 0, 26), BackgroundTransparency = 1, Stroke = false, Text = canFS and "пока нет сохранённых КФГ" or "файловая система исполнителя недоступна", TextSize = 12, ThemeText = "dim", Active = false})
			end
			for order, name in ipairs(names) do
				local btn = UI.button({Name = "Cfg_" .. name, Parent = listContainer, Size = UDim2.new(1, 0, 0, 26), BackgroundTransparency = 0.15, Text = name, TextSize = 13, ThemeBackground = "element", ThemeText = "text", LayoutOrder = order})
				btn.MouseButton1Click:Connect(function()
					selected = name
					setStatus("выбрана: " .. name)
					for _, c in ipairs(listContainer:GetChildren()) do
						if c:IsA("TextButton") and c ~= btn then c.BackgroundTransparency = 0.15 end
					end
					btn.BackgroundTransparency = 0
				end)
			end
		end
		-- заголовок
		UI.button({Name = "CfgTitle", Parent = page, Size = UDim2.new(1, -24, 0, 22), Position = UDim2.new(0, 12, 0, 10), BackgroundTransparency = 1, Stroke = false, Text = "Менеджер КФГ: сохраняй, грузи, делись настройками", TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14, Active = false, ThemeText = "text", Font = Enum.Font.GothamBold})
		-- строка имени
		local nameRow = Instance.new("Frame")
		nameRow.Size = UDim2.new(1, -24, 0, 30)
		nameRow.Position = UDim2.new(0, 12, 0, 36)
		nameRow.BackgroundTransparency = 1
		nameRow.Parent = page
		local nameBox = Instance.new("TextBox")
		nameBox.Size = UDim2.new(1, -200, 1, 0)
		nameBox.BackgroundColor3 = currentPalette.element
		nameBox.BackgroundTransparency = 0.1
		nameBox.BorderSizePixel = 0
		nameBox.Text = ""
		nameBox.PlaceholderText = "название КФГ..."
		nameBox.PlaceholderColor3 = currentPalette.sub
		nameBox.TextColor3 = currentPalette.text
		nameBox.Font = Enum.Font.Gotham
		nameBox.TextSize = 14
		nameBox.TextXAlignment = Enum.TextXAlignment.Left
		nameBox.ClearTextOnFocus = false
		nameBox.Parent = nameRow
		addThemed("element", nameBox)
		addThemed("text", nameBox)
		UI.corner(nameBox, 10)
		UI.stroke(nameBox, 0.6, 1)
		UI.padding(nameBox, 10, 6, 0, 0)
		UI.focusFX(nameBox)
		local collectStateTable = function()
			local data = {mods = {}}
			for _, mod in ipairs(Mods.All()) do
				data.mods[mod.Id] = {enabled = mod.Enabled == true, state = mod.State}
			end
			return data
		end
		local function saveCfg()
			local name = trim(nameBox.Text)
			if name == "" then setStatus("введи название КФГ") return end
			if not canFS then setStatus("writefile недоступен в этом исполнителе") return end
			local ok, err = pcall(function()
				writefile(cfgPath(name), HttpService:JSONEncode(collectStateTable()))
			end)
			if ok then setStatus("сохранено: " .. name) refreshList() else setStatus("ошибка записи: " .. tostring(err)) end
		end
		local saveBtn = UI.button({Name = "SaveBtn", Parent = nameRow, Size = UDim2.fromOffset(92, 28), Position = UDim2.new(1, -188, 0, 1), BackgroundTransparency = 0.1, Text = "Сохранить", TextSize = 12, ThemeBackground = "element", ThemeText = "text"})
		UI.basicHover(saveBtn, 0.1, 0.03, 0.6, 0.08)
		saveBtn.MouseButton1Click:Connect(saveCfg)
		local copyBtn = UI.button({Name = "CopyBtn", Parent = nameRow, Size = UDim2.fromOffset(84, 28), Position = UDim2.new(1, -92, 0, 1), BackgroundTransparency = 0.1, Text = "Копировать", TextSize = 12, ThemeBackground = "element", ThemeText = "text"})
		UI.basicHover(copyBtn, 0.1, 0.03, 0.6, 0.08)
		copyBtn.MouseButton1Click:Connect(function()
			pcall(function() setclipboard(HttpService:JSONEncode(collectStateTable())) end)
			setStatus("текущие настройки в буфере обмена")
		end)
		-- список КФГ
		local listFrame = Instance.new("Frame")
		listFrame.Position = UDim2.new(0, 12, 0, 74)
		listFrame.Size = UDim2.new(1, -24, 1, -236)
		listFrame.BackgroundColor3 = currentPalette.consoleBG
		listFrame.BackgroundTransparency = 0.04
		listFrame.BorderSizePixel = 0
		listFrame.Parent = page
		addThemed("consoleBg", listFrame)
		UI.corner(listFrame, 14)
		UI.stroke(listFrame, 0.35, 1)
		local listScroll = Instance.new("ScrollingFrame")
		listScroll.Size = UDim2.fromScale(1, 1)
		listScroll.BackgroundTransparency = 1
		listScroll.BorderSizePixel = 0
		listScroll.ScrollBarThickness = 3
		listScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
		listScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
		listScroll.Parent = listFrame
		listContainer = Instance.new("Frame")
		listContainer.Size = UDim2.new(1, 0, 0, 0)
		listContainer.AutomaticSize = Enum.AutomaticSize.Y
		listContainer.BackgroundTransparency = 1
		listContainer.Parent = listScroll
		local listLayout = Instance.new("UIListLayout")
		listLayout.Padding = UDim.new(0, 4)
		listLayout.SortOrder = Enum.SortOrder.LayoutOrder
		listLayout.Parent = listContainer
		UI.padding(listContainer, 10, 10, 8, 8)
		-- кнопки управления
		local ctrlRow = Instance.new("Frame")
		ctrlRow.Position = UDim2.new(0, 12, 1, -156)
		ctrlRow.Size = UDim2.new(1, -24, 0, 30)
		ctrlRow.BackgroundTransparency = 1
		ctrlRow.Parent = page
		local function ctrlBtn(text, offset, cb)
			local b = UI.button({Name = "Ctrl_" .. text, Parent = ctrlRow, Size = UDim2.new(0.25, -6, 1, 0), Position = UDim2.new(offset, 0, 0, 0), BackgroundTransparency = 0.1, Text = text, TextSize = 12, ThemeBackground = "element", ThemeText = "text"})
			UI.basicHover(b, 0.1, 0.03, 0.6, 0.08)
			b.MouseButton1Click:Connect(cb)
			return b
		end
		ctrlBtn("Загрузить", 0, function()
			if not selected then setStatus("сначала выбери КФГ в списке") return end
			if not canFS then setStatus("файловая система недоступна") return end
			local ok, res = pcall(function() return HttpService:JSONDecode(readfile(cfgPath(selected))) end)
			if ok then
				local applied = applyState(res)
				setStatus(applied == true and ("загружено: " .. selected) or ("ошибка: " .. tostring(res)))
			else
				setStatus("не удалось прочитать: " .. tostring(res))
			end
		end)
		ctrlBtn("Удалить", 0.25, function()
			if not selected then setStatus("сначала выбери КФГ в списке") return end
			if canFS and typeof(delfile) == "function" then
				pcall(function() delfile(cfgPath(selected)) end)
				setStatus("удалено: " .. selected)
				selected = nil
				refreshList()
			end
		end)
		ctrlBtn("Обновить", 0.5, function() refreshList() setStatus("список обновлён") end)
		ctrlBtn("По умолчанию", 0.75, function()
			for _, mod in ipairs(Mods.All()) do
				pcall(function() Mods.Disable(mod) end)
			end
			setStatus("все модули выключены (дефолт)")
		end)
		-- вставка КФГ
		local pasteBox = Instance.new("TextBox")
		pasteBox.Position = UDim2.new(0, 12, 1, -120)
		pasteBox.Size = UDim2.new(1, -24, 0, 56)
		pasteBox.BackgroundColor3 = currentPalette.element
		pasteBox.BackgroundTransparency = 0.1
		pasteBox.BorderSizePixel = 0
		pasteBox.Text = ""
		pasteBox.PlaceholderText = "вставь JSON чужой КФГ сюда..."
		pasteBox.PlaceholderColor3 = currentPalette.sub
		pasteBox.TextColor3 = currentPalette.text
		pasteBox.Font = Enum.Font.Code
		pasteBox.TextSize = 12
		pasteBox.TextXAlignment = Enum.TextXAlignment.Left
		pasteBox.TextYAlignment = Enum.TextYAlignment.Top
		pasteBox.TextWrapped = true
		pasteBox.ClearTextOnFocus = false
		pasteBox.Parent = page
		addThemed("element", pasteBox)
		addThemed("text", pasteBox)
		UI.corner(pasteBox, 12)
		UI.stroke(pasteBox, 0.6, 1)
		UI.padding(pasteBox, 10, 8, 6, 6)
		local pasteRow = Instance.new("Frame")
		pasteRow.Position = UDim2.new(0, 12, 1, -58)
		pasteRow.Size = UDim2.new(1, -24, 0, 30)
		pasteRow.BackgroundTransparency = 1
		pasteRow.Parent = page
		local applyPasteBtn = UI.button({Name = "ApplyPaste", Parent = pasteRow, Size = UDim2.new(0.5, -6, 1, 0), BackgroundTransparency = 0.1, Text = "Применить вставленное", TextSize = 12, ThemeBackground = "element", ThemeText = "text"})
		UI.basicHover(applyPasteBtn, 0.1, 0.03, 0.6, 0.08)
		applyPasteBtn.MouseButton1Click:Connect(function()
			local text = trim(pasteBox.Text)
			if text == "" then setStatus("пусто") return end
			local ok, data = pcall(function() return HttpService:JSONDecode(text) end)
			if not ok then setStatus("не JSON: " .. tostring(data)) return end
			local applied = applyState(data)
			setStatus(applied == true and "вставленная КФГ применена" or ("ошибка: " .. tostring(data)))
		end)
		statusLabel = UI.button({Name = "CfgStatus", Parent = pasteRow, Size = UDim2.new(0.5, 0, 1, 0), Position = UDim2.new(0.5, 6, 0, 0), BackgroundTransparency = 1, Stroke = false, Text = "готово", TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12, Active = false, ThemeText = "sub"})
		refreshList()
	end

	-- ============================================================
	-- ЧАСТЬ 6: ЗАЩИТА (только самозащита: без атак и без обхода античита)
	-- ============================================================
	-- ============================================================
	-- МОДУЛЬ: AEGIS-2 (единая сессия-FSM самозащиты)
	-- FSM: IDLE -> ENGAGED -> ESCAPE -> SAFE -> IDLE. Одно окно на сессию.
	-- Инварианты: якорь только при опоре; жёсткий TP <= 1/3 c; заморозки
	-- off при probe-окне; ресет только после unfreeze; struggle без КД;
	-- свипы каждый кадр; anti-void внутри held без вертикального TP.
	-- ============================================================
	Mods.Register({
		Id = "AegisCore",
		Tab = "Defence",
		Name = "AEGIS-2",
		Defaults = {["Телеметрия"] = false, ["Авто-уход из спавна"] = true, ["Чистка FireAllRemotes"] = true},
		Build = function(self, u)
			u.Section("Единая сессия-FSM: IDLE-ENGAGED-ESCAPE-SAFE")
			self._masterToggle = u.Toggle("AEGIS-2 (полная самозащита)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Телеметрия", self.State["Телеметрия"] ~= false, function() end))
			subAdd(self, u.Toggle("Авто-уход из спавна", self.State["Авто-уход из спавна"] ~= false, function() end))
			subAdd(self, u.Toggle("Чистка FireAllRemotes", self.State["Чистка FireAllRemotes"] ~= false, function() end))
			subShow(self, self.Enabled or self._wantEnabled == true)
			local bbRow = subAdd(self, {row = u.Row(42)}).row
			local bbCaption = Instance.new("TextLabel")
			bbCaption.Size = UDim2.new(1, -140, 1, 0)
			bbCaption.Position = UDim2.new(0, 14, 0, 0)
			bbCaption.BackgroundTransparency = 1
			bbCaption.Text = "Телеметрия в файл:"
			bbCaption.TextColor3 = currentPalette.text
			bbCaption.Font = Enum.Font.Gotham
			bbCaption.TextSize = 14
			bbCaption.TextXAlignment = Enum.TextXAlignment.Left
			bbCaption.Parent = bbRow
			addThemed("text", bbCaption)
			local bbBtn = UI.button({
				Name = "BlackboxFlush", Parent = bbRow,
				Size = UDim2.fromOffset(118, 28), Position = UDim2.new(1, -128, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Сбросить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Corner = 10,
			})
			UI.basicHover(bbBtn, 0.1, 0.03, 0.6, 0.08)
			bbBtn.MouseButton1Click:Connect(function()
				local ok = self:Flush()
				log(ok and "AEGIS: blackbox сброшен в FosforBlackbox.log" or "AEGIS: writefile недоступен", "info")
			end)
		end,
		Blackbox = function(self, tag)
			local bb = self._bb
			if not bb then bb = {} self._bb = bb end
			table.insert(bb, string.format("%.2f %s", tick() % 10000, tostring(tag)))
			while #bb > 300 do table.remove(bb, 1) end
		end,
		Flush = function(self)
			if typeof(writefile) ~= "function" then return false end
			local ok = pcall(function()
				writefile("FosforBlackbox.log", table.concat(self._bb or {}, "\n"))
			end)
			return ok
		end,
		Grounded = function(self, hum)
			return hum ~= nil and hum.FloorMaterial ~= Enum.Material.Air
		end,
		IsHeldNow = function(self, char)
			local ok, held = pcall(function()
				local ih = player:FindFirstChild("IsHeld")
				if ih and ih.Value then return true end
				for _, p in ipairs(char:GetChildren()) do
					if p:IsA("BasePart") and p:FindFirstChild("PartOwner") then return true end
				end
				return false
			end)
			return ok and held or false
		end,
		ProbeActive = function(self)
			return tick() < (self.ProbeUntil or 0)
		end,
		Mark = function(self, key)
			if self.Fsm == "IDLE" then
				self.Fsm = "ENGAGED"
				self.SessStart = tick()
				self.LastSeen = tick()
				self.ResetUsed = false
				self.TpFails = 0
				self.L1Used = false
				self.L2Used = false
				self.DisengageFails = 0
				self.LastVectorKey = key
				self._tpDone = nil
				if not self.NotifiedSession then
					self.NotifiedSession = true
					notify("AEGIS: атака обнаружена — держим удар")
				end
				self:Blackbox("S:ENGAGED:" .. tostring(key))
			else
				-- F7: новый вектор в сессии — лестница эскалации заново
				if key ~= self.LastVectorKey then
					self.L1Used = false
					self.L2Used = false
					self.DisengageFails = 0
					self._tpDone = nil
					self:Blackbox("S:LADDER-REFRESH:" .. tostring(key))
				end
				self.LastVectorKey = key
				self.LastSeen = tick()
			end
		end,
		HardTP = function(self, cf)
			local now = tick()
			if now - (self.LastHardTP or 0) < 3 then return false end
			self.LastHardTP = now
			_G.FosforTP = now
			local hrp = Lib.rootOf(player.Character)
			if hrp then hrp.CFrame = cf end
			self:Blackbox("TP:hard")
			return true
		end,
		SoftTP = function(self, target)
			local hrp = Lib.rootOf(player.Character)
			if not hrp or not hrp.Parent then return true end
			-- B5: цель обязана пройти санити, иначе фолбэк
			local tcf = self:SanityCF(CFrame.new(target or Vector3.zero)) or self:FallbackSafe(hrp)
			local tpos = tcf.Position
			local dist = (hrp.Position - tpos).Magnitude
			if dist < 6 then return true end
			-- B5: один запуск = ограниченный коридор шагов, не вечный догон
			local steps = 0
			while dist >= 6 and steps < 400 and hrp.Parent do
				steps = steps + 1
				_G.FosforTP = tick()
				if steps % 5 == 0 then
					-- B2: перекрываем владение и гасим скорость на маршруте
					pcall(function()
						self.RS.GrabEvents.SetNetworkOwner:FireServer(hrp, hrp.CFrame)
						hrp.AssemblyLinearVelocity = Vector3.zero
					end)
				end
				local step = math.min(28, dist)
				hrp.CFrame = CFrame.new(hrp.Position + (tpos - hrp.Position).Unit * step)
				dist = (hrp.Position - tpos).Magnitude
			end
			if dist >= 6 then
				self:Blackbox("TP:FAIL:" .. math.floor(dist))
				return false
			end
			self:Blackbox("TP:soft:" .. steps)
			return true
		end,
		-- B5: санити цели: NaN, гигантские координаты и подземный Y запрещены
		SanityCF = function(self, cf)
			if typeof(cf) ~= "CFrame" then return nil end
			local ok, pos = pcall(function() return cf.Position end)
			if not ok or typeof(pos) ~= "Vector3" then return nil end
			if pos.X ~= pos.X or pos.Y ~= pos.Y or pos.Z ~= pos.Z then return nil end
			if math.abs(pos.X) > 2000 or math.abs(pos.Z) > 2000 then return nil end
			if pos.Y <= -120 or pos.Y >= 500 then return nil end
			return cf
		end,
		-- B5: фолбэк-цель: последняя заземлённая точка, иначе центр карты
		FallbackSafe = function(self, root)
			if self.LastGround then
				local g = self:SanityCF(CFrame.new(self.LastGround))
				if g then return g end
			end
			return CFrame.new(0, 10, 0)
		end,
		-- B1+B2: один TP-запуск на ESCAPE: held -> FullDisengage + hard-TP, иначе мягкий коридор
		EscapeTP = function(self, char, hrp)
			if self._tpBusy then return end
			self._tpBusy = true
			task.spawn(function()
				pcall(function()
					local raw = CFrame.new(self.SafeTarget or Vector3.zero)
					local target = self:SanityCF(raw) or self:FallbackSafe(hrp)
					if self:IsHeldNow(char) then
						self:FullDisengage(char, hrp)
						_G.FosforTP = tick()
						hrp.CFrame = target
						self:Blackbox("TP:hard")
					else
						local tpos = target.Position
						local dist = (hrp.Position - tpos).Magnitude
						local steps = 0
						while dist >= 6 and steps < 400 and hrp.Parent do
							steps = steps + 1
							_G.FosforTP = tick()
							if steps % 5 == 0 then
								pcall(function()
									self.RS.GrabEvents.SetNetworkOwner:FireServer(hrp, hrp.CFrame)
									hrp.AssemblyLinearVelocity = Vector3.zero
								end)
							end
							local step = math.min(28, dist)
							hrp.CFrame = CFrame.new(hrp.Position + (tpos - hrp.Position).Unit * step)
							dist = (hrp.Position - tpos).Magnitude
						end
						if dist >= 6 then
							self:Blackbox("TP:FAIL:" .. math.floor(dist))
						else
							self:Blackbox("TP:soft:" .. steps)
						end
					end
					self._tpDone = true
				end)
				self._tpBusy = false
			end)
		end,
		SpawnPos = function(self)
			local ok, sp = pcall(function()
				local s = workspace:FindFirstChildWhichIsA("SpawnLocation", true)
				return s and s.Position or nil
			end)
			return ok and sp or nil
		end,
		OwnPlotPos = function(self)
			local ok, pos = pcall(function()
				local plots = workspace:FindFirstChild("Plots")
				if not plots then return nil end
				for _, plot in ipairs(plots:GetChildren()) do
					local sign = plot:FindFirstChild("PlotSign")
					local owners = sign and sign:FindFirstChild("ThisPlotsOwners")
					if owners then
						for _, b in ipairs(owners:GetChildren()) do
							if typeof(b.Value) == "string" and b.Value == player.Name then
								local barrier = plot:FindFirstChild("Barrier")
								local pb = barrier and barrier:FindFirstChild("PlotBarrier")
								if pb and pb:IsA("BasePart") and pb.CanCollide == false then
									return nil -- V1: барьер сломан, плот больше не сейв-зона
								end
								local p = plot:GetPivot().Position
								return Vector3.new(p.X, p.Y + 4, p.Z)
							end
						end
					end
				end
				return nil
			end)
			return ok and pos or nil
		end,
		SafeZoneTarget = function(self)
			local plot = self:OwnPlotPos()
			if plot then return plot end
			local spawnPos = self:SpawnPos()
			local hrp = Lib.rootOf(player.Character)
			local my = hrp and hrp.Position or Vector3.zero
			if spawnPos then
				local dir = my - spawnPos
				dir = Vector3.new(dir.X, 0, dir.Z)
				if dir.Magnitude < 1 then dir = Vector3.new(1, 0, 1) end
				local t = spawnPos + dir.Unit * 90
				return Vector3.new(t.X, math.max(my.Y, spawnPos.Y + 3), t.Z)
			end
			return my + Vector3.new(0, 60, 0)
		end,
		Unfreeze = function(self, char)
			pcall(function()
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if hrp then
					hrp.Anchored = false
					hrp.AssemblyLinearVelocity = Vector3.zero
					hrp.AssemblyAngularVelocity = Vector3.zero
				end
				if hum then
					hum.PlatformStand = false
					hum.Sit = false
					pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
				end
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA("BasePart") then
						d.CanCollide = true
						d.CanTouch = true
						d.CanQuery = true
					end
				end
			end)
			self:Blackbox("UNFREEZE")
		end,
		ResetSelf = function(self, char, reason)
			if self.ResetUsed then return end
			self.ResetUsed = true
			self.L2Used = true
			-- протокол: СНАЧАЛА unfreeze, ПОТОМ смерть (иначе hang-сигнатура переживает респавн)
			self:Unfreeze(char)
			self:Blackbox("RST:" .. tostring(reason))
			log("AEGIS: не удалось отбиться — чистый ресет (" .. tostring(reason) .. ")")
			pcall(function() char:BreakJoints() end)
			pcall(function()
				local hum = char:FindFirstChildOfClass("Humanoid")
				if hum then hum.Health = 0 end
			end)
		end,
		Sweep = function(self, char, hum)
			pcall(function()
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA("WeldConstraint") or d:IsA("Weld") then
						local p0, p1 = d.Part0, d.Part1
						local foreign = (p0 and not p0:IsDescendantOf(char)) or (p1 and not p1:IsDescendantOf(char))
						local seat = hum and hum.SeatPart
						local ownSeat = (d.Name == "SeatWeld") or (seat and (p0 == seat or p1 == seat))
						if d.Name ~= "WeldHRP" and not ownSeat and (d.Name == "StickyWeld" or foreign) then
							d:Destroy()
							self:Blackbox("W:weld:" .. d.Name)
							self:Mark("weld")
						end
					elseif d:IsA("BodyPosition") or d:IsA("BodyGyro") or d:IsA("BodyVelocity") or d:IsA("BodyAngularVelocity")
						or d:IsA("AlignPosition") or d:IsA("AlignOrientation") or d:IsA("LinearVelocity") or d:IsA("AngularVelocity") then
						d:Destroy()
						self:Blackbox("W:mover:" .. d.Name)
						self:Mark("mover")
					elseif d:IsA("Motor6D") and (d.Enabled == false or d.Part0 == nil) then
						pcall(function() d.Enabled = true end)
						self:Blackbox("W:motor6d")
						self:Mark("limb")
					end
				end
			end)
		end,
		HeavyHeld = function(self, hrp)
			local now = tick()
			if now - (self.LastHeavy or 0) < 0.2 then return end
			self.LastHeavy = now
			pcall(function() self.RS.CharacterEvents.DestroyGrabLine:FireServer(hrp) end)
			pcall(function() self.RS.GameCorrectionEvents.StopAllVelocity:FireServer() end)
			pcall(function() self.RS.CharacterEvents.RagdollRemote:FireServer(hrp, 0) end)
			pcall(function() self.RS.GrabEvents.SetNetworkOwner:FireServer(hrp, hrp.CFrame) end)
			self:Blackbox("W:heavy-held")
		end,
		FullDisengage = function(self, char, hrp)
			-- B3: рвём владение по ВСЕМ частям (figure grab держит конечности), не только HRP
			pcall(function()
				for _ = 1, 20 do
					self.RS.CharacterEvents.Struggle:FireServer(player)
				end
			end)
			pcall(function()
				for _, p in ipairs(char:GetChildren()) do
					if p:IsA("BasePart") then
						self.RS.CharacterEvents.DestroyGrabLine:FireServer(p)
					end
				end
			end)
			pcall(function()
				for _, p in ipairs(char:GetChildren()) do
					if p:IsA("BasePart") then
						self.RS.GrabEvents.SetNetworkOwner:FireServer(p, p.CFrame)
					end
				end
			end)
			pcall(function()
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA("Motor6D") and (d.Enabled == false or d.Part0 == nil) then
						d.Enabled = true
					end
				end
			end)
			pcall(function() self:Sweep(char, char:FindFirstChildOfClass("Humanoid")) end)
			pcall(function()
				for _ = 1, 3 do
					self.RS.GameCorrectionEvents.StopAllVelocity:FireServer()
					self.RS.CharacterEvents.RagdollRemote:FireServer(hrp, 0)
				end
			end)
			self:Blackbox("S:FULL-DISENGAGE")
		end,
		HookProbe = function(self, char)
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			pcall(function()
				local anim = hum:FindFirstChildOfClass("Animator")
				if anim then
					Mods.Connect(self, anim.AnimationPlayed:Connect(function(track)
						if track and track.Animation and track.Animation.AnimationId == "rbxassetid://7047322890" then
							if not self:IsHeldNow(char) then
								self.ProbeUntil = tick() + 3
								self:Blackbox("PROBE:anim")
							end
						end
					end))
				end
			end)
			local head = char:FindFirstChild("Head")
			if head then
				Mods.Connect(self, head.ChildAdded:Connect(function(c)
					if c.Name == "PartOwner" then self._poAdded = tick() end
				end))
				Mods.Connect(self, head.ChildRemoved:Connect(function(c)
					if c.Name == "PartOwner" and self._poAdded then
						if tick() - self._poAdded < 0.8 then
							self.ProbeUntil = tick() + 3
							self:Blackbox("PROBE:po")
						end
						local now = tick()
						table.insert(self.LoopWindow, now)
						local keep = {}
						for _, t in ipairs(self.LoopWindow) do
							if now - t <= 4 then table.insert(keep, t) end
						end
						self.LoopWindow = keep
						if #self.LoopWindow >= 3 then
							self:Blackbox("LG:" .. #self.LoopWindow)
							self:Mark("loopgrab")
						end
					end
				end))
			end
		end,
		OnEnable = function(self)
			self.RS = game:GetService("ReplicatedStorage")
			self.Fsm = "IDLE"
			self.SessStart = 0
			self.LastSeen = 0
			self.TpFails = 0
			self.ResetUsed = false
			self.NotifiedSession = false
			self.ProbeUntil = 0
			self.LoopWindow = {}
			self._ySamples = nil
			self.LastHardTP = 0
			self.LastHeavy = 0
			self.LastHealth = nil
			self.LastHealthAt = 0
			self._frame = 0
			self.L1Used = false
			self.L2Used = false
			self.LastVectorKey = nil
			self.DisengageFails = 0
			self.HeldSince = nil
			self._prevY = nil
			self._lastSign = nil
			self._flips = {}
			self._gaps = {}
			self.LastInputAt = tick()
			-- глушим локальный стикер-детектор (вельды сносим свипом)
			pcall(function()
				local s = player.PlayerScripts:FindFirstChild("StickyPartsTouchDetection")
				if s then
					self._stickyScript = s
					s.Disabled = true
				end
			end)
			-- превентивное уничтожение лаг/кик-машины на своём клиенте
			if self.State["Чистка FireAllRemotes"] then
				pcall(function()
					local t = player.PlayerScripts:FindFirstChild("[ExploitTest]FireAllRemotes")
					if t then
						t.Disabled = true
						t:Destroy()
						self:Blackbox("W:fireallremotes")
					end
				end)
			end
			--CharacterAdded: полный сброс guard-state + уход из спавна + пере-хук probe
			self.ConnChar = Mods.Connect(self, player.CharacterAdded:Connect(function(char)
				self.Fsm = "IDLE"
				self.ResetUsed = false
				self.NotifiedSession = false
				self.LoopWindow = {}
				self._ySamples = nil
				self.TpFails = 0
				self.LastHealth = nil
				self._tpDone = nil
				self._tpBusy = nil
				self:Blackbox("S:CHARACTER")
				if self.State["Авто-уход из спавна"] then
					task.delay(0.8, function()
						local c2 = player.Character
						local h2 = Lib.rootOf(c2)
						local sp = self:SpawnPos()
						if c2 and h2 and sp and (h2.Position - sp).Magnitude <= 40 then
							local dir = h2.Position - sp
							dir = Vector3.new(dir.X, 0, dir.Z)
							if dir.Magnitude < 1 then dir = Vector3.new(1, 0, 1) end
							local target = sp + dir.Unit * 90
							target = Vector3.new(target.X, h2.Position.Y + 2, target.Z)
							for _ = 1, 6 do
								if self:SoftTP(target) then break end
								task.wait()
							end
							self:Blackbox("TP:spawn-exit")
						end
					end)
				end
				-- V2: respawn-grace — первые 2 c перекрываем владение своими частями
				task.spawn(function()
					local t0 = tick()
					while tick() - t0 < 2 and char.Parent do
						pcall(function()
							for _, p in ipairs(char:GetChildren()) do
								if p:IsA("BasePart") then
									self.RS.GrabEvents.SetNetworkOwner:FireServer(p, p.CFrame)
								end
							end
						end)
						if self:IsHeldNow(char) then
							self:Mark("respawn-grab")
							break
						end
						task.wait(0.2)
					end
				end)
				self:HookProbe(char)
			end))
			if player.Character then self:HookProbe(player.Character) end
			self.ConnIn1 = Mods.Connect(self, UserInputService.InputBegan:Connect(function() self.LastInputAt = tick() end))
			self.ConnIn2 = Mods.Connect(self, UserInputService.InputChanged:Connect(function() self.LastInputAt = tick() end))
			-- внешние события: чёрные дыры
			self.ConnBH = Mods.Connect(self, workspace.ChildAdded:Connect(function(m)
				local n = string.lower(m.Name)
				if n == "blackhole" or n == "black_hole" or n == "voidhole" or n == "singularity" then
					task.delay(0.15, function()
						pcall(function()
							local part = m:IsA("BasePart") and m or m:FindFirstChildWhichIsA("BasePart")
							if part then
								self.RS.GrabEvents.SetNetworkOwner:FireServer(part, part.CFrame)
								part.CFrame = part.CFrame - Vector3.new(0, 1000, 0)
							end
						end)
						local hrp = Lib.rootOf(player.Character)
						if hrp then self:HardTP(CFrame.new(hrp.Position + Vector3.new(0, 40, 0))) end
						self:Blackbox("W:blackhole")
						self:Mark("blackhole")
					end)
				end
			end))
			-- главный цикл
			self.ConnMain = Mods.Connect(self, RunService.Heartbeat:Connect(function(dt)
				local char = player.Character
				local hrp = Lib.rootOf(char)
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not char or not hrp or not hum or hum.Health <= 0 then return end
				local now = tick()
				self._frame = self._frame + 1
				local held = self:IsHeldNow(char)
				if held then self.HeldSince = self.HeldSince or now else self.HeldSince = nil end
				-- F9: лаг-слепота — клиент морозили, вотчеры молчали
				if dt and dt > 1.5 then
					self:Blackbox("LAGBLIND:" .. string.format("%.1f", dt))
					table.insert(self._gaps, now)
					while #self._gaps > 0 and now - self._gaps[1] > 10 do table.remove(self._gaps, 1) end
					pcall(function()
						hrp.Anchored = false
						self.RS.GameCorrectionEvents.StopAllVelocity:FireServer()
						self.RS.GrabEvents.SetNetworkOwner:FireServer(hrp, hrp.CFrame)
					end)
					if self.LastGround then
						_G.FosforTP = now
						pcall(function() hrp.CFrame = CFrame.new(self.LastGround + Vector3.new(0, 3, 0)) end)
					end
					if #self._gaps >= 3 then
						self._gaps = {}
						notify("AEGIS: лаг-свитч — 3 заморозки за 10 c")
						local al = Mods.Get("AutoLeave")
						if al and al.Enabled then pcall(function() al:Trigger("лаг-свитч") end) end
					end
				end

				-- последняя заземлённая точка (SafeCF только отсюда)
				if self:Grounded(hum) and not held then
					self.LastGround = hrp.Position
					self.LastGroundAt = now
				end

				-- Y-осцилляция при held (классификатор loop-grab)
				if held then
					self._ySamples = self._ySamples or {}
					table.insert(self._ySamples, {t = now, y = hrp.Position.Y})
					while #self._ySamples > 0 and now - self._ySamples[1].t > 2 do table.remove(self._ySamples, 1) end
					local mn, mx = math.huge, -math.huge
					for _, s in ipairs(self._ySamples) do
						if s.y < mn then mn = s.y end
						if s.y > mx then mx = s.y end
					end
					if (mx - mn) > 30 then
						self:Blackbox("LG:yosc")
						self:Mark("yosc")
					end
					-- F6: классификатор drag-осцилляции (флипы вертикальной дельты)
					local dy = hrp.Position.Y - (self._prevY or hrp.Position.Y)
					self._prevY = hrp.Position.Y
					if math.abs(dy) > 0.4 then
						local sgn = dy > 0
						if self._lastSign ~= nil and sgn ~= self._lastSign then
							table.insert(self._flips, now)
						end
						self._lastSign = sgn
					end
					while #self._flips > 0 and now - self._flips[1] > 2 do table.remove(self._flips, 1) end
					if #self._flips >= 3 then
						self._flips = {}
						self._lastSign = nil
						self:Blackbox("W:drag-osc")
						self:Mark("drag-osc")
						if self.Fsm == "ENGAGED" then
							self.L1Used = true
							self.Fsm = "ESCAPE"
							self.SafeTarget = self:SafeZoneTarget()
							self._tpDone = nil
							self:Blackbox("S:ESCAPE")
						end
					end
					-- struggle без КД, 30 Hz
					if self._frame % 2 == 0 then
						pcall(function() self.RS.CharacterEvents.Struggle:FireServer(player) end)
					end
					self:HeavyHeld(hrp)
				else
					self._ySamples = nil
					self._prevY = nil
					self._lastSign = nil
					self._flips = {}
				end

				-- F10: mutual-hold — оба держим друг друга дольше 8 c = разъезд
				local meHolding = false
				pcall(function()
					local gp = workspace:FindFirstChild("GrabParts")
					local gp2 = gp and gp:FindFirstChild("GrabPart")
					local w = gp2 and gp2:FindFirstChild("WeldConstraint")
					if w and w.Part1 and w.Part1.Parent and not w.Part1:IsDescendantOf(char) then meHolding = true end
				end)
				if held and meHolding then
					self.MutualSince = self.MutualSince or now
					if now - self.MutualSince > 8 then
						self.MutualSince = nil
						pcall(function()
							local gp = workspace:FindFirstChild("GrabParts")
							local gp2 = gp and gp:FindFirstChild("GrabPart")
							local w = gp2 and gp2:FindFirstChild("WeldConstraint")
							if w and w.Part1 then self.RS.CharacterEvents.DestroyGrabLine:FireServer(w.Part1) end
							if gp then gp:Destroy() end
						end)
						self:FullDisengage(char, hrp)
						self:HardTP(self:SanityCF(CFrame.new(self.SafeZoneTarget() or Vector3.zero)) or self:FallbackSafe(hrp))
						self:Blackbox("S:MUTUAL")
					end
				else
					self.MutualSince = nil
				end

				-- свипы каждый кадр при активности
				if held or self.Fsm ~= "IDLE" then
					self:Sweep(char, hum)
				end

				-- чужой принудительный сид (только в активной сессии)
				pcall(function()
					local seat = hum.SeatPart
					if seat and self.Fsm ~= "IDLE" then
						local m = seat:FindFirstAncestorOfClass("Model")
						if m then
							for _, pl in ipairs(Players:GetPlayers()) do
								if pl ~= player then
									local toys = workspace:FindFirstChild(pl.Name .. "SpawnedInToys")
									if toys and m:IsDescendantOf(toys) then
										hum.Sit = false
										hum.Jump = true
										local w = seat:FindFirstChild("SeatWeld")
										if w then w:Destroy() end
										self:Blackbox("W:seat")
										self:Mark("seat")
										break
									end
								end
							end
						end
					end
				end)

				-- HP-дренаж без граба
				if not self.LastHealth or now - self.LastHealthAt >= 1 then
					if self.LastHealth and hum.Health < self.LastHealth - 25 and not held then
						self:Blackbox("W:hpdrain")
						self:Mark("hpdrain")
					end
					self.LastHealth = hum.Health
					self.LastHealthAt = now
				end

				-- камера: реставр только в активной сессии
				if self.Fsm ~= "IDLE" or held then
					pcall(function()
						local cam = workspace.CurrentCamera
						if cam and cam.CameraSubject ~= hum then
							cam.CameraSubject = hum
							self:Blackbox("W:cam")
						end
					end)
				end

				-- void: вне held — жёсткий лифт (лимит 1/3 c), внутри held — только симптом
				-- FosforLegsDip: пропуск во время нырка DeleteLegs (-9970, длится ~1.3 с)
				if tick() - (_G.FosforLegsDip or 0) >= 3 and hrp.Position.Y < -45 then
					if held then
						self:Blackbox("W:void-held")
						self:Mark("void")
					elseif self:HardTP(CFrame.new(hrp.Position + Vector3.new(0, 100, 0))) then
						self:Blackbox("W:void")
						if self.Fsm == "IDLE" then self:Mark("void") end
					end
				end

				-- PCLD/яд/барьер — 0.25-0.5 c аккамуляторы
				self._slowAcc = (self._slowAcc or 0) + dt
				if self._slowAcc >= 0.25 then
					self._slowAcc = 0
					pcall(function()
						local pcld = self._pcldCache
						if not (pcld and pcld.Parent) then
							pcld = nil
							for _, ch in ipairs(workspace:GetChildren()) do
								if ch:IsA("BasePart") then
									local ln = string.lower(ch.Name)
									if ln == "playercharacterlocationdetector" or ln == "partesp" then pcld = ch break end
								end
							end
							self._pcldCache = pcld
						end
						if pcld and (pcld.Position - hrp.Position).Magnitude <= 2.5 then
							-- B4: якорим детектор (sno даёт владение физикой) и убираем из игры
							self.RS.GrabEvents.SetNetworkOwner:FireServer(pcld, pcld.CFrame)
							pcld.Anchored = true
							pcld.CanTouch = false
							pcld.CanQuery = false
							pcld.CFrame = pcld.CFrame + Vector3.new(0, 300, 0)
							self._pcldHold = true
							self._pcldHoldStart = now
							self:Blackbox("S:PCLD-ANCHOR")
							self:Mark("pcld")
						end
					end)
					pcall(function()
						local mh = workspace:FindFirstChild("Map")
						local hole = mh and mh:FindFirstChild("Hole")
						local poison = hole and hole:FindFirstChild("PoisonBigHole")
						if poison then
							local pp = poison:IsA("BasePart") and poison.Position or poison:GetPivot().Position
							if (pp - hrp.Position).Magnitude <= 5 then
								self:Blackbox("W:poison")
								self:Mark("poison")
							end
						end
					end)
					if self._pcldHold and now - (self._pcldHoldAt or 0) > 0.5 then
						self._pcldHoldAt = now
						pcall(function()
							local pcld = self._pcldCache
							if pcld and pcld.Parent then
								self.RS.GrabEvents.SetNetworkOwner:FireServer(pcld, pcld.CFrame)
								pcld.Anchored = true
								pcld.CanTouch = false
								pcld.CanQuery = false
								self:Blackbox("S:PCLD-ANCHOR")
							else
								self._pcldHold = false
							end
						end)
						if now - (self._pcldHoldStart or now) > 10 then self._pcldHold = false end
					end
					pcall(function()
						local inPlot = player:FindFirstChild("InPlot")
						if inPlot and inPlot.Value then
							local plots = workspace:FindFirstChild("Plots")
							if plots then
								for _, plot in ipairs(plots:GetChildren()) do
									local barrier = plot:FindFirstChild("Barrier")
									local pb = barrier and barrier:FindFirstChild("PlotBarrier")
									if pb and pb:IsA("BasePart") and pb.CanCollide == false and (pb.Position - hrp.Position).Magnitude < 120 then
										self:Blackbox("W:barrier")
										self:Mark("barrier")
										break
									end
								end
							end
						end
					end)
				end

				-- FSM
				if self.Fsm ~= "IDLE" then
					local age = now - self.SessStart
					local quietFor = now - self.LastSeen
					if self.Fsm == "ENGAGED" then
						-- F8: афк-крепость — без ввода порог L1 ужесточается
						local l1 = (now - (self.LastInputAt or now) > 20) and 0.6 or 1.2
						if (not self.L1Used) and (#self.LoopWindow >= 3 or age > l1) then
							self.L1Used = true
							self.Fsm = "ESCAPE"
							self.SafeTarget = self:SafeZoneTarget()
							self._tpDone = nil
							self:Blackbox("S:ESCAPE")
						end
					elseif self.Fsm == "ESCAPE" then
						-- B1: один TP-запуск на ESCAPE; повтор только по фэйлу (>= 2 c)
						if not self._tpDone then
							if now - (self._lastLaunch or 0) >= 0.5 then
								self._lastLaunch = now
								self:EscapeTP(char, hrp)
							end
						elseif held and now - (self._lastRetry or 0) >= 2 then
							self._lastRetry = now
							self.TpFails = self.TpFails + 1
							self._tpDone = nil
						end
						-- SAFE: дошли, стоим на земле, не держат
						if self._tpDone and not held and self:Grounded(hum)
							and self.SafeTarget and (hrp.Position - self.SafeTarget).Magnitude < 6 then
							self.Fsm = "SAFE"
							self.SafeAt = now
							self:Blackbox("S:SAFE")
						end
						if quietFor > 4 then
							self.Fsm = "IDLE"
							self.NotifiedSession = false
							self:Blackbox("S:IDLE")
						end
					elseif self.Fsm == "SAFE" then
						if held then
							self.Fsm = "ENGAGED"
							self:Blackbox("S:RE-ENGAGED")
						elseif now - (self.SafeAt or now) > 2 and quietFor > 3 then
							self.Fsm = "IDLE"
							self.NotifiedSession = false
							self:Blackbox("S:IDLE")
						end
					end
					-- F8: тайм-аут боя — принудительный разъезд
					if age > 45 then
						self.Fsm = "IDLE"
						self.NotifiedSession = false
						self:FullDisengage(char, hrp)
						self:HardTP(self:SanityCF(CFrame.new(self.SafeZoneTarget() or Vector3.zero)) or self:FallbackSafe(hrp))
						self:Blackbox("S:STALEMATE")
					end
					-- F8: AFK-крепость — 6 c в удержании без эскейпа = ресет
					if held and self.HeldSince and now - self.HeldSince > 6 and not self.ResetUsed and self.Fsm ~= "IDLE" then
						self:ResetSelf(char, "held>6")
					end
					if (self.Fsm == "ENGAGED" or self.Fsm == "ESCAPE") and age > 2.6 and self.TpFails >= 3 and not self.ResetUsed and not self.L2Used then
						self:ResetSelf(char, "окно исчерпано")
					end
				end

				-- телеметрия: flush 1 Hz
				if self.State["Телеметрия"] then
					self._flushAcc = (self._flushAcc or 0) + dt
					if self._flushAcc >= 1 then
						self._flushAcc = 0
						self:Flush()
					end
				end
			end))
			log("AEGIS-2 включён: одна сессия, ноль КД на побег, якорь только с опорой")
		end,
		OnDisable = function(self)
			pcall(function()
				if self._stickyScript then self._stickyScript.Disabled = false end
			end)
			self._stickyScript = nil
			local char = player.Character
			if char then self:Unfreeze(char) end
			log("AEGIS-2 выключен")
		end,
	})


	-- ============================================================
	-- МОДУЛЬ: ANTI BLOB (защита от похищения блобменом / чужого сида)
	-- ============================================================
	Mods.Register({
		Id = "AntiBlob",
		Tab = "Defence",
		Name = "Anti Blob",
		Defaults = {["Ломать детекторы"] = true, ["Побег с чужого сида"] = true, ["Детектор привязок"] = true},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Anti Blob (анти-похищение)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Ломать детекторы", true, function() end))
			subAdd(self, u.Toggle("Побег с чужого сида", true, function() end))
			subAdd(self, u.Toggle("Детектор привязок", true, function() end))
		end,
		OnEnable = function(self)
			local function ownToys()
				return workspace:FindFirstChild(player.Name .. "SpawnedInToys")
			end
			-- локально убираем детекторы чужих блобов: без них блоб не может схватить
			local function neutralizeBlob(model)
				task.delay(0.2, function()
					if not model or not model.Parent or not self.Enabled then return end
					local own = ownToys()
					if own and model:IsDescendantOf(own) then return end
					pcall(function()
						local l = model:FindFirstChild("LeftDetector")
						local r = model:FindFirstChild("RightDetector")
						if l then l:Destroy() end
						if r then r:Destroy() end
					end)
				end)
			end
			if self.State["Ломать детекторы"] then
				for _, d in ipairs(workspace:GetDescendants()) do
					if d.Name == "CreatureBlobman" then neutralizeBlob(d) end
				end
				self.Conn1 = Mods.Connect(self, workspace.DescendantAdded:Connect(function(obj)
					if obj.Name == "CreatureBlobman" then neutralizeBlob(obj) end
				end))
			end
			self.Conn2 = Mods.Connect(self, RunService.Heartbeat:Connect(function(dt)
				local char = player.Character
				local hrp = Lib.rootOf(char)
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hrp or not hum or hum.Health <= 0 then return end
				-- побег с чужого сиденья (блоб/трактор и любой чужой той)
				if self.State["Побег с чужого сида"] and hum.SeatPart then
					local seatModel = hum.SeatPart:FindFirstAncestorOfClass("Model")
					if seatModel then
						local own = ownToys()
						local foreign = not (own and seatModel:IsDescendantOf(own)) and seatModel.Name ~= char.Name
						if foreign then
							pcall(function()
								hum.Sit = false
								hum.Jump = true
							end)
							-- V4: рвём вельды блоба его же релизом (паттерн polarhub)
							pcall(function()
								local bscript = seatModel:FindFirstChild("BlobmanSeatAndOwnerScript")
								local rel = bscript and bscript:FindFirstChild("CreatureRelease")
								if rel then
									for _, side in ipairs({ "Left", "Right" }) do
										local det = seatModel:FindFirstChild(side .. "Detector")
										local weld = det and det:FindFirstChild(side .. "Weld")
										if det and weld then rel:FireServer(det, weld) end
									end
								end
							end)
						end
					end
				end
				-- детектор посторонних физических привязок (вельды блоба, стикеры, троян-вельды)
				if self.State["Детектор привязок"] then
					self._weldAcc = (self._weldAcc or 0) + dt
					if self._weldAcc >= 0.25 then
						self._weldAcc = 0
						local ok, parts = pcall(function() return hrp:GetConnectedParts(true) end)
						if ok and type(parts) == "table" then
							for _, p in ipairs(parts) do
								if p ~= hrp and not p:IsDescendantOf(char) then
									local m = p:FindFirstAncestorOfClass("Model")
									if m and m.Name ~= char.Name then
										local own = ownToys()
										if not (own and m:IsDescendantOf(own)) then
											if not self._lastWeldWarn or tick() - self._lastWeldWarn > 1.5 then
												self._lastWeldWarn = tick()
												notify("Посторонняя привязка к персонажу:".. m.Name)
												log("DEF: привязка " .. m.Name, "info")
												playSound("silent")
											end
											break
										end
									end
								end
							end
						end
					end
				end
			end))
			log("Anti Blob включён")
		end,
		OnDisable = function(self)
			log("Anti Blob выключен")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ANTI FIRE (тушение себя)
	-- ============================================================
	Mods.Register({
		Id = "AntiFire",
		Tab = "Defence",
		Name = "Anti Fire",
		Defaults = {},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Anti Fire (тушение)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		OnEnable = function(self)
			local function hookFire(char)
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hum then return end
				local fd = hum:FindFirstChild("FireDebounce")
				if not fd then return end
				Mods.Connect(self, fd.Changed:Connect(function(val)
					if not self.Enabled or val ~= true then return end
					task.spawn(function()
						pcall(function()
							local hrp = Lib.rootOf(char)
							if not hrp then return end
							local old = hrp.CFrame
							hrp.CFrame = old + Vector3.new(0, 40, 0)
							task.wait(0.3)
							local fp = char:FindFirstChild("FirePlayerPart", true)
							if fp then
								for _, o in ipairs(fp:GetDescendants()) do
									if o:IsA("ParticleEmitter") or o:IsA("Light") then o.Enabled = false end
									if o:IsA("Sound") then o:Stop() end
								end
								if fp:FindFirstChild("CanBurn") then fp.CanBurn.Value = false end
							end
							fd.Value = false
							task.wait(0.5)
							if char.Parent and Lib.rootOf(char) then hrp.CFrame = old end
						end)
					end)
				end))
			end
			if player.Character then hookFire(player.Character) end
			self.Conn2 = Mods.Connect(self, player.CharacterAdded:Connect(hookFire))
			log("Anti Fire включён")
		end,
		OnDisable = function(self)
			log("Anti Fire выключен")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ANTI BOOM (якорь при взрыве рядом)
	-- ============================================================
	Mods.Register({
		Id = "AntiBoom",
		Tab = "Defence",
		Name = "Anti Boom",
		Defaults = {},
		Build = function(self, u)
			u.Section("Среда и лаги")
			self._masterToggle = u.Toggle("Anti Boom (взрыв рядом)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		OnEnable = function(self)
			self.Conn = Mods.Connect(self, workspace.ChildAdded:Connect(function(m)
				if not self.Enabled or m.Name ~= "Part" then return end
				task.delay(0.05, function()
					if not m.Parent or not self.Enabled then return end
					local hrp = Lib.rootOf(player.Character)
					if hrp and (m.Position - hrp.Position).Magnitude <= 25 then
												local humAB = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
						local groundedAB = humAB and humAB.FloorMaterial ~= Enum.Material.Air
						if groundedAB then
							pcall(function() hrp.Anchored = true end)
						else
							pcall(function()
								hrp.AssemblyLinearVelocity = Vector3.zero
								hrp.AssemblyAngularVelocity = Vector3.zero
							end)
						end
						task.delay(0.5, function()
							local h2 = Lib.rootOf(player.Character)
							if h2 and h2.Anchored then
								pcall(function() h2.Anchored = false end)
							end
						end)
					end
				end)
			end))
			log("Anti Boom включён")
		end,
		OnDisable = function(self)
			log("Anti Boom выключен")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ANTI LAG (чистка линий граба + детектор пакет-лага)
	-- ============================================================
	Mods.Register({
		Id = "AntiLag",
		Tab = "Defence",
		Name = "Anti Lag",
		Defaults = {},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Anti Lag (линии/пакеты)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
			local cleanRow = subAdd(self, {row = u.Row(42)}).row
			local cleanCaption = Instance.new("TextLabel")
			cleanCaption.Size = UDim2.new(1, -140, 1, 0)
			cleanCaption.Position = UDim2.new(0, 14, 0, 0)
			cleanCaption.BackgroundTransparency = 1
			cleanCaption.Text = "Очистить линии сейчас:"
			cleanCaption.TextColor3 = currentPalette.text
			cleanCaption.Font = Enum.Font.Gotham
			cleanCaption.TextSize = 14
			cleanCaption.TextXAlignment = Enum.TextXAlignment.Left
			cleanCaption.Parent = cleanRow
			addThemed("text", cleanCaption)
			local cleanBtn = UI.button({
				Name = "CleanLines", Parent = cleanRow,
				Size = UDim2.fromOffset(118, 28), Position = UDim2.new(1, -128, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Очистить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Corner = 10,
			})
			UI.basicHover(cleanBtn, 0.1, 0.03, 0.6, 0.08)
			cleanBtn.MouseButton1Click:Connect(function()
				local n = 0
				for _, v in ipairs(workspace:GetDescendants()) do
					if self:IsNoise(v) then
						pcall(function() v:Destroy() end)
						n = n + 1
					end
				end
				log("Anti Lag: снесено линий: " .. tostring(n), "info")
			end)
		end,
		-- шум = Beam-линии граба + объекты с именем *line* (из 1.3.0.txt),
		-- кроме своих FX и (при включённом GrabLineFX) своих граб-линий под скин
		IsNoise = function(self, v)
			if v:GetAttribute("FosforFX") then return false end
			if typeof(v.Name) ~= "string" then return v:IsA("Beam") end
			if string.find(v.Name, "Fosfor", 1, true) then return false end
			if v:IsA("Beam") then
				local fx = Mods.Get("GrabLineFX")
				local ch = player.Character
				if fx and fx.Enabled and ch and v.Attachment0 and v.Attachment0:IsDescendantOf(ch) then
					return false
				end
			end
			return v:IsA("Beam") or string.find(string.lower(v.Name), "line", 1, true) ~= nil
		end,
		OnEnable = function(self)
			-- глушим локальный скрипт, который двигает Beam-линии (главный источник просадок при line-lag)
			pcall(function()
				local s = player.PlayerScripts:FindFirstChild("CharacterAndBeamMove")
				if s then
					self._beamScript = s
					s.Disabled = true
				end
			end)
			self.Conn1 = Mods.Connect(self, workspace.DescendantAdded:Connect(function(obj)
				if self:IsNoise(obj) then
					task.defer(function() pcall(function() obj:Destroy() end) end)
				end
			end))
			-- детектор входящего пакет-лага (мегабайтные строки в ExtendGrabLine)
			pcall(function()
				local ge = game:GetService("ReplicatedStorage"):FindFirstChild("GrabEvents")
				local ext = ge and ge:FindFirstChild("ExtendGrabLine")
				if ext then
					self.Conn2 = Mods.Connect(self, ext.OnClientEvent:Connect(function(src, data)
						if type(data) == "string" and #data > 300 then
							if not self._lastPkt or tick() - self._lastPkt > 5 then
								self._lastPkt = tick()
								local mb = math.floor(#data / 1048576 * 1000 + 0.5) / 1000
								notify("Packet-lag: входящий пакет".. tostring(mb) .."МБ")
								log("PKT: " .. tostring(mb) .. " МБ, источник: " .. string.sub(tostring(src), 1, 24), "info")
								playSound("silent")
							end
						end
					end))
				end
			end)
			log("Anti Lag включён")
		end,
		OnDisable = function(self)
			pcall(function()
				if self._beamScript then self._beamScript.Disabled = false end
			end)
			self._beamScript = nil
			log("Anti Lag выключен")
		end,
	})

	-- ============================================================
	-- ПОРТ ИЗ 1.3.0.txt: WaterWalk, AutoLeave, GrabLineFX, CustomSounds,
	-- MenuRestyle, KillStreaks, CoinStyle (AntiLag уже есть во вкладке Защита)
	-- ============================================================

	-- ============================================================
	-- МОДУЛЬ: ХОДЬБА ПО ОКЕАНУ
	-- ============================================================
	Mods.Register({
		Id = "WaterWalk",
		Tab = "Misc",
		Name = "Ходьба по океану",
		Icon = "",
		Desc = "",
		Defaults = {},
		Build = function(self, u)
			u.Section("Ходьба по океану")
			self._masterToggle = u.Toggle("Ходьба по океану", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		FindOcean = function(self)
			local obj = nil
			pcall(function()
				local map = workspace:FindFirstChild("Map")
				local ah = map and map:FindFirstChild("AlwaysHereTweenedObjects")
				local oc = ah and ah:FindFirstChild("Ocean")
				obj = oc and (oc:FindFirstChild("Object") or oc:FindFirstChildWhichIsA("BasePart"))
			end)
			if not obj then
				pcall(function()
					for _, d in ipairs(workspace:GetDescendants()) do
						local ln = string.lower(d.Name)
						if d:IsA("BasePart") and (ln:find("ocean") or ln:find("water")) then obj = d break end
					end
				end)
			end
			return obj
		end,
		Apply = function(self, on)
			local o = self:FindOcean()
			if not o then log("Океан не найден") return end
			local targets = {}
			if o:IsA("BasePart") then table.insert(targets, o) end
			pcall(function()
				for _, c in ipairs(o:GetDescendants()) do
					if c:IsA("BasePart") then table.insert(targets, c) end
				end
			end)
			for _, p in ipairs(targets) do
				pcall(function() p.CanCollide = on end)
			end
			log("Ходьба по океану: " .. (on and "вкл" or "выкл"))
		end,
		OnEnable = function(self) self:Apply(true) end,
		OnDisable = function(self) self:Apply(false) end,
	})

	-- ============================================================
	-- МОДУЛЬ: АВТО-ЛИВ (пакет-лаг, спам линий, попытка кика, FPS)
	-- ============================================================
	Mods.Register({
		Id = "AutoLeave",
		Tab = "Defence",
		Name = "Авто-лив",
		Icon = "",
		Desc = "",
		Defaults = {OnPacketLag = true, OnLineSpam = true, OnKickAttempt = true, OnLowFps = false, PacketMB = 1, LineRate = 30, FpsMin = 15, Action = "leave"},
		Build = function(self, u)
			u.Section("Авто-лив")
			self._masterToggle = u.Toggle("Авто-лив при атаке", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Пакет-лаг (ExtendGrabLine)", self.State.OnPacketLag ~= false, function(v) self.State.OnPacketLag = v end))
			subAdd(self, u.Toggle("Спам линий (лаг линиями)", self.State.OnLineSpam ~= false, function(v) self.State.OnLineSpam = v end))
			subAdd(self, u.Toggle("Попытка кика (BodyMovers на мне)", self.State.OnKickAttempt ~= false, function(v) self.State.OnKickAttempt = v end))
			subAdd(self, u.Toggle("Просадка FPS", self.State.OnLowFps == true, function(v) self.State.OnLowFps = v end))
			subAdd(self, u.Slider("Порог пакет-лага (МБ)", 0.2, 10, self.State.PacketMB or 1, function(v) self.State.PacketMB = v end))
			subAdd(self, u.Slider("Линий за 2 сек = триггер", 5, 100, self.State.LineRate or 30, function(v) self.State.LineRate = math.floor(v + 0.5) end))
			subAdd(self, u.Slider("Минимум FPS", 5, 40, self.State.FpsMin or 15, function(v) self.State.FpsMin = math.floor(v + 0.5) end))
			local actRow = u.Row(42)
			local actLbl = UI.button({Name = "ActionLabel", Parent = actRow, Size = UDim2.new(1, -120, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Stroke = false, Text = "Действие: " .. (self.State.Action or "leave"), TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14, Active = false, ThemeText = "text", Font = Enum.Font.Gotham})
			local actBtn = UI.button({Name = "ActionBtn", Parent = actRow, Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14), BackgroundTransparency = 0.1, Text = "Переключить", TextSize = 12, ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10})
			actBtn.MouseButton1Click:Connect(function()
				self.State.Action = (self.State.Action == "leave") and "rejoin" or "leave"
				actLbl.Text = "Действие: " .. self.State.Action
				playSound("silent")
			end)
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		Trigger = function(self, reason)
			if self.TrigCd and tick() - self.TrigCd < 5 then return end
			self.TrigCd = tick()
			log("Авто-лив:".. reason)
			if notify then notify("Авто-лив:".. reason) end
			playSound("silent")
			task.wait(0.4)
			if self.State.Action == "rejoin" then
				pcall(function() game:GetService("TeleportService"):Teleport(game.PlaceId, player) end)
			else
				pcall(function() player:Kick("Fosfor auto-leave: " .. reason) end)
			end
		end,
		OnEnable = function(self)
			self.TrigCd = 0
			self.LineCount = 0
			self.LineWindow = tick()
			self.FpsFrames = 0
			self.FpsTime = tick()
			pcall(function()
				local ge = game:GetService("ReplicatedStorage"):FindFirstChild("GrabEvents")
				local ext = ge and ge:FindFirstChild("ExtendGrabLine")
				if ext then
					Mods.Connect(self, ext.OnClientEvent:Connect(function(a1)
						if not self.Enabled or self.State.OnPacketLag == false then return end
						local mb = #tostring(a1) / 1048576
						if mb >= (self.State.PacketMB or 1) then
							self:Trigger(string.format("пакет-лаг %.1f МБ", mb))
						end
					end))
				end
			end)
			Mods.Connect(self, workspace.DescendantAdded:Connect(function(v)
				if not self.Enabled then return end
				if self.State.OnLineSpam ~= false and (v:IsA("Beam") or (typeof(v.Name) == "string" and v.Name:lower():find("line"))) then
					local now = tick()
					if now - self.LineWindow > 2 then self.LineCount = 0 self.LineWindow = now end
					self.LineCount = self.LineCount + 1
					if self.LineCount >= (self.State.LineRate or 30) then
						self:Trigger("спам линий: " .. self.LineCount .. " за 2 сек")
					end
				end
				if self.State.OnKickAttempt ~= false and player.Character and v:IsDescendantOf(player.Character) then
					if v:IsA("BodyPosition") or v:IsA("BodyGyro") or v:IsA("AlignPosition") or v:IsA("BodyVelocity") then
						self:Trigger("BodyMover на персонаже (попытка кика/лока)")
					end
				end
			end))
		end,
		OnHeartbeat = function(self, dt)
			if not self.Enabled or self.State.OnLowFps ~= true then return end
			self.FpsFrames = self.FpsFrames + 1
			local now = tick()
			if now - self.FpsTime >= 2 then
				local fps = self.FpsFrames / (now - self.FpsTime)
				self.FpsFrames = 0
				self.FpsTime = now
				if fps < (self.State.FpsMin or 15) then
					self:Trigger("FPS упал до " .. math.floor(fps))
				end
			end
		end,
		OnDisable = function(self) end,
	})

	-- ============================================================
	-- МОДУЛЬ: СКИНЫ ЛИНИИ ГРАБА (Beam.Texture) + иконки-превью
	-- ============================================================
	Mods.Register({
		Id = "GrabLineFX",
		Tab = "Visual",
		Name = "Скины линии",
		Icon = "",
		Desc = "",
		Defaults = {SkinIndex = 0, OnlyMine = false, Width = 0.5, Speed = 1},
		SKINS = {
			{Name = "Выкл", Tex = ""},
			{Name = "Цепь 1", Tex = "1284666395060514", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Цепь 2", Tex = "73368670987191", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Пульс", Tex = "82163767314193", Mode = Enum.TextureMode.Wrap, Speed = 2},
			{Name = "Канат", Tex = "78999022056924", Mode = Enum.TextureMode.Wrap, Speed = 0.5},
			{Name = "Змей", Tex = "81358145120405", Mode = Enum.TextureMode.Wrap, Speed = 1.5},
			{Name = "Лазер", Tex = "86522958725", Mode = Enum.TextureMode.Stretch, Speed = 0},
			{Name = "Пузырьки", Tex = "1249690853", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Соус", Tex = "18837732116", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Чайник", Tex = "9142429571", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Донат", Tex = "8933355899", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Солнце", Tex = "852912429527166", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Sparkles (встр.)", Tex = "rbxasset://textures/particles/sparkles_main.dds", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Beam (moongui)", Tex = "12781852245", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Lightning", Tex = "446111271", Mode = Enum.TextureMode.Wrap, Speed = 2.5},
			{Name = "Heartrate", Tex = "5830549480", Mode = Enum.TextureMode.Wrap, Speed = 1.5},
			{Name = "Chain (моон)", Tex = "9632168658", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Glitch", Tex = "8089467613", Mode = Enum.TextureMode.Static, Speed = 0},
			{Name = "Swirl", Tex = "5638168605", Mode = Enum.TextureMode.Wrap, Speed = 1.5},
			{Name = "Синий лазер", Tex = "6060542021", Mode = Enum.TextureMode.Wrap, Speed = 2},
			{Name = "Тайкун стрелка", Tex = "7791559535", Mode = Enum.TextureMode.Static, Speed = -1},
			{Name = "NextBot свечение", Tex = "10362146767", Mode = Enum.TextureMode.Stretch, Speed = 0},
			{Name = "Деко-балка", Tex = "4768994854", Mode = Enum.TextureMode.Static, Speed = 0},
			{Name = "Вода (поток)", Tex = "16808804567", Mode = Enum.TextureMode.Wrap, Speed = 0.4},
			{Name = "Пена водопад", Tex = "4787437624", Mode = Enum.TextureMode.Wrap, Speed = 0.4},
			{Name = "Густая пена", Tex = "16829556885", Mode = Enum.TextureMode.Wrap, Speed = 0.5},
			{Name = "Сетчатая пена", Tex = "16808075391", Mode = Enum.TextureMode.Wrap, Speed = 0.5},
			{Name = "Радужный нимб", Tex = "16828911033", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Туман", Tex = "16830667309", Mode = Enum.TextureMode.Wrap, Speed = 0.3},
			{Name = "Полосатый", Tex = "91049678", Mode = Enum.TextureMode.Wrap, Speed = 1},
			{Name = "Белое кольцо", Tex = "1266170131", Mode = Enum.TextureMode.Stretch, Speed = 0},
		},
		Build = function(self, u)
			u.Section("Скины линии граба")
			self._subRows = self._subRows or {}
			local function trackRow(row)
				if row then table.insert(self._subRows, row) end
				return row
			end
			self._masterToggle = u.Toggle("Скины линии граба", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			self.IconButtons = {}
			local iconRows = {}
			for i, skin in ipairs(self.SKINS) do
				local colIdx = (i - 1) % 6
				if colIdx == 0 then
					self._iconRow = trackRow(u.Row(50))
					iconRows[#iconRows + 1] = self._iconRow
				end
				local b = UI.button({
					Name = "SkinIcon" .. i, Parent = self._iconRow,
					Size = UDim2.fromOffset(42, 42),
					Position = UDim2.new(0, 12 + colIdx * 46, 0.5, -21),
					BackgroundTransparency = 0.25, Text = "", Corner = 9, StrokeTransparency = 0.6,
				})
				if skin.Tex ~= "" then
					local img = Instance.new("ImageLabel")
					img.Name = "Prev"
					img.Size = UDim2.fromScale(0.86, 0.86)
					img.Position = UDim2.new(0.07, 0, 0.07, 0)
					img.BackgroundTransparency = 1
					img.Image = self:FullTex(skin.Tex)
					img.ScaleType = Enum.ScaleType.Tile
					img.TileSize = UDim2.new(0, 30, 0, 30)
					img.Parent = b
				else
					b.Text =""
					b.TextSize = 16
				end
				b.MouseButton1Click:Connect(function()
					self.State.SkinIndex = i - 1
					self.CustomTex = nil
					if self._skinLabel then self._skinLabel.Text = "Скин: " .. skin.Name end
					if self.Enabled then self:Rescan() end
					playSound("silent")
				end)
				table.insert(self.IconButtons, b)
			end
			local nameRow = trackRow(u.Row(36))
			self._skinLabel = UI.button({Name = "SkinNameLabel", Parent = nameRow,
				Size = UDim2.new(1, -24, 1, 0), Position = UDim2.new(0, 12, 0, 0),
				BackgroundTransparency = 1, Stroke = false,
				Text = "Скин: " .. (self.SKINS[(self.State.SkinIndex or 0) + 1] or self.SKINS[1]).Name,
				TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14,
				Active = false, ThemeText = "text", Font = Enum.Font.Gotham})
			subAdd(self, u.Slider("Толщина линии", 0.1, 2, self.State.Width or 0.5, function(v) self.State.Width = v end))
			subAdd(self, u.Slider("Скорость текстуры", 0, 5, self.State.Speed or 1, function(v) self.State.Speed = v end))
			subAdd(self, u.Toggle("Только мои линии", self.State.OnlyMine == true, function(v) self.State.OnlyMine = v end))
			local customRow = trackRow(u.Row(48))
			self.TexInput = Instance.new("TextBox")
			self.TexInput.Name = "SkinTexInput"
			self.TexInput.Size = UDim2.new(1, -130, 1, -12)
			self.TexInput.Position = UDim2.new(0, 12, 0, 6)
			self.TexInput.BackgroundColor3 = currentPalette.element
			self.TexInput.BackgroundTransparency = 0.1
			self.TexInput.BorderSizePixel = 0
			self.TexInput.Text = ""
			self.TexInput.PlaceholderText = "свой rbxassetid (число) — свой скин"
			self.TexInput.PlaceholderColor3 = currentPalette.sub
			self.TexInput.TextColor3 = currentPalette.text
			self.TexInput.Font = Enum.Font.Code
			self.TexInput.TextSize = 12
			self.TexInput.TextXAlignment = Enum.TextXAlignment.Left
			self.TexInput.ClearTextOnFocus = false
			self.TexInput.Parent = customRow
			addThemed("element", self.TexInput)
			addThemed("text", self.TexInput)
			UI.corner(self.TexInput, 10)
			UI.stroke(self.TexInput, 0.6, 1)
			UI.padding(self.TexInput, 10, 8, 0, 0)
			UI.focusFX(self.TexInput)
			local applyBtn = UI.button({Name = "SkinApplyBtn", Parent = customRow,
				Size = UDim2.fromOffset(100, 28), Position = UDim2.new(1, -114, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Применить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10})
			UI.basicHover(applyBtn, 0.1, 0.03, 0.6, 0.08)
			applyBtn.MouseButton1Click:Connect(function()
				local id = trim(self.TexInput.Text)
				if id == "" or not tonumber(id) then
					log("Вставь числовой rbxassetid")
					playSound("silent")
					return
				end
				self.CustomTex = id
				if self._skinLabel then self._skinLabel.Text = "Скин: свой #" .. id end
				if self.Enabled then self:Rescan() end
				playSound("silent")
			end)
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		FullTex = function(self, raw)
			if not raw or raw == "" then return "" end
			if raw:sub(1, 8) == "rbxasset" or raw:sub(1, 4) == "http" then return raw end
			return "rbxassetid://" .. raw
		end,
		IsLine = function(self, v)
			return v:IsA("Beam") or (typeof(v.Name) == "string" and v.Name:lower():find("line") ~= nil)
		end,
		Mine = function(self, v)
			local ch = player.Character
			if not ch then return false end
			if v:IsA("Beam") and v.Attachment0 and v.Attachment0:IsDescendantOf(ch) then return true end
			local node = v
			for i = 1, 6 do
				node = node.Parent
				if not node then return false end
				if node == ch then return true end
			end
			return false
		end,
		Apply = function(self, b)
			if not b or not b.Parent then return end
			if not self.Saved then self.Saved = setmetatable({}, {__mode = "k"}) end
			if not self.Saved[b] then
				self.Saved[b] = {Tex = b.Texture, Mode = b.TextureMode, Sp = b.TextureSpeed, W0 = b.Width0, W1 = b.Width1, Em = b.LightEmission}
			end
			local skin = self.SKINS[(self.State.SkinIndex or 0) + 1] or self.SKINS[1]
			pcall(function()
				if self.CustomTex then
					b.Texture = self:FullTex(self.CustomTex)
				elseif skin.Tex ~= "" then
					b.Texture = self:FullTex(skin.Tex)
				else
					b.Texture = self.Saved[b].Tex
				end
				b.TextureMode = skin.Mode or Enum.TextureMode.Wrap
				b.TextureSpeed = self.State.Speed or skin.Speed or 1
				local w = self.State.Width or 0.5
				b.Width0 = w
				b.Width1 = w
				b.LightEmission = 0.6
			end)
		end,
		Restore = function(self, b)
			local s = self.Saved and self.Saved[b]
			if not s or not b.Parent then return end
			pcall(function()
				b.Texture = s.Texture
				b.TextureMode = s.Mode
				b.TextureSpeed = s.Sp
				b.Width0 = s.W0
				b.Width1 = s.W1
				b.LightEmission = s.Em
			end)
		end,
		Rescan = function(self)
			if not self.Saved then return end
			for beam, _ in pairs(self.Saved) do
				if beam and beam.Parent then
					if self.State.OnlyMine == true and not self:Mine(beam) then continue end
					self:Apply(beam)
				end
			end
		end,
		FullScan = function(self)
			pcall(function()
				for _, v in ipairs(workspace:GetDescendants()) do
					if self:IsLine(v) then
						if self.State.OnlyMine == true and not self:Mine(v) then continue end
						self:Apply(v)
					end
				end
			end)
		end,
		OnEnable = function(self)
			self.Saved = setmetatable({}, {__mode = "k"})
			Mods.Connect(self, workspace.DescendantAdded:Connect(function(v)
				if self.Enabled and self:IsLine(v) then
					if self.State.OnlyMine == true and not self:Mine(v) then return end
					task.defer(function() self:Apply(v) end)
				end
			end))
			Mods.Connect(self, RunService.Heartbeat:Connect(function()
				if not self.Enabled then return end
				self._acc = (self._acc or 0) + 1
				if self._acc < 180 then return end
				self._acc = 0
				self:Rescan()
			end))
			self:FullScan()
		end,
		OnDisable = function(self)
			if self.Saved then
				for b in pairs(self.Saved) do self:Restore(b) end
			end
			self.Saved = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: СВОИ ЗВУКИ (подмена SoundId по имени звука)
	-- ============================================================
	Mods.Register({
		Id = "CustomSounds",
		Tab = "Settings",
		Name = "Свои звуки",
		Icon = "",
		Desc = "",
		Defaults = {},
		Build = function(self, u)
			u.Section("Свои звуки")
			self._masterToggle = u.Toggle("Замена звуков по категориям", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		MY_SOUNDS = {
			-- подмена звуков полностью отключена: кастомные id давали
			-- надоедливый писк на разных частотах. Игра играет свои родные звуки.
			-- вернуть подмену — вписать id обратно:
			-- button    = "rbxassetid://82845990304289",
			-- notify    = "rbxassetid://116271631941040",
			-- menu      = "rbxassetid://7060363375",
			-- notify2   = "rbxassetid://87437544236708",
			-- spawn     = "rbxassetid://18133558673",
			-- important = "rbxassetid://92972986635552",
		},
		-- возвращает категорию из MY_SOUNDS или nil — если nil, звук НЕ подменяем
		PickCategory = function(self, name)
			if not name then return nil end
			local n = name:lower()
			-- важные / критические (приоритет выше)
			if n:find("important") or n:find("critical") or n:find("alert") or n:find("danger") or n:find("warning") or n:find("alarm") or n:find("system") or n:find("error_sound") then return "important" end
			-- спавн предмета / взаимодействие с предметом
			if n:find("spawn") or n:find("item_drop") or n:find("itemdrop") or n:find("drop") or n:find("create") or n:find("pickup") or n:find("collect") or n:find("buy") or n:find("sell") or n:find("reward") or n:find("unlock") or n:find("loot") then return "spawn" end
			-- вторичное уведомление / toast / системные сообщения
			if n:find("notify2") or n:find("alt_notify") or n:find("secondary") or n:find("toast") or n:find("info2") or n:find("system_msg") or n:find("minor") then return "notify2" end
			-- открыть / закрыть меню
			if n:find("menu_open") or n:find("menu_close") or n:find("openmenu") or n:find("closemenu") or n:find("menutoggle") then return "menu" end
			if n:find("menu") then return "menu" end
			-- основное уведомление
			if n:find("notify") or n:find("notification") or n:find("notif") or n:find("info") or n:find("popup") or n:find("message") or n:find("achievement") or n:find("levelup") or n:find("quest") then return "notify" end
			-- кнопки / клики / наведения
			if n:find("button") or n:find("btn") or n:find("click") or n:find("hover") or n:find("tap") or n:find("press") or n:find("select") or n:find("interact") or n:find("ui_") or n:find("hud") then return "button" end
			return nil
		end,
		Remap = function(self, snd)
			if not snd or not snd:IsA("Sound") then return end
			if snd:GetAttribute("FosforSFX") then return end -- звуки самого хаба не подменяем
			local cat = self:PickCategory(snd.Name)
			if not cat then return end  -- не наша категория — не трогаем
			local newId = self.MY_SOUNDS[cat]
			if newId and snd.SoundId ~= newId then
				snd.SoundId = newId
			end
		end,
		WalkExisting = function(self)
			pcall(function()
				for _, d in ipairs(game:GetDescendants()) do
					if d:IsA("Sound") then self:Remap(d) end
				end
			end)
		end,
		OnEnable = function(self)
			self:WalkExisting()
			Mods.Connect(self, workspace.DescendantAdded:Connect(function(d) if d:IsA("Sound") then self:Remap(d) end end))
			pcall(function()
				local ss = game:GetService("SoundService")
				if ss then Mods.Connect(self, ss.DescendantAdded:Connect(function(d) if d:IsA("Sound") then self:Remap(d) end end)) end
			end)
			pcall(function()
				if hookmetamethod and newcclosure then
					local old
					old = hookmetamethod(game, "__namecall", newcclosure(function(selfobj, ...)
						local method = getnamecallmethod and getnamecallmethod() or ""
						if method == "Play" and typeof(selfobj) == "Instance" and selfobj:IsA("Sound") then
							pcall(function()
								local cat = self:PickCategory(selfobj.Name)
								if cat then
									local newId = self.MY_SOUNDS[cat]
									if newId and selfobj.SoundId ~= newId then
										selfobj.SoundId = newId
									end
								end
							end)
						end
						return old(selfobj, ...)
					end))
				end
			end)
			log("CustomSounds: подмена отключена (писк убран), игра играет родные звуки")
		end,
		OnDisable = function(self)
			log("CustomSounds выключен (оригинальные звуки возвращены)")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: РЕСТАЙЛ МЕНЮ ИГРЫ (MenuGui → стиль Fosfor)
	-- ============================================================
	Mods.Register({
		Id = "MenuRestyle",
		Tab = "Visual",
		Name = "Стиль меню",
		Icon = "",
		Desc = "",
		Defaults = {},
		Build = function(self, u)
			u.Section("Стиль меню")
			self._masterToggle = u.Toggle("Рестайл меню игры (стиль Fosfor)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		FindMenu = function(self)
			local pg = player:FindFirstChild("PlayerGui")
			if not pg then return nil end
			local candidates = {"MenuGui", "Menu", "GameGui", "MainGui"}
			for _, name in ipairs(candidates) do
				local g = pg:FindFirstChild(name)
				if g then return g end
			end
			return pg:FindFirstChildWhichIsA("ScreenGui") or pg:GetChildren()[1]
		end,
		RestyleOne = function(self, obj)
			if not obj then return end
			pcall(function()
				local isCell = obj:IsA("ImageButton") or obj:IsA("ImageLabel")
				if obj:IsA("Frame") and obj.BackgroundTransparency < 1 and obj.Name ~= "FosforCoinsPlate" then
					obj.BackgroundColor3 = currentPalette.panel:Lerp(Color3.new(0, 0, 0), 0.45)
					obj.BackgroundTransparency = 0.1
					local corner = obj:FindFirstChildOfClass("UICorner")
					if corner then corner.CornerRadius = UDim.new(0, 14) else UI.corner(obj, 14) end
					addThemed("panel", obj)
					if obj.Name == "TopBar" or obj.Name == "Header" or obj.Name == "TitleBar" then
						if not obj:FindFirstChild("FosforAccentStrip") then
							local strip = Instance.new("Frame")
							strip.Name = "FosforAccentStrip"
							strip.Size = UDim2.new(1, 0, 0, 3)
							strip.Position = UDim2.new(0, 0, 1, -3)
							strip.BackgroundColor3 = Mods.Colors.accent
							strip.BorderSizePixel = 0
							strip.ZIndex = 50
							strip.Parent = obj
						end
					end
				end
				if obj:IsA("TextLabel") then
					obj.TextColor3 = currentPalette.text
					addThemed("text", obj)
				end
				if obj:IsA("TextButton") then
					obj.TextColor3 = currentPalette.text
					if obj.BackgroundTransparency < 1 then
						obj.BackgroundColor3 = currentPalette.element:Lerp(Color3.new(0, 0, 0), 0.35)
						obj.BackgroundTransparency = 0.08
						addThemed("element", obj)
					end
					if not obj:FindFirstChildOfClass("UICorner") then UI.corner(obj, 10) end
				end
				if obj:IsA("ScrollingFrame") then
					obj.ScrollBarThickness = 2
					obj.ScrollBarImageColor3 = currentPalette.sub
					obj.ScrollBarImageTransparency = 0.35
				end
				if isCell then
					if obj.Size.X.Offset >= 40 and obj.Size.Y.Offset >= 40 then
						if not obj:FindFirstChildOfClass("UICorner") then UI.corner(obj, 10) end
						local st = obj:FindFirstChildOfClass("UIStroke")
						if not st then
							st = Instance.new("UIStroke")
							st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
							st.Parent = obj
						end
						st.Color = Color3.fromRGB(255, 255, 255)
						st.Thickness = 1.4
						st.Transparency = 0.5
					end
				end
				-- зелёный лимит-бар меню игрушек -> белый
				if obj:IsA("Frame") or obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
					local cC = obj.BackgroundColor3
					if cC.G > 0.45 and cC.G > cC.R * 1.25 and cC.G > cC.B * 1.25 then
						obj.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					end
				end
				if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
					for _, c in ipairs(obj:GetChildren()) do
						self:RestyleOne(c)
					end
				end
			end)
		end,
		Walk = function(self, root)
			if not root then return end
			pcall(function()
				for _, c in ipairs(root:GetDescendants()) do
					self:RestyleOne(c)
				end
			end)
		end,
		OnEnable = function(self)
			local menu = self:FindMenu()
			if not menu then
				log("MenuGui не найден")
				return
			end
			self:Walk(menu)
			Mods.Connect(self, menu.DescendantAdded:Connect(function(d)
				task.defer(function() self:RestyleOne(d) end)
			end))
			-- анимация открытия/закрытия окна игрушек
			pcall(function()
				local win = self:FindToyWindow(menu)
				if win then
					self._menuUS = Instance.new("UIScale")
					self._menuUS.Parent = win
					self._menuConn = win:GetPropertyChangedSignal("Visible"):Connect(function()
						if not self.Enabled or not win.Parent then return end
						pcall(function()
							if win.Visible then
								self._menuUS.Scale = 0.92
								Animations.tween(self._menuUS, {Scale = 1}, 0.22)
							else
								win.Visible = true
								self._menuUS.Scale = 1
								Animations.tweenCompleted(self._menuUS, {Scale = 0.93}, 0.12, function()
									win.Visible = false
									self._menuUS.Scale = 1
								end)
							end
						end)
					end)
				end
			end)
			log("MenuRestyle: рестайл применён к".. menu.Name)
		end,
		OnDisable = function(self)
			pcall(function() if self._menuUS then self._menuUS:Destroy() end end)
			self._menuUS = nil
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: КИЛЛ-СТРИКИ В СТИЛЕ DOTA 2 (баннер, фразы, таймеры)
	-- ============================================================
	Mods.Register({
		Id = "KillStreaks",
		Tab = "PVP",
		Name = "Килл-стрики",
		Icon = "",
		Desc = "",
		Defaults = {FirstBloodDone = false, Streak = 0, Multi = 0, MultiWindow = 18},
		Build = function(self, u)
			u.Section("Килл-стрики (Dota 2)")
			self._masterToggle = u.Toggle("Баннеры и фразы при сериях", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Slider("Окно мульти-килла (сек)", 5, 30, self.State.MultiWindow or 18, function(v) self.State.MultiWindow = v end))
			-- ===== ТЕСТОВЫЕ КНОПКИ ВСЕХ ФРАЗ (видны всегда, без суб-строк) =====
			u.Section("Тест фраз")
			local function testRow(caption, cb)
				local row = u.Row(36)
				local cap = Instance.new("TextLabel")
				cap.Size = UDim2.new(1, -80, 1, 0)
				cap.Position = UDim2.new(0, 14, 0, 0)
				cap.BackgroundTransparency = 1
				cap.Text = caption
				cap.TextColor3 = currentPalette.sub
				cap.Font = Enum.Font.Gotham
				cap.TextSize = 12
				cap.TextXAlignment = Enum.TextXAlignment.Left
				cap.TextTruncate = Enum.TextTruncate.AtEnd
				cap.Parent = row
				addThemed("sub", cap)
				local btn = UI.button({
					Name = "TestPhrase", Parent = row,
					Size = UDim2.fromOffset(64, 24), Position = UDim2.new(1, -74, 0.5, -12),
					BackgroundTransparency = 0.1, Text = "Тест", TextSize = 11,
					ThemeBackground = "element", ThemeText = "text", Corner = 9,
				})
				UI.basicHover(btn, 0.1, 0.03, 0.6, 0.08)
				btn.MouseButton1Click:Connect(cb)
			end
			-- стрики 3..10
			for streak = 3, 10 do
				local text = self.STREAK_TEXTS[streak]
				testRow("Стрик " .. streak, function()
					self:ShowBanner(text, string.format("Fosfor — %d киллов подряд", streak), Color3.fromRGB(255, 40, 40))
					if streak >= 8 then
						self:ScreenFlash(Color3.fromRGB(180, 20, 20), 0.6)
						self:CamShake(0.7, 0.4)
					end
				end)
			end
			-- мульти-киллы 2..5
			for multi = 2, 5 do
				local text = self.MULTI_TEXTS[multi]
				testRow("Мульти " .. multi, function()
					self:ShowBanner(text, string.format("Fosfor — %d киллов за %d сек", multi, self.State.MultiWindow or 18), Color3.fromRGB(220, 60, 60))
					if multi >= 5 then
						self:ScreenFlash(Color3.fromRGB(220, 30, 30), 0.45)
						self:CamShake(0.6, 0.3)
					end
				end)
			end
			-- первая кровь
			testRow("Фёрст-блад", function()
				self:ShowBanner("FIRST BLOOD!", "Первая кровь матча — Fosfor открыл счёт!", Color3.fromRGB(255, 80, 80))
			end)
		end,
		STREAK_TEXTS = {
			[3]  = "ФОСФОР В УДАРЕ!",
			[4]  = "ФОСФОР ДОМИНИРУЕТ!",
			[5]  = "МЕГА-КИЛЛ!",
			[6]  = "НЕУДЕРЖИМ!",
			[7]  = "БЕШЕНЫЙ!",
			[8]  = "МОНСТР-КИЛЛ!",
			[9]  = "БОГОПОДОБЕН!",
			[10] = "ЗА ГРАНЬЮ БОГОПОДОБИЯ!",
		},
		MULTI_TEXTS = {
			[2] = "ДАБЛ-КИЛЛ!",
			[3] = "ТРИБЛ-КИЛЛ!",
			[4] = "УЛЬТРА-КИЛЛ!",
			[5] = "РАМПАГА!",
		},
		ShowBanner = function(self, headline, sub, color)
			if self.Banner and self.Banner.Parent then self.Banner:Destroy() end
			local b = Instance.new("ScreenGui")
			b.Name = "FosforKSBanner"
			b.DisplayOrder = 2000
			b.IgnoreGuiInset = true
			b.Parent = player:WaitForChild("PlayerGui")
			local holder = Instance.new("Frame")
			holder.Name = "Holder"
			holder.Size = UDim2.new(0, 600, 0, 110)
			holder.Position = UDim2.new(0.5, -300, 0, 60)
			holder.BackgroundTransparency = 1
			holder.Parent = b
			local headline_lbl = Instance.new("TextLabel")
			headline_lbl.Name = "Headline"
			headline_lbl.Size = UDim2.new(1, 0, 0.55, 0)
			headline_lbl.BackgroundTransparency = 1
			headline_lbl.Font = Enum.Font.GothamBold
			headline_lbl.TextSize = 44
			headline_lbl.TextColor3 = color or Color3.fromRGB(220, 30, 30)
			headline_lbl.TextStrokeColor3 = Color3.fromRGB(20, 0, 0)
			headline_lbl.TextStrokeTransparency = 0.3
			headline_lbl.Text = headline
			headline_lbl.TextScaled = false
			headline_lbl.Parent = holder
			local sub_lbl = Instance.new("TextLabel")
			sub_lbl.Name = "Sub"
			sub_lbl.Size = UDim2.new(1, 0, 0.4, 0)
			sub_lbl.Position = UDim2.new(0, 0, 0.55, 0)
			sub_lbl.BackgroundTransparency = 1
			sub_lbl.Font = Enum.Font.Gotham
			sub_lbl.TextSize = 18
			sub_lbl.TextColor3 = Color3.fromRGB(255, 230, 220)
			sub_lbl.TextStrokeTransparency = 0.4
			sub_lbl.Text = sub or ""
			sub_lbl.Parent = holder
			self.Banner = b
			-- pop-in
			holder.Size = UDim2.new(0, 0, 0, 0)
			holder.Position = UDim2.new(0.5, 0, 0, 60)
			Animations.tween(holder, {Size = UDim2.new(0, 700, 0, 130), Position = UDim2.new(0.5, -350, 0, 50)}, 0.25)
			task.delay(2.0, function()
				if b and b.Parent then
					Animations.tween(headline_lbl, {TextTransparency = 1, TextStrokeTransparency = 1}, 0.4)
					Animations.tween(sub_lbl, {TextTransparency = 1, TextStrokeTransparency = 1}, 0.4)
					task.wait(0.5)
					if b and b.Parent then b:Destroy() end
				end
			end)
		end,
		ScreenFlash = function(self, color, dur)
			local pg = player:FindFirstChild("PlayerGui")
			if not pg then return end
			local b = Instance.new("ScreenGui")
			b.Name = "FosforFlash"
			b.DisplayOrder = 1999
			b.IgnoreGuiInset = true
			b.Parent = pg
			local f = Instance.new("Frame")
			f.Size = UDim2.fromScale(1, 1)
			f.BackgroundColor3 = color or Color3.fromRGB(220, 30, 30)
			f.BackgroundTransparency = 0.6
			f.BorderSizePixel = 0
			f.Parent = b
			Animations.tween(f, {BackgroundTransparency = 1}, dur or 0.4)
			task.delay((dur or 0.4) + 0.05, function() if b and b.Parent then b:Destroy() end end)
		end,
		CamShake = function(self, amp, dur)
			local cam = workspace.CurrentCamera
			if not cam then return end
			local t0 = tick()
			local conn
			conn = RunService.RenderStepped:Connect(function()
				local dt = tick() - t0
				if dt > (dur or 0.3) then
					conn:Disconnect()
					return
				end
				local a = (1 - dt/(dur or 0.3)) * (amp or 0.5)
				cam.CFrame = cam.CFrame * CFrame.Angles(math.rad((math.random()*2-1)*a), math.rad((math.random()*2-1)*a), 0)
			end)
		end,
		OnMyDeath = function(self)
			self.State.Streak = 0
			self.State.Multi = 0
		end,
		RegisterKill = function(self, oppName)
			-- STREAK
			self.State.Streak = (self.State.Streak or 0) + 1
			-- MULTI: если прошло < 18 сек с прошлого, +1, иначе сброс
			local now = tick()
			if self._lastKillAt and (now - self._lastKillAt) <= (self.State.MultiWindow or 18) then
				self.State.Multi = (self.State.Multi or 0) + 1
			else
				self.State.Multi = 1
			end
			self._lastKillAt = now
			-- FIRST BLOOD
			if not self.State.FirstBloodDone then
				self.State.FirstBloodDone = true
				self:ShowBanner("FIRST BLOOD!", "Первая кровь матча — Fosfor открыл счёт!", Color3.fromRGB(255, 80, 80))
			end
			-- MULTI-баннер
			local mt = self.MULTI_TEXTS[self.State.Multi]
			if mt then
				self:ShowBanner(mt, string.format("Fosfor — %d киллов подряд за 18 секунд", self.State.Multi), Color3.fromRGB(220, 60, 60))
				if self.State.Multi >= 5 then
					self:ScreenFlash(Color3.fromRGB(220, 30, 30), 0.45)
					self:CamShake(0.6, 0.3)
				end
			end
			-- STREAK-баннер
			local st = self.STREAK_TEXTS[self.State.Streak]
			if st then
				local sub = string.format("Fosfor — %d киллов подряд", self.State.Streak)
				self:ShowBanner(st, sub, Color3.fromRGB(255, 40, 40))
				if self.State.Streak >= 8 then
					self:ScreenFlash(Color3.fromRGB(180, 20, 20), 0.6)
					self:CamShake(0.7, 0.4)
				end
			end
		end,
		OnEnable = function(self)
			self.State.Streak = self.State.Streak or 0
			self.State.Multi = self.State.Multi or 0
			self.State.FirstBloodDone = self.State.FirstBloodDone == true
			self._lastKillAt = 0
			-- следим за своей смертью
			local function bindDeath()
				local char = player.Character
				if not char then return end
				local hum = char:FindFirstChildOfClass("Humanoid")
				if not hum then return end
				hum.Died:Connect(function() self:OnMyDeath() end)
			end
			bindDeath()
			player.CharacterAdded:Connect(function() task.delay(0.5, bindDeath) end)
			-- хук на PVP.Award
			local pvp = Mods.Get("PVP")
			if pvp and not pvp._FosforKillStreaksHooked then
				pvp._FosforKillStreaksHooked = true
				local origAward = pvp.Award
				pvp.Award = function(p, side, reason, ...)
					local r = origAward(p, side, reason, ...)
					if side == "me" and reason == "kill" then
						pcall(function() self:RegisterKill(p.OpponentName or "") end)
					end
					return r
				end
			end
			log("KillStreaks активен (Dota-стиль)")
		end,
		OnDisable = function(self)
			if self.Banner and self.Banner.Parent then self.Banner:Destroy() end
			-- хук оставляем, чтобы не ронять PVP
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: ИКОНКА МОНЕТ → КРИСТАЛЛ ФОСФОРА (подмена в game-балансе)
	-- ============================================================
	Mods.Register({
		Id = "CoinStyle",
		Tab = "Visual",
		Name = "Стиль монет",
		Icon = "",
		Desc = "",
		Defaults = {},
		Build = function(self, u)
			u.Section("Стиль монет")
			self._masterToggle = u.Toggle("Иконка кристалла + новый шрифт у баланса", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
			end)
		end,
		CRYSTAL_ID = "rbxassetid://117047005144143", -- изображение-логотип Fosfor
		NEW_FONT    = Enum.Font.GothamBold, -- жирный шрифт цифр баланса (Font-объекты движок не принимает)
		-- это иконка монеты? (квадратная, маленькая, не пустая)
		IsCoinIcon = function(self, img)
			if not img or (not img:IsA("ImageLabel") and not img:IsA("ImageButton")) then return false end
			if img.Image == "" then return false end
			if img.Image == self.CRYSTAL_ID then return false end
			local n = (img.Name or ""):lower()
			if n:find("coin") or n:find("money") or n:find("cash") or n:find("dollar") or n:find("gem") or n:find("icon") or n:find("валюта") or n:find("монет") then
				return true
			end
			local sz = img.AbsoluteSize
			-- маленькая и более-менее квадратная — типичная иконка
			if sz.X > 0 and sz.Y > 0 and sz.X <= 80 and sz.Y <= 80 and math.abs(sz.X - sz.Y) <= 24 then
				return true
			end
			return false
		end,
		-- это текст баланса? (содержит число, не слишком короткое/длинное)
		IsBalanceText = function(self, lbl)
			if not lbl or not (lbl:IsA("TextLabel") or lbl:IsA("TextButton")) then return false end
			local t = lbl.Text or ""
			local cleaned = t:gsub("[%s,%.%-%+%_%$%a]", "")
			if cleaned:match("^%d+$") and #cleaned >= 1 and #cleaned <= 16 then
				return true
			end
			return false
		end,
		-- ищем ближайшую иконку к балансовому TextLabel (в parent и в parent.parent, и в children)
		FindIconForBalance = function(self, balanceLabel)
			if not balanceLabel then return nil end
			-- 1) известный путь игры: MenuGui.TopRight.CoinsFrame.CoinsDisplay (замочек сидит там)
			local ok, known = pcall(function()
				local pg = player:FindFirstChild("PlayerGui")
				local menu = pg and (pg:FindFirstChild("MenuGui") or pg:FindFirstChild("Menu"))
				local top = menu and (menu:FindFirstChild("TopRight") or menu:FindFirstChild("TopBar"))
				local cf = top and (top:FindFirstChild("CoinsFrame") or top)
				local cd = cf and cf:FindFirstChild("CoinsDisplay")
				if not cd then return nil end
				local ci = cd:FindFirstChild("CoinImage")
				if ci and ci.Image ~= "" and ci.Image ~= self.CRYSTAL_ID then return ci end
				for _, c in ipairs(cd:GetChildren()) do
					if (c:IsA("ImageLabel") or c:IsA("ImageButton")) and c.Image ~= "" and c.Image ~= self.CRYSTAL_ID then
						return c
					end
				end
				return nil
			end)
			if ok and known then return known end
			local sources = {}
			local p1 = balanceLabel.Parent
			if p1 then table.insert(sources, p1) end
			if p1 and p1.Parent then table.insert(sources, p1.Parent) end
			-- ищем ImageLabel рядом (siblings + parent's children)
			for _, src in ipairs(sources) do
				for _, c in ipairs(src:GetChildren()) do
					if c ~= balanceLabel and self:IsCoinIcon(c) then
						return c
					end
				end
			end
			-- рекурсивно в parent.parent (1 уровень)
			if p1 and p1.Parent then
				for _, c in ipairs(p1.Parent:GetChildren()) do
					if c:IsA("Frame") or c:IsA("TextButton") then
						for _, gc in ipairs(c:GetChildren()) do
							if self:IsCoinIcon(gc) then return gc end
						end
					end
				end
			end
			return nil
		end,
		-- ищем первый подходящий TextLabel баланса в PlayerGui
		FindBalance = function(self)
			local pg = player:FindFirstChild("PlayerGui")
			if not pg then return nil end
			-- приоритет: TopRight / TopBar / HUD в MenuGui
			local found
			pcall(function()
				local menu = pg:FindFirstChild("MenuGui") or pg:FindFirstChild("Menu")
				if not menu then return end
				local top = menu:FindFirstChild("TopRight") or menu:FindFirstChild("TopBar") or menu:FindFirstChild("HUD") or menu
				for _, d in ipairs(top:GetDescendants()) do
					if self:IsBalanceText(d) then found = d; return end
				end
			end)
			if found then return found end
			-- fallback: по всему PlayerGui
			pcall(function()
				for _, d in ipairs(pg:GetDescendants()) do
					if self:IsBalanceText(d) then found = d; return end
				end
			end)
			return found
		end,
		-- находим контейнер дисплея монет
		FindCoinDisplay = function(self)
			local ok, cd = pcall(function()
				local pg = player:FindFirstChild("PlayerGui")
				if not pg then return nil end
				local menu = pg:FindFirstChild("MenuGui")
				local top = menu and menu:FindFirstChild("TopRight")
				local cf = top and top:FindFirstChild("CoinsFrame")
				if cf and cf:FindFirstChild("CoinsDisplay") then return cf:FindFirstChild("CoinsDisplay") end
				for _, d in ipairs(pg:GetDescendants()) do
					if d.Name == "CoinsDisplay" then return d end
				end
				return nil
			end)
			if ok then return cd end
			return nil
		end,
		-- есть ли в тексте эмодзи-иконка (замочек и т.п.)
		HasEmojiIcon = function(self, text)
			if typeof(text) ~= "string" or text == "" then return false end
			local hit = false
			pcall(function()
				for _, cp in utf8.codes(text) do
					if (cp >= 0x1F000 and cp <= 0x1FAFF) or (cp >= 0x2600 and cp <= 0x27BF) then
						hit = true
						break
					end
				end
			end)
			return hit
		end,
		-- держим замену: игра любит перерисовывать свой HUD
		WatchCoin = function(self, obj, prop, desired)
			self._coinConns = self._coinConns or {}
			if self._coinConns[obj] then return end
			self._coinConns[obj] = true
			Mods.Connect(self, obj:GetPropertyChangedSignal(prop):Connect(function()
				if self.Enabled and obj.Parent and obj[prop] ~= desired then
					obj[prop] = desired
				end
			end))
		end,
		-- главная замена: картинка ИЛИ эмодзи-текст на кристалл
		ReplaceCoinIcons = function(self)
			local DIAMOND = utf8.char(0x1F48E)
			local done = 0
			local cd = self:FindCoinDisplay()
			local scopes = {}
			if cd then
				table.insert(scopes, cd)
				if cd.Parent then table.insert(scopes, cd.Parent) end
			end
			for _, scope in ipairs(scopes) do
				for _, c in ipairs(scope:GetDescendants()) do
					if (c:IsA("ImageLabel") or c:IsA("ImageButton")) and c.Image ~= "" and c.Image ~= self.CRYSTAL_ID then
						self.Saved[c] = {image = c.Image}
						c.Image = self.CRYSTAL_ID
						self:WatchCoin(c, "Image", self.CRYSTAL_ID)
						done = done + 1
					elseif c:IsA("TextLabel") and self:HasEmojiIcon(c.Text) then
						self.Saved[c] = {text = c.Text}
						c.Text = ""
						if not c:FindFirstChild("FosforCoinDecal") then
							local img = Instance.new("ImageLabel")
							img.Name = "FosforCoinDecal"
							img.Size = UDim2.fromScale(1, 1)
							img.Position = UDim2.fromScale(0, 0)
							img.BackgroundTransparency = 1
							img.Image = self.CRYSTAL_ID
							img.Parent = c
						end
						self:WatchCoin(c, "Text", "")
						done = done + 1
					end
				end
				if done > 0 then break end
			end
			return done
		end,
		Apply = function(self)
			local balanceLabel = self:FindBalance()
			if not balanceLabel then
				if not self._warnedNoBalance then
					self._warnedNoBalance = true
					log("CoinStyle: HUD баланса ещё не загрузился — применю при появлении")
				end
				return
			end
			self.Saved = self.Saved or {}
			-- подменяем шрифт + белый цвет
			if balanceLabel.Font ~= self.NEW_FONT or balanceLabel.TextColor3 ~= Color3.fromRGB(255, 255, 255) then
				self.Saved[balanceLabel] = self.Saved[balanceLabel] or {}
				self.Saved[balanceLabel].Font = balanceLabel.Font
				self.Saved[balanceLabel].color = balanceLabel.TextColor3
				balanceLabel.Font = self.NEW_FONT
				balanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
			-- иконка: сначала дисплей монет, потом эвристика рядом с балансом
			local n = self:ReplaceCoinIcons()
			if n == 0 then
				local icon = self:FindIconForBalance(balanceLabel)
				if icon then
					self.Saved[icon] = {image = icon.Image}
					icon.Image = self.CRYSTAL_ID
					self:WatchCoin(icon, "Image", self.CRYSTAL_ID)
					n = 1
				end
			end
			if not self._loggedApply then
				self._loggedApply = true
				log(n > 0 and "CoinStyle применён: логотип + жирный белый шрифт" or "CoinStyle применён: жирный белый шрифт")
			end
		end,
		OnEnable = function(self)
			self.Saved = {}
			self._loggedApply = false
			self._warnedNoBalance = false
			self:Apply()
			-- следим за появлением нового TextLabel баланса
			local pg = player:FindFirstChild("PlayerGui")
			if pg then
				Mods.Connect(self, pg.DescendantAdded:Connect(function(d)
					task.defer(function()
						if not self.Enabled then return end
						if self:IsBalanceText(d) then
							self.Saved = self.Saved or {}
							if d.Font ~= self.NEW_FONT or d.TextColor3 ~= Color3.fromRGB(255, 255, 255) then
								self.Saved[d] = self.Saved[d] or {}
								self.Saved[d].Font = d.Font
								self.Saved[d].color = d.TextColor3
								d.Font = self.NEW_FONT
								d.TextColor3 = Color3.fromRGB(255, 255, 255)
							end
							self:ReplaceCoinIcons()
						end
					end)
				end))
			end
		end,
		OnDisable = function(self)
			if self.Saved then
				for obj, val in pairs(self.Saved) do
														if obj and obj.Parent then
						pcall(function()
							local fcd = obj:FindFirstChild("FosforCoinDecal")
							if fcd then fcd:Destroy() end
							if typeof(val) == "table" then
								if val.image then obj.Image = val.image end
								if val.text then obj.Text = val.text end
								if val.Font then obj.Font = val.Font end
									if val.color then obj.TextColor3 = val.color end
							elseif typeof(val) == "string" then
								obj.Image = val
							end
						end)
					end
				end
			end
			self.Saved = nil
			log("CoinStyle: оригинальный шрифт и иконка возвращены")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: КОСМЕТИКА ПЕРСОНАЖА (Visual; Korblox + Headless)
	-- Чисто клиентский визуал: другие игроки видят обычного персонажа.
	-- Headless: с головы сносится лицо/меш, ставится пень-меш; опция — полностью невидимая голова.
	-- Korblox: правая нога скрывается, вместо неё клиентская культя на вельде.
	-- Респавн: повторное применение по флагу, иначе косметика слетает.
	-- ============================================================
	Mods.Register({
		Id = "CharCosmetics",
		Tab = "Visual",
		Name = "Korblox и Headless",
		Defaults = {Korblox = true, Headless = true, InvisibleHead = false, RespawnPersist = true},
		Build = function(self, u)
			u.Section("Korblox + Headless (только для тебя)")
			self._masterToggle = u.Toggle("Korblox и Headless", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Korblox (правая нога)", self.State.Korblox ~= false, function(v)
				self.State.Korblox = v
				if self.Enabled then
					if v then self:ApplyLeg(player.Character) else self:StripLeg(player.Character) end
				end
			end))
			subAdd(self, u.Toggle("Headless (пенёк-шея)", self.State.Headless ~= false, function(v)
				self.State.Headless = v
				if self.Enabled then
					if v then self:ApplyHead(player.Character) else self:StripHead(player.Character) end
				end
			end))
			subAdd(self, u.Toggle("Голова полностью невидима", self.State.InvisibleHead == true, function(v)
				self.State.InvisibleHead = v
				if self.Enabled and self.State.Headless then self:ApplyHead(player.Character) end
			end))
			subAdd(self, u.Toggle("Повторять при респавне", self.State.RespawnPersist ~= false, function(v)
				self.State.RespawnPersist = v
			end))
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		ApplyHead = function(self, char)
			char = char or player.Character
			local head = char and char:FindFirstChild("Head")
			if not head then return end
			-- бэкап оригинала один раз на персонажа (лицо, меш, цвет кожи)
			if not self.HeadBackup or self.HeadBackupChar ~= char then
				local bk = {decals = {}, meshes = {}, char = char}
				pcall(function()
					bk.color = head.BrickColor
					bk.material = head.Material
					bk.transparency = head.Transparency
					for _, o in ipairs(head:GetChildren()) do
						if o:IsA("Decal") then
							table.insert(bk.decals, {tex = o.Texture, face = o.Face})
						elseif o:IsA("SpecialMesh") then
							table.insert(bk.meshes, {mtype = o.MeshType, id = o.MeshId, tex = o.TextureId, scale = o.Scale, off = o.Offset, name = o.Name})
						end
					end
				end)
				self.HeadBackup = bk
				self.HeadBackupChar = char
			end
			-- снести родное лицо и меш
			for _, o in ipairs(head:GetChildren()) do
				if o:IsA("Decal") or o:IsA("SpecialMesh") then o:Destroy() end
			end
			-- пень-шея
			local m = Instance.new("SpecialMesh")
			m.Name = "PhantomHeadlessMesh"
			m.MeshType = Enum.MeshType.FileMesh
			m.MeshId = "rbxassetid://134082579"
			m.TextureId = "rbxassetid://134082627"
			m.Scale = Vector3.new(1.25, 1.25, 1.25)
			m.Parent = head
			head.BrickColor = BrickColor.new("Really black")
			head.Material = Enum.Material.Plastic
			head.Transparency = self.State.InvisibleHead and 1 or 0.1
		end,
		StripHead = function(self, char)
			char = char or player.Character
			local head = char and char:FindFirstChild("Head")
			if not head then return end
			local pm = head:FindFirstChild("PhantomHeadlessMesh")
			if pm then pm:Destroy() end
			local bk = (self.HeadBackup and self.HeadBackupChar == char) and self.HeadBackup or nil
			pcall(function()
				if bk then
					head.BrickColor = bk.color
					head.Material = bk.material
					head.Transparency = bk.transparency
					for _, d in ipairs(bk.decals) do
						local nd = Instance.new("Decal")
						nd.Texture = d.tex
						nd.Face = d.face
						nd.Parent = head
					end
					for _, md in ipairs(bk.meshes) do
						local nm = Instance.new("SpecialMesh")
						nm.Name = md.name
						nm.MeshType = md.mtype
						nm.MeshId = md.id
						nm.TextureId = md.tex
						nm.Scale = md.scale
						nm.Offset = md.off
						nm.Parent = head
					end
				else
					head.Transparency = 0
				end
			end)
			if bk then self.HeadBackup = nil self.HeadBackupChar = nil end
		end,
		ApplyLeg = function(self, char)
			char = char or player.Character
			local rleg = char and (char:FindFirstChild("Right Leg") or char:FindFirstChild("RightLowerLeg"))
			if not rleg then return end
			self:StripLeg(char)
			rleg.Transparency = 1
			local fake = Instance.new("Part")
			fake.Name = "PhantomKorbloxLeg"
			fake.Size = rleg.Size
			fake.CFrame = rleg.CFrame
			fake.CanCollide = false
			fake.Massless = true
			fake.BrickColor = BrickColor.new("Really black")
			fake.Material = Enum.Material.Plastic
			fake.Parent = char
			local mesh = Instance.new("SpecialMesh")
			mesh.MeshType = Enum.MeshType.FileMesh
			mesh.MeshId = "rbxassetid://101851696"
			mesh.TextureId = "rbxassetid://101851254"
			mesh.Scale = Vector3.new(1, 1, 1)
			mesh.Parent = fake
			local weld = Instance.new("WeldConstraint")
			weld.Part0 = rleg
			weld.Part1 = fake
			weld.Parent = fake
			Mods.Track(self, fake)
		end,
		StripLeg = function(self, char)
			char = char or player.Character
			if not char then return end
			local rleg = char:FindFirstChild("Right Leg") or char:FindFirstChild("RightLowerLeg")
			if rleg then rleg.Transparency = 0 end
			local old = char:FindFirstChild("PhantomKorbloxLeg")
			if old then old:Destroy() end
		end,
		Apply = function(self, char)
			char = char or player.Character
			if not char then return end
			if self.State.Headless then self:ApplyHead(char) end
			if self.State.Korblox then self:ApplyLeg(char) end
		end,
		Strip = function(self, char)
			char = char or player.Character
			if not char then return end
			self:StripHead(char)
			self:StripLeg(char)
		end,
		OnEnable = function(self)
			self:Apply()
			-- респавн: косметика слетает с новым персонажем — повторяем по флагу
			self.ConnChar = Mods.Connect(self, player.CharacterAdded:Connect(function(char)
				if self.State.RespawnPersist ~= false then
					task.delay(1, function()
						if self.Enabled then self:Apply(char) end
					end)
				end
			end))
			log("Korblox и Headless применена (видна только тебе)")
		end,
		OnDisable = function(self)
			self:Strip()
			log("Korblox и Headless снята, оригинал возвращён")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: РАСКРАСКА ДОСОК (Visual; цвет + текст на своих паллетах)
	-- Клиентский визуал: колёсико цвета доски (с затемнением к центру),
	-- колёсико цвета текста, надпись через SurfaceGui на верхней грани.
	-- По умолчанию: чёрная доска, белый текст "Fosfor".
	-- ============================================================
	Mods.Register({
		Id = "BoardPainter",
		Tab = "Visual",
		Name = "Раскраска досок",
		Defaults = {Board = {0, 0, 0}, Text = {1, 1, 1}, Label = "Fosfor"},
		Build = function(self, u)
			u.Section("Раскраска досок")
			self._masterToggle = u.Toggle("Раскраска досок (цвет + текст)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)

			local function boardColor()
				local t = self.State.Board or {0, 0, 0}
				return Color3.new(t[1] or 0, t[2] or 0, t[3] or 0)
			end
			local function textColor()
				local t = self.State.Text or {1, 1, 1}
				return Color3.new(t[1] or 1, t[2] or 1, t[3] or 1)
			end

			-- строка: колесо доски | колесо текста | превью + пресет
			u.Button("Настроить цвет и текст досок", function()
				openSidePanel("Раскраска досок", function(content)
			local wheelRow = UI.row(content, 1, 256)

			local boardWheel = Instance.new("Frame")
			boardWheel.Name = "BoardWheel"
			boardWheel.Size = UDim2.fromOffset(204, 204)
			boardWheel.Position = UDim2.new(0, 16, 0, 34)
			boardWheel.BackgroundTransparency = 1
			boardWheel.Parent = wheelRow
			local boardTitle = Instance.new("TextLabel")
			boardTitle.Size = UDim2.new(0, 202, 0, 16)
			boardTitle.Position = UDim2.new(0, 16, 0, 4)
			boardTitle.BackgroundTransparency = 1
			boardTitle.Text = "Цвет доски (центр = темнее)"
			boardTitle.TextColor3 = currentPalette.sub
			boardTitle.Font = Enum.Font.Gotham
			boardTitle.TextSize = 12
			boardTitle.Parent = wheelRow
			addThemed("text", boardTitle)

			local textWheel = Instance.new("Frame")
			textWheel.Name = "TextWheel"
			textWheel.Size = UDim2.fromOffset(168, 168)
			textWheel.Position = UDim2.new(0, 252, 0, 30)
			textWheel.BackgroundTransparency = 1
			textWheel.Parent = wheelRow
			local textTitle = Instance.new("TextLabel")
			textTitle.Size = UDim2.new(0, 150, 0, 18)
			textTitle.Position = UDim2.new(0, 252, 0, 4)
			textTitle.BackgroundTransparency = 1
			textTitle.Text = "Цвет текста"
			textTitle.TextColor3 = currentPalette.sub
			textTitle.Font = Enum.Font.Gotham
			textTitle.TextSize = 12
			textTitle.Parent = wheelRow
			addThemed("text", textTitle)

			-- колесо доски: 5 колец, значение к центру затемняется
			do
				local rings, segments = 6, 44
				local centerDot = Instance.new("Frame")
				centerDot.Size = UDim2.fromOffset(12, 12)
				centerDot.Position = UDim2.new(0.5, -6, 0.5, -6)
				centerDot.BackgroundColor3 = Color3.new(0, 0, 0)
				centerDot.BorderSizePixel = 0
				centerDot.Parent = boardWheel
				UI.corner(centerDot, 7)
				for r = 1, rings do
					local radius = (r / rings) * 90
					local value = r / rings
					for i = 1, segments do
						local angle = ((i - 1) / segments) * math.pi * 2
						local hue = (i - 1) / segments
						local seg = Instance.new("Frame")
						seg.Size = UDim2.fromOffset(10, 10)
						seg.Position = UDim2.new(0.5, math.cos(angle) * radius - 5, 0.5, math.sin(angle) * radius - 5)
						seg.BackgroundColor3 = Color3.fromHSV(hue, 1, value)
						seg.BorderSizePixel = 0
						seg.Parent = boardWheel
						UI.corner(seg, 6)
					end
				end
			end
			-- колесо текста: одно кольцо ярких оттенков
			do
				local segments = 44
				for i = 1, segments do
					local angle = ((i - 1) / segments) * math.pi * 2
					local hue = (i - 1) / segments
					local seg = Instance.new("Frame")
					seg.Size = UDim2.fromOffset(14, 14)
					seg.Position = UDim2.new(0.5, math.cos(angle) * 66 - 7, 0.5, math.sin(angle) * 66 - 7)
					seg.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
					seg.BorderSizePixel = 0
					seg.Parent = textWheel
					UI.corner(seg, 8)
				end
			end

			-- превью-доска + пресет дефолта
			local preview = Instance.new("Frame")
			preview.Name = "BoardPreview"
			preview.Size = UDim2.fromOffset(118, 70)
			preview.Position = UDim2.new(1, -136, 0, 44)
			preview.BackgroundColor3 = boardColor()
			preview.BorderSizePixel = 0
			preview.Parent = wheelRow
			UI.corner(preview, 10)
			UI.stroke(preview, 0.55, 1)
			local previewLabel = Instance.new("TextLabel")
			previewLabel.Size = UDim2.new(1, -10, 1, -10)
			previewLabel.Position = UDim2.new(0, 5, 0, 5)
			previewLabel.BackgroundTransparency = 1
			previewLabel.Text = self.State.Label or "Fosfor"
			previewLabel.TextColor3 = textColor()
			previewLabel.TextScaled = true
			previewLabel.Font = Enum.Font.GothamBold
			previewLabel.Parent = preview

			local function refreshPreview()
				preview.BackgroundColor3 = boardColor()
				previewLabel.TextColor3 = textColor()
				previewLabel.Text = self.State.Label or ""
			end

			local labelBox
			local presetBtn = UI.button({
				Name = "PresetDefault", Parent = wheelRow,
				Size = UDim2.fromOffset(118, 26), Position = UDim2.new(1, -136, 0, 122),
				BackgroundTransparency = 0.1, Text = "Чёрная + Fosfor", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 10,
			})
			UI.basicHover(presetBtn, 0.1, 0.03, 0.6, 0.08)
			presetBtn.MouseButton1Click:Connect(function()
				self.State.Board = {0, 0, 0}
				self.State.Text = {1, 1, 1}
				self.State.Label = "Fosfor"
				labelBox.Text = "Fosfor"
				refreshPreview()
				log("Раскраска: пресет — чёрная доска, белый Fosfor")
			end)

			-- строка текста
			local labelRow = UI.row(content, 2, 44)
			local labelCaption = Instance.new("TextLabel")
			labelCaption.Size = UDim2.new(0, 150, 1, 0)
			labelCaption.Position = UDim2.new(0, 14, 0, 0)
			labelCaption.BackgroundTransparency = 1
			labelCaption.Text = "Текст на доске:"
			labelCaption.TextColor3 = currentPalette.text
			labelCaption.Font = Enum.Font.Gotham
			labelCaption.TextSize = 14
			labelCaption.TextXAlignment = Enum.TextXAlignment.Left
			labelCaption.Parent = labelRow
			addThemed("text", labelCaption)
			labelBox = Instance.new("TextBox")
			labelBox.Name = "BoardLabelBox"
			labelBox.Size = UDim2.new(1, -200, 1, -8)
			labelBox.Position = UDim2.new(0, 170, 0, 4)
			labelBox.BackgroundColor3 = currentPalette.element
			labelBox.BackgroundTransparency = 0.1
			labelBox.BorderSizePixel = 0
			labelBox.Text = tostring(self.State.Label or "")
			labelBox.PlaceholderText = "до 10 символов"
			labelBox.PlaceholderColor3 = currentPalette.sub
			labelBox.TextColor3 = currentPalette.text
			labelBox.Font = Enum.Font.Gotham
			labelBox.TextSize = 14
			labelBox.TextXAlignment = Enum.TextXAlignment.Left
			labelBox.ClearTextOnFocus = false
			labelBox.Parent = labelRow
			addThemed("element", labelBox)
			addThemed("text", labelBox)
			UI.corner(labelBox, 10)
			UI.stroke(labelBox, 0.6, 1)
			UI.padding(labelBox, 10, 8, 0, 0)
			UI.focusFX(labelBox)
			labelBox:GetPropertyChangedSignal("Text"):Connect(function()
				if #labelBox.Text > 10 then
					labelBox.Text = string.sub(labelBox.Text, 1, 10)
				end
				self.State.Label = labelBox.Text
				refreshPreview()
			end)

			-- покраска уже существующих своих досок
			local paintRow = UI.row(content, 3, 42)
			local paintCaption = Instance.new("TextLabel")
			paintCaption.Size = UDim2.new(1, -140, 1, 0)
			paintCaption.Position = UDim2.new(0, 14, 0, 0)
			paintCaption.BackgroundTransparency = 1
			paintCaption.Text = "Покрасить мои доски:"
			paintCaption.TextColor3 = currentPalette.text
			paintCaption.Font = Enum.Font.Gotham
			paintCaption.TextSize = 14
			paintCaption.TextXAlignment = Enum.TextXAlignment.Left
			paintCaption.Parent = paintRow
			addThemed("text", paintCaption)
			local paintBtn = UI.button({
				Name = "PaintNow", Parent = paintRow,
				Size = UDim2.fromOffset(118, 28), Position = UDim2.new(1, -128, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Покрасить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Corner = 10,
			})
			UI.basicHover(paintBtn, 0.1, 0.03, 0.6, 0.08)
			paintBtn.MouseButton1Click:Connect(function()
				local count = 0
				for _, d in ipairs(workspace:GetDescendants()) do
					if d.Name == "PalletLightBrown" and self:IsOwned(d) then
						self:ApplyTo(d)
						count = count + 1
					end
				end
				log("Раскраска: покрашено досок: " .. tostring(count), "info")
			end)

			-- выбор цвета мышью с колёс
			local holdingBoard, holdingText = false, false
			local function advancedColor(wheel)
				local mp = UserInputService:GetMouseLocation()
				local center = wheel.AbsolutePosition + wheel.AbsoluteSize / 2
				local delta = mp - center
				local maxRadius = wheel.AbsoluteSize.X / 2
				local angle = math.atan2(delta.Y, delta.X)
				if angle < 0 then angle = angle + math.pi * 2 end
				local val = clamp(delta.Magnitude / maxRadius, 0, 1)
				return Color3.fromHSV(angle / (math.pi * 2), 1, val)
			end
			local function simpleColor(wheel)
				local mp = UserInputService:GetMouseLocation()
				local center = wheel.AbsolutePosition + wheel.AbsoluteSize / 2
				local delta = mp - center
				local angle = math.atan2(delta.Y, delta.X)
				if angle < 0 then angle = angle + math.pi * 2 end
				return Color3.fromHSV(angle / (math.pi * 2), 1, 1)
			end
			local function storeColor(key, c)
				self.State[key] = {math.floor(c.R * 1000 + 0.5) / 1000, math.floor(c.G * 1000 + 0.5) / 1000, math.floor(c.B * 1000 + 0.5) / 1000}
				refreshPreview()
			end
			Mods.Connect(self, boardWheel.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					holdingBoard = true
					storeColor("Board", advancedColor(boardWheel))
				end
			end))
			Mods.Connect(self, textWheel.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					holdingText = true
					storeColor("Text", simpleColor(textWheel))
				end
			end))
			Mods.Connect(self, UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					holdingBoard = false
					holdingText = false
				end
			end))
			Mods.Connect(self, UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if holdingBoard then
						storeColor("Board", advancedColor(boardWheel))
					elseif holdingText then
						storeColor("Text", simpleColor(textWheel))
					end
				end
			end))

			refreshPreview()

				end)
			end)		end,
		IsOwned = function(self, object)
			if object:GetAttribute("Owner") == player.Name then return true end
			local ow = object:FindFirstChild("Owner")
			if ow and ow.Value == player then return true end
			local char = player.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp then
				local pp = object:IsA("BasePart") and object or object:FindFirstChildWhichIsA("BasePart")
				if pp and (pp.Position - hrp.Position).Magnitude <= 20 then
					return true
				end
			end
			return false
		end,
		ApplyTo = function(self, object)
			local bc = self.State.Board or {0, 0, 0}
			local boardColor = Color3.new(bc[1] or 0, bc[2] or 0, bc[3] or 0)
			local tc = self.State.Text or {1, 1, 1}
			local textColor = Color3.new(tc[1] or 1, tc[2] or 1, tc[3] or 1)
			local label = tostring(self.State.Label or "")
			local function paint(part)
				if not part:IsA("BasePart") then return end
				for _, child in ipairs(part:GetChildren()) do
					if child:IsA("Decal") or child:IsA("Texture") or child.Name == "FosforBoardText" then
						child:Destroy()
					end
				end
				pcall(function()
					TweenService:Create(part, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = boardColor}):Play()
				end)
			end
			if object:IsA("BasePart") then paint(object) end
			for _, child in ipairs(object:GetDescendants()) do
				paint(child)
			end
			-- надпись на самой большой верхней детали
			local centerPart = object:IsA("BasePart") and object or nil
			local maxArea = 0
			for _, child in ipairs(object:GetDescendants()) do
				if child:IsA("BasePart") then
					local area = child.Size.X * child.Size.Z
					if area > maxArea then
						maxArea = area
						centerPart = child
					end
				end
			end
			if label ~= "" and centerPart then
				local sg = Instance.new("SurfaceGui")
				sg.Name = "FosforBoardText"
				sg.Face = Enum.NormalId.Top
				sg.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
				sg.PixelsPerStud = 50
				sg.Parent = centerPart
				local lbl = Instance.new("TextLabel")
				lbl.AnchorPoint = Vector2.new(0.5, 0.5)
				lbl.Position = UDim2.fromScale(0.5, 0.5)
				lbl.Size = UDim2.new(0.9, 0, 0.8, 0)
				lbl.BackgroundTransparency = 1
				lbl.Text = label
				lbl.TextColor3 = textColor
				lbl.TextTransparency = 1
				lbl.TextScaled = true
				lbl.Font = Enum.Font.GothamBold
				lbl.Parent = sg
				TweenService:Create(lbl, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
			end
		end,
		OnEnable = function(self)
			local function onAdded(o)
				if o.Name ~= "PalletLightBrown" then return end
				task.delay(0.05, function()
					if self.Enabled and o.Parent and self:IsOwned(o) then
						self:ApplyTo(o)
					end
				end)
			end
			self.Conn1 = Mods.Connect(self, workspace.ChildAdded:Connect(onAdded))
			self.Conn2 = Mods.Connect(self, workspace.DescendantAdded:Connect(onAdded))
			log("Раскраска досок включена (дефолт: чёрная + белый Fosfor)")
		end,
		OnDisable = function(self)
			-- снимаем свои надписи (цвет движок не вернёт — декали уже снесены)
			pcall(function()
				for _, d in ipairs(workspace:GetDescendants()) do
					if d.Name == "FosforBoardText" then d:Destroy() end
				end
			end)
			log("Раскраска досок выключена (надписи сняты, цвет досок останется до респавна доски)")
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: BOOST FPS MAP (Maps; блокаут-арена в стиле dust2)
	-- ============================================================
	Mods.Register({
		Id = "BoostFPSMap",
		Tab = "Maps",
		Name = "Boost FPS Map",
		Defaults = {Height = 320},
		Build = function(self, u)
			u.Section("Boost FPS Map")
			u.Button("Построить карту Boost FPS", function() self:BuildMap() end)
			u.Button("Убрать карту", function() self:RemoveMap() log("Boost FPS Map: карта убрана") end)
			u.Button("Телепорт на карту", function()
				pcall(function()
					local hrp = Lib.rootOf(player.Character)
					if hrp and self.Model then
						hrp.CFrame = CFrame.new(self.Model:GetPivot().Position + Vector3.new(0, 12, 0))
					else
						log("Boost FPS Map: сначала постройте карту")
					end
				end)
			end)
		end,
		MapOrigin = function(self)
			return Vector3.new(420, self.State.Height or 320, 420)
		end,
		RemoveMap = function(self)
			pcall(function() if self.Model then self.Model:Destroy() end end)
			self.Model = nil
		end,
		BuildMap = function(self)
			self:RemoveMap()
			local origin = self:MapOrigin()
			local model = Instance.new("Model")
			model.Name = "FosforBoostFPSMap"
			local W = Color3.fromRGB(238, 238, 242)
			local W2 = Color3.fromRGB(226, 226, 232)
			local G = Color3.fromRGB(200, 200, 205)
			local B = Color3.fromRGB(88, 108, 235)
			local D = Color3.fromRGB(64, 82, 220)
			local function part(sx, sy, sz, x, y, z, color)
				local p = Instance.new("Part")
				p.Anchored = true
				p.Size = Vector3.new(sx, sy, sz)
				p.CFrame = CFrame.new(origin.X + x, origin.Y + y, origin.Z + z)
				p.Color = color
				p.Material = Enum.Material.SmoothPlastic
				p.TopSurface = Enum.SurfaceType.Smooth
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.Parent = model
				return p
			end
			local function building(cx, cz, sx, sz, h, floors)
				part(sx, h, sz, cx, h / 2, cz, W)
				part(sx + 3, 1.4, sz + 3, cx, h + 0.7, cz, B)
				for f = 1, floors do
					local wy = (h / floors) * f - (h / floors) / 2 + 2
					for _, s in ipairs({ -1, 1 }) do
						part(sx * 0.6, 3.2, 0.7, cx, wy, cz + s * (sz / 2 + 0.35), B)
						part(0.7, 3.2, sz * 0.6, cx + s * (sx / 2 + 0.35), wy, cz, B)
					end
				end
				part(6, 9, 0.8, cx, 4.5, cz - sz / 2 - 0.4, D)
			end
			-- земля 480x480 + дорожные полосы
			part(480, 4, 480, 0, -2, 0, G)
			for _, r in ipairs({
				{ 480, 1.2, 6, 0, 0.2, -80 },
				{ 480, 1.2, 6, 0, 0.2, 80 },
				{ 6, 1.2, 480, -80, 0.2, 0 },
				{ 6, 1.2, 480, 80, 0.2, 0 },
				{ 300, 1.2, 5, 0, 0.2, 0 },
			}) do
				part(r[1], r[2], r[3], r[4], r[5], r[6], B)
			end
			-- периметр: белые стены с синей кромкой
			for _, w in ipairs({
				{ 480, 18, 6,   0,  9, -238 },
				{ 480, 18, 6,   0,  9,  238 },
				{ 6, 18, 480, -238,  9,    0 },
				{ 6, 18, 480,  238,  9,    0 },
			}) do
				part(w[1], w[2], w[3], w[4], w[5], w[6], W)
				part(w[1] + ((w[3] < w[1]) and 3 or 0), 2, w[3] + ((w[3] > w[1]) and 3 or 0), w[4], w[5] + w[2] / 2 + 1, w[6], B)
			end
			-- здания: белые коробки, этажи окон, синие крыши, двери
			local builds = {
				{ -120, -150, 70, 40, 60, 4 },
				{  130, -170, 50, 46, 40, 3 },
				{  160,   60, 60, 44, 74, 5 },
				{ -170,  110, 46, 52, 32, 2 },
				{    0, -190, 66, 36, 46, 3 },
				{   30,  180, 44, 44, 54, 4 },
				{  -60,  190, 38, 38, 24, 2 },
				{  190,  -40, 52, 34, 28, 2 },
				{ -200,  -30, 40, 40, 20, 2 },
			}
			for _, b in ipairs(builds) do
				building(b[1], b[2], b[3], b[4], b[5], b[6])
			end
			-- башня
			part(26, 110, 26, -30, 55, 120, W)
			part(30, 3, 30, -30, 111.7, 120, B)
			for f = 1, 6 do
				part(16, 4, 0.8, -30, f * 16, 120 - 13.4, B)
			end
			-- арка в центре
			part(10, 40, 10, -40, 20, -40, W)
			part(10, 40, 10, 40, 20, -40, W)
			part(100, 10, 12, 0, 45, -40, W)
			part(100, 2, 14, 0, 51, -40, B)
			-- центральная площадка с синей рамкой
			part(90, 2, 90, 0, 1, 0, W)
			for _, s in ipairs({ -45, 45 }) do
				part(98, 1.4, 5, 0, 2.6, s, B)
				part(5, 1.4, 98, s, 2.6, 0, B)
			end
			-- ящики группами
			for _, c in ipairs({ { -12, 58 }, { -2, 58 }, { 8, 56 }, { -58, 30 }, { -52, 38 }, { 60, -60 }, { 68, -52 }, { -90, -90 }, { -82, -84 }, { 90, 110 }, { 100, 118 }, { 120, 0 }, { 132, 8 }, { -150, 20 }, { -142, 28 }, { 30, 140 }, { 40, 132 }, { -30, 160 }, { -20, 168 } }) do
				part(6, 6, 6, c[1], 3, c[2], B)
			end
			-- пандусы
			local r1 = part(8, 1.2, 40, 60, 6, 20, W)
			r1.CFrame = CFrame.new(origin.X + 60, origin.Y + 6, origin.Z + 20) * CFrame.Angles(math.rad(-12), 0, 0)
			local r2 = part(8, 1.2, 40, -60, 6, 20, W)
			r2.CFrame = CFrame.new(origin.X - 60, origin.Y + 6, origin.Z + 20) * CFrame.Angles(math.rad(-12), 0, 0)
			model.Parent = workspace
			self.Model = model
			Mods.Track(self, model)
			log("Boost FPS Map: большая карта построена над островом (телепорт — кнопкой)")
		end,
		OnDisable = function(self)
			self:RemoveMap()
		end,
	})

	-- ============================================================
	-- МОДУЛЬ: РЕСТАЙЛ КАРТЫ (Maps; перекраска острова в стиль dust2)
	-- ============================================================
		Mods.Register({
			Id = "MapRestyle",
			Tab = "Maps",
			Name = "Рестайл карты (dust2)",
			Defaults = {Style = "Dust2"},
			Build = function(self, u)
				u.Section("Рестайл карты (стили покраски)")
				local styles = { { "Dust2", "Dust2" }, { "Winter", "Зимняя" }, { "Halloween", "Хэллоуин" }, { "NewYear", "Новый год" }, { "Tournament", "Турнир" } }
				local styleRow = u.Row(40)
				UI.button({Name = "StyleLabel", Parent = styleRow, Size = UDim2.new(0, 116, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Stroke = false, Text = "Стиль покраски:", TextXAlignment = Enum.TextXAlignment.Left, TextSize = 13, Active = false, ThemeText = "text", Font = Enum.Font.Gotham})
				self._styleButtons = {}
				for i, s in ipairs(styles) do
					local btn = UI.button({
						Name = "Style_" .. s[1], Parent = styleRow,
						Size = UDim2.fromOffset(60, 28), Position = UDim2.new(0, 130 + (i - 1) * 64, 0.5, -14),
						Text = s[2], TextSize = 12, BackgroundTransparency = 0.1,
						ThemeBackground = "element", ThemeText = "text", Font = Enum.Font.Gotham, Corner = 8,
					})
					self._styleButtons[s[1]] = btn
					btn.MouseButton1Click:Connect(function()
						self.State.Style = s[1]
						self:UpdateStyleButtons()
					end)
				end
				function self:UpdateStyleButtons()
					for key, btn in pairs(self._styleButtons) do
						local active = (self.State.Style or "Dust2") == key
						btn.BackgroundColor3 = active and currentPalette.text or currentPalette.element
						btn.TextColor3 = active and currentPalette.bg or currentPalette.text
						btn.BackgroundTransparency = active and 0 or 0.1
					end
				end
				self:UpdateStyleButtons()
				u.Button("Покрасить карту выбранным стилем", function() self:Apply() end)
				u.Button("Вернуть оригинальные цвета", function() self:Restore() end)
			end,
			Palette = function(self, style)
				if style == "Winter" then
					return { G = Color3.fromRGB(236, 240, 250), W = Color3.fromRGB(242, 246, 255), W2 = Color3.fromRGB(214, 226, 248), B = Color3.fromRGB(110, 150, 255), D = Color3.fromRGB(60, 90, 200) }
				end
				if style == "Halloween" then
					return { G = Color3.fromRGB(72, 62, 66), W = Color3.fromRGB(98, 84, 92), W2 = Color3.fromRGB(70, 58, 68), B = Color3.fromRGB(255, 138, 28), D = Color3.fromRGB(38, 28, 38) }
				end
				if style == "NewYear" then
					return { G = Color3.fromRGB(224, 230, 246), W = Color3.fromRGB(246, 249, 255), W2 = Color3.fromRGB(212, 224, 252), B = Color3.fromRGB(210, 36, 60), D = Color3.fromRGB(38, 58, 140) }
				end
				if style == "Tournament" then
					return { G = Color3.fromRGB(148, 148, 153), W = Color3.fromRGB(202, 202, 207), W2 = Color3.fromRGB(168, 168, 174), B = Color3.fromRGB(232, 190, 38), D = Color3.fromRGB(78, 78, 83) }
				end
				return { G = Color3.fromRGB(200, 200, 205), W = Color3.fromRGB(238, 238, 242), W2 = Color3.fromRGB(228, 228, 234), B = Color3.fromRGB(88, 108, 235), D = Color3.fromRGB(64, 82, 220) }
			end,
			Apply = function(self)
				if not self.Orig then self.Orig = {} end
				self:ClearDecor()
				local map = workspace:FindFirstChild("Map")
				if not map then log("MapRestyle: workspace.Map не найден") return end
				local P = self:Palette(self.State.Style or "Dust2")
				local done = 0
				local bigWalls = {}
				local list = map:GetDescendants()
				for i, obj in ipairs(list) do
					if obj:IsA("BasePart") then
						if not self.Orig[obj] then
							local decs = {}
							for _, ch in ipairs(obj:GetChildren()) do
								if ch:IsA("Decal") or ch:IsA("Texture") then
									table.insert(decs, { tex = ch.Texture, face = ch.Face, transp = ch.Transparency })
								end
							end
							self.Orig[obj] = { color = obj.Color, material = obj.Material, decals = decs }
						end
						local rec = self.Orig[obj]
						local hsvR, hsvS = rec.color:ToHSV()
						local vol = obj.Size.X * obj.Size.Y * obj.Size.Z
						local h = math.floor(obj.Position.X / 16) + math.floor(obj.Position.Z / 16)
						local newColor
						if hsvS > 0.2 and hsvR >= 0.15 and hsvR <= 0.45 then
							newColor = P.G
						elseif vol > 500 then
							newColor = P.W
						elseif vol > 40 then
							if (h % 3) == 0 then newColor = P.B else newColor = P.W2 end
						else
							if (h % 2) == 0 then newColor = P.B else newColor = P.W end
						end
						local matByStyle = { Dust2 = Enum.Material.SmoothPlastic, Winter = Enum.Material.Snow, Halloween = Enum.Material.Slate, NewYear = Enum.Material.Snow, Tournament = Enum.Material.Concrete }
						obj.Material = matByStyle[self.State.Style or "Dust2"] or Enum.Material.SmoothPlastic
						obj.Color = newColor
						for _, dec in ipairs(rec.decals) do
							for _, ch in ipairs(obj:GetChildren()) do
								if (ch:IsA("Decal") or ch:IsA("Texture")) and ch.Texture == dec.tex and ch.Face == dec.face then
									ch.Transparency = 1
								end
							end
						end
						if (self.State.Style or "Dust2") == "Tournament" and vol > 3000 and #bigWalls < 8 then
							table.insert(bigWalls, obj)
						end
						done = done + 1
						if done % 150 == 0 then task.wait() end
					end
				end
				log("MapRestyle: стиль " .. (self.State.Style or "Dust2") .. ", покрашено частей: " .. done)
				if (self.State.Style or "Dust2") == "Tournament" then
					self:SpawnTournamentDecor(bigWalls)
				end
			end,
			ClearDecor = function(self)
				for _, dcor in ipairs(self.Decor or {}) do
					pcall(function() dcor:Destroy() end)
				end
				self.Decor = nil
			end,
			SpawnTournamentDecor = function(self, bigWalls)
				self:ClearDecor()
				self.Decor = {}
				local LOGO = "rbxassetid://117047005144143"
				local function groundY(x, z)
					local hit = workspace:Raycast(Vector3.new(x, 500, z), Vector3.new(0, -1000, 0))
					if hit then return hit.Position.Y end
					return 10
				end
				-- баннеры-билборды с логотипом и названием
				for _, pos in ipairs({ Vector3.new(0, 0, 0), Vector3.new(120, 0, 120), Vector3.new(-120, 0, -120), Vector3.new(180, 0, -80), Vector3.new(-180, 0, 80), Vector3.new(60, 0, -160) }) do
					local gy = groundY(pos.X, pos.Z)
					local pole = Instance.new("Part")
					pole.Anchored = true
					pole.Size = Vector3.new(1.6, 16, 1.6)
					pole.Color = Color3.fromRGB(80, 80, 85)
					pole.Material = Enum.Material.Metal
					pole.CFrame = CFrame.new(pos.X, gy + 8, pos.Z)
					pole.Parent = workspace
					table.insert(self.Decor, pole)
					local panel = Instance.new("Part")
					panel.Anchored = true
					panel.Size = Vector3.new(16, 9, 0.8)
					panel.Color = Color3.fromRGB(28, 28, 32)
					panel.Material = Enum.Material.SmoothPlastic
					local yaw = (math.floor(((pos.X + pos.Z) / 60) + 0.5) % 4) * 90
					panel.CFrame = CFrame.new(pos.X, gy + 18.5, pos.Z) * CFrame.Angles(0, math.rad(yaw), 0)
					panel.Parent = workspace
					table.insert(self.Decor, panel)
					local sg = Instance.new("SurfaceGui")
					sg.Face = Enum.NormalId.Front
					sg.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
					sg.PixelsPerStud = 50
					sg.Parent = panel
					local img = Instance.new("ImageLabel")
					img.Size = UDim2.fromScale(0.34, 0.68)
					img.AnchorPoint = Vector2.new(0.5, 0.5)
					img.Position = UDim2.fromScale(0.22, 0.5)
					img.BackgroundTransparency = 1
					img.Image = LOGO
					img.Parent = sg
					local txt = Instance.new("TextLabel")
					txt.Size = UDim2.fromScale(0.56, 0.42)
					txt.AnchorPoint = Vector2.new(0.5, 0.5)
					txt.Position = UDim2.fromScale(0.63, 0.38)
					txt.BackgroundTransparency = 1
					txt.Text = "FOSFOR"
					txt.TextColor3 = Color3.fromRGB(255, 255, 255)
					txt.Font = Enum.Font.GothamBlack
					txt.TextScaled = true
					txt.Parent = sg
					local sub = Instance.new("TextLabel")
					sub.Size = UDim2.fromScale(0.56, 0.2)
					sub.AnchorPoint = Vector2.new(0.5, 0.5)
					sub.Position = UDim2.fromScale(0.63, 0.72)
					sub.BackgroundTransparency = 1
					sub.Text = "By Fosfor"
					sub.TextColor3 = Color3.fromRGB(255, 255, 255)
					sub.Font = Enum.Font.GothamMedium
					sub.TextScaled = true
					sub.Parent = sg
				end
				-- логотип на крупных стенах
				for _, w in ipairs(bigWalls) do
					pcall(function()
						if not w:FindFirstChild("FosforTournamentGui") then
							local sg = Instance.new("SurfaceGui")
							sg.Name = "FosforTournamentGui"
							sg.Face = Enum.NormalId.Front
							sg.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
							sg.PixelsPerStud = 50
							sg.Parent = w
							local img = Instance.new("ImageLabel")
							img.Size = UDim2.fromScale(1, 1)
							img.BackgroundTransparency = 1
							img.Image = LOGO
							img.Parent = sg
							table.insert(self.Decor, sg)
						end
					end)
				end
				log("MapRestyle: турнир — баннеры и логотипы расставлены")
			end,
			Restore = function(self)
				self:ClearDecor()
				if not self.Orig then return end
				local done = 0
				for part, rec in pairs(self.Orig) do
					pcall(function()
						if part.Parent then
							part.Color = rec.color
							part.Material = rec.material
							for _, dec in ipairs(rec.decals) do
								for _, ch in ipairs(part:GetChildren()) do
									if (ch:IsA("Decal") or ch:IsA("Texture")) and ch.Texture == dec.tex and ch.Face == dec.face then
										ch.Transparency = dec.transp
									end
								end
							end
						end
					end)
					done = done + 1
					if done % 150 == 0 then task.wait() end
				end
				self.Orig = nil
				log("MapRestyle: оригинальные цвета возвращены")
			end,
			OnDisable = function(self)
				self:Restore()
			end,
		})
	-- ============================================================
	-- СОЗДАНИЕ НАВИГАЦИИ И СТРАНИЦ
	-- ============================================================
	local function createPage(key)
		local page = Instance.new("CanvasGroup")
		page.Name = key
		page.Size = UDim2.fromScale(1, 1)
		page.Position = UDim2.new(0, 0, 0, 0)
		page.BackgroundTransparency = 1
		page.GroupTransparency = 1
		page.Visible = false
		page.ZIndex = 2
		page.Parent = pagesFrame
		pages[key] = page
		return page
	end

	local tabDefinitions = {
		{Key = "Player",    Label = "Профиль",     Icon = "rbxassetid://10747373176", Builder = TabBuilders.Player,    Font = Enum.Font.Gotham},
		{Key = "Scripts",   Label = "Скрипты",   Icon = "rbxassetid://10709810463", Builder = TabBuilders.Scripts,   Font = Enum.Font.Gotham},
		{Key = "Teleports", Label = "Телепорты", Icon = "rbxassetid://10734886202", Builder = TabBuilders.Teleports, Font = Enum.Font.Gotham},
		{Key = "ESP",       Label = "ESP",       Icon = "rbxassetid://10723346959", Builder = TabBuilders.ESP,       Font = Enum.Font.Gotham},
		{Key = "Target",    Label = "Target",    Icon = "rbxassetid://10709818534", Builder = TabBuilders.Target,    Font = Enum.Font.Gotham},
		{Key = "PVP",       Label = "PVP",       Icon = "rbxassetid://10723376114", Builder = TabBuilders.PVP,     Font = Enum.Font.GothamBold},
		{Key = "Defence",   Label = "Защита",    Icon = "rbxassetid://10734951847", Builder = nil,                 Font = Enum.Font.Gotham},
		{Key = "Visual",    Label = "Визуал",    Icon = "rbxassetid://10747376349", Builder = TabBuilders.Visual,    Font = Enum.Font.Gotham},
		{Key = "Shaders",   Label = "Шейдеры",   Icon = "rbxassetid://10723396000", Builder = TabBuilders.Shaders,   Font = Enum.Font.Gotham},
		{Key = "Maps",      Label = "Карты",     Icon = "rbxassetid://10734886004", Builder = TabBuilders.Maps,      Font = Enum.Font.Gotham},
		{Key = "Misc",      Label = "Разное",    Icon = "rbxassetid://10747383470", Builder = TabBuilders.Misc,      Font = Enum.Font.Gotham},
		{Key = "Themes",    Label = "Темы и UI",     Icon = "rbxassetid://10734910430", Builder = TabBuilders.Themes,    Font = Enum.Font.Gotham},
		{Key = "Settings",  Label = "Настройки", Icon = "rbxassetid://10734950309", Builder = TabBuilders.Settings,  Font = Enum.Font.Gotham},
		{Key = "Console",   Label = "Конфиги",       Icon = "rbxassetid://10723367244", Builder = TabBuilders.CFG,       Font = Enum.Font.Gotham},
	}

	for index, definition in ipairs(tabDefinitions) do
		local page = createPage(definition.Key)
		local navButton = UI.button({
			Name = "Nav_" .. definition.Key,
			Parent = navContainer,
			Size = UDim2.new(1, 0, 0, 34),
			BackgroundColor3 = currentPalette.element,
			BackgroundTransparency = 1,
			Text = "",
			Corner = 10,
			StrokeTransparency = 1,
			ZIndex = 3,
		})
		if definition.Icon then
			local navIcon = Instance.new("ImageLabel")
			navIcon.Name = "NavIcon"
			navIcon.Size = UDim2.fromOffset(18, 18)
			navIcon.Position = UDim2.new(0, 10, 0.5, -9)
			navIcon.BackgroundTransparency = 1
			navIcon.Image = definition.Icon
			navIcon.ImageColor3 = currentPalette.sub
			navIcon.ScaleType = Enum.ScaleType.Fit
			navIcon.ZIndex = 4
			navIcon.Parent = navButton
			addThemed("text", navIcon)
		end
		local navLabel = Instance.new("TextLabel")
		navLabel.Name = "NavLabel"
		navLabel.Size = UDim2.new(1, -44, 1, 0)
		navLabel.Position = UDim2.new(0, 38, 0, 0)
		navLabel.BackgroundTransparency = 1
		navLabel.Text = definition.Label
		navLabel.TextColor3 = currentPalette.sub
		navLabel.Font = definition.Font or Enum.Font.Gotham
		navLabel.TextSize = 15
		navLabel.TextXAlignment = Enum.TextXAlignment.Left
		navLabel.ZIndex = 4
		navLabel.Parent = navButton
		addThemed("text", navLabel)
		navButton.LayoutOrder = index
		navButton:SetAttribute("TabKey", definition.Key)
		table.insert(navButtons, navButton)
		navButton.MouseButton1Click:Connect(function()
			playSound("click")
			if switchTab then switchTab(definition.Key) end
		end)
		navButton.MouseEnter:Connect(function()
			if currentTab ~= definition.Key then
				Animations.tween(navButton, {BackgroundTransparency = 0.55}, 0.15)
			end
		end)
		navButton.MouseLeave:Connect(function()
			if updateNavStyles then updateNavStyles() end
		end)
	end

	Mods.AttachAll(pages)

	for index, definition in ipairs(tabDefinitions) do
		if definition.Builder then
			local ok, err = pcall(definition.Builder, pages[definition.Key])
			if not ok then
				warn("[Fosfor] Builder '" .. definition.Key .. "' ошибка:", err)
			end
		end
	end

	updateNavStyles = function()
		for _, button in ipairs(navButtons) do
			local key = button:GetAttribute("TabKey")
			local stroke = button:FindFirstChildOfClass("UIStroke")
			local icon = button:FindFirstChild("NavIcon")
			local label = button:FindFirstChild("NavLabel")
			if key == currentTab then
				button.BackgroundTransparency = 0.12
				if label then label.TextColor3 = currentPalette.text end
				if icon then icon.ImageColor3 = currentPalette.text end
				if stroke then stroke.Transparency = 0.25 end
			else
				button.BackgroundTransparency = 1
				if label then label.TextColor3 = currentPalette.sub end
				if icon then icon.ImageColor3 = currentPalette.sub end
				if stroke then stroke.Transparency = 1 end
			end
		end
	end

	switchTab = function(key)
		if not pages[key] or currentTab == key then return end
		local oldPage = pages[currentTab]
		currentTab = key
		if updateNavStyles then updateNavStyles() end
		local targetPage = pages[key]
		if oldPage and oldPage ~= targetPage then
			oldPage.Visible = true
			Animations.tweenCompleted(oldPage, {GroupTransparency = 1, Position = UDim2.new(0, -18, 0, 0)}, 0.22, function()
				if currentTab ~= oldPage.Name then
					oldPage.Visible = false
					oldPage.GroupTransparency = 1
					oldPage.Position = UDim2.new(0, 0, 0, 0)
				end
			end)
		end
		targetPage.Visible = true
		targetPage.Position = UDim2.new(0, 18, 0, 0)
		targetPage.GroupTransparency = 1
		task.defer(function()
			Animations.tween(targetPage, {GroupTransparency = 0, Position = UDim2.new(0, 0, 0, 0)}, 0.3)
		end)
	end

	updateAllToggles = function()
		for _, toggleData in ipairs(toggles) do
			if toggleData.update then toggleData.update() end
		end
	end

	applyTheme = function(themeName)
		local palette = getPalette(themeName or settings.Theme)
		currentPalette = palette
		for _, list in pairs(themed) do
			for i = #list, 1, -1 do
				local object = list[i]
				if not object or not object.Parent then
					table.remove(list, i)
				end
			end
		end
		for _, object in ipairs(themed.bg) do
			if object.Parent then object.BackgroundColor3 = palette.bg end
		end
		for _, object in ipairs(themed.panel) do
			if object.Parent then object.BackgroundColor3 = palette.panel end
		end
		for _, object in ipairs(themed.element) do
			if object.Parent then object.BackgroundColor3 = palette.element end
		end
		for _, object in ipairs(themed.text) do
			if object.Parent then
				if object:IsA("TextBox") then
					object.TextColor3 = palette.text
					object.PlaceholderColor3 = palette.sub
				elseif object:IsA("TextButton") then
					object.TextColor3 = palette.text
				elseif object:IsA("TextLabel") then
					object.TextColor3 = palette.text
				elseif object:IsA("ImageLabel") then
					object.ImageColor3 = palette.text
				elseif object:IsA("Frame") then
					object.BackgroundColor3 = palette.text
				elseif object:IsA("ImageButton") then
					object.ImageColor3 = palette.text
				end
			end
		end
		for _, object in ipairs(themed.sub) do
			if object.Parent and (object:IsA("TextButton") or object:IsA("TextBox") or object:IsA("TextLabel")) then
				object.TextColor3 = palette.sub
			end
		end
		for _, object in ipairs(themed.star) do
			if object.Parent then object.BackgroundColor3 = palette.star end
		end
		for _, object in ipairs(themed.consoleBg) do
			if object.Parent then object.BackgroundColor3 = palette.consoleBG end
		end
		for _, object in ipairs(themed.stroke) do
			if object.Parent then object.Color = palette.stroke end
		end
		for _, object in ipairs(themed.accent) do
			if object.Parent then
				if object:IsA("GuiObject") then object.BackgroundColor3 = palette.text end
				if object:IsA("TextButton") then object.TextColor3 = palette.bg end
			end
		end
		for _, object in ipairs(themed.scrollbar) do
			if object.Parent and object:IsA("ScrollingFrame") then
				object.ScrollBarImageColor3 = palette.stroke
			end
		end
		for _, object in ipairs(themed.gradient) do
			if object.Parent then
				object.Color = ColorSequence.new(palette.gradientTop, palette.gradientBottom)
			end
		end
		for _, object in ipairs(themed.particle) do
			if object.Parent then object.BackgroundColor3 = palette.particle end
		end
		for _, object in ipairs(themed.logoStar) do
			if object.Parent then object.BackgroundColor3 = palette.logoStar end
		end
		for _, object in ipairs(themed.logoStarGlow) do
			if object.Parent then object.BackgroundColor3 = palette.logoStar end
		end
		for _, object in ipairs(themed.closeCross) do
			if object.Parent then object.BackgroundColor3 = palette.closeCross end
		end
		if Mods then Mods.SyncColors(palette) end
		if updateNavStyles then updateNavStyles() end
		if updateAllToggles then updateAllToggles() end
		if updateThemeButtons then updateThemeButtons() end
		if updateRecent then updateRecent() end
	end

	setTheme = function(themeName)
		if themeName ~= "Тёмная" and themeName ~= "Светлая" then return end
		settings.Theme = themeName
		if applyTheme then applyTheme(themeName) end
		log("Тема оформления: " .. themeName)
	end

	-- ============================================================
	-- ГЛОБАЛЬНАЯ ОБЁРТКА ProbeActive (для DeleteLegs)
	-- ищем AegisCore среди зарегистрированных Mods и отдаём его метод
	-- ============================================================
	do
		local _aegis
		for _, m in pairs(Mods) do
			if type(m) == "table" and m.Id == "AegisCore" then _aegis = m break end
		end
		_G.ProbeActive = function()
			return _aegis and type(_aegis.ProbeActive) == "function" and _aegis:ProbeActive() or false
		end
	end

	-- ============================================================
	-- МОДУЛЬ: УДАЛЕНИЕ НОГ (меньше хитбокс, возврат только ресетом)
	-- ============================================================
	Mods.Register({
		Id = "DeleteLegs",
		Tab = "Visual",
		Name = "Удаление ног",
		Icon = "",
		Desc = "",
		Defaults = {AutoOnRespawn = false, HipFix = true},
		Build = function(self, u)
			self._masterToggle = u.Toggle("Удаление ног (меньше хитбокс)", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			u.Section("Удаление ног (меньше хитбокс)")
			self._subRows = {}
			local delRow = subAdd(self, {row = u.Row(42)}).row
			local delCaption = Instance.new("TextLabel")
			delCaption.Size = UDim2.new(1, -140, 1, 0)
			delCaption.Position = UDim2.new(0, 14, 0, 0)
			delCaption.BackgroundTransparency = 1
			delCaption.Text = "Удалить ноги сейчас:"
			delCaption.TextColor3 = currentPalette.text
			delCaption.Font = Enum.Font.Gotham
			delCaption.TextSize = 14
			delCaption.TextXAlignment = Enum.TextXAlignment.Left
			delCaption.Parent = delRow
			addThemed("text", delCaption)
			local delBtn = UI.button({
				Name = "DeleteLegsNow", Parent = delRow,
				Size = UDim2.fromOffset(118, 28), Position = UDim2.new(1, -128, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Удалить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Corner = 10,
			})
			UI.basicHover(delBtn, 0.1, 0.03, 0.6, 0.08)
			delBtn.MouseButton1Click:Connect(function()
				self:Perform(player.Character)
			end)
			subAdd(self, u.Toggle("Авто при респавне", self.State.AutoOnRespawn == true, function(v) self.State.AutoOnRespawn = v end))
			subAdd(self, u.Toggle("HipHeight-компенсация", self.State.HipFix ~= false, function(v) self.State.HipFix = v end))
		end,
		LegsGone = function(self, char)
			return char ~= nil and not char:FindFirstChild("Left Leg") and not char:FindFirstChild("Right Leg")
		end,
		Perform = function(self, char)
			char = char or player.Character
			if not char then log("Нет персонажа — ноги не удалены") return false end
			if self:LegsGone(char) then log("Ног уже нет") return false end
			local hum = char:FindFirstChildOfClass("Humanoid")
			local root = char:FindFirstChild("HumanoidRootPart")
			local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
			local ll = char:FindFirstChild("Left Leg")
			local rl = char:FindFirstChild("Right Leg")
			if not hum or not root or not torso or not ll or not rl then return false end
			-- защиты: не удалять в грабе и во время пробника античита
			local held = false
			pcall(function()
				for _, p in ipairs(char:GetChildren()) do
					if p:IsA("BasePart") and p:FindFirstChild("PartOwner") then held = true break end
				end
				local ih = player:FindFirstChild("IsHeld")
				if ih and ih.Value == true then held = true end
			end)
			if held then notify("Сначала вырвись из граба!") return false end
			if ProbeActive and ProbeActive() then notify("Пробник античита — подожди 2 c") return false end
			-- флаг-окно для СВОИХ вотчеров (AntiVoid и AEGIS void/ragdoll)
			_G.FosforLegsDip = tick()
			-- сохраняем оригиналы ДО изменения
			local originalFallHeight = workspace.FallenPartsDestroyHeight
			local originalCFrame = torso.CFrame
			workspace.FallenPartsDestroyHeight = -100
			-- отдельный pcall для FireServer — если remote упал, дальше всё равно продолжим
			pcall(function()
				ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(root, 2)
			end)
			task.wait(0.5)
			rl.CFrame = CFrame.new(0, -10000, 0)
			ll.CFrame = CFrame.new(0, -10000, 0)
			task.wait(0.3)
			torso.CFrame = CFrame.new(0, -9970, 0)
			task.wait(0.5)
			torso.CFrame = originalCFrame
			task.wait(0.5)
			-- восстанавливаем FPDH в самом конце, после возврата торса
			workspace.FallenPartsDestroyHeight = originalFallHeight
			log("Ноги удалены — вернутся только после ресета")
			notify("Ноги удалены")
			playSound("success", 0.4)
			if self.State.HipFix ~= false then self:HipLoop(char, hum) end
			return true
		end,
		HipLoop = function(self, char, hum)
			task.spawn(function()
				while self.Enabled and char.Parent and hum.Health > 0 and self:LegsGone(char) do
					pcall(function()
						local controls = player.PlayerGui:FindFirstChild("ControlsGui")
						local stand = controls and controls:FindFirstChild("PCFrame") and controls.PCFrame:FindFirstChild("Stand")
						if stand then
							hum.HipHeight = (stand.Visible == false) and 2 or 0
						else
							hum.HipHeight = 2
						end
					end)
					task.wait()
				end
			end)
		end,
		OnEnable = function(self)
			Mods.Connect(self, player.CharacterAdded:Connect(function(ch)
				task.wait(1.2)
				if self.Enabled and self.State.AutoOnRespawn == true then
					self:Perform(ch)
				end
			end))
			local char = player.Character
			if self:LegsGone(char) and self.State.HipFix ~= false then
				self:HipLoop(char, char:FindFirstChildOfClass("Humanoid"))
			end
		end,
		OnDisable = function(self) end,
	})

	-- ============================================================
	-- МОДУЛЬ: ЯКОРЬ ВЗЯТЫХ ИГРУШЕК
	-- Логика: следим за HoldPart.HoldingPlayer в папке
	-- <PlayerName>SpawnedInToys; пока предмет в руках — запоминаем;
	-- как только отпущен и ещё не заякорен — заякориваем через
	-- GrabEvents.SetNetworkOwner + Anchored=true (главная часть предмета).
	-- ============================================================
	Mods.Register({
		Id = "ToyAnchor",
		Tab = "Misc",
		Name = "Якорь игрушек",
		Icon = "",
		Desc = "Якорит только те предметы, что ты брал и отпустил",
		Defaults = {["Разъякорить при выключении"] = true},
		Build = function(self, u)
			u.Section("Якорь игрушек (только взятые и отпущенные)")
			self._subRows = {}
			self._masterToggle = u.Toggle("Якорить взятые предметы", self.Enabled or self._wantEnabled == true, function(v)
				if v then Mods.Enable(self) else Mods.Disable(self) end
				subShow(self, v)
			end)
			subAdd(self, u.Toggle("Разъякорить при выключении", self.State["Разъякорить при выключении"] ~= false, function(v)
				self.State["Разъякорить при выключении"] = v
			end))
			local unanchorRow = subAdd(self, {row = u.Row(42)}).row
			local unanchorCaption = Instance.new("TextLabel")
			unanchorCaption.Size = UDim2.new(1, -140, 1, 0)
			unanchorCaption.Position = UDim2.new(0, 14, 0, 0)
			unanchorCaption.BackgroundTransparency = 1
			unanchorCaption.Text = "Разъякорить всё:"
			unanchorCaption.TextColor3 = currentPalette.text
			unanchorCaption.Font = Enum.Font.Gotham
			unanchorCaption.TextSize = 14
			unanchorCaption.TextXAlignment = Enum.TextXAlignment.Left
			unanchorCaption.Parent = unanchorRow
			addThemed("text", unanchorCaption)
			local unanchorBtn = UI.button({
				Name = "UnanchorAll", Parent = unanchorRow,
				Size = UDim2.fromOffset(118, 28), Position = UDim2.new(1, -128, 0.5, -14),
				BackgroundTransparency = 0.1, Text = "Разъякорить", TextSize = 12,
				ThemeBackground = "element", ThemeText = "text", Corner = 10,
			})
			UI.basicHover(unanchorBtn, 0.1, 0.03, 0.6, 0.08)
			unanchorBtn.MouseButton1Click:Connect(function()
				local unanchored = self:UnanchorAll()
				log("Якорь игрушек: разъякорено вручную: " .. unanchored, "info")
				playSound("toggle")
			end)
			subShow(self, self.Enabled or self._wantEnabled == true)
		end,
		-- получить главную (заякориваемую) часть предмета
		GetMainPart = function(self, toy)
			local ok, part = pcall(function()
				if toy:IsA("BasePart") then return toy end
				local sp = toy:FindFirstChild("SoundPart")
				if sp and sp:IsA("BasePart") then return sp end
				return toy:FindFirstChildWhichIsA("BasePart")
			end)
			return ok and part or nil
		end,
		-- заякорить один предмет (вызывается для отпущенных)
		AnchorToy = function(self, toy)
			if not toy or not toy.Parent then return false end
			if self.AnchoredToys[toy] then return false end
			local part = self:GetMainPart(toy)
			if not part then return false end
			-- сначала захватываем владение
			pcall(function() self.RS.GrabEvents.SetNetworkOwner:FireServer(part, part.CFrame) end)
			-- затем ставим якорь
			local ok = pcall(function() part.Anchored = true end)
			if ok then
				self.AnchoredToys[toy] = true
				return true
			end
			return false
		end,
		-- разъякорить все ранее заякоренные
		UnanchorAll = function(self)
			local n = 0
			for toy, _ in pairs(self.AnchoredToys or {}) do
				if toy and toy.Parent then
					local part = self:GetMainPart(toy)
					if part then
						pcall(function()
							if part.Anchored then
								part.Anchored = false
								n = n + 1
							end
						end)
					end
				end
			end
			self.AnchoredToys = {}
			return n
		end,
		-- отметить текущие "в руках" (формирует снимок на текущий heartbeat)
		CollectHeld = function(self)
			local current = {}
			local toysFolder = workspace:FindFirstChild(self._toysFolderName)
			if not toysFolder then return current end
			pcall(function()
				for _, toy in ipairs(toysFolder:GetChildren()) do
					local holdPart = toy:FindFirstChild("HoldPart")
					if holdPart then
						local holdingPlayer = holdPart:FindFirstChild("HoldingPlayer")
						if holdingPlayer and holdingPlayer.Value == player then
							self.TrackedItems[toy] = true
							current[toy] = true
						end
					end
				end
			end)
			return current
		end,
		-- заякорить отпущенные (были tracked, но сейчас не в current)
		AnchorReleased = function(self, current)
			for toy, _ in pairs(self.TrackedItems) do
				if not toy or not toy.Parent then
					self.TrackedItems[toy] = nil
				elseif not current[toy] and not self.AnchoredToys[toy] then
					if self:AnchorToy(toy) then
						log("Якорь игрушек: заякорен отпущенный предмет", "info")
					end
				end
			end
		end,
		OnEnable = function(self)
			self.RS = game:GetService("ReplicatedStorage")
			self.TrackedItems = {}     -- предметы, которые брал в руки
			self.AnchoredToys = {}     -- уже заякоренные (после отпускания)
			self._toysFolderName = player.Name .. "SpawnedInToys"
			log("Якорь игрушек включён (взятые → отпущенные)")
		end,
		OnHeartbeat = function(self)
			if not self.Enabled then return end
			local current = self:CollectHeld()
			self:AnchorReleased(current)
		end,
		OnDisable = function(self)
			if self.State["Разъякорить при выключении"] ~= false then
				local n = self:UnanchorAll()
				if n > 0 then log("Якорь игрушек: разъякорено при выключении: " .. n, "info") end
			end
			self.TrackedItems = {}
			self.AnchoredToys = {}
			log("Якорь игрушек выключен")
		end,
	})

	-- ============================================================
	-- РУЧНОЙ AttachAll для модулей, зарегистрированных ПОСЛЕ основного
	-- (DeleteLegs / ToyAnchor зарегистрированы после Mods.AttachAll(pages)
	--  на строке 10048, поэтому их Build не был вызван автоматически;
	--  повторный AttachAll безопасен: условие `not mod.UI` пропустит
	--  уже отрисованные модули и пройдёт только по новым)
	-- ============================================================
	pcall(function() Mods.AttachAll(pages) end)

	-- ============================================================
	-- СТАРТ
	-- ============================================================
	currentTab = tabDefinitions[1].Key
	pages[currentTab].Visible = true
	pages[currentTab].GroupTransparency = 0
	pages[currentTab].Position = UDim2.new(0, 0, 0, 0)
	updateNavStyles()
	if applyTheme then applyTheme(settings.Theme) end
	if addConsoleLine then
		addConsoleLine("Fosfor v1.3.0 | Loaded", "info")
		addConsoleLine("Введите help для списка команд.", "sub")
		addConsoleLine("RightShift — показать или скрыть окно.", "sub")
		addConsoleLine("Потяните за правый нижний угол для изменения размера.", "sub")
	end
	if notify then notify("Fosfor v1.3.0 загружен") end
	pcall(function() applyLanguage() end)
	-- стартовый набор по умолчанию (пока не выключен тумблером в Настройках)
	task.spawn(function()
		task.wait(0.3)
		if getFeature("Fosfor_NoDefaults") ~= true then
			for _, id in ipairs({ "BoardPainter", "DeathMotivation", "HudPlaques", "MenuRestyle", "CoinStyle" }) do
				pcall(function()
					local m = Mods.Get(id)
					if m and not m.Enabled then Mods.Enable(m) end
				end)
			end
		end
		-- Infinity Yield грузится всегда
		pcall(function()
			executeScriptFromURL("Infinity Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
		end)
	end)
	task.delay(0.5, function()
		showUI(true)
	end)
end

local ok, errorMessage = pcall(main)
if not ok then
	warn("[Fosfor] Ошибка инициализации UI:", errorMessage)
end
