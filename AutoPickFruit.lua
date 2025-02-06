ServerHopTimer = 5
TeleportSafe = true
Webhook = "Your Webhook Here"
_G.Version="Fruit Farm"

-- Theo dõi GUI được tạo bởi script
local oldInstanceNew
oldInstanceNew = hookmetamethod(game, "__newindex", function(self, key, value)
    if key == "Parent" and value == game:GetService("CoreGui") then
        if self:IsA("ScreenGui") or self:IsA("BillboardGui") or self:IsA("SurfaceGui") then
            self:Destroy()
        end
    end
    return oldInstanceNew(self, key, value)
end)

-- Tải script chính
loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/main/Script"))()
