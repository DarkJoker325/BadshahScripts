local Players = game:GetService("Players")
local player = Players.LocalPlayer

local HttpService = game:GetService("HttpService")

-- SETTINGS
local PREFIX = "Badshah-"
local LOOTLABS_LINK = "https://lootlabs.gg/"
local LINKVERTISE_LINK = "https://linkvertise.com/"

-- Number conversion table
local convert = {
    ["0"] = "X",
    ["1"] = "Z",
    ["2"] = "A",
    ["3"] = "G",
    ["4"] = "W",
    ["5"] = "Q",
    ["6"] = "M",
    ["7"] = "B",
    ["8"] = "O",
    ["9"] = "V"
}

-- Generate today's key
local function generateKey()
    local date = os.date("%d%m%Y")
    local result = ""

    for i = 1, #date do
        local char = date:sub(i, i)
        result = result .. (convert[char] or char)
    end

    return PREFIX .. result
end

local TODAY_KEY = generateKey()

-- UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 420, 0, 250)
Main.Position = UDim2.new(0.5, -210, 0.5, -125)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", Main)
UICorner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 1
Title.Text = "Badshah Script"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = Main
KeyBox.Size = UDim2.new(0.8,0,0,45)
KeyBox.Position = UDim2.new(0.1,0,0.32,0)
KeyBox.PlaceholderText = "Enter Key"
KeyBox.Text = ""
KeyBox.TextScaled = true
KeyBox.Font = Enum.Font.Gotham
KeyBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)

local BoxCorner = Instance.new("UICorner", KeyBox)
BoxCorner.CornerRadius = UDim.new(0,8)

local GetKey = Instance.new("TextButton")
GetKey.Parent = Main
GetKey.Size = UDim2.new(0.35,0,0,45)
GetKey.Position = UDim2.new(0.1,0,0.62,0)
GetKey.Text = "Get Key"
GetKey.TextScaled = true
GetKey.Font = Enum.Font.GothamBold
GetKey.BackgroundColor3 = Color3.fromRGB(0,170,255)
GetKey.TextColor3 = Color3.fromRGB(255,255,255)

local GetCorner = Instance.new("UICorner", GetKey)
GetCorner.CornerRadius = UDim.new(0,8)

local Submit = Instance.new("TextButton")
Submit.Parent = Main
Submit.Size = UDim2.new(0.35,0,0,45)
Submit.Position = UDim2.new(0.55,0,0.62,0)
Submit.Text = "Submit Key"
Submit.TextScaled = true
Submit.Font = Enum.Font.GothamBold
Submit.BackgroundColor3 = Color3.fromRGB(0,255,120)
Submit.TextColor3 = Color3.fromRGB(255,255,255)

local SubmitCorner = Instance.new("UICorner", Submit)
SubmitCorner.CornerRadius = UDim.new(0,8)

-- Notification
local function notify(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Badshah Script",
        Text = text,
        Duration = 5
    })
end

-- Get Key Button
GetKey.MouseButton1Click:Connect(function()

    local Popup = Instance.new("Frame")
    Popup.Parent = Main
    Popup.Size = UDim2.new(0.8,0,0,100)
    Popup.Position = UDim2.new(0.1,0,0.15,0)
    Popup.BackgroundColor3 = Color3.fromRGB(35,35,35)

    local PopCorner = Instance.new("UICorner", Popup)

    local Lootlabs = Instance.new("TextButton")
    Lootlabs.Parent = Popup
    Lootlabs.Size = UDim2.new(0.4,0,0,40)
    Lootlabs.Position = UDim2.new(0.05,0,0.3,0)
    Lootlabs.Text = "LootLabs"
    Lootlabs.TextScaled = true

    local Linkvertise = Instance.new("TextButton")
    Linkvertise.Parent = Popup
    Linkvertise.Size = UDim2.new(0.4,0,0,40)
    Linkvertise.Position = UDim2.new(0.55,0,0.3,0)
    Linkvertise.Text = "Linkvertise"
    Linkvertise.TextScaled = true

    Lootlabs.MouseButton1Click:Connect(function()
        setclipboard(LOOTLABS_LINK)
        notify("Link copied in your clipboard paste it in browser")
    end)

    Linkvertise.MouseButton1Click:Connect(function()
        setclipboard(LINKVERTISE_LINK)
        notify("Link copied in your clipboard paste it in browser")
    end)
end)

-- Submit Key
Submit.MouseButton1Click:Connect(function()

    if KeyBox.Text == TODAY_KEY then

        notify("Key Verified Successfully")

        ScreenGui:Destroy()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/TreesHateYou"))()

        print("Script Unlocked")

    else

        notify("Invalid Key")

    end
end)
