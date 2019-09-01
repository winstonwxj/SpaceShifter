local Button = class {}

function Button:init(text, width, height, idleBGColor, selectBGColor, confirmCallback)
    self.text = text
    self.width = width
    self.height = height
    self.idleBGColor = idleBGColor
    self.selectBGColor = selectBGColor
    self.confirmCallback = confirmCallback
    
    self.textWidth = love.graphics.getFont():getWidth(text)
end

function Button:setSelect(isSelect)
    self.isSelect = isSelect
end

function Button:draw(x, y)
    -- idle background
    if self.idleBGColor and not self.isSelect then
        setColor(self.idleBGColor)
        love.graphics.rectangle('fill', x,y, self.width,self.height)
    end
    
    -- selected background
    if self.selectBGColor and self.isSelect then
        setColor(self.selectBGColor)
        love.graphics.rectangle('fill', x,y, self.width,self.height)
    end
    
    --text
    drawText(self.text, x + math.floor((self.width-self.textWidth)/2), y)
end

function Button:keypressed(key)
    if key == keys.A and self.isSelect then
        self.confirmCallback()
    end
end

return Button