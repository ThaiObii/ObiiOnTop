-- Ninja Legends OP GUI
-- Credits to k00dkidd
-- Usage: Enter a number for Gems or Chi, then click the respective Submit button to convert. Toggle Master Elements to access element mastery.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Main GUI
local gui2 = Instance.new("ScreenGui")
gui2.Parent = PlayerGui
gui2.Name = "NinjaLegendsGUI"

-- Main Frame
local gui2Frame = Instance.new("Frame")
gui2Frame.Size = UDim2.new(0, 180, 0, 190) -- Adjusted height (removed Start button)
gui2Frame.Position = UDim2.new(0.05, 0, 0.05, 0)
gui2Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
gui2Frame.Active = true
gui2Frame.Draggable = true
gui2Frame.Parent = gui2

-- Title
local gui2Title = Instance.new("TextLabel")
gui2Title.Size = UDim2.new(1, 0, 0, 18)
gui2Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
gui2Title.Text = "Ninja Legends OP GUI"
gui2Title.TextColor3 = Color3.fromRGB(255, 255, 255)
gui2Title.TextSize = 10
gui2Title.Parent = gui2Frame

-- Toggle Master Elements Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -10, 0, 20)
toggleButton.Position = UDim2.new(0, 5, 0, 30)
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleButton.Text = "Toggle Master Elements"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 10
toggleButton.Parent = gui2Frame

-- Gems Input Field
local gemsEntry = Instance.new("TextBox")
gemsEntry.Size = UDim2.new(1, -20, 0, 25)
gemsEntry.Position = UDim2.new(0, 10, 0, 55)
gemsEntry.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
gemsEntry.Text = "Enter Gems amount"
gemsEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
gemsEntry.TextSize = 10
gemsEntry.ClearTextOnFocus = true
gemsEntry.Parent = gui2Frame

-- Gems Submit Button
local gemsSubmitButton = Instance.new("TextButton")
gemsSubmitButton.Size = UDim2.new(1, -20, 0, 25)
gemsSubmitButton.Position = UDim2.new(0, 10, 0, 85)
gemsSubmitButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
gemsSubmitButton.Text = "Submit Gems"
gemsSubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gemsSubmitButton.TextSize = 10
gemsSubmitButton.Parent = gui2Frame

-- Chi Input Field
local chiEntry = Instance.new("TextBox")
chiEntry.Size = UDim2.new(1, -20, 0, 25)
chiEntry.Position = UDim2.new(0, 10, 0, 115)
chiEntry.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
chiEntry.Text = "Enter Chi amount"
chiEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
chiEntry.TextSize = 10
chiEntry.ClearTextOnFocus = true
chiEntry.Parent = gui2Frame

-- Chi Submit Button
local chiSubmitButton = Instance.new("TextButton")
chiSubmitButton.Size = UDim2.new(1, -20, 0, 25)
chiSubmitButton.Position = UDim2.new(0, 10, 0, 145)
chiSubmitButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
chiSubmitButton.Text = "Submit Chi"
chiSubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
chiSubmitButton.TextSize = 10
chiSubmitButton.Parent = gui2Frame

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(1, -10, 0, 20)
discordButton.Position = UDim2.new(0, 5, 0, 175)
discordButton.BackgroundColor3 = Color3.fromRGB(60, 60, 200)
discordButton.Text = "Join Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 10
discordButton.Parent = gui2Frame
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/notexttospeech")
end)

-- Submit Functionality for Gems
gemsSubmitButton.MouseButton1Click:Connect(function()
    local num = tonumber(gemsEntry.Text)
    if num and num > 0 and num <= 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 then
        local success, err = pcall(function()
            -- Try primary event
            ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", math.floor(num))
            -- Fallback event
            if ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("gamePassEvent") then
                ReplicatedStorage.rEvents.gamePassEvent:FireServer("addCurrency", "Gems", math.floor(num))
            end
        end)
        if success then
            gemsEntry.Text = "Gems Success!"
            wait(1)
            gemsEntry.Text = "Enter Gems amount"
        else
            gemsEntry.Text = "Error: Check console!"
            warn("Gems conversion failed: " .. tostring(err))
            wait(1)
            gemsEntry.Text = "Enter Gems amount"
        end
    else
        gemsEntry.Text = "Invalid Gems!"
        wait(1)
        gemsEntry.Text = "Enter Gems amount"
    end
end)

-- Submit Functionality for Chi
chiSubmitButton.MouseButton1Click:Connect(function()
    local num = tonumber(chiEntry.Text)
    if num and num > 0 and num <= 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 then
        local success, err = pcall(function()
            -- Try primary event
            ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("addChi", math.floor(num))
            -- Fallback event
            if ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("chiEvent") then
                ReplicatedStorage.rEvents.chiEvent:FireServer("addChi", math.floor(num))
            end
        end)
        if success then
            chiEntry.Text = "Chi Success!"
            wait(1)
            chiEntry.Text = "Enter Chi amount"
        else
            chiEntry.Text = "Error: Check console!"
            warn("Chi conversion failed: " .. tostring(err))
            wait(1)
            chiEntry.Text = "Enter Chi amount"
        end
    else
        chiEntry.Text = "Invalid Chi!"
        wait(1)
        chiEntry.Text = "Enter Chi amount"
    end
end)

-- Master Elements GUI
local masterGui = Instance.new("ScreenGui")
masterGui.Parent = PlayerGui
masterGui.Enabled = false
masterGui.Name = "MasterElementsGUI"

local masterFrame = Instance.new("Frame")
masterFrame.Size = UDim2.new(0, 250, 0, 400)
masterFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
masterFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
masterFrame.BackgroundTransparency = 0.5
masterFrame.Active = true
masterFrame.Draggable = true
masterFrame.Parent = masterGui

local masterTitle = Instance.new("TextLabel")
masterTitle.Size = UDim2.new(1, 0, 0, 30)
masterTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
masterTitle.Text = "Master Elements"
masterTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
masterTitle.TextSize = 14
masterTitle.Parent = masterFrame

-- Container for Buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -30)
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
scrollFrame.ScrollBarThickness = 5
scrollFrame.BackgroundTransparency = 1
scrollFrame.Parent = masterFrame

-- Elements List
local elements = {
    "Shadow Charge",
    "Electral Chaos",
    "Blazing Entity",
    "Shadowfire",
    "Lightning",
    "Masterful Wrath",
    "Inferno",
    "Eternity Storm",
    "Frost"
}

-- Create Buttons Inside Scroll Frame
for i, element in ipairs(elements) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Position = UDim2.new(0, 10, 0, (i - 1) * 35)
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.Text = "Master " .. element
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 10
    button.Parent = scrollFrame
    button.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer(element)
        end)
        if not success then
            warn("Element mastery failed for " .. element .. ": " .. tostring(err))
        end
    end)
end

-- Toggle Function for Master Elements GUI
toggleButton.MouseButton1Click:Connect(function()
    masterGui.Enabled = not masterGui.Enabled
end)