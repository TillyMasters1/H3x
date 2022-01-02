if not isfolder("H3x") then makefolder("H3x") end
if not isfolder("H3x/Modules") then makefolder("H3x/Modules") end
 if not isfile("H3x/Modules/UI.lua") then writefile("H3x/Modules/UI.lua", game:HttpGet("https://raw.githubusercontent.com/TillyMasters1/H3x/main/Dependancies/UI.lua")) end
if not isfolder("H3x/Config") then makefolder("H3x/Config") end
 if not isfile("H3x/Config/UISettings.txt") then writefile("H3x/Config/UISettings.txt", "P") end
