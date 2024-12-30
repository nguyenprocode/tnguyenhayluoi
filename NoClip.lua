-- Lấy các dịch vụ cần thiết
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local noclip = false
local connection

-- Hàm thông báo
local function notify(message)
    StarterGui:SetCore("SendNotification", {
        Title = "Notification",
        Text = message,
        Duration = 3,
    })
end

-- Hàm bật/tắt noclip
local function toggleNoclip()
    noclip = not noclip
    if noclip then
        connection = RunService.Stepped:Connect(function()
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
        notify("Noclip ON!")
    else
        if connection then
            connection:Disconnect()
        end
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        notify("Noclip OFF!")
    end
end

-- Tạo GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("StarterGui")

-- Tạo nút hình vuông
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 100) -- Kích thước nút
toggleButton.Position = UDim2.new(0.5, -50, 0, 50) -- Vị trí nút (căn giữa trục X)
toggleButton.AnchorPoint = Vector2.new(0.5, 0) -- Căn giữa theo trục X
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255) -- Màu nền
toggleButton.Text = "Toggle Noclip" -- Nội dung chữ
toggleButton.TextColor3 = Color3.new(1, 1, 1) -- Màu chữ (trắng)
toggleButton.TextSize = 20 -- Kích thước chữ
toggleButton.Font = Enum.Font.SourceSans -- Font chữ
toggleButton.Parent = screenGui

-- Xử lý khi nhấn nút
toggleButton.MouseButton1Click:Connect(function()
    toggleNoclip()
end)
