-- credits to k00dkidd
-- Updated by your AI assistant with new Chi functionality and improved UI

local gui2 = Instance.new("ScreenGui")
gui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame for GUI 2
local gui2Frame = Instance.new("Frame")
gui2Frame.Size = UDim2.new(0, 200, 0, 310) -- Adjusted size for new content and better spacing
gui2Frame.Position = UDim2.new(0.05, 0, 0.05, 0)
gui2Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
gui2Frame.BorderColor3 = Color3.fromRGB(150, 150, 150)
gui2Frame.BorderSizePixel = 1
gui2Frame.Active = true
gui2Frame.Draggable = true
gui2Frame.Parent = gui2

-- Automatic Layout Manager for clean spacing
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 8)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = gui2Frame

-- Title
local gui2Title = Instance.new("TextLabel")
gui2Title.Size = UDim2.new(1, 0, 0, 25)
gui2Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
gui2Title.Text = "Ninja Legends OP GUI"
gui2Title.TextColor3 = Color3.fromRGB(255, 255, 255)
gui2Title.TextSize = 14
gui2Title.Font = Enum.Font.SourceSansBold
gui2Title.LayoutOrder = 1
gui2Title.Parent = gui2Frame

-- Toggle Master Elements GUI Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -10, 0, 22)
toggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleButton.Text = "Toggle Master Elements"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 12
toggleButton.LayoutOrder = 2
toggleButton.Parent = gui2Frame

-- Currency Header
local currencyHeader = Instance.new("TextLabel")
currencyHeader.Size = UDim2.new(1, 0, 0, 20)
currencyHeader.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
currencyHeader.Text = "--- Currency ---"
currencyHeader.TextColor3 = Color3.fromRGB(200, 200, 200)
currencyHeader.TextSize = 12
currencyHeader.LayoutOrder = 3
currencyHeader.Parent = gui2Frame

-- ENTRY FIELD for Gems
local gemsEntry = Instance.new("TextBox")
gemsEntry.Size = UDim2.new(1, -10, 0, 25)
gemsEntry.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
gemsEntry.Text = "Enter Gem Amount"
gemsEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
gemsEntry.TextSize = 12
gemsEntry.ClearTextOnFocus = true
gemsEntry.LayoutOrder = 4
gemsEntry.Parent = gui2Frame

-- SUBMIT BUTTON for Gems
local submitGemsButton = Instance.new("TextButton")
submitGemsButton.Size = UDim2.new(1, -10, 0, 25)
submitGemsButton.BackgroundColor3 = Color3.fromRGB(48, 142, 255)
submitGemsButton.Text = "Submit Gems"
submitGemsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitGemsButton.TextSize = 12
submitGemsButton.Font = Enum.Font.SourceSansBold
submitGemsButton.LayoutOrder = 5
submitGemsButton.Parent = gui2Frame

-- SUBMIT GEMS FUNCTIONALITY
submitGemsButton.MouseButton1Click:Connect(function()
    local amount = tonumber(gemsEntry.Text)
    if amount and amount > 0 then
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", amount)
        gemsEntry.Text = "Gems submitted!"
    else
        gemsEntry.Text = "Invalid Number"
    end
end)

-- ENTRY FIELD FOR CHI
local chiEntry = Instance.new("TextBox")
chiEntry.Size = UDim2.new(1, -10, 0, 25)
chiEntry.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
chiEntry.Text = "Enter Chi Amount"
chiEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
chiEntry.TextSize = 12
chiEntry.ClearTextOnFocus = true
chiEntry.LayoutOrder = 6
chiEntry.Parent = gui2Frame

-- SUBMIT BUTTON FOR CHI
local submitChiButton = Instance.new("TextButton")
submitChiButton.Size = UDim2.new(1, -10, 0, 25)
submitChiButton.BackgroundColor3 = Color3.fromRGB(22, 160, 133)
submitChiButton.Text = "Submit Chi"
submitChiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitChiButton.TextSize = 12
submitChiButton.Font = Enum.Font.SourceSansBold
submitChiButton.LayoutOrder = 7
submitChiButton.Parent = gui2Frame

-- SUBMIT CHI FUNCTIONALITY
submitChiButton.MouseButton1Click:Connect(function()
    local amount = tonumber(chiEntry.Text)
    if amount and amount > 0 then
        -- Assuming 'convertChi' is the correct argument based on the game's structure
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertChi", amount)
        chiEntry.Text = "Chi submitted!"
    else
        chiEntry.Text = "Invalid Number"
    end
end)


-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(1, -10, 0, 22)
discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordButton.Text = "Join Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 12
discordButton.LayoutOrder = 8
discordButton.Parent = gui2Frame

discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/notexttospeech") -- Copies link to clipboard
end)


-- Master Elements GUI (No changes here)
local masterGui = Instance.new("ScreenGui")
masterGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
masterGui.Enabled = false

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

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -30)
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 400) -- Allows scrolling
scrollFrame.ScrollBarThickness = 5
scrollFrame.BackgroundTransparency = 1
scrollFrame.Parent = masterFrame

local elements = {
    "Shadow Charge", "Electral Chaos", "Blazing Entity", "Shadowfire",
    "Lightning", "Masterful Wrath", "Inferno", "Eternity Storm", "Frost"
}

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
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer(element)  
    end)
end

toggleButton.MouseButton1Click:Connect(function()
    masterGui.Enabled = not masterGui.Enabled
end)