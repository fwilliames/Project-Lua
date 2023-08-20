--O comando "os" serve para fazer o lua digitar comandos no terminal
os.execute("chcp 65001") -- muda a codificação do terminal para UTF-8
os.execute("cls")

local monsterName = "CREEPER"
local description = "Um monstro furtivo com temperamento explosivo"
local emoji ="💥"

print("=================================================")
print("| " .. monsterName) -- ".." é o operador de concatenção
print("| " .. description)
print("| ")
print("| Emoji Favorito: " .. emoji)
print("=================================================")