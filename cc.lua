-- credits to k00dkidd
-- Updated by Gemini for improved UI and new features.

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Main GUI container
local mainGui = Instance.new("ScreenGui")
mainGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 390)
mainFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderColor3 = Color3.fromRGB(120, 120, 120)
mainFrame.BorderSizePixel = 1
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = mainGui

-- Title Bar
local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 28)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.Text = "Ninja Legends GUI"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Font = Enum.Font.SourceSansBold
titleBar.TextSize = 14
titleBar.Parent = mainFrame

-- Gem Management Section
local gemFrame = Instance.new("Frame")
gemFrame.Size = UDim2.new(1, -20, 0, 95)
gemFrame.Position = UDim2.new(0, 10, 0, 40)
gemFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
gemFrame.BorderSizePixel = 0
gemFrame.Parent = mainFrame

local gemTitle = Instance.new("TextLabel")
gemTitle.Size = UDim2.new(1, 0, 0, 20)
gemTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
gemTitle.Text = "Gem Management"
gemTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
gemTitle.Font = Enum.Font.SourceSans
gemTitle.TextSize = 12
gemTitle.Parent = gemFrame

local gemsEntry = Instance.new("TextBox")
gemsEntry.Size = UDim2.new(1, -10, 0, 25)
gemsEntry.Position = UDim2.new(0, 5, 0, 25)
gemsEntry.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
gemsEntry.Text = "Enter Gem Amount"
gemsEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
gemsEntry.Font = Enum.Font.SourceSans
gemsEntry.TextSize = 12
gemsEntry.ClearTextOnFocus = true
gemsEntry.Parent = gemFrame

local submitGemsButton = Instance.new("TextButton")
submitGemsButton.Size = UDim2.new(1, -10, 0, 30)
submitGemsButton.Position = UDim2.new(0, 5, 0, 60)
submitGemsButton.BackgroundColor3 = Color3.fromRGB(48, 142, 255)
submitGemsButton.Text = "Submit Gems"
submitGemsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitGemsButton.Font = Enum.Font.SourceSansBold
submitGemsButton.TextSize = 14
submitGemsButton.Parent = gemFrame

-- Chi Management Section (NEW)
local chiFrame = Instance.new("Frame")
chiFrame.Size = UDim2.new(1, -20, 0, 95)
chiFrame.Position = UDim2.new(0, 10, 0, 145)
chiFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
chiFrame.BorderSizePixel = 0
chiFrame.Parent = mainFrame

local chiTitle = Instance.new("TextLabel")
chiTitle.Size = UDim2.new(1, 0, 0, 20)
chiTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
chiTitle.Text = "Chi Management"
chiTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
chiTitle.Font = Enum.Font.SourceSans
chiTitle.TextSize = 12
chiTitle.Parent = chiFrame

local chiEntry = Instance.new("TextBox")
chiEntry.Size = UDim2.new(1, -10, 0, 25)
chiEntry.Position = UDim2.new(0, 5, 0, 25)
chiEntry.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
chiEntry.Text = "Enter Chi Amount"
chiEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
chiEntry.Font = Enum.Font.SourceSans
chiEntry.TextSize = 12
chiEntry.ClearTextOnFocus = true
chiEntry.Parent = chiFrame

local submitChiButton = Instance.new("TextButton")
submitChiButton.Size = UDim2.new(1, -10, 0, 30)
submitChiButton.Position = UDim2.new(0, 5, 0, 60)
submitChiButton.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
submitChiButton.Text = "Submit Chi"
submitChiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitChiButton.Font = Enum.Font.SourceSansBold
submitChiButton.TextSize = 14
submitChiButton.Parent = chiFrame

-- Other Buttons
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 250)
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleButton.Text = "Toggle Master Elements"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansSemibold
toggleButton.TextSize = 14
toggleButton.Parent = mainFrame

local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(1, -20, 0, 30)
discordButton.Position = UDim2.new(0, 10, 0, 285)
discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordButton.Text = "Join Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.Font = Enum.Font.SourceSansSemibold
discordButton.TextSize = 14
discordButton.Parent = mainFrame

-- Functionality
submitGemsButton.MouseButton1Click:Connect(function()
    local amount = tonumber(gemsEntry.Text)
    if amount then -- Checks if it is a number
        -- Note: This event may be patched. The original exploit used a large *negative* number.
        -- If positive numbers don't work, try -999999999
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", amount)
    else
        gemsEntry.Text = "Invalid Number"
    end
end)

submitChiButton.MouseButton1Click:Connect(function()
    local amount = tonumber(chiEntry.Text)
    if amount and amount > 0 then
        -- NOTE: The event for selling/getting Chi is often 'sellChakra'. This might need to be adjusted if the game uses a different name.
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("mainEvent"):FireServer("sellChakra", amount)
    else
        chiEntry.Text = "Invalid Number"
    end
end)

discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/notexttospeech")
end)

-- Master Elements GUI (unchanged, but linked to new toggle button)
local masterGui = Instance.new("ScreenGui")
masterGui.Parent = playerGui
masterGui.Enabled = false

-- (The rest of the Master Elements GUI code remains exactly the same as your provided script)
-- ... [The entire code for masterFrame, masterTitle, scrollFrame, and the 'for' loop creating element buttons goes here]
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
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
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
    button.TextSize = 12
    button.Font = Enum.Font.SourceSans
    button.Parent = scrollFrame

    button.MouseButton1Click:Connect(function()  
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer(element)  
    end)
end
-- End of Master Elements GUI code

toggleButton.MouseButton1Click:Connect(function()
    masterGui.Enabled = not masterGui.Enabled
end)