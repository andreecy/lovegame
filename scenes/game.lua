GameScene = {}
GameScene.__index = GameScene

function GameScene.new(sceneManager)
    local self = setmetatable({}, GameScene)
    self.sceneManager = sceneManager
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
