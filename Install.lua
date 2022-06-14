local rq = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request

if not isfolder("H3x") then makefolder("H3x") end
if not isfolder("H3x/Modules") then makefolder("H3x/Modules") end
-- if not isfile("H3x/Modules/ENV.lua") then writefile("H3x/Modules/ENV.lua", rq({Url = "https://h3x.wtf/Dependancies/ENV.lua", Method = "GET"}).Body) end
-- if not isfile("H3x/Modules/Maid.lua") then writefile("H3x/Modules/Maid.lua", rq({Url = "https://raw.githubusercontent.com/Quenty/NevermoreEngine/a8a2d2c1ffcf6288ec8d66f65cea593061ba2cf0/Modules/Shared/Events/Maid.lua", Method = "GET"}).Body) end
--[[ if not isfolder("H3x/Config") then makefolder("H3x/Config") end
if not isfile("H3x/Config/UISettings.txt") then writefile("H3x/Config/UISettings.txt", "P") end ]]--
local ui = rq({Url = "https://h3x.wtf/Dependancies/UI.lua", Method = "GET"}).Body
if not isfile("H3x/Modules/UI.lua") or not (readfile("H3x/Modules/UI.lua") == ui) then writefile("H3x/Modules/UI.lua", ui) end
