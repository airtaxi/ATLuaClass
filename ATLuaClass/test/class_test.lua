-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "class" in this case.
local ATLuaClass = require("class")

local Math = ATLuaClass.init("Math", function(self, myString)
	print("MyString = " .. tostring(myString))
	self.myString = myString
end)

function Math:add(a,b)
	self.addCalledTime = self.addCalledTime and self.addCalledTime + 1 or 0
	return a+b
end

function Math:printMyString()
	print(self.myString)
end

local instanceMath = Math.new("abc")
local instanceMath2 = Math.new("def")

print(instanceMath:add(3,5))
print(instanceMath:printMyString())

print(instanceMath2:add(3,5))
print(instanceMath2:printMyString())