local GameButton = {x = nil, y = nil, name = ""}

function GameButton:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function GameButton:nextButtonAndState(key)
	-- return GameButton object (self or next) and state (self or next)
end

function GameButton:draw()
	love.graphics.print(self.name, self.x, self.y)
end

return GameButton