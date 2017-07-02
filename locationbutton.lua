GameButton = GameButton or require "gamebutton" 

local locations = {"RIVER", "OCEAN", "LAKE", "SWAMP"}

LocationButton = GameButton:new{x = 360, y = 200, name = locations[1],
							current_location = 1,
							active = false,
							baitbutton = nil,
							backbutton = nil}

function LocationButton:nextButtonAndState(key, currentstate)
	-- return GameButton object (self or next) and state (currentstate or next)
	if self.active then
		if key == "down" then
			self.current_location = self.current_location + 1
			if self.current_location > #locations then
				self.current_location = 1
			end
			self.name = locations[self.current_location]
			return self, currentstate
		elseif key == "up" then
			self.current_location = self.current_location - 1
			if self.current_location == 0 then
				self.current_location = #locations
			end
			self.name = locations[self.current_location]
			return self, currentstate
		elseif key == "return" then
			self.active = false
			return self, currentstate
		end
	else
		if key == "down" then
			return self.baitbutton, currentstate
		elseif key == "up" then
			return self.backbutton, currentstate
		elseif key == "return" then
			self.active = true
			return self, currentstate
		else
			return self, currentstate
		end
	end
end

function LocationButton:draw()
	love.graphics.print(self.name, self.x, self.y)
	love.graphics.print("Location: ", 
		self.x - (25 + love.graphics.getFont():getWidth("Location: ")), self.y)
	if (self.active) then
		love.graphics.print("Cycle through locations with <up> and <down>.\nPick with <enter>.", 
			self.x + 120, self.y)
	end
end

function LocationButton:getLocation()
	return self.current_location
end

return LocationButton