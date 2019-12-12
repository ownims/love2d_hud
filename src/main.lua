local menu = require("menu")
local width = love.graphics.getWidth()
local heigth = love.graphics.getHeight()
local posX = width/2
local posY = heigth/2
local size = 10
local t = 0
local yip = 1
function love.load()
	print("Game started")
	args = {}
	args[1] = playGame
	args[2] = invertRotation
	args[3] = exitGame
	menu.init(args)

end
function love.update(dt)
	t = t + dt
end

function love.draw()
	menu.draw()
	love.graphics.push()
	love.graphics.translate(posX,posY)   -- rotation center
	love.graphics.rotate((t*yip)/2)         -- rotate
	love.graphics.translate(-posX,-posY) -- move back
	love.graphics.setColor(1,1,1)
	love.graphics.polygon('fill', posX - size, posY - size/2, posX + size, posY - size/2, posX, posY + size*2)
	love.graphics.pop()
end

function love.keypressed(key, scancode, isrepeat)
	menu.keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode, isrepeat)

end

function love.mousepressed(x, y, button, istouch)
	menu.mousepressed(x, y, button, istouch)
end

function invertRotation() 
	if yip > 0 then
		yip = -1
	else 
		yip = 1
	end
end

function exitGame() 
	print("Game Close")
	love.event.quit(0)
end
function  playGame()
	
end
function love.mousereleased(x, y, button, istouch)

end
