--[[
    the code shouldn't really matter since it's ghetto anyways(my style + haven't coded in a while)
    currently only picks `Buying` with its' `ID` and `Cost`
    place your data at `v1` right below(old data is just an example I used)
    broken data provided @ v1 will cause an error
]]
local v0 = "Buying_" -- in case u want to use `Selling_`
local v1 = [[
Buying_0_ID 37544
Buying_0_Cost 740
Buying_1_ID 37541
Buying_1_Cost 1150

Buying_0_ID 37554
Buying_0_Cost 843
Buying_1_ID 37561
Buying_1_Cost 843
Buying_2_ID 37542
Buying_2_Cost 1378
Buying_3_ID 37545
Buying_3_Cost 19447

Buying_0_ID 37556
Buying_0_Cost 192755
Buying_1_ID 37555
Buying_1_Cost 192755
Buying_2_ID 37477
Buying_2_Cost 32549
Buying_3_ID 37300
Buying_3_Cost 59105
Buying_4_ID 37315
Buying_4_Cost 62498
Buying_5_ID 37343
Buying_5_Cost 13468

Buying_0_ID 37408
Buying_0_Cost 158087
Buying_1_ID 37431
Buying_1_Cost 124892
Buying_2_ID 37425
Buying_2_Cost 94621
Buying_3_ID 37426
Buying_3_Cost 75137
]]

local v2 = function(source, delimiters)
	local elements = {}
	local pattern = '([^'..delimiters..']+)'
	string.gsub(source, pattern, function(value) elements[#elements + 1] = value end)
	return elements
end

local v3 = v2(v1, '\n')
local v4 = {}
local ai = 0

for key, value in pairs(v3) do 
    local b1 = v0.."%d+_ID "
    local b2 = v0.."%d+_Cost "
    if (string.match(value, b1)) then
        local b3 = string.gsub(value, b1, "")
        if not (v4[ai]) then v4[ai] = {} end
        v4[ai]["ID"] = b3
        local b4 = v3[key + 1]
        if (string.match(b4, b2)) then
            local b5 = string.gsub(b4, b2, "")
            v4[ai]["Cost"] = b5
        end
        
        ai = ai + 1
    end
end
for key, value in pairs(v4) do 
    local b1 = v0..key.."_"
    print(b1.."ID "..value["ID"])
    print(b1.."Cost "..value["Cost"])
end
