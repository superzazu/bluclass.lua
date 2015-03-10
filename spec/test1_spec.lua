describe("simple class test", function()

	setup(function()
		class = require '..bluclass'

		-- basic vec2 class
		vec2 = class()
		function vec2:initialize(x, y)
			self.x = x
			self.y = y
		end
		function vec2:__tostring()
			return self.x .. ',' .. self.y
		end
		function vec2:get_x()
			return self.x
		end

		-- inherits from vec2
		vec3 = class(vec2)
		function vec3:initialize(x, y, z)
			vec2.initialize(self, x, y)
			self.z = z
		end
		function vec3:__tostring()
			return self.x .. ',' .. self.y .. ',' .. self.z
		end
	end)


	it("can create instance", function()
		my_vec2 = vec2:new(23, 0)

		assert.are.equal(my_vec2.x, 23)
		assert.are.equal(my_vec2.y, 0)
		assert.are.equal(my_vec2:__tostring(), "23,0") -- calling a function
	end)

	it("can inherit from class", function()
		my_vec3 = vec3:new(2, 0, -23)

		assert.are.equal(my_vec3.x, 2)
		assert.are.equal(my_vec3.y, 0)
		assert.are.equal(my_vec3.z, -23)
		assert.are.equal(my_vec3:get_x(), 2) -- calling a function from parent class
	end)

	it("does not call parent constructor if not specified", function()
		function vec3:initialize(x, y, z)
		end

		my_vec3 = vec3:new(2, 0, -23)
		assert.are.equal(my_vec3.x, nil)

		-- going back to 'normal' constructor
		function vec3:initialize(x, y, z)
			vec2.initialize(self, x, y)
			self.z = z
		end
	end)

	it("uses function from inherited class instead of parent class", function()
		my_vec3 = vec3:new(2, 0, -23)
		assert.are.equal(my_vec3:__tostring(), "2,0,-23")
	end)

end)