# bluclass

bluclass is a simple OOP module for Lua with basic inheritance.

## create a class
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

## simple inheritance
```
-- ...

local vec3 = class(vec2)
function vec3:initialize(x, y, z)
    vec3.super.initialize(self, x, y)
    self.z = z
end
function vec3:__tostring()
    return self.x .. ',' .. self.y .. ',' .. self.z
end

my_vec3 = vec3:new(2, 0, -23)
print(my_vec3) -- prints "2,0,-23"
```
