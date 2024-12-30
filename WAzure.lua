repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Key cần thiết để sử dụng script
local requiredKey = "TEST-KEY-THANHNGUYEN"

-- Kiểm tra key của người dùng
getgenv().Key = getgenv().Key or ""

if getgenv().Key ~= requiredKey then
    -- Hiện thông báo lỗi nếu key không đúng
    game.StarterGui:SetCore("SendNotification", {
        Title = "NO KEY",
        Text = "Key không đúng! Game sẽ đóng ngay bây giờ.",
        Duration = 5
    })
    wait(5)
    game:Shutdown() -- Văng game
else
    -- Key đúng, chạy script
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
end
