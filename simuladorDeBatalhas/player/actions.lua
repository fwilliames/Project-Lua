local utils = require("utils")
local actions = {}

    actions.list = {}

    function actions.build()
        actions.list = {}

        local swordAttack = {
            description = "Atacar com a espada",
            requirement = nil,
            execute = function (playerData, creatureData)
                --Calcula a chance de acerto do golpe
                local sucessChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
                local sucess = math.random() <= sucessChance

                --Calculo de dano
                local rawDamage = playerData.attack - math.random() * creatureData.defense
                local damage = math.max(1,math.ceil(rawDamage))

                --Apresentando o resultado
                if sucess then
                    print(
                        string.format("%s acertou a %s e deu %d pontos de dano!",playerData.name,creatureData.name,damage)
                    )
                    creatureData.health = creatureData.health - damage
                    local healthRate = math.floor((creatureData.health / creatureData.maxHealth) * 10)
                    print(
                        string.format("%s: %s",creatureData.name, utils.getProgressBar(healthRate))
                    )
                else
                    print(
                        string.format("%s errou o ataque!",playerData.name)
                    )
                end
            end         
        }

        local regenPotion = {
            description = "toma uma poção de regeneração",

            requirement = function(playerData, creatureData)
                return playerData.potion >= 1
            end,

            execute = function (playerData, creatureData)
                --Retira um pote do inventario do Player
                playerData.potion = playerData.potion - 1

                --Recuperando vida
                local regenPoints = 10
                playerData.health = math.min(playerData.maxHealth,playerData.health + regenPoints)
                print("Voce usou um pote de regeneracao e recuperou alguns pontos de vida")

            end
        }
        actions.list[#actions.list + 1] = swordAttack

        actions.list[#actions.list + 1] = regenPotion
    end

    --[[
    Returns a list of valid actions for a specific player and creature, based on requirements.

    Parameters:
    - playerData: A table containing player data.
    - creatureData: A table containing creature data.

    Returns:
    A table containing the actions that meet the requirements for the player and creature.

    Example Usage:
    local validActions = actions.getValidActions(playerData, creatureData)
    for _, action in ipairs(validActions) do
        print("Valid action: " .. action.name)
    end
]]
    function actions.getValidActions(playerData, creatureData)
        local validActions = {}
        
        for _, action in pairs(actions.list) do 
            local requirement = action.requirement
            local isValid = requirement == nil or requirement(playerData,creatureData)

            if isValid then
                validActions[#validActions + 1] = action
            end       
        end
        return validActions
    end

return actions