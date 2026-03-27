-- oi
local UIS = game:GetService("UserInputService")
local run = game:GetService("RunService")
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local pg = plr.PlayerGui

local VERSAO_SLENDER = "0.3"
local puxar_mira_size = 0.4
local puxar_mira_raio = 10
local grossura_esp = 0.05
local existe = false
local normalspeed = hum.WalkSpeed
local _CARREGAMENTO__ = Instance.new("Hint")
_CARREGAMENTO__.Text = "Carregando " .. VERSAO_SLENDER .. "v..."
_CARREGAMENTO__.Parent = workspace

local gui = Instance.new("ScreenGui")
gui.Name = "Configs"
gui.IgnoreGuiInset = true
gui.Parent = pg
gui.ResetOnSpawn = true

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.35, 0, 0.67, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Parent = gui

local configFrame = Instance.new("Frame")
configFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
configFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
configFrame.AnchorPoint = Vector2.new(0.5, 0.5)
configFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
configFrame.Visible = false
configFrame.Parent = gui

Instance.new("UICorner", configFrame).CornerRadius = UDim.new(0.08, 0)
Instance.new("UIDragDetector", configFrame)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0.05, 0)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Parent = configFrame

Instance.new("UICorner", main).CornerRadius = UDim.new(0.08, 0)
Instance.new("UIDragDetector", main)

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

local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0.25, 0, 0.15, 0)
grid.CellPadding = UDim2.new(0.05, 0, 0.02, 0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Center
grid.Parent = main

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
	container.Size = UDim2.new(0.85, 0, 0.2, 0)
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

local flybtn = criarBotao("Voar")
local espbtn = criarBotao("ESP")
local aimbotbtn = criarBotao("Aimbot")
local tpbtn = criarBotao("Teleportar - T")
local spambtn = criarBotao("Spam remote")
local scriptsbtn = criarBotao("Desativar scripts")
local puxarbtn = criarBotao("Puxar mira")
local esconderbtn = criarBotao("Esconder")
local onlyplrbtn = criarBotao("Apenas players")
local onlyheadbtn = criarBotao("Só capa")
local configbtn = criarBotao("Configurações")

local speedBox = criarConfigItem("Velocidade", hum.WalkSpeed)
local puxarBox = criarConfigItem("Puxar Mira Força", puxar_mira_size)
local puxarRaioBox = criarConfigItem("Puxar Mira Raio", puxar_mira_raio)
local grossuraEspBox = criarConfigItem("Tamanho ESP", grossura_esp)

local modalallb = false

local function isPlayerModel(model)
	return game.Players:GetPlayerFromCharacter(model) ~= nil
end

local function setNoclip(state)
	for _, v in ipairs(char:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = not state
		end
	end
end

local aimbot = false
local esp = false
local fly = false
local cantp = false
local spamrem = false
local scriptsoff = false
local puxarmira = false
local onlyplayers = false
local onlyhead = false
local configsopen = false

local alvoAtual = nil
local bv
local bg
local speedFly = hum.WalkSpeed

local mouse = plr:GetMouse()

local function teleportParaMouse()
	local root = char:FindFirstChild("HumanoidRootPart") 
		or char:FindFirstChild("UpperTorso") 
		or char:FindFirstChild("Head")

	if onlyhead then
		root = char:FindFirstChild("Head") 
			or char:FindFirstChild("HumanoidRootPart") 
			or char:FindFirstChild("UpperTorso")
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
		root.CFrame = CFrame.new(nearestModel.Position + offset + Vector3.new(0, 2, 0))
	end
end

local function escondertudo()
	aimbot = false
	esp = false
	fly = false
	cantp = false
	spamrem = false
	scriptsoff = false
	puxarmira = false
	onlyplayers = false
	onlyhead = false
	configsopen = false

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

		scriptsbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		scriptsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		scriptsbtn.Text = "Desativar scripts"

		puxarbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		puxarbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		onlyplrbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		onlyplrbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

		onlyheadbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		onlyheadbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		
		configbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		configbtn.TextColor3 = Color3.fromRGB(255, 255, 255)

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
		hum.WalkSpeed = normalspeed
		configFrame.Visible = false
		
		speedBox.Text = tostring(hum.WalkSpeed)
		puxarBox.Text = tostring(puxar_mira_size)
		puxarRaioBox.Text = tostring(puxar_mira_raio)
		grossuraEspBox.Text = tostring(grossura_esp)
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
			
			if hum and root and hum.Health > 0 then
				if onlyplayers and not isPlayerModel(v) then
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
			
			if hum and root and hum.Health > 0 then
				if onlyplayers and not isPlayerModel(v) then
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
	
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(255, 0, 0)
	stroke.Parent = box

	local att0 = Instance.new("Attachment")
	att0.Parent = workspace

	local att1 = Instance.new("Attachment")
	att1.Parent = root

	local beam = Instance.new("Beam")
	beam.Attachment0 = att0
	beam.Attachment1 = att1
	beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
	beam.Width0 = grossura_esp
	beam.Width1 = grossura_esp
	beam.FaceCamera = true
	beam.Parent = att0

	espObjects[model] = {
		billboard = billboard,
		beam = beam,
		att0 = att0,
		att1 = att1
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

		local cam = workspace.CurrentCamera
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
		if onlyplayers then
			for _, v in ipairs(game.Players:GetPlayers()) do
				criarESP(v.Character)
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
		local cam = workspace.CurrentCamera
		alvoAtual = getNearestTarget()

		if alvoAtual then
			cam.CFrame = CFrame.new(cam.CFrame.Position, alvoAtual.Position)
		end
	end
	if puxarmira then
		local cam = workspace.CurrentCamera
		local alvo = getTargetNearMouse(puxar_mira_raio)

		if alvo then
			local posCam = cam.CFrame.Position
			local posAlvo = alvo.Position

			cam.CFrame = cam.CFrame:Lerp(
				CFrame.new(posCam, posAlvo),
				puxar_mira_size
			)
		end
	end
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
				elseif remoten:IsA("BindableEvent") then
					remoten:Fire()
				end
			end
			for _, remoten in ipairs(workspace:GetDescendants()) do
				if remoten:IsA("RemoteEvent") then
					remoten:FireServer()
				elseif remoten:IsA("BindableEvent") then
					remoten:Fire()
				end
			end
			for _, remoten in ipairs(game.ReplicatedStorage:GetDescendants()) do
				if remoten:IsA("RemoteEvent") then
					remoten:FireServer("wow")
				elseif remoten:IsA("BindableEvent") then
					remoten:Fire("wow")
				end
			end
			for _, remoten in ipairs(workspace:GetDescendants()) do
				if remoten:IsA("RemoteEvent") then
					remoten:FireServer("wow")
				elseif remoten:IsA("BindableEvent") then
					remoten:Fire("wow")
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

plr.CharacterAdded:Connect(function(newChar)
	char = newChar
	hum = char:WaitForChild("Humanoid")

	normalspeed = hum.WalkSpeed

	fly = false
	if bv then
		bv:Destroy()
		bv = nil
	end

	for model, _ in pairs(espObjects) do
		removerESP(model)
	end

	aimbot = false
	alvoAtual = nil
end)

speedBox.FocusLost:Connect(function()
	local val = tonumber(speedBox.Text)
	if val then
		hum.WalkSpeed = val
	else
		speedBox.Text = tostring(hum.WalkSpeed)
	end
end)

puxarBox.FocusLost:Connect(function()
	local val = tonumber(puxarBox.Text)
	if val and val >= 0 and val <= 1 then
		puxar_mira_size = val
	else
		puxarBox.Text = tostring(puxar_mira_size)
	end
end)

puxarRaioBox.FocusLost:Connect(function()
	local val = tonumber(puxarRaioBox.Text)
	if val and val >= 0 then
		puxar_mira_raio = val
	else
		puxarRaioBox.Text = tostring(puxar_mira_raio)
	end
end)

grossuraEspBox.FocusLost:Connect(function()
	local val = tonumber(grossuraEspBox.Text)
	if val and val >= 0 and val <= 5 then
		grossura_esp = val
	else
		grossuraEspBox.Text = tostring(grossura_esp)
	end
end)

task.spawn(function()
	task.wait(math.random(3, 5))
	_CARREGAMENTO__:Destroy()
end)
