loadstring(game:HttpGet("https://h3x.wtf/Install.lua"))();
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
local PuzzlePieces = game:GetService("Workspace").Museum.Puzzle2.Pieces

-- Bool Variables
local flying = false
local InfJump = false
local AntiAfk = false
local AutoOpenDoor = false
local JewDisarmLasers = false
local BankDisarmLasers = false
local CasinoDisarmLasers = false
local StoreStatusNotify = true
local Jumping = false
local RemoveDoors = true
local HoldingShift = false
local TombDisarmDarts = false
local CasinoStatus = false
local CasinoAutoCrackVaults
local ShipTurretsDisarm = false
local AutoPuzzleMus = false

-- Tables
local DartDamage = {}
local SlidingDoorParts = {}
local MusDiamonds = {
    ["-15, 52, 0"] = "23", 
    ["-30, 52, 0"] = "22",
    ["-45, 52, 0"] = "21",
    ["-60, 52, 0"] = "20",
    ["-75, 51, 0"] = "19",
    ["-90, 52, 0"] = "18",
    ["-75, -128, 180"] = "17",
    ["-60, -128, 180"] = "16",
    ["-45, -128, -180"] = "15",
    ["-30, -128, -180"] = "14",
    ["-15, -128, -180"] = "13",
    ["0, -128, 180"] = "12",
    ["15, -128, 180"] = "11",
    ["30, -128, 180"] = "10",
    ["45, -128, 180"] = "9",
    ["60, -128, -180"] = "8",
    ["75, -129, 179"] = "7",
    ["90, 52, 0"] = "6",
    ["75, 52, 0"] = "5",
    ["60, 52, 0"] = "4",
    ["45, 52, 0"] = "3",
    ["30, 52, 0"] = "2",
    ["15, 52, 0"] = "1"
}

-- KeyBinds
local FlyToggle = Enum.KeyCode.H
local HoldToSelect  = Enum.KeyCode.LeftControl
local HoldToUndoAll = Enum.KeyCode.LeftAlt
local ToggleUI = Enum.KeyCode.RightControl

if game.Players.LocalPlayer.Character:findFirstChild("UpperTorso") then 
    torso = "UpperTorso" 
else 
    torso = "Torso"
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
Home:Switch("AntiAfk","Enables and Disables AntiAfk","rbxthumb://type=Asset&id=" .. 9554563465 .. "&w=420&h=420",false,"","",function(e)
    if e == true or e == false then
        AntiAfk = e
    end
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


local Player = library:Tab("Player","rbxassetid://3926307971","884, 4","36, 36");

    -- Movement
    Player:Text("Movement")
    Player:Slider("WalkSpeed","Changes your WalkSpeed via slider","rbxassetid://3926305904",plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed,plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed,300,"924, 684","36, 36",function(e)
        --WalkSpeed = e
    end)
    Player:Slider("JumpPower","Changes your JumpPower via slider","rbxthumb://type=Asset&id=" .. 9050394095 .. "&w=420&h=420",plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower,plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower,500,"","",function(e)
        --JumpPower = e
    end)
    Player:Switch("Infinite Jump","Toggles infinite jump","rbxassetid://3926307971",false,"164, 84","36, 36",function(e)
        if e == true or e == false then
            InfJump = e
        end
    end)
    Player:Bind("Fly","Key to toggle flying","rbxthumb://type=Asset&id=" .. 9050262743 .. "&w=420&h=420",Enum.KeyCode.H,"","",function(e)
        if e ~= true and e ~= false then
            FlyToggle = e
        end
    end)
    Player:Slider("Fly Speed","Changes your flyspeed via slider","rbxthumb://type=Asset&id=" .. 9059787706 .. "&w=420&h=420",0,100,600,"","",function(e)
        maxspeed = e
    end)

    -- DeleteTool
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


-- Environment
local Environment = library:Tab("Environment","rbxassetid://3926305904","644, 844","36, 36");

    Environment:Switch("Remove Doors","Removes all doors","rbxthumb://type=Asset&id=" .. 9426988006 .. "&w=420&h=420",false,"","",function(e)
        if e == true or e == false then
            RemoveDoors = e
            if RemoveDoorsFunction ~= nil then
                RemoveDoorsFunction()
            end
        end
    end)
    Environment:Switch("Rails NoCollide","Turns off cancollide on all train rails","rbxthumb://type=Asset&id=" .. 9776594935 .. "&w=420&h=420",false,"","",function(e)
        if e == true or e == false then
            if RailsCollide ~= nil then
                RailsCollide(e)
            end
        end
    end)


-- Rob Assistant
local RobAssistant = library:Tab("Robbery Assistant","rbxthumb://type=Asset&id=" .. 9454557677 .. "&w=420&h=420","","");

    -- Notify Store Status
    RobAssistant:Switch("Notify Store Status","Sends a notification to you when a store opens.","rbxthumb://type=Asset&id=" .. 9455170304 .. "&w=420&h=420",true,"","",function(e)
        if e == true or e == false then
            StoreStatusNotify = e
        end
    end)

    -- Casino Assistant
    local Casino = RobAssistant:Section("Casino Assistants","","rbxthumb://type=Asset&id=" .. 9427340203 .. "&w=420&h=420","","")
    Casino:Switch("Auto Open Door","Toggles auto open door for the Casino","rbxthumb://type=Asset&id=" .. 9426988006 .. "&w=420&h=420",false,"","",function(e)
        if e == true or e == false then
            AutoOpenDoor = e
        end
    end)
    Casino:Switch("Auto Crack Vaults","Automaticly Crack the vaults after you start it!","rbxthumb://type=Asset&id=" .. 9188665128 .. "&w=420&h=420",false,"","",function(e)
        if e == true or e == false then
            CasinoAutoCrackVaults = e
        end
    end)
    Casino:Switch("Disarm Lasers","Disarm all lasers and cameras from Casino","rbxthumb://type=Asset&id=" .. 9432917379 .. "&w=420&h=420",false,"","",function(e)
        if e == true or e == false then
            CasinoDisarmLasers = e
            if DisarmCasinoLasers ~= nil then
                DisarmCasinoLasers()
            end
        end
    end)

    -- Jewelry Assistant
    local Jewelry = RobAssistant:Section("Jewelry Assistants","","rbxthumb://type=Asset&id=" .. 9427244377 .. "&w=420&h=420","","")
    Jewelry:Switch("Disarm Lasers","Disarm all lasers and cameras from Jewelry","rbxthumb://type=Asset&id=" .. 9432917379 .. "&w=420&h=420",false,"","",function(e)
        if e == true then
            DisarmJewLasers()
            JewDisarmLasers = true
        end
    end)

    -- Bank Assistant
    local Bank = RobAssistant:Section("Bank Assistants","","rbxthumb://type=Asset&id=" .. 9188665128 .. "&w=420&h=420","","")
    Bank:Switch("Disarm Lasers","Disarm all lasers and cameras from Bank","rbxthumb://type=Asset&id=" .. 9432917379 .. "&w=420&h=420",false,"","",function(e)
        if e == true then
            DisarmBankLasers()
            BankDisarmLasers = true
        end
    end)

    -- Tomb Assistant
    local Tomb = RobAssistant:Section("Tomb Assistants","","rbxthumb://type=Asset&id=" .. 9548325862 .. "&w=420&h=420","","")
    Tomb:Switch("Disarm Spikes","Disarm all Spikes in the Tomb","rbxthumb://type=Asset&id=" .. 9548377640 .. "&w=420&h=420",false,"","",function(e)
        if e == true then
            DisarmTombSpikes()
        end
    end)
    Tomb:Switch("Disarm Darts","Disarm all Dispensers in the Tomb","rbxthumb://type=Asset&id=" .. 9592730478 .. "&w=420&h=420",false,"","",function(e)
        if e == true or e == false then
            TombDisarmDarts = e
            if DisarmTombDarts ~= nil then
                DisarmTombDarts()
            end
        end
    end)

    -- CargoShip Assistant
    local CargoShip = RobAssistant:Section("CargoShip Assistants","","rbxthumb://type=Asset&id=" .. 9735574541 .. "&w=420&h=420","","")
    CargoShip:Switch("Disarm Turrets","Disarm all Turrets on the CargoShip","rbxthumb://type=Asset&id=" .. 9735575183 .. "&w=420&h=420",false,"","",function(e)
        if e == true or e == false then
            ShipTurretsDisarm = e
            if DisarmShipTurrets ~= nil then
                DisarmShipTurrets()
            end
        end
    end)
    
    -- Museum Assistant
    local Museum = RobAssistant:Section("Museum Assistants","","rbxthumb://type=Asset&id=" .. 9949099692 .. "&w=420&h=420","","")
    Museum:Switch("Auto Puzzles","Automaticly complete the two puzzles to escape.","rbxassetid://3926305904",false,"924, 244","36, 36",function(e)
        if e == true or e == false then
            AutoPuzzleMus = e
            if PuzzleMus ~= nil then
                PuzzleMus()
            end
        end
    end)


-- Scripts

-- Update Player Count
plrs.PlayerAdded:Connect(function()
    PlayerNum:Set("               Players:        "..#game.Players:GetChildren().." / "..game.Players.MaxPlayers)
end)
plrs.PlayerRemoving:Connect(function()
    PlayerNum:Set("               Players:        "..#game.Players:GetChildren().." / "..game.Players.MaxPlayers)
end)


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


-- Anti-AFK
local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    if AntiAfk then
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
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
            if not Mouse.Target:IsA("Terrain") then
                Parts[Mouse.Target] = {Part = Mouse.Target, Parent = Mouse.Target.Parent}
                Mouse.Target.Parent = game.CoreGui;
                Sound0:Play()
            end
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
                Parts[c].Part.Parent = Parts[c].Parent
                Parts[c] = nil
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
          if HoldingShift == false then
              repeat wait() until plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed ~= WalkSpeed or plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower ~= JumpPower
              plr.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = WalkSpeed
              plr.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = JumpPower
          end
       end)
    end
end)


-- Check if sprinting
game:GetService("UserInputService").InputBegan:Connect(function(key, gameProcessedEvent)
    if key.KeyCode == Enum.KeyCode.LeftShift then
        HoldingShift = true
        repeat wait() until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) == false
        HoldingShift = false
    end
end)
    
    
-- InfJump
game:GetService("UserInputService").JumpRequest:connect(function()
   if InfJump == true and Jumping == false then
       Jumping = true
       game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
       repeat wait(0.1) until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) == false
       Jumping = false
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


-- AutoOpenDoor Casino
spawn(function()
    while wait() do
        if AutoOpenDoor and game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace").Casino.RobberyDoor.Door.InnerModel.TheDoor.Position) < 15 then
            for _,v in ipairs(game:GetService("Workspace").Casino.RobberyDoor.Codes:GetChildren()) do
               if v:GetChildren()[1].SurfaceGui.TextLabel.Text ~= "" then
                   Digits = {v:GetChildren()[1].SurfaceGui.TextLabel.Text, v:GetChildren()[2].SurfaceGui.TextLabel.Text, v:GetChildren()[3].SurfaceGui.TextLabel.Text, v:GetChildren()[4].SurfaceGui.TextLabel.Text}
                   repeat wait()
                        game:GetService("Workspace").Casino.RobberyDoor.Keypad.Pad.CasinoKeypadSubmit:FireServer(table.concat(Digits, ''))
                   until game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace").Casino.RobberyDoor.Door.InnerModel.TheDoor.Position) >= 15
                   CasinoStatus = true
               end
            end
            if CasinoStatus == false then
                spawn(function()
                    notify.push({
                        Title = "H3x",
                        Text = "The Casino is currently closed.",
                        Duration = 10;
                    })
                end)
                repeat wait() until game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace").Casino.RobberyDoor.Door.InnerModel.TheDoor.Position) >= 15
            end
            CasinoStatus = false
        end
    end
end)


-- Disarm Casino Lasers
function DisarmCasinoLasers()
    wait(0.5)
    for _,v in ipairs(game:GetService("Workspace").Casino.Lasers:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            v.TouchInterest:Destroy()
            v.CanCollide = false
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Casino.LasersMoving:GetChildren()) do
        if v.InnerModel.Part:FindFirstChild("TouchInterest") then
            v.InnerModel.Part.Color = Color3.fromRGB(0, 255, 0)
            v.InnerModel.Part.TouchInterest:Destroy()
            v.InnerModel.Part.CanCollide = false
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Casino.LaserCarousel.InnerModel:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            v.TouchInterest:Destroy()
            v.CanCollide = false
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Casino.VaultLaserControl:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            v.CanCollide = false
            for _,v in ipairs(v:GetChildren()) do
                if v.Name == "TouchInterest" then
                    v:Destroy()
                end
            end
        else
            if v:FindFirstChild("Part") then
                v.InnerModel.Part.Color = Color3.fromRGB(0, 255, 0)
                v.InnerModel.Part.CanCollide = false
                for _,v in ipairs(v.InnerModel.Part:GetChildren()) do
                    if v.Name == "TouchInterest" then
                        v:Destroy()
                    end
                end
            end
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Casino.CamerasMoving:GetChildren()) do
        if v.InnerModel.Part:FindFirstChild("TouchInterest") then
            v.InnerModel.Part.Color = Color3.fromRGB(31, 128, 29)
            v.InnerModel.Part.CanCollide = false
            v.InnerModel.Shadow.Color = Color3.fromRGB(0, 255, 0)
            v.InnerModel.Part.TouchInterest:Destroy()
        end
    end
end
game:GetService("Workspace").Casino.OpenIndicators.Part:GetPropertyChangedSignal("Material"):Connect(function()
    if game:GetService("Workspace").Casino.OpenIndicators.Part.Material == Enum.Material.Neon then
        DisarmCasinoLasers()   
        if StoreStatusNotify then
            spawn(function()
                notify.push({
                    Title = "H3x",
                    Text = "Casino just Opened",
                    Duration = 10;
                })
            end) 
        end
    elseif CasinoDisarmLasers then
        for _,v in ipairs(game:GetService("Workspace").Casino.VaultLaserControl:GetChildren()) do
            if v:FindFirstChild("TouchInterest") then
                v.Color = Color3.fromRGB(0, 255, 0)
                for _,v in ipairs(v:GetChildren()) do
                    if v.Name == "TouchInterest" then
                        v:Destroy()
                    end
                end
            else
                if v:FindFirstChild("Part") then
                    v.InnerModel.Part.Color = Color3.fromRGB(0, 255, 0)
                    for _,v in ipairs(v.InnerModel.Part:GetChildren()) do
                        if v.Name == "TouchInterest" then
                            v:Destroy()
                        end
                    end
                end
            end
        end
    end
end)


-- Disarm Jewelrys Lasers
function DisarmJewLasers()
    wait(0.5)
    for _,v in ipairs(game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model"):GetChildren()) do
        if v.Name == "BarbedWire" then
            v.Color = Color3.fromRGB(0, 255, 0)
            if v:FindFirstChild("TouchInterest") then
                v.TouchInterest:Destroy()
            end
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors:FindFirstChildWhichIsA("Model"):FindFirstChild("Lasers"):GetChildren()) do
        v.InnerModel.Part.Color = Color3.fromRGB(0, 255, 0)
        for _,v in ipairs(v.InnerModel.Part:GetChildren()) do
            if v.Name == "TouchInterest" then
                v:Destroy()
            end
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors:FindFirstChildWhichIsA("Model"):GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            for _,v in ipairs(v:GetChildren()) do
                if v.Name == "TouchInterest" then
                    v:Destroy()
                end
            end
        end
    end
    
    if game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors:FindFirstChildWhichIsA("Model"):FindFirstChild("Cameras") then
        for _,v in ipairs(game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors:FindFirstChildWhichIsA("Model").Cameras:GetChildren()) do
            for _,v in ipairs(v.InnerModel:GetChildren()) do
                if v.Name == "Lens" then
                    v.Color = Color3.fromRGB(31, 128, 29)
                elseif v:FindFirstChild("TouchInterest") then
                    v.Color = Color3.fromRGB(0, 255, 0)
                    for _,v in ipairs(v:GetChildren()) do
                        if v.Name == "TouchInterest" then
                            v:Destroy()
                        end
                    end
                elseif not v:FindFirstChild("TouchInterest") and v.Name == "Part" then
                    v.Color = Color3.fromRGB(75, 151, 75) 
                end
            end
        end
    end
    
    if game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors:FindFirstChildWhichIsA("Model"):FindFirstChild("LaserFloor") then
        for _,v in ipairs(game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors:FindFirstChildWhichIsA("Model"):FindFirstChild("LaserFloor"):GetChildren()) do
            if v:FindFirstChild("TouchInterest") then
                v.Color = Color3.fromRGB(0, 255, 0)
                v.TouchInterest:Destroy()
            end
        end
    end
end
game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model").Floors.ChildAdded:Connect(function()
    if StoreStatusNotify then
        spawn(function()
            notify.push({
                Title = "H3x",
                Text = "Jewelry just Opened",
                Duration = 10;
            })
        end)
    end
    if JewDisarmLasers == true then
        DisarmJewLasers()
    end
end)


-- Disarm Bank Lasers
function DisarmBankLasers()
    wait(0.5)
    for _,v in ipairs(game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model").Lasers:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            if v:FindFirstChild("TouchInterest") then
                v.TouchInterest:Destroy()  
            end
        elseif v.Name == "LaserTrack" then
            for _,v in ipairs(v.Lasers:GetChildren()) do
                v.Color = Color3.fromRGB(0, 255, 0)
                if v:FindFirstChild("TouchInterest") then
                    v.TouchInterest:Destroy()  
                end
            end
        else
            if v:FindFirstChild("Part") then
                v.Part.Color = Color3.fromRGB(0, 255, 0)
                if v.Part:FindFirstChild("TouchInterest") then
                    v.Part.TouchInterest:Destroy()  
                end
            end
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model").EscapeRoutes.BankDoor.Door.Model:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            if v:FindFirstChild("TouchInterest") then
                v.TouchInterest:Destroy()  
            end
        end
    end
end
game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout.ChildAdded:Connect(function()
    if StoreStatusNotify then
        spawn(function()
            notify.push({
                Title = "H3x",
                Text = "Bank just Opened",
                Duration = 10;
            })
        end)
    end
    if BankDisarmLasers == true then
        DisarmBankLasers()
    end
    for _,v in ipairs(game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model"):WaitForChild("EscapeRoutes").BankDoor.Door.Model:GetChildren()) do
        if RemoveDoors == true then
            v.CanCollide = false
            v.Transparency = 0.6
        else
            v.CanCollide = true
            v.Transparency = 0
        end
    end
end)
    

-- Remove Doors
function RemoveDoorsFunction()   
    for _,v in ipairs(game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model").EscapeRoutes.BankDoor.Door.Model:GetChildren()) do
        if RemoveDoors == true then
            v.CanCollide = false
            v.Transparency = 0.6
        else
            v.CanCollide = true
            v.Transparency = 0
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model"):GetChildren()) do
        if v.Name == "SwingDoor" then
            if RemoveDoors == true then
                v.Model.TheDoor.CanCollide = false
                v.Model.TheGlass.CanCollide = false
                v.Model.TheDoor.Transparency = 0.5
                v.Model.TheGlass.Transparency = 0.94
            else
                v.Model.TheDoor.CanCollide = true
                v.Model.TheGlass.CanCollide = true
                v.Model.TheDoor.Transparency = 0
                v.Model.TheGlass.Transparency = 0.8
            end
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Jewelrys:FindFirstChildWhichIsA("Model"):GetChildren()) do
        if v.Name == "SwingDoor" then
            if RemoveDoors == true then
                v.Model.TheDoor.CanCollide = false
                v.Model.TheGlass.CanCollide = false
                v.Model.TheDoor.Transparency = 0.5
                v.Model.TheGlass.Transparency = 0.94
            else
                v.Model.TheDoor.CanCollide = true
                v.Model.TheGlass.CanCollide = true
                v.Model.TheDoor.Transparency = 0
                v.Model.TheGlass.Transparency = 0.8
            end
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "Cell" and v:FindFirstChild("Door")then
            if RemoveDoors == true then
                v.Door.Model.Open.CanCollide = false
                for _,v in ipairs(v.Door.Model.Open:GetChildren()) do
                    v.Transparency = 0.6
                end
            else
                v.Door.Model.Open.CanCollide = true
                for _,v in ipairs(v.Door.Model.Open:GetChildren()) do
                    v.Transparency = 0
                end
            end
        end
    end

    for _,v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "SwingDoor" and v.Model:FindFirstChild("TheDoor") then
            if RemoveDoors == true then
                v.Model.TheDoor.CanCollide = false
                v.Model.TheGlass.CanCollide = false
                v.Model.TheDoor.Transparency = 0.5
                v.Model.TheGlass.Transparency = 0.94
            else
                v.Model.TheDoor.CanCollide = true
                v.Model.TheGlass.CanCollide = true
                v.Model.TheDoor.Transparency = 0
                v.Model.TheGlass.Transparency = 0.8
            end
        elseif v.Name == "SwingDoor" then
            for _,v in ipairs(v.Model:GetChildren()) do
                if v:IsA("Part") then
                    if RemoveDoors == true then
                        if v.Transparency ~= 1 then
                            SlidingDoorParts[v] = v.Transparency
                            v.Transparency = v.Transparency + 0.6
                        end
                        v.CanCollide = false
                    else
                        if v.Transparency ~= 1 then
                            v.Transparency = SlidingDoorParts[v]   
                        end
                        v.CanCollide = true
                    end
                end
            end 
            for _,v in ipairs(v.Model:GetDescendants()) do
                if v:IsA("Texture") then
                    v.Transparency = 0.6
                end
            end   
        end
    end

    for _,v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "SlideDoor" then
            for _,v in ipairs(v.Model:GetChildren()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    if RemoveDoors == true then
                        if v.Transparency ~= 1 then
                            SlidingDoorParts[v] = v.Transparency
                            v.Transparency = 0.6
                        end
                        v.CanCollide = false
                    else
                        if v.Transparency ~= 1 then
                            v.Transparency = SlidingDoorParts[v]
                        end
                        v.CanCollide = true
                    end
                end
            end
            for _,v in ipairs(v.Model:GetDescendants()) do
                if v:IsA("Texture") then
                    v.Transparency = 0.6
                end
            end
        end
    end
end


-- Disarm Tomb Spikes
function DisarmTombSpikes()
    for _,v in ipairs(game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes:GetChildren()) do
        for _,v in ipairs(v:GetChildren()) do
            v.Model.InnerModel.Door.TouchInterest:Destroy()
            v.Model.InnerModel.Spikes.MeshId = "rbxassetid://5547038744"
            v.Model.InnerModel.Spikes.Size = Vector3.new(30, 15, 30)
            local SurfaceAppearance = Instance.new("SurfaceAppearance")
            SurfaceAppearance.Parent = v.Model.InnerModel.Spikes
            SurfaceAppearance.AlphaMode = Enum.AlphaMode.Transparency
            SurfaceAppearance.ColorMap = "rbxassetid://5164021540"
            SurfaceAppearance.MetalnessMap = "rbxassetid://6036394111"
            SurfaceAppearance.NormalMap = "rbxassetid://5164022093"
            SurfaceAppearance.RoughnessMap = "rbxassetid://5164022409"
        end
    end

    while wait() do
        for _,v in ipairs(game:GetService("Workspace").RobberyTomb.SpikeRoom.Spikes:GetChildren()) do
            for _,v in ipairs(v:GetChildren()) do
                if v.Tile.Color == Color3.fromRGB(186, 124, 111) then
                    v.Tile.Color = Color3.fromRGB(124, 156, 107)
                end
            end
        end
    end
end


-- Disarm Tomb Darts
function DisarmTombDarts()
    if TombDisarmDarts then
        for _,v in ipairs(game:GetService("Workspace").RobberyTomb.DartRoom.Darts:GetChildren()) do
            if v:FindFirstChild("DartDamage") then
                DartDamage[v.DartDamage] = {Part = v.DartDamage, Parent = v.DartDamage.Parent}
                v.DartDamage.Parent = game.CoreGui
            end
        end
        spawn(function()
            repeat wait()
                spawn(function()
                    for _,v in ipairs(game:GetService("Workspace").Darts:GetChildren()) do
                        for _,v in ipairs(v:GetChildren()) do
                            for _,v in ipairs(v:GetChildren()) do
                                if v.Name == "Decal" then
                                    v.Color3 = Color3.fromRGB(0,255,0)
                                end
                            end
                        end
                    end
                end)
                for _,v in ipairs(game:GetService("Workspace").RobberyTomb.DartRoom.Pillars:GetChildren()) do
                    if v.InnerModel.Platform.Color == Color3.fromRGB(253, 123, 97) then
                        v.InnerModel.Platform.Color = Color3.fromRGB(124, 156, 107)
                    end
                end
            until game:GetService("Workspace").RobberyTomb.Guardians.Statue.Eyes.Material ~= Enum.Material.Neon or TombDisarmDarts == false
        end)
    else
        for _,v in pairs(DartDamage) do    
            v.Part.Parent = v.Parent    
            DartDamage[v] = nil
        end
    end
end
game:GetService("Workspace").RobberyTomb.Guardians.Statue.Eyes:GetPropertyChangedSignal("Material"):Connect(function()
    if StoreStatusNotify and game:GetService("Workspace").RobberyTomb.Guardians.Statue.Eyes.Material == Enum.Material.Neon then
        spawn(function()
            notify.push({
                Title = "H3x",
                Text = "Tomb just Opened",
                Duration = 10;
            })
        end)
    end
    if TombDisarmDarts then
        spawn(function()
            repeat wait()
                for _,v in ipairs(game:GetService("Workspace").Darts:GetChildren()) do
                    for _,v in ipairs(v:GetChildren()) do
                        for _,v in ipairs(v:GetChildren()) do
                            if v.Name == "Decal" then
                                v.Color3 = Color3.fromRGB(0,255,0)
                            end
                        end
                    end
                end
            until game:GetService("Workspace").RobberyTomb.Guardians.Statue.Eyes.Material ~= Enum.Material.Neon or TombDisarmDarts == false
        end)
    end
end)


-- Casino Auto Crack Vaults
for _,v in ipairs(game:GetService("Workspace").Casino.HackableVaults:GetChildren()) do
    if v.Name == "VaultDoorSlider" then
        v.InnerModel.Model.Light:GetPropertyChangedSignal("Color"):Connect(function()
            if v.InnerModel.Model.Light.Color == Color3.fromRGB(0,255,0) and CasinoAutoCrackVaults then
                v.InnerModel.Puzzle.UpdateDirection:FireServer()
            end
        end)
    end
end

game:GetService("Workspace").Casino.HackableVaults.VaultDoorMain.InnerModel.Model.UnlockedLED:GetPropertyChangedSignal("Color"):Connect(function()
    if game:GetService("Workspace").Casino.HackableVaults.VaultDoorMain.InnerModel.Model.UnlockedLED.Color == Color3.fromRGB(0,255,0) and CasinoAutoCrackVaults then
        game:GetService("Workspace").Casino.HackableVaults.VaultDoorMain.InnerModel.Puzzle.UpdateDirection:FireServer()
    end
end)


-- CargoShip Disarm Turrets
function DisarmShipTurrets()
	if ShipTurretsDisarm and game.Workspace:FindFirstChild("CargoShip") then
		local Cork = Instance.new("MeshPart")
		Cork.Name = "Cork"
		Cork.Parent = game.Workspace.CargoShip.TurretFront.Arm
		Cork.MeshId = "rbxassetid://6874611209"
		Cork.Size = Vector3.new(0.1,0.05,0.1)
		Cork.Position = game.Workspace.CargoShip.TurretFront.Arm.Tip.Position
		Cork.Orientation = Vector3.new(game.Workspace.CargoShip.TurretFront.Arm.Tip.Orientation.X - 90,game.Workspace.CargoShip.TurretFront.Arm.Tip.Orientation.Y,game.Workspace.CargoShip.TurretFront.Arm.Tip.Orientation.Z)
        game.Workspace.CargoShip.TurretFront.Arm.Tip.Parent = game.CoreGui
		local WeldConstraint = Instance.new("WeldConstraint")
		WeldConstraint.Parent = Cork
		WeldConstraint.Part0 = Cork
		WeldConstraint.Part1 = game.Workspace.CargoShip.TurretFront.Arm.Barrel
		local SurfaceAppearance = Instance.new("SurfaceAppearance")
		SurfaceAppearance.Parent = Cork
		SurfaceAppearance.AlphaMode = Enum.AlphaMode.Overlay
		SurfaceAppearance.ColorMap = "rbxassetid://6874617462"
		SurfaceAppearance.MetalnessMap = "rbxassetid://6874620077"
		SurfaceAppearance.NormalMap = "rbxassetid://6874616351"
		SurfaceAppearance.RoughnessMap = "rbxassetid://6874618816"
        local Fire = Instance.new("Fire")
        Fire.Parent = game.Workspace.CargoShip.TurretFront.Base.Detail
        Fire.Size = 30
		local Cork1 = Instance.new("MeshPart")
		Cork1.Name = "Cork1"
		Cork1.Parent = game.Workspace.CargoShip.TurretBack.Arm
		Cork1.MeshId = "rbxassetid://6874611209"
		Cork1.Size = Vector3.new(0.1,0.05,0.1)
		Cork1.Position = game.Workspace.CargoShip.TurretBack.Arm.Tip.Position
		Cork1.Orientation = Vector3.new(game.Workspace.CargoShip.TurretBack.Arm.Tip.Orientation.X - 90,game.Workspace.CargoShip.TurretBack.Arm.Tip.Orientation.Y,game.Workspace.CargoShip.TurretBack.Arm.Tip.Orientation.Z)
        game.Workspace.CargoShip.TurretBack.Arm.Tip.Parent = game.CoreGui
		local SurfaceAppearance = Instance.new("SurfaceAppearance")
		SurfaceAppearance.Parent = Cork1
		SurfaceAppearance.AlphaMode = Enum.AlphaMode.Overlay
		SurfaceAppearance.ColorMap = "rbxassetid://6874617462"
		SurfaceAppearance.MetalnessMap = "rbxassetid://6874620077"
		SurfaceAppearance.NormalMap = "rbxassetid://6874616351"
		SurfaceAppearance.RoughnessMap = "rbxassetid://6874618816"
		local WeldConstraint = Instance.new("WeldConstraint")
		local WeldConstraint = Instance.new("WeldConstraint")
		WeldConstraint.Parent = Cork1
		WeldConstraint.Part0 = Cork1
		WeldConstraint.Part1 = game.Workspace.CargoShip.TurretBack.Arm.Barrel
        local Fire = Instance.new("Fire")
        Fire.Parent = game.Workspace.CargoShip.TurretBack.Base.Detail
        Fire.Size = 30
    else
        if game.Workspace:FindFirstChild("CargoShip") and not game.Workspace.CargoShip.TurretFront.Arm:FindFirstChild("Tip") then
            game.CoreGui.Tip.Parent = game.Workspace.CargoShip.TurretFront.Arm
            game.Workspace.CargoShip.TurretFront.Arm.Cork:Destroy()
            game.Workspace.CargoShip.TurretFront.Base.Detail.Fire:Destroy()
        elseif game.CoreGui:FindFirstChild("Tip") then
            game.CoreGui.Tip:Destroy()
        end
        if game.Workspace:FindFirstChild("CargoShip") and not game.Workspace.CargoShip.TurretBack.Arm:FindFirstChild("Tip") then
            game.CoreGui.Tip.Parent = game.Workspace.CargoShip.TurretBack.Arm
            game.Workspace.CargoShip.TurretBack.Arm.Cork1:Destroy()
            game.Workspace.CargoShip.TurretBack.Base.Detail.Fire:Destroy()
        elseif game.CoreGui:FindFirstChild("Tip") then
            game.CoreGui.Tip:Destroy()
        end
    end
end
game.Workspace.ChildAdded:Connect(function(model)
    if model.Name == "CargoShip" and ShipTurretsDisarm then
        if StoreStatusNotify then
            spawn(function()
                notify.push({
                    Title = "H3x",
                    Text = "CargoShip just Entered the map",
                    Duration = 10;
                })
            end)
        end
        wait(1)
        DisarmShipTurrets()
    end
end)


-- Rails NoCollide
function RailsCollide(state)
	for _,v in ipairs(game.Workspace:GetDescendants()) do
		if v:IsA("MeshPart") and v.Material == Enum.Material.Metal and v.Color == Color3.fromRGB(91,93,105) then
			v.CanCollide = not state
		end
	end	
end


-- Vector Rounder
function roundVector(vector, unit)
    return vector - Vector3.new(vector.X%unit, vector.Y%unit, vector.Z%unit)
end


-- Auto Complete Puzzles Mus function
function PuzzleMus()
    if AutoPuzzleMus then
        spawn(function()
            for _,v in ipairs(game:GetService("Workspace").Museum.Puzzle1.Spinners:GetChildren()) do
                if v.Orientation ~= Vector3.new(0, 52, 0) then
                    for i = 1, MusDiamonds[tostring(roundVector(v.Orientation,1))] do
		    	fireclickdetector(v.ClickDetector, 5)
			wait()
		    end
                end
            end
	end)
	spawn(function()
            if PuzzlePieces:FindFirstChild("2").Orientation ~= Vector3.new(0, -38, 180) or PuzzlePieces:FindFirstChild("2").Orientation ~= Vector3.new(0, -38, 0) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("2").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("2").Orientation == Vector3.new(0, -38, 90) or PuzzlePieces:FindFirstChild("2").Orientation == Vector3.new(0, -38, -90)
            end
				
            if PuzzlePieces:FindFirstChild("3").Orientation ~= Vector3.new(0, -38, 0) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("3").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("3").Orientation == Vector3.new(0, -38, -90)
            end
				
            if PuzzlePieces:FindFirstChild("10").Orientation ~= Vector3.new(0, -38, 180) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("10").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("10").Orientation == Vector3.new(0, -38, 90)
            end
				
            if PuzzlePieces:FindFirstChild("11").Orientation ~= Vector3.new(0, -38, 180) or PuzzlePieces:FindFirstChild("11").Orientation ~= Vector3.new(0, -38, 0) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("11").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("11").Orientation == Vector3.new(0, -38, 90) or PuzzlePieces:FindFirstChild("11").Orientation == Vector3.new(0, -38, -90)
            end
				
            if PuzzlePieces:FindFirstChild("12").Orientation ~= Vector3.new(0, -38, 0) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("12").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("12").Orientation == Vector3.new(0, -38, -90)
            end
				
            if PuzzlePieces:FindFirstChild("19").Orientation ~= Vector3.new(0, -38, 180) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("19").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("19").Orientation == Vector3.new(0, -38, 90)
            end
				
            if PuzzlePieces:FindFirstChild("20").Orientation ~= Vector3.new(0, -38, -90) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("20").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("20").Orientation == Vector3.new(0, -38, 180)
            end
				
            if PuzzlePieces:FindFirstChild("13").Orientation ~= Vector3.new(0, -38, 90) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("13").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("13").Orientation == Vector3.new(0, -38, 0)
            end
				
            if PuzzlePieces:FindFirstChild("14").Orientation ~= Vector3.new(0, -38, 0) then
                repeat wait(0.5)
                    fireclickdetector(PuzzlePieces:FindFirstChild("14").ClickDetector, 5)
                until PuzzlePieces:FindFirstChild("14").Orientation == Vector3.new(0, -38, -90) 
            end
        end)
    end
end

-- Museum hole Transparency changed
game:GetService("Workspace").Museum.Roof.Hole.RoofPart:GetPropertyChangedSignal("Transparency"):Connect(function()
    if game:GetService("Workspace").Museum.Roof.Hole.RoofPart.Transparency == 1 then
        PuzzleMus()
    end
end)
