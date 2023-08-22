local utils = {}
    --[[
        Enables UTF-8 encoding to support processing of special characters and accented characters.
        This is achieved by changing the code page to 65001 and clearing the console.
    ]]
    function utils.enableUtf8()
        os.execute("chcp 65001") 
        os.execute("cls") 
    end

    --[[
        Displays a line composed of equal characters, creating a "limit card".
        This card is used for visual separation or delimitation in text outputs.

        Usage:
        utils.cardLimite()
    ]]
    function utils.cardLimite()
        local limit = "="
        local result = ""
        for i = 1, 100, 1 do
            result = result .. limit
        end
        print(result)
    end

    --[[
        Returns a stylized line for use in visual compositions, such as a "line card".

        Returns:
        A string containing a stylized line for visual delimitation.

        Example Usage:
        local line = utils.line()
        print(line .. "Important text here")
    ]]
    function utils.line()
        return "| "  
    end

    --[[
        Displays a stylized header with a title and a boundary line, creating a visual presentation.

        Usage:
        utils.header()
    ]]
    function utils.header()
        print(utils.cardLimite())
        print([[
               /\                                                                       /\
     _         )( ______________________                         ______________________ )(         _
    (_)///////(**)______________________> Simulador de Batalhas <______________________(**)\\\\\\\(_)
               )(                                                                       )(
               \/                                                                       \/
                    
        ]])
        print(utils.cardLimite())
        print([[
                                    Voce Empunha sua espada e se prepara para lutar.
                                            ⚔ É hora da batalha!!! ⚔
        ]]) 
    end

    --[[
        Returns a graphical representation of a progress bar based on the provided attribute.
        
        Parameters:
        - attribute: An integer number representing the current progress (ranging from 0 to 10).

        Returns:
        A string containing a progress bar composed of filled and empty blocks, 
        as determined by the value of the attribute.

        Example Usage:
        local progress = utils.getProgressBar(7)
        print("Progress: " .. progress)
    ]]
    function utils.getProgressBar(attribute)
        local fullChar = "⚪"
        local emptyChar = "⚫"
        local result = ""

        for i = 1, 10, 1 do
            if i <= attribute then
                result = result .. fullChar
            else
                result = result .. emptyChar
            end       
        end
        return result
    end

    --[[
        Displays a formatted card for a creature, showing its attributes and information.

        Parameters:
        - creature: A table containing information about the creature to be displayed.

        Usage:
        utils.printCard(creature)
    ]]
    function utils.printCard(creature)

        local healthRate = math.floor((creature.health / creature.maxHealth) * 10)
        local line = utils.line()
        utils.cardLimite()
        print(line)
        print(line .. creature.name)
        print(line .. "Descrição")
        print(line .. "   "  .. creature.description)
        print(line)
        print(line .. "Atributos")
        print(line .. "   Vida:         " .. utils.getProgressBar(healthRate))
        print(line .. "   Ataque:       " .. utils.getProgressBar(creature.attack))
        print(line .. "   Defesa:       " .. utils.getProgressBar(creature.defense))
        print(line .. "   Velocidade:   " .. utils.getProgressBar(creature.speed))
        print(line)
        utils.cardLimite()
    
    end

    --[[
    Prompts the user for a numeric input and returns the response.

    Returns:
    The number inputted by the user.

    Usage:
    local userInput = utils.ask()
    print("You entered: " .. userInput)
]]
    function utils.ask()
        io.write("> ")
        local answer = io.read("*n")
        return answer      
    end

    function utils.footer(playerData, creatureData)
        if playerData.health <= 0 then
            local line = utils.line()
            utils.cardLimite()
            print(line)
            print(line .. "😢😢😢😢😢😢😢😢😢😢😢")
            print(
                string.format("%s%s nao foi capaz de vencer %s",line,playerData.name, creatureData.name)
            )
            print(line .."Quem sabe na proxima vez....")
            print(line)
        elseif creatureData.health <=0 then
            local line = utils.line()
            utils.cardLimite()
            print(line)
            print(line .."🥳🥳🥳🥳🥳🥳🥳🥳🥳🥳")
            print(
                string.format("%s%s prevaleceu e venceu %s",line,playerData.name, creatureData.name)
            )
            print(line .."Parabens!!!!!!!")
            print(line)       
        end
    end

return utils