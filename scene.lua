---@class Scene
---@field canvas love.Canvas
---@field sceneManager SceneManager
Scene = {}
Scene.__index = Scene

-- base class for all scenes
---@param sceneManager SceneManager
---@return Scene
function Scene:new(sceneManager)
    local o = setmetatable({}, self)
    o.sceneManager = sceneManager -- Set on the instance, not the class
    o.canvas = love.graphics.newCanvas(640, 320)
    return o
end

-- Start drawing in the canvas
function Scene:canvasStart()
    love.graphics.setCanvas(self.canvas)
    -- love.graphics.clear()
end

-- End drawing in the canvas
function Scene:canvasEnd()
    love.graphics.setColor(1, 1, 1) -- Reset color to default
    love.graphics.setCanvas()
end

-- Draw canvas to the screen
function Scene:canvasRender()
    local screenWidth, screenHeight = love.graphics.getDimensions()
    local canvasWidth, canvasHeight = self.canvas:getDimensions()
    local scaleX = screenWidth / canvasWidth
    local scaleY = screenHeight / canvasHeight

    local scale = math.min(scaleX, scaleY)
    local offsetX = (screenWidth - canvasWidth * scale) / 2
    local offsetY = (screenHeight - canvasHeight * scale) / 2
    love.graphics.draw(self.canvas, offsetX, offsetY, 0, scale, scale)
    -- love.graphics.print("scaleX: " .. scaleX .. ", scaleY: " .. scaleY, 10, 10)
end

-- Get the dimensions of the screen and canvas
---@return table
function Scene:getDimensions()
    local screenWidth, screenHeight = love.graphics.getDimensions()
    local canvasWidth, canvasHeight = self.canvas:getDimensions()
    local scaleX = screenWidth / canvasWidth
    local scaleY = screenHeight / canvasHeight

    local scale = math.min(scaleX, scaleY)
    local offsetX = (screenWidth - canvasWidth * scale) / 2
    local offsetY = (screenHeight - canvasHeight * scale) / 2

    return {
        screenWidth = screenWidth,
        screenHeight = screenHeight,
        canvasWidth = canvasWidth,
        canvasHeight = canvasHeight,
        scaleX = scaleX,
        scaleY = scaleY,
        scale = scale,
        offsetX = offsetX,
        offsetY = offsetY,
    }
end

-- Get the mouse position in the canvas
---@return number, number
function Scene:getCanvasMousePosition()
    local mouseX, mouseY = love.mouse.getPosition()

    local dim = self:getDimensions()
    print('dim', dim)
    local offsetX = dim.offsetX
    local offsetY = dim.offsetY
    local scale = dim.scale

    return (mouseX - offsetX) / scale, (mouseY - offsetY) / scale
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
