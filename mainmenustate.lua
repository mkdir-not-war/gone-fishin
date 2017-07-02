-- requirements
State = State or require "state"
FishButton = FishButton or require "fishbutton" 
QuitButton = QuitButton or require "quitbutton" 

-- instantiate and link buttons together
local fishbutton = FishButton:new()
local quitbutton = QuitButton:new()
fishbutton.quitbutton = quitbutton
quitbutton.fishbutton = fishbutton

-- constructor
MainMenuState = State:new{
							buttons = {fishbutton, quitbutton},
							current_gamebutton = fishbutton 
						}



function MainMenuState:drawState()
	love.graphics.print("~~ Gone Fishin' Main Menu ~~", 200, 50)
end

function MainMenuState:update(dt)
	return self
end

return MainMenuState