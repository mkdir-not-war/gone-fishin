local GameButton = GameButton or require("gamebutton")

local State = {buttons = {},
				current_gamebutton = nil}

function State:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function State:handlekey(key)
	if key == "escape" then
		love.event.quit()
		return self
	elseif self.current_gamebutton ~= nil then
		self.current_gamebutton, next_state = self.current_gamebutton:nextButtonAndState(key, self)
		return next_state
	else
		return self
	end
end

function State:update(dt)
	-- change state information and return state (self or next)
	return self
end

function State:draw()
	-- first draw state as defined in overwrite
	self:drawState()

	-- then draw all buttons
	for k, b in pairs(self.buttons) do
		b:draw()
	end

	-- then draw rectangle around current button
	if self.current_gamebutton ~= nil then
		fontwidth = love.graphics.getFont():getWidth(self.current_gamebutton.name)
		fontheight = love.graphics.getFont():getHeight()
		love.graphics.rectangle("line", 
			self.current_gamebutton.x - 1/2*fontwidth,
			self.current_gamebutton.y - fontheight,
			9/4*fontwidth,
			fontheight*3)
	end
end

function State:drawState()
	-- overwrite this in subclasses to display all graphics except buttons
end

return State