LoseState = {}

local windowWidth = 144
local windowHeight = 64
local buttonWidth, buttonHeight = 128, 18

function LoseState:init()
    self.window = Window()
    self.buttons = SelectionGroup()
    self.restartButton = Button('重来', buttonWidth, buttonHeight,
            buttonIdleColor, buttonSelectColor, function()
                GameState.switch(InitState)
            end)
    self.exitButton = Button('退出', buttonWidth, buttonHeight,
            buttonIdleColor, buttonSelectColor, function ()
                GameState.switch(IdleState)
                screenManager:view('/')
            end)
    self.buttons:add(self.restartButton)
    self.buttons:add(self.exitButton)
    self.buttonStartY = (screenHeight-windowHeight)/2 + 24
end

function LoseState:draw()
    local windowX = (screenWidth - windowWidth )/2
    local windowY = (screenHeight - windowHeight)/2
    self.window:draw(windowX, windowY, windowWidth, windowHeight)
    
    setColor(white)
    love.graphics.printf('失败!', windowX, windowY + 2, windowWidth, 'center')
    
    self.restartButton:draw((screenWidth-buttonWidth)/2, self.buttonStartY)
    self.exitButton:draw((screenWidth-buttonWidth)/2, self.buttonStartY+buttonHeight)
end

function LoseState:keypressed(key)
    self.buttons:keypressed(key)

    if key == keys.DPad_up then
        self.buttons:Prev()
    elseif key == keys.DPad_down then
        self.buttons:Next()
    end
end