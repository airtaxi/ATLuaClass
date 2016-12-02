# ATLuaClass

ATLuaClass is a object-oriented class system module.

#### USAGE

###### HOW TO IMPORT MODULE
- Importing ATLuaClass is simple. The example code is down below : 
```lua
local ATLuaClass = require("ATLuaClass.init")
```

###### HOW TO INITIALIZE CLASS
- You can initialize  class via init function.
- And you can create instance by (your_class_variable).new() 
- The example code is down below : 
```lua
local Math = ATLuaClass.init("Math")
```

###### HOW TO CREATE INSTANCE
- You can create/add member variable by access 'self' table on every methods.
- The example code is down below : 
```lua
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
print(instMath1:add(3,9)) -- 12
print(instMath2:add(8,31)) -- 39
print(instMath2:add(12,27)) -- 39

instMath1:printAddCallTime() -- 1
instMath2:printAddCallTime() -- 2
```

###### HOW TO USE CONSTRUCTOR
- You can add constructor function to second parameter with passing 'self' parameter at first when initialize class   
- 'self' means instance it self (as 'table')
- The example code is down below : 
```lua
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

local instMath1 = Math.new("abc")
local instMath2 = Math.new("def")

print(instMath1:add(3,5)) -- 8
instMath1:printMyString() -- abc

print(instMath2:add(3,5)) -- 8
instMath2:printMyString() -- def
```
###### HOW TO INHERIT CLASS
- You can inherit class by passing class name at second argument when initialize the class.
- The example code is down below :
```lua
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

print(math:add(1,5)) -- 6
print(math2:add(1,5)) -- 6
print(math2:multiply(2,5)) -- 10
```
###### HOW TO INHERIT CLASS WITH CONSTRUCTOR
- You can declare a constructor when inherit a class by passing the constructor function to third argument.
- The example code is down below :
```lua
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

print(class:getSelfVar()) -- abc
print(class_2:getSelfVar()) -- abc2
print(class2:getSelfVar()) -- def
print(class2_2:getSelfVar()) -- def2
```

Developer
----
이호원 (Howon Lee) a.k.a hoyo321 or kck4156, airtaxi

License
----
Apache License Version 2.0