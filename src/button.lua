local button = {}

function button.newButton(id,x,y,w,h,border,text, action)
	
	local btn = {}
	print(y)
	btn.id = id
	btn.selected = false
	btn.x = x
	btn.y = y
	btn.width = w
	btn.height = h
	btn.hcolor = {0.7,0.2,0.3}
	btn.color = {1,0.5,0}
	btn.border = border
	btn.text = text
	btn.action = action
	function  btn.setSelected(focus)
		if focus == btn.id then
			btn.selected = true
		else
			btn.selected = false
		end
	end
	function btn.draw()
		if btn.selected then
			love.graphics.setColor(btn.color)
		else
			love.graphics.setColor(btn.hcolor)
		end
		love.graphics.rectangle('fill',btn.x, btn.y, btn.width, btn.height)
		love.graphics.setColor(1,1,1)
		love.graphics.rectangle('fill',btn.x+btn.border, btn.y+btn.border, btn.width-(btn.border*2), btn.height-(btn.border*2))
		
		love.graphics.setColor(0,0,0)
		love.graphics.printf(btn.text, btn.x, btn.y+(btn.height/3), btn.width, 'center')
		
	end
	function btn.Click( )
		if btn.action then
			btn.action()
		end
	end
	function btn.mousepressed(x, y, button, istouch, action)
	if x >= btn.x and x <= btn.x + btn.width and y >= btn.y and y <= btn.y + btn.height then
		if btn.action then
			btn.action()
		end
	else
--		print('not')
	end

end
	return btn

end
return button