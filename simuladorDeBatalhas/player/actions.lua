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
                        string.format("Voce acertou a criatura e deu %d pontos de dano!")
                    )
                    creatureData.health = creatureData.health - damage
                else
                    print("Voce errou o ataque!")
                end
            end         
        }
        actions.list[#actions + 1] = swordAttack


        
    end

return actions