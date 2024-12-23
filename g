local player = game.Players.LocalPlayer
local maxDistance = 10000000  -- 10 million studs

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create a TextButton
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)  -- Size of the button
button.Position = UDim2.new(0.5, -100, 0.5, -25)  -- Center of the screen
button.Text = "Speed Up Carts"
button.Parent = screenGui

-- Speed Up Function
local function speedUpAllCarts()
    for _, cart in pairs(workspace:GetDescendants()) do
        if cart.Name == "Up" and cart:FindFirstChild("Click") then
            -- Check distance to the player
            local distance = (cart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance <= maxDistance then
                fireclickdetector(cart.Click)  -- Fires the click detector to speed up the cart
            end
        end
    end
    
    button.Text = "Speed Up Again"  -- Change button text after use
end

-- Connect the button click to the function
button.MouseButton1Click:Connect(speedUpAllCarts)
