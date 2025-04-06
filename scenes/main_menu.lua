local love = require "love"

MainMenuScene = {}
MainMenuScene.__index = MainMenuScene

function MainMenuScene.new(sceneManager)
    local self = setmetatable({}, MainMenuScene)
    self.sceneManager = sceneManager
    self.canvas = love.graphics.newCanvas(640, 320)
    self.button = { x = 350, y = 280, width = 100, height = 40, text = "Start Game", hover = false }
    return self
end

function MainMenuScene:enter()
    print("MainMenuScene:enter")
end

function MainMenuScene:exit()
    print("MainMenuScene:exit")
end

function MainMenuScene:update(dt)
    local x, y = love.mouse.getPosition()
    local b = self.button
    b.hover = x >= b.x and x <= b.x + b.width and y >= b.y and y <= b.y + b.height
end

function MainMenuScene:mousepressed(x, y, button)
    if button == 1 then
        print(x, y)
        local b = self.button
        if x >= b.x and x <= b.x + b.width and y >= b.y and y <= b.y + b.height then
            self.sceneManager:changeScene("game")
        end
    end
end

function MainMenuScene:draw()
    love.graphics.setCanvas(self.canvas)
    local b = self.button
    if b.hover then
        love.graphics.setColor(0.8, 0.8, 0.8) -- Light gray for hover effect
    else
        love.graphics.setColor(1, 1, 1)       -- Default white color
    end
    love.graphics.rectangle("line", b.x, b.y, b.width, b.height)
    love.graphics.printf(b.text, b.x, b.y + 10, b.width, "center")

    love.graphics.rectangle("fill", 0, 0, 640, 320)

    love.graphics.setColor(1, 1, 1) -- Reset color to default
    love.graphics.setCanvas()       -- Reset to default canvas

    local screenWidth, screenHeight = love.graphics.getDimensions()
    local canvasWidth, canvasHeight = self.canvas:getDimensions()
    local scaleX = screenWidth / canvasWidth
    local scaleY = screenHeight / canvasHeight

    local scale = math.min(scaleX, scaleY)
    local offsetX = (screenWidth - canvasWidth * scale) / 2
    local offsetY = (screenHeight - canvasHeight * scale) / 2
    love.graphics.draw(self.canvas, offsetX, offsetY, 0, scale, scale)
    love.graphics.print("scaleX: " .. scaleX .. ", scaleY: " .. scaleY, 10, 10)
end

return MainMenuScene
