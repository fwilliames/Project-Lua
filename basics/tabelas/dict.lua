local fruits = {
    Apple = "Red",
    Pineapple = "Yellow",
    Banana = "Yellow"
}

-- iteração no dicionario em lua a ordem nao eh garantida
for key, value in pairs(fruits) do
   print(key,value)
end

print(string.format("My apple is %s",fruits.Apple))

fruits.kiwi = print
fruits.kiwi("Loucura")

for key, value in pairs(fruits) do
    print(key,value)
end

fruits.Apple = nil --remove o item do dicionario

for key, value in pairs(fruits) do
    print(key,value)
end
