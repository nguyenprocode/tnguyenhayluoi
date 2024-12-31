repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Danh sách các key và tài khoản hợp lệ, kèm theo thời gian hết hạn
local validKeys = {
    ["TEST-KEY-THANHNGUYEN"] = { 
        users = { "acc_mlem1", "User2" }, 
        expiration = "31/12/2024 17:00:00" -- Thời gian hết hạn
    },
    ["XJKT-6724-MKLP"] = { 
        users = { "" }, 
        expiration = "31/12/2024 17:00:00" 
    },
    ["VGHY-9841-AQWS"] = { 
        users = { "" }, 
        expiration = "31/12/2024 17:00:00" 
    }
}

-- Kiểm tra key của người dùng
getgenv().Key = getgenv().Key or ""

-- Hàm chuyển đổi thời gian từ chuỗi sang đối tượng thời gian
local function parseExpirationTime(expiration)
    local month, day, year, hour, min, sec = expiration:match("(%d%d)/(%d%d)/(%d%d%d%d) (%d%d):(%d%d):(%d%d)")
    return os.time({
        year = tonumber(year),
        month = tonumber(month),
        day = tonumber(day),
        hour = tonumber(hour),
        min = tonumber(min),
        sec = tonumber(sec)
    })
end

-- Hàm kiểm tra key, tài khoản và thời gian hết hạn
local function isValidKey(key, username)
    local keyData = validKeys[key]
    if not keyData then
        return false -- Key không tồn tại
    end

    -- Kiểm tra tài khoản
    local allowedUsers = keyData.users
    for _, user in ipairs(allowedUsers) do
        if username == user then
            -- Kiểm tra thời gian hết hạn
            local expirationTime = parseExpirationTime(keyData.expiration)
            local currentTime = os.time()

            if currentTime > expirationTime then
                return false -- Key đã hết hạn
            end

            return true -- Tài khoản hợp lệ và key chưa hết hạn
        end
    end

    return false -- Tài khoản không khớp
end

-- Lấy tên người chơi hiện tại
local username = game.Players.LocalPlayer.Name

if not isValidKey(getgenv().Key, username) then
    -- Văng game với thông báo lỗi
    game.Players.LocalPlayer:Kick("Key không tồn tại, tài khoản không được phép sử dụng, hoặc key đã hết hạn. Liên hệ: fb.com/Tnguyennekk.")
else
    -- Key và tài khoản hợp lệ, chạy script
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
end
