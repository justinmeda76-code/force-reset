-- Create the ScreenGui container (keeps it active across deaths)
local player = game:GetService("Players").LocalPlayer
local sgui = Instance.new("ScreenGui")
sgui.Name = "CustomResetGui"
sgui.ResetOnSpawn = false  -- This keeps the button from deleting itself when you die
sgui.Parent = player:WaitForChild("PlayerGui")

-- Create the Reset Button
local button = Instance.new("TextButton")
button.Name = "ResetButton"
button.Size = UDim2.new(0, 100, 0, 40)
button.Position = UDim2.new(0.02, 0, 0.4, 0) -- Places it on the left side of your screen
button.BackgroundColor3 = Color3.fromRGB(200, 50, 50) -- Dark Red
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "RESET"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.Parent = sgui

-- Add rounded corners to make it look clean
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = button

-- The Reset Action Function
button.MouseButton1Click:Connect(function()
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0 -- Bypasses the disabled menu button entirely
        end
    end
end)
