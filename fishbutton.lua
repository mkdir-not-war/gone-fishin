GameButton = GameButton or require "gamebutton"
GameInitState = GameInitState or require "gameinitstate" 

FishButton = GameButton:new{x = 500, y = 180, name = "Go Fishin'",
							quitbutton = nil}

function FishButton:nextButtonAndState(key, currentstate)
	-- return GameButton object (self or next) and state (currentstate or next)
	if key == "down" then
		return self.quitbutton, currentstate
	elseif key == "return" then
		return self, GameInitState:new()
	else
		return self, currentstate
	end
end

return FishButton