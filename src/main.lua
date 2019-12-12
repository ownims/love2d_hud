local menu = require("menu")
local explosion = require('explosion')
local width = love.graphics.getWidth()
local heigth = love.graphics.getHeight()
local posX = width/2
local posY = heigth/2
local size = 10
local t = 0
local yip = 1
local delayMaxSpawnExplosion = 0.3
local delaySpawnExplosion = 0
local explosions = {}
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
	if delaySpawnExplosion <= 0 then
		--add new
		exp = explosion.newExplosion()
		table.insert(explosions, exp)	
		delaySpawnExplosion = delayMaxSpawnExplosion
	else
		delaySpawnExplosion = delaySpawnExplosion - dt
	end

	for key,value in ipairs(explosions) do
		if explosions[key] then
			explosions[key].update(dt)
			if explosions[key].enable == false then
				table.remove(explosions, key)
			end
		end
	end
end

function love.draw()

	for key,value in ipairs(explosions) do
		if explosions[key] then
			explosions[key].draw()
		end
	end

	
	love.graphics.push()
	love.graphics.translate(posX,posY)   -- rotation center
	love.graphics.rotate(t)         -- rotate
	love.graphics.translate(-posX,-posY) -- move back
	love.graphics.setColor(1,1,1)
	love.graphics.polygon('fill', posX - size, posY - size/2, posX + size, posY - size/2, posX, posY + size*2)
	love.graphics.pop()
	--drawExplosion(posX*1.2 , posY)

	menu.draw()
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
