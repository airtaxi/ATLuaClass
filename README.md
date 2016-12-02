# ATLuaClass

ATLuaClass is a object-oriented class system module.

#### USAGE

###### HOW TO IMPORT MODULE
- Importing ATLuaClass is simple. The example code is down below : 
```lua
local ATLuaClass = require("ATLuaClass.init")
```

###### HOW TO INITALIZE CLASS
- You can initalize  class via init function.
- And you can create instance by (your_class_variable).new() 
- The example code is down below : 
```lua
local Math = ATLuaClass.init("Math")
local instMath1 = Math.new()
local instMath2 = Math.new()
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
print(instMath1(3,9)) -- 12
print(instMath2(8,31)) -- 39
print(instMath2(12,27)) -- 39

print(instMath1:printAddCallTime()) -- 1
print(instMath1:printAddCallTime()) -- 2
```

###### HOW TO USE CONSTRUCTOR
- You can add constructor function to second parameter with passing 'self' parameter at first when initalize class   
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
print(instMath1:printMyString()) -- abc

print(instMath2:add(3,5)) -- 8
print(instMath2:printMyString()) -- def
```

#### TODO
- Implement inherit feature.

### Caution
- This module is work in progress. (this will deleted if this module would usable later)

Developer
----
이호원 (Howon Lee) a.k.a hoyo321 or kck4156, airtaxi

License
----
Apache License Version 2.0