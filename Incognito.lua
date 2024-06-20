-- Create GUI elements
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SourceContainer = Instance.new("Frame")
local Source = Instance.new("TextBox")
local Execute = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local UICorner_1 = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")

-- Configure GUI properties
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
Main.Position = UDim2.new(0.2, 0, 0.3, 0)
Main.Size = UDim2.new(0, 400, 0, 300) -- Initial size, can be resized by the player

Frame.Parent = Main
Frame.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(1, 0, 1, 0)

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 18)
Title.Font = Enum.Font.SourceSans
Title.Text = "incognito"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 14

SourceContainer.Name = "SourceContainer"
SourceContainer.Parent = Frame
SourceContainer.BackgroundColor3 = Color3.fromRGB(108, 108, 108)
SourceContainer.Position = UDim2.new(0, 0, 0.1, 0)
SourceContainer.Size = UDim2.new(1, 0, 0.7, 0) -- Adjusted height to fit Source and buttons

Source.Name = "Source"
Source.Parent = SourceContainer
Source.BackgroundTransparency = 1
Source.Size = UDim2.new(1, 0, 1, 0)
Source.Font = Enum.Font.SourceSans
Source.MultiLine = true
Source.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
Source.PlaceholderText = "-- Code Here"
Source.Text = ""
Source.TextColor3 = Color3.fromRGB(0, 0, 0)
Source.TextSize = 14
Source.TextWrapped = true -- Allow text wrapping
Source.TextXAlignment = Enum.TextXAlignment.Left -- Align text to the left
Source.TextYAlignment = Enum.TextYAlignment.Top -- Align text to the top

Execute.Name = "Execute"
Execute.Parent = Frame
Execute.BackgroundColor3 = Color3.fromRGB(0, 4, 254)
Execute.Position = UDim2.new(0.025, 0, 0.85, 0)
Execute.Size = UDim2.new(0.45, 0, 0.1, 0)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 14

UICorner_1.CornerRadius = UDim.new(0, 4)
UICorner_1.Parent = Execute

Clear.Name = "Clear"
Clear.Parent = Frame
Clear.BackgroundColor3 = Color3.fromRGB(255, 18, 1)
Clear.Position = UDim2.new(0.525, 0, 0.85, 0)
Clear.Size = UDim2.new(0.45, 0, 0.1, 0)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 14

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Clear

UIListLayout.Parent = Frame

-- Local scripts for Execute and Clear buttons
local executeScript = Instance.new('LocalScript', Execute)

executeScript.Parent.MouseButton1Click:Connect(function()
    -- Execute the code in the Source TextBox
    local code = executeScript.Parent.Parent.SourceContainer.Source.Text
    local func, errorMsg = loadstring(code)
    if func then
        func()
    else
        warn("Error executing code:", errorMsg)
    end
end)

local clearScript = Instance.new('LocalScript', Clear)

clearScript.Parent.MouseButton1Click:Connect(function()
    -- Clear the text in the Source TextBox
    clearScript.Parent.Parent.SourceContainer.Source.Text = ""
end)

-- Make the Main frame draggable
Main.Active = true 
Main.Draggable = true
