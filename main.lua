
--[[coordinate system:
-7 < 0 > 7
     v
     9
]]

function love.load()
	require "class"
	require "player"
	require "object"
	require "level"
	require "helpfuncs"
	require "physicsobject"
	physicsobjects = {}
	pushImage = love.graphics.newImage("graphics/push.png")
	pullImage = love.graphics.newImage("graphics/pull.png")
	font = love.graphics.newImageFont("graphics/font.png", "0123456789+-")
	love.graphics.setFont(font)
	local a = physicsobject:new(0,4.5,"-10",{200,0,0})

	--handle window

	-- dWidth, dHeight = love.window.getDesktopDimensions()

	--We want an adjustable screen

-- 14 -> 0
-- 15 -> 0.5/15
-- 16 -> 0.5/16
	love.window.setMode(1920, 1080,{fullscreen=true})
	dWidth,dHeight = love.window.getDimensions()
	-- local a = 16/9
	-- local b = 14/9
	-- local real = dWidth/dHeight
	-- if real <= a and real >= b then
	-- 	dtop = 0
	-- 	dbottom = dHeight
	-- 	dleft = (real/a)*dWidth/2
	-- 	dright = dWidth-dleft
	-- elseif real < b then
	-- 	dtop = (b-real)/2*dHeight
	-- 	dbottom = dHeight
	-- 	dleft = 0
	-- 	dright = dWidth
	-- else
	-- 	dtop = 0
	-- 	dbottom = dHeight
	-- 	dleft = 0
	-- 	dright = 14
	-- end
	dtop = 0
	dbottom = 1080
	dleft= 1920 * 1/16
	dright = 1920 - dleft
	love.graphics.setBackgroundColor(60, 150, 200)
	newlevel = true
end

function love.update(dt)
	if newlevel then
		newlevel = false
		clevel = level:new(cave)
	end
	player.update(dt)
	clevel:update(dt)
	for i,v in ipairs(physicsobjects) do
		v:update(dt)
	end
end

function love.draw()
	love.graphics.translate(dWidth/2,dtop)
	love.graphics.scale((dright-dleft)/14,(dbottom-dtop)/9)

	love.graphics.setLineWidth(0.05)
	clevel:draw()

	-- love.graphics.rectangle("line",-7,0,14,9)
	player.draw()
	for i,v in ipairs(physicsobjects) do
		v:draw()
	end

end



function love.mousepressed(x,y,b)
	if x < dWidth/2 then
		player.pull()
	else
		player.push()
	end
end

function love.keypressed(key)
	if key == "left" or key == "down" then
		player.pull()
	elseif key == "right"  or key == "up" then
		player.push()
	end
	if key == "escape" then
		love.event.quit()
	end
end