local inutils = require "inutls"

local menu = {}

menu.instructions_text = [[
	press "esc" to exit

	press "enter" to play
]]

function menu.init()
	print("\nmenu started")

	menu.width = love.graphics.getWidth()
	menu.height = love.graphics.getHeight()
end

function menu.enter()

end

function menu.exit()

end

function menu.draw()
	love.graphics.printf(menu.instructions_text, 0, 3*menu.height/4, menu.width, 'center')
end

function menu.update(dt)
end

function menu.keypressed(key, scancode, isrepeat)
	if  key == "escape" then
		love.event.quit(0)
	elseif key == "return" then
		gamestate.load("fase1")
	end
end

function menu.keyreleased(key, scancode, isrepeat)
end

return menu
