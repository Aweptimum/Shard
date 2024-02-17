local helium = require 'lib.helium'
local row = require 'lib.helium.layout.column'
local useCheckbox = require 'lib.helium.shell.checkbox'

local checkCreator = helium(
---@param props {text: string, onClick: fun()}
---@param view any
---@return function
function (props, view)
	local elementState = useCheckbox(props.onClick)

	local textOffset = view.h/10 + view.h/20 + view.h/10
	return function()
		love.graphics.rectangle("fill", 0, 0, view.w, view.h)
        local layout = row.new()
		love.graphics.setColor(.5, .5, .5)
		love.graphics.circle("fill", view.h/10, view.h/2, view.h/20)
		love.graphics.setColor(0, 0, 0)
		love.graphics.print(props.text,textOffset,view.h/2)

		if elementState.toggled then
			love.graphics.setColor(0, 1, 1)
			love.graphics.circle("fill", view.h/10, view.h/2, view.h/30)
		end
		layout:draw()
	end
end)

return checkCreator