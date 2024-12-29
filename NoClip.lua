local function createMenu()
    -- Kiểm tra và xóa menu cũ nếu tồn tại
    if game.CoreGui:FindFirstChild("NoclipMenu") then
        game.CoreGui.NoclipMenu:Destroy()
    end

    -- Tạo ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NoclipMenu"
    screenGui.Parent = game.CoreGui

    -- Tạo Frame chính
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.BackgroundTransparency = 0.2
    frame.Visible = true -- Mặc định hiển thị
    frame.Parent = screenGui

    -- Tiêu đề
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.3, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "ChestFarm"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.TextScaled = true
    title.BackgroundTransparency = 1
    title.Parent = frame

    -- Phụ đề
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0.2, 0)
    subtitle.Position = UDim2.new(0, 0, 0.3, 0)
    subtitle.Text = "Tạo bởi VGB Blox Fruits"
    subtitle.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    subtitle.Font = Enum.Font.SourceSans
    subtitle.TextScaled = true
    subtitle.BackgroundTransparency = 1
    subtitle.Parent = frame

    -- Nút Enable
    local enableButton = Instance.new("TextButton")
    enableButton.Size = UDim2.new(0.4, 0, 0.3, 0)
    enableButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    enableButton.Text = "Enable"
    enableButton.TextColor3 = Color3.new(0, 1, 0)
    enableButton.Font = Enum.Font.SourceSansBold
    enableButton.TextScaled = true
    enableButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    enableButton.Parent = frame

    -- Nút Disable
    local disableButton = Instance.new("TextButton")
    disableButton.Size = UDim2.new(0.4, 0, 0.3, 0)
    disableButton.Position = UDim2.new(0.5, 0, 0.6, 0)
    disableButton.Text = "Disable"
    disableButton.TextColor3 = Color3.new(1, 0, 0)
    disableButton.Font = Enum.Font.SourceSansBold
    disableButton.TextScaled = true
    disableButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    disableButton.Parent = frame

    -- Sự kiện khi nhấn nút Enable
    enableButton.MouseButton1Click:Connect(function()
        toggleNoclip(true)
    end)

    -- Sự kiện khi nhấn nút Disable
    disableButton.MouseButton1Click:Connect(function()
        toggleNoclip(false)
    end)

    -- Tạo nút toggle ngoài
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 50, 0, 50) -- Hình vuông 1:1
    toggleButton.Position = UDim2.new(0, 10, 0, 10) -- Góc trái trên màn hình
    toggleButton.Text = "+"
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.Font = Enum.Font.SourceSansBold
    toggleButton.TextScaled = true
    toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    toggleButton.Parent = screenGui

    -- Sự kiện khi nhấn nút toggle
    local isMenuVisible = true
    toggleButton.MouseButton1Click:Connect(function()
        isMenuVisible = not isMenuVisible
        frame.Visible = isMenuVisible
        toggleButton.Text = isMenuVisible and "-" or "+"
    end)
end
