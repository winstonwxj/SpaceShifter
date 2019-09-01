return {
    {
        name = '攻击1',
        icon = 'attack1',
        score = 1,
        effect = function(self, enemy)
            enemy.life = enemy.life - 1
        end,
    },
    {
        name = '治疗3',
        icon = 'heal3',
        score = 1,
        effect = function(self, enemy)
            self.life = self.life + 3
        end,
    },
    {
        -- heal3 and pick up 2 cards
        name = '神智清醒',
        icon = 'phoenix',
        score = 3,
        effect = function(self, enemy)
            self.life = self.life + 3
            self.drawCards(2)
        end,
    }
}