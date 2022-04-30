Config = {}
----------------------------------------------------------------
Config.Locale = 'de'
Config.VersionChecker = true
Config.Debug = true
----------------------------------------------------------------
-- Chezza Phone v2 // GcPhone // D-Phone
Config.Phone = 'chezza' -- 'chezza', 'gcphone' or 'dphone'
----------------------------------------------------------------
Config.needPhone = true -- Player has to have a phone in inventory
Config.phoneItem = 'phone' -- This should be your phone item
Config.usableItem = 'simcard' -- Add this to your items table in database
Config.removeItem = true -- Set to false if you dont want the item to be deleted after use
Config.StartingDigit = "094" -- the starting digits for phone number // Number would be 094XXXXXX
----------------------------------------------------------------
Config.Database = {
    numberDB = 'phones', -- Table for phonenumbers // Chezza Phone: 'phones' // default: 'users'
    numberTB = 'phone_number'
}
----------------------------------------------------------------
-- Change the Event in this function to the Event that changes the Number in your Phone.
-- If you are using Chezza Phone, have a look at the Phone Guides at https://chezza.dev and search for 'Updating Phonenumber'

-- !!! This function is serverside !!!
function updateNumber(src, newNumber)
    if Config.Phone:match('chezza') then
        TriggerEvent('phone:changeNumber', src, newNumber)
        TriggerClientEvent('phone:notify', src, { 
            app = 'settings', 
            title = _U('phoneHeading'), 
            content = _U('phoneText')
        })
    elseif Config.Phone:match('gcphone') then
        TriggerEvent('gcPhone:allUpdate')
        TriggerClientEvent('esx:showNotification', src, _U('updateNumber', newNumber))
    elseif Config.Phone:match('dphone') then
        TriggerClientEvent("d-phone:client:changenumber", src, newNumber)
        TriggerClientEvent('esx:showNotification', src, _U('updateNumber', newNumber))
    end
end