Fish = Fish or require "fish"
Location = Location or require "location"
Bait = Bait or require "bait"
require "mathhelper"

local L = Location:new()
local B = Bait:new()
local allfish = {}

allfish.ShinyTrash = Fish:new{name="Shiny Trash", rarity=1000, 
	ai="immobile", baitdrop="SHINY_TRASH"}
allfish.SpermWhale = Fish:new{name="Sperm Whale", rarity=1, 
	ai="fast-edges", baitdrop="SPERMACETI"}
allfish.RiverSunny = Fish:new{name="River Sunny", rarity=1000, 
	ai="slow", baitdrop="CHUM"}
allfish.LakeSunny = Fish:new{name="Lake Sunny", rarity=1000, 
	ai="slow", baitdrop="CHUM"}
allfish.OceanSunny = Fish:new{name="Ocean Sunny", rarity=1000, 
	ai="slow", baitdrop="CHUM"}
allfish.SwampSunny = Fish:new{name="Swamp Sunny", rarity=1000, 
	ai="slow", baitdrop="CHUM"}

PullFish = {L = L, B = B, allfish = allfish, location = nil, bait = nil}

function PullFish:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function PullFish:getFish()
	local fishbank = {}
	local locfish = self.L[self.location]
	local baitfish = self.B[self.bait]
	for v, _ in pairs( locfish ) do
		if baitfish[v] then
			fishbank[v] = self.allfish[v]
		end
	end

	return randFromDistribution(fishbank, "rarity")
end

return PullFish