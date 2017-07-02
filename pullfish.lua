Fish = Fish or require "fish"
Location = Location or require "location"
Bait = Bait or require "bait"
require "mathhelper"

PullFish = {}

function PullFish:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

local allfish = {}

allfish.RiverSunny = Fish:new(name="River Sunny", rarity=1000, ai="immobile", baitdrop="BASIC_CHUM")
allfish.LakeSunny = Fish:new(name="River Sunny", rarity=1000, ai="immobile", baitdrop="BASIC_CHUM")
allfish.OceanSunny = Fish:new(name="River Sunny", rarity=1000, ai="immobile", baitdrop="BASIC_CHUM")
allfish.RiverSunny = Fish:new(name="River Sunny", rarity=1000, ai="immobile", baitdrop="BASIC_CHUM")

function PullFish:getFish(location, bait)
	local fishbank = {}
	for v, _ in pairs(Location.location) do
		if Bait.bait.v do
			fishbank.v = allfish.v
		end
	end

	return randFromDistribution(fishbank, "rarity")
end

return PullFish