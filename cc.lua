-- Ninja Legends OP GUI
-- Credits to k00dkidd
-- Make sure to read the usage

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local gui2 = Instance.new("ScreenGui")
gui2.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
gui2.ResetOnSpawn = false

-- Main Frame for GUI 2
local gui2Frame = Instance.new("Frame")
gui2Frame.Size = UDim2.new(0, 280, 0, 350)
gui2Frame.Position = UDim2.new(0.05, 0, 0.05, 0)
gui2Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
gui2Frame.BackgroundTransparency = 0.15
gui2Frame.Active = true
gui2Frame.Draggable = true
gui2Frame.Parent = gui2

local gui2Corner = Instance.new("UICorner")
gui2Corner.CornerRadius = UDim.new(0, 15)
gui2Corner.Parent = gui2Frame

local gui2Gradient = Instance.new("UIGradient")
gui2Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 15))
}
gui2Gradient.Parent = gui2Frame

local gui2Stroke = Instance.new("UIStroke")
gui2Stroke.Color = Color3.fromRGB(150, 100, 255)
gui2Stroke.Thickness = 2.5
gui2Stroke.Parent = gui2Frame

-- Title
local gui2Title = Instance.new("TextLabel")
gui2Title.Size = UDim2.new(1, 0, 0, 50)
gui2Title.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
gui2Title.BackgroundTransparency = 0.3
gui2Title.Text = "Ninja Legends OP GUI"
gui2Title.TextColor3 = Color3.fromRGB(150, 100, 255)
gui2Title.TextSize = 18
gui2Title.Font = Enum.Font.GothamSemibold
gui2Title.Parent = gui2Frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = gui2Title

-- Welcome Notification
local function showWelcome()
    local welcome = Instance.new("TextLabel")
    welcome.Size = UDim2.new(0, 400, 0, 70)
    welcome.Position = UDim2.new(0.5, -200, 0.3, 0)
    welcome.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    welcome.BackgroundTransparency = 0.3
    welcome.Text = "Welcome to Ninja Legends OP GUI by k00dkidd!"
    welcome.TextColor3 = Color3.fromRGB(150, 100, 255)
    welcome.TextSize = 16
    welcome.Font = Enum.Font.GothamSemibold
    welcome.TextTransparency = 1
    welcome.Parent = gui2

    local welcomeCorner = Instance.new("UICorner")
    welcomeCorner.CornerRadius = UDim.new(0, 12)
    welcomeCorner.Parent = welcome

    local welcomeStroke = Instance.new("UIStroke")
    welcomeStroke.Color = Color3.fromRGB(150, 100, 255)
    welcomeStroke.Thickness = 1.5
    welcomeStroke.Parent = welcome

    local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
    local scaleInfo = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local uiScale = Instance.new("UIScale")
    uiScale.Scale = 0.8
    uiScale.Parent = welcome
    TweenService:Create(welcome, tweenInfo, {TextTransparency = 0, BackgroundTransparency = 0.1}):Play()
    TweenService:Create(uiScale, tweenInfo, {Scale = 1}):Play()
    TweenService:Create(welcomeStroke, scaleInfo, {Thickness = 2.5}):Play()
    wait(4)
    TweenService:Create(welcome, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
    TweenService:Create(uiScale, tweenInfo, {Scale = 0.8}):Play()
    wait(0.8)
    welcome:Destroy()
end

-- Button Hover and Click Effects
local function applyButtonEffects(button)
    local uiScale = Instance.new("UIScale")
    uiScale.Parent = button
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(150, 100, 255)
    stroke.Thickness = 1.5
    stroke.Parent = button
    button.MouseEnter:Connect(function()
        TweenService:Create(uiScale, TweenInfo.new(0.2), {Scale = 1.05}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(200, 150, 255)}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(uiScale, TweenInfo.new(0.2), {Scale = 1}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(150, 100, 255)}):Play()
    end)
    button.MouseButton1Down:Connect(function()
        TweenService:Create(uiScale, TweenInfo.new(0.1), {Scale = 0.95}):Play()
    end)
    button.MouseButton1Up:Connect(function()
        TweenService:Create(uiScale, TweenInfo.new(0.1), {Scale = 1}):Play()
    end)
end

-- Button Container with Grid Layout
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(1, -20, 1, -60)
buttonContainer.Position = UDim2.new(0, 10, 0, 50)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = gui2Frame

local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0, 240, 0, 40)
gridLayout.CellPadding = UDim2.new(0, 0, 0, 10)
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.Parent = buttonContainer

-- Toggle Master Elements GUI Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 240, 0, 40)
toggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
toggleButton.Text = "Master Elements"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 14
toggleButton.Font = Enum.Font.GothamSemibold
toggleButton.Parent = buttonContainer
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 10)
toggleCorner.Parent = toggleButton
local toggleGradient = Instance.new("UIGradient")
toggleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 30))
}
toggleGradient.Parent = toggleButton
applyButtonEffects(toggleButton)

-- Start Button
local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0, 240, 0, 40)
startButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
startButton.Text = "Start Off"
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.TextSize = 14
startButton.Font = Enum.Font.GothamSemibold
startButton.Parent = buttonContainer
local startCorner = Instance.new("UICorner")
startCorner.CornerRadius = UDim.new(0, 10)
startCorner.Parent = startButton
local startGradient = Instance.new("UIGradient")
startGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 50, 50))
}
startGradient.Parent = startButton
applyButtonEffects(startButton)

local isSpamming = false
startButton.MouseButton1Click:Connect(function()
    isSpamming = not isSpamming
    if isSpamming then
        local num = tonumber(numberEntry.Text)
        if num and num > 0 then
            num = math.clamp(num, 1, 1e50)
            startButton.Text = "Start On"
            startButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
            startGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 100)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 80))
            }
            spawn(function()
                while isSpamming do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", num)
                    wait(0.5)
                end
            end)
        else
            isSpamming = false
            numberEntry.Text = "Invalid number!"
            wait(1)
            numberEntry.Text = "Enter number"
        end
    else
        startButton.Text = "Start Off"
        startButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        startGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 50, 50))
        }
    end
end)

-- ENTRY FIELD (Number Input)
local numberEntry = Instance.new("TextBox")
numberEntry.Size = UDim2.new(0, 240, 0, 40)
numberEntry.Position = UDim2.new(0, 20, 0, 230)
numberEntry.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
numberEntry.Text = "Enter number"
numberEntry.TextColor3 = Color3.fromRGB(255, 255, 255)
numberEntry.TextSize = 14
numberEntry.Font = Enum.Font.GothamSemibold
numberEntry.ClearTextOnFocus = true
numberEntry.Parent = gui2Frame
local entryCorner = Instance.new("UICorner")
entryCorner.CornerRadius = UDim.new(0, 10)
entryCorner.Parent = numberEntry
local entryStroke = Instance.new("UIStroke")
entryStroke.Color = Color3.fromRGB(150, 100, 255)
entryStroke.Thickness = 1.5
entryStroke.Parent = numberEntry

-- SUBMIT BUTTON
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 240, 0, 40)
submitButton.Position = UDim2.new(0, 20, 0, 280)
submitButton.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.TextSize = 14
submitButton.Font = Enum.Font.GothamSemibold
submitButton.Parent = gui2Frame
local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 10)
submitCorner.Parent = submitButton
local submitGradient = Instance.new("UIGradient")
submitGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 30))
}
submitGradient.Parent = submitButton
applyButtonEffects(submitButton)

submitButton.MouseButton1Click:Connect(function()
    local num = tonumber(numberEntry.Text)
    if num and num > 0 then
        num = math.clamp(num, 1, 1e50)
        ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", num)
        numberEntry.Text = "Submitted!"
        wait(1)
        numberEntry.Text = "Enter number"
    else
        numberEntry.Text = "Invalid number!"
        wait(1)
        numberEntry.Text = "Enter number"
    end
end)

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(0, 240, 0, 40)
discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordButton.Text = "Join Discord"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 14
discordButton.Font = Enum.Font.GothamSemibold
discordButton.Parent = buttonContainer
local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(0, 10)
discordCorner.Parent = discordButton
local discordGradient = Instance.new("UIGradient")
discordGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 115, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 70, 200))
}
discordGradient.Parent = discordButton
applyButtonEffects(discordButton)

discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/notexttospeech")
    local notify = Instance.new("TextLabel")
    notify.Size = UDim2.new(0, 240, 0, 40)
    notify.Position = UDim2.new(0.5, -120, 0.4, 0)
    notify.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    notify.BackgroundTransparency = 0.3
    notify.Text = "Discord link copied!"
    notify.TextColor3 = Color3.fromRGB(150, 100, 255)
    notify.TextSize = 14
    notify.Font = Enum.Font.GothamSemibold
    notify.TextTransparency = 1
    notify.Parent = gui2
    local notifyCorner = Instance.new("UICorner")
    notifyCorner.CornerRadius = UDim.new(0, 10)
    notifyCorner.Parent = notify
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
    TweenService:Create(notify, tweenInfo, {TextTransparency = 0, BackgroundTransparency = 0.1}):Play()
    wait(2)
    TweenService:Create(notify, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
    wait(0.5)
    notify:Destroy()
end)

-- Master Elements GUI
local masterGui = Instance.new("ScreenGui")
masterGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
masterGui.Enabled = false
masterGui.ResetOnSpawn = false

local masterFrame = Instance.new("Frame")
masterFrame.Size = UDim2.new(0, 320, 0, 500)
masterFrame.Position = UDim2.new(02, 0, 0.2, 0)
masterFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
masterFrame.BackgroundTransparency = 0.15
masterFrame.Active = true
masterFrame.Draggable = true
masterFrame.Parent = masterGui

local masterCorner = Instance.new("UICorner")
masterCorner.CornerRadius = UDim.new(0, 15)
masterCorner.Parent = masterFrame

local masterGradient = Instance.new("UIGradient")
masterGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 15))
}
masterGradient.Parent = masterFrame

local masterStroke = Instance.new("UIStroke")
masterStroke.Color = Color3.fromRGB(150, 100, 255)
masterStroke.Thickness = 2.5
masterStroke.Parent = masterFrame

local masterTitle = Instance.new("TextLabel")
masterTitle.Size = UDim2.new(1, 0, 0, 50)
masterTitle.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
masterTitle.BackgroundTransparency = 0.3
masterTitle.Text = "Master Elements"
masterTitle.TextColor3 = Color3.fromRGB(150, 100, 255)
masterTitle.TextSize = 18
masterTitle.Font = Enum.Font.GothamSemibold
masterTitle.Parent = masterFrame
local masterTitleCorner = Instance.new("UICorner")
masterTitleCorner.CornerRadius = UDim.new(0, 15)
masterTitleCorner.Parent = masterTitle

-- Container for Buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -60)
scrollFrame.Position = UDim2.new(0, 10, 0, 50)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
scrollFrame.ScrollBarThickness = 6
scrollFrame.BackgroundTransparency = 1
scrollFrame.Parent = masterFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 12)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.Parent = scrollFrame

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
    button.Size = UDim2.new(0, 280, 0, 45)
    button.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    button.Text = "Master " .. element
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.Parent = scrollFrame
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = button
    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 30))
    }
    buttonGradient.Parent = button
    applyButtonEffects(button)

    button.MouseButton1Click:Connect(function()
        ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer(element)
    end)
end

-- Update CanvasSize based on number of elements
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #elements * 57)

-- Toggle Function for Master Elements GUI
toggleButton.MouseButton1Click:Connect(function()
    masterGui.Enabled = not masterGui.Enabled
    if masterGui.Enabled then
        masterFrame.BackgroundTransparency = 1
        for _, child in ipairs(masterFrame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.BackgroundTransparency = 1
                child.TextTransparency = 1
            end
        end
        local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
        TweenService:Create(masterFrame, tweenInfo, {BackgroundTransparency = 0.15}):Play()
        for i, child in ipairs(masterFrame:GetChildren()) do
            if child:IsA("GuiObject") then
                wait(0.05 * i)
                TweenService:Create(child, tweenInfo, {BackgroundTransparency = child.Name == "TextLabel" and 0.3 or 0, TextTransparency = 0}):Play()
            end
        end
    end
end)

-- Startup Animation
gui2Frame.BackgroundTransparency = 1
gui2Frame.Rotation = -5
for _, child in ipairs(gui2Frame:GetChildren()) do
    if child:IsA("GuiObject") then
        child.BackgroundTransparency = 1
        child.TextTransparency = 1
    end
end
local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
TweenService:Create(gui2Frame, tweenInfo, {BackgroundTransparency = 0.15, Rotation = 0}):Play()
for i, child in ipairs(buttonContainer:GetChildren()) do
    if child:IsA("GuiObject") then
        wait(0.1 * i)
        TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    end
end
TweenService:Create(numberEntry, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(submitButton, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(gui2Title, tweenInfo, {BackgroundTransparency = 0.3, TextTransparency = 0}):Play()

-- Show Welcome Notification
showWelcome()