--local inutils = require "inutils"
local btn0 = require("button")

local width = love.graphics.getWidth()
local heigth = love.graphics.getHeight()
local posX = width/2
local posY = heigth/2
local size = 10
local t = 0
local yip = 1
function love.load()
	print("Game started")
	btn0 = btn0.newButton()
end
function love.update(dt)
	t = t + dt
end

function love.draw()
	btn0.draw()
	love.graphics.push()
	love.graphics.translate(posX,posY)   -- rotation center
	love.graphics.rotate((t*yip)/2)         -- rotate
	love.graphics.translate(-posX,-posY) -- move back
	love.graphics.setColor(1,1,1)
	love.graphics.polygon('fill', posX - size, posY - size/2, posX + size, posY - size/2, posX, posY + size*2)
	love.graphics.pop()
end

function love.keypressed(key, scancode, isrepeat)
	if  key == "escape" then
		love.event.quit(0)
	end
end

function love.keyreleased(key, scancode, isrepeat)

end

function love.mousepressed(x, y, button, istouch)
	btn0.mousepressed(x,y, button, istouch, btnClick)
end

function btnClick() 
	if yip > 0 then
		yip = -1
	else 
		yip = 1
	end
end

function love.mousereleased(x, y, button, istouch)

end
