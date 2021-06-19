--[[
    simple keyword generator for youtube
]]

local v1 = {
    "Escape From Tarkov",
    "EFT",
    "Tarkov",
}

local v2 = {
    "Cheats",
    "Gameplay",
    "Hacks",
    "Money",
}

local v3 = (function(__v1)
    local _v1 = [[keywords: 
]]
    local _v2 = _v1
    for k, v in pairs(v1) do
        for _k, _v in pairs(v2) do
            local _v3 = (v.." ".._v)
            if (_v1 == _v2) then
                _v1 = (_v1.._v3)
            else
                _v1 = (_v1..", "..(__v1 and "\n" or "").._v3)
            end
        end
    end

    print(_v1)
end)

v3(false) --[[pass true for first argument in order to have new lines after each keyword]]