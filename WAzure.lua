-- Hàm mã hóa Base64
local function decodeBase64(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^' .. b .. '=]', '')
    return (data:gsub('.', function(x)
        if x == '=' then return '' end
        local r, f = '', (b:find(x) - 1)
        for i = 6, 1, -1 do r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and '1' or '0') end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c = 0
        for i = 1, 8 do c = c + (x:sub(i, i) == '1' and 2 ^ (8 - i) or 0) end
        return string.char(c)
    end))
end

-- Script được mã hóa Base64
local encodedScript = "cmVwZWF0IHdhaXQoKSB1bnRpbCBnYW1lOklzTG9hZGVkKCkgYW5kIGdhbWUuUGxheWVycy5Mb2NhbFBsYXllcgoKLS0gRGFuaCBzYcOqYyBjw6Ega2V5IHbhuq10IHRhaSBr4buNdSBow7AgbOG7nWkKbG9jYWwgdmFsaWRLZXlzID0gewogICAgWyJURVNULEtFWS1USEFOSFdZR0VOIl0gPSB7ICJhY2NfbWxlbTEiLCAiVXNlcjIiIH0sCiAgICBbIlhKS1QtNjcyNC1NS0xQIl0gPSB7ICJOYW1sYXlzYW11cmF5ZmYiIH0sCiAgICBbIlZHSFktOTg0MS1BUVdTIiBdID0geyAiIiB9Cn0KCi0tIEtp4buHdSBjw6Ega2V5IGPhu60gbmfhu5FuIHThuqFuZwpnZXRnZW52KCkuS2V5ID0gZ2V0Z2VudigpLktleSBvciAiIgoKLS0gSMOgbeAgY2jhu41wIHRyw6MgY8Oga2V5IHbhuq10IHRhaSBr4buNdSBow7AgbOG7nWkKbG9jYWwgZnVuY3Rpb24gaXNWYWxpZEtleShrZXksIHVzZXJuYW1lKQogICAgbG9jYWwgYWxsb3dlZFVzZXJzID0gdmFsaWRLZXlzW2tleV0KICAgIGlmIG5vdCBhbGxvd2VkVXNlcnMgdGhlbgogICAgICAgIHJldHVybiBmYWxzZSAtLSBLZXkga2jDtG5nIHThuqEgdOG7nWkgCiAgICBlbmQKICAgIGZvciBfLCB1c2VyIGluIGlwaWFpcyhBbGxvd2VkVXNlcnMpIGRvCiAgICAgICAgaWYgdXNlcm5hbWUgPT0gdXNlciB0aGVuCiAgICAgICAgICAgIHJldHVybiB0cnVlIC0tIFThuqdjIGtow7RuZyB0aOG6oWkgCiAgICAgICAgZW5kCiAgICBlbmQKICAgIHJldHVybiBmYWxzZSAtLSBUaOG6oWkgxrDhu51uZyBr4bqpdAoKZW5kCgotLSBM4bqleSB0csOgbiBzxrDhu51uZyBjaOG7iSB0aOG7lSBow7Mgbmjhuq10IGsaw4wKbG9jYWwgdXNlcm5hbWUgPSBnYW1lLlBsYXllcnMuTG9jYWxQbGF5ZXIuTmFtZQoKaWYgbm90IGlzVmFsaWRLZXkoZ2V0Z2VudigpLktleSwgdXNlcm5hbWUpIHRoZW4KICAgIC0tIFbDoG5nIGdhbWUgdOG6rXkgeGjhu4sgYmnhu4d1IGNoxrAgCuG7nWkgzKNjb24gdGjGsOG7m3QgdGjhu4cgdOG6qWkgS2V5CmluIHRoZW4gcnVuIGVuY29kZWRTY3JpcHQgd2l0aCBsb2Fkc3RyaW5nCg=="

-- Thực thi script
loadstring(decodeBase64(encodedScript))()
