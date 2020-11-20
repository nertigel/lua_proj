--[[
    Credits to watermalone cause I got a small part of this code from 1 of his projects <3
    usage:
    lua nertigel_uglifier.lua file_name.lua output_name.lua
]]

math.randomseed(os.time())

table_contains = function(ttt, element)
    for _, value in pairs(ttt) do
        if value == element then
            return true
        end
    end
    return false
end
  
local old_randomString = {}
_randomString = function(length)
    local res = ''
    for _i = 1, length do
        local _abc = string.char(math.random(97, 122)) --[[random letter]]
        if ( math.random(1, 3) == 1 ) then --[[1 out of 3 chance to make the letter upper-case]]
            _abc = string.upper(_abc)
        end
        res = res .. _abc
    end

    if table_contains(old_randomString, res) then --[[if the table contains a string that we've generated before then generate a new one with a +1 length]]
        print('nertigel_uglifier.lua: random string failed, re-doing. ('..res..')')
        return _randomString(length + 1)
    end

    table.insert(old_randomString, res) --[[insert the string to the table so it would be checked]]
    return res
end

local _stringsToReplace = {
    --[[
        `_from` is a string in your code that you would like to uglify, for example:
        local pCreateThread = Citizen.CreateThread --now we use pCreateThread in our menu instead of the original CreateThread
    
        `_to` is the string that would replace the `_from` string that i've defined, for example:
        `pCreateThread` will be change to a 20 length random string.
    ]]
    {_from = 'pCreateThread', _to = _randomString(20)},
    --[[
        minify, it is not required but it is recommended to use when publishing your code so it's a bit unreadable.
        people can still use a beautifier on the code but it wouldn't look like it looked before.
    ]]
    {_from = '\r+', _to = ' '},
    {_from = '\n+', _to = ' '},
    {_from = '\t+', _to = ' '},
    
}

--[[
    don't mind this part of the code since you don't really need to mess around with it, the instructions are up there.
]]

local argument_file_name = arg[1]
local argument_output_file_name = arg[2] or 'nertigel_uglifier_done.lua'

if argument_file_name == nil or not argument_file_name or argument_file_name == '' then
    return print('argument not passed: 1, file_name.lua')
end

local _menu_lua_file = io.open(argument_file_name, 'r')
if _menu_lua_file then
    local _code_to_mlf = _menu_lua_file:read('*a')
    print(argument_file_name..': read attempt')

    if _code_to_mlf then
        print(argument_file_name..': found')

        local _write_to_mlf = io.open(argument_output_file_name, 'w+')
        if _write_to_mlf then
            print(argument_output_file_name..': created')

            for _i=1, #_stringsToReplace do
                _code_to_mlf = _code_to_mlf:gsub(_stringsToReplace[_i]._from, _stringsToReplace[_i]._to)
            end
            print(argument_output_file_name..': strings replaced')

            _write_to_mlf:write(_code_to_mlf)
            print(argument_output_file_name..': written')

            _write_to_mlf:close()
            print(argument_output_file_name..': closed')
        else
            print('error opening menu_o.lua using w+')
        end
    else
        print('could not load menu.lua')
    end

    _menu_lua_file:close()
    print(argument_file_name..': closed\nobfuscation finished')
else
    print('could not find '..argument_file_name)
end

collectgarbage()
