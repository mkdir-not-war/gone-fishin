local State = State or require("state")
local MainMenuState = MainMenuState or require("mainmenustate")

local TitleState = State:new{time_to_main = 2.4, 
							game_name = nil}

function TitleState:drawState()
	love.graphics.print(self.game_name, 
		love.window.getWidth()*2/5, 
		love.window.getHeight()/3)
end

function TitleState:update(dt)
	self.time_to_main = self.time_to_main - dt
	if self.time_to_main <= 0 then
		return MainMenuState:new()
	else
		return self
	end
end

return TitleState