local _M = {}

-- defaultMethods should be overrided when calling generateInstance.
local defaultMethods = {}

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

defaultMethods.toString = function(instance)
    return tostring(instance);
end

_M.init = init
return _M