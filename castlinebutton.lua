GameButton = GameButton or require "gamebutton" 
CastLineState = CastLineState or require "castlinestate" 

CastLineButton = GameButton:new{x = 360, y = 320, name = "Cast line!",
				locationbutton = nil,
				baitbutton = nil}

function CastLineButton:nextButtonAndState(key, currentstate)
	-- return GameButton object (self or next) and state (self or next)
	if key == "up" then
		return self.baitbutton, currentstate
	elseif key == "return" then
		return self, CastLineState:new{location = self.locationbutton:getLocation(),
										bait = self.baitbutton:getBait()}
	else
		return self, currentstate
	end
end

return CastLineButton