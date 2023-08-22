local game = {}
    function game.displayActions(playerData,playerActions, creatureData)
        local validheroActions = playerActions.getValidActions(playerData,creatureData) --acrescentar ao utils uma funcao displayActions
        for i, action in pairs(validheroActions) do
            print(
                string.format("%d. %s",i, action.description)
            )
        end
        return validheroActions
    end
return game