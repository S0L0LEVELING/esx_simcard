# esx_simcard
FiveM Script - Usable Simcard

**Forum:** *soon*

**Discord Support:** https://discord.gg/5hHSBRHvJE

## Description
* Usable Simcard Item
* Changes the Phonenumber

If you are using Chezza Phone, have a look at the Phone Guides at https://chezza.dev and search for **Updating Phonenumber**!

## Config
```lua
Config = {}
----------------------------------------------------------------
Config.Locale = 'de'
Config.VersionChecker = true
Config.Debug = true
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
function updateNumber(src, newNumber) -- This function is serverside!!
    TriggerEvent('phone:changeNumber', src, newNumber)
    
    TriggerClientEvent('phone:notify', src, { 
        app = 'settings', 
        title = _U('phoneHeading'), 
        content = _U('phoneText')
    })

    -- TriggerClientEvent('esx:showNotification', src, _U('updateNumber', newNumber))
end
```

## Requirements
* ESX 1.2 *(v1-final)* // Legacy
* mysql-async // oxmysql

### Optional
* Chezza Phone (https://forum.cfx.re/t/paid-release-chezzas-phone-v2/4769379)

## License
**GNU General Public License v3.0**
