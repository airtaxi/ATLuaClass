-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "class" in this case.

-- test case #1 : Basic access of private member variable.
local ATLuaClass = require("class")
print("test case #1 : Basic access of private member variable.")
local TestClass = ATLuaClass.init("Class")

function TestClass:addPrivate()
	self.setPrivate("var1", 123)
end
function TestClass:getPrivateValue()
	local retVar = self.getPrivate("var1")
	return retVar
end

local testClass = TestClass:new()

testClass:addPrivate()

print("print(testClass.getPrivate(\"var1\")) => " ..
((select(1,pcall(function() print(testClass.getPrivate("var1")) end))) and "" or "Error"))

print("print(testClass:getPrivateValue() => " .. testClass:getPrivateValue())