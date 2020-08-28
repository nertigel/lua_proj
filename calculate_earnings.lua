calculate_work_time = function(start, finish)
    if (start == nil or finish == nil) then
        return print('calculate_work_time failed')
    end

    return (finish - start)
end

local data = {
    nis_per_hour = 25,
    stored_earnings = 0,
    {date = '13.01.2420', start = 7, finish = 17},
    {date = '30.04.2421', start = 15, finish = 23.5},
}

for key, value in pairs(data) do
    if (type(value) ~= 'table') then 
        return 
    end

    local total_hours = (calculate_work_time(value.start, value.finish))
    local amount_earned = (total_hours * data.nis_per_hour)
    data.stored_earnings = (data.stored_earnings + amount_earned)
    print('Date: '..value.date..' | Shift Start: '..value.start..' | Shift Finish: '..value.finish..' | Total Hours: '..total_hours..' (Earned: '..amount_earned..')')

    if (key == #data) then
        print('Totally earned: NIS'..data.stored_earnings..' / $'..(data.stored_earnings * 0.28))
    end
end