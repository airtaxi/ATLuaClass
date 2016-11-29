-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "init" in this case.
local ATLuaClass = require("init")

-- Class test case #1 : Test case for interaction between public method and private method  
-- TODO: implement feature

-- local ATLuaClass = require("ATLuaClass.init")
local Math = ATLuaClass.init("Math")
print("Test case #1 : Public/Private Class")

Math:addMethod({name="add", type="private", abstract=false}, function(self, a, b)
    return a+b
end)

Math:addMethod({name="multiply", type="public", abstract=false}, function(self, a, b)
    local returnVar = 0
    for k = 1, b, 1 do
        returnVar = self.add(returnVar,a)
    end
    return returnVar
end)

-- result : 15
print("Math:multiply(5,3) result : " .. tostring(Math:multiply(5,3)))

-- Class test case #2 : Test case for implementation of abstract method  
-- TODO: implement feature
print("Test case #2 : Abstract Class/Method")

-- Initialize abstract class.
local Math = ATLuaClass.init("Math", {abstract = true})

-- Attempt to add private abstract method.
-- The code below should occurs an error because Java doesn't support private abstract method. 
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="private", abstract=true})
end)
print("Adding private abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Attempt to add abstract method with method implemented. 
-- The code below should occurs an error because Java doesn't support implemented abstract method.
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="public", abstract=true}, function(self, a, b)
        return a+b
    end)
end)

print("Adding implemented abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Attempt to add normal abstract method.
-- The code below should work as expected.
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="public", abstract=true})
end)

print("Adding abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Class test case #3 : Test case for implementation of interface classes  
-- TODO: implement feature
print("Test case #3 : Interface")

-- Initialize interface class.
local Math = ATLuaClass.init("Math", {interface = true})

-- Attempt to add a method with fully implemented. 
-- The code below should occurs an error because Interface doesn't allows to add normal method.
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="public"}, function(self, a, b)
        return a+b
    end)
end)

print("Adding implemented abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Attempt to add abstract method.
-- The code below should work as expected.
-- (Optional) Class type can be omitted.
local isSuccess = pcall(function()
    Math:addMethod({name="add", abstract=true})
end)

print("Adding abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Class test case #4 : Test case for member variables.
-- TODO: implement feature
print("Test case #4 : Member variables")

-- Initialize interface class.
local Math = ATLuaClass.init("Status")

-- Adding public and private member variables
Math:addVariable({name="isTurnOn", type="public"}, false)
Math:addVariable({name="isActivated", type="private"}, false)

Math:addMethod({name="on", type="public"}, function(self)
	Math.isTurnOn = true -- Change public member variable.
	self.isActivated = true -- Access to private member variable and change it.
end)

Math:addMethod({name="off", type="public"}, function(self)
	Math.isTurnOn = false -- Change public member variable.
	self.isActivated = false -- Access to private member variable and change it.
end)

Math:on()
-- isTurnOn : true
print("isTurnOn : " .. tostring(Math.isTurnOn))
-- the code below should prints "isActivated : nil" since it's private member variable
print("isActivated : " .. tostring(Math.isActivated))

Math:off()
-- isTurnOn : false
print("isTurnOn : " .. tostring(Math.isTurnOn))
-- the code below should prints "isActivated : nil" since it's private member variable
print("isActivated : " .. tostring(Math.isActivated))
