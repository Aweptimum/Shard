if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local helium = require 'lib.helium'
local scene = helium.scene.new(true)

local App = require 'App'

love.window.setMode(1000, 800, {resizable = true})
local X, Y = love.graphics.getDimensions()
local a = App({}, X, Y)

scene:activate()
a:draw(0,0)

function love.load()
    --
end

function love.update(dt)
    scene:update(dt)
end

function love.resize(w,h)
    scene:resize(w,h)
    a:draw(0,0, w,h)
end

function love.draw()
    scene:draw()
end