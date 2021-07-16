math.randomseed(os.time())

local currency_symbol = "NIS "
local work_days = {
    {["hours"] = 7, ["deductions"] = 30, ["per_hour_payment"] = 29.12, ["bonuses"] = true},
    {["hours"] = 14, ["deductions"] = 30, ["per_hour_payment"] = 29.12, ["bonuses"] = true},
}
c_day = 0 --[[global ffs]]
local _print = print
print = function(...)
    _print(c_day.." - "..(...))
end

for key, value in pairs(work_days) do
    c_day = key
    print("Calculation for day: "..key.."\n")
    local hours = (value["hours"] and tonumber(value["hours"]) or value["hours"])
    if (hours == nil or type(hours) ~= 'number') then
        print('\nargument not passed: 1, hours for day: '..key)
        print("setting hours to default (8)\n")
        hours = 8
    end

    local per_hour_payment = value["per_hour_payment"]
    if (per_hour_payment == nil or type(per_hour_payment) ~= 'number') then
        print('argument not passed: 2, per_hour_payment')
        print("setting per_hour_payment to default (29.12)\n")
        per_hour_payment = 29.12
    end

    local _bonuses = value["bonuses"]
    value["total"] = 0
    for _key=1, hours do
        local lsd = ((_key <= 9) and "0"..tostring(_key) or _key)
        if (_key <= 8) then
            local _added = (per_hour_payment)
            value["total"] = value["total"] + _added
            print("Hour: "..lsd.." | Added: "..currency_symbol.._added.." | Total: "..currency_symbol..value["total"].." | Extra: 0%")
        elseif (_key > 8 and _key <= 10) then
            local _added = (_bonuses and (per_hour_payment * 1.25) or (per_hour_payment))
            value["total"] = value["total"] + _added
            print("Hour: "..lsd.." | Added: "..currency_symbol.._added.." | Total: "..currency_symbol..value["total"]..(_bonuses and (" | Extra: 25%") or (" | Extra: 0%")))
        elseif (_key > 10) then
            local _added = (_bonuses and (per_hour_payment * 1.50) or (per_hour_payment))
            value["total"] = value["total"] + _added
            print("Hour: "..lsd.." | Added: "..currency_symbol.._added.." | Total: "..currency_symbol..value["total"]..(_bonuses and (" | Extra: 50%") or (" | Extra: 0%")))
        end
    end
    local deductions = value["deductions"]
    if (type(deductions) == 'number' and deductions > 0) then
        print("Deductions: "..currency_symbol..deductions)
        value["total"] = value["total"] - deductions
    end

    print("Total: "..currency_symbol..value["total"])
end

local _total = 0
for key, value in pairs(work_days) do
    _total = _total + value["total"]
end
c_day = "Total"
print(currency_symbol.._total)