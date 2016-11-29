local _M = {}

-- defaultMethods should be overrided when calling generateInstance.
local defaultMethods = {}


local generateInstance = function(instance)
    -- Since instance system of lua 5.1 doesn't support iterating
    -- All methods should be overrided manually.
    
    function instance:tostring()
        return defaultMethods.tostring(self)
    end
    
    function instance:equals(object)
        return defaultMethods.equals(self, object)
    end
end

-- initalize instance (WIP)
-- TODO : This method should call generateInstance(t) when it's ready to use.
local init = function(name, option)
    local instance = {}
    instance.__name = name

    -- generateInstance(instance)
	
	return instance
end

-- defaultMethods.tostring
-- arguments : none
-- returns : Table fingerprint(table), Metatable fingerprint(table)
-- returns fingerprint of instance and its metatable.
defaultMethods.toString = function(instance)
    return tostring(instance), getmetatable(instance);
end

-- defaultMethods.equals
-- arguments : object(t)
-- returns : isSame(boolean)
-- return true if input class has same name.
-- else it returns false.
defaultMethods.equals = function(instance, object)
    --Check object is class table and make error if it's not class table. 
    assert(type(object) == "table", "attempt to compare (".. type(object)..") and (class table)")
    assert(object.__name ~= nil, "attempt to compare (non-class table) and (class table)")

    return (object.__name == instance.__name)
end

-- All of the public methods are down below : 
_M.init = init


return _M