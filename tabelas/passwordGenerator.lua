local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","w","x","y","z",
                "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","W","X","Y","Z"}
local numbers = {"1","2","3","4","5","6","7","8","9","0"}
local specials = {"!","@","#","$","%","&","*","(",")","_","-","=","+","´","`","[","]","{","}","ª","§","~","^","º",",",".",";","/","<",">",":","?","°"}

local charactersList = {
    letters,
    numbers,
    specials
}

print("Quantos caracteres vc deseja?")
local length = io.read("*n")

local password = ""

for i = 1, length, 1 do
    --get list
    local listId = math.random(#charactersList)
    local list = charactersList[listId]

    --get characters
    local id = math.random(#list)
    local char = list[id]

    password = password .. char
end

print("Sua senha eh:")
print(password)