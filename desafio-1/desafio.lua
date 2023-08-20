--O comando "os" serve para fazer o lua digitar comandos no terminal
os.execute("chcp 65001") -- muda a codificação do terminal para UTF-8
os.execute("cls")


--Criatura
local monsterName = "CREEPER"
local description = "Um monstro furtivo com temperamento explosivo"
local emoji ="💥"
local sound = "Tssssss"
local favoriteTime = "Noturno"
local item = "Polvora"

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
--Cartao
print("=================================================")
print("| ")
print("| " .. monsterName) -- ".." é o operador de concatenção
print("| " .. description)
print("| ")
print("| Item: " .. item)
print("| Som: " .. sound )
print("| Emoji Favorito: " .. emoji)
print("| Horario Favorito: " .. favoriteTime)

print("| ")
print("| Atributos")
print("|    Ataque:       " .. getProgressBar(attackAttribute))
print("|    Defesa:       " .. getProgressBar(defenseAttribute))
print("|    Vida:         " .. getProgressBar(vitalityAttribute))
print("|    Velocidade:   " .. getProgressBar(speedAttribute))
print("|    Inteligencia: " .. getProgressBar(inteligenceAttribute))
print("| ")
print("=================================================")