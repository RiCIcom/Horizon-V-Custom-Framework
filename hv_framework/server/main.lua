local restartDelay = 15
local isRestarting = true
local startTime = nil

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        HVCore.Extras.startframework()
        isRestarting = true
        startTime = GetGameTimer()
        Citizen.SetTimeout(restartDelay * 1000, function()
            isRestarting = false
        end)
    end
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    print('Connecting: ' .. name .. '^7')
    deferrals.defer()
    if isRestarting then
        local timeLeft = restartDelay - ((GetGameTimer() - startTime) / 1000)
        if timeLeft > 0 then
            deferrals.update("Wait for Framework... " .. math.ceil(timeLeft) .. " seconds left")
            while timeLeft > 0 do
                Citizen.Wait(1000)
                timeLeft = timeLeft - 1
                deferrals.update("Wait for Framework... " .. math.ceil(timeLeft) .. " seconds left")
            end
        end
    end
    deferrals.done()
end)