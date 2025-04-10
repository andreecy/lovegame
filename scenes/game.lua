GameScene = {}
setmetatable(GameScene, { __index = Scene })

function GameScene:new(sceneManager)
    local self = Scene:new(sceneManager)
    setmetatable(self, { __index = GameScene }) -- Set GameScene as its metatable
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
