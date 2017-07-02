GameButton = GameButton or require "gamebutton"

QuitButton = GameButton:new{x = 500, y = 220, name = "Quit",
				fishbutton = nil}

function QuitButton:nextButtonAndState(key, currentstate)
	-- return GameButton object (self or next) and state (self or next)
	if key == "up" then
		return self.fishbutton, currentstate
	elseif key == "return" then
		love.event.quit()
		return self, currentstate
	else
		return self, currentstate
	end
end

return QuitButton