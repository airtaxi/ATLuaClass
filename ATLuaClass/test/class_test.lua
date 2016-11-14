-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "init" in this case.
local ATLuaClass = require("init")

-- Class test case #1
-- TODO: implement feature

-- local ATLuaClass = require("ATLuaClass.init")
local Math = ATLuaClass.init("Math")

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
--> 15
