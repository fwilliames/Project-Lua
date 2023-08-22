local utils = require("modules.utils")

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
        Displays the list of available heroes for selection.

        Usage:
        game.displayHeros()
    ]]
    function game.displayHeros()
        local heros ={"violet","mervin"}
        for i, hero in pairs(heros) do
            print(
                string.format("%d %s", i, hero)
            )
        end
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
        local creature, creatureActions = game.defCreature()
        local player, playerActions = game.defPlayer()
        game.actionsBuild(playerActions,creatureActions)

        return creature, creatureActions, player, playerActions
    end

    --[[
        Builds player and creature actions, preparing them for the game.

        Parameters:
        - playerActions: A table containing player actions.
        - creatureActions: A table containing creature actions.

        Usage:
        game.actionsBuild(playerActions, creatureActions)
    ]]
    function game.actionsBuild(playerActions, creatureActions)
        playerActions.build()
        creatureActions.build()
        
    end

    --[[
        Randomly defines a creature for the game, loading its data and corresponding actions.

        Returns:
        - creature: A table containing creature data.
        - creatureActions: A table containing creature actions.

        Usage:
        local creature, creatureActions = game.defCreature()
    ]]
    function game.defCreature()
        local randomCreature = math.random(0,1)
        local chosenCreature = ""

        if randomCreature == 1 then
            chosenCreature = "drake"
        else
            chosenCreature = "colossus"

        end
        local creature = require("characters.creatures.".. chosenCreature ..".data")
        local creatureActions = require("characters.creatures.".. chosenCreature ..".actions")
        utils.printCard(creature)
        
        return creature, creatureActions
    end

    --[[
        Defines the player's hero for the game, loading their data and corresponding actions.

        Returns:
        - player: A table containing the player's hero data.
        - playerActions: A table containing the player's hero actions.

        Usage:
        local player, playerActions = game.defPlayer()
    ]]
    function game.defPlayer()
        
        local chosenPlayer = game.chosenPlayer()

        local player = require("characters.heros.".. chosenPlayer ..".data")
        local playerActions = require("characters.heros.".. chosenPlayer ..".actions")

        return player, playerActions
    end

    --[[
        Allows the player to choose their hero from the list of available heroes.

        Returns:
        - chosenPlayer: The name of the hero chosen by the player.

        Usage:
        local chosenPlayer = game.chosenPlayer()
    ]]
    function game.chosenPlayer()
        print("Escolha quem será seu Héroi")
        game.displayHeros()

        local chosenPlayer = utils.ask()
        if chosenPlayer == 1 then
            chosenPlayer = "violet"
        else
            chosenPlayer = "Mervin"
        end
        os.execute("cls")
        return chosenPlayer
    end

    --[[
        Displays information about a character, considering whether it is a hero mage, a hero non mage, or a creature.

        Parameters:
        - character: A table containing character data.

        Usage:
        game.printInformation(character)
    ]]
    function game.printInformation(character)
       
        if character.hero then
            if character.mage then
                game.printMageInformation(character)
            else
                game.printPhysicalInformation(character)
            end
        else
            local creatureRate = math.floor((character.health / character.maxHealth) * 10)
            print(
                string.format([[%s : Vida : %s]],character.name,utils.getProgressBar(creatureRate))
            )
        end
       
    end

    --[[
        Displays information about the player and the creature, including specific details for each.

        Parameters:
        - player: A table containing player data.
        - creature: A table containing creature data.

        Usage:
        game.displayInformation(player, creature)
    ]]
    function game.displayInformation(player,creature)
        game.printInformation(player)
        game.printInformation(creature)
        utils.cardLimite()
        
    end

    --[[
        Displays physical information about a character, including the health level.

        Parameters:
        - character: A table containing character data.

        Usage:
        game.printPhysicalInformation(character)
    ]]
    function game.printPhysicalInformation(character)
        local rate = 1
       
        if character.hero then
            rate = character.health
        else
            rate = math.floor((character.health / character.maxHealth) * 10)
        end
        print(
            string.format([[%s : Vida : %s]],character.name,utils.getProgressBar(rate))
        )
    end

    --[[
        Displays magical information about a character, including the health and mana levels.

        Parameters:
        - character: A table containing character data.

        Usage:
        game.printMageInformation(character)
    ]]
    function game.printMageInformation(character)
        local rate = character.health
        local mageRate = character.mana

        print(
            string.format([[%s : Vida : %s  Mana: %s]],character.name,utils.getProgressBar(rate),utils.getProgressBar(mageRate))
        )
        
    end

return game