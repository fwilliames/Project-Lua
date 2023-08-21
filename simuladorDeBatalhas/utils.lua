local utils = {}
--[[
    Enables UTF-8 encoding to support processing of special characters and accented characters.
    This is achieved by changing the code page to 65001 and clearing the console.
]]
function utils.enableUtf8()
    os.execute("chcp 65001") 
    os.execute("cls") 
end

return utils