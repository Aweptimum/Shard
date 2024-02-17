local helium = require 'lib.helium'
local useState = require 'lib.helium.hooks.state'
local layoutScheme = require 'lib.helium.layout.column'

local checkboxCreator = require 'components.checkbox'

local radioCreator = helium(function (props, view)
    local radioState = props
    local checkboxes = {}
    for _, option in ipairs(radioState.options) do
        table.insert(checkboxes, checkboxCreator({
            text=option, state = radioState, onClick = props.onClick},
            view.w, view.h/#radioState.options)
        )
    end

    return function ()
        local layout = layoutScheme.new()
        love.graphics.setColor(1,1,1)
        for _, checkbox in ipairs(checkboxes) do
            checkbox:draw()
        end
        layout:draw()
    end
end)

return radioCreator