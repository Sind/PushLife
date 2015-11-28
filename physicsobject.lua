physicsobject = class()
DURATION = 0.75
GRAVITY = 120

function physicsobject:init(x,y,text,color)
	local angle = -math.random(45,90+45)/180*math.pi
	local rvel = math.random(20,40)
	self.xvel = math.cos(angle)*rvel
	self.yvel = math.sin(angle)*rvel
	self.time = 0
	self.x = x
	self.y = y * (dbottom-dtop)/7
	self.color = color
	self.text = text
end

function physicsobject:update(dt)
	self.time = self.time + dt
	self.yvel = self.yvel + dt*GRAVITY
	self.y = self.y + self.yvel
	self.x = self.x + self.xvel

end

function physicsobject:draw()
	local alpha = 255 - math.min(255,255 *(self.time/DURATION))
	love.graphics.setColor(self.color[1], self.color[2], self.color[3], alpha)
	love.graphics.print(self.text,self.x,self.y,0,1.5,1.5)
	love.graphics.setColor(255, 255, 255, 255)
end