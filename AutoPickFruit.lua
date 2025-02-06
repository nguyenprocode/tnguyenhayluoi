ServerHopTimer = 5
TeleportSafe = true
Webhook = "Your Webhook Here"
_G.Version = "Fruit Farm"

local CoreGui = game:GetService("CoreGui")
local existingGuis = {} -- Lưu GUI có sẵn trước khi script chạy

-- Lưu lại tất cả GUI hiện có trước khi script chạy
for _, v in ipairs(CoreGui:GetChildren()) do
    existingGuis[v] = true
end

-- Chạy script chính
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
end)

-- Nếu script chạy thành công, tìm GUI mới và ẩn chúng
if success then
    for _, v in ipairs(CoreGui:GetChildren()) do
        if not existingGuis[v] and (v:IsA("ScreenGui") or v:IsA("BillboardGui") or v:IsA("SurfaceGui")) then
            v.Enabled = false -- Ẩn GUI
        end
    end
else
    warn("Lỗi khi tải script: " .. tostring(result))
end
