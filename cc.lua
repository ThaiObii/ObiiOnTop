-- Ninja Legends OP GUI
-- Credits to k00dkidd
-- Make sure to read the usage

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Function to display error notifications
local function showError(message)
    local errorLabel = Instance.new("TextLabel")
    errorLabel.Size = UDim2.new(0, 300, 0, 50)
    errorLabel.Position = UDim2.new(0.5, -150, 0.4, 0)
    errorLabel.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    errorLabel.BackgroundTransparency = 0.3
    errorLabel.Text = "Error: " .. message
    errorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    errorLabel.TextSize = 14
    errorLabel.Font = Enum.Font.GothamBlack
    errorLabel.TextTransparency = 1
    errorLabel.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = errorLabel
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    TweenService:Create(errorLabel, tweenInfo, {TextTransparency = 0, BackgroundTransparency = 0.1}):Play()
    wait(5)
    TweenService:Create(errorLabel, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
    wait(0.5)
    errorLabel:Destroy()
    print("Error: " .. message) -- Debug print for executor console
end

-- Function to show loading indicator
local function showLoading()
    local loading = Instance.new("TextLabel")
    loading.Size = UDim2.new(0, 200, 0, 40)
    loading.Position = UDim2.new(0.5, -100, 0.5, -20)
    loading.BackgroundColor3 = Color3.fromRGB(0, 40, 60)
    loading.BackgroundTransparency = 0.3
    loading.Text = "Loading GUI..."
    loading.TextColor3 = Color3.fromRGB(0, 150, 255)
    loading.TextSize = 14
    loading.Font = Enum.Font.GothamBlack
    loading.TextTransparency = 1
    loading.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = loading
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    TweenService:Create(loading, tweenInfo, {TextTransparency = 0, BackgroundTransparency = 0.1}):Play()
    return loading
end

-- Initialize GUI with retry mechanism
local gui2
local function initializeGUI()
    local loading = showLoading()
    local success, result = pcall(function()
        gui2 = Instance.new("ScreenGui")
        gui2.Parent = Players.LocalPlayer:WaitForChild("PlayerGui", 10)
        gui2.ResetOnSpawn = false
        gui2.IgnoreGuiInset = true

        -- Main Frame for GUI 2
        local gui2Frame = Instance.new("Frame")
        gui2Frame.Size = UDim2.new(0, 320, 0, 420)
        gui2Frame.Position = UDim2.new(0.5, -160, -0.5, 0) -- Start off-screen for slide-in
        gui2Frame.BackgroundColor3 = Color3.fromRGB(0, 40, 60)
        gui2Frame.BackgroundTransparency = 0.1
        gui2Frame.Active = true
        gui2Frame.Draggable = true
        gui2Frame.Parent = gui2

        local gui2Corner = Instance.new("UICorner")
        gui2Corner.CornerRadius = UDim.new(0, 15)
        gui2Corner.Parent = gui2Frame

        local gui2Stroke = Instance.new("UIStroke")
        gui2Stroke.Color = Color3.fromRGB(0, 150, 255)
        gui2Stroke.Thickness = 2
        gui2Stroke.Parent = gui2Frame

        -- Pulsing Stroke Animation
        local pulseInfo = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
        TweenService:Create(gui2Stroke, pulseInfo, {Thickness = 4}):Play()

        -- Title
        local gui2Title = Instance.new("TextLabel")
        gui2Title.Size = UDim2.new(1, 0, 0, 60)
        gui2Title.BackgroundColor3 = Color3.fromRGB(0, 80, 100)
        gui2Title.BackgroundTransparency = 0.2
        gui2Title.Text = "Ninja Legends OP GUI"
        gui2Title.TextColor3 = Color3.fromRGB(0, 150, 255)
        gui2Title.TextSize = 20
        gui2Title.Font = Enum.Font.GothamBlack
        gui2Title.Parent = gui2Frame

        local titleCorner = Instance.new("UICorner")
        titleCorner.CornerRadius = UDim.new(0, 15)
        titleCorner.Parent = gui2Title

        local titleStroke = Instance.new("UIStroke")
        titleStroke.Color = Color3.fromRGB(0, 150, 255)
        titleStroke.Thickness = 1
        titleStroke.Parent = gui2Title

        -- Welcome Notification
        local function showWelcome()
            local welcome = Instance.new("TextLabel")
            welcome.Size = UDim2.new(0, 400, 0, 80)
            welcome.Position = UDim2.new(0.5, -200, 1, 0)
            welcome.BackgroundColor3 = Color3.fromRGB(0, 40, 60)
            welcome.BackgroundTransparency = 0.3
            welcome.Text = "Welcome to Ninja Legends OP GUI by k00dkidd!"
            welcome.TextColor3 = Color3.fromRGB(0, 150, 255)
            welcome.TextSize = 16
            welcome.Font = Enum.Font.GothamBlack
            welcome.TextTransparency = 1
            welcome.Parent = gui2

            local welcomeCorner = Instance.new("UICorner")
            welcomeCorner.CornerRadius = UDim.new(0, 12)
            welcomeCorner.Parent = welcome

            local welcomeStroke = Instance.new("UIStroke")
            welcomeStroke.Color = Color3.fromRGB(0, 150, 255)
            welcomeStroke.Thickness = 2
            welcomeStroke.Parent = welcome

            local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            local slideInfo = TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            TweenService:Create(welcome, tweenInfo, {TextTransparency = 0, BackgroundTransparency = 0.1}):Play()
            TweenService:Create(welcome, slideInfo, {Position = UDim2.new(0.5, -200, 0.3, 0)}):Play()
            wait(4)
            TweenService:Create(welcome, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
            wait(0.8)
            welcome:Destroy()
        end

        -- Button Hover and Click Effects
        local function applyButtonEffects(button)
            local uiScale = Instance.new("UIScale")
            uiScale.Parent = button
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 150, 255)
            stroke.Thickness = 1
            stroke.Parent = button
            button.MouseEnter:Connect(function()
                TweenService:Create(uiScale, TweenInfo.new(0.2), {Scale = 1.05}):Play()
                TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(100, 200, 255)}):Play()
            end)
            button.MouseLeave:Connect(function()
                TweenService:Create(uiScale, TweenInfo.new(0.2), {Scale = 1}):Play()
                TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 150, 255)}):Play()
            end)
            button.MouseButton1Down:Connect(function()
                TweenService:Create(uiScale, TweenInfo.new(0.1), {Scale = 0.95}):Play()
            end)
            button.MouseButton1Up:Connect(function()
                TweenService:Create(uiScale, TweenInfo.new(0.1), {Scale = 1}):Play()
            end)
        end

        -- Button Container with List Layout
        local buttonContainer = Instance.new("Frame")
        buttonContainer.Size = UDim2.new(1, -20, 0, 220)
        buttonContainer.Position = UDim2.new(0, 10, 0, 70)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = gui2Frame

        local listLayout = Instance.new("UIListLayout")
        listLayout.Padding = UDim.new(0, 12)
        listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        listLayout.Parent = buttonContainer

        -- Toggle Master Elements GUI Button
        local toggleButton = Instance.new("TextButton")
        toggleButton.Size = UDim2.new(0, 280, 0, 50)
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 60, 80)
        toggleButton.Text = "Master Elements"
        toggleButton.TextColor3 = Color3.fromRGB(0, 150, 255)
        toggleButton.TextSize = 16
        toggleButton.Font = Enum.Font.GothamBlack
        toggleButton.Parent = buttonContainer
        local toggleCorner = Instance.new("UICorner")
        toggleCorner.CornerRadius = UDim.new(0, 10)
        toggleCorner.Parent = toggleButton
        local toggleGradient = Instance.new("UIGradient")
        toggleGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 100))
        }
        toggleGradient.Parent = toggleButton
        applyButtonEffects(toggleButton)

        -- Start Button (Toggles Auto-Spam)
        local startButton = Instance.new("TextButton")
        startButton.Size = UDim2.new(0, 280, 0, 50)
        startButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50) -- Red for "Off"
        startButton.Text = "Start Off"
        startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        startButton.TextSize = 16
        startButton.Font = Enum.Font.GothamBlack
        startButton.Parent = buttonContainer
        local startCorner = Instance.new("UICorner")
        startCorner.CornerRadius = UDim.new(0, 10)
        startCorner.Parent = startButton
        local startGradient = Instance.new("UIGradient")
        startGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 100))
        }
        startGradient.Parent = startButton
        applyButtonEffects(startButton)

        local isSpamming = false
        local spamThread = nil
        local lastToggle = 0
        local cooldown = 1 -- 1-second cooldown to prevent rapid toggling

        startButton.MouseButton1Click:Connect(function()
            local currentTime = tick()
            if currentTime - lastToggle < cooldown then
                numberEntry.Text = "Wait " .. math.ceil(cooldown - (currentTime - lastToggle)) .. "s"
                wait(1)
                numberEntry.Text = "Enter number"
                return
            end
            lastToggle = currentTime

            local num = tonumber(numberEntry.Text)
            if num and num > 0 and num <= 1e50 then
                num = math.clamp(num, 1, 1e50)
                isSpamming = not isSpamming
                if isSpamming then
                    startButton.Text = "Start On"
                    startButton.BackgroundColor3 = Color3.fromRGB(0, 255, 100) -- Green for "On"
                    spamThread = task.spawn(function()
                        while isSpamming do
                            pcall(function()
                                ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", num)
                            end)
                            task.wait(0.5)
                        end
                    end)
                else
                    startButton.Text = "Start Off"
                    startButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50) -- Red for "Off"
                    if spamThread then
                        task.cancel(spamThread)
                        spamThread = nil
                    end
                end
            else
                numberEntry.Text = "Invalid number!"
                wait(1)
                numberEntry.Text = "Enter number"
            end
        end)

        -- Input Panel
        local inputPanel = Instance.new("Frame")
        inputPanel.Size = UDim2.new(1, -20, 0, 100)
        inputPanel.Position = UDim2.new(0, 10, 0, 300)
        inputPanel.BackgroundColor3 = Color3.fromRGB(0, 40, 60)
        inputPanel.BackgroundTransparency = 0.3
        inputPanel.Parent = gui2Frame
        local inputCorner = Instance.new("UICorner")
        inputCorner.CornerRadius = UDim.new(0, 10)
        inputCorner.Parent = inputPanel
        local inputStroke = Instance.new("UIStroke")
        inputStroke.Color = Color3.fromRGB(0, 150, 255)
        inputStroke.Thickness = 1
        inputStroke.Parent = inputPanel

        -- ENTRY FIELD (Number Input)
        local numberEntry = Instance.new("TextBox")
        numberEntry.Size = UDim2.new(0, 280, 0, 50)
        numberEntry.Position = UDim2.new(0, 10, 0, 10)
        numberEntry.BackgroundColor3 = Color3.fromRGB(0, 60, 80)
        numberEntry.Text = "Enter number"
        numberEntry.TextColor3 = Color3.fromRGB(0, 150, 255)
        numberEntry.TextSize = 16
        numberEntry.Font = Enum.Font.GothamBlack
        numberEntry.ClearTextOnFocus = true
        numberEntry.Parent = inputPanel
        local entryCorner = Instance.new("UICorner")
        entryCorner.CornerRadius = UDim.new(0, 10)
        entryCorner.Parent = numberEntry
        local entryStroke = Instance.new("UIStroke")
        entryStroke.Color = Color3.fromRGB(0, 150, 255)
        entryStroke.Thickness = 1
        entryStroke.Parent = numberEntry

        -- SUBMIT BUTTON
        local submitButton = Instance.new("TextButton")
        submitButton.Size = UDim2.new(0, 280, 0, 50)
        submitButton.Position = UDim2.new(0, 10, 0, 60)
        submitButton.BackgroundColor3 = Color3.fromRGB(0, 60, 80)
        submitButton.Text = "Submit"
        submitButton.TextColor3 = Color3.fromRGB(0, 150, 255)
        submitButton.TextSize = 16
        submitButton.Font = Enum.Font.GothamBlack
        submitButton.Parent = inputPanel
        local submitCorner = Instance.new("UICorner")
        submitCorner.CornerRadius = UDim.new(0, 10)
        submitCorner.Parent = submitButton
        local submitGradient = Instance.new("UIGradient")
        submitGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 100))
        }
        submitGradient.Parent = submitButton
        applyButtonEffects(submitButton)

        submitButton.MouseButton1Click:Connect(function()
            local num = tonumber(numberEntry.Text)
            if num and num > 0 and num <= 1e50 then
                num = math.clamp(num, 1, 1e50)
                pcall(function()
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", num)
                end)
                numberEntry.Text = "Success!"
                wait(1)
                numberEntry.Text = "Enter number"
            else
                numberEntry.Text = "Invalid input!"
                wait(1)
                numberEntry.Text = "Enter number"
            end
        end)

        -- Discord Button
        local discordButton = Instance.new("TextButton")
        discordButton.Size = UDim2.new(0, 280, 0, 50)
        discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        discordButton.Text = "Join Discord"
        discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        discordButton.TextSize = 16
        discordButton.Font = Enum.Font.GothamBlack
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
            pcall(function()
                setclipboard("https://discord.gg/notexttospeech")
            end)
            local notify = Instance.new("TextLabel")
            notify.Size = UDim2.new(0, 280, 0, 50)
            notify.Position = UDim2.new(0.5, -140, 0.4, 0)
            notify.BackgroundColor3 = Color3.fromRGB(0, 40, 60)
            notify.BackgroundTransparency = 0.3
            notify.Text = "Discord link copied!"
            notify.TextColor3 = Color3.fromRGB(0, 150, 255)
            notify.TextSize = 16
            notify.Font = Enum.Font.GothamBlack
            notify.TextTransparency = 1
            notify.Parent = gui2
            local notifyCorner = Instance.new("UICorner")
            notifyCorner.CornerRadius = UDim.new(0, 10)
            notifyCorner.Parent = notify
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
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
        masterGui.IgnoreGuiInset = true

        local masterFrame = Instance.new("Frame")
        masterFrame.Size = UDim2.new(0, 370, 0, 570)
        masterFrame.Position = UDim2.new(0.5, -185, 0.2, 0)
        masterFrame.BackgroundColor3 = Color3.fromRGB(0, 40, 60)
        masterFrame.BackgroundTransparency = 0.1
        masterFrame.Active = true
        masterFrame.Draggable = true
        masterFrame.Parent = masterGui

        local masterCorner = Instance.new("UICorner")
        masterCorner.CornerRadius = UDim.new(0, 15)
        masterCorner.Parent = masterFrame

        local masterStroke = Instance.new("UIStroke")
        masterStroke.Color = Color3.fromRGB(0, 150, 255)
        masterStroke.Thickness = 2
        masterStroke.Parent = masterFrame
        TweenService:Create(masterStroke, pulseInfo, {Thickness = 4}):Play()

        local masterTitle = Instance.new("TextLabel")
        masterTitle.Size = UDim2.new(1, -50, 0, 60)
        masterTitle.BackgroundColor3 = Color3.fromRGB(0, 80, 100)
        masterTitle.BackgroundTransparency = 0.2
        masterTitle.Text = "Master Elements"
        masterTitle.TextColor3 = Color3.fromRGB(0, 150, 255)
        masterTitle.TextSize = 20
        masterTitle.Font = Enum.Font.GothamBlack
        masterTitle.Parent = masterFrame
        local masterTitleCorner = Instance.new("UICorner")
        masterTitleCorner.CornerRadius = UDim.new(0, 15)
        masterTitleCorner.Parent = masterTitle
        local masterTitleStroke = Instance.new("UIStroke")
        masterTitleStroke.Color = Color3.fromRGB(0, 150, 255)
        masterTitleStroke.Thickness = 1
        masterTitleStroke.Parent = masterTitle

        -- Close Button for Master Elements
        local closeButton = Instance.new("TextButton")
        closeButton.Size = UDim2.new(0, 40, 0, 40)
        closeButton.Position = UDim2.new(1, -45, 0, 10)
        closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        closeButton.Text = "X"
        closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeButton.TextSize = 16
        closeButton.Font = Enum.Font.GothamBlack
        closeButton.Parent = masterFrame
        local closeCorner = Instance.new("UICorner")
        closeCorner.CornerRadius = UDim.new(0, 10)
        closeCorner.Parent = closeButton
        applyButtonEffects(closeButton)
        closeButton.MouseButton1Click:Connect(function()
            masterGui.Enabled = false
        end)

        -- Container for Buttons
        local scrollFrame = Instance.new("ScrollingFrame")
        scrollFrame.Size = UDim2.new(1, -20, 1, -80)
        scrollFrame.Position = UDim2.new(0, 10, 0, 70)
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 570)
        scrollFrame.ScrollBarThickness = 5
        scrollFrame.BackgroundTransparency = 1
        scrollFrame.Parent = masterFrame

        local masterListLayout = Instance.new("UIListLayout")
        masterListLayout.Padding = UDim.new(0, 12)
        masterListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        masterListLayout.Parent = scrollFrame

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
            button.Size = UDim2.new(0, 330, 0, 55)
            button.BackgroundColor3 = Color3.fromRGB(0, 60, 80)
            button.Text = "Master " .. element
            button.TextColor3 = Color3.fromRGB(0, 150, 255)
            button.TextSize = 16
            button.Font = Enum.Font.GothamBlack
            button.Parent = scrollFrame
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 10)
            buttonCorner.Parent = button
            local buttonGradient = Instance.new("UIGradient")
            buttonGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 100))
            }
            buttonGradient.Parent = button
            applyButtonEffects(button)

            button.MouseButton1Click:Connect(function()
                pcall(function()
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer(element)
                end)
            end)
        end

        -- Update CanvasSize based on number of elements
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #elements * 67)

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
                local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                TweenService:Create(masterFrame, tweenInfo, {BackgroundTransparency = 0.1}):Play()
                for i, child in ipairs(scrollFrame:GetChildren()) do
                    if child:IsA("GuiObject") then
                        wait(0.05 * i)
                        TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
                    end
                end
                TweenService:Create(masterTitle, tweenInfo, {BackgroundTransparency = 0.2, TextTransparency = 0}):Play()
                TweenService:Create(closeButton, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
            end
        end)

        -- Startup Animation
        gui2Frame.BackgroundTransparency = 1
        local uiScale = Instance.new("UIScale")
        uiScale.Scale = 0.5
        uiScale.Parent = gui2Frame
        for _, child in ipairs(gui2Frame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.BackgroundTransparency = 1
                child.TextTransparency = 1
            end
        end
        for _, child in ipairs(inputPanel:GetChildren()) do
            if child:IsA("GuiObject") then
                child.BackgroundTransparency = 1
                child.TextTransparency = 1
            end
        end
        local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local slideInfo = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        TweenService:Create(gui2Frame, slideInfo, {Position = UDim2.new(0.5, -160, 0.2, 0)}):Play()
        TweenService:Create(gui2Frame, tweenInfo, {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(uiScale, slideInfo, {Scale = 1}):Play()
        for i, child in ipairs(buttonContainer:GetChildren()) do
            if child:IsA("GuiObject") then
                wait(0.1 * i)
                TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
            end
        end
        for _, child in ipairs(inputPanel:GetChildren()) do
            if child:IsA("GuiObject") then
                TweenService:Create(child, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
            end
        end
        TweenService:Create(inputPanel, tweenInfo, {BackgroundTransparency = 0.3}):Play()
        TweenService:Create(gui2Title, tweenInfo, {BackgroundTransparency = 0.2, TextTransparency = 0}):Play()

        -- Show Welcome Notification
        showWelcome()
    end)

    if loading then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        TweenService:Create(loading, tweenInfo, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
        wait(0.5)
        loading:Destroy()
    end

    if not success then
        showError("Failed to initialize GUI: " .. tostring(result))
        return false
    end
    return true
end

-- Retry GUI initialization if it fails
local maxRetries = 3
local retryCount = 0
local retryDelay = 1
while not initializeGUI() and retryCount < maxRetries do
    retryCount = retryCount + 1
    wait(retryDelay * retryCount) -- Increase delay per attempt
end
if retryCount >= maxRetries then
    showError("GUI failed to load after " .. maxRetries .. " attempts")
end