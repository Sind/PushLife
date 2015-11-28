ANIMATION_TIME = 0.5

player = {
	maxhealth = 5,
	health = 5,
	attack = 1,
	defence = 0,
	image = love.graphics.newImage("graphics/player.png"),
	heartContainer = love.graphics.newImage("graphics/heart_container.png"),
	heart = love.graphics.newImage("graphics/heart.png"),
	scale = 0.03
}


function player.getHit(damage)
	damage = math.max(1,math.floor(player.maxhealth/30),damage-player.defence)
	player.health = player.health - damage
	local hit = physicsobject:new(0,5.5,"-" .. damage,{255,0,0})
	table.insert(physicsobjects,hit)
end

function player.heal(heal)
	player.health = player.health + heal
	if player.health > player.maxhealth then player.health = player.maxhealth end

	local heala = physicsobject:new(0,5.5,"+" .. heal,{0,255,0})
	table.insert(physicsobjects,heala)
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
	damage = clevel:push(player.attack,player.defence)
	if damage then
		player.getHit(damage)
	end
end

function player.pull()
	if clevel.onhalftile or player.pushing or player.pulling then return end
	player.pulling = true
	player.animationTimer = 0
	damage = clevel:pull(player.attack,player.defence)
	if damage then
		player.getHit(damage)
	end
end

function player.draw()
	local move = 0.75
	if player.pushing then
	move = 0.75 + 0.25 * math.sin(player.animationTimer / ANIMATION_TIME * math.pi)
	elseif player.pulling then
	move = 0.75 - 0.25 * math.sin(player.animationTimer / ANIMATION_TIME * math.pi)
	end
	love.graphics.draw(player.image,0,9,0,player.scale,player.scale,player.image:getWidth()/2,player.image:getHeight()*move)
	for i = 1,5 do
		local di = i - 3
		if i <= player.health then
			love.graphics.draw(player.heart,di , 8.5, 0, 0.01, 0.01, player.heart:getWidth()/2, player.heart:getHeight()/2)
		else
			love.graphics.draw(player.heartContainer,di , 8.5, 0, 0.01, 0.01, player.heartContainer:getWidth()/2, player.heartContainer:getHeight()/2)
		end
	end
end