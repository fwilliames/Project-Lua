local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","w","x","y","z",
                "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","W","X","Y","Z"}
-- local numbers = {"1","2","3","4","5","6"}
-- local specials = {"!","@","#","$","%","&"}

print("Quantos caracteres vc deseja?")
local length = io.read("*n")

local password = ""

for i = 1, length, 1 do
    local id = math.random(#letters)
    local char = letters[id]
    password = password .. char
end

print("Sua senha eh:")
print(password)