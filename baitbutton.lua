GameButton = GameButton or require "gamebutton"

local baits = {"EMPTY"}

BaitButton = GameButton:new{x = 360, y = 260, name = baits[1],
							current_bait = 1,
							active = false,
							locationbutton = nil,
							castlinebutton = nil}

function BaitButton:nextButtonAndState(key, currentstate)
	-- return GameButton object (self or next) and state (currentstate or next)
	if self.active then
		-- see locations for code
	else
		if key == "down" then
			return self.castlinebutton, currentstate
		elseif key == "up" then
			return self.locationbutton, currentstate
		elseif key == "return" then
			--self.active = true
			return self, currentstate
		else
			return self, currentstate
		end
	end
end

function BaitButton:draw()
	love.graphics.print(self.name, self.x, self.y)
	love.graphics.print("Bait: ", 
		self.x - (25 + love.graphics.getFont():getWidth("Bait: ")), self.y)
	if (self.active) then
		love.graphics.print("Cycle through baits with <up> and <down>. Pick with <enter>.", 
			self.x + 120, self.y)
	end
end

function BaitButton:getBait()
	return self.current_bait
end

return BaitButton