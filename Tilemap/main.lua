local sti = require "sti"

function love.load()
	-- Grab window size
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	-- Set world meter size (in pixels)
	love.physics.setMeter(32)

	-- Prepare translations
	tx, ty = 0, 0

	-- Load a map exported to Lua from Tiled
	map = sti("assets/test.lua", { "box2d" })

	-- Prepare physics world with horizontal and vertical gravity
	world = love.physics.newWorld(0, 0)

	-- Prepare collision objects
	map:box2d_init(world)

	-- Create a Custom Layer
	map:addCustomLayer("Sprite Layer", 3)

	--[[ Add data to Custom Layer
	local spriteLayer = map.layers["Sprite Layer"]
	spriteLayer.sprites = {
		player = {
			image = love.graphics.newImage("assets/link.png"),
			x = windowWidth / 2,
			y = windowHeight / 2,
		}
	}]]--

	player = {
		image = love.graphics.newImage("assets/link.png"),
		x = windowWidth / 2,
		y = windowHeight / 2,
	}

	-- Update callback for Custom Layer
	--[[function spriteLayer:update(dt)
		
	end

	-- Draw callback for Custom Layer
	function spriteLayer:draw()
		for _, sprite in pairs(self.sprites) do
			local x = math.floor(sprite.x)
			local y = math.floor(sprite.y)
			love.graphics.draw(sprite.image, x, y)
		end
	end
end]]--

end

function love.update(dt)
	map:update(dt)

	-- Move map
	local kd = love.keyboard.isDown
	tx = (kd("a", "left")  and tx - 128 * dt) or tx -- if button pressed then change tx, otherwise don't change tx
		tx = (kd("d", "right") and tx + 128 * dt) or tx
		ty = (kd("w", "up")    and ty - 128 * dt) or ty
		ty = (kd("s", "down")  and ty + 128 * dt) or ty
	end

	function love.draw()
		-- Draw the map and all objects within
		love.graphics.setColor(1, 1, 1)
		map:draw(-tx, -ty)

		-- Draw Collision Map (useful for debugging)
		love.graphics.setColor(1, 0, 0)
		map:box2d_draw()

		love.graphics.draw(player.image, player.x, player.y)

	--[[ Translate world so that player is always centred
	local player = map.layers["Sprite Layer"].sprites.player
	local tx = math.floor(player.x - love.graphics.getWidth()  / 2)
	local ty = math.floor(player.y - love.graphics.getHeight() / 2)]]--

	-- Please note that map:draw, map:box2d_draw, and map:bump_draw take
	-- translate and scale arguments (tx, ty, sx, sy) for when you want to
	-- grow, shrink, or reposition your map on screen.
end