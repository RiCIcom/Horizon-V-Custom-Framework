HVCore = {}
HVCore.ServerFunctions = {}
HVCore.ClientFunctions = {}
HVCore.Extras = {}

HVCore.Extras.startframework = function()
    local ResourceName = GetCurrentResourceName()
    if ResourceName ~= "hv_framework" then
        print('Resource name not supported! Please use hv_framework')
        StopResource(ResourceName)
    end
end

HVCore.Extras.Debug = function(system, text)
    if (system == 'server' or system == 'client') and text then
        local message = string.format("[HVCore Debug] [%s] %s", text)
        if system == 'server' then
            print(message)
        elseif system == 'client' then
            TriggerClientEvent('hvcore:clientconsole', -1, message)
        end
    else
        print("[HVCore Debug] Ungültiger Parameter übergeben!.")
    end
end

exports("GetCore", function()
    return HVCore
end)