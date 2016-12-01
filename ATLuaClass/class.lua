local _M = {}


local instances = {}
-- TODO : function named get, inherits

local get = function(name)
	return instances[name]
end

local init = function(name, arg)
	-- TODO : implement inherit feature
	local class = {}
	local constructor
	local inheritFrom
	if(type(arg) == "table") then
		inheritFrom = arg
	elseif(type(arg) == "function") then
		constructor = arg
	end
	instances[name] = class
	class.new = function(...)
		local instance = class
		local retInstance = {}
		if(constructor ~= nil) then
			local args = {...}
			constructor(retInstance, unpack(args))
		end
		for k,v in pairs(instance) do
			if type(k) == "string" and type(k) ~= "new" then
				retInstance[k] = v
			end
		end
		instance[#instance+1] = retInstance
		return retInstance
	end
	return class
end

_M.init = init


return _M