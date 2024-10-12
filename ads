-- Gui to Lua
-- Version: 3.2

-- Instances:

local ToggleSwitch = Instance.new("ScreenGui")
local OpenButton = Instance.new("TextButton")

--Properties:

ToggleSwitch.Name = "ToggleSwitch"
ToggleSwitch.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ToggleSwitch.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OpenButton.Name = "OpenButton"
OpenButton.Parent = ToggleSwitch
OpenButton.BackgroundColor3 = Color3.fromRGB(255, 116, 116)
OpenButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
OpenButton.BorderSizePixel = 2
OpenButton.Position = UDim2.new(0.0411311053, 0, 0.536981404, 0)
OpenButton.Size = UDim2.new(0, 75, 0, 75)
OpenButton.Font = Enum.Font.SourceSans
OpenButton.Text = "Close"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.TextSize = 30.000

-- Scripts:

local function IIBYPFA_fake_script() -- OpenButton.LocalScript 
	local script = Instance.new('LocalScript', OpenButton)

	-- Ensure the LocalScript is a child of a TextLabel
	local Button = script.Parent
	Button.Text = "Close" -- Initial text
	
	local isOpen = false -- Variable to keep track of the state
	local mouseTolerance = 15 -- Tolerance for mouse movement (in pixels)
	
	local UserInputService = game:GetService("UserInputService") -- Get UserInputService
	local initialMousePosition -- Variable to store initial mouse position
	
	-- Function to toggle the text when the mouse button is released
	local function toggleText()
		-- Toggle the isOpen state
		isOpen = not isOpen
	
		-- Update the TextLabel based on the state
		if isOpen then
			Button.Text = "Open"
		else
			Button.Text = "Close"
		end
	
		-- Send the key event for "F6"
		game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F6, false, game)
	end
	
	-- Connect to the Button's MouseButton1Down event
	Button.MouseButton1Down:Connect(function()
		initialMousePosition = UserInputService:GetMouseLocation() -- Store the initial mouse position
	end)
	
	-- Connect to the Button's MouseButton1Up event
	Button.MouseButton1Up:Connect(function()
		local mousePosition = UserInputService:GetMouseLocation() -- Get the current mouse position
	
		if initialMousePosition then
			-- Calculate the distance moved from the initial position
			local distanceMoved = (initialMousePosition - mousePosition).magnitude
	
			-- Check if the distance moved is within the tolerance range
			if distanceMoved <= mouseTolerance then
				toggleText() -- Call toggleText when released within tolerance
			end
	
			-- Reset initialMousePosition
			initialMousePosition = nil
		end
	end)
	
	-- Enable dragging on the button
	Button.Draggable = true
	Button.Selectable = true
	Button.Active = true
	
end
coroutine.wrap(IIBYPFA_fake_script)()
