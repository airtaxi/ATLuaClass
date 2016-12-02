-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "class" in this case.
local ATLuaClass = require("class")

-- test case #1 : Create instance
print("test case #1 : Create instance")
local Math = ATLuaClass.init("Math")

function Math:add(a,b)
    self.addCallTime = (self.addCallTime and self.addCallTime +1 or 1)  
    return a+b
end

function Math:printAddCallTime()
    print(self.addCallTime)
end

local instMath1 = Math.new()
local instMath2 = Math.new()
print("instMath1:add(3,9) = " .. tostring(instMath1:add(3,9))) -- 12
print("instMath2:add(8,31) = " .. tostring(instMath2:add(8,31))) -- 39
print("instMath2:add(12,27) = " .. tostring(instMath2:add(12,27))) -- 39

print("instMath1:printAddCallTime()") -- 1
instMath1:printAddCallTime()
print("instMath1:printAddCallTime()") -- 2
instMath2:printAddCallTime()

print("")
-- test case #2 : Using constructor
print("test case #2 : Using constructor")
local Math = ATLuaClass.init("Math", function(self, myString)
	self.myString = myString
end)

function Math:add(a,b)
	self.addCalledTime = self.addCalledTime and self.addCalledTime + 1 or 0
	return a+b
end

function Math:printMyString()
	print(self.myString)
end

local instMath1 = Math.new("abc")
local instMath2 = Math.new("def")

print("instMath1:add(3,5) = " .. tostring(instMath1:add(3,5))) -- 8
print("instMath1:printMyString()") -- abc
instMath1:printMyString()

print("instMath2:add(3,5) = " .. tostring(instMath2:add(3,5))) -- 8
print("instMath2:printMyString()") -- def
instMath2:printMyString()