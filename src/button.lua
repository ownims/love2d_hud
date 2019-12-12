local button = {}

function button.newButton( )
	
	local btn = {}
	btn.x = 50
	btn.y = 50
	btn.width = 150
	btn.height = 30
	btn.color = {0.7,0.2,0.3}
	btn.border = 3
	btn.text = "INVERTER ROTACAO"
	function btn.draw()
		love.graphics.setColor(btn.color)
		love.graphics.rectangle('fill',btn.x, btn.y, btn.width, btn.height)
		love.graphics.setColor(1,1,1)
		love.graphics.rectangle('fill',btn.x+btn.border, btn.y+btn.border, btn.width-(btn.border*2), btn.height-(btn.border*2))
		
		love.graphics.setColor(0,0,0)
		love.graphics.printf(btn.text, btn.y, btn.y+(btn.height/2), btn.width, 'center')
		
	end
	function btn.mousepressed(x, y, button, istouch, action)
	if x >= btn.x and x <= btn.x + btn.width and y >= btn.y and y <= btn.y + btn.height then
		if action then
			action()
		end
	else
		print('not')
	end

end
	return btn

end

function button.draw()
	love.graphics.setColor(button.color)
	love.graphics.rectangle('fill',button.x, button.y, button.width, button.height)
end

function button.mousepressed(x, y, button, istouch)
	if x >= button.x and x <= button.x + button.width and y >= button.y and y <= button.y + button.height then
		printf('enter')
	else
		printf('not')
	end

end



return button