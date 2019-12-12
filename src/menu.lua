local menu = {}
local buttonList = {}
local button = require("button")
local buttonListSize = 0
local focus = 1
local actions = {}
menu.instructions_text = [[
	press "esc" to exit

	press "enter" to play
]]

function menu.init(args)
	print("\nmenu started")
	actions = args
	menu.width = love.graphics.getWidth()
	menu.height = love.graphics.getHeight()
	buttonList[1] = calculateButton(1,"Jogar", args[1])
	print(buttonList[1])
	buttonList[2] = calculateButton(2,"Inverter Rotacao", args[2])
	buttonList[3] = calculateButton(3,"Sair", args[3])
	buttonListSize = 3
	buttonList[1].setSelected(1)
end

function calculateButton(id, text, action)
	wid = 200
	hei = 30
	space = 5
	x = (menu.width/2)-(wid/2)
	y = (menu.height/2)+(id*hei)+(id*space)
	return button.newButton(id, x,y,wid, hei, 2, text, action)
end
function menu.enter()

end

function menu.exit()

end

function menu.draw()
	for key, value in ipairs(buttonList) do
		value.draw()
	end
end

function menu.update(dt)
end

function menu.keypressed(key, scancode, isrepeat)
	if  key == "escape" then
		buttonList[3].Click()
	elseif key == "tab" then
		if focus < buttonListSize then
			focus = focus + 1
		else
			focus = 1
		end
		for k, value in ipairs(buttonList) do
			buttonList[k].setSelected (focus)
		end
	
	elseif key == "return" then
		buttonList[focus].Click()
	end
end

function menu.keyreleased(key, scancode, isrepeat)
end
function menu.mousepressed(x, y, button, istouch)
	for k, value in ipairs(buttonList) do
			buttonList[k].mousepressed (x, y, button, istouch, actions[k])
	end
end
return menu
