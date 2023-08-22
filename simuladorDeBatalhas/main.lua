local utils = require("utils")
local player = require("player.player")
local playerActions = require("player.actions")
local colossus = require("colossus.colossus")

utils.enableUtf8()
utils.header()

local boss = colossus
utils.printCard(boss)
playerActions.build()


while true do
    --Player Turn
    print("O que voce deseja fazer?")
    
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
        print("Sua acao eh invalida")
    end

    if boss.health <= 0 then
        break
    end

    --Boss Turn
    if player.health <= 0 then
        break
    end
end