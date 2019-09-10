local function baseDefaultTargetSlot(me, opponent)
    -- default to opponent slot
    local neighbourId = map:isNeighbour(me.slot, opponent.slot)
    if neighbourId == 0 then
        -- opponent is not neighbour, target self
        return me.slot
    else
        return opponent.slot
    end
end

return {
    ['attack1'] = {
        name = '戳刺',
        icon = 'attack1',
        score = 1,
        needChooseSlot = true,
        type = {'attack'},
        effect = function(me, opponent)
            me.attack = me.attack + 1
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['attack2'] = {
        name = '挥击',
        icon = 'attack2',
        score = 2,
        needChooseSlot = true,
        type = {'attack'},
        effect = function(me, opponent)
            me.attack = me.attack + 2
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['attack3'] = {
        name = '重劈',
        icon = 'attack3',
        score = 3,
        needChooseSlot = true,
        type = {'attack'},
        effect = function(me, opponent)
            me.attack = me.attack + 3
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['a1d1'] = {
        name = '格挡反击',
        icon = 'a1d1',
        score = 1.5,
        needChooseSlot = true,
        type = {'attack','defence'},
        effect = function(me, opponent)
            me.attack = me.attack + 1
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
            me.defence = me.defence + 1
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['a2d1'] = {
        name = '格挡重击',
        icon = 'a2d1',
        score = 2.5,
        needChooseSlot = true,
        type = {'attack','defence'},
        effect = function(me, opponent)
            me.attack = me.attack + 2
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
            me.defence = me.defence + 1
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['defence1'] = {
        name = '防御',
        icon = 'defence1',
        score = 1,
        needChooseSlot = false,
        type = {'defence'},
        effect = function(me, opponent)
            me.defence = me.defence + 1
        end,
    },
    ['heal1'] = {
        name = '喘息',
        icon = 'heal1',
        score = 1,
        needChooseSlot = false,
        type = {'heal'},
        effect = function(me, opponent)
            me.life = me.life + 1
        end,
    },
    ['heal2'] = {
        name = '包扎',
        icon = 'heal2',
        score = 2.5,
        needChooseSlot = false,
        type = {'heal'},
        effect = function(me, opponent)
            me.life = me.life + 2
        end,
    },
    ['pick2'] = {
        -- pick up 2 cards
        name = '休整',
        icon = 'pick2',
        score = 3,
        needChooseSlot = false,
        type = {'pick'},
        effect = function(me, opponent)
            me:pickCard()
            me:pickCard()
        end,
    },
    ['a1p1'] = {
        name = '戏法',
        icon = 'a1p1',
        score = 2,
        needChooseSlot = true,
        type = {'attack','pick'},
        effect = function(me, opponent)
            me.attack = me.attack + 1
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
            me:pickCard()
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['a2p1'] = {
        name = '诈术',
        icon = 'a2p1',
        score = 3,
        needChooseSlot = true,
        type = {'attack','pick'},
        effect = function(me, opponent)
            me.attack = me.attack + 2
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
            me:pickCard()
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['h1p2'] = {
        -- heal1 and pick up 2 cards
        name = '整理思绪',
        icon = 'h1p2',
        score = 3,
        needChooseSlot = false,
        type = {'heal','pick'},
        effect = function(me, opponent)
            me.life = me.life + 1
            me:pickCard()
            me:pickCard()
        end,
    },
    ['drop1'] = {
        name = '扰乱',
        icon = 'drop1',
        score = 1.5,
        needChooseSlot = true,
        type = {'drop'},
        effect = function(me, opponent)
            if me.targetSlot == opponent.slot then
                opponent:dropCard()
            end
        end,
        getExceptSlot = function(me, opponent)
            -- can target anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['drop2'] = {
        name = '混乱',
        icon = 'drop2',
        score = 2.5,
        needChooseSlot = true,
        type = {'drop'},
        effect = function(me, opponent)
            if me.targetSlot == opponent.slot then
                opponent:dropCard()
                opponent:dropCard()
            end
        end,
        getExceptSlot = function(me, opponent)
            -- can target anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['a1drop1'] = {
        name = '摄魂一击',
        icon = 'a1drop1',
        score = 2,
        needChooseSlot = true,
        type = {'attack','drop'},
        effect = function(me, opponent)
            me.attack = me.attack + 1
            -- space affect attack
            local space = map.slots[me.slot].card.space
            if space.onCalcAttack ~= nil then
                space.onCalcAttack(me, opponent)
            end
            if me.targetSlot == opponent.slot then
                opponent:dropCard()
            end
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['move'] = {
        name = '时空转移',
        icon = 'move',
        score = 1,
        needChooseSlot = true,
        type = {'move'},
        move = function(me)
            me.slot = me.targetSlot
        end,
        getExceptSlot = function(me, opponent)
            -- cant move to enemy slot
            return opponent.slot
        end,
        defaultTargetSlot = function(me, opponent)
            -- due to performance, default to self
            return me.slot
        end
    },
    ['spaceRecover'] = {
        name = '时空复原',
        icon = 'spaceRecover',
        score = 99,
        needChooseSlot = true,
        type = {'spaceRecover'},
        onChangeSpace = function(targetSlot)
            map:changeSpace(targetSlot, nil)
        end,
        getExceptSlot = function(me, opponent)
            -- can attack anywhere
            return nil
        end,
        defaultTargetSlot = function(me, opponent)
            return baseDefaultTargetSlot(me, opponent)
        end
    },
    ['universeRecover'] = {
        name = '宇宙复原',
        icon = 'universeRecover',
        score = 99,
        needChooseSlot = false,
        type = {'spaceRecover'},
        onChangeSpace = function(targetSlot)
            for i, _ in pairs(map.slots) do
                map:changeSpace(i, nil)
            end
        end,
    },
}