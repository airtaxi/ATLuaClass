-- Adding parent path into package.path since test is in subdirectory of module.
package.path = package.path .. ";../?.lua"

-- since we added parent directory into package.path, we require "init" in this case.
local ATLuaClass = require("init")

-- Override test case #1
-- TODO: implement feature 