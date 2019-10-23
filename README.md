# bluclass

bluclass is a simple OOP module for Lua with basic inheritance.

## create a class

```lua
local bluclass = require 'bluclass'

local vec2 = bluclass.class()
function vec2:init(x, y)
    self.x = x
    self.y = y
end

my_vec2 = vec2:new(23, 0)
print(my_vec2.x .. ',' .. my_vec2.y) -- '23,0'
```

## simple inheritance

```lua
-- ...

local vec3 = bluclass.class(vec2)
function vec3:init(x, y, z)
    vec3.super.init(self, x, y)
    self.z = z
end
function vec3:__tostring()
    return self.x .. ',' .. self.y .. ',' .. self.z
end

my_vec3 = vec3:new(2, 0, -23)
print(my_vec3) -- '2,0,-23'
```
