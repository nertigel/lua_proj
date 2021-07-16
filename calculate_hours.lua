math.randomseed(os.time())

local hours = arg[1]
local per_hour_payment = arg[2]
local currency_symbol = "NIS "
local deductions = 30

hours = (hours and tonumber(hours) or hours)
if (hours == nil or type(hours) ~= 'number') then
    print('\nargument not passed: 1, hours')
    print("setting hours to default (8)\n")
    hours = 8
end

if (per_hour_payment == nil or type(per_hour_payment) ~= 'number') then
    print('argument not passed: 2, per_hour_payment')
    print("setting per_hour_payment to default (29.12)\n")
    per_hour_payment = 29.12
end

local total_payment = 0
for key=1, hours do
    local _key = ((key <= 9) and "0"..tostring(key) or key)
    if (key <= 8) then
        local _added = (per_hour_payment)
        total_payment = total_payment + _added
        print("Hour: ".._key.." | Added: "..currency_symbol.._added.." | Total: "..currency_symbol..total_payment.." | Extra: 0%")
    elseif (key > 8 and key <= 10) then
        local _added = (per_hour_payment * 1.25)
        total_payment = total_payment + _added
        print("Hour: ".._key.." | Added: "..currency_symbol.._added.." | Total: "..currency_symbol..total_payment.." | Extra: 25%")
    elseif (key > 10) then
        local _added = (per_hour_payment * 1.50)
        total_payment = total_payment + _added
        print("Hour: ".._key.." | Added: "..currency_symbol.._added.." | Total: "..currency_symbol..total_payment.." | Extra: 50%")
    end
end
if (deductions ~= 0 and type(deductions) == 'number') then
    print("Deductions: "..currency_symbol..deductions)
    total_payment = total_payment - deductions
end
print("You shall be paid: "..currency_symbol..total_payment)