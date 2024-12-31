repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Danh sách các key hợp lệ
local validKeys = {
    "TEST-KEY-THANHNGUYEN",
    "SECOND-KEY-EXAMPLE",
    "ANOTHER-VALID-KEY"
}

-- Kiểm tra key của người dùng
getgenv().Key = getgenv().Key or ""

-- Hàm kiểm tra key có hợp lệ hay không
local function isValidKey(key)
    for _, validKey in ipairs(validKeys) do
        if key == validKey then
            return true
        end
    end
    return false
end

if not isValidKey(getgenv().Key) then
    -- Văng game với thông báo lỗi
    game.Players.LocalPlayer:Kick("Key không hợp lệ. Vui lòng thử lại hoặc liên hệ với Facebook: fb.com/Tnguyennekk.")
else
    -- Key đúng, chạy script
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
end
