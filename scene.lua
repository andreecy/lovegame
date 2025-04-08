local love = require "love"

---@class Scene
---@field canvas love.Canvas
---@field sceneManager SceneManager
Scene = {}
Scene.__index = Scene

-- constructor
---@param sceneManager SceneManager
---@return Scene
function Scene:new(sceneManager)
    local o = setmetatable({}, self)
    o.sceneManager = sceneManager -- Set on the instance, not the class
    o.canvas = love.graphics.newCanvas(640, 320)
    return o
end

function Scene:enter()
    -- Override in subclasses
end

function Scene:exit()
    -- Override in subclasses
end

function Scene:update(dt)
    -- Override in subclasses
end

function Scene:draw()
    -- Override in subclasses
end

function Scene:mousepressed(x, y, button)
    -- Override in subclasses
end

function Scene:mousereleased(x, y, button)
    -- Override in subclasses
end

function Scene:keypressed(key)
    -- Override in subclasses
end

function Scene:keyreleased(key)
    -- Override in subclasses
end

function Scene:textinput(text)
    -- Override in subclasses
end
