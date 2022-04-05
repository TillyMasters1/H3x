loadstring(game:HttpGet("https://h3x.wtf/Install.lua"))(); loadstring(readfile("H3x/Modules/ENV.lua"))()
local library = loadstring(readfile("H3x/Modules/UI.lua"))({title = "H3X", description = "Loaded "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."!"});
local notify = loadstring(game:HttpGet('https://h3x.wtf/Notify'))()
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") and game.Players.LocalPlayer.Character:findFirstChild("Torso") or game.Players.LocalPlayer.Character:findFirstChild("UpperTorso")

-- Variables
local plrs = game.Players
local plr = plrs.LocalPlayer
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 100
local speed = 0
local WalkSpeed = plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed
local JumpPower = plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower
local torso
local Tree

-- Bool Variables
local flying = false
local InfJump = false
local LoopDupeInventory = false
local AlwaysDay = false
local NoFog = false 
local SlotSaving = true

-- KeyBinds
local FlyToggle = Enum.KeyCode.Q
local HoldToSelect  = Enum.KeyCode.LeftControl
local HoldToUndoAll = Enum.KeyCode.LeftAlt
local ToggleUI = Enum.KeyCode.RightControl

if game.Players.LocalPlayer.Character:findFirstChild("UpperTorso") then 
    torso = "UpperTorso" 
else 
    torso = "Torso"
end

local TreeTypes = {}

for _,v in ipairs(game.Workspace:GetChildren()) do
    if v.Name == "TreeRegion" then
        for _,v in ipairs(v:GetChildren()) do
            if v:findFirstChild("TreeClass") then
                if not table.find(TreeTypes, v:findFirstChild("TreeClass").Value) then
                    table.insert(TreeTypes, v:findFirstChild("TreeClass").Value)
                end
            end
        end
    end
end

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


local Home = library:Tab("Home","rbxassetid://3926305904","964, 204","36, 36");

Home:Activate();
Home:Text("Welcome to H3x! You've successfully loaded H3x for "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."!");
Home:Text("We want you to have the best experience here, so please join our Discord!");
Home:Button("Join Our Discord", "Click this to join our discord!", "rbxassetid://3926305904", "Join!","164, 404","36, 36", function()
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
Home:Bind("ToggleUI","KeyBind to toggle the ui","rbxassetid://3926305904",Enum.KeyCode.RightControl,"4, 404","36, 36",function(e)
    if e ~= true and e ~= false then
        ToggleUI = e
    end
end)
Home:Button("Rejoin Server", "Rejoin's the same server your in.", "rbxassetid://3926307971", "Rejoin","404, 84","36, 36", function()
    local ts = game:GetService("TeleportService")
    ts:Teleport(game.PlaceId, plr)
end)
local About = Home:SubTab("About","Menu specifications, Game specifications, Credits","rbxassetid://3926305904","204, 444","36, 36")
local MenuInfo = About:Section("Menu specifications","","rbxassetid://3926305904","44, 644","36, 36")
MenuInfo:Text("               Version:            1",Enum.TextXAlignment.Left)
MenuInfo:Text("               UI Version:       572fa1e",Enum.TextXAlignment.Left)

local ExperienceInfo = About:Section("Game specifications","","rbxassetid://6764432408","200, 100","50, 50")
ExperienceInfo:Text("               Name:            "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,Enum.TextXAlignment.Left)
ExperienceInfo:Text("               Id:                   "..game.PlaceId,Enum.TextXAlignment.Left)
local PlayerNum = ExperienceInfo:Text("               Players:        "..#game.Players:GetChildren().." / "..game.Players.MaxPlayers,Enum.TextXAlignment.Left)

local Credit = About:Section("Credits","","rbxassetid://3926305904","204, 444","36, 36")
Credit:Text("               Owners:            Dakota#0826 | Carillon#1958",Enum.TextXAlignment.Left)
Credit:Text("               Devs:                Carillon#1958",Enum.TextXAlignment.Left)
Credit:Text("               UI Creator:       Dakota#0826",Enum.TextXAlignment.Left)
Credit:Text("Inspired from Windows 11 Settings")


-- Player Category
local Player = library:Tab("Player","rbxassetid://3926307971","884, 4","36, 36");

Player:Text("Movement")
Player:Slider("WalkSpeed","Changes your WalkSpeed via slider","rbxassetid://3926305904",plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed,plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed,300,"924, 684","36, 36",function(e)
    WalkSpeed = e
end)
Player:Slider("JumpPower","Changes your JumpPower via slider","rbxthumb://type=Asset&id=" .. 9050394095 .. "&w=420&h=420",plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower,plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower,500,"","",function(e)
    JumpPower = e
end)
Player:Switch("Infinite Jump","Toggles infinite jump","rbxassetid://3926307971",false,"164, 84","36, 36",function(e)
    if e == true or e == false then
        InfJump = e
    end
end)
Player:Bind("Fly","Key to toggle flying","rbxthumb://type=Asset&id=" .. 9050262743 .. "&w=420&h=420",Enum.KeyCode.Q,"","",function(e)
    if e ~= true and e ~= false then
        FlyToggle = e
    end
end)
Player:Slider("Fly Speed","Changes your flyspeed via slider","rbxthumb://type=Asset&id=" .. 9059787706 .. "&w=420&h=420",0,100,600,"","",function(e)
    maxspeed = e
end)
Player:Text("Delete Tool")
Player:Bind("Select","Key to select part to delete","rbxassetid://3926305904",Enum.KeyCode.LeftControl,"644, 724","36, 36",function(e)
    if e ~= true and e ~= false then
        HoldToSelect = e
    end
end)
Player:Bind("Undo","Hold down or press keybind to undo deleted parts","rbxassetid://3926305904",Enum.KeyCode.LeftAlt,"124, 564","36, 36",function(e)
    if e ~= true and e ~= false then
        HoldToUndoAll = e
    end
end)


-- Environment Category
local Environment = library:Tab("Environment","rbxassetid://3926305904","644, 844","36, 36");

Environment:Switch("Always Day","Toggles Always Day","rbxassetid://3926307971",false,"364, 524","36, 36",function(e)
    if e == true or e == false then
        AlwaysDay = e
    end
end)
Environment:Switch("NoFog","Toggles NoFog","rbxassetid://3926305904",false,"324, 844","36, 36",function(e)
    if e == true or e == false then
        NoFog = e
    end
end)
 

-- Slot Category
local Slot = library:Tab("Slot","rbxthumb://type=Asset&id=" .. 9074783212 .. "&w=420&h=420","","");

Slot:Text("Land")
Slot:Button("Free Land","Gives you Free Land","rbxthumb://type=Asset&id=" .. 9107894276 .. "&w=420&h=420","Give","","",function()
    FreeLand()
end)
Slot:Button("Max Land","Gives you Max Land","rbxthumb://type=Asset&id=" .. 9107894276 .. "&w=420&h=420","Give","","",function()
    MaxLand(getPlayersBase(tostring(plr)))
end)
Slot:Button("All BluePrints (Temp)","Gives you All BluePrints temporarily","rbxthumb://type=Asset&id=" .. 9287217542 .. "&w=420&h=420","Give","","",function()
    getAllBP()
end)

Slot:Text("Dupe")
Slot:Switch("Slot Saving","Toggles Slot Saving","rbxassetid://3926305904",true,"924, 764","36, 36",function(e)
    if e == true or e == false then
        SlotSaving = e
    end
end)
Slot:Switch("Dupe Inventory","Toggles Dupe Inventory loop","rbxassetid://3926305904",false,"924, 764","36, 36",function(e)
    if e == true or e == false then
        LoopDupeInventory = e
    end
end)

Slot:Text("Pink Car Spawner")
Slot:Button("Spawn Pink Car","Respawns car until a pink car spawns","rbxassetid://3926305904","Spawn","340, 4","24, 24",function()
    if _G.Executed == false or _G.Executed == nil then
        _G.Executed = true
        Spawned = false
        Spawning = false
        SpawnPad = nil
        workspace.PlayerModels.ChildAdded:connect(function(Added)
            if Spawned == false and Spawning == false then 
                Owner = nil
                CheckSuccess = false
                repeat wait() 
                    if Added:FindFirstChild("Owner") and Added:FindFirstChild("Type") and Added.Type.Value == "Vehicle" and Added:FindFirstChild("Settings") and Added.Settings:FindFirstChild("Color") then 
                        CheckSuccess = true
                        print("IsCar")
                        Owner = Added.Owner.Value
                    end
                until CheckSuccess == true
                if Owner == game.Players.LocalPlayer or game.ReplicatedStorage.Interaction.ClientIsWhitelisted:InvokeServer(Owner) == true and CheckSuccess == true then
                    CheckSuccess = false
                    Spawning = true
                    Added:FindFirstChild("Settings")
                    Added.Settings:FindFirstChild("Color")
                    if tostring(Added.Settings.Color.Value) == tostring(1032) then
                        Spawned = true
                        Spawning = false
                        print(Spawned)
                    elseif tostring(Added.Settings.Color.Value) ~= tostring(1032) then
                        if SpawnPad:FindFirstChild("ButtonRemote_SpawnButton") and SpawnPad:FindFirstChild("Owner") then 
                            if SpawnPad.Owner.Value == game.Players.LocalPlayer or game.ReplicatedStorage.Interaction.ClientIsWhitelisted:InvokeServer(SpawnPad.Owner.Value) == true then 
                                Spawning = false
                                game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(SpawnPad.ButtonRemote_SpawnButton)
                            end
                        end
                    end
                end
            end
        end)
    
        mouse = game.Players.LocalPlayer:GetMouse()
        mouse.KeyDown:connect(function(key)
            if key:lower() == "c" then
                if mouse.Target.Parent:FindFirstChild("ButtonRemote_SpawnButton") then 
                    SpawnPad = mouse.Target.Parent
                    Spawned = false
                    Spawning = false
                    game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(mouse.Target.Parent.ButtonRemote_SpawnButton)
                else 
                    Spawned = true
                    Spawning = false
                end
            end
        end)
        spawn(function()
            repeat wait()
                if Spawned == true then
                    Spawning = false
                    notify.push({
                        Title = "H3x",
                        Text = "Pink Car\nSuccessfully Spawned",
                        Duration = 5,
                    })
                end
            until Spawned == true
        end)
    end
end)


-- Wood Category
local Wood = library:Tab("Wood","rbxthumb://type=Asset&id=" .. 9291062955 .. "&w=420&h=420","","");

Wood:Text("Bring Tree")
Wood:Button("Bring Tree","Brings Tree Type to you, requires axe","rbxthumb://type=Asset&id=" .. 9290993421 .. "&w=420&h=420","Spawn","","",function()
    ChopTree(Tree)
end)
Wood:Dropdown("TreeType","TreeType to get","rbxassetid://3926305904",TreeTypes[1],TreeTypes,function(e)
    Tree = e
end)
--[[ Wood:Button("ModWood","Mod's Wood","rbxassetid://3926305904","Mod","","",function()
    ModWood()
end) ]]--





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
    local Parts = {}
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


-- Keep WalkSpeed/JumpPower Changed
spawn(function()
    while wait() do
       pcall(function()
          repeat wait() until plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed ~= WalkSpeed or plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower ~= JumpPower
          plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = WalkSpeed
          plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = JumpPower
       end)
    end
end)


-- InfJump
game:GetService("UserInputService").JumpRequest:connect(function()
   if InfJump then
       game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
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
    if game.Players.LocalPlayer.Character.Humanoid.SeatPart then
        Car = game.Players.LocalPlayer.Character.Humanoid.SeatPart;
        WeldOne = Instance.new('Weld',game.Players.LocalPlayer.Character.Humanoid.SeatPart); 
        WeldTwo = Instance.new('Weld',game.Players.LocalPlayer.Character.HumanoidRootPart);
        WeldOne.Part0 = game.Players.LocalPlayer.Character.HumanoidRootPart
        WeldOne.Part1 = game.Players.LocalPlayer.Character.Humanoid.SeatPart
        WeldTwo.Part0 = game.Players.LocalPlayer.Character.HumanoidRootPart
        WeldTwo.Part1 = game.Players.LocalPlayer.Character.Humanoid.SeatPart			
    else 
        plr.Character.Humanoid.PlatformStand = true    
    end;
    repeat wait()
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
    if WeldOne and WeldTwo and game.Players.LocalPlayer.Character.Humanoid.SeatPart then 
        WeldOne:Destroy();
        WeldTwo:Destroy();
        teleport(CFrame.new(Car.CFrame.p));
    end;
    plr.Character.Humanoid.PlatformStand = false
end

game:GetService("UserInputService").InputBegan:Connect(function(key,gameProcessedEvent)
    if gameProcessedEvent then return end
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
game:GetService("UserInputService").InputEnded:Connect(function(key,gameProcessedEvent)
    if gameProcessedEvent then return end
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


-- Dupe Inventory

spawn(function()
    while wait() do
        if LoopDupeInventory then
            local pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
            plr.Character.Humanoid:UnequipTools()
            for i,v in pairs(plr.Character:GetChildren()) do
                if v.ClassName == "Part" then
                    v:Destroy()
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.Name ~= "BlueprintTool" and v.Name == "Tool" then
                    game.ReplicatedStorage.Interaction.ClientInteracted:FireServer(v, "Drop tool", pos)
                end
            end
            plr.CharacterAdded:Wait()    
            plr.Character:WaitForChild('HumanoidRootPart')
            wait(0.05)
            plr.Character.HumanoidRootPart.CFrame = pos
            plr.Backpack:WaitForChild("Tool")
            plr.Character.HumanoidRootPart.CFrame = pos
        end
    end
end)


-- AlwaysDay n NoFog

game.Lighting.Changed:connect(function()
    if AlwaysDay then
        game.Lighting.TimeOfDay = "13:50:00"
        game.Lighting.Brightness = 0.8
        game.Lighting.OutdoorAmbient = Color3.fromRGB(220, 220, 220)
    end
    if NoFog then
        game.Lighting.FogEnd = math.huge
    end
end)


-- Slot Saving

function SaveReturn(...)
   return true, "noob lt2"
end

local mt = getrawmetatable(game) 
local backup = mt.__namecall 
if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end 

mt.__namecall = newcclosure(function(...) 
    local method = getnamecallmethod() 
    local args = {...} 
      if (method == "InvokeServer") and tostring(args[1]) == "RequestSave" then 
         if not SlotSaving then
            return SaveReturn(...)
         else
            backup(...)
         end
       end
    return backup(...)
end)


-- Teleport Player

function teleport(Pos)
    plr.Character.HumanoidRootPart.CFrame = Pos
end
  

-- Get Axe Damage

function GetDamage(AxeDMG)
    if AxeDMG.ToolTip == "Basic Hatchet" then return 0.2 
    elseif AxeDMG.ToolTip == "Plain Axe" then return 0.55
    elseif AxeDMG.ToolTip == "Steel Axe" then return 0.93
    elseif AxeDMG.ToolTip == "Hardened Axe" then return 1.45
    elseif AxeDMG.ToolTip == "Silver Axe" then return 1.6
    elseif AxeDMG.ToolTip == "Rukiryaxe" then return 1.68
    elseif AxeDMG.ToolTip == "Beta Axe of Bosses" then return 1.45
    elseif AxeDMG.ToolTip == "Alpha Axe of Testing" then return 1.5
    elseif AxeDMG.ToolTip == "Fire Axe" then
        if TreeType ~= "Volcano" then return 0.6 else return 6.35 end
    elseif AxeDMG.ToolTip == "End Times Axe" then
        if TreeType ~= "LoneCave" then return 1.58 else return 10000000 end
    elseif AxeDMG.ToolTip == "Candy Cane Axe" then return 0
    elseif AxeDMG.ToolTip == "Beesaxe" then return 1.4
    elseif AxeDMG.ToolTip == "CHICKEN AXE" then return 0.9
    elseif AxeDMG.ToolTip == "Amber Axe" then return 3.39
    elseif AxeDMG.ToolTip == "The Many Axe" then return 10.2
    elseif AxeDMG.ToolTip == "Rusty Axe" then return 0.55
    elseif AxeDMG.ToolTip == "Gingerbread Axe" then
        if TreeType == "Walnut" then return 8.5
    elseif TreeType == "Koa" then return 11 else return 1.2 end
    elseif AxeDMG.ToolTip == "Bird Axe" then
        if TreeType == "Volcano" then return 2.5
        elseif TreeType == "CaveCrawler" then return 3.9 else return 1.65 end
    end
end


-- GetAxe

function GetAxe()
    Axe = nil
    if TreeType ~= "LoneCave" then
        for i,v in pairs(plr.Backpack:GetChildren()) do
            if v.Name == 'Tool' then
                Axe = v
            end
        end
        if not Axe then
            for i,v in pairs(game.Workspace[plr.Name]:GetChildren()) do
                if v.Name == 'Tool' then
                Axe = v
                end
            end
        end
    end
    if TreeType == "LoneCave" then
        for i,v in pairs(plr.Backpack:GetChildren()) do
            if v.Name == "Tool" and v.ToolName.Value == "EndTimesAxe" then
                Axe = v
            end
        end
        if not Axe then
            for i,v in pairs(game.Workspace[plr.Name]:GetChildren()) do
                if v.Name == "Tool" and v.ToolName.Value == "EndTimesAxe" then
                Axe = v
                end
            end
        end
    end
end


-- Chop Tree

function ChopTree(TreeType)
    if not plr.Backpack:FindFirstChild("Tool") then notify.push({Title = "H3x", Text = "Bring Tree Requires a Axe", Duration = 5;}) return end
    
    local oldPos = plr.Character.HumanoidRootPart.CFrame;
    GetAxe()
    for a,b in pairs(game.Workspace:GetChildren()) do
        if b.Name == 'TreeRegion' then
            for c,d in pairs(b:GetChildren()) do
                if d:FindFirstChild("Leaves") and d:FindFirstChild("TreeClass") and d.TreeClass.Value == TreeType and not d:FindFirstChild('Chopped') and not d:FindFirstChild("RootCut") then
                Model = d
                ModelCut = d.CutEvent
                SectionA = d.WoodSection
                SectionATp = SectionA.Position
                end
            end
        end
    end
    local Info = {["tool"] = Axe,["faceVector"] = Vector3.new(-1, 0, 0),["height"] = 0.3,["sectionId"] = 1,["hitPoints"] = GetDamage(Axe),["cooldown"] = 0,["cuttingClass"] = "Axe"}
    for i = 1,4 do
        game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(Model.Owner)
    end
    --Tag Tree:
    local Tag = Instance.new('BoolValue', Model)
    Tag.Name = 'Chopped'
    --Bring Back Tree:
    local GotWood 
    GotWood = game.Workspace.LogModels.ChildAdded:connect(function(new)
        if new:WaitForChild("TreeClass").Value == TreeType and new:WaitForChild("Owner").Value == plr then
            if new:FindFirstChild('WoodSection')then 
                spawn(function()
                    for i=1,20 do
                        game:GetService('ReplicatedStorage').Interaction.ClientRequestOwnership:FireServer(new);
                        game:GetService('ReplicatedStorage').Interaction.ClientIsDragging:FireServer(new);
                        wait();
                    end;
                end)
                wait(0.18)
                if not new.PrimaryPart then
                    new.PrimaryPart = new.WoodSection;
                end;
                spawn(function()
                    for i=1,3 do
                        new:SetPrimaryPartCFrame(CFrame.new(oldPos.p));
                    end
                end)
            end;
            teleport(CFrame.new(oldPos.Position))
            GotWood:Disconnect()
            GotWoodFinish = true
        end
    end)
    --Chopping Event:
    teleport(CFrame.new(SectionATp + Vector3.new(0, 1, 0)))
    wait(0.3)
    repeat wait()
        for i = 1,15 do
            game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(ModelCut, Info)
        end
    until GotWoodFinish
    repeat wait() until GotWoodFinish == true
    wait(3)
    GotWoodFinish = false
end


-- Delete Surrounding Trees

function DeleteSurroundingTrees()
    for _,v in ipairs(game.Workspace:GetChildren()) do
        if tostring(v) == 'TreeRegion'then
            for _,g in ipairs(v:GetChildren()) do
                if (plr.Character.HumanoidRootPart.CFrame.p-g.WoodSection.CFrame.p).magnitude < 150 then 
                    game:GetService('ReplicatedStorage').Interaction.ClientIsDragging:FireServer(g);
                    game:GetService'ReplicatedStorage'.Interaction.DestroyStructure:FireServer(g);
                end
            end
        end
    end
end


-- Get Players Base

function getPlayersBase(plr)
    for i,v in ipairs(game.Workspace.Properties:GetChildren()) do 
        if v:IsA('Model') and tostring(v.Owner.Value) == plr then 
            return v
        end
    end
    return false
end


-- Get Random Unclaimed Plot

function getFreeLand()
    for _,v in ipairs(game.Workspace.Properties:GetChildren()) do 
        if v.Owner.Value == nil then
            return v
        end
    end
end


-- FreeLand

function FreeLand()
    if getPlayersBase(tostring(plr)) then 
        return
    end
    local plot = getFreeLand();
    game:GetService('ReplicatedStorage').PropertyPurchasing.SetPropertyPurchasingValue:InvokeServer(true);
    game:GetService('ReplicatedStorage').PropertyPurchasing.ClientPurchasedProperty:FireServer(plot, plot.OriginSquare.CFrame.p);
    game:GetService('ReplicatedStorage').PropertyPurchasing.SetPropertyPurchasingValue:InvokeServer(false);
    teleport(CFrame.new(plot.OriginSquare.CFrame.p)+Vector3.new(0,5,0));
end;


-- Max Land

function MaxLand(Plot)
    if not getPlayersBase(tostring(plr)) then 
        FreeLand()
    end;
    if not Plot then 
        Plot = getPlayersBase(tostring(plr));
    end;
    local OriginSquare = Plot.OriginSquare;
    local children=#Plot:children()
    if children >= 26 then 
        return;
    end;
    game:GetService('ReplicatedStorage').PropertyPurchasing.SetPropertyPurchasingValue:InvokeServer(true);
    game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z + 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z - 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z + 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z - 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 40));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 80));game:GetService('ReplicatedStorage').PropertyPurchasing.ClientExpandedProperty:FireServer(Plot ,CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 80));
    teleport(CFrame.new(Plot.OriginSquare.CFrame.p) + Vector3.new(0, 5, 0));
    DeleteSurroundingTrees();
    game:GetService('ReplicatedStorage').PropertyPurchasing.SetPropertyPurchasingValue:InvokeServer(false);
end;


-- All BluePrints

function getAllBP()
    if #plr.PlayerBlueprints.Blueprints:children()<69 then
        for _,v in ipairs(game:GetService('ReplicatedStorage').Purchasables.Structures.BlueprintStructures:GetChildren()) do
            local newBP = v:Clone();
            newBP.Parent = plr.PlayerBlueprints.Blueprints;
        end
    end
end


-- Get object cursor is on

function getMouseTarget()
    local b2 = game:GetService("UserInputService"):GetMouseLocation()
    return workspace:FindPartOnRayWithIgnoreList(Ray.new(workspace.CurrentCamera.CFrame.p, workspace.CurrentCamera:ViewportPointToRay(b2.x, b2.y, 0).Direction * 1000), game.Players.LocalPlayer.Character:GetDescendants())
end


-- Get Ancestors

function GetAncestors(obj)
    local parent = obj.Parent
    local ans = {}
    
    while (parent) do
	    ans[#ans+1] = parent
	    parent = parent.Parent
	end
	
	return ans
end


-- ModWood

function ModWood()
    local Mouse = plr:GetMouse()
    local Tree
    local Sawmill

    spawn(function()
        notify.push({
            Title = "H3x",
            Text = "Select Sawmill",
            Duration = 10;
        })
    end)

    local ButtonDown
    ButtonDown = Mouse.Button1Down:Connect(function()
        local part = getMouseTarget()
        local partAncestors = GetAncestors(part)
        print("-------------------------")
        print(part.Name.." --Object")
        if table.find(partAncestors, Sawmill4L) then
            print("IsSawmill --Check if one of the parents is a sawmill")
        else
            print("IsNotSawmill --Check if one of the parents is a sawmill")
        end
        local ParentNum = 1
        for _,v in ipairs(partAncestors) do
            print(ParentNum.." ["..v.Name.."]")
            ParentNum = ParentNum + 1
        end
        ButtonDown:Disconnect()
    end)
end
