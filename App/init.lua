local helium = require 'lib.helium'
local useState = require 'lib.helium.hooks.state'
local ControlPanel = require 'App.Controls.ControlPanel'
local ImageView = require 'App.ImageView.init'

---@class WindowState
---@field width number
---@field height number
---@field panelScale number
local WindowState = {
    width = 0,
    height = 0,
    panelScale = .6
}

---@class ImageState
---@field canvas ?love.Canvas
---@field image ?love.Image
---@field path ?string
---@field setImage fun(ImageState, file)
local ImageState = {
    canvas = nil,
    image = nil,
    path = nil
}

---@class PointState
---@field count number
---@field points {x:number,y:number}[]
---@field addPoint fun(PointState)
---@field byePoint fun(PointState)
local PointState = {
    count = 20,
    points = {}
}

return helium(function(props, view)
    local imageState = useState(ImageState) ---@type ImageState
    local pointState = useState(PointState) ---@type PointState
    local windowState = useState(WindowState) ---@type WindowState

    windowState.width, windowState.height = view.w, view.h

    function imageState:setImage(file)
        local filepath = file:getFilename()
        local extension = filepath:match("^.+(%..+)$")
        if extension == '.png' then
            local image = love.graphics.newImage(love.filesystem.newFileData(file:read()))
            file:close()
            image:setFilter('linear','linear')
            self.image = image
            self.path = filepath
        end
    end

    function pointState:addPoint()
        self.count = self.count + 1
    end

    function pointState:byePoint()
        self.count = self.count - 1
    end

    ---@class AppState
    local AppState = {
        imageState = imageState,
        pointState = pointState,
        windowState = windowState,
    }

    local Iwidth, Iheight = windowState.panelScale * windowState.width, windowState.height
    local Cwidth, Cheight = (1-windowState.panelScale) * windowState.width, windowState.height
    local image = ImageView(AppState, Iwidth, Iheight)
    local controls = ControlPanel(AppState, Cwidth, Cheight)

    return function ()
        local layout = (require 'lib.helium.layout.row').new():width(view.w, view.h)
        image:draw()
        controls:draw()
        layout:draw()
    end
end)