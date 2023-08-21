local utils = require("utils")
utils.enableUtf8()

print("Hello from main.lua")
utils.helloFromUtils()

for i = 0, 10, 1 do
    print(
        utils.getProgressBar(i)
    )
end