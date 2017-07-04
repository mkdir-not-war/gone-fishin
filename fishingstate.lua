State = State or require("state")
Game = Game or require("game")

FishingState = State:new{location = nil, bait = nil, game = nil}

function FishingState:loadGame()
	self.game = Game:new{location = self.location, bait = self.bait}
	self.game:load()
end

function FishingState:drawState()
	love.graphics.print(self.game:getFish().name, 100, 100)
end

function FishingState:update(dt)
	return self
end

return FishingState