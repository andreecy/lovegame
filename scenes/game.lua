GameScene = {}

function GameScene:new(sceneManager)
    local self = Scene:new(sceneManager)
    setmetatable({}, self)
    self.__index = self
    return self
end

function GameScene:enter()
    print("GameScene:enter")
end

function GameScene:exit()
    print("GameScene:exit")
end

function GameScene:update(dt)
end

function GameScene:draw()
    love.graphics.print("GameScene", 400, 300)
end

return GameScene
