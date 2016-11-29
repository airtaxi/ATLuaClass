-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "init" in this case.
local ATLuaClass = require("init")

-- Class test case #1 : Test case for interaction between public method and private method  
-- TODO: implement feature

-- local ATLuaClass = require("ATLuaClass.init")
local Math = ATLuaClass.init("Math")
print("Test case #1 : Public/Private Class")

Math:addMethod({name="add", type="private", isAbstract=false}, function(this, a, b)
    return a+b
end)

Math:addMethod({name="multiply", type="public", isAbstract=false}, function(this, a, b)
    local returnVar = 0
    for(i = 1, b, 1) do
        returnVar = this.add(returnVar,a)
    end
    return returnVar
end)

print(Math:multiply(5,3))

-- Class test case #2 : Test case for implementation of abstract method  
-- TODO: implement feature
print("Test case #2 : Abstract Class/Method")

-- Initialize abstract class.
local Math = ATLuaClass.init("Math", {isAbstract = true})

-- Attempt to add private abstract method.
-- The code below should occurs an error because Java doesn't support private abstract method. 
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="private", isAbstract=true})
end)
print("Adding private abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Attempt to add abstract method with method implemented. 
-- The code below should occurs an error because Java doesn't support implemented abstract method.
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="public", isAbstract=true}, function(this, a, b)
        return a+b
    end)
end)

print("Adding implemented abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Attempt to add normal abstract method.
-- The code below should work as expected.
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="public", isAbstract=true})
end)

print("Adding abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Class test case #3 : Test case for implementation of interface classes  
-- TODO: implement feature
print("Test case #3 : Interface")

-- Initialize interface class.
local Math = ATLuaClass.init("Math", {isInterface = true})

-- Attempt to add private abstract method.
-- The code below should occurs an error because Java doesn't support private abstract method. 
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="private", isAbstract=true})
end)
print("Adding private abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Attempt to add abstract method with method implemented. 
-- The code below should occurs an error because Java doesn't support implemented abstract method.
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="public", isAbstract=true}, function(this, a, b)
        return a+b
    end)
end)

print("Adding implemented abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))

-- Attempt to add normal abstract method.
-- The code below should work as expected.
local isSuccess = pcall(function()
    Math:addMethod({name="add", type="public", isAbstract=true})
end)

print("Adding abstract method " .. (isSuccess and "SUCCESS!" or "FAILED!"))