-- Ninja Enemy

local Enemy7 = {}
Enemy7.__index = Enemy7
local Player = require("player")

ActiveEnemys7 = {}

-- Removes object after each level
function Enemy7.removeAll()
    for i,v in ipairs(ActiveEnemys7) do
        v.physics.body:destroy()
    end
    ActiveEnemys7 = {}
end

-- Creates the location of the enemy7
function Enemy7.new(x, y)
    local instance = setmetatable({}, Enemy7)
    instance.x = x
    instance.y = y
    instance.offsetY = -8
    instance.r = 0

    instance.speed = 100
    instance.speedMod = 1
    instance.xVel = instance.speed

    instance.rageCounter = 0
    instance.rageTrigger = 3

    instance.damage = 1

    instance.state = "walk"

    instance.animation = {timer = 0, rate = 0.1}
    instance.animation.run = {total = 4, current = 1, img = Enemy7.runAnim}
    instance.animation.walk = {total = 4, current = 1, img = Enemy7.walkAnim}
    instance.animation.draw = instance.animation.walk.img[1]

    instance.physics = {}
    instance.physics.body = love.physics.newBody(World, instance.x, instance.y, "dynamic")
    instance.physics.body:setFixedRotation(true)
    instance.physics.shape = love.physics.newRectangleShape(instance.width * 0.4, instance.height * 0.75)
    instance.physics.fixture = love.physics.newFixture(instance.physics.body, instance.physics.shape)
    instance.physics.body:setMass(25)
    table.insert(ActiveEnemys7, instance)
end

function Enemy7.loadAssets()
    Enemy7.runAnim = {}
    for i = 1, 4 do
        Enemy7.runAnim[i] = love.graphics.newImage("assets/enemy7/run/"..i..".png")
    end

    Enemy7.walkAnim = {}
    for i = 1, 4 do
        Enemy7.walkAnim[i] = love.graphics.newImage("assets/enemy7/walk/"..i..".png")
    end

    Enemy7.width = Enemy7.runAnim[1]:getWidth()
    Enemy7.height = Enemy7.runAnim[1]:getHeight()
end

function Enemy7:update(dt)
    self:syncPhysics()
    self:animate(dt)
end

function Enemy7:incrementRage()
    self.rageCounter = self.rageCounter + 1
    if self.rageCounter > self.rageTrigger then
        self.state = "run"
        self.speedMod = 3
        self.rageCounter = 0
    else
        self.state = "walk"
        self.speedMod = 1
    end
end


function Enemy7:flipDirection()
    self.xVel = -self.xVel
end


-- Animates the enemy7
function Enemy7:animate(dt)
    self.animation.timer = self.animation.timer + dt
    if self.animation.timer > self.animation.rate then
        self.animation.timer = 0
        self:setNewFrame()
    end
end

-- Set new images/ frames for the animation
function Enemy7:setNewFrame()
    local anim = self.animation[self.state]
    if anim.current < anim.total then
        anim.current = anim.current + 1
    else
        anim.current = 1
    end
    self.animation.draw = anim.img[anim.current]
end


function Enemy7:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel * self.speedMod, 100)
end


function Enemy7:draw()
    local scaleX = 3
    if self.xVel < 0 then
        scaleX = -3
    end
   
    love.graphics.draw(self.animation.draw, self.x, self.y + self.offsetY, self.r, scaleX, 3, self.width / 2, self.height / 2)
end

function Enemy7.updateAll(dt)
    for i, instance in ipairs(ActiveEnemys7) do
        instance:update(dt)
    end
end


function Enemy7.drawAll()
    for i, instance in ipairs(ActiveEnemys7) do
        instance:draw()
    end
end

function Enemy7.beginContact(a, b, collision)
    for i, instance in ipairs(ActiveEnemys7) do
        if a == instance.physics.fixture or b == instance.physics.fixture then
            if a == Player.physics.fixture or b == Player.physics.fixture then
                Player:takeDamage(instance.damage)
            end
            instance:incrementRage()
            instance:flipDirection()
        end
    end
end

return Enemy7