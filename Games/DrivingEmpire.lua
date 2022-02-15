-- Load Librarys

loadstring(game:HttpGet("https://raw.githubusercontent.com/TillyMasters1/H3x/main/Install.lua"))(); loadstring(readfile("H3x/Modules/ENV.lua"))()
local library = loadstring(readfile("H3x/Modules/UI.lua"))({title = "H3X", description = "Loaded "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."!"});
local notify = loadstring(game:HttpGet('https://h3x.wtf/Notify'))()



-- Check player is loaded

repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
repeat wait() until game.Players.LocalPlayer.Character:findFirstChild("Torso") or game.Players.LocalPlayer.Character:findFirstChild("UpperTorso")



-- Vars

local plr = game.Players.LocalPlayer
local torso = torso
local flying = false
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 100
local speed = 0
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Parts = {}
local AutoFarmToggle = false
local Camera = workspace.CurrentCamera
local VirtualUser = game:GetService("VirtualUser")
if game.Players.LocalPlayer.Character:findFirstChild("UpperTorso") then 
    torso = "UpperTorso" 
else 
    torso = "Torso"
end



-- KeyBinds

local FlyToggle = Enum.KeyCode.Q
local HoldToSelect  = Enum.KeyCode.LeftControl
local HoldToUndoAll = Enum.KeyCode.LeftAlt
local ToggleUI = Enum.KeyCode.RightControl



-- Instances

local Box = Instance.new("SelectionBox",game.Workspace)
Box.Name = "Box"
Box.LineThickness = 0.01;
Box.Adornee = nil;
Box.Color3 = Color3.fromRGB(255,0,0)
Box.Visible = true;

local Sound1 = Instance.new("Sound")
Sound1.Name = "Sound"
Sound1.SoundId = "http://www.roblox.com/asset/?id=773858658"
Sound1.Volume = 1;
Sound1.Looped = false;
Sound1.archivable = false;
Sound1.Parent = game.Workspace;

local Sound0 = Instance.new("Sound")
Sound0.Name = "Sound"
Sound0.SoundId = "http://www.roblox.com/asset/?id=4676738150"
Sound0.Volume = 1;
Sound0.Looped = false;
Sound0.archivable = false;
Sound0.Parent = game.Workspace;



-- UI

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


local AutoFarm = library:Tab("AutoFarm");
    AutoFarm:Switch("AutoFarm","Toggles autofarm","rbxassetid://3926305904",false,function(e)
        AutoFarmToggle = e
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
    local bg = Instance.new("BodyGyro", game.Players.LocalPlayer.Character:findFirstChild(torso))
    bg.P = 5e4
    bg.maxTorque = Vector3.new(9e8, 9e8, 9e8)
    bg.cframe = game.Players.LocalPlayer.Character:findFirstChild(torso).CFrame
    local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character:findFirstChild(torso))
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



--Get Current Vehicle

function GetCurrentVehicle()
    return plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.SeatPart and plr.Character.Humanoid.SeatPart.Parent
end



--Regular TP

function TP(cframe)
    GetCurrentVehicle():SetPrimaryPartCFrame(cframe)
end



--Velocity TP

function VelocityTP(cframe)
    TeleportSpeed = math.random(200, 600)
    Car = GetCurrentVehicle()
    local BodyGyro = Instance.new("BodyGyro", Car.PrimaryPart)
    BodyGyro.P = 5000
    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BodyGyro.CFrame = Car.PrimaryPart.CFrame
    local BodyVelocity = Instance.new("BodyVelocity", Car.PrimaryPart)
    BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    BodyVelocity.Velocity = CFrame.new(Car.PrimaryPart.Position, cframe.p).LookVector * TeleportSpeed
    wait((Car.PrimaryPart.Position - cframe.p).Magnitude / TeleportSpeed)
    BodyVelocity.Velocity = Vector3.new()
    wait(0.1)
    BodyVelocity:Destroy()
    BodyGyro:Destroy()
end



--Auto Farm

StartPosition = CFrame.new(Vector3.new(811.013184, 27.3421249, 2203.55542), Vector3.new(-187, 25.7, 1982))
EndPosition = CFrame.new(Vector3.new(-76.4760208, 27.7194824, 1993.84229), Vector3.new(-187, 25.7, 1982))

spawn(function()
    while wait() do
        if AutoFarmToggle then
            pcall(function()
                if not GetCurrentVehicle() and tick() - (LastNotif or 0) > 5 then
                    LastNotif = tick()
                    notify.push({Title = "H3x", Text = "Please Enter A Vehicle!", Duration = 5})
                else
                    TP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                    VelocityTP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                    TP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                    VelocityTP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                end
            end)
        end
    end
end)




--Anti AFK

LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new(), Camera.CFrame)
end)
