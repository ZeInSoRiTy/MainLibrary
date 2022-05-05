local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local DisplayDebounce = false
local SCgui = Instance.new("ScreenGui")
SCgui.Parent = LocalPlayer.PlayerGui
local gui = Instance.new("Frame")
gui.Parent = SCgui


gui:TweenSize(
	UDim2.new(0.4,0,0,0), 
	Enum.EasingDirection.In,   
	Enum.EasingStyle.Sine,      
	1,                          
	true
)
gui:TweenSize(
	UDim2.new(0.4,0,1,0), 
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
TitleFrame.Size = UDim2.new(1,0,0.001,0)
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
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = gui
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.Font = "FredokaOne"
CloseButton.TextColor3 = Color3.new(1, 0, 0.0156863)
CloseButton.SizeConstraint = "RelativeXX"
CloseButton.Size = UDim2.new(0.1,0,0.1,0)
CloseButton.TextScaled = true
CloseButton.Position = UDim2.new(0.935,0,-0.05,0)
local function Displaying()
	if DisplayDebounce == false then
		CloseButton.Position = UDim2.new(0.935, 0,-2.75, 0)
	CloseButton.Text = "-"
		gui.Size = UDim2.new(0.4,0,0.02,0)
		DisplayDebounce = true
	else
		CloseButton.Position = UDim2.new(0.935,0,-0.05,0)
		CloseButton.Text = "X"
		gui.Size = UDim2.new(0.4,0,1,0)
		DisplayDebounce = false
	end
end
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
