PullFish = PullFish or require "pullfish"

Game = {location = nil, bait = nil, fish = nil, PF = nil}

function Game:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Game:load()
	self.PF = PullFish:new{location = self.location, bait = self.bait}
	local fish = self.PF:getFish(self.location, self.bait)
	self.fish = fish
end

function Game:getFish()
	return self.fish
end

return Game