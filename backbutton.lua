GameButton = GameButton or require "gamebutton"
--MainMenuState = MainMenuState or require "mainmenustate" 

BackButton = GameButton:new{x = 360, y = 140, name = "Back to Main Menu",
				castlinebutton = nil}

function BackButton:nextButtonAndState(key, currentstate)
	-- return GameButton object (self or next) and state (self or next)
	if key == "down" then
		return self.locationbutton, currentstate
	elseif key == "return" then
		return self, MainMenuState:new()
	else
		return self, currentstate
	end
end

return BackButton