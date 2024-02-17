local helium = require 'lib.helium'
local useButton = require 'lib.helium.shell.button'

local buttonCreator = helium(
---@param props {text:string, onClick: fun(x,y,w,h)}
---@param view any
---@return function
function (props, view)
	local elementState = useButton(props.onClick)
	return function()
		if elementState.down then
			love.graphics.setColor(0.9, .9, .9)
		else
			love.graphics.setColor(1, 1, 1)
		end
		love.graphics.rectangle('fill',0,0, view.w, view.h)
		love.graphics.setColor(0,0,0)
		love.graphics.print(props.text,0,0)
	end
end)

return buttonCreator