local UserInputService = game:GetService("UserInputService")
-- local KeyCode = "RightControl"
local OpenKey = Enum.KeyCode.RightControl
local runService = (game:GetService("RunService"));
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local DisplayDebounce = false
local CtrlDebounce = false
local SCgui = Instance.new("ScreenGui")
SCgui.Parent = LocalPlayer.PlayerGui
local gui = Instance.new("Frame")
gui.Visible = false
gui.Parent = SCgui
gui.BorderSizePixel = 2
gui.BorderColor3 = Color3.new(0, 1, 1)
gui:TweenSize(
	UDim2.new(0.6,0,0,0), 
	Enum.EasingDirection.In,   
	Enum.EasingStyle.Sine,      
	1,                          
	true
)
gui:TweenSize(
	UDim2.new(0.6,0,0.5,0), 
	Enum.EasingDirection.In,   
	Enum.EasingStyle.Sine,      
	1,                          
	true                
)
local GuiCorner = Instance.new("UICorner")
GuiCorner.Parent = gui
GuiCorner.CornerRadius = UDim.new(0,16)

local TitleFrame = Instance.new("Frame")
TitleFrame.Parent = gui
TitleFrame.BackgroundColor3 = Color3.new(0,0,0)
TitleFrame.BorderSizePixel = 0
TitleFrame.Size = UDim2.new(1,0,0.005,0)
TitleFrame.Position = UDim2.new(0,0,0.1,0)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = gui
TitleText.Size = UDim2.new(0.2,0,0.1,0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "MintHub"
TitleText.Font = "FredokaOne"
TitleText.TextColor3 = Color3.new(0.313725, 0.992157, 1)
TitleText.TextScaled = true
TitleText.Position = UDim2.new(0.4,0,0,0)
TitleText.TextStrokeTransparency = 0
TitleText.TextStrokeColor3 = Color3.new(1, 1, 1)
function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end

	

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = gui
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(0,0,0,0)
CloseButton.Size = UDim2.new(1,0,0.1,0)
CloseButton.Text = ""

local MenuButton = Instance.new("TextButton")
MenuButton.Parent = gui
MenuButton.BackgroundTransparency = 1
MenuButton.Text = "..."
MenuButton.Font = "FredokaOne"
MenuButton.TextColor3 = Color3.new(1, 1, 1)
MenuButton.TextScaled = true
MenuButton.Size = UDim2.new(0.1,0,0.1,0)
MenuButton.Position = UDim2.new(0,0,0,0)

--local KeyBindButton = Instance.new("TextButton")
--KeyBindButton.Parent = gui
--KeyBindButton.BackgroundColor3 = Color3.new(0,0,0)
--KeyBindButton.Text = "Change KeyBind... Current Keybind: "..KeyCode
--KeyBindButton.Font = "FredokaOne"
--KeyBindButton.TextColor3 = Color3.new(1,1,1)
--KeyBindButton.TextScaled = true
--KeyBindButton.Size = UDim2.new(0.2,0,0.1,0)
--KeyBindButton.Position = UDim2.new(0.8,0,0.9,0)
--local function ChangeKeyBind()
	--	KeyBindButton.Text = "Waiting for Input..."
		--UserInputService.InputBegan:Connect(function(input)  ---- Coming Soon
			--local KeyPressed = input.KeyCode.Name
			--print(KeyPressed)
			--KeyCode = KeyPressed
		--KeyBindButton.TextScaled = "Change KeyBind... Current Keybind: "..KeyCode
		--end)
--end
-- KeyBindButton.MouseButton1Click:Connect(ChangeKeyBind)
local Menu = Instance.new("Frame")
Menu.Parent = gui
Menu.BackgroundColor3 = Color3.new(0.333333, 1, 0.498039)
Menu.Size = UDim2.new(0.25,0,1,0)
Menu.Visible = false
local MenuCorner = Instance.new("UICorner")
MenuCorner.Parent = Menu
MenuCorner.CornerRadius = UDim.new(0,16)
local function Displaying()
	if DisplayDebounce == false then
		CloseButton.Position = UDim2.new(0, 0,0, 0)
		CloseButton.Size = UDim2.new(1, 0,0.5, 0)
		CloseButton.Text = ""
		gui.Size = UDim2.new(0.6,0,0.02,0)
		DisplayDebounce = true
		TitleText.Visible = false
		MenuButton.Visible = false
	else
		CloseButton.Position = UDim2.new(0,0,0,0)
		CloseButton.Size = UDim2.new(1,0,0.1,0)
		CloseButton.Text = ""
		gui.Size = UDim2.new(0.6,0,0.5,0)
		DisplayDebounce = false
		TitleText.Visible = true
		MenuButton.Visible = true
	end
end


local function CtrlImput(input)
	if input.KeyCode == OpenKey then
		if CtrlDebounce == false then
			gui.Visible = true
			CtrlDebounce = true
		else
			gui.Visible = false
			CtrlDebounce = false
		end
	end
end
UserInputService.InputBegan:Connect(CtrlImput)
CloseButton.MouseButton1Click:Connect(Displaying)

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
	return a + (b - a) * m
end;

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (32); -- // The speed of the UI darg.
function Update(dt)
	if not (startPos) then return end;
	if not (dragging) and (lastGoalPos) then
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
		return 
	end;

	local delta = (lastMousePos - UserInputService:GetMouseLocation())
	local xGoal = (startPos.X.Offset - delta.X);
	local yGoal = (startPos.Y.Offset - delta.Y);
	lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
	gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
end;

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		lastMousePos = UserInputService:GetMouseLocation()

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

runService.Heartbeat:Connect(Update)
while true do
	counter = 0

	while wait(0.2)do
		TitleText.TextStrokeColor3 = Color3.fromHSV(zigzag(counter),1,1)

		counter = counter + 0.01
	end
end
