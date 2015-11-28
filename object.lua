object = class()


function object:init(objectType)
	self.type = objectType.type
	self.image = objectType.image
	self.health = objectType.health
	self.attack = objectType.attack
end

function object:push(attack,defence)
	if self.type == "enemy" then
		self.health = self.health - attack
		local hit = physicsobject:new(0,2,"-" .. attack,{255,0,255})
		table.insert(physicsobjects,hit)

		if self.health <= 0 then
			return true
		end
	else
		return true
	end
end

function object:pull(attack,defence)
	if self.type == "enemy" then
		return false,self.attack
	elseif self.type == "equip" then
		player.gainAttack(1)
		return true
	elseif self.type == "consumable" then
		player.heal(1)
		return true
	end
end

function object:draw(x,y,scale)
	love.graphics.draw(self.image, x, y, 0, scale/40, scale/40, self.image:getWidth()/2, self.image:getHeight()/2)
end
--objectlist:
enemies = {
	bat = {
		type = "enemy",
		health = 3,
		attack = 2,
		image = love.graphics.newImage("graphics/bat.png")
	},
	slime = {
		type = "enemy",
		health = 2,
		attack = 1,
		image = love.graphics.newImage("graphics/slime.png")
	},
	dragon = {
		type = "enemy",
		health = 7,
		attack = 3,
		image = love.graphics.newImage("graphics/bosskek.png")
	}
}

consumables = {
	apple = {
		type = "consumable",
		subtype = "health",
		heal = 1,
		image = love.graphics.newImage("graphics/apple.png")
	}
}

chests = {
	treasure = {
		type = "chest",
		minValue = 2,
		maxValue = 7
	},
	badChest = {

	}
}

equips = {
	sword = {
		type = "equip",
		subtype = "weapon",
		attack = 1,
		image = love.graphics.newImage("graphics/sword_shit.png")
	}

}

potions = {
	
}

vendors ={	
	blacksmith = {
		type = "vendor",

	}
}

menu = {
	start = {
		type = "menu",
		subtype = "start"
	},
	credits = {
		type = "menu",
		subtype = "credits"
	},
	quit = {
		type = "menu",
		subtype = "quit"
	}
}