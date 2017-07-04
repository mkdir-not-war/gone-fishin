local SWAMP = { ShinyTrash = true, 
	SwampSunny = true}

local RIVER = { ShinyTrash = true, 
	RiverSunny = true}

local OCEAN = { ShinyTrash = true, 
	OceanSunny = true, Whale = true}

local LAKE = { ShinyTrash = true, 
	LakeSunny = true}

Location = {LAKE = LAKE, RIVER = RIVER, OCEAN = OCEAN, SWAMP = SWAMP}

function Location:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

return Location
