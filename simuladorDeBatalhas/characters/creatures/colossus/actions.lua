local utils = require("modules.utils")
local actions = {}

    actions.list = {}

    --[[
        Constructs the list of available actions, including body attack, sonar attack, and wait action.

        Usage:
        actions.build()
    ]]
    function actions.build()
        actions.list = {}

        local bodyAttack = {
            description = "Atacar com o corpo",
            requirement = nil,
            execute = function (playerData, creatureData)
                --Calcula a chance de acerto do golpe
                local sucessChance = playerData.speed == 0 and 1 or creatureData.speed / playerData.speed
                local sucess = math.random() <= sucessChance

                --Calculo de dano
                local rawDamage = creatureData.attack - math.random() * playerData.defense
                local damage = math.max(1,math.ceil(rawDamage))

                --Apresentando o resultado
                if sucess then
                    print(
                        string.format("%s acertou a %s e deu %d pontos de dano!",creatureData.name,playerData.name,damage)
                    )
                    playerData.health = playerData.health - damage
                    local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
                    print(
                        string.format("%s: %s",playerData.name, utils.getProgressBar(healthRate))
                    )
                else
                    print(
                        string.format("%s errou o ataque!",creatureData.name)
                    )
                end
            end         
        }

        local sonarAttack = {
            description = "Atacar sonar",
            requirement = nil,
            execute = function (playerData, creatureData)
                --Calculo de dano
                local rawDamage = creatureData.attack - math.random() * playerData.defense
                local damage = math.max(1,math.ceil(rawDamage * 0.3))

                --Apresentando o resultado
                
                print(
                    string.format("%s usou o sonar e deu %d pontos de dano!",creatureData.name,damage)
                )
                playerData.health = playerData.health - damage
                local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
                print(
                    string.format("%s: %s",playerData.name, utils.getProgressBar(healthRate))
                )
            end  
        }

        local waitAction = {
            description = "Aguardar",
            requirement = nil,
            execute = function (playerData, creatureData)
                print(
                    string.format("%s decidiu esperar",creatureData.name)
                ) 
            end
        }

        
        actions.list[#actions.list + 1] = bodyAttack

        actions.list[#actions.list + 1] = sonarAttack

        actions.list[#actions.list + 1] = waitAction


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