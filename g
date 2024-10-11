local player = game.Players.LocalPlayer

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create a TextButton
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)  -- Size of the button
button.Position = UDim2.new(0.5, -100, 0.5, -25)  -- Center of the screen
button.Text = "Speed Up Carts"
button.Parent = screenGui

local hasExecuted = false  -- Flag to track execution

-- Speed Up Function
local function speedUpNearbyCarts()
    if hasExecuted then return end  -- Prevent running multiple times

    for _, cart in pairs(workspace:GetDescendants()) do
        if cart.Name == "Up" and (cart.Position - player.Character.HumanoidRootPart.Position).Magnitude < 15 then
            fireclickdetector(cart.Click)  -- Fires the click detector to speed up the cart
        end
    end
    
    hasExecuted = true  -- Set the flag to true after execution
    button.Text = "Already Used"  -- Change button text after use
end

-- Connect the button click to the function
button.MouseButton1Click:Connect(speedUpNearbyCarts)
