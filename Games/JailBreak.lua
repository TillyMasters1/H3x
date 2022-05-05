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
local SlidingDoorParts = {}

-- Bool Variables
local flying = false
local InfJump = false
local AutoOpenDoor = false
local CasinoDoorTouch = false
local JewDisarmLasers = false
local BankDisarmLasers = false
local StoreStatusNotify = true
local Jumping = false
local RemoveDoors = true

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
    Casino:Switch("Disarm Lasers","Disarm all lasers and cameras from Casino","rbxthumb://type=Asset&id=" .. 9432917379 .. "&w=420&h=420",false,"","",function(e)
        if e == true then
            DisarmCasinoLasers()
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
    local CasinoDoor = Instance.new("Part")
    CasinoDoor.Parent = game:GetService("Workspace").Casino.RobberyDoor
    CasinoDoor.CFrame = CFrame.new(54.1812134, 20.8244991, -4708.33691, -0.961297989, 0, -0.275510818, 0, 1, 0, 0.275510818, 0, -0.961297989)
    CasinoDoor.Size = Vector3.new(10.0019, 30, 8.99407)
    CasinoDoor.Color = Color3.fromRGB(196, 40, 28)
    CasinoDoor.Anchored = true
    CasinoDoor.CanCollide = false
    CasinoDoor.Transparency = 1       
    CasinoDoor.Touched:connect(function()
        if AutoOpenDoor == true and CasinoDoorTouch == false then
            CasinoDoorTouch = true
            for _,v in ipairs(game:GetService("Workspace").Casino.RobberyDoor.Codes:GetChildren()) do
               if v:GetChildren()[1].SurfaceGui.TextLabel.Text ~= "" then
                   Digits = {v:GetChildren()[1].SurfaceGui.TextLabel.Text, v:GetChildren()[2].SurfaceGui.TextLabel.Text, v:GetChildren()[3].SurfaceGui.TextLabel.Text, v:GetChildren()[4].SurfaceGui.TextLabel.Text}
                   repeat wait()
                        game:GetService("Workspace").Casino.RobberyDoor.Keypad.Pad.CasinoKeypadSubmit:FireServer(table.concat(Digits, ''))
                   until CasinoDoorTouch == false
                   return
               end
            end
            spawn(function()
                notify.push({
                    Title = "H3x",
                    Text = "The Casino is currently closed.",
                    Duration = 10;
                })
            end)
        end
    end)
    CasinoDoor.TouchEnded:connect(function()
        wait(1)
        CasinoDoorTouch = false    
    end)
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
            v.TouchInterest:Destroy()
        else
            if v:FindFirstChild("Part") then
                v.Part.Color = Color3.fromRGB(0, 255, 0)
                v.Part:FindFirstChild("TouchInterest"):Destroy()  
            end
        end
    end
    
    --[[
    if game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model"):FindFirstChild("Underwater").EscapeRoutes.BankDoor.Door.Model then
        for _,v in ipairs(game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model"):FindFirstChild("Underwater").EscapeRoutes.BankDoor.Door.Model:GetChildren()) do
            if v:FindFirstChild("TouchInterest") then
                v.Color = Color3.fromRGB(0, 255, 0)
                v.TouchInterest:Destroy()
            end
        end
    end]]--
    
    if game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model"):FindFirstChild("Underwater") then
        for _,v in ipairs(game:GetService("Workspace").Banks:FindFirstChildWhichIsA("Model").Layout:FindFirstChildWhichIsA("Model").Underwater.Lasers:GetChildren()) do
            if v:FindFirstChild("TouchInterest") then
                v.Color = Color3.fromRGB(0, 255, 0)
                v.TouchInterest:Destroy()
            else
                if v:FindFirstChild("Part") then
                    v.Part.Color = Color3.fromRGB(0, 255, 0)
                    v.Part:FindFirstChild("TouchInterest"):Destroy()  
                end
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
end)


-- Disarm Casino Lasers
function DisarmCasinoLasers()
    wait(0.5)
    for _,v in ipairs(game:GetService("Workspace").Casino.Lasers:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            v.TouchInterest:Destroy()
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Casino.LasersMoving:GetChildren()) do
        if v.InnerModel.Part:FindFirstChild("TouchInterest") then
            v.InnerModel.Part.Color = Color3.fromRGB(0, 255, 0)
            v.InnerModel.Part.TouchInterest:Destroy()
        end
    end
    
    for _,v in ipairs(game:GetService("Workspace").Casino.LaserCarousel.InnerModel:GetChildren()) do
        if v:FindFirstChild("TouchInterest") then
            v.Color = Color3.fromRGB(0, 255, 0)
            v.TouchInterest:Destroy()
        end
    end
    
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
    
    for _,v in ipairs(game:GetService("Workspace").Casino.CamerasMoving:GetChildren()) do
        if v.InnerModel.Part:FindFirstChild("TouchInterest") then
            v.InnerModel.Part.Color = Color3.fromRGB(31, 128, 29)
            v.InnerModel.Shadow.Color = Color3.fromRGB(0, 255, 0)
            v.InnerModel.Part.TouchInterest:Destroy()
        end
    end
end


-- Remove Doors
function RemoveDoorsFunction()
    for _,v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "Cell" then
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
