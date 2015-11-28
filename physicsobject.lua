physicsobject = class()
DURATION = 2

function physicsobject:init(x,y,text,color)
	local angle = -math.random(45,90+45)/180*math.pi
	local rvel = math.random()+1
	self.xvel = math.cos(angle)*rvel
	self.yvel = math.sin(angle)*rvel
	self.time = 0
	self.x = x
	self.y = y
	self.color = color
end

function physicsobject:update(dt)
	self.time = self.time + dt
	self.yvel = self.yvel + dt

end

function physicsobject:draw()
	local alpha = 255 - 255 *(self.time/DURATION)
	love.graphics.setColor(self.color[1], self.color[2], self.color[3], 255)
	love.graphics.print(self.x,self.y,self.text)
	love.graphics.setColor(255, 255, 255, 255)
end