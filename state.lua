local Game = Game or require("game")
local GameButton = GameButton or require("gamebutton")

local State = {current_gamebutton = nil, 
				quit = false}

function State:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function State:handlekey(key)
	if key == "escape" then
		self.quit = true
		return self
	elseif current_gamebutton ~= nil then
		current_gamebutton, next_state = current_gamebutton:nextButtonAndState(key)
		return next_state
	else
		return self
	end
end

function State:update(dt)
	-- change state information and return state (self or next)
end

function State:draw()
	-- draw the state
end

return State