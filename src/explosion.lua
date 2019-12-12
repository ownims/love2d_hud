local explosion = {}



function explosion.newExplosion( )
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	local exp = {}

	exp.duration = 1.2
	exp.enable = true
	exp.size = 0.1
	exp.x = love.math.random(1, width)
	exp.y =  love.math.random(1, height)

	function exp.update( dt )
		if exp.duration > 0 then
			exp.duration = exp.duration - dt
			exp.size = exp.size + dt * 5
			exp.draw()
		else
			exp.enable = false
		end
	end
	function exp.draw()
		if exp.enable then
			love.graphics.setColor(1,exp.duration,0)
			love.graphics.circle('fill', exp.x, exp.y, exp.size )
			love.graphics.setColor(1,1,1)
		end
	end

	return exp
	
end

return explosion