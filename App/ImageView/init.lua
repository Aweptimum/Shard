local helium = require 'lib.helium'
local input = require 'lib.helium.core.input'
local useState = require 'lib.helium.hooks.state'

local ImageLayer = require 'App.ImageView.Layers.ImageLayer'
local PointLayer = require 'App.ImageView.Layers.PointLayer'

local imageViewCreator = helium(
---comment
---@param param AppState
---@param view {w: number, h:number}
---@return function
function(param, view)
    local image = ImageLayer(param, view.w, view.h)
    local point = PointLayer(param, view.w, view.h)

    return function()
        image:draw(0,0)
        point:draw(0,0)
    end
end)

return imageViewCreator