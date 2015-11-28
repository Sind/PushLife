object = class()


function object:init(objectType)
	self.type = objectType.type
	self.image = objectType.image
end

function object:push()
	if self.type == enemy then

	else
		return true
	end
end

function object:pull()
	if self.type == enemy then

	else

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
		attack = 2
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