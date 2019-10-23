-- requires u-test (https://github.com/iudalov/u-test): luarocks install u-test
-- to run the tests, run in terminal `lua tests.lua`
local test = require 'u-test'
local bluclass = require '.bluclass'

local vec2, vec3

test.start_up = function()
    vec2 = bluclass.class()
    vec2.MY_CONSTANT = 3
    function vec2:init(x, y)
        self.x = x
        self.y = y
    end
    function vec2:__tostring()
        return self.x .. ',' .. self.y
    end
    function vec2:get_x()
        return self.x
    end

    vec3 = bluclass.class(vec2)
    function vec3:init(x, y, z)
        vec3.super.init(self, x, y)
        self.z = z
    end
    function vec3:__tostring()
        return self.x .. ',' .. self.y .. ',' .. self.z
    end
end

test.tear_down = function()
    vec2 = nil
    vec3 = nil
end

test.can_create_classes_and_instances = function()
    local my_class = bluclass.class()
    local instance = my_class:new()
end

test.can_retrieve_class_from_instance = function()
    local my_class = bluclass.class()
    local instance = my_class:new()
    test.equal(instance.class, my_class)
end

test.bluclass_automatically_calls_init_method_if_exists = function()
    local v = vec2:new(20, 30)
    test.equal(v.x, 20)
    test.equal(v.y, 30)
    test.equal(v:__tostring(), '20,30')
end

test.can_access_class_attributes = function()
    local v = vec2:new(20, 30)
    test.equal(v.MY_CONSTANT, 3)
end

test.access_to_unknown_attributes_return_nil = function()
    local v = vec2:new(20, 30)
    test.equal(v.unknown_attribute, nil)
end

test.basic_inheritance = function()
    local v = vec3:new(1, 2, 3)
    test.equal(v.x, 1)
    test.equal(v.y, 2)
    test.equal(v.z, 3)

    test.equal(v:__tostring(), '1,2,3')
end

test.can_call_method_from_parent_class = function()
    local v = vec3:new(5, 2, 3)
    test.equal(v:get_x(), 5)
end

test.automatically_call_init_from_super_if_init_does_not_exist = function()
    vec3.init = nil
    local v = vec3:new(5, 2, 3)
    test.equal(v.x, 5)
    test.equal(v.y, 2)
    test.equal(v.z, nil)
end

test.summary()
