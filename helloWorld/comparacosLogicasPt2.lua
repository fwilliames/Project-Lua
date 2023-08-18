local MONSTER_NAME <const> = "creeper"

local maxHealth = 20
local health = 20
local isHealthFull = health == maxHealth
local isHealthFull = health == maxHealth
local healthPercentage = health/maxHealth
local isHealthCritical = healthPercentage <= 0.25


local isCreeper = MONSTER_NAME == "creeper"

local shouldIRun = isCreeper or not isHealthCritical

print(shouldIRun)