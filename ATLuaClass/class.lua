local _M = {}


local instances = {}
local privates = {}
-- TODO : function named inherits

local get = function(name)
	return instances[name]
end

local checkInnerFunc = function(name)
	if name == "new" or name == "setPrivate" or name == "getPrivate" then
		return true
	else
		return false
	end
end

local init = function(name, arg, arg2)
	-- TODO : implement inherit feature
	local class = {}
	local privateValues = {}
	local constructor = arg2
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
	
	class.setPrivate = function(varName, varValue)
		local from = debug.getinfo(2).func
		
		assert(from ~= nil, "ATLuaClass : private value should be accessed from class methods")
		local exists = false
		for k,v in pairs(class) do
			if type(v) == "function" then
				if(from == v) then
					exists = true
				end
			end
		end
		if(exists ~= true) then
			error("ATLuaClass : private value should be accessed from class methods")
		else
			privateValues[varName] = varValue
		end
	end
	
	class.getPrivate = function(varName, varValue)
		local from = debug.getinfo(2).func
		
		assert(from ~= nil, "ATLuaClass : private value should be accessed from class methods")
		local exists = false
		for k,v in pairs(class) do
			if type(v) == "function" then
				if(from == v) then
					exists = true
				end
			end
		end
		if(exists ~= true) then
			error("ATLuaClass : private value should be accessed from class methods")
		else
			return privateValues[varName]
		end
	end
	
	class.new = function(...)
		local retInstance = {}
		if(constructor ~= nil) then
			local args = {...}
			constructor(retInstance, unpack(args))
		end
		for k,v in pairs(class) do
			if type(k) == "string" and k ~= "new" then
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