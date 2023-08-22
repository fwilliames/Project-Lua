local utils = require("modules.utils")
local game = require("modules.game")

utils.enableUtf8()
utils.header()

local boss, bossActions, hero, heroActions = game.setup()

while true do
    --hero Turn
    game.heroTurn(hero,heroActions,boss)

    if boss.health <= 0 then
        break
    end

    --Boss Turn
    game.bossTurn(hero,boss,bossActions)
    
    if hero.health <= 0 then
        break
    end

end

utils.footer(hero,boss)

