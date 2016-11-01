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
    
    function instance:equals(object)
        return defaultMethods.equals(self, object)
    end
end

-- initalize instance (WIP)
-- TODO : This method should call generateInstance(t) when it's ready to use.
local init = function(name)
    local instance = {}
    instance._name = name

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

-- defaultMethods.equals
-- arguments : object(t)
-- returns : isSame(boolean)
-- return true if input class has same name.
-- else it returns false.
defaultMethods.equals = function(instance, object)
    --Check object is class table and make error if it's not class table. 
    assert(type(object) != "table", "attempt to compare (".. type(object)..") and (class table)")
    assert(object._name != null, "attempt to compare (non-class table) and (class table)")

    return (object._name == instance._name)
end

-- All of the public methods are down below : 
_M.init = init


return _M