local utils = require("utils")
local player = require("player.player")
local playerActions = require("player.actions")
local colossus = require("colossus.colossus")
local colossusActions = require("colossus.actions")

utils.enableUtf8()
utils.header()

local boss = colossus
local bossActions = colossusActions
utils.printCard(boss)

playerActions.build()
bossActions.build()


while true do
    --Player Turn
    print(
        string.format("qual sera a proxima acao de %s?",player.name)
    )
    
    local validPlayerActions = playerActions.getValidActions(player,boss) --acrescentar ao utils uma funcao displayActions
    for i, action in pairs(validPlayerActions) do
        print(
            string.format("%d. %s",i, action.description)
        )
    end

    local chosenId = utils.ask()
    local chosenAction = validPlayerActions[chosenId]
    local isActionValid = chosenAction ~= nil

    if isActionValid then
        chosenAction.execute(player,boss)
    else
        print(
            string.format("Sua acao eh invalida, %s perdeu a vez!",player.name)
        )
    end

    if boss.health <= 0 then
        break
    end

    --Boss Turn
    utils.cardLimite()
    local validBossActions = bossActions.getValidActions(player,boss)
    local bossAction = validBossActions[math.random(#validBossActions)]
    bossAction.execute(player,boss)
    utils.cardLimite()
    if player.health <= 0 then
        break
    end
end