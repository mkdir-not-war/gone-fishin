-- requirements
local State = State or require("state")
local FishButton = FishButton or require("fishbutton")
local QuitButton = QuitButton or require("quitbutton")

-- instantiate and link buttons together
local fishbutton = FishButton:new()
local quitbutton = QuitButton:new()
fishbutton.quitbutton = quitbutton
quitbutton.fishbutton = fishbutton

-- constructor
local MainMenuState = State:new{
							buttons = {fishbutton, quitbutton},
							current_gamebutton = fishbutton 
						}



function MainMenuState:drawState()
	love.graphics.print("~~ Gone Fishin' Main Menu ~~", 100, 30)
end

function MainMenuState:update(dt)
	return self
end

return MainMenuState