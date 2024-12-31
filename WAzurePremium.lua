repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Danh sách các key và tài khoản hợp lệ
local validKeys = {
    ["TEST-KEY-THANHNGUYEN"] = { "User1", "User2" },
    ["SECOND-KEY-EXAMPLE"] = { "User3" },
    ["ANOTHER-VALID-KEY"] = { "User4", "User5", "User6" }
}

-- Kiểm tra key của người dùng
getgenv().Key = getgenv().Key or ""

-- Hàm kiểm tra key và tài khoản có hợp lệ không
local function isValidKey(key, username)
    local allowedUsers = validKeys[key]
    if not allowedUsers then
        return false -- Key không tồn tại
    end
    for _, user in ipairs(allowedUsers) do
        if username == user then
            return true -- Tài khoản hợp lệ
        end
    end
    return false -- Tài khoản không khớp
end

-- Lấy tên người chơi hiện tại
local username = game.Players.LocalPlayer.Name

if not isValidKey(getgenv().Key, username) then
    -- Văng game với thông báo lỗi
    game.Players.LocalPlayer:Kick("Key không tồn tại hoặc tài khoản không được phép sử dụng. Liên hệ: fb.com/Tnguyennekk.")
else
    -- Key và tài khoản hợp lệ, chạy script
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
end
