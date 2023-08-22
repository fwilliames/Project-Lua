local game = {}

    --[[
        Displays valid actions available to the player along with their descriptions.

        Parameters:
        - playerData: A table containing player data.
        - playerActions: A table containing player actions.
        - creatureData: A table containing creature data.

        Returns:
        A table containing valid actions available to the player.

        Usage:
        local validActions = game.displayActions(playerData, playerActions, creatureData)
    ]]
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