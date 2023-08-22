local utils = require("utils")
local player = require("definitions.player")
local colossus = require("definitions.colossus")

utils.enableUtf8()
utils.header()

local boss = colossus
utils.printCard(boss)


while true do
    --Player Turn
    if boss.health <= 0 then
        break
    end

    --Boss Turn
    if player.health <= 0 then
        break
    end
end