local MONSTER_NAME <const> = "creeper"

local maxHealth = 20
local health = 20
local isHealthFull = health == maxHealth

local hasTakenDamage = health ~= maxHealth -- ~= é a negativa em lua
print(hasTakenDamage)
hasTakenDamage = not isHealthFull --not é o inversor de boolean
print(hasTakenDamage)

