local MONSTER_NAME <const> = "creeper"
local maxHealth = 20
local health = 20

while health > 0 do
    health = health - 1

    local isHealthFull = health == maxHealth
    local healthPercentage = health/maxHealth
    local isHealthCritical = healthPercentage <= 0.25

    print(healthPercentage, isHealthCritical)
end


repeat
    health = health - 1

    local isHealthFull = health == maxHealth
    local healthPercentage = health/maxHealth
    local isHealthCritical = healthPercentage <= 0.25

    print(healthPercentage, isHealthCritical)
until health <= 0

print("creeper gone")