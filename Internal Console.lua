getgenv().config = { -- you can remove this unless you want to change options
   enabled = true,
   autoScroll = true,
   onlyExecutorOutput = true, -- only show output from synapse, not from within the game
   toggleKey = "Insert",
   optionsUiEnabled = true
}


if internalRan then
    return warn("Internal already ran")
end

getgenv().config = config or {
    enabled = true,
    autoScroll = true,
    onlyExecutorOutput = false,
    toggleKey = "Insert",
    optionsUiEnabled = true
}
getgenv().internalRan = true

if Enum.KeyCode[config.toggleKey] == nil then
    return warn("Invalid toggle key")
end

repeat task.wait() until game.Players and game.Players.LocalPlayer

local uis = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()

local ScreenGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Seperator = Instance.new("Frame")
local Toggle = Instance.new("ImageButton")
local Tab = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TabCover = Instance.new("Frame")
local TabLabel = Instance.new("TextLabel")
local TabPadding = Instance.new("UIPadding")
local Close = Instance.new("ImageButton")
local ClearButton = Instance.new("TextButton")
local Output = Instance.new("ScrollingFrame")
local OutputPadding = Instance.new("UIPadding")
local OutputLayout = Instance.new("UIListLayout")
local OutputTemplate = Instance.new("TextLabel")
local resizer = Instance.new("Frame")
local dragger = Instance.new("ImageButton")
local UICorner_2 = Instance.new("UICorner")

local Options = Instance.new("Frame")
local TopBar_2 = Instance.new("Frame")
local Seperator_2 = Instance.new("Frame")
local OptionsToggle = Instance.new("ImageButton")
local TabLabel_2 = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local OptionsFrame = Instance.new("ScrollingFrame")
local UIPadding_2 = Instance.new("UIPadding")
local OptionsSpacing = Instance.new("UIPadding")
local OptionsLayout = Instance.new("UIListLayout")
local Enabled = Instance.new("Frame")
local Button = Instance.new("TextButton")
local ButtonImage = Instance.new("ImageLabel")
local Label = Instance.new("TextLabel")
local LabelPadding = Instance.new("UIPadding")
local AutoScroll = Instance.new("Frame")
local Button_2 = Instance.new("TextButton")
local ButtonImage_2 = Instance.new("ImageLabel")
local Label_2 = Instance.new("TextLabel")
local LabelPadding_2 = Instance.new("UIPadding")
local OnlyExec = Instance.new("Frame")
local Button_3 = Instance.new("TextButton")
local ButtonImage_3 = Instance.new("ImageLabel")
local Label_3 = Instance.new("TextLabel")
local LabelPadding_3 = Instance.new("UIPadding")

do -- ui properties

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Background.Name = "Background"
Background.Parent = ScreenGui
Background.BackgroundColor3 = Color3.fromRGB(52, 51, 52)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.3, 0, 0.3, 0)
Background.Size = UDim2.new(0, 601, 0, 312)

TopBar.Name = "TopBar"
TopBar.Parent = Background
TopBar.BackgroundColor3 = Color3.fromRGB(60, 59, 60)
TopBar.BorderColor3 = Color3.fromRGB(60, 59, 60)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 25)
TopBar.ZIndex = 2

Seperator.Name = "Seperator"
Seperator.Parent = TopBar
Seperator.BackgroundColor3 = Color3.fromRGB(255, 85, 3)
Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
Seperator.BorderSizePixel = 0
Seperator.Position = UDim2.new(0, 0, 0, 25)
Seperator.Size = UDim2.new(1, 0, 0, 1)

Toggle.Name = "Toggle"
Toggle.Parent = TopBar
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0, 3, 0, 3)
Toggle.Size = UDim2.new(0, 19, 0, 19)
Toggle.Image = "rbxassetid://10709767827"

Tab.Name = "Tab"
Tab.Parent = TopBar
Tab.BackgroundColor3 = Color3.fromRGB(255, 85, 5)
Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tab.BorderSizePixel = 0
Tab.Position = UDim2.new(0, 30, 0, 2)
Tab.Size = UDim2.new(0, 77, 0, 23)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Tab

TabCover.Name = "TabCover"
TabCover.Parent = Tab
TabCover.BackgroundColor3 = Color3.fromRGB(255, 85, 5)
TabCover.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabCover.BorderSizePixel = 0
TabCover.Position = UDim2.new(0, 0, 1, -5)
TabCover.Size = UDim2.new(1, 0, 0, 5)

TabLabel.Name = "TabLabel"
TabLabel.Parent = Tab
TabLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabLabel.BackgroundTransparency = 1.000
TabLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabLabel.BorderSizePixel = 0
TabLabel.Size = UDim2.new(1, 0, 1, 0)
TabLabel.Font = Enum.Font.ArialBold
TabLabel.Text = "Console"
TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TabLabel.TextSize = 14.000
TabLabel.TextXAlignment = Enum.TextXAlignment.Left

TabPadding.Name = "TabPadding"
TabPadding.Parent = TabLabel
TabPadding.PaddingLeft = UDim.new(0, 4)

Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1, -22, 0, 3)
Close.Size = UDim2.new(0, 19, 0, 19)
Close.Image = "rbxassetid://10747384394"

ClearButton.Name = "ClearButton"
ClearButton.Parent = Background
ClearButton.BackgroundColor3 = Color3.fromRGB(60, 59, 60)
ClearButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClearButton.BorderSizePixel = 0
ClearButton.Position = UDim2.new(0, 8, 0.997245193, -34)
ClearButton.Size = UDim2.new(0, 105, 0, 29)
ClearButton.Font = Enum.Font.ArialBold
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.TextSize = 14.000
ClearButton.TextWrapped = true

Output.Name = "Output"
Output.Parent = Background
Output.BackgroundColor3 = Color3.fromRGB(31, 30, 31)
Output.BorderColor3 = Color3.fromRGB(0, 0, 0)
Output.BorderSizePixel = 0
Output.Position = UDim2.new(0, 8, 0, 34)
Output.Selectable = false
Output.Size = UDim2.new(1, -16, 1, -75)
Output.CanvasSize = UDim2.new(0, 0, 0, 0)
Output.ScrollBarThickness = 4
Output.AutomaticCanvasSize = Enum.AutomaticSize.Y

OutputPadding.Name = "OutputPadding"
OutputPadding.Parent = Output
OutputPadding.PaddingLeft = UDim.new(0, 2)
OutputPadding.PaddingTop = UDim.new(0, 1)

OutputLayout.Name = "OutputLayout"
OutputLayout.Parent = Output
OutputLayout.SortOrder = Enum.SortOrder.LayoutOrder
OutputLayout.Padding = UDim.new(0, 0)

OutputTemplate.Name = "OutputTemplate"
OutputTemplate.Parent = Output
OutputTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OutputTemplate.BackgroundTransparency = 1.000
OutputTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
OutputTemplate.BorderSizePixel = 0
OutputTemplate.Position = UDim2.new(0.00341296918, 0, 0.00347222225, 0)
OutputTemplate.Size = UDim2.new(1, 0, 0, 0)
OutputTemplate.Visible = false
OutputTemplate.Font = Enum.Font.Arial
OutputTemplate.Text = "<font color=\"#ff4440\">123 </font>"
OutputTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
OutputTemplate.TextSize = 15.000
OutputTemplate.TextWrapped = true
OutputTemplate.TextXAlignment = Enum.TextXAlignment.Left
OutputTemplate.TextYAlignment = Enum.TextYAlignment.Top
OutputTemplate.RichText = true
OutputTemplate.AutomaticSize = Enum.AutomaticSize.Y

resizer.Name = "resizer"
resizer.Parent = ScreenGui
resizer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
resizer.BackgroundTransparency = 1.000
resizer.ClipsDescendants = true
resizer.Position = UDim2.new(1, -30, 1, -30)
resizer.Size = UDim2.new(0, 30, 0, 30)
resizer.SizeConstraint = Enum.SizeConstraint.RelativeXX

dragger.Name = "dragger"
dragger.Parent = resizer
dragger.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
dragger.BackgroundTransparency = 1.000
dragger.BorderSizePixel = 0
dragger.Size = UDim2.new(2, 0, 2, 0)
dragger.ZIndex = 2
dragger.ImageTransparency = 1.000

UICorner_2.CornerRadius = UDim.new(0.5, 0)
UICorner_2.Parent = dragger


Options.Name = "Options"
Options.Parent = ScreenGui
Options.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Options.BorderColor3 = Color3.fromRGB(0, 0, 0)
Options.BorderSizePixel = 0
Options.Position = UDim2.new(0.3, 640, 0.3, 0)
Options.Size = UDim2.new(0, 207, 0, 312)

TopBar_2.Name = "TopBar"
TopBar_2.Parent = Options
TopBar_2.BackgroundColor3 = Color3.fromRGB(60, 59, 60)
TopBar_2.BorderColor3 = Color3.fromRGB(60, 59, 60)
TopBar_2.BorderSizePixel = 0
TopBar_2.Size = UDim2.new(1, 0, 0, 25)
TopBar_2.ZIndex = 2

Seperator_2.Name = "Seperator"
Seperator_2.Parent = TopBar_2
Seperator_2.BackgroundColor3 = Color3.fromRGB(255, 85, 3)
Seperator_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Seperator_2.BorderSizePixel = 0
Seperator_2.Position = UDim2.new(0, 0, 0, 25)
Seperator_2.Size = UDim2.new(1, 0, 0, 1)

OptionsToggle.Name = "OptionsToggle"
OptionsToggle.Parent = TopBar_2
OptionsToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OptionsToggle.BackgroundTransparency = 1.000
OptionsToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
OptionsToggle.BorderSizePixel = 0
OptionsToggle.Position = UDim2.new(0, 3, 0, 3)
OptionsToggle.Size = UDim2.new(0, 19, 0, 19)
OptionsToggle.Image = "rbxassetid://10709767827"

TabLabel_2.Name = "TabLabel"
TabLabel_2.Parent = TopBar_2
TabLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabLabel_2.BackgroundTransparency = 1.000
TabLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabLabel_2.BorderSizePixel = 0
TabLabel_2.Size = UDim2.new(1, 0, 1, 0)
TabLabel_2.Font = Enum.Font.ArialBold
TabLabel_2.Text = "Console"
TabLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TabLabel_2.TextSize = 14.000
TabLabel_2.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = TabLabel_2
UIPadding.PaddingLeft = UDim.new(0, 26)

OptionsFrame.Name = "OptionsFrame"
OptionsFrame.Parent = Options
OptionsFrame.Active = true
OptionsFrame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
OptionsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
OptionsFrame.BorderSizePixel = 0
OptionsFrame.Position = UDim2.new(0, 0, 0, 33)
OptionsFrame.Size = UDim2.new(1, 0, 1, -33)
OptionsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
OptionsFrame.ScrollBarThickness = 4

OptionsSpacing.Name = "OptionsSpacing"
OptionsSpacing.Parent = OptionsFrame
OptionsSpacing.PaddingLeft = UDim.new(0, 5)

OptionsLayout.Name = "OptionsLayout"
OptionsLayout.Parent = OptionsFrame
OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
OptionsLayout.Padding = UDim.new(0, 3)

Enabled.Name = "Enabled"
Enabled.Parent = OptionsFrame
Enabled.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Enabled.BackgroundTransparency = 1.000
Enabled.BorderColor3 = Color3.fromRGB(0, 0, 0)
Enabled.BorderSizePixel = 0
Enabled.Position = UDim2.new(-1.43902445, 0, 0.436657667, 0)
Enabled.Size = UDim2.new(0, 234, 0, 22)

Button.Name = "Button"
Button.Parent = Enabled
Button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0, 0, -0.0209794473, 0)
Button.Size = UDim2.new(0, 22, 0, 22)
Button.Font = Enum.Font.SourceSans
Button.Text = ""
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14.000

ButtonImage.Name = "ButtonImage"
ButtonImage.Parent = Button
ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonImage.BackgroundTransparency = 1.000
ButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonImage.BorderSizePixel = 0
ButtonImage.Position = UDim2.new(0, 3, 0, 3)
ButtonImage.Size = UDim2.new(0, 16, 0, 16)
ButtonImage.Image = "rbxassetid://10709790644"
ButtonImage.ImageColor3 = Color3.fromRGB(223, 108, 18)

Label.Name = "Label"
Label.Parent = Enabled
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0, 22, 0, 0)
Label.Size = UDim2.new(1, -22, 1, 0)
Label.Font = Enum.Font.ArialBold
Label.Text = "Enabled"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 12.000
Label.TextXAlignment = Enum.TextXAlignment.Left

LabelPadding.Name = "LabelPadding"
LabelPadding.Parent = Label
LabelPadding.PaddingLeft = UDim.new(0, 5)

AutoScroll.Name = "AutoScroll"
AutoScroll.Parent = OptionsFrame
AutoScroll.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AutoScroll.BackgroundTransparency = 1.000
AutoScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoScroll.BorderSizePixel = 0
AutoScroll.Position = UDim2.new(-1.43902445, 0, 0.436657667, 0)
AutoScroll.Size = UDim2.new(0, 234, 0, 22)

Button_2.Name = "Button"
Button_2.Parent = AutoScroll
Button_2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button_2.BorderSizePixel = 0
Button_2.Position = UDim2.new(0, 0, -0.0209794473, 0)
Button_2.Size = UDim2.new(0, 22, 0, 22)
Button_2.Font = Enum.Font.SourceSans
Button_2.Text = ""
Button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Button_2.TextSize = 14.000

ButtonImage_2.Name = "ButtonImage"
ButtonImage_2.Parent = Button_2
ButtonImage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonImage_2.BackgroundTransparency = 1.000
ButtonImage_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonImage_2.BorderSizePixel = 0
ButtonImage_2.Position = UDim2.new(0, 3, 0, 3)
ButtonImage_2.Size = UDim2.new(0, 16, 0, 16)
ButtonImage_2.Image = "rbxassetid://10709790644"
ButtonImage_2.ImageColor3 = Color3.fromRGB(223, 108, 18)

Label_2.Name = "Label"
Label_2.Parent = AutoScroll
Label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_2.BackgroundTransparency = 1.000
Label_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label_2.BorderSizePixel = 0
Label_2.Position = UDim2.new(0, 22, 0, 0)
Label_2.Size = UDim2.new(1, -22, 1, 0)
Label_2.Font = Enum.Font.ArialBold
Label_2.Text = "Auto Scroll"
Label_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_2.TextSize = 12.000
Label_2.TextXAlignment = Enum.TextXAlignment.Left

LabelPadding_2.Name = "LabelPadding"
LabelPadding_2.Parent = Label_2
LabelPadding_2.PaddingLeft = UDim.new(0, 5)

OnlyExec.Name = "OnlyExec"
OnlyExec.Parent = OptionsFrame
OnlyExec.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OnlyExec.BackgroundTransparency = 1.000
OnlyExec.BorderColor3 = Color3.fromRGB(0, 0, 0)
OnlyExec.BorderSizePixel = 0
OnlyExec.Position = UDim2.new(-1.43902445, 0, 0.436657667, 0)
OnlyExec.Size = UDim2.new(0, 234, 0, 22)

Button_3.Name = "Button"
Button_3.Parent = OnlyExec
Button_3.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Button_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button_3.BorderSizePixel = 0
Button_3.Position = UDim2.new(0, 0, -0.0209794473, 0)
Button_3.Size = UDim2.new(0, 22, 0, 22)
Button_3.Font = Enum.Font.SourceSans
Button_3.Text = ""
Button_3.TextColor3 = Color3.fromRGB(0, 0, 0)
Button_3.TextSize = 14.000

ButtonImage_3.Name = "ButtonImage"
ButtonImage_3.Parent = Button_3
ButtonImage_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonImage_3.BackgroundTransparency = 1.000
ButtonImage_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonImage_3.BorderSizePixel = 0
ButtonImage_3.Position = UDim2.new(0, 3, 0, 3)
ButtonImage_3.Size = UDim2.new(0, 16, 0, 16)
ButtonImage_3.Image = "rbxassetid://10709790644"
ButtonImage_3.ImageColor3 = Color3.fromRGB(223, 108, 18)

Label_3.Name = "Label"
Label_3.Parent = OnlyExec
Label_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_3.BackgroundTransparency = 1.000
Label_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label_3.BorderSizePixel = 0
Label_3.Position = UDim2.new(0, 22, 0, 0)
Label_3.Size = UDim2.new(1, -22, 1, 0)
Label_3.Font = Enum.Font.ArialBold
Label_3.Text = "Only Executor Output"
Label_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_3.TextSize = 12.000
Label_3.TextXAlignment = Enum.TextXAlignment.Left

LabelPadding_3.Name = "LabelPadding"
LabelPadding_3.Parent = Label_3
LabelPadding_3.PaddingLeft = UDim.new(0, 5)

end

if config.optionsUiEnabled == false then
    Options.Visible = false
end


-- i am lazy dont ask why there are two

local draggerFunctions = {}; do
    local DRAGGER_SIZE = 30
    local DRAGGER_TRANSPARENCY = .5

    local dragging = false

    function draggerFunctions.makeResizable(obj:GuiObject, minSize)
        
        local resizer = ScreenGui.resizer:Clone()
        local dragger = resizer.dragger
        
        resizer.Size = UDim2.fromOffset(DRAGGER_SIZE, DRAGGER_SIZE)
        resizer.Position = UDim2.new(1, -DRAGGER_SIZE, 1, -DRAGGER_SIZE)
        
        local duic = dragger.UICorner
        minSize = minSize or Vector2.new(160, 90)
        
        local startDrag, startSize
        local gui = obj:FindFirstAncestorWhichIsA("ScreenGui")
        resizer.Parent = obj

        local function finishResize(tr)
            dragger.Position = UDim2.new(0,0,0,0)
            dragger.Size = UDim2.new(2,0,2,0)
            dragger.Parent = resizer
            dragger.BackgroundTransparency = tr
            duic.Parent = dragger
            startDrag = nil
        end
        dragger.MouseButton1Down:Connect(function()
            if not startDrag then
                startSize = obj.AbsoluteSize			
                startDrag = Vector2.new(mouse.X, mouse.Y)
                dragger.BackgroundTransparency = 1
                dragger.Size = UDim2.fromOffset(gui.AbsoluteSize.X, gui.AbsoluteSize.Y)
                dragger.Position = UDim2.new(0,0,0,0)
                duic.Parent = nil
                dragger.Parent = gui
            end
        end)	
        dragger.MouseMoved:Connect(function()
            if startDrag then		
                local m = Vector2.new(mouse.X, mouse.Y)
                local mouseMoved = Vector2.new(m.X - startDrag.X, m.Y - startDrag.Y)
                
                local s = startSize + mouseMoved
                local sx = math.max(minSize.X, s.X) 
                local sy = math.max(minSize.Y, s.Y)
                
                obj.Size = UDim2.fromOffset(sx, sy)
                
            end
        end)
        dragger.MouseEnter:Connect(function()
            finishResize(DRAGGER_TRANSPARENCY)				
        end)
        dragger.MouseLeave:Connect(function()
            finishResize(1)
        end)		
        dragger.MouseButton1Up:Connect(function()
            finishResize(DRAGGER_TRANSPARENCY)
        end)	
    end

    function draggerFunctions.makeDraggable(obj)
        local dragInput, dragStart
        local startPos = obj.Position 
        local dragger = obj	
        local function updateInput(input)		
            local offset = input.Position - dragStart
            local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + offset.X, startPos.Y.Scale, startPos.Y.Offset + offset.Y)
            game:GetService("TweenService"):Create(obj, TweenInfo.new(0.25), {Position = Position}):Play()
        end
        dragger.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not uis:GetFocusedTextBox() then
                dragging = true
                dragStart = input.Position
                startPos = obj.Position
                -- module.dragged = obj
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        dragger.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        uis.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                updateInput(input)
            end
        end)
    end
end    

local draggerFunctions2 = {}; do
    local DRAGGER_SIZE = 30
    local DRAGGER_TRANSPARENCY = .5

    local dragging = false

    function draggerFunctions2.makeResizable(obj:GuiObject, minSize)
        
        local resizer = ScreenGui.resizer:Clone()
        local dragger = resizer.dragger
        
        resizer.Size = UDim2.fromOffset(DRAGGER_SIZE, DRAGGER_SIZE)
        resizer.Position = UDim2.new(1, -DRAGGER_SIZE, 1, -DRAGGER_SIZE)
        
        local duic = dragger.UICorner
        minSize = minSize or Vector2.new(160, 90)
        
        local startDrag, startSize
        local gui = obj:FindFirstAncestorWhichIsA("ScreenGui")
        resizer.Parent = obj

        local function finishResize(tr)
            dragger.Position = UDim2.new(0,0,0,0)
            dragger.Size = UDim2.new(2,0,2,0)
            dragger.Parent = resizer
            dragger.BackgroundTransparency = tr
            duic.Parent = dragger
            startDrag = nil
        end
        dragger.MouseButton1Down:Connect(function()
            if not startDrag then
                startSize = obj.AbsoluteSize			
                startDrag = Vector2.new(mouse.X, mouse.Y)
                dragger.BackgroundTransparency = 1
                dragger.Size = UDim2.fromOffset(gui.AbsoluteSize.X, gui.AbsoluteSize.Y)
                dragger.Position = UDim2.new(0,0,0,0)
                duic.Parent = nil
                dragger.Parent = gui
            end
        end)	
        dragger.MouseMoved:Connect(function()
            if startDrag then		
                local m = Vector2.new(mouse.X, mouse.Y)
                local mouseMoved = Vector2.new(m.X - startDrag.X, m.Y - startDrag.Y)
                
                local s = startSize + mouseMoved
                local sx = math.max(minSize.X, s.X) 
                local sy = math.max(minSize.Y, s.Y)
                
                obj.Size = UDim2.fromOffset(sx, sy)
                
            end
        end)
        dragger.MouseEnter:Connect(function()
            finishResize(DRAGGER_TRANSPARENCY)				
        end)
        dragger.MouseLeave:Connect(function()
            finishResize(1)
        end)		
        dragger.MouseButton1Up:Connect(function()
            finishResize(DRAGGER_TRANSPARENCY)
        end)	
    end

    function draggerFunctions2.makeDraggable(obj)
        local dragInput, dragStart
        local startPos = obj.Position 
        local dragger = obj	
        local function updateInput(input)		
            local offset = input.Position - dragStart
            local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + offset.X, startPos.Y.Scale, startPos.Y.Offset + offset.Y)
            game:GetService("TweenService"):Create(obj, TweenInfo.new(0.25), {Position = Position}):Play()
        end
        dragger.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not uis:GetFocusedTextBox() then
                dragging = true
                dragStart = input.Position
                startPos = obj.Position
                -- module.dragged = obj
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        dragger.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        uis.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                updateInput(input)
            end
        end)
    end
end    


do
	local background = Options
	local buttonsFrame = background.OptionsFrame
	
	local enabledButton = buttonsFrame.Enabled
	local autoScrollButton = buttonsFrame.AutoScroll
	local onlyExecButton = buttonsFrame.OnlyExec
	
	local optionsMinimize = background.TopBar.OptionsToggle	
	
	function toggleButton(button)
		local state
		if button.ButtonImage.ImageTransparency == 1 then
			button.ButtonImage.ImageTransparency = 0
			state = true
		else
			button.ButtonImage.ImageTransparency = 1
			state = false
		end	
		return state
	end

    enabledButton.Button.ButtonImage.ImageTransparency = config.enabled and 0 or 1
    autoScrollButton.Button.ButtonImage.ImageTransparency = config.autoScroll and 0 or 1
    onlyExecButton.Button.ButtonImage.ImageTransparency = config.onlyExecutorOutput and 0 or 1
	
	enabledButton.Button.Activated:Connect(function()
		local state = toggleButton(enabledButton.Button)
		config.enabled = state
	end)
	
	autoScrollButton.Button.Activated:Connect(function()
		local state = toggleButton(autoScrollButton.Button)
		config.autoScroll = state
	end)
	
	onlyExecButton.Button.Activated:Connect(function()
		local state = toggleButton(onlyExecButton.Button)
		config.onlyExecutorOutput = state
	end)
	
	local oldOptionsSize
	local optionsClosed = false
	
	optionsMinimize.Activated:Connect(function()
		if optionsClosed == false then -- frame is open
			
			local size = background.Size
			oldOptionsSize = size
			background:TweenSize(
				UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, 25), 
				Enum.EasingDirection.Out, 
				Enum.EasingStyle.Quint, 
				1,
				true
			)
			
			tweenService:Create(
				optionsMinimize,
				TweenInfo.new(1, Enum.EasingStyle.Quint),
				{Rotation = -180}
			):Play()
	
			optionsClosed = true
		else -- frame is closed
			background:TweenSize(
				oldOptionsSize, 
				Enum.EasingDirection.Out, 
				Enum.EasingStyle.Quint, 
				1,
				true
			)
			
			tweenService:Create(
				optionsMinimize,
				TweenInfo.new(1, Enum.EasingStyle.Quint),
				{Rotation = 0}
			):Play()
	
			optionsClosed = false
		end
	end)
	
	
	draggerFunctions2.makeDraggable(Options)
	draggerFunctions2.makeResizable(Options)
end

local outputLabels = {}

local printColors = {
    ["print"] = "ffffff",
    ["error"] = "ff4440",
    ["warn"] = "ff8e3c"
}

function gencolor(text, printType)
    return 
        '<font color="#' .. 
        printColors[printType] .. '">'  ..
        text ..
        '</font>'	
end

function logtext(text, printType)
    local label = OutputTemplate:Clone()

    label.Parent = Output
    label.Visible = true
    label.Text = gencolor(text, printType)	

    if config.autoScroll then
        scrollToBottom()
    end
    
    local data = {
        text = text,
        instance = label
    }
    
    table.insert(outputLabels, data)
end

function cleartext()
    for i,v in pairs(outputLabels) do
        v.instance:Destroy()
    end
    outputLabels = {}	
end

do -- ui functions
    local background = Background
    local outputFrame = Output
    local minimizeButton = Toggle
    local closeButton = Close
    local clearButton = ClearButton

    draggerFunctions.makeResizable(background)
    draggerFunctions.makeDraggable(background)

    local resizer = background.resizer.dragger

    function scrollToBottom()
        outputFrame.CanvasPosition = Vector2.new(0, 9e9)
    end


    function fadeOut(instance, duration)
        tweenService:Create(
            instance, 
            TweenInfo.new(duration, Enum.EasingStyle.Quint), 
            {BackgroundTransparency = 1}
        ):Play()
    end

    function fadeIn(instance, duration)
        tweenService:Create(
            instance, 
            TweenInfo.new(duration, Enum.EasingStyle.Quint), 
            {BackgroundTransparency = 0}
        ):Play()
    end

    clearButton.Activated:Connect(function()
        cleartext()	
    end)

    local closed = false
    local oldSize

    minimizeButton.Activated:Connect(function()
        if closed == false then -- frame is open
            fadeOut(outputFrame, 0.6)
            fadeOut(clearButton, 0.6)
            resizer.BackgroundTransparency = 1

            tweenService:Create(
                minimizeButton,
                TweenInfo.new(1, Enum.EasingStyle.Quint),
                {Rotation = -180}
            ):Play()

            local size = background.Size
            oldSize = size
            background:TweenSize(
                UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, 25), 
                Enum.EasingDirection.Out, 
                Enum.EasingStyle.Quint, 
                1,
                true
            )
            
            closed = true
        else -- frame is closed
            fadeIn(outputFrame, 0.6)
            fadeIn(clearButton, 0.6)

            tweenService:Create(
                minimizeButton,
                TweenInfo.new(1, Enum.EasingStyle.Quint),
                {Rotation = 0}
            ):Play()

            local size = background.Size
            background:TweenSize(
                oldSize, 
                Enum.EasingDirection.Out, 
                Enum.EasingStyle.Quint, 
                1,
                true
            )
            
            closed = false
        end
    end)

    closeButton.Activated:Connect(function()
        shutdown()
    end)

    uis.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode[config.toggleKey] then
            background.Visible = not background.Visible
            
            if config.optionsUiEnabled then
                Options.Visible = not Options.Visible
            end
        end
    end)

end




local queue = {}
local loopEnabled = true

task.spawn(function()
    while loopEnabled do
        task.wait()

        if queue[1] == nil then
            continue
        end
        
        local item = queue[1]
        logtext(item.text, item.textType)

        table.remove(queue, 1)
    end
end)


local oldprint
oldprint = hookfunction(print, function(...)
    if config.enabled == false then
        return oldprint(...)
    end
    if config.onlyExecutorOutput and checkcaller() == false then
        return oldprint(...)
    end

    local args = {...}
    for i,v in pairs(args) do
        args[i] = tostring(v)
    end

    local output = table.concat(args, " ")
    table.insert(queue, {
        text = output,
        textType = "print"
    })
end)

local oldwarn 
oldwarn = hookfunction(warn, function(...)
    if config.enabled == false then
        return oldwarn(...)
    end
    if config.onlyExecutorOutput and checkcaller() == false then
        return oldwarn(...)
    end

    local args = {...}
    for i,v in pairs(args) do
        args[i] = tostring(v)
    end

    local output = table.concat(args, " ")
    table.insert(queue, {
        text = output,
        textType = "warn"
    })
end)

local olderr
olderr = hookfunction(error, function(...)
    if config.enabled == false then
        return olderr(...)
    end
    if config.onlyExecutorOutput and checkcaller() == false then
        return olderr(...)
    end

    local args = {...}
    for i,v in pairs(args) do
        args[i] = tostring(v)
    end

    local output = table.concat(args, " ")
    table.insert(queue, {
        text = output,
        textType = "error"
    })
end)

local execName, _ = identifyexecutor()
execName = execName:lower()

local messageoutCon 
messageoutCon = game:GetService("LogService").MessageOut:Connect(function(message, messageType)
    if messageType == Enum.MessageType.MessageError then
        if config.enabled == false then
            return
        end

        local execMessage = (message:lower():find(execName, 1) ~= nil)
        if execMessage == false and config.onlyExecutorOutput then
            return
        end

        logtext(message, "error")
    end
end)

function shutdown()
    messageoutCon:Disconnect()
    loopEnabled = false

    hookfunction(print, oldprint)
    hookfunction(warn, oldwarn)
    hookfunction(error, olderr)

    Options:Destroy()
    Background:Destroy()
end
