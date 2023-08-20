--O comando "os" serve para fazer o lua digitar comandos no terminal
os.execute("chcp 65001") -- muda a codificação do terminal para UTF-8
os.execute("cls")

local CARD_LIMIT <const> = "#"
local LINE_CARD <const> = "--- "

--Criatura
local monsterName = "CREEPER"
local monsterDescription = "Um monstro furtivo com temperamento explosivo"
local monsterEmoji ="💥"
local monsterSound = "Tssssss"
local monsterFavoriteTime = "Noturno"
local monsterItem = "Polvora"

--Atributos
local attackAttribute = 10
local defenseAttribute = 1
local vitalityAttribute = 5
local speedAttribute = 7
local inteligenceAttribute = 2

local function getProgressBar(attribute)
    local fullChar = "⬜"
    local emptyChar = "⬛"
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

local function cardLimite(limit)
    local result = ""
    for i = 1, 50, 1 do
        result = result .. limit
    end
    print(result)
end

local function cardLine(line)
    return line
    
end

local function printCard(name, description, emoji, sound, favoriteTime, item, attack, defense, vitality, speed, inteligence)
    cardLimite(CARD_LIMIT)
    print(cardLine(LINE_CARD))
    print(cardLine(LINE_CARD) .. name)
    print(cardLine(LINE_CARD) .. description)
    print(cardLine(LINE_CARD))
    print(cardLine(LINE_CARD) .. "Item: " .. item)
    print(cardLine(LINE_CARD) .. "Som: " .. sound )
    print(cardLine(LINE_CARD) .. "Emoji Favorito: " .. emoji)
    print(cardLine(LINE_CARD) .. "Horario Favorito: " .. favoriteTime)
    print(cardLine(LINE_CARD))
    print(cardLine(LINE_CARD) .. "Atributos")
    print(cardLine(LINE_CARD) .. "   Ataque:       " .. getProgressBar(attack))
    print(cardLine(LINE_CARD) .. "   Defesa:       " .. getProgressBar(defense))
    print(cardLine(LINE_CARD) .. "   Vida:         " .. getProgressBar(vitality))
    print(cardLine(LINE_CARD) .. "   Velocidade:   " .. getProgressBar(speed))
    print(cardLine(LINE_CARD) .. "   Inteligencia: " .. getProgressBar(inteligence))
    print(cardLine(LINE_CARD))
    cardLimite(CARD_LIMIT)
    
end


--Cartao
print("=================================================")
print("| ")
print("| " .. monsterName) -- ".." é o operador de concatenção
print("| " .. monsterDescription)
print("| ")
print("| Item: " .. monsterItem)
print("| Som: " .. monsterSound )
print("| Emoji Favorito: " .. monsterEmoji)
print("| Horario Favorito: " .. monsterFavoriteTime)
print("| ")
print("| Atributos")
print("|    Ataque:       " .. getProgressBar(attackAttribute))
print("|    Defesa:       " .. getProgressBar(defenseAttribute))
print("|    Vida:         " .. getProgressBar(vitalityAttribute))
print("|    Velocidade:   " .. getProgressBar(speedAttribute))
print("|    Inteligencia: " .. getProgressBar(inteligenceAttribute))
print("| ")
print("=================================================")


--Criatura 2

--Criatura
local monsterName = "Dragão"
local monsterDescription = "Um monstro voador que cospe fogo"
local monsterEmoji ="🔥"
local monsterSound = "Grrrrrrrrrr"
local monsterFavoriteTime = "Noturno"
local monsterItem = "Couro Ardente"

--Atributos
local attackAttribute = 10
local defenseAttribute = 10
local vitalityAttribute = 10
local speedAttribute = 3
local inteligenceAttribute = 8

printCard(monsterName, monsterDescription, monsterEmoji, monsterSound, monsterFavoriteTime, monsterItem, attackAttribute, defenseAttribute, vitalityAttribute, speedAttribute, inteligenceAttribute)