ServerHopTimer = 5
TeleportSafe = true
Webhook = "Your Webhook Here"
_G.Version="Fruit Farm"

-- Xóa toàn bộ GUI
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") or v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
        v:Destroy()
    end
end

-- Tải script chính
loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
