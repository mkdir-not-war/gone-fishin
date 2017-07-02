State = State or require("state")
FishingState = FishingState or require("fishingstate")

local time_to_fish_max = 5.4

CastLineState = State:new{ time_to_fish = 0,
								location = nil,
								bait = nil }

function CastLineState:drawState()
	if self.time_to_fish < 0.8 then
		love.graphics.print("plunk!", 
			love.window.getWidth()*2/5, 
			love.window.getHeight()/3)
	elseif self.time_to_fish < time_to_fish_max then
		love.graphics.print("waiting...", 
			love.window.getWidth()*2/5, 
			love.window.getHeight()/3)
	else
		love.graphics.print("something is biting!", 
			love.window.getWidth()*2/5, 
			love.window.getHeight()/3)
	end

	if self.time_to_fish > time_to_fish_max + 1.2 then
		love.graphics.print("<press Enter to continue>", 
			love.window.getWidth()*2/5, 
			love.window.getHeight()/3 + 22)
	end
end

function CastLineState:update(dt)
	self.time_to_fish = self.time_to_fish + dt
	return self
end

function CastLineState:handlekey(key)
	if key == "escape" then
		love.event.quit()
		return self
	elseif key == "return" and self.time_to_fish > time_to_fish_max then
		return FishingState:new{location = self.location, bait = self.bait}
	else
		return self
	end
end

return CastLineState