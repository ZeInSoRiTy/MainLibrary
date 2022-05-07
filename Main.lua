local UserInputService = game:GetService("UserInputService")
--local KeyCode = "RightControl"
local OpenKey = Enum.KeyCode.RightControl
local runService = (game:GetService("RunService"));
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local DisplayDebounce = false
local CtrlDebounce = false
local MenuDebounce = false
local ABDebounce = false
local ABEnabledCMDebounce = false
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
MenuButton.ZIndex = 2
--[[
local KeyBindButton = Instance.new("TextButton")
KeyBindButton.Parent = gui
KeyBindButton.BackgroundColor3 = Color3.new(0,0,0)
KeyBindButton.Text = "Change KeyBind... Current Keybind: "..KeyCode
KeyBindButton.Font = "FredokaOne"
KeyBindButton.TextColor3 = Color3.new(1,1,1)
KeyBindButton.TextScaled = true
KeyBindButton.Size = UDim2.new(0.2,0,0.1,0)
KeyBindButton.Position = UDim2.new(0.8,0,0.9,0)
local function ChangeKeyBind()
		KeyBindButton.Text = "Waiting for Input..."
		UserInputService.InputBegan:Connect(function(input)  ---- Coming Soon
			local KeyPressed = input.KeyCode.Name
			print(KeyPressed)
			KeyCode = KeyPressed
		KeyBindButton.TextScaled = "Change KeyBind... Current Keybind: "..KeyCode
		end)
end

KeyBindButton.MouseButton1Click:Connect(ChangeKeyBind)
--]]
local Menu = Instance.new("Frame")
Menu.Parent = gui
Menu.BackgroundColor3 = Color3.new(0.333333, 1, 0.498039)
Menu.Size = UDim2.new(0,0,1,0)
Menu.BorderSizePixel = 0
local MenuCorner = Instance.new("UICorner")
MenuCorner.Parent = Menu
MenuCorner.CornerRadius = UDim.new(0,16)

local ABButton = Instance.new("TextButton")
ABButton.Parent = Menu
ABButton.BackgroundColor3 = Color3.new(0.333333, 1, 0.498039)
ABButton.BorderSizePixel = 2
ABButton.BorderColor3 = Color3.new(0, 0, 0)
ABButton.Text = "AimBot"
ABButton.Font = "FredokaOne"
ABButton.TextColor3 = Color3.new(1, 0, 0.0156863)
ABButton.TextScaled = true
ABButton.Size = UDim2.new(1,0,0.1,0)
ABButton.Position = UDim2.new(0,0,0.1,0)

local ABFrame = Instance.new("Frame")
ABFrame.Parent = gui
ABFrame.Visible = false
ABFrame.BackgroundColor3 = Color3.new(0,0,0)
ABFrame.Size = UDim2.new(0.75,0,0.9,0)
ABFrame.Position = UDim2.new(0.25,0,0.1,0)

local ABTitle = Instance.new("TextLabel")
ABTitle.Parent = ABFrame
ABTitle.BackgroundTransparency = true
ABTitle.BorderSizePixel = 0
ABTitle.Text = "AimBot"
ABTitle.Font = "FredokaOne"
ABTitle.TextColor3 = Color3.new(0.666667, 0, 0)
ABTitle.TextScaled = true
ABTitle.Size = UDim2.new(1,0,0.1,0)

local EnabledCheckMark = Instance.new("ImageButton")
EnabledCheckMark.Parent = ABFrame
EnabledCheckMark.SizeConstraint = "RelativeXX"
EnabledCheckMark.Size = UDim2.new(0.05,0,0.05,0)
EnabledCheckMark.Position = UDim2.new(0.1,0,0.15,0)
EnabledCheckMark.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
EnabledCheckMark.BackgroundColor3 = Color3.new(0.184314, 0.184314, 0.184314)


local EnabledCMLabel = Instance.new("TextLabel")
EnabledCMLabel.Parent = ABFrame
EnabledCMLabel.BackgroundTransparency = 1
EnabledCMLabel.Size = UDim2.new(0.2,0,0.05,0)
EnabledCMLabel.Position = UDim2.new(0.175,0,0.14,0)
EnabledCMLabel.Text = "Enabled"
EnabledCMLabel.Font = "FredokaOne"
EnabledCMLabel.TextScaled = true
EnabledCMLabel.TextColor3 = Color3.new(1, 1, 1)

local function ABEnabledCM()
	if ABEnabledCMDebounce == false then
		EnabledCheckMark.BorderColor3= Color3.new(0, 0, 0.498039)
		EnabledCheckMark.BackgroundColor3 = Color3.new(0, 0, 1)
		ABEnabledCMDebounce = true
			loadstring(game:HttpGet("https://raw.githubusercontent.com/mitka1337/Universal-roblox-aimbot-fullmaster/main/aim_master.lua", true))()
	else
		EnabledCheckMark.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
		EnabledCheckMark.BackgroundColor3 = Color3.new(0.184314, 0.184314, 0.184314)
		ABEnabledCMDebounce = false	
	end
end
local function ABDisplaying()
	if ABDebounce == false then
		ABFrame.Visible = true
		ABDebounce = true
	else
		ABFrame.Visible = false
		ABDebounce = false
	end
end
local function MenuDisplaying()
	if MenuDebounce == false then
		Menu:TweenSize(
			UDim2.new(0.25,0,1,0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Sine,
			1,
			true
		)
		MenuDebounce = true

	else
		Menu:TweenSize(
			UDim2.new(0,0,1,0),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Sine,
			1,
			true
		)
		MenuDebounce = false
		ABFrame.Visible = false
	end
end
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
	--if KeyCode == "RightControl" then

	--else

	--	OpenKey = KeyCode
	--end
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
MenuButton.MouseButton1Click:Connect(MenuDisplaying)
ABButton.MouseButton1Click:Connect(ABDisplaying)
EnabledCheckMark.MouseButton1Click:Connect(ABEnabledCM)
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
