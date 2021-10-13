local QBCore = exports['qbr-core']:GetCoreObject()
InBank = false
blips = {}
local banks
local showing, playerLoaded = false, false

RegisterNetEvent('qbr-banking:client:syncBanks')
AddEventHandler('qbr-banking:client:syncBanks', function(data)
    banks = data
    if showing then
        showing = false
    end
end)


function openAccountScreen()
    QBCore.Functions.TriggerCallback('qbr-banking:getBankingInformation', function(banking)
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
    QBCore.Functions.TriggerCallback('qbr-banking:getBankingInformation', function(infor)
        InBank = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            status = "refreshatm",
            information = infor
        })
    end)
end

RegisterNetEvent('qbr-banking:openBankScreen')
AddEventHandler('qbr-banking:openBankScreen', function()
    openAccountScreen()
end)

CreateThread(function()
    for k,v in pairs(Config.BankLocations) do
        if Config.BankLocations[k].bankType == "BANKS" then
            exports['qbr-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qbr-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")

        elseif Config.BankLocations[k].bankType == "BANKS2" then
            exports['qbr-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qbr-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")

        elseif Config.BankLocations[k].bankType == "BANKS3" then
            exports['qbr-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qbr-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")

        elseif Config.BankLocations[k].bankType == "BANKS4" then
            exports['qbr-prompts']:createPrompt(v.name, v.coords, 0xCEFD9220, 'Open BANK', {
                type = 'client',
                event = 'qbr-banking:openBankScreen',
                args = { false, true, false },
            })
            local openAccountScreen = N_0x554d9d53f696d002(1664425300, Config.BankLocations[k].coords)
            SetBlipSprite(openAccountScreen, 1195729388, 1)
            SetBlipScale(openAccountScreen, 0.7)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "BANKY")
            
        end
    end
end)

RegisterNetEvent('qbr-banking:transferError')
AddEventHandler('qbr-banking:transferError', function(msg)
    SendNUIMessage({
        status = "transferError",
        error = msg
    })
end)

RegisterNetEvent('qbr-banking:successAlert')
AddEventHandler('qbr-banking:successAlert', function(msg)
    SendNUIMessage({
        status = "successMessage",
        message = msg
    })
end)
