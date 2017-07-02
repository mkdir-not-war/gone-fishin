local State = State or require("state")
local Game = Game or require("game")

local FishingState = State:new{}

function FishingState:drawState()

end

function FishingState:update(dt)
	return self
end

return FishingState