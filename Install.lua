if not isfolder("H3x") then makefolder("H3x") end
if not isfolder("H3x/Modules") then makefolder("H3x/Modules") end
 if not isfile("H3x/Modules/UI.lua") then writefile("H3x/Modules/UI.lua", game:HttpGet("https://raw.githubusercontent.com/TillyMasters1/H3x/main/Dependancies/UI.lua")) end
 if not isfile("H3x/Modules/ENV.lua") then writefile("H3x/Modules/ENV.lua", game:HttpGet("https://raw.githubusercontent.com/TillyMasters1/H3x/main/Dependancies/ENV.lua")) end
 if not isfile("H3x/Modules/Maid.lua") then writefile("H3x/Modules/Maid.lua", game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/a8a2d2c1ffcf6288ec8d66f65cea593061ba2cf0/Modules/Shared/Events/Maid.lua")) end
if not isfolder("H3x/Config") then makefolder("H3x/Config") end
 if not isfile("H3x/Config/UISettings.txt") then writefile("H3x/Config/UISettings.txt", "P") end
