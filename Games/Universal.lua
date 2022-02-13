loadstring(game:HttpGet("https://raw.githubusercontent.com/TillyMasters1/H3x/main/Install.lua"))(); loadstring(readfile("H3x/Modules/ENV.lua"))()
local library = loadstring(readfile("H3x/Modules/UI.lua"))({title = "H3X", description = "Loaded Universal Script!"});
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
repeat wait() until game.Players.LocalPlayer.Character:findFirstChild("Torso") or game.Players.LocalPlayer.Character:findFirstChild("UpperTorso")
local plr = game.Players.LocalPlayer
local torso
if game.Players.LocalPlayer.Character:findFirstChild("UpperTorso") then torso = plr.Character.Torso else plr.Character.UpperTorso end
local flying = false
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 100
local speed = 0
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Parts = {}
local Box = Instance.new("SelectionBox",game.Workspace)
local Sound0 = Instance.new("Sound")
local Sound1 = Instance.new("Sound")

-- KeyBinds
local FlyToggle = Enum.KeyCode.Q
local HoldToSelect  = Enum.KeyCode.LeftControl
local HoldToUndoAll = Enum.KeyCode.LeftAlt
local ToggleUI = Enum.KeyCode.RightControl


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

local Home = library:Tab("Home");

  Home:Activate();

  Home:Text("Welcome to H3x! You've successfully loaded H3x Universal!");

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

  Home:Bind("ToggleUI","KeyBind to toggle the ui","rbxassetid://3926305904",Enum.KeyCode.RightControl,function(e)
    if e ~= true and e ~= false then
        ToggleUI = e
    end
  end)


local Player = library:Tab("Player");
    -- DeleteTool
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


    -- Fly
    Player:Text("Fly")
    Player:Bind("Fly","Key to toggle flying","rbxassetid://3926305904",Enum.KeyCode.Q,function(e)
        if e ~= true and e ~= false then
            FlyToggle = e
        end
    end)
    Player:Slider("Fly Speed","Changes your flyspeed via slider","rbxassetid://3926305904",0,100,600,function(e)
        maxspeed = e
    end)


local Credits = library:Tab("Credits");

    Credits:Text("⸻⸻ H3X Credits ⸻⸻");

    Credits:Text("Owners: Dakota#0826 | Carillon#1958");
    
    Credits:Text("⸻ Script Credits ⸻")
    
    Credits:Text("Devs: Carillon#1958");
    
    Credits:Text("⸻ UI Credits ⸻")
        
    Credits:Text("Creator: Dakota#0826");
    
    Credits:Text("Inspired from Windows 11 Settings");
      


-- Scripts

-- Toggle ui Visiblity 
game:GetService("UserInputService").InputBegan:Connect(function(key)
  if key.KeyCode == ToggleUI then
      if game:GetService("CoreGui").RobloxLoadingGui.Holder.Visible then
        game:GetService("CoreGui").RobloxLoadingGui.Holder.Visible = false
      else
        game:GetService("CoreGui").RobloxLoadingGui.Holder.Visible = true
      end
  end
end)


-- Delete Tool
spawn(function()
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
end)


-- Fly
function Fly()
    local bg = Instance.new("BodyGyro", torso)
    bg.P = 5e4
    bg.maxTorque = Vector3.new(9e8, 9e8, 9e8)
    bg.cframe = torso.CFrame
    local bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0,0.1,0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    repeat wait()
        plr.Character.Humanoid.PlatformStand = true
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
            speed = maxspeed
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
            speed = 0
        end
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        else
            bv.velocity = Vector3.new(0,0.1,0)
        end
        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame
    until not flying
    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bv:Destroy()
    plr.Character.Humanoid.PlatformStand = false
end

game:GetService("UserInputService").InputBegan:Connect(function(key)
    if key.KeyCode == FlyToggle then
        if flying then 
            flying = false
        else
            flying = true
            Fly()
        end
    elseif key.KeyCode == Enum.KeyCode.W then
        ctrl.f = 1
    elseif key.KeyCode == Enum.KeyCode.S then
        ctrl.b = -1
    elseif key.KeyCode == Enum.KeyCode.A then
        ctrl.l = -1
    elseif key.KeyCode == Enum.KeyCode.D then
        ctrl.r = 1
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.W then
        ctrl.f = 0
    elseif key.KeyCode == Enum.KeyCode.S then
        ctrl.b = 0
    elseif key.KeyCode == Enum.KeyCode.A then
        ctrl.l = 0
    elseif key.KeyCode == Enum.KeyCode.D then
        ctrl.r = 0
    end
end)
Fly()
