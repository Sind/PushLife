object = class()


function object:init(leveltype)

end

function object:draw(x,y,scale)
	love.graphics.circle("fill", x, y, 2*scale)
end
--objectlist:
enemies = {
	bat = {
		type = enemy,
		health = 3,
		attack = 2
	}
}

consumables = {
	apple = {
		type = consumable,
		subtype = health
	}
}

chests = {
	treasure = {
		type = chest,
		minValue = 2,
		maxValue = 7
	},
	badChest = {

	}
}

equips = {
	sword = {
		type = equip,
		subtype = weapon,
		attack = 1
	}

}

potions = {
	
}

vendors ={	
	blacksmith = {
		type = vendor,

	}
}