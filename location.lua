Location = {}

function Location:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

-- use string names of fish here
Location.SWAMP = {"SwampSunny" = true}
Location.RIVER = {"RiverSunny" = true}
Location.OCEAN = {"OceanSunny" = true}
Location.LAKE = {"LakeSunny" = true}

return Location
