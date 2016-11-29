# ATLuaClass

ATLuaClass is a object-oriented class system module.

#### USAGE

###### HOW TO IMPORT MODULE
- Importing ATLuaClas is simple. The example code is down below : 
```lua
local ATLuaClass = require("ATLuaClass.init")
```

###### HOW TO ADD METHOD
- You should add 'self' parameter as first.
- 'self' has same meaning as 'this' on Java (e.g Context)
- Adding private method example is down below : 
```lua
Math:addMethod({name="add", type="private", isAbstract=false}, function(self, a, b)
    return a+b
end)
```
- As you can see, you can declare method as 'abstract method' by setting argument named 'isAbstract' to true

###### HOW TO ADD MEMBER VARIABLE
- The example code is down below :  
```lua
Math:addVariable({name="isTurnOn", type="public"}, false)
Math:addVariable({name="isActivated", type="private"}, false)
```
#### TODO
- Implement override feature.

### Caution
- This module is work in progress. (this will deleted if this module would usable later)

Developer
----
이호원 (Howon Lee) a.k.a hoyo321 or kck4156, airtaxi

License
----
Apache License Version 2.0