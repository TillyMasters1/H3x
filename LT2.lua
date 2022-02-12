local notify = loadstring(game:HttpGet('https://h3x.wtf/Notify'))()

if game.PlaceId == 13822889 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TillyMasters1/H3x/main/Install.lua"))(); loadstring(readfile("H3x/Modules/ENV.lua"))()
    local library = loadstring(readfile("H3x/Modules/UI.lua"))({title = "H3X", description = "Loaded "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."!"});
    local HoldToSelect  = Enum.KeyCode.LeftControl
    local HoldToUndoAll = Enum.KeyCode.LeftAlt
    local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
    local Parts = {}
    local Box = Instance.new("SelectionBox",game.Workspace)
    local Sound0 = Instance.new("Sound")
    local Sound1 = Instance.new("Sound")
    
    Box.Name = "Box"
    Box.LineThickness = 0.01;
    Box.Adornee = nil;
    Box.Color3 = Color3.fromRGB(255,0,0)
    Box.Visible = true;
    
    Sound1.Name = "Sound"
    Sound1.SoundId = "http://www.roblox.com/asset/?id=773858658"
    Sound1.Volume = 1;
    Sound1.Looped = false;
    Sound1.archivable = false;
    Sound1.Parent = game.Workspace;
    
    Sound0.Name = "Sound"
    Sound0.SoundId = "http://www.roblox.com/asset/?id=4676738150"
    Sound0.Volume = 1;
    Sound0.Looped = false;
    Sound0.archivable = false;
    Sound0.Parent = game.Workspace;
    
    spawn(function()
        notify.push({
    		Title = "H3x",
    		Text = "Loaded "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." Script",
    		Duration = 5;
	    })
    end)
    
    local Home = library:Tab("Home");
    
      Home:Activate();
    
      Home:Text("Welcome to H3x! You've successfully loaded H3x for "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."!");
    
      Home:Text("We want you to have the best experience here, so please join our Discord!");
    
      Home:Button("Join Our Discord", "Click this to join our discord!", "rbxassetid://3926305904", "Join!", function()
          spawn(function()
              local b = 6452;
              local Conn = game:GetService("RunService").Stepped:Connect(function()
                  b = b + 1;
                  spawn(function()
                      local c = requestfunc({
                          Url = string.format("http://127.0.0.1:%s/rpc?v=1", b),
                          Method = "POST",
                          Headers = {
                              ["Origin"] = "https://discord.com",
                              ["Content-Type"] = "application/json"
                          },
                          Body = HttpService:JSONEncode({
                              ["nonce"] = HttpService:GenerateGUID(false),
                              ["args"] = {
                                  ["invite"] = {["code"] = "mxbqfEjKSP"},
                                  ["code"] = "mxbqfEjKSP"
                          },
                              ["cmd"] = "INVITE_BROWSER"
                          })
                      });
                  end);
                  if b == 6465 then
                      Conn:Disconnect();
                  end;
              end);
          end);
      end);
    

    local Player = library:Tab("Player");

        Player:Text("Delete Tool")

        Player:Bind("Select","Key to select part to delete","rbxassetid://3926305904",Enum.KeyCode.LeftControl,function(e)
            if e ~= true and e ~= false then
                HoldToSelect = e
            end
        end)

        Player:Bind("Undo","Hold down or press keybind to undo deleted parts","rbxassetid://3926305904",Enum.KeyCode.LeftAlt,function(e)
            if e ~= true and e ~= false then
                HoldToUndoAll = e
            end
        end)
    

    local Credits = library:Tab("Credits");
    
        Credits:Text("⸻⸻ H3X Credits ⸻⸻");
        
        Credits:Text("⸻ Script Credits ⸻")
        
        Credits:Text("Owners: Dakota#0826 | Carillon#1958");
        
        Credits:Text("Devs: One Shot#0001 | nearepick#1234");

        Credits:Text("⎯⎯ Credit to Wally for parts of script ⎯⎯")
        
        Credits:Text("⸻ UI Credits ⸻")
            
        Credits:Text("Creator: Dakota#0826");
        
        Credits:Text("Inspired from Windows 11 Settings");
          


    -- Scripts

    -- Toggle ui Visiblity 
    game:GetService("UserInputService").InputBegan:Connect(function(key)
    	if key.KeyCode == Enum.KeyCode.RightControl then
    	   if game:GetService("CoreGui").RobloxLoadingGui.Holder.Visible then
    	      game:GetService("CoreGui").RobloxLoadingGui.Holder.Visible = false
    	   else
    	      game:GetService("CoreGui").RobloxLoadingGui.Holder.Visible = true
    	   end
    	end
    end)
    
    -- Delete Tool
        for a,b in pairs(game.Workspace:GetDescendants()) do
            if b.ClassName == "Part" then 
                b.Locked = false 
            end 
        end;

        Mouse.Button1Down:connect(function()
            if game:GetService("UserInputService"):IsKeyDown(HoldToSelect) then 
                table.insert(Parts,Mouse.Target)
                Mouse.Target.Parent = game.CoreGui;
                Sound0:Play()
            end 
        end)

        while wait() do 
            Box.Adornee = nil;
            if game:GetService("UserInputService"):IsKeyDown(HoldToSelect) then 
                Box.Adornee = Mouse.Target or nil 
            end;
            if game:GetService("UserInputService"):IsKeyDown(HoldToUndoAll) then 
                local c = 0;
                for a,b in pairs(Parts) do 
                    c = a 
                end;
                pcall(function()
                    Parts[c].Parent = workspace;
                    table.remove(Parts,c)
                    Sound1:Play()
                end)
                wait(.1)
            end 
        end
    

else
    notify.push({
		Title = "H3x",
		Text = "We do not currently support this game",
		Duration = 5;
	})
end