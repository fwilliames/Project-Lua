local utils = {}

--[[
    Displays a greeting message when called, indicating the call's origin as "utils".

    Usage:
    utils.helloFromUtils()
]]
function utils.helloFromUtils()
    print("Hello from utils")
end

--[[
    Enables UTF-8 encoding to support processing of special characters and accented characters.
    This is achieved by changing the code page to 65001 and clearing the console.
]]
function utils.enableUtf8()
    os.execute("chcp 65001") 
    os.execute("cls") 
end

--[[
    Returns a graphical representation of a progress bar based on the provided attribute.
    
    Parameters:
    - attribute: An integer number representing the current progress (ranging from 0 to 10).

    Returns:
    A string containing a progress bar composed of filled and empty blocks, 
    as determined by the value of the attribute.

    Example Usage:
    local progress = utils.getProgressBar(7)
    print("Progress: " .. progress)
]]
function utils.getProgressBar(attribute)
    local fullChar = "⬜"
    local emptyChar = "⬛"
    local result = ""

    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end       
    end
    return result
end

return utils