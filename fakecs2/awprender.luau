local module = {}

local camera = workspace.CurrentCamera
local awp = game:GetObjects("rbxassetid://139991606966378")[1]

local awpLoaded = false
local renderLoop = nil

local offset = Vector3.new(1, -1, -1.5)
local shootCFOffset = CFrame.new(0, 0, 0.4) * CFrame.fromOrientation(math.rad(40), 0, 0)

local shootAnim = nil
local shootEndSignal = nil
local offset2 = Instance.new("CFrameValue")

local RunService = game:GetService("RunService")

function module.init()
	if not awpLoaded then
		awp.Parent = camera
		renderLoop = RunService.RenderStepped:Connect(function()
			local pos = camera.CFrame * CFrame.new(offset) * offset2.Value
			awp:PivotTo(pos)
		end)
		
		awpLoaded = true
	else
		warn("Awp render already loaded")
	end
end

function module.setOffset(v: Vector3)
	offset = v
end

function module.setShootOffset(v: CFrame)
	shootCFOffset = v
end

function module.shoot()
	if awpLoaded then
		if shootAnim and shootEndSignal then
			shootEndSignal:Disconnect()
			shootAnim:Cancel()
			shootAnim:Destroy()
		end
		offset2.Value = CFrame.new(0, 0, 0.4) * CFrame.fromOrientation(math.rad(40), 0, 0)
		shootAnim = game:GetService("TweenService"):Create(offset2, TweenInfo.new(
			0.8,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
			), {
				Value = CFrame.new() * CFrame.fromOrientation(0, 0, 0)
			})
		shootAnim:Play()
		shootEndSignal = shootAnim.Completed:Once(function()
			shootAnim:Destroy()
		end)
	else
		warn("Shoot anim closed; awp not loaded")
	end
end

function module.setTransparency(val: number)
	if awpLoaded then
		for _,v in awp:GetChildren() do
			if v:IsA("BasePart") and v.Name ~= "Handle" then
				v.Transparency = val
			end
		end
	else
		warn("Set transparency closed; awp not loaded")
	end
end

function module.destroy()
	if awpLoaded then
		awp.Parent = nil
		if renderLoop then renderLoop:Disconnect() end
		
		awpLoaded = false
	else
		warn("Awp render not loaded or already destroyed")
	end
end

return module
