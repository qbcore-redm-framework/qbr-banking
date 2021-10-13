local QBCore = exports['qb-core']:GetCoreObject()
InBank = false
blips = {}
local banks
local showing, playerLoaded = false, false

RegisterNetEvent('qb-banking:client:syncBanks')
AddEventHandler('qb-banking:client:syncBanks', function(data)
    banks = data
    if showing then
        showing = false
    end
end)


function openAccountScreen()
    QBCore.Functions.TriggerCallback('qb-banking:getBankingInformation', function(banking)
        if banking ~= nil then
            InBank = true
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "openbank",
                information = banking
            })

            TriggerEvent("debug", 'Banking: Open UI', 'success')
        end        
    end)
end

function atmRefresh()
    QBCore.Functions.TriggerCallback('qb-banking:getBankingInformation', function(infor)
        InBank = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            status = "refreshatm",
            information = infor
        })
    end)
end

RegisterNetEvent('qb-banking:openBankScreen')
AddEventHandler('qb-banking:openBankScreen', function()
    openAccountScreen()
end)

CreateThread(function()
    for k,v in pairs(Config.BankLocations) do
        if Config.BankLocations[k].bankType == "BANKS" then
            exports['qb-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qb-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")

        elseif Config.BankLocations[k].bankType == "BANKS2" then
            exports['qb-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qb-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")

        elseif Config.BankLocations[k].bankType == "BANKS3" then
            exports['qb-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qb-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")

        elseif Config.BankLocations[k].bankType == "BANKS4" then
            exports['qb-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qb-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")
            
        end
    end
end)

RegisterNetEvent('qb-banking:transferError')
AddEventHandler('qb-banking:transferError', function(msg)
    SendNUIMessage({
        status = "transferError",
        error = msg
    })
end)

RegisterNetEvent('qb-banking:successAlert')
AddEventHandler('qb-banking:successAlert', function(msg)
    SendNUIMessage({
        status = "successMessage",
        message = msg
    })
end)
