local helium = require 'lib.helium'

local txtboxCreator = helium(
---@param props {text: string}
---@param view {w:number, h:number}
---@return function
function (props, view)
	return function()
		love.graphics.setColor(1, 1, 1)
		love.graphics.rectangle("fill", 0,0,view.w,view.h)
		if props.text then
			love.graphics.setColor(0, 0, 0)
			love.graphics.print(props.text,0,0)
		end
	end
end)

return txtboxCreator