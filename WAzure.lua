repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Key cần thiết để sử dụng script
local requiredKey = "TEST-KEY-THANHNGUYEN"

-- Kiểm tra key của người dùng
getgenv().Key = getgenv().Key or ""

if getgenv().Key ~= requiredKey then
    -- Văng game với thông báo lỗi
    game.Players.LocalPlayer:Kick("Invalid key. Please try again or contact Facebook: fb.com/Tnguyennekk. (Error code: 401)")
else
    -- Key đúng, chạy script
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
end
