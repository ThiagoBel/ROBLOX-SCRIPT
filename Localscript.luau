-- oi
local LGS = game:GetService("LogService")
local UIS = game:GetService("UserInputService")
local run = game:GetService("RunService")
local plr = game.Players.LocalPlayer
local cam = workspace.CurrentCamera
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local VERSAO_SLENDER = "1.5"
local ID_LOADEDFIRST = "_LOADED_FIRST________"
local ID_STOCKLIGHT = "_STOCK_LIGHT__________"
local ID_CONSOLELOGS = "_CONSOLE_LOGS________"
--[[local ID_TERCEROZOI_OBJ = "_TERCEIRO_OLHO____"
local SUBID_TERCEROZOI_VV = 0.5]]
local puxar_mira_size = 0.4
local puxar_mira_raio = 10
local grossura_esp = 0.05
local distancia_tp = 3.5
local tempoDuranteTPsuspeito = 5
local cannoclip = true
local existe = false
local normalspeed = hum.WalkSpeed
local normalfov = cam.FieldOfView
local messagesusedsconsole = 0
local fovchanged = normalfov
local plrspamed = ""
local plrspamed2 = ""
local plrspamed3 = ""
local plr_FOCOMIRA = ""
local speed_spam = 0
local animAtual = nil
local msgSpam = "wow"
local maxMsgConsole = 100
local ignoraAlvoComParede = true
local ignoraAlvoMesmoTime = true
--local nameID = math.random(1111, 9999) .. "_" .. math.random(1, 9) .. "__GUI_" .. math.random(1, 99999)
local nameIDTHIS = "Configs"
local _CARREGAMENTO__ = Instance.new("Hint")
local first_time = true

local function random(max)
	local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
	local str = ""
	for i = 1, max do
		local index = math.random(1, #chars)
		str = str .. chars:sub(index, index)
	end
	return str
end

if not plr:FindFirstChild(ID_LOADEDFIRST) then
	first_time = true
	local LOADED_FIRST = Instance.new("Configuration")
	LOADED_FIRST.Parent = plr
	LOADED_FIRST.Name = ID_LOADEDFIRST
	_CARREGAMENTO__.Text = "Carregando " .. VERSAO_SLENDER .. "v..."
else
	first_time = false
	_CARREGAMENTO__.Text = "Recarregando " .. VERSAO_SLENDER .. "v..."
end
_CARREGAMENTO__.Parent = workspace

local gui = Instance.new("ScreenGui")
gui.Name = nameIDTHIS
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui") or plr:FindFirstChild("PlayerGui")
gui.ResetOnSpawn = true

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.35, 0, 0.67, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0.08, 0)
Instance.new("UIDragDetector", main)

local configFrame = Instance.new("Frame")
configFrame.Size = UDim2.new(0.3, 0, 0.77, 0)
configFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
configFrame.AnchorPoint = Vector2.new(0.5, 0.5)
configFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
configFrame.Visible = false
configFrame.Parent = gui

Instance.new("UICorner", configFrame).CornerRadius = UDim.new(0.08, 0)
Instance.new("UIDragDetector", configFrame)

local animFrame = Instance.new("Frame")
animFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
animFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
animFrame.AnchorPoint = Vector2.new(0.5, 0.5)
animFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
animFrame.Visible = false
animFrame.Parent = gui

Instance.new("UICorner", animFrame).CornerRadius = UDim.new(0.08, 0)
Instance.new("UIDragDetector", animFrame)

local consoleDragFrame = Instance.new("Frame")
consoleDragFrame.Size = UDim2.new(0.3, 0, 0.56, 0)
consoleDragFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
consoleDragFrame.AnchorPoint = Vector2.new(0.5, 0.5)
consoleDragFrame.BackgroundTransparency = 1
consoleDragFrame.Visible = false
consoleDragFrame.Parent = gui

local consoleFrame = Instance.new("ScrollingFrame")
consoleFrame.Size = UDim2.new(1, 0, 1, 0)
consoleFrame.CanvasSize = UDim2.new(0,0,0,0)
consoleFrame.ScrollBarThickness = 6
consoleFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
consoleFrame.Parent = consoleDragFrame

--[[local consoleFrame = Instance.new("ScrollingFrame")
consoleFrame.CanvasSize = UDim2.new(0,0,0,0)
consoleFrame.ScrollBarThickness = 6
consoleFrame.Size = UDim2.new(0.3, 0, 0.67, 0)
consoleFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
consoleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
consoleFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
consoleFrame.Visible = false
consoleFrame.Parent = gui]]

Instance.new("UICorner", consoleFrame).CornerRadius = UDim.new(0.08, 0)
Instance.new("UIDragDetector", consoleDragFrame)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0.01, 0)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Parent = configFrame

local layout2 = Instance.new("UIListLayout")
layout2.Padding = UDim.new(0.01, 0)
layout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout2.VerticalAlignment = Enum.VerticalAlignment.Center
layout2.Parent = consoleFrame

--[[local layout2 = Instance.new("UIListLayout")
layout2.Padding = UDim.new(0.05, 0)
layout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout2.VerticalAlignment = Enum.VerticalAlignment.Center
layout2.FillDirection = Enum.FillDirection.Horizontal
layout2.Wraps = true
layout2.Parent = animFrame]]

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(120, 120, 255)
stroke.Thickness = 2
stroke.Transparency = 0.3
stroke.Parent = main

local stroke2 = Instance.new("UIStroke")
stroke2.Color = Color3.fromRGB(120, 120, 255)
stroke2.Thickness = 2
stroke2.Transparency = 0.3
stroke2.Parent = configFrame

local stroke3 = Instance.new("UIStroke")
stroke3.Color = Color3.fromRGB(120, 120, 255)
stroke3.Thickness = 2
stroke3.Transparency = 0.3
stroke3.Parent = animFrame

local stroke4 = Instance.new("UIStroke")
stroke4.Color = Color3.fromRGB(120, 120, 255)
stroke4.Thickness = 2
stroke4.Transparency = 0.3
stroke4.Parent = consoleFrame

local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(30,30,30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,15))
}
grad.Rotation = 90
grad.Parent = main

local grad2 = Instance.new("UIGradient")
grad2.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(30,30,30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,15))
}
grad2.Rotation = 90
grad2.Parent = configFrame

local grad3 = Instance.new("UIGradient")
grad3.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(30,30,30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,15))
}
grad3.Rotation = 90
grad3.Parent = animFrame

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0.25, 0, 0.15, 0)
grid.CellPadding = UDim2.new(0.05, 0, 0.02, 0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Center
grid.Parent = main

local grid2 = Instance.new("UIGridLayout")
grid2.CellPadding = UDim2.new(0.02, 0, 0.02, 0)
grid2.CellSize = UDim2.new(0.2, 0, 0.1, 0)
grid2.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid2.VerticalAlignment = Enum.VerticalAlignment.Center
grid2.FillDirectionMaxCells = 88
grid2.Parent = animFrame

local consoletxt = Instance.new("TextLabel")
consoletxt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
consoletxt.BackgroundTransparency = 1
consoletxt.Size = UDim2.new(1, 0, 1, 0)
consoletxt.TextColor3 = Color3.fromRGB(255, 255, 255)
consoletxt.TextScaled = false
consoletxt.TextSize = 14
consoletxt.TextWrapped = true
consoletxt.RichText = true
if game.ReplicatedStorage:FindFirstChild(ID_CONSOLELOGS) then
	if game.ReplicatedStorage:FindFirstChild(ID_CONSOLELOGS).Value == "" then
		consoletxt.Text = "<font color='rgb(88, 255, 144)'>Console</font>"
	else
		consoletxt.Text = game.ReplicatedStorage:FindFirstChild(ID_CONSOLELOGS).Value
	end
else
	consoletxt.Text = "<font color='rgb(88, 255, 144)'>Console</font>"
end
consoletxt.TextXAlignment = Enum.TextXAlignment.Left
consoletxt.TextYAlignment = Enum.TextYAlignment.Top
consoletxt.Parent = consoleFrame

local function isR6()
	return hum.RigType == Enum.HumanoidRigType.R6
end

local function addLog(msg, typee)
	messagesusedsconsole += 1
	if messagesusedsconsole >= maxMsgConsole then
		consoletxt.Text = "<font color='rgb(88, 255, 144)'>Console</font>"
		messagesusedsconsole = 0
	end
	if typee == Enum.MessageType.MessageError then
		consoletxt.Text = consoletxt.Text .. "\n<font color='rgb(255, 0, 0)'>" .. msg .. "</font>"
	elseif typee == Enum.MessageType.MessageWarning then
		consoletxt.Text = consoletxt.Text .. "\n<font color='rgb(255, 162, 0)'>" .. msg .. "</font>"
	elseif typee == Enum.MessageType.MessageInfo then
		consoletxt.Text = consoletxt.Text .. "\n<font color='rgb(0, 145, 255)'>" .. msg .. "</font>"
	elseif typee == Enum.MessageType.MessageOutput then
		consoletxt.Text = consoletxt.Text .. "\n<font color='rgb(255, 255, 255)'>" .. msg .. "</font>"
	else
		consoletxt.Text = consoletxt.Text .. "\n<font color='rgb(255, 0, 234)'>" .. msg .. "</font>"
	end
	if game.ReplicatedStorage:FindFirstChild(ID_CONSOLELOGS) then
		game.ReplicatedStorage:FindFirstChild(ID_CONSOLELOGS).Value = consoletxt.Text
	else
		local coissss = Instance.new("StringValue")
		coissss.Name = ID_CONSOLELOGS
		coissss.Value = consoletxt.Text
		coissss.Parent = game.ReplicatedStorage
	end
	task.wait()
	consoleFrame.CanvasSize = UDim2.new(0, 0, 0, consoletxt.TextBounds.Y + 20)
	consoleFrame.CanvasPosition = Vector2.new(0, consoleFrame.CanvasSize.Y.Offset)
end

local function criarBotao(texto)
	local btn = Instance.new("TextButton")
	btn.Text = texto
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0.2, 0)

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(90, 90, 255)
	stroke.Transparency = 0.6
	stroke.Parent = btn

	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	end)

	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	end)

	btn.MouseButton1Down:Connect(function()
		btn.Size = btn.Size - UDim2.new(0.02,0,0.02,0)
	end)

	btn.MouseButton1Up:Connect(function()
		btn.Size = btn.Size + UDim2.new(0.02,0,0.02,0)
	end)

	btn.Parent = main
	return btn
end

local function criarConfigItem(nome, valorInicial)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0.85, 0, 0.040, 0)
	container.BackgroundTransparency = 1
	container.Parent = configFrame

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.5, 0, 1, 0)
	label.Text = nome
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1,1,1)
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.Parent = container

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0.45, 0, 0.8, 0)
	box.Position = UDim2.new(0.55, 0, 0.1, 0)
	box.Text = tostring(valorInicial)
	box.BackgroundColor3 = Color3.fromRGB(40,40,40)
	box.TextColor3 = Color3.new(1,1,1)
	box.TextScaled = true
	box.Font = Enum.Font.Gotham
	box.Parent = container
	box.ClearTextOnFocus = false

	Instance.new("UICorner", box).CornerRadius = UDim.new(0.2,0)

	return box
end

local function criarAnimBotao(nome, id)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.2, 0, 0.05, 0)
	btn.Text = nome
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0.2, 0)

	btn.MouseButton1Click:Connect(function()
		local humanoid = char:FindFirstChild("Humanoid")
		if not humanoid then return end

		if animAtual then
			animAtual:Stop()
			animAtual = nil
		end

		local anim = Instance.new("Animation")
		anim.AnimationId = "rbxassetid://" .. id

		local animator = humanoid:FindFirstChildOfClass("Animator")
		if not animator then
			animator = Instance.new("Animator")
			animator.Parent = humanoid
		end

		local track = animator:LoadAnimation(anim)

		track.Priority = Enum.AnimationPriority.Action4

		animAtual = track
		track:Play()
	end)

	btn.Parent = animFrame
end

local flybtn = criarBotao("Voar")
local espbtn = criarBotao("ESP")
local aimbotbtn = criarBotao("Aimbot")
local tpbtn = criarBotao("Teleportar - T")
local spambtn = criarBotao("Spam remote")
local spammodbtn = criarBotao("Spam module")
local scriptsbtn = criarBotao("Desativar scripts")
local vsnotbtn = criarBotao("Visão noturna")
local puxarbtn = criarBotao("Puxar mira")
local esconderbtn = criarBotao("Esconder")
local onlyplrbtn = criarBotao("Apenas players")
local onlyheadbtn = criarBotao("Só capa")
local configbtn = criarBotao("Configurações")
local animbtn = criarBotao("Animações")
local consolebtn = criarBotao("Console")
--local transparencybtn = criarBotao("Terceiro olho")

local speedBox = criarConfigItem("Velocidade", hum.WalkSpeed)
local speedSpamBox = criarConfigItem("Velocidade spam", speed_spam)
local puxarBox = criarConfigItem("Puxar Mira Força", puxar_mira_size)
local puxarRaioBox = criarConfigItem("Puxar Mira Raio", puxar_mira_raio)
local grossuraEspBox = criarConfigItem("Tamanho ESP", grossura_esp)
local noclipFlyBox = criarConfigItem("No Clip ao voar", cannoclip)
local fovBox = criarConfigItem("FOV", normalfov)
local tpBox = criarConfigItem("Teleporte facil", "")
local tpSpamBox = criarConfigItem("Teleporte spam")
local tpSpamBox2 = criarConfigItem("Teleporte spam doido")
local tpSpamBox3 = criarConfigItem("Teleporte spam duvidoso")
local tptemposuspeitoBox = criarConfigItem("Teleporte suspeito tempo", tempoDuranteTPsuspeito)
local tplimitBox = criarConfigItem("Teleporte distancia limite", distancia_tp)
local mirafocoBox = criarConfigItem("Focar em um player", plr_FOCOMIRA)
local spammsgBox = criarConfigItem("Mensagem no spam", msgSpam)
local maxmsgconsoleBox = criarConfigItem("Mensagens máxima no console", maxMsgConsole)
local arquivonameBox = criarConfigItem("Nome do gui", nameIDTHIS)
local ignoraParedesBox = criarConfigItem("Ignora mira se tiver objeto", ignoraAlvoComParede)
local ignorarplrtimeBox = criarConfigItem("Ignorar player do mesmo time", ignoraAlvoMesmoTime)

local tempoOsc = 0

if isR6() then
	criarAnimBotao("Wave", 128777973)
	criarAnimBotao("Cheer", 182393478)
	criarAnimBotao("Sit", 178130996)
	criarAnimBotao("Dance 1", 182435998)
	criarAnimBotao("Dance 2", 182436842)
	criarAnimBotao("Dance 3", 182436935)
	criarAnimBotao("Pointer", 248263260)
	criarAnimBotao("Boogie", 45834924)
	criarAnimBotao("PartyTime", 33796059)
	criarAnimBotao("Goal", 28488254)
	criarAnimBotao("Laugh", 129423131)
	criarAnimBotao("Walk", 180426354)
	
	criarAnimBotao("Giro", 188632011)
	criarAnimBotao("Classic dance", 27789359)
	criarAnimBotao("Fun dance", 52155728)
	criarAnimBotao("idk", 35654637)
	criarAnimBotao("Groove dance", 183412246)
else
	criarAnimBotao("Dance 1", 507771019)
	criarAnimBotao("Dance 2", 507776043)
	criarAnimBotao("Dance 3", 507777268)
	criarAnimBotao("Wave", 507770239)
	criarAnimBotao("Point", 507770453)
	criarAnimBotao("Cheer", 507770677)
	criarAnimBotao("Laugh", 507770818)
	criarAnimBotao("Sit", 2506281703)
	criarAnimBotao("bbdance", 4265725525)
	criarAnimBotao("Bored", 5230599789)
	criarAnimBotao("Cower", 4940563117)
	criarAnimBotao("Disco", 3333136415)
	criarAnimBotao("Dizzy", 3361426436)
	criarAnimBotao("Dorky", 4212455378)
	criarAnimBotao("Fancyfeet", 3333432454)
	criarAnimBotao("Fashionable", 3333331310)
	criarAnimBotao("Fasthands", 4265701731)
	criarAnimBotao("Godlike", 3337994105)
	criarAnimBotao("Happy", 4841405708)
	criarAnimBotao("Heroland", 5104344710)
	criarAnimBotao("Monkey", 3333499508)
	criarAnimBotao("Rock", 3361276673)
	criarAnimBotao("Noobflex", 3333387824)
	criarAnimBotao("Shuffle", 4349242221)
	criarAnimBotao("Shy", 3337978742)
	criarAnimBotao("Sleep", 4686925579)
	criarAnimBotao("Twirl", 3334968680)
	criarAnimBotao("Walk 1", 507777826)
	criarAnimBotao("Walk 2", 12518152696)
end

local modalallb = false

local function ehMesmoTime(model)
	if not ignoraAlvoMesmoTime then
		return false
	end

	local playerAlvo = game.Players:GetPlayerFromCharacter(model)
	if not playerAlvo then
		return false
	end

	if playerAlvo.Team == plr.Team then
		return true
	end

	return false
end

local function alvoVivo(model)
	local hum = model:FindFirstChild("Humanoid")
	return hum and hum.Health > 0
end

local function temVisao(alvo)
	if not alvo then
		return false
	end

	if not ignoraAlvoComParede then
		return true
	end

	local origem = cam.CFrame.Position
	local destino = alvo.Position
	local direcao = (destino - origem)

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = {char}

	local resultado = workspace:Raycast(origem, direcao, params)

	if resultado then
		if resultado.Instance:IsDescendantOf(alvo.Parent) then
			return true
		else
			return false
		end
	end

	return true
end

local function isPlayerModel(model)
	return game.Players:GetPlayerFromCharacter(model) ~= nil
end

local function setNoclip(state)
	if cannoclip == true then
		for _, v in ipairs(char:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = not state
			end
		end
	end
end

local aimbot = false
local esp = false
local fly = false
local cantp = false
local spamrem = false
local spammod = false
local scriptsoff = false
local vsnot = false
local puxarmira = false
local onlyplayers = false
local onlyhead = false
local configsopen = false
local animopen = false
local terceirozoi = false
local consoleopen = false

local alvoAtual = nil
local bv
local bg
local speedFly = hum.WalkSpeed

local mouse = plr:GetMouse()

local function teleportParaMouse()
	local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Head")

	if onlyhead then
		root = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso")
	end

	if not root then return end

	local mousePos = mouse.Hit.Position

	local nearestModel = nil
	local shortestDistance = math.huge

	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v ~= char then
			local hum = v:FindFirstChild("Humanoid")

			local targetRoot = v:FindFirstChild("HumanoidRootPart") 
				or v:FindFirstChild("UpperTorso") 
				or v:FindFirstChild("Torso") 
				or v:FindFirstChild("Head")

			if hum and targetRoot and hum.Health > 0 then
				if onlyplayers and not isPlayerModel(v) then
					continue
				end

				local dist = (targetRoot.Position - mousePos).Magnitude

				if dist < shortestDistance then
					shortestDistance = dist
					nearestModel = targetRoot
				end
			end
		end
	end

	if nearestModel then
		local offset = nearestModel.CFrame.LookVector * -3
		root.CFrame = CFrame.new(nearestModel.Position + offset + Vector3.new(0, distancia_tp, 0))
	end
end

local function escondertudo()
	aimbot = false
	esp = false
	fly = false
	cantp = false
	spamrem = false
	spammod = false
	scriptsoff = false
	vsnot = false
	puxarmira = false
	onlyplayers = false
	onlyhead = false
	configsopen = false
	animopen = false
	consoleopen = false

	task.spawn(function()
		flybtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		flybtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		espbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		espbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		aimbotbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		aimbotbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		tpbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		tpbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		spambtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		spambtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		spammodbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		spammodbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		scriptsbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		scriptsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		scriptsbtn.Text = "Desativar scripts"

		vsnotbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		vsnotbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		puxarbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		puxarbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		onlyplrbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		onlyplrbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		onlyheadbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		onlyheadbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		configbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		configbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		animbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		animbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		consolebtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		consolebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		local function ativar(scr)
			local tag = scr:FindFirstChild("_DESATIVADO_VIAX")
			if tag then
				scr.Enabled = true
				tag:Destroy()
			end
		end

		for _, scr in ipairs(plr.PlayerScripts:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				ativar(scr)
			end
		end

		for _, scr in ipairs(plr.PlayerGui:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				ativar(scr)
			end
		end

		for _, scr in ipairs(char:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				ativar(scr)
			end
		end
		existe = false
		distancia_tp = 2
		plr_FOCOMIRA = ""
		plrspamed = ""
		plrspamed2 = ""
		speed_spam = 0
		fovchanged = normalfov
		hum.WalkSpeed = normalspeed
		configFrame.Visible = false
		animFrame.Visible = false
		consoleDragFrame.Visible = false

		speedBox.Text = tostring(hum.WalkSpeed)
		puxarBox.Text = tostring(puxar_mira_size)
		puxarRaioBox.Text = tostring(puxar_mira_raio)
		grossuraEspBox.Text = tostring(grossura_esp)
		tpBox.Text = tostring(distancia_tp)
		fovBox.Text = tostring(normalfov)
		tpSpamBox.Text = ""
	end)
end

local function getNearestTarget()
	local nearest = nil
	local shortestDistance = math.huge

	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v ~= char then
			local hum = v:FindFirstChild("Humanoid")
			local root = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("UpperTorso") or v:FindFirstChild("Head")
			if onlyhead then
				root = v:FindFirstChild("Head") or v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("UpperTorso")
			end

			if root and alvoVivo(v) then
				if onlyplayers and not isPlayerModel(v) then
					continue
				end
				if ehMesmoTime(v) then
					continue
				end
				local distance = (root.Position - char.HumanoidRootPart.Position).Magnitude

				if distance < shortestDistance then
					shortestDistance = distance
					nearest = root
				end
			end
		end
	end

	return nearest
end

local function getTargetNearMouse(maxDist)
	local mousePos = mouse.Hit.Position

	local nearest = nil
	local shortestDistance = maxDist or 15

	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v ~= char then
			local hum = v:FindFirstChild("Humanoid")
			local root = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head") or v:FindFirstChild("UpperTorso")
			if onlyhead then
				root = v:FindFirstChild("Head") or v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("UpperTorso")
			end

			if root and alvoVivo(v) then
				if onlyplayers and not isPlayerModel(v) then
					continue
				end
				if ehMesmoTime(v) then
					continue
				end
				local dist = (root.Position - mousePos).Magnitude

				if dist < shortestDistance then
					shortestDistance = dist
					nearest = root
				end
			end
		end
	end

	return nearest
end

hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
	speedFly = hum.WalkSpeed
end)

local keys = {
	W = false,
	A = false,
	S = false,
	D = false,
	Space = false,
	Shift = false
}

UIS.InputBegan:Connect(function(input, gp)
	if gp then
		return
	end

	if input.KeyCode == Enum.KeyCode.W then keys.W = true end
	if input.KeyCode == Enum.KeyCode.A then keys.A = true end
	if input.KeyCode == Enum.KeyCode.S then keys.S = true end
	if input.KeyCode == Enum.KeyCode.D then keys.D = true end
	if input.KeyCode == Enum.KeyCode.Space then keys.Space = true end
	if input.KeyCode == Enum.KeyCode.LeftShift then keys.Shift = true end
end)

UIS.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then keys.W = false end
	if input.KeyCode == Enum.KeyCode.A then keys.A = false end
	if input.KeyCode == Enum.KeyCode.S then keys.S = false end
	if input.KeyCode == Enum.KeyCode.D then keys.D = false end
	if input.KeyCode == Enum.KeyCode.Space then keys.Space = false end
	if input.KeyCode == Enum.KeyCode.LeftShift then keys.Shift = false end
end)

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.T and cantp then
		teleportParaMouse()
	elseif input.KeyCode == Enum.KeyCode.M then
		modalallb = not modalallb
		if modalallb then
			for _, btnss in ipairs(main:GetChildren()) do
				if btnss:IsA("TextButton") then
					btnss.Modal = true
				end
			end
		else
			for _, btnss in ipairs(main:GetChildren()) do
				if btnss:IsA("TextButton") then
					btnss.Modal = false
				end
			end
		end
	elseif input.KeyCode == Enum.KeyCode.Up then
		escondertudo()
	elseif input.KeyCode == Enum.KeyCode.Down then
		if animAtual then
			animAtual:Stop()
			animAtual = nil
		end
	end
end)

local espObjects = {}

local function criarESP(model)
	if not model or not model:IsA("Model") then return end
	if not model:FindFirstChild("Humanoid") then return end
	if model == char then return end
	if espObjects[model] then return end

	local root = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("UpperTorso") or model:FindFirstChild("Head")

	if not root then
		return
	end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "Configs"
	billboard.Adornee = root
	billboard.AlwaysOnTop = true
	billboard.Size = UDim2.new(5, 0, 6, 0)
	billboard.Parent = model

	local box = Instance.new("Frame")
	box.Size = UDim2.new(1, 0, 1, 0)
	box.BackgroundTransparency = 1
	box.Parent = billboard

	local nome = Instance.new("TextLabel")
	nome.Size = UDim2.new(1, 0, 0.2, 0)
	nome.Position = UDim2.new(0, 0, 0, 0)
	nome.BackgroundTransparency = 1
	nome.TextScaled = true
	nome.Font = Enum.Font.GothamBold
	nome.TextColor3 = Color3.fromRGB(0, 0, 0)
	nome.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	nome.TextStrokeTransparency = 0
	nome.Parent = billboard

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	--stroke.Color = Color3.fromRGB(255, 0, 0)
	stroke.Parent = box

	local att0 = Instance.new("Attachment")
	att0.Parent = workspace

	local att1 = Instance.new("Attachment")
	att1.Parent = root

	local beam = Instance.new("Beam")
	beam.Attachment0 = att0
	beam.Attachment1 = att1
	--beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
	beam.Width0 = grossura_esp
	beam.Width1 = grossura_esp
	beam.FaceCamera = true
	beam.Parent = att0

	local corESP = Color3.fromRGB(255, 0, 0)

	local plrcoiso = game.Players:GetPlayerFromCharacter(model)

	if plrcoiso then
		nome.Text = plrcoiso.Name
	else
		nome.Text = model.Name
	end

	if ehMesmoTime(model) then
		corESP = Color3.fromRGB(255, 255, 0)
	end

	stroke.Color = corESP
	beam.Color = ColorSequence.new(corESP)

	espObjects[model] = {
		billboard = billboard,
		beam = beam,
		att0 = att0,
		att1 = att1,
		nome = nome
	}
end

local function removerESP(model)
	local data = espObjects[model]
	if data then
		if data.billboard then data.billboard:Destroy() end
		if data.beam then data.beam:Destroy() end
		if data.att0 then data.att0:Destroy() end
		if data.att1 then data.att1:Destroy() end
		espObjects[model] = nil
	end
end

run.RenderStepped:Connect(function()
	if normalfov ~= fovchanged then
		cam.FieldOfView = fovchanged
	end
	if speed_spam ~= 0 then
		hum.WalkSpeed = speed_spam
	end
	if plrspamed ~= "nil" and plrspamed ~= "" then
		for _, plrr in ipairs(workspace:GetChildren()) do
			if plrr.Name == plrspamed and plrr:FindFirstChild("Humanoid") then
				local root = char:FindFirstChild("HumanoidRootPart")
				if root then
					local targetRoot = plrr:FindFirstChild("HumanoidRootPart")
					if targetRoot then

						local pos = targetRoot.Position + Vector3.new(0, distancia_tp, 0)

						local look = targetRoot.CFrame.LookVector
						look = Vector3.new(look.X, 0, look.Z)

						if look.Magnitude > 0 then
							look = look.Unit
						else
							look = Vector3.new(0, 0, -1)
						end

						root.CFrame = CFrame.new(pos, pos + look)
						if not root:FindFirstChild("TP_HOLD") then
							local bv = Instance.new("BodyVelocity")
							bv.Name = "TP_HOLD"
							bv.MaxForce = Vector3.new(1,1,1) * 1000000
							bv.Velocity = Vector3.zero
							bv.Parent = root
						end
					end
				end
				break
			end
		end
	else
		local root = char:FindFirstChild("HumanoidRootPart")
		if root and root:FindFirstChild("TP_HOLD") then
			root.TP_HOLD:Destroy()
		end
	end
	if plrspamed2 ~= "" then
		for _, plrr in ipairs(workspace:GetChildren()) do
			if plrr.Name == plrspamed2 and plrr:FindFirstChild("Humanoid") then
				local targetRoot = plrr:FindFirstChild("HumanoidRootPart")
				local root = char:FindFirstChild("HumanoidRootPart")
				if root and targetRoot then
					local tremor = 3
					for i = 1, 30 do
						local offset = Vector3.new(
							(tremor * (math.random(0,1)*2 - 1)),
							(tremor * (math.random(0,1)*2 - 1)),
							(tremor * (math.random(0,1)*2 - 1))
						)
						root.CFrame = CFrame.new(targetRoot.Position + Vector3.new(0, distancia_tp, 0) + offset)
						task.wait(0.03)
					end
				end
				break
			end
		end
	end
	if plrspamed3 ~= "" then
		for _, plrr in ipairs(workspace:GetChildren()) do
			if plrr.Name == plrspamed3 and plrr:FindFirstChild("Humanoid") then
				local targetRoot = plrr:FindFirstChild("HumanoidRootPart")
				local root = char:FindFirstChild("HumanoidRootPart")

				if root and targetRoot then
					local velocidade = tempoDuranteTPsuspeito
					local distancia = distancia_tp

					tempoOsc += run.RenderStepped:Wait()

					local offsetZ = math.sin(tempoOsc * velocidade) * distancia
					local basePos = targetRoot.Position - targetRoot.CFrame.LookVector * 4
					local finalPos = basePos + targetRoot.CFrame.LookVector * offsetZ

					root.CFrame = CFrame.new(
						finalPos,
						targetRoot.Position
					)
				end
				break
			end
		end
	end
	if fly then
		setNoclip(true)

		local root = char:WaitForChild("HumanoidRootPart")

		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.MaxForce = Vector3.new(1,1,1) * 1000000
			bv.Velocity = Vector3.zero
			bv.Parent = root
		end

		if not bg then
			bg = Instance.new("BodyGyro")
			bg.MaxTorque = Vector3.new(1,1,1) * 1000000
			bg.P = 10000
			bg.CFrame = root.CFrame
			bg.Parent = root
		end

		hum.PlatformStand = true

		local move = Vector3.zero

		if keys.W then move += cam.CFrame.LookVector end
		if keys.S then move -= cam.CFrame.LookVector end
		if keys.A then move -= cam.CFrame.RightVector end
		if keys.D then move += cam.CFrame.RightVector end
		if keys.Space then move += Vector3.new(0,1,0) end
		if keys.Shift then move -= Vector3.new(0,1,0) end

		if move.Magnitude > 0 then
			move = move.Unit
		end

		bv.Velocity = move * speedFly

		bg.CFrame = CFrame.new(root.Position, root.Position + cam.CFrame.LookVector)

	else
		if bv then
			bv:Destroy()
			bv = nil
		end

		if bg then
			bg:Destroy()
			bg = nil
		end

		hum.PlatformStand = false
	end
	if esp then
		for _, data in pairs(espObjects) do
			if data.att0 and char and char:FindFirstChild("HumanoidRootPart") then
				data.att0.WorldPosition = char.HumanoidRootPart.Position
			end
		end

		for model, data in pairs(espObjects) do
			if model and data then
				local corESP = Color3.fromRGB(255, 0, 0)

				if ehMesmoTime(model) then
					corESP = Color3.fromRGB(255, 255, 0)
				end

				if data.billboard then
					local frame = data.billboard:FindFirstChildOfClass("Frame")
					if frame then
						local stroke = frame:FindFirstChildOfClass("UIStroke")
						if stroke then
							stroke.Color = corESP
						end
					end
				end

				if data.beam then
					data.beam.Color = ColorSequence.new(corESP)
				end
			end
		end

		if onlyplayers then
			for _, v in ipairs(game.Players:GetPlayers()) do
				if v.Character then
					criarESP(v.Character)
				end
			end
		else
			for _, v in ipairs(workspace:GetChildren()) do
				criarESP(v)
			end
		end
	else
		for model, _ in pairs(espObjects) do
			removerESP(model)
		end
	end
	if aimbot then
		alvoAtual = getNearestTarget()

		if plr_FOCOMIRA ~= "" then
			if alvoAtual and alvoAtual.Parent.Name == plr_FOCOMIRA then
				cam.CFrame = CFrame.new(cam.CFrame.Position, alvoAtual.Position)
			end
		else
			if alvoAtual and temVisao(alvoAtual) then
				cam.CFrame = CFrame.new(cam.CFrame.Position, alvoAtual.Position)
			end
		end
	end
	if puxarmira then
		local alvo = getTargetNearMouse(puxar_mira_raio)

		if plr_FOCOMIRA ~= "" then
			if alvo and alvo.Parent.Name == plr_FOCOMIRA and temVisao(alvo) then
				local posCam = cam.CFrame.Position
				local posAlvo = alvo.Position

				cam.CFrame = cam.CFrame:Lerp(
					CFrame.new(posCam, posAlvo),
					puxar_mira_size
				)
			end
		else
			if alvo and temVisao(alvo) then
				local posCam = cam.CFrame.Position
				local posAlvo = alvo.Position

				cam.CFrame = cam.CFrame:Lerp(
					CFrame.new(posCam, posAlvo),
					puxar_mira_size
				)
			end
		end
	end
	if vsnot then
		if not game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT) then
			local papapasta = Instance.new("Folder", game.ReplicatedStorage)
			papapasta.Name = ID_STOCKLIGHT
			papapasta:SetAttribute("STARTFOV", game.Lighting.FogStart)
			papapasta:SetAttribute("ENDFOV", game.Lighting.FogEnd)
			papapasta:SetAttribute("COLOR", game.Lighting.FogColor)
			papapasta:SetAttribute("BRIGHTNESS", game.Lighting.Brightness)
			papapasta:SetAttribute("ExposureCompensation", game.Lighting.ExposureCompensation)
			papapasta:SetAttribute("EnvironmentDiffuseScale", game.Lighting.EnvironmentDiffuseScale)
		end
		for _, coisasluz in ipairs(game.Lighting:GetChildren()) do
			if coisasluz:IsA("Atmosphere") or coisasluz:IsA("Sky") then
				coisasluz.Parent = game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT)
			end
		end
		game.Lighting.FogStart = 0
		game.Lighting.FogEnd = 1111111111
		game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
		game.Lighting.Brightness = 2
		game.Lighting.ExposureCompensation = 0
		game.Lighting.EnvironmentDiffuseScale = 1
	else
		if game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT) then
			for _, coisasluz in ipairs(game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):GetChildren()) do
				coisasluz.Parent = game.Lighting
			end
			game.Lighting.FogStart = game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):GetAttribute("STARTFOV")
			game.Lighting.FogEnd = game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):GetAttribute("ENDFOV")
			game.Lighting.FogColor = game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):GetAttribute("COLOR")
			game.Lighting.Brightness = game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):GetAttribute("BRIGHTNESS")
			game.Lighting.ExposureCompensation = game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):GetAttribute("ExposureCompensation")
			game.Lighting.EnvironmentDiffuseScale = game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):GetAttribute("EnvironmentDiffuseScale")
			game.ReplicatedStorage:FindFirstChild(ID_STOCKLIGHT):Destroy()
		end
	end
	--[[if terceirozoi then
		for _, objjj in ipairs(workspace:GetDescendants()) do
			if (objjj:IsA("Part") or objjj:IsA("MeshPart")) and not objjj:FindFirstChild(ID_TERCEROZOI_OBJ) then
				local identificar = Instance.new("IntValue", objjj)
				identificar.Name = ID_TERCEROZOI_OBJ
				identificar.Value = objjj.Transparency
				objjj.Transparency = SUBID_TERCEROZOI_VV
			end
		end
	else
		for _, objjj in ipairs(workspace:GetDescendants()) do
			if (objjj:IsA("Part") or objjj:IsA("MeshPart")) and objjj:FindFirstChild(ID_TERCEROZOI_OBJ) then
				objjj.Transparency = objjj:FindFirstChild(ID_TERCEROZOI_OBJ).Value
				objjj:FindFirstChild(ID_TERCEROZOI_OBJ):Destroy()
			end
		end
	end]]
end)

workspace.ChildAdded:Connect(function(child)
	if esp then
		task.wait(0.5)
		criarESP(child)
	end
end)

plr.CharacterAdded:Connect(function(newChar)
	char = newChar
	task.wait(1)

	if esp then
		for model, _ in pairs(espObjects) do
			removerESP(model)
		end
	end
end)

flybtn.MouseButton1Click:Connect(function()
	fly = not fly

	if fly then
		flybtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		flybtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		flybtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		flybtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

espbtn.MouseButton1Click:Connect(function()
	esp = not esp

	if esp then
		espbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		espbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		espbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		espbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

aimbotbtn.MouseButton1Click:Connect(function()
	aimbot = not aimbot

	if aimbot then
		aimbotbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		aimbotbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		aimbotbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		aimbotbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

tpbtn.MouseButton1Click:Connect(function()
	cantp = not cantp

	if cantp then
		tpbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tpbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		tpbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		tpbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

spambtn.MouseButton1Click:Connect(function()
	spamrem = not spamrem

	if spamrem then
		spambtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		spambtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		spambtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		spambtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end

	task.spawn(function()
		while spamrem do
			for _, remoten in ipairs(game.ReplicatedStorage:GetDescendants()) do
				if remoten:IsA("RemoteEvent") then
					remoten:FireServer()
					remoten:FireServer(msgSpam)
				elseif remoten:IsA("BindableEvent") then
					remoten:Fire()
					remoten:Fire(msgSpam)
				end
			end
			for _, remoten in ipairs(workspace:GetDescendants()) do
				if remoten:IsA("RemoteEvent") then
					remoten:FireServer()
					remoten:FireServer(msgSpam)
				elseif remoten:IsA("BindableEvent") then
					remoten:Fire()
					remoten:Fire(msgSpam)
				end
			end
			task.wait(0.1)
		end
	end)
end)

spammodbtn.MouseButton1Click:Connect(function()
	spammod = not spammod

	if spammod then
		spammodbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		spammodbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		spammodbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		spammodbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end

	task.spawn(function()
		while spammod do
			for _, modulen in ipairs(game.ReplicatedStorage:GetDescendants()) do
				if modulen:IsA("ModuleScript") then
					pcall(function()
						local m = require(modulen)

						if typeof(m) == "table" then
							local f = m[msgSpam]
							if typeof(f) == "function" then
								f(msgSpam)
							end
						elseif typeof(m) == "function" then
							m(msgSpam)
						end
					end)
				end
			end
			for _, modulen in ipairs(workspace:GetDescendants()) do
				if modulen:IsA("ModuleScript") then
					pcall(function()
						local m = require(modulen)

						if typeof(m) == "table" then
							local f = m[msgSpam]
							if typeof(f) == "function" then
								f(msgSpam)
							end
						elseif typeof(m) == "function" then
							m(msgSpam)
						end
					end)
				end
			end

			task.wait(0.1)
		end
	end)
end)

scriptsbtn.MouseButton1Click:Connect(function()
	scriptsoff = not scriptsoff

	if scriptsoff then
		scriptsbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		scriptsbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
		scriptsbtn.Text = "Ativar scripts"

		local function desativar(scr)
			if scr == script then
				return
			end

			if not scr:FindFirstChild("_DESATIVADO_VIAX") then
				scr.Enabled = false
				local tag = Instance.new("BoolValue")
				tag.Name = "_DESATIVADO_VIAX"
				tag.Parent = scr
			end
		end

		for _, scr in ipairs(plr.PlayerScripts:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				desativar(scr)
			end
		end

		for _, scr in ipairs(plr.PlayerGui:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				desativar(scr)
			end
		end

		for _, scr in ipairs(char:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				desativar(scr)
			end
		end

	else
		scriptsbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		scriptsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		scriptsbtn.Text = "Desativar scripts"

		local function ativar(scr)
			local tag = scr:FindFirstChild("_DESATIVADO_VIAX")
			if tag then
				scr.Enabled = true
				tag:Destroy()
			end
		end

		for _, scr in ipairs(plr.PlayerScripts:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				ativar(scr)
			end
		end

		for _, scr in ipairs(plr.PlayerGui:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				ativar(scr)
			end
		end

		for _, scr in ipairs(char:GetDescendants()) do
			if scr:IsA("LocalScript") or scr:IsA("Script") then
				ativar(scr)
			end
		end
	end
end)

vsnotbtn.MouseButton1Click:Connect(function()
	vsnot = not vsnot

	if vsnot then
		vsnotbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		vsnotbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		vsnotbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		vsnotbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

puxarbtn.MouseButton1Click:Connect(function()
	puxarmira = not puxarmira
	removerESP()

	if puxarmira then
		puxarbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		puxarbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		puxarbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		puxarbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

esconderbtn.MouseButton1Click:Connect(function()
	escondertudo()
end)

onlyplrbtn.MouseButton1Click:Connect(function()
	onlyplayers = not onlyplayers

	for model, _ in pairs(espObjects) do
		removerESP(model)
	end

	if onlyplayers then
		onlyplrbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		onlyplrbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		onlyplrbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		onlyplrbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

onlyheadbtn.MouseButton1Click:Connect(function()
	onlyhead = not onlyhead

	if onlyhead then
		onlyheadbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		onlyheadbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		onlyheadbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		onlyheadbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

configbtn.MouseButton1Click:Connect(function()
	configsopen = not configsopen
	configFrame.Visible = not configFrame.Visible

	if configsopen then
		configbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		configbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		configbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		configbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

animbtn.MouseButton1Click:Connect(function()
	animopen = not animopen
	animFrame.Visible = animopen

	if animopen then
		animbtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
		animbtn.TextColor3 = Color3.fromRGB(0,0,0)
	else
		animbtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
		animbtn.TextColor3 = Color3.fromRGB(255,255,255)
	end
end)

consolebtn.MouseButton1Click:Connect(function()
	consoleopen = not consoleopen
	consoleDragFrame.Visible = not consoleDragFrame.Visible

	if consoleopen then
		consolebtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
		consolebtn.TextColor3 = Color3.fromRGB(0,0,0)
	else
		consolebtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
		consolebtn.TextColor3 = Color3.fromRGB(255,255,255)
	end
end)
--[[transparencybtn.MouseButton1Click:Connect(function()
	terceirozoi = not terceirozoi

	if terceirozoi then
		transparencybtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
		transparencybtn.TextColor3 = Color3.fromRGB(0,0,0)
	else
		transparencybtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
		transparencybtn.TextColor3 = Color3.fromRGB(255,255,255)
	end
end)]]

--[[hum.Died:Connect(function()
	local activationnn = false
	if consoleDragFrame.Visible == true then
		activationnn = true
	end
	escondertudo()
	if activationnn == true then
		consoleDragFrame.Visible = true
	end
end)]]

plr.CharacterAdded:Connect(function(newChar)
	script:Clone().Parent = plr.PlayerScripts
	char = newChar
	hum = char:WaitForChild("Humanoid")

	normalspeed = hum.WalkSpeed

	fly = false
	if bv then
		bv:Destroy()
		bv = nil
	end

	aimbot = false
	alvoAtual = nil
	script:Destroy()
end)

speedBox.FocusLost:Connect(function()
	local val = tonumber(speedBox.Text)
	if speedBox.Text == "n" or speedBox.Text == "normal" then
		val = normalspeed
	end
	if val then
		hum.WalkSpeed = val
	end
	speedBox.Text = tostring(hum.WalkSpeed)
end)

speedSpamBox.FocusLost:Connect(function()
	local val = tonumber(speedSpamBox.Text)
	if val then
		speed_spam = val
	end
	speedSpamBox.Text = tostring(speed_spam)
end)

puxarBox.FocusLost:Connect(function()
	local val = tonumber(puxarBox.Text)
	if val and val >= 0 and val <= 1 then
		puxar_mira_size = val
	end
	puxarBox.Text = tostring(puxar_mira_size)
end)

puxarRaioBox.FocusLost:Connect(function()
	local val = tonumber(puxarRaioBox.Text)
	if val and val >= 0 then
		puxar_mira_raio = val
	end
	puxarRaioBox.Text = tostring(puxar_mira_raio)
end)

grossuraEspBox.FocusLost:Connect(function()
	local val = tonumber(grossuraEspBox.Text)
	if val and val >= 0 and val <= 5 then
		grossura_esp = val
	end
	grossuraEspBox.Text = tostring(grossura_esp)
end)

noclipFlyBox.FocusLost:Connect(function()
	if noclipFlyBox.Text == "t" or noclipFlyBox.Text == "true" then
		cannoclip = true
	elseif noclipFlyBox.Text == "f" or noclipFlyBox.Text == "false" then
		cannoclip = false
	else
		noclipFlyBox.Text = tostring(cannoclip)
	end
	noclipFlyBox.Text = tostring(cannoclip)
end)

fovBox.FocusLost:Connect(function()
	if fovBox.Text == "n" then
		fovchanged = normalfov
	else
		local val = tonumber(fovBox.Text)
		if val then
			fovchanged = val
		end
	end
	fovBox.Text = tostring(fovchanged)
end)

tpBox.FocusLost:Connect(function()
	if onlyplayers then
		for _, plll in ipairs(game.Players:GetPlayers()) do
			if plll.Name == tpBox.Text then
				local root = char:FindFirstChild("HumanoidRootPart")
				if root then
					root.CFrame = CFrame.new(plll.Character:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0, distancia_tp, 0))
				end
				break
			end
		end
	else
		for _, plll in ipairs(workspace:GetChildren()) do
			if plll.Name == tpBox.Text and plll:FindFirstChild("Humanoid") then
				local root = char:FindFirstChild("HumanoidRootPart")
				if root then
					root.CFrame = CFrame.new(plll:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0, distancia_tp, 0))
				end
				break
			end
		end
	end
	tpBox.Text = ""
end)

tpSpamBox.FocusLost:Connect(function()
	if onlyplayers then
		if tpSpamBox.Text == "random" then
			local vava = {}

			for _, plrr in ipairs(game.Players:GetPlayers()) do
				table.insert(vava, plrr.Name)
			end
			plrspamed = vava[math.random(1, #vava)]
		else
			for _, plrr in ipairs(game.Players:GetPlayers()) do
				if plrr.Name == tpSpamBox.Text then
					plrspamed = plrr.Name
					break
				end
			end
		end
	else
		if tpSpamBox.Text == "random" then
			local vava = {}

			for _, plrr in ipairs(workspace:GetDescendants()) do
				if plrr:FindFirstChild("Humanoid") then
					table.insert(vava, plrr.Name)
				end
			end
			plrspamed = vava[math.random(1, #vava)]
		else
			plrspamed = tpSpamBox.Text
		end
	end
	tpSpamBox.Text = plrspamed
end)

tpSpamBox2.FocusLost:Connect(function()
	if onlyplayers then
		if tpSpamBox2.Text == "random" then
			local vava = {}

			for _, plrr in ipairs(game.Players:GetPlayers()) do
				table.insert(vava, plrr.Name)
			end
			plrspamed2 = vava[math.random(1, #vava)]
		else
			for _, plrr in ipairs(game.Players:GetPlayers()) do
				if plrr.Name == tpSpamBox2.Text then
					plrspamed2 = plrr.Name
					break
				end
			end
		end
	else
		if tpSpamBox2.Text == "random" then
			local vava = {}

			for _, plrr in ipairs(workspace:GetDescendants()) do
				if plrr:FindFirstChild("Humanoid") then
					table.insert(vava, plrr.Name)
				end
			end
			plrspamed2 = vava[math.random(1, #vava)]
		else
			plrspamed2 = tpSpamBox2.Text
		end
	end
	tpSpamBox2.Text = plrspamed2
end)

tplimitBox.FocusLost:Connect(function()
	local val = tonumber(tplimitBox.Text)
	if val then
		distancia_tp = val
	end
	tplimitBox.Text = tostring(distancia_tp)
end)

mirafocoBox.FocusLost:Connect(function()
	plr_FOCOMIRA = mirafocoBox.Text
	mirafocoBox.Text = plr_FOCOMIRA
end)

spammsgBox.FocusLost:Connect(function()
	msgSpam = spammsgBox.Text
	spammsgBox.Text = msgSpam
end)

maxmsgconsoleBox.FocusLost:Connect(function()
	local val = tonumber(maxmsgconsoleBox.Text)
	if val then
		maxMsgConsole = val
	end
	maxmsgconsoleBox.Text = tostring(maxMsgConsole)
end)

arquivonameBox.FocusLost:Connect(function()
	nameIDTHIS = arquivonameBox.Text
	arquivonameBox.Text = nameIDTHIS
end)

ignoraParedesBox.FocusLost:Connect(function()
	if ignoraParedesBox.Text == "t" or ignoraParedesBox.Text == "true" then
		ignoraAlvoComParede = true
	elseif ignoraParedesBox.Text == "f" or ignoraParedesBox.Text == "false" then
		ignoraAlvoComParede = false
	else
		ignoraParedesBox.Text = tostring(ignoraAlvoComParede)
	end
	ignoraParedesBox.Text = tostring(ignoraAlvoComParede)
end)

ignorarplrtimeBox.FocusLost:Connect(function()
	if ignorarplrtimeBox.Text == "t" or ignorarplrtimeBox.Text == "true" then
		ignoraAlvoMesmoTime = true
	elseif ignorarplrtimeBox.Text == "f" or ignorarplrtimeBox.Text == "false" then
		ignoraAlvoMesmoTime = false
	else
		ignorarplrtimeBox.Text = tostring(ignoraAlvoMesmoTime)
	end
	ignorarplrtimeBox.Text = tostring(ignoraAlvoMesmoTime)
end)

tptemposuspeitoBox.FocusLost:Connect(function()
	local val = tonumber(tptemposuspeitoBox.Text)
	if val then
		tempoDuranteTPsuspeito = val
	end
	tptemposuspeitoBox.Text = tostring(tempoDuranteTPsuspeito)
end)

tpSpamBox3.FocusLost:Connect(function()
	if onlyplayers then
		if tpSpamBox3.Text == "random" then
			local vava = {}

			for _, plrr in ipairs(game.Players:GetPlayers()) do
				table.insert(vava, plrr.Name)
			end
			plrspamed3 = vava[math.random(1, #vava)]
		else
			for _, plrr in ipairs(game.Players:GetPlayers()) do
				if plrr.Name == tpSpamBox3.Text then
					plrspamed3 = plrr.Name
					break
				end
			end
		end
	else
		if tpSpamBox3.Text == "random" then
			local vava = {}

			for _, plrr in ipairs(workspace:GetDescendants()) do
				if plrr:FindFirstChild("Humanoid") then
					table.insert(vava, plrr.Name)
				end
			end
			plrspamed3 = vava[math.random(1, #vava)]
		else
			plrspamed3 = tpSpamBox3.Text
		end
	end
	tpSpamBox3.Text = plrspamed3
end)

LGS.MessageOut:Connect(function(msg, typee)
	msg = tostring(msg):gsub("<", "&lt;"):gsub(">", "&gt;")

	addLog(msg, typee)
end)

task.spawn(function()
	if first_time == false then
		task.wait(math.random(2, 3))
	else
		task.wait(math.random(3, 5))
	end
	_CARREGAMENTO__:Destroy()
end)
