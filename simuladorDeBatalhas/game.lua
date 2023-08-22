local utils = require("utils")
local colossus = require("character.creatures.colossus.colossus")
local colossusActions = require("character.creatures.colossus.actions")
local violet = require("character.hero.violet.violet")
local violetActions = require("character.hero.violet.actions")

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

    --[[
        Performs the hero's (player's) turn, allowing the choice and execution of a valid action.

        Parameters:
        - playerData: A table containing player data.
        - PlayerActions: A table containing player actions.
        - creatureData: A table containing creature data.

        Usage:
        game.heroTurn(playerData, PlayerActions, creatureData)
    ]]
    function game.heroTurn(playerData,PlayerActions,creatureData)
        print(
        string.format("qual sera a proxima acao de %s?",playerData.name)
        )
        local validPlayerActions = game.displayActions(playerData,PlayerActions,creatureData)

        local chosenId = utils.ask()
        local chosenAction = validPlayerActions[chosenId]
        local isActionValid = chosenAction ~= nil
    
        os.execute("cls")
        utils.cardLimite()

        if isActionValid then
            chosenAction.execute(playerData,creatureData)
        else
            print(
                string.format("Sua acao eh invalida, %s perdeu a vez!",playerData.name)
            )
        end       
    end

    --[[
        Performs the boss's (creature's) turn, allowing the choice and execution of a valid action.

        Parameters:
        - playerData: A table containing player data.
        - creatureData: A table containing creature data.
        - creatureActions: A table containing creature actions.

        Usage:
        game.bossTurn(playerData, creatureData, creatureActions)
    ]]
    function game.bossTurn(playerData,creatureData,creatureActions)
        utils.cardLimite()
        local validBossActions = creatureActions.getValidActions(playerData,creatureData)
        local bossAction = validBossActions[math.random(#validBossActions)]
        bossAction.execute(playerData,creatureData)
        utils.cardLimite()        
    end

    --[[
        Sets up the beginning of the game, preparing creatures, creature actions, players, and player actions.

        Returns:
        - creature: A table containing creature data.
        - creatureActions: A table containing creature actions.
        - player: A module representing the player.
        - playerActions: A table containing player actions.

        Usage:
        local creature, creatureActions, player, playerActions = game.setup()
    ]]
    function game.setup()

        local creature = colossus
        local creatureActions = colossusActions
        utils.printCard(creature)

        local player = violet
        local playerActions = violetActions

        creatureActions.build()
        playerActions.build()

        return creature, creatureActions, player, playerActions
    end

return game