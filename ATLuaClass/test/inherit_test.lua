-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "class" in this case.
local ATLuaClass = require("class")

-- test case #1 : Basic inherit
print("test case #1 : Basic inherit")

local Math = ATLuaClass.init("Math")

function Math:add(a,b)  
    return a+b
end

local Math2 = ATLuaClass.init("Math2", "Math")
function Math2:multiply(a,b)
	local returnVar = 0
	for k = 1, b, 1 do
		returnVar = self:add(returnVar, a)
	end
	return returnVar
end

local math = Math.new()
local math2 = Math2.new()

print("math:add(1,5) = " .. tostring(math:add(1,5))) -- 6
print("math2:add(1,5) = " .. tostring(math2:add(1,5))) -- 6
print("math2:multiply(2,5) = " .. tostring(math2:multiply(2,5))) -- 10

print("")
-- test case #2 : Inherit with constructor
print("test case #2 : Inherit with constructor")

local Class = ATLuaClass.init("Class",function(self, var)
	self.var = var or "foo"
end)

function Class:getSelfVar(a,b)
	return self.var
end

local Class2 = ATLuaClass.init("Class2", "Class",function(self, var)
	self.var = var or "bar"
end)

local class = Class.new()
local class_2 = Class.new("foo2")
local class2 = Class2.new()
local class2_2 = Class2.new("bar2")

print("class:getSelfVar() = " .. class:getSelfVar()) -- abc
print("class_2:getSelfVar() = " .. class_2:getSelfVar()) -- abc2
print("class2:getSelfVar() = " .. class2:getSelfVar()) -- def
print("class2_2:getSelfVar() = " .. class2_2:getSelfVar()) -- def2