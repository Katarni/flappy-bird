PipePair = Class{}

function PipePair:init(y) 
    local GAP_HEIGHT = math.random(90, 110)

    self.x = VIRTUAL_WIDTH + 32
    self.y = y

    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['bottom'] = Pipe('bootom', self.y + GAP_HEIGHT + PIPE_HEIGHT)
    }

    self.remove = false
    self.scored = false
end

function PipePair:update(dt) 
    if self.x > -PIPE_WIDTH then
        self.x = self.x + PIPE_SCROLL * dt
        self.pipes['upper'].x = self.x
        self.pipes['bottom'].x = self.x
    else
        self.remove = true
    end
end

function PipePair:render()
    for k, pipe in pairs(self.pipes) do
        pipe:render()
    end
end