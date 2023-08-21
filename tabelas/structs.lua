os.execute("chcp 65001")
os.execute("cls")


local bananaStruct = {
    Name = "Banana",
    Color = "Amarela",
    Price = "$$",
    Sweetness = 4,
    Emoji = "🍌"
}

local AppleStruct = {
    Name = "Maçã",
    Color = "Vermelha",
    Price = "$$$",
    Sweetness = 6,
    Emoji = "🍎"
}

local fruits = {bananaStruct,AppleStruct}

for i = 1, #fruits, 1 do
    local fruitStruct = fruits[i]

    print("=========")
    print(
        string.format("A fruta %s %s",fruitStruct.Name,fruitStruct.Emoji)
    )
    print(
        string.format("Tem valor: %s",fruitStruct.Price)
    )
    print(
        string.format("Sus doçura eh: %d",fruitStruct.Sweetness)
    )
    print(
        string.format("Sua cor eh: %s",fruitStruct.Color)
    )
end