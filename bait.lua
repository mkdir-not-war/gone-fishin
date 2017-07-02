Bait = {}

function Bait:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

-- use string names of fish here
Bait.EMPTY = {"RiverSunny" = true, "SwampSunny" = true, "OceanSunny" = true, "LakeSunny" = true}

return Bait