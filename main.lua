local TitleState = require("titlestate")

local current_gamestate = nil
local game = nil

local game_name = "Gone Fishin'"

function love.load()
	current_gamestate = TitleState:new{game_name = game_name}
end

function love.quit()
end

function love.update(dt)
	current_gamestate = current_gamestate:update(dt)
end

function love.keypressed(key)
	current_gamestate = current_gamestate:handlekey(key)
end

function love.draw()
	current_gamestate:draw()
end