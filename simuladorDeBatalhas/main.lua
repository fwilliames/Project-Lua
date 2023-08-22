local utils = require("utils")
local player = require("player.player")
local playerActions = require("player.actions")
local colossus = require("colossus.colossus")
local colossusActions = require("colossus.actions")
local game = require("game")

utils.enableUtf8()
utils.header()

local boss = colossus
local bossActions = colossusActions
utils.printCard(boss)

local hero = player
local heroActions = playerActions

heroActions.build()
bossActions.build()


while true do
    --hero Turn
    game.heroTurn(hero,heroActions,boss)
    
    if boss.health <= 0 then
        break
    end

    --Boss Turn
    utils.cardLimite()
    local validBossActions = bossActions.getValidActions(hero,boss)
    local bossAction = validBossActions[math.random(#validBossActions)]
    bossAction.execute(hero,boss)
    utils.cardLimite()
    if hero.health <= 0 then
        break
    end
end

utils.footer(hero,boss)

