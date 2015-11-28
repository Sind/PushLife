level = class()

function level:init(leveltype)
	self.name = leveltype.name
	self.objects = {}
	for i = 1,leveltype.numObjects-1 do
		self.objects[i] = object:new(leveltype.objects[math.random(1,#leveltype.objects)])
	end
	self.objects[leveltype.numObjects] = object:new(leveltype.boss)
	self.onhalftile = true
	self.halftile = 0
	self.ctile = 0
	self.background = leveltype.background
end

function level:update(dt)
	if self.onhalftile then
		self.halftile = self.halftile+ dt*4
		if self.halftile > self.ctile+1 then
			self.ctile = self.ctile + 1
			self.onhalftile = false
		else
			return
		end
	end
	if love.keyboard.isDown(" ") then
		self.halftile = self.ctile
		self.onhalftile = true
	end
end

function level:draw()
	for i = -10,10,3 do
		for j = -10, 10,3 do
			love.graphics.draw(self.background, i, j, 0, 3/self.background:getWidth(), 3/self.background:getHeight())
		end
	end
	love.graphics.setColor(50, 50, 50)
	love.graphics.roundrectangle("line", -6, .2, 12, 0.5,.1)
	for i = 1, #self.objects do
		if i == #self.objects then love.graphics.setColor(70, 0, 0, 255) end
		love.graphics.circle("fill", self:getTile(i), 0.45, 0.1)
	end
	local length = 12/(#self.objects)
	love.graphics.setColor(200, 0, 0)
	if self.onhalftile then
		love.graphics.roundrectangle("line",self:getTile(self.halftile)-length/2-.1, .1, length+.2, .7,.1)
	else
		love.graphics.roundrectangle("line",self:getTile(self.ctile)-length/2-.1, .1, length+.2, .7,.1)
	end
	love.graphics.setColor(255, 255, 255)

	local t = self.onhalftile and self.halftile or self.ctile
	for i,v in ipairs(self.objects) do
		local p = i-t
		if math.abs(p) < 3 then 
			local alpha = 255 - math.min(255,150 *math.abs(p))
			love.graphics.setColor(255, 255, 255, alpha)
			v:draw(p*5,4+math.abs(p)/6,1-math.abs(p)*0.30)
			love.graphics.setColor(255, 255, 255, 255)
		end
	end
end

function level:getTile(n)
	local length = 12/(#self.objects)
	return (n-.5)*length-6
end

function level:push()

end

function level:pull()

end


cave = {
	name = "cave",
	numObjects = 6,
	objects = {
		-- consumables.apple,
		-- enemies.bat,
		-- enemies.slime,
		-- chests.treasure,
		-- chests.badChest,
		equips.sword
	},
	boss = equips.sword,
	background = love.graphics.newImage("graphics/cave_bg1.png")
}