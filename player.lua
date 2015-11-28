ANIMATION_TIME = 0.5

player = {
	maxhealth = 10,
	health = 10,
	damage = 1,
	defence = 0,
	image = love.graphics.newImage("graphics/player.png"),
	scale = 0.03
}


function player.getHit(damage)
	damage = math.max(1,math.floor(player.maxhealth/30),damage-player.defence)
	player.health = player.health - damage
end

function player.update(dt)
	if player.pushing or player.pulling then
		player.animationTimer = player.animationTimer + dt
		if player.animationTimer > ANIMATION_TIME then
			player.pushing = false
			player.pulling = false
		end
	end
end
function player.push()
	if clevel.onhalftile or player.pushing or player.pulling then return end
	player.pushing = true
	player.animationTimer = 0
	clevel:push()
end

function player.pull()
	if clevel.onhalftile or player.pushing or player.pulling then return end
	player.pulling = true
	player.animationTimer = 0
	clevel:pull()
end

function player.draw()
	local move = 0.75
	if player.pushing then
	move = 0.75 + 0.25 * math.sin(player.animationTimer / ANIMATION_TIME * math.pi)
	elseif player.pulling then
	move = 0.75 - 0.25 * math.sin(player.animationTimer / ANIMATION_TIME * math.pi)
	end
	love.graphics.draw(player.image,0,9,0,player.scale,player.scale,player.image:getWidth()/2,player.image:getHeight()*move)
end