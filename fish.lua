Fish = {name = "", rarity = 0, ai = nil, baitdrop = nil}

function Fish:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

return Fish