--[[
    simple keyword generator for youtube
]]
math.randomseed(os.time())

local v1 = {
    "Escape From Tarkov",
    "EFT",
    "Tarkov",
}

local v2 = {
    "Cheat",
    "Cheater",
    "Gameplay",
    "Hack",
    "Hacker",
    "Money",
    "Bypass",
    "Exploit",
    "Wallhack",
    "Aimbot",
    "ESP",
    "Radar",
    "Speed",
    "Montage",
    "Edit",
    "Pre-wipe",
    "Event",
    "Loot",
    "1.12.9",
}

local v3 = (function(__v1)
    local _v1 = [[keywords: 
]]
    local _v2 = _v1
    local _v3 = 0
    for k, v in pairs(v1) do
        for _k, _v in pairs(v2) do
            local _v4 = (v.." ".._v)
            if (_v1 == _v2) then
                _v1 = (_v1.._v4)
            else
                _v1 = (_v1..", "..(__v1 and "\n" or "").._v4)
            end
            _v3 = _v3 + 1
        end
    end

    print("Generated keywords (".._v3..")")
    print(_v1)
end)

v3(false) --[[pass true for first argument in order to have new lines after each keyword]]