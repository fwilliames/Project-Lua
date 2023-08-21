os.execute("chcp 65001")
os.execute("cls")


local ID_CREEPER <const> = 1
local ID_SKELETON <const> = 2
local ID_ZOMBIE <const> = 3
local ID_DOLPHIN <const> = 508

local names = {}
names[ID_CREEPER] = "Creeper"
names[ID_SKELETON] = "Skeleton"
names[ID_ZOMBIE] = "Zombie"
names[ID_DOLPHIN] = "Dolphin"

local colors = {}
colors[ID_CREEPER] = "Verde"
colors[ID_SKELETON] = "Branco"
colors[ID_ZOMBIE] = "Verde"
colors[ID_DOLPHIN] = "Azul"


print("Digite o ID do monstro")
local id = io.read("*n") --input do terminal
local name = names[id] or names[ID_CREEPER]
local color = colors[id] or colors[ID_CREEPER]

print(
    string.format("O monstro escolhido foi %s e sua cor eh %s", name,color)
)