local utils = require("utils")
local sheep = require("creatures/sheep")
utils.enableUtf8()

print("Hello from main.lua")
utils.helloFromUtils()
sheep.talk()

for i = 0, 10, 1 do
    print(
        utils.getProgressBar(i)
    )
end