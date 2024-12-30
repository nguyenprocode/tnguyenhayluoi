local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local noclip = false
local connection

-- Hàm gửi thông báo
local function notify(message)
    StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = message;
        Duration = 3;
    })
end

-- Hàm bật/tắt noclip
local function toggleNoclip(state)
    noclip = state
    if noclip then
        connection = RunService.Stepped:Connect(function()
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
        notify("Noclip enabled!")
    else
        if connection then
            connection:Disconnect()
        end
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        notify("Noclip disabled!")
    end
end

-- Hàm tạo GUI menu
local function createMenu()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NoclipMenu"
    screenGui.Parent = game.CoreGui

    -- Frame chính (Menu)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.BackgroundTransparency = 0.2
    frame.Visible = true -- Bảng bắt đầu hiển thị
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.3, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "ChestFarm"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.TextScaled = true
    title.BackgroundTransparency = 1
    title.Parent = frame

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0.2, 0)
    subtitle.Position = UDim2.new(0, 0, 0.3, 0)
    subtitle.Text = "Tạo bởi VGB Blox Fruits"
    subtitle.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    subtitle.Font = Enum.Font.SourceSans
    subtitle.TextScaled = true
    subtitle.BackgroundTransparency = 1
    subtitle.Parent = frame

    local enableButton = Instance.new("TextButton")
    enableButton.Size = UDim2.new(0.4, 0, 0.3, 0)
    enableButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    enableButton.Text = "Enable"
    enableButton.TextColor3 = Color3.new(0, 1, 0)
    enableButton.Font = Enum.Font.SourceSansBold
    enableButton.TextScaled = true
    enableButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    enableButton.Parent = frame

    local disableButton = Instance.new("TextButton")
    disableButton.Size = UDim2.new(0.4, 0, 0.3, 0)
    disableButton.Position = UDim2.new(0.5, 0, 0.6, 0)
    disableButton.Text = "Disable"
    disableButton.TextColor3 = Color3.new(1, 0, 0)
    disableButton.Font = Enum.Font.SourceSansBold
    disableButton.TextScaled = true
    disableButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    disableButton.Parent = frame

    -- Nút ẩn/hiện menu
    local toggleMenuButton = Instance.new("TextButton")
    toggleMenuButton.Size = UDim2.new(0, 100, 0, 50)
    toggleMenuButton.Position = UDim2.new(0, 10, 0, 10)
    toggleMenuButton.Text = "Toggle Menu"
    toggleMenuButton.TextColor3 = Color3.new(1, 1, 1)
    toggleMenuButton.Font = Enum.Font.SourceSansBold
    toggleMenuButton.TextScaled = true
    toggleMenuButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    toggleMenuButton.Parent = screenGui

    -- Sự kiện khi nhấn nút Enable
    enableButton.MouseButton1Click:Connect(function()
        toggleNoclip(true)
    end)

    -- Sự kiện khi nhấn nút Disable
    disableButton.MouseButton1Click:Connect(function()
        toggleNoclip(false)
    end)

    -- Sự kiện khi nhấn nút Toggle Menu
    toggleMenuButton.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)
end

-- Tạo GUI khi nhân vật thêm vào
local function onCharacterAdded()
    wait(0.1)
    createMenu()
end

-- Kiểm tra nếu nhân vật đã tồn tại
if player.Character then
    onCharacterAdded()
end

player.CharacterAdded:Connect(onCharacterAdded)
