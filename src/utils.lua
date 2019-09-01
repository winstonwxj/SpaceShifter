function drawText(text, x, y, color)
    color = color or white
    setColor(color)
    love.graphics.print(text, x, y+3)
end

function setColor(color)
    love.graphics.setColor({color[1]/255, color[2]/255, color[3]/255})
end

function drawFPS()
    setColor(white)
    love.graphics.print(tostring(love.timer.getFPS( )), 8, 8)
end

function drawLogs()
    setColor(white)
    for _,log in pairs(logs) do
        love.graphics.print(log, 8, 16)
    end
    
end

--Create card
function createRandomCard(scoreRange)
    --random action and space
    local action, space, totalScore
    repeat
        action = actions[math.random(#actions)]
        space = spaces[math.random(#spaces)]
        totalScore = action.score + space.score
    until totalScore >= scoreRange[1] and totalScore <= scoreRange[2]
    
    local card = {action = action, space = space}
    return card
end

function fillAllDecks()
    for _, deck in pairs(decks) do
        deck.cards = {}
        for i = 1, deck.size do
            deck.cards[i] = createRandomCard(deck.scoreRange)
        end
    end
end

function drawCardAsAction(card, x, y)
    setColor(cardActionColor)
    love.graphics.rectangle('fill', x, y, cardWidth, cardHeight)
    setColor(white)
    love.graphics.printf(card.action.name, x, y+cardHeight/2-fontSize, cardWidth, 'center')
end

function drawCardAsSpace(card, x, y)
    setColor(cardSpaceColor)
    love.graphics.rectangle('fill', x, y, cardWidth, cardHeight)
    setColor(white)
    love.graphics.printf(card.space.name, x, y+cardHeight/2-fontSize, cardWidth, 'center')
end

function reload(packageName)
    package.loaded[packageName] = nil
    return require(packageName)
end

function random(m, n)
    math.randomseed(os.time())
    return math.random(m,n)
end

function random(n)
    math.randomseed(os.time())
    return math.random(1,n)
end