
-- use table reference names of fish here (no spaces)
local EMPTY = {
	RiverSunny = true, SwampSunny = true, 
	OceanSunny = true, LakeSunny = true, 
	ShinyTrash = true}
-- from small fish
local CHUM = {
	RiverSunny = true, SwampSunny = true, 
	OceanSunny = true, LakeSunny = true} 
-- from medium fish
local FISH_EYE = {} 
-- from big fish
local FISH_HEAD = {} 
-- from small toothy fish
local SMALL_TOOTH = {} 
-- from sharks, gators, etc.
local BIG_TOOTH = {} 
-- same as empty, but no trash and 1/1001 chance of SpermWhale
local SHINY_TRASH = {
	RiverSunny = true, SwampSunny = true, 
	OceanSunny = true, LakeSunny = true, 
	SpermWhale = true}
-- spermaceti will potentially catch anything, except trash
local SPERMACETI = {
	RiverSunny = true, SwampSunny = true, 
	OceanSunny = true, LakeSunny = true, 
	SpermWhale = true}

Bait = {EMPTY = EMPTY, CHUM = CHUM, FISH_EYE = FISH_EYE, FISH_HEAD = FISH_HEAD,
	SMALL_TOOTH = SMALL_TOOTH, BIG_TOOTH = BIG_TOOTH, 
	SHINY_TRASH = SHINY_TRASH, SPERMACETI = SPERMACETI}

function Bait:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

return Bait