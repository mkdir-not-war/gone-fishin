State = State or require "state" 
BackButton = BackButton or require "backbutton" 
BaitButton = BaitButton or require "baitbutton" 
CastLineButton = CastLineButton or require "castlinebutton" 
LocationButton = LocationButton or require "locationbutton" 

-- instantiate and link together buttons
local backbutton = BackButton:new()
local baitbutton = BaitButton:new()
local castlinebutton = CastLineButton:new()
local locationbutton = LocationButton:new()
locationbutton.baitbutton = baitbutton
baitbutton.locationbutton = locationbutton
baitbutton.castlinebutton = castlinebutton
castlinebutton.locationbutton = locationbutton
castlinebutton.baitbutton = baitbutton
locationbutton.backbutton = backbutton
backbutton.castlinebutton = castlinebutton

local GameInitState = State:new{
									buttons = {locationbutton,
												baitbutton,
												backbutton,
												castlinebutton},
									current_gamebutton = locationbutton
								}

function GameInitState:drawState()
	love.graphics.print("~~ Choose Location and Bait ~~", 200, 50)
end

function GameInitState:update(dt)
	return self
end

return GameInitState