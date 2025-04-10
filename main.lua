require "scene_manager"
require "scenes"

love.window.setMode(640, 320, { resizable = true, vsync = true })
love.graphics.setDefaultFilter("nearest", "nearest")

local sceneManager = SceneManager:new()
-- Register scenes
sceneManager:addScene("menu", MainMenuScene:new(sceneManager))
sceneManager:addScene("game", GameScene:new(sceneManager))

-- Initial scene
sceneManager:changeScene("menu")

function love.load()
end

function love.update(dt)
    if sceneManager.currentScene and sceneManager.currentScene.update then
        sceneManager.currentScene:update(dt)
    end
end

function love.draw()
    if sceneManager.currentScene and sceneManager.currentScene.draw then
        sceneManager.currentScene:draw()
    end
end

function love.keypressed(key)
    if sceneManager.currentScene and sceneManager.currentScene.keypressed then
        sceneManager.currentScene:keypressed(key)
    end
    -- Handle global key events
    if key == "1" then
        sceneManager:changeScene("menu")
    elseif key == "2" then
        sceneManager:changeScene("game")
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if sceneManager.currentScene and sceneManager.currentScene.mousepressed then
        sceneManager.currentScene:mousepressed(x, y, button, istouch, presses)
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if sceneManager.currentScene and sceneManager.currentScene.mousereleased then
        sceneManager.currentScene:mousereleased(x, y, button, istouch, presses)
    end
end

function love.textinput(text)
    if sceneManager.currentScene and sceneManager.currentScene.textinput then
        sceneManager.currentScene:textinput(text)
    end
end
