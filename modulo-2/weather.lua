os.execute("chcp 65001") -- muda a codificação do terminal para UTF-8
os.execute("cls")

local name = "frank"
local forecast = "Ensolarado"
local min = 35
local max = 45

local function convert(c)
    local f = (c * 9/5) + 32
    return f
    
end

local minf = convert(min)
local maxf = convert(max)

print(string.format("Ola %s", name))
print()
print(string.format("A previsao para o dia de hoje eh: %s", forecast))
print(string.format("Com a temperatura variando entre %dC🌡(%dF🌡) e %dC🌡(%dF🌡)",min,minf,max,maxf))