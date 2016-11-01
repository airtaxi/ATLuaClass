local _M = {}

-- defaultMethods should be overrided when calling generateInstance.
local defaultMethods = {}


local generateInstance = function(initInstance)
    -- Since instance system of lua 5.1 doesn't support iterating
    -- All methods should be overrided manually.
    
    function instance:tostring()
        return defaultMethods.tostring(self)
    end
    
    function instance:hashCode()
        return defaultMethods.hashCode(self)
    end
end

-- initalize instance (WIP)
-- TODO : This method should call generateInstance(t) when it's ready to use.
local init = function()
    local instance = {}
    
    -- generateInstance(instance)
end

-- defaultMethods.tostring
-- arguments : none
-- returns : Table fingerprint(table), Metatable fingerprint(table)
-- returns fingerprint of instance and its metatable.
defaultMethods.toString = function(instance)
    return tostring(instance), getmetatable(instance);
end

-- defaultMethods.hashCode()
-- arguments : none
-- returns : Table fingerprint(table), Metatable fingerprint(table)
-- returns fingerprint of instance and its metatable. (same as toString)
defaultMethods.hashCode = defaultMethods.tostring

-- All of the public methods are down below : 
_M.init = init


return _M