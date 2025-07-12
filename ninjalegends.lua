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
gui2Frame.Size = UDim2.new(0, 200, 0, 280)
gui2Frame.Position = UDim2.new(0.05, 0, 0.05, 0)
gui2Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
gui2Frame.Active = true
gui2Frame.Draggable = true
gui2Frame.Parent = gui2

-- Add rounded corners to main frame
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 8)
frameCorner.Parent = gui2Frame

-- Title
local gui2Title = Instance.new("TextLabel")
gui2Title.Size = UDim2.new(1, 0, 0, 30)
gui2Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
gui2Title.Text = "Ninja Legends OP GUI"
gui2Title.TextColor3 = Color3.fromRGB(255, 255, 255)
gui2Title.TextSize = 14
gui2Title.Font = Enum.Font.SourceSansBold
gui2Title.Parent = gui2Frame
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = gui2Title

-- Toggle Master Elements Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 40)
toggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
toggleButton.Text = "Toggle Master Elements"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 12
toggleButton.Font = Enum.Font.SourceSans
toggleButton.Parent = gui2Frame
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

-- Gems Input Field
local gemsEntry = Instance.new("TextBox")
gemsEntry.Size = UDim2.new(1, -20, 0, 30)
gemsEntry.Position = UDim2.new(0, 10, 0, 80)
gemsEntry.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
gemsEntry.Text = "Enter Gems amount"
gemsEntry.TextColor3 = Color3.fromRGB(200, 200, 200)
gemsEntry.TextSize = 12
gemsEntry.Font = Enum.Font.SourceSans
gemsEntry.ClearTextOnFocus = true
gemsEntry.Parent = gui2Frame
local gemsEntryCorner = Instance.new("UICorner")
gemsEntryCorner.CornerRadius = UDim.new(0, 6)
gemsEntryCorner.Parent = gemsEntry

-- Gems Submit Button
local gemsSubmitButton = Instance.new("TextButton")
gemsSubmitButton.Size = UDim2.new(1, -20, 0, 30)
gemsSubmitButton.Position = UDim2.new(0, 10, 0, 115)
gemsSubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
gemsSubmitButton.Text = "Submit Gems"
gemsSubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gemsSubmitButton.TextSize = 12
gemsSubmitButton.Font = Enum.Font.SourceSansBold
gemsSubmitButton.Parent = gui2Frame
local gemsSubmitCorner = Instance.new("UICorner")
gemsSubmitCorner.CornerRadius = UDim.new(0, 6)
gemsSubmitCorner.Parent = gemsSubmitButton

-- Chi Input Field
local chiEntry = Instance.new("TextBox")
chiEntry.Size = UDim2.new(1, -20, 0, 30)
chiEntry.Position = UDim2.new(0, 10, 0, 155)
chiEntry.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
chiEntry.Text = "Enter Chi amount"
chiEntry.TextColor3 = Color3.fromRGB(200, 200, 200)
chiEntry.TextSize = 12
chiEntry.Font = Enum.Font.SourceSans
chiEntry.ClearTextOnFocus = true
chiEntry.Parent = gui2Frame
local chiEntryCorner = Instance.new("UICorner")
chiEntryCorner.CornerRadius = UDim.new(0, 6)
chiEntryCorner.Parent = chiEntry

-- Chi Submit Button
local chiSubmitButton = Instance.new("TextButton")
chiSubmitButton.Size = UDim2.new(1, -20, 0, 30)
chiSubmitButton.Position = UDim2.new(0, 10, 0, 190)
chiSubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 120)
chiSubmitButton.Text = "Submit Chi"
chiSubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
chiSubmitButton.TextSize = 12
chiSubmitButton.Font = Enum.Font.SourceSansBold
chiSubmitButton.Parent = gui2Frame
local chiSubmitCorner = Instance.new("UICorner")
chiSubmitCorner.CornerRadius = UDim.new(0, 6)
chiSubmitCorner.Parent = chiSubmitButton

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(1, -20, 0, 30)
discordButton.Position = UDim2.new(0, 10, 0, 230)
discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordButton.Text = "Join Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 12
discordButton.Font = Enum.Font.SourceSansBold
discordButton.Parent = gui2Frame
local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(0, 6)
discordCorner.Parent = discordButton

-- Submit Functionality for Gems
gemsSubmitButton.MouseButton1Click:Connect(function()
    local num = tonumber(gemsEntry.Text)
    if num and num > 0 and num <= 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 then
        local success, err = pcall(function()
            ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", math.floor(num))
        end)
        if success then
            gemsEntry.Text = "Gems Success!"
            wait(1)
            gemsEntry.Text = "Enter Gems amount"
        else
            gemsEntry.Text = "Error: Try again!"
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
            ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("addChi", math.floor(num))
        end)
        if success then
            chiEntry.Text = "Chi Success!"
            wait(1)
            chiEntry.Text = "Enter Chi amount"
        else
            chiEntry.Text = "Error: Try again!"
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

-- Discord Button Functionality
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/notexttospeech")
end)

-- Master Elements GUI
local masterGui = Instance.new("ScreenGui")
masterGui.Parent = PlayerGui
masterGui.Enabled = false
masterGui.Name = "MasterElementsGUI"

local masterFrame = Instance.new("Frame")
masterFrame.Size = UDim2.new(0, 280, 0, 420)
masterFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
masterFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
masterFrame.BackgroundTransparency = 0.3
masterFrame.Active = true
masterFrame.Draggable = true
masterFrame.Parent = masterGui
local masterFrameCorner = Instance.new("UICorner")
masterFrameCorner.CornerRadius = UDim.new(0, 8)
masterFrameCorner.Parent = masterFrame

local masterTitle = Instance.new("TextLabel")
masterTitle.Size = UDim2.new(1, 0, 0, 40)
masterTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
masterTitle.Text = "Master Elements"
masterTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
masterTitle.TextSize = 16
masterTitle.Font = Enum.Font.SourceSansBold
masterTitle.Parent = masterFrame
local masterTitleCorner = Instance.new("UICorner")
masterTitleCorner.CornerRadius = UDim.new(0, 8)
masterTitleCorner.Parent = masterTitle

-- Container for Buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -40)
scrollFrame.Position = UDim2.new(0, 0, 0, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 450)
scrollFrame.ScrollBarThickness = 6
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
    button.Size = UDim2.new(1, -20, 0, 35)
    button.Position = UDim2.new(0, 10, 0, (i - 1) * 40)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Text = "Master " .. element
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 12
    button.Font = Enum.Font.SourceSans
    button.Parent = scrollFrame
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
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