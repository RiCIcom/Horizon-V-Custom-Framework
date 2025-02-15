HVCore.Extras = {}

HVCore.Extras.Debug = function(system, text)
    if (system == 'server' or system == 'client') and text then
        local message = string.format("[HVCore Debug] [%s] %s", text)
        if system == 'server' then
            print(message)
        elseif system == 'client' then
            --TriggerClientEvent('hvcore:clientconsole', -1, message)
            HVCore.ClientFunctions.debug(message)
        end
    else
        print("[HVCore Debug] Ungültiger Parameter übergeben!.")
    end
end