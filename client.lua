ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_simcard:useItem')
AddEventHandler('esx_simcard:useItem', function()
    local playerPed = PlayerPedId()
    local genNumber = genNumber()

    ESX.TriggerServerCallback('esx_simcard:checkNumbers', function(isExisting)
        if isExisting then
            TriggerServerEvent('esx_simcard:changeNumberDB', genNumber)
        else
            ESX.ShowNotification(_U('numberExist'))
        end
    end, genNumber)
end)

function genNumber()
    local random = math.random(111111, 999999)
    local number = Config.StartingDigit .. random
    return number
end

function debug(msg)
	if Config.Debug then
		print(msg)
	end
end
