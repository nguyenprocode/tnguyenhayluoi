repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local HttpService = game:GetService("HttpService")

-- Danh sách các key theo username Roblox
local usernameKeys = {
    ["TEST-KEY-THANHNGUYEN"] = { "User1", "User2" },
    ["USER-KEY-2"] = { "User3", "User4" }
}

-- Danh sách các key theo địa chỉ IP
local ipKeys = {
    ["IP-KEY-1"] = { "171.251.235.80", "203.0.113.20" },
    ["IP-KEY-2"] = { "203.0.113.50" }
}

-- Hàm lấy địa chỉ IP thiết bị
local function getIPAddress()
    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://api64.ipify.org?format=json"))
    end)
    if success and response and response.ip then
        return response.ip
    else
        return nil
    end
end

-- Kiểm tra key theo username Roblox
local function isValidUsernameKey(key, username)
    local allowedUsers = usernameKeys[key]
    if not allowedUsers then return false end
    for _, user in ipairs(allowedUsers) do
        if username == user then
            return true
        end
    end
    return false
end

-- Kiểm tra key theo địa chỉ IP
local function isValidIPKey(key, ip)
    local allowedIPs = ipKeys[key]
    if not allowedIPs then return false end
    for _, allowedIP in ipairs(allowedIPs) do
        if ip == allowedIP then
            return true
        end
    end
    return false
end

-- Kiểm tra key người dùng
getgenv().Key = getgenv().Key or ""
local username = game.Players.LocalPlayer.Name
local ipAddress = getIPAddress()

if usernameKeys[getgenv().Key] and not isValidUsernameKey(getgenv().Key, username) then
    -- Key yêu cầu username Roblox không hợp lệ
    game.Players.LocalPlayer:Kick("Key không tồn tại hoặc tài khoản không hợp lệ. Liên hệ: fb.com/Tnguyennekk.")
elseif ipKeys[getgenv().Key] and not isValidIPKey(getgenv().Key, ipAddress) then
    -- Key yêu cầu IP không hợp lệ
    game.Players.LocalPlayer:Kick("Key không tồn tại hoặc IP không hợp . Liên hệ: fb.com/Tnguyennekk.")
else
    -- Key hợp lệ, chạy script
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
end
