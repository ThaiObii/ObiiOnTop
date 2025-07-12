-- Ninja Legends OP GUI
-- Credits to k00dkidd
-- Usage: Enter numbers for gems and chi in the text boxes and click Submit to convert gems and receive chi. Toggle Master Elements to access element mastery.

local gui2 = Instance.new("ScreenGui")
gui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame for GUI
local gui2Frame = Instance.new("Frame")
gui2Frame.Size = UDim2.new(0, 180, 0, 220) -- Increased height to accommodate new chi input
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

-- Toggle Master Elements GUI Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -10, 0, 20)
toggleButton.Position = UDim2.new(0, 5, 0, 30)
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleButton.Text = "Toggle Master Elements"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 10
toggleButton.Parent = gui2Frame

-- ENTRY FIELD (Gems Input)
local gemEntry = Instance.new("TextBox")
gemEntry.Size = UDim2.new(1, -20, 0, 25)
gemEntry.Position = UDim2.new(0, 10, 0, 55)
gemEntry.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
gemEntry.Text = "Enter gems"
gemEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
gemEntry.TextSize = 10
gemEntry.ClearTextOnFocus = true
gemEntry.Parent = gui2Frame

-- ENTRY FIELD (Chi Input)
local chiEntry = Instance.new("TextBox")
chiEntry.Size = UDim2.new(1, -20, 0, 25)
chiEntry.Position = UDim2.new(0, 10, 0, 85)
chiEntry.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
chiEntry.Text = "Enter chi"
chiEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
chiEntry.TextSize = 10
chiEntry.ClearTextOnFocus = true
chiEntry.Parent = gui2Frame

-- SUBMIT BUTTON
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(1, -20, 0, 25)
submitButton.Position = UDim2.new(0, 10, 0, 115)
submitButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.TextSize = 10
submitButton.Parent = gui2Frame

-- SUBMIT FUNCTIONALITY
submitButton.MouseButton1Click:Connect(function()
    local gemNum = tonumber(gemEntry.Text)
    local chiNum = tonumber(chiEntry.Text)
    
    -- Validate and process gems
    if gemNum then
        if gemNum > 0 and gemNum <= 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 then
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", gemNum)
        else
            gemEntry.Text = "Invalid gems!"
        end
    else
        gemEntry.Text = "Enter gems"
    end
    
    -- Validate and process chi
    if chiNum then
        if chiNum > 0 and chiNum <= 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 then
            local chiEvents = {"addChi", "convertCurrency", "convertChi"} -- Test multiple potential arguments
            local success = false
            for _, eventArg in pairs(chiEvents) do
                local success, err = pcall(function()
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer(eventArg, chiNum)
                end)
                if success then
                    print("Chi event succeeded with argument: " .. eventArg)
                    chiEntry.Text = "Chi added!"
                    success = true
                    break
                end
            end
            if not success then
                chiEntry.Text = "Chi failed! Check console."
                print("No chi event worked. Possible wrong argument or server rejection.")
            end
        else
            chiEntry.Text = "Invalid chi!"
        end
    else
        chiEntry.Text = "Enter chi"
    end
end)

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(1, -10, 0, 20)
discordButton.Position = UDim2.new(0, 5, 0, 145)
discordButton.BackgroundColor3 = Color3.fromRGB(60, 60, 200)
discordButton.Text = "Join Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 10
discordButton.Parent = gui2Frame
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/notexttospeech") -- Copies link to clipboard
end)

-- Master Elements GUI
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

-- Container for Buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -30)
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 400) -- Allows scrolling
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
    -- Element Mastery Event
    button.MouseButton1Click:Connect(function()
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer(element)
    end)
end

-- Toggle Function for Master Elements GUI
toggleButton.MouseButton1Click:Connect(function()
    masterGui.Enabled = not masterGui.Enabled
end)