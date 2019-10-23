local bluclass = {
    _VERSION        = 'bluclass 1.1.0',
    _DESCRIPTION    = 'Lua OOP module with simple inheritance',
    _URL            = 'https://github.com/superzazu/bluclass.lua',
    _LICENSE        = [[
Copyright (c) 2015-2019 Nicolas Allemand

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]
}

bluclass.class = function(super)
    local class = {}
    class.super = super

    class.new = function(self, ...)
        local instance = {}
        instance.class = self

        if self.init then
            self.init(instance, ...)
        elseif self.super ~= nil and self.super.init then
            self.super.init(instance, ...)
        end

        return setmetatable(instance, {__index = function(t, key)
            if class[key] then
                return class[key]
            elseif class.super and class.super[key] then
                return class.super[key]
            end
        end})
    end

    return class
end

return bluclass
