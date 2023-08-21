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
return utils