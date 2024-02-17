local helium = require 'lib.helium'
local input = require 'lib.helium.core.input'
local useState = require 'lib.helium.hooks.state'

local imageViewCreator = helium(
---comment
---@param param AppState
---@param view {w: number, h:number}
---@return function
function(param, view)
    local imageState = param.imageState
    local scaleState = useState( {sx = 1, sy = 1, scale = 1} )

	input('filedropped', function(file)
        imageState:setImage(file)
    end)

    return function()
        if imageState.image then
            local ix, iy = imageState.image:getDimensions()
            local sx, sy = view.w/ix, view.h/iy
            scaleState.sx, scaleState.sy  = sx, sy
            scaleState.sx, scaleState.sy = view.w/ix, view.h/iy
            --print(view.w..', '..view.y)
            scaleState.scale = math.min(scaleState.sx, scaleState.sy)
            love.graphics.push()
            love.graphics.scale( scaleState.scale, scaleState.scale )
            love.graphics.draw( imageState.image, 0, 0, 0)
            love.graphics.pop()
        else
            love.graphics.rectangle('fill',0,0, view.w, view.h)
        end
    end
end)

return imageViewCreator