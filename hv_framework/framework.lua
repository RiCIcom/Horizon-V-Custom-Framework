HVCore = {}

local ResourceName = GetCurrentResourceName()
if ResourceName ~= "hv_framework" then
    print('Resource name not supported! Please use hv_framework! Files not Start!') return
end

exports("GetCore", function() return HVCore end)