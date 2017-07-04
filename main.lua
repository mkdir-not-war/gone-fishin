local TitleState = require("titlestate")

local current_gamestate = nil

local game_name = "Gone Fishin'"

local input_timer_max = 0.04
local input_timer = nil

function love.load()
	-- set the random seed to be different for every run of the game
	math.randomseed(os.time())
	-- set initial gamestate to be the title screen
	current_gamestate = TitleState:new{game_name = game_name}
	-- set the input timer, which prevents input from happening too quickly
	input_timer = input_timer_max
end

function love.quit()
	-- save collection data here
end

function love.update(dt)
	-- update the input timer and reference the gamestate for update
	current_gamestate = current_gamestate:update(dt)
	input_timer = input_timer - dt
end

function love.keypressed(key)
	-- consult the input timer and hand off input data to gamestate
	if (input_timer <= 0) then
		current_gamestate = current_gamestate:handlekey(key)
		input_timer = input_timer_max
	end
end

function love.draw()
	current_gamestate:draw()
end