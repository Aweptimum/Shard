local helium = require 'lib.helium'
local useState = require 'lib.helium.hooks.state'
local Textbox = require 'components.textbox'
local button  = require 'components.button'

return helium(
---@param props AppState
---@param view {w:number, h:number}
function(props, view)
    local ps = props.pointState

    local description = Textbox({text = 'Point Count'}, .3*view.w, view.h)
    local plus = button({text='+',onClick = function () ps:addPoint(); print(ps.count) end}, .2*view.w, view.h)
    local minus = button({text='-',onClick = function () ps:byePoint(); print(ps.count) end}, .2*view.w, view.h)
    local amount = Textbox({text = ps.count}, .3*view.w, view.h)

    return function ()
        local layout = (require 'lib.helium.layout.row').new():width(view.w, view.h)
        description:draw()
        plus:draw()
        minus:draw()
        amount:draw()
        layout:draw()
    end
end)