local MONSTER_NAME <const> = "creeper"

local maxHealth = 20
local health = 20

local isHealthFull = health == maxHealth
local healthPercentage = health/maxHealth
local isHealthCritical = healthPercentage <= 0.25

if isHealthCritical then
    print("Your Life is CRITICAL")
else
    print("Everything is ok!")
end

print(isHealthCritical)
