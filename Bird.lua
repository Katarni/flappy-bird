Bird = Class{}

local GRAVITY = 15

function Bird:init()
    self.image = love.graphics.newImage('img/bird.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = (VIRTUAL_WIDTH / 2) - (self.width / 2)
    self.y = (VIRTUAL_HEIGHT / 2) - (self.height / 2)

    self.dy = 0
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt

    self.y = self.y + self.dy

    if love.keyboard.wasPressed('space') or love.mouse.wasPressed(1) then
        self.dy = -5
        sounds['jump']:play()
    end
end

function Bird:collision(pipe)
    if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + pipe.width and self.y + 2 <= pipe.y + pipe.height and (self.y + 2) + (self.height - 4) >= pipe.y then
        return true
    end

    return false
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end