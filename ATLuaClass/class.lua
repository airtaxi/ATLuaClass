local _M = {}

-- defaultMethods should be overrided when calling generateInstance.
local defaultMethods = {}

-- initalize instance (WIP)
-- TODO : This method should call generateInstance(t) when it's ready to use.
local init = function()
    local instance = {}
end

local generateInstance = function(initInstance)
    -- Since instance system of lua 5.1 doesn't support iterating
    -- All methods should be overrided manually.
    
    function instance:tostring()
        return defaultMethods.tostring(self)
    end
end


-- defaultMethods.tostring
-- arguments : none
-- returns : Table fingerprint(table), Metatable fingerprint(table)
-- returns fingerprint of instance and its metatable.
defaultMethods.toString = function(instance)
    return tostring(instance), getmetatable(instance);
end

-- All of the public methods are down below : 
_M.init = init


return _M