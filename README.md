# bluclass

bluclass is a simple OOP module for Lua.
```
local class = require 'bluclass'

local vec2 = class()
function vec2:initialize(x, y)
	self.x = x
	self.y = y
end

my_vec2 = vec2:new(23, 0)
print(my_vec2.x .. ',' .. my_vec2.y)
```
