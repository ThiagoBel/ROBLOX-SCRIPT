-- oi
local UIS = game:GetService("UserInputService")
local run = game:GetService("RunService")
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local pg = plr.PlayerGui

local sizebtns = UDim2.new(0.447, 0, 0.175, 0)
local normalspeed = hum.WalkSpeed
local _CARREGAMENTO__ = Instance.new("Hint")
_CARREGAMENTO__.Text = "Carregando..."
_CARREGAMENTO__.Parent = workspace

local gui = Instance.new("ScreenGui")
gui.Name = "Configs"
gui.Parent = pg
gui.ResetOnSpawn = true

local main = Instance.new("Frame")
main.Name = "Main"
main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
main.Size = UDim2.new(0.184, 0, 0.532, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Parent = gui

local drag = Instance.new("UIDragDetector")
drag.Parent = main

local border = Instance.new("UICorner")
border.CornerRadius = UDim.new(0.05, 0)
border.Parent = main

local list = Instance.new("UIListLayout")
list.FillDirection = Enum.FillDirection.Horizontal
list.Wraps = true
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.VerticalAlignment = Enum.VerticalAlignment.Center
list.Padding = UDim.new(0.01, 0)
list.Parent = main

local flybtn = Instance.new("TextButton")
flybtn.Name = "btn"
flybtn.Text = "Voar"
flybtn.TextScaled = true
flybtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
flybtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flybtn.Size = sizebtns
flybtn.Parent = main

local borderbtn = Instance.new("UICorner")
borderbtn.CornerRadius = UDim.new(0.05, 0)
borderbtn.Parent = flybtn

local speedbtn = Instance.new("TextButton")
speedbtn.Name = "btn"
speedbtn.Text = "Velocidade"
speedbtn.TextScaled = true
speedbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
speedbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedbtn.Size = sizebtns
speedbtn.Parent = main

local borderbtn2 = Instance.new("UICorner")
borderbtn2.CornerRadius = UDim.new(0.05, 0)
borderbtn2.Parent = speedbtn

local espbtn = Instance.new("TextButton")
espbtn.Name = "btn"
espbtn.Text = "ESP"
espbtn.TextScaled = true
espbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
espbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espbtn.Size = sizebtns
espbtn.Parent = main

local borderbtn3 = Instance.new("UICorner")
borderbtn3.CornerRadius = UDim.new(0.05, 0)
borderbtn3.Parent = espbtn

local aimbotbtn = Instance.new("TextButton")
aimbotbtn.Name = "btn"
aimbotbtn.Text = "Aimbot"
aimbotbtn.TextScaled = true
aimbotbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
aimbotbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotbtn.Size = sizebtns
aimbotbtn.Parent = main

local borderbtn4 = Instance.new("UICorner")
borderbtn4.CornerRadius = UDim.new(0.05, 0)
borderbtn4.Parent = aimbotbtn

local tpbtn = Instance.new("TextButton")
tpbtn.Name = "btn"
tpbtn.Text = "Teleporte - T"
tpbtn.TextScaled = true
tpbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
tpbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
tpbtn.Size = sizebtns
tpbtn.Parent = main

local borderbtn5 = Instance.new("UICorner")
borderbtn5.CornerRadius = UDim.new(0.05, 0)
borderbtn5.Parent = tpbtn

local spambtn = Instance.new("TextButton")
spambtn.Name = "btn"
spambtn.Text = "Spam remote"
spambtn.TextScaled = true
spambtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
spambtn.TextColor3 = Color3.fromRGB(255, 255, 255)
spambtn.Size = sizebtns
spambtn.Parent = main

local borderbtn6 = Instance.new("UICorner")
borderbtn6.CornerRadius = UDim.new(0.05, 0)
borderbtn6.Parent = spambtn

local scriptsbtn = Instance.new("TextButton")
scriptsbtn.Name = "btn"
scriptsbtn.Text = "Desativar scripts"
scriptsbtn.TextScaled = true
scriptsbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
scriptsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptsbtn.Size = sizebtns
scriptsbtn.Parent = main

local borderbtn7 = Instance.new("UICorner")
borderbtn7.CornerRadius = UDim.new(0.05, 0)
borderbtn7.Parent = scriptsbtn

local puxarbtn = Instance.new("TextButton")
puxarbtn.Name = "btn"
puxarbtn.Text = "Puxar mira"
puxarbtn.TextScaled = true
puxarbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
puxarbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
puxarbtn.Size = sizebtns
puxarbtn.Parent = main

local borderbtn8 = Instance.new("UICorner")
borderbtn8.CornerRadius = UDim.new(0.05, 0)
borderbtn8.Parent = puxarbtn

local esconderbtn = Instance.new("TextButton")
esconderbtn.Name = "btn"
esconderbtn.Text = "Esconder"
esconderbtn.TextScaled = true
esconderbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
esconderbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
esconderbtn.Size = sizebtns
esconderbtn.Parent = main

local borderbtn9 = Instance.new("UICorner")
borderbtn9.CornerRadius = UDim.new(0.05, 0)
borderbtn9.Parent = esconderbtn

local modalallb = false

local function setNoclip(state)
	for _, v in ipairs(char:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = not state
		end
	end
end

local mouse = plr:GetMouse()

local function teleportParaMouse()
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then
		return
	end

	local mousePos = mouse.Hit.Position

	local nearestModel = nil
	local shortestDistance = math.huge

	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v ~= char then
			local hum = v:FindFirstChild("Humanoid")
			local targetRoot = v:FindFirstChild("HumanoidRootPart")

			if hum and targetRoot and hum.Health > 0 then
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

local aimbot = false
local esp = false
local fly = false
local cantp = false
local spamrem = false
local scriptsoff = false
local puxarmira = false

local alvoAtual = nil
local bv
local bg
local speedFly = hum.WalkSpeed

local function getNearestTarget()
	local nearest = nil
	local shortestDistance = math.huge

	for _, v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and v ~= char then
			local hum = v:FindFirstChild("Humanoid")
			local root = v:FindFirstChild("HumanoidRootPart")

			if hum and root and hum.Health > 0 then
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
			local root = v:FindFirstChild("HumanoidRootPart")

			if hum and root and hum.Health > 0 then
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
	end
end)

local espObjects = {}

local function criarESP(model)
	if not model or not model:IsA("Model") then
		return
	end
	if not model:FindFirstChild("Humanoid") then
		return
	end
	if model == char then
		return
	end

	if espObjects[model] then
		return
	end

	local root = model:FindFirstChild("HumanoidRootPart")
	if not root then
		return
	end

	local hl = Instance.new("Highlight")
	hl.Name = "___InfoPlr_"
	hl.Adornee = model
	hl.FillTransparency = 1
	hl.OutlineTransparency = 0
	hl.OutlineColor = Color3.fromRGB(255, 0, 0)
	hl.Parent = model

	local att0 = Instance.new("Attachment")
	att0.Parent = char:WaitForChild("HumanoidRootPart")

	local att1 = Instance.new("Attachment")
	att1.Parent = root

	local beam = Instance.new("Beam")
	beam.Attachment0 = att0
	beam.Attachment1 = att1
	beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
	beam.Width0 = 0.1
	beam.Width1 = 0.1
	beam.FaceCamera = true
	beam.Parent = att0

	espObjects[model] = {
		highlight = hl,
		beam = beam,
		att0 = att0,
		att1 = att1
	}
end

local function removerESP(model)
	local data = espObjects[model]
	if data then
		if data.highlight then data.highlight:Destroy() end
		if data.beam then data.beam:Destroy() end
		if data.att0 then data.att0:Destroy() end
		if data.att1 then data.att1:Destroy() end
		espObjects[model] = nil
	end
end

run.RenderStepped:Connect(function()
	if fly then
		setNoclip(true)

		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.MaxForce = Vector3.new(1,1,1) * 100000
			bv.Velocity = Vector3.zero
			bv.Parent = char:WaitForChild("HumanoidRootPart")
		end

		local cam = workspace.CurrentCamera
		local move = Vector3.zero

		if keys.W then
			move += cam.CFrame.LookVector
		end
		if keys.S then
			move -= cam.CFrame.LookVector
		end
		if keys.A then
			move -= cam.CFrame.RightVector
		end
		if keys.D then
			move += cam.CFrame.RightVector
		end
		if keys.Space then
			move += Vector3.new(0,1,0)
		end
		if keys.Shift then
			move -= Vector3.new(0,1,0)
		end

		bv.Velocity = move * speedFly
	elseif bv then
		setNoclip(false)
		bv:Destroy()
		bv = nil
	end
	if esp then
		for _, v in ipairs(workspace:GetChildren()) do
			criarESP(v)
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
		local alvo = getTargetNearMouse(10)

		if alvo then
			local posCam = cam.CFrame.Position
			local posAlvo = alvo.Position

			cam.CFrame = cam.CFrame:Lerp(
				CFrame.new(posCam, posAlvo),
				2
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

local responsespeed
local existe = false

speedbtn.MouseButton1Click:Connect(function()
	if existe == false then
		existe = true

		local response = Instance.new("TextBox")
		response.Name = "response"
		response.Text = ""
		response.PlaceholderText = "Coloque a velocidade aqui (normal: " .. normalspeed .. ")"
		response.TextScaled = true
		response.BackgroundColor3 = Color3.fromRGB(26, 70, 13)
		response.TextColor3 = Color3.fromRGB(255, 255, 255)
		response.Size = sizebtns
		response.Parent = main

		responsespeed = response

		response.FocusLost:Connect(function()
			existe = false

			if response.Text == "n" then
				response.Text = normalspeed
			end
			local speed = tonumber(response.Text)
			if speed then
				hum.WalkSpeed = speed
			end

			response:Destroy()
		end)
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

	if puxarmira then
		puxarbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		puxarbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		puxarbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		puxarbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

esconderbtn.MouseButton1Click:Connect(function()
	aimbot = false
	esp = false
	fly = false
	cantp = false
	spamrem = false
	scriptsoff = false
	puxarmira = false

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
	end)
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

task.spawn(function()
	task.wait(5)
	_CARREGAMENTO__:Destroy()
end)
