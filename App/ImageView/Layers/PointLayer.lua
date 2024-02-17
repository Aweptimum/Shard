local helium = require 'lib.helium'
local input = require 'lib.helium.core.input'
local useState = require 'lib.helium.hooks.state'

local pointLayerCreator = helium(
---comment
---@param props AppState
---@param view {w: number, h:number}
---@return function
function(props, view)
    local pointState = props.pointState
    local points = pointState.points

    return function ()
        for i, p in ipairs(points) do
            love.graphics.setColor(1,1,1)
            love.graphics.circle("fill", p.x,p.y, 4)
            love.graphics.setColor(.3,.7,1)
            love.graphics.circle("fill", p.x,p.y, 2)
        end
    end
end)

return pointLayerCreator