local helium = require 'lib.helium'

local ImageOperations = require 'App.Controls.ImageOperations'
local NumericInput = require 'App.Controls.NumericInput'
local RadioGroup = require 'components.radiogroup'
local Textbox = require 'components.textbox'

return helium(
---@param props AppState
---@param view {w:number, h:number}
function (props, view)
    local width, height = view.w, view.h

    local header = Textbox({text='Triangulation controls'}, width, .1*height)
    local imageOp = ImageOperations({}, width, .1*height)
    local counter = NumericInput(props, width, .1*height)
    local pointDistribution = RadioGroup({options={'Random'}}, width, .2*height)
    local visible = RadioGroup({options={'Points'}}, width, .2*height)
    --local colors = RadioGroup({}, width, .2*height)

    return function()
        local layout = (require 'lib.helium.layout.column').new():width(view.w, view.h)
        header:draw()
        imageOp:draw()
        counter:draw()
        pointDistribution:draw()
        visible:draw()
        --colors:draw()
        layout:draw()
    end
end)