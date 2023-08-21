local names = {"creeper", "zombie", "skeleton","phatom"} --inicializando uma tabela
local lengthNames = #names -- "#nomeTabela" retorna o tamanho da tabela enquanto

for i = 1, lengthNames, 1 do
    print(names[i])
    
end

for key, value in pairs(names) do
    print(key,value)
end


