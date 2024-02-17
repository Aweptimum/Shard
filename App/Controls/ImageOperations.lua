local helium = require 'lib.helium'
local Textbox = require 'components.textbox'
local button  = require 'components.button'

return helium(
---@param props AppState
---@param view {w:number, h:number}
function(props, view)
    local description = Textbox({text = 'Image Operations'}, .3*view.w, view.h)
    local save = button({text='Save'}, .3*view.w, view.h)

    return function ()
        local layout = (require 'lib.helium.layout.row').new():width(view.w, view.h)
        description:draw()
        save:draw()
        layout:draw()
    end
end)