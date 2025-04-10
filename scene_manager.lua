-- SceneManager class to manage different scenes in the game
---@class SceneManager
---@field currentScene Scene
---@field scenes table<string, Scene>
SceneManager = {}

-- SceneManager class constructor
---@return SceneManager
function SceneManager:new()
    SceneManager.__index = SceneManager
    self = setmetatable({}, SceneManager)
    self.currentScene = nil
    self.scenes = {}
    return self
end

-- Add a scene to the manager
function SceneManager:addScene(name, scene)
    self.scenes[name] = scene
end

-- Change the current scene
function SceneManager:changeScene(name)
    if self.currentScene then
        if self.currentScene.exit then
            self.currentScene:exit()
        end
    end

    self.currentScene = self.scenes[name]

    if self.currentScene then
        if self.currentScene.enter then
            self.currentScene:enter()
        end
    end
end
