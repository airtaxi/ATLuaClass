local _M = {}


local instances = {}
-- TODO : function named inherits

local get = function(name)
	return instances[name]
end

local init = function(name, arg)
	-- TODO : implement inherit feature
	local class = {}
	local constructor
	if(type(arg) == "string") then
		local inheritClass = instances[arg]
		assert(inheritClass ~= nil, "ATLuaClass : inherit class should not be a nil value")
		for k,v in pairs(inheritClass) do
			if type(k) == "string" and type(k) ~= "new" then
				class[k] = v
			end
		end
	elseif(type(arg) == "function") then
		constructor = arg
	end
	instances[name] = class
	class.new = function(...)
		local retInstance = {}
		if(constructor ~= nil) then
			local args = {...}
			constructor(retInstance, unpack(args))
		end
		for k,v in pairs(class) do
			if type(k) == "string" and type(k) ~= "new" then
				retInstance[k] = v
			end
		end
		return retInstance
	end
	return class
end

_M.init = init
_M.get = get


return _M