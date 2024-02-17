local helium = require 'lib.helium'
local useCheckbox = require 'lib.helium.shell.checkbox'

local checkCreator = helium(function (param, view)
	local elementState = useCheckbox()

	return function()
		if elementState.down then
			param.onClick(param.text, param.state)
		else
			love.graphics.setColor(0, 1, 1)
		end
		love.graphics.print(param.text,0,0)
	end
end)

return checkCreator