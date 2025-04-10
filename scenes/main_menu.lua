MainMenuScene = {}
setmetatable(MainMenuScene, { __index = Scene }) -- Inherit from Scene

function MainMenuScene:new(sceneManager)
    local self = Scene:new(sceneManager)            -- Create a new Scene instance
    setmetatable(self, { __index = MainMenuScene }) -- Set MainMenuScene as its metatable

    local width, height = 640, 320
    self.button = { x = width / 2 - 50, y = height / 2 - 20, width = 100, height = 40, text = "Start Game", hover = false }
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
        local b = self.button
        if x >= b.x and x <= b.x + b.width and y >= b.y and y <= b.y + b.height then
            self.sceneManager:changeScene("game")
        end
    end
end

function MainMenuScene:draw()
    self:canvasStart()
    local b = self.button
    if b.hover then
        love.graphics.setColor(0.8, 0.8, 0.8) -- Light gray for hover effect
    else
        love.graphics.setColor(1, 1, 1)       -- Default white color
    end
    love.graphics.rectangle("line", b.x, b.y, b.width, b.height)
    love.graphics.printf(b.text, b.x, b.y + 10, b.width, "center")

    -- love.graphics.rectangle("fill", 0, 0, 640, 320)

    self:canvasEnd()
    self:canvasRender()

    local mouseX, mouseY = self:getCanvasMousePosition()
    love.graphics.print("Mouse X: " .. mouseX .. ", Y: " .. mouseY, 10, 10)
end

return MainMenuScene
