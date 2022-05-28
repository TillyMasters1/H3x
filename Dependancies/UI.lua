local library = (...) or {title = "H3x"; description = "Loaded for Lumber Tycoon 2"}

do -- loadup
	if library.title == nil then
		library.title = "H3x ";
	end
	if library.description == nil then
		library.description = "Loaded for Lumber Tycoon 2";
	end
    if library.active == nil then
        library.active = "none";
    end
	do -- Gui Protection
		if game:GetService("CoreGui"):FindFirstChild("RobloxLoadingGui") == nil then
			local numguis = 0
			local guis = {}
			local blacklistedGuis = {"RobloxGui"}
			for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
				if table.find(blacklistedGuis,v.Name) then return
				else
					numguis = numguis + 1;
					guis.insert(v)
				end
			end
			if numguis == 0 then
				local numrguis = 0
				local rguis = {}
				for i,v in pairs(game:GetService("Players").PlayerGui:GetChildren()) do
					numrguis = numguis + 1;
					rguis.insert(v);
				end
				library.base = rguis[math.random(1,numrguis)]
			else
				library.base = guis[math.random(1,numguis)]
			end
		else
			library.base = game:GetService("CoreGui"):WaitForChild("RobloxLoadingGui")
		end
		library.base.ResetOnSpawn = false;
		library.base.IgnoreGuiInset = true;
		if syn then syn.protect_gui(library.base) end;
	end
	function tween(obj,ti,prop)
		local twe = game:GetService("TweenService"):Create(obj,TweenInfo.new(ti),prop):Play();
	end
	function library:create(class, properties)
		local inst = Instance.new(class)
		for property, value in pairs(properties) do
			inst[property] = value
		end
		return inst
	end
	function library:ripple(object)
		spawn(function()
			local Ripple = Instance.new("ImageLabel")
			local TweenService = game:GetService("TweenService")
			Ripple.Name = "Ripple"
			Ripple.Parent = object
			object.ClipsDescendants = true;
			Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Ripple.BackgroundTransparency = 1.000
			Ripple.ZIndex = 8
			Ripple.AnchorPoint = Vector2.new(0.5,0.5)
			Ripple.Image = "rbxassetid://2708891598"
			Ripple.ImageTransparency = 0.800
			Ripple.ScaleType = Enum.ScaleType.Fit

			Ripple.Position = UDim2.new(0.5,0,0.5,0)
			TweenService:Create(Ripple, TweenInfo.new(1), {Size = UDim2.new(12, 0, 12, 0)}):Play()

			wait(0.5)
			TweenService:Create(Ripple, TweenInfo.new(1), {ImageTransparency = 1}):Play()

			wait(1)
			Ripple:Destroy()
		end)
	end
	library.Holder = library:create("Frame",{
		Name = "Holder";
		Parent = library.base;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Position = UDim2.new(0, 91, 0, 94);
		Size = UDim2.new(0, 1093, 0, 626)
	})

	library.Settings = library:create("Frame",{
		Name = "Settings";
		Parent = library.Holder;
		BackgroundColor3 = Color3.fromRGB(40, 40, 40);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		ClipsDescendants = true;
		Position = UDim2.new(0, 275, 0, 0);
		Size = UDim2.new(0, 816, 0, 623)
	})

	library.SideBar = library:create("Frame",{
		Name = "Side Bar";
		Parent = library.Holder;
		BackgroundColor3 = Color3.fromRGB(39, 39, 39);
		BackgroundTransparency = 1.000;
		Size = UDim2.new(0, 275, 0, 623);
	})

	library.Border = library:create("ImageButton",{
		Name = "Border";
		Parent = library.Holder;
		Active = false;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Position = UDim2.new(0, -1, 0, -1);
		Selectable = false;
		Size = UDim2.new(0, 1093, 0, 625);
		ZIndex = -1;
		AutoButtonColor = false;
		Image = "rbxassetid://2790382281";
		ImageColor3 = Color3.fromRGB(74, 74, 74);
		ScaleType = Enum.ScaleType.Slice;
		SliceCenter = Rect.new(4, 4, 252, 252)
	})

	library.BG = library:create("ImageButton",{
		Name = "Frame";
		Parent = library.Holder;
		Active = false;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Selectable = false;
		Size = UDim2.new(0, 1091, 0, 623);
		ZIndex = 0;
		Image = "rbxassetid://2790382281";
		ImageColor3 = Color3.fromRGB(35, 35, 35);
		ScaleType = Enum.ScaleType.Slice;
		SliceCenter = Rect.new(4, 4, 252, 252)
	})

	library.Search = library:create("Frame",{
		Name = "Search";
		Parent = library.SideBar;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Position = UDim2.new(0, 0, 0.144462273, 0);
		Size = UDim2.new(0, 259, 0, 31)
	})

	library.SearchF1 = library:create("ImageButton",{
		Name = "Frame";
		Parent = library.Search;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Position = UDim2.new(0.0390000008, 0, 0.125, 0);
		Size = UDim2.new(1, -2, 1, 0);
		Image = "rbxassetid://2790382281";
		ImageColor3 = Color3.fromRGB(74, 74, 74);
		ScaleType = Enum.ScaleType.Slice;
		SliceCenter = Rect.new(4, 4, 252, 252)
	})

	library.SearchF2 = library:create("ImageButton",{
		Name = "Frame";
		Parent = library.Search;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Position = UDim2.new(0.0392345302, 0, 0.0874089897, 0);
		Size = UDim2.new(1, -2, 1, -1);
		Image = "rbxassetid://2790382281";
		ImageColor3 = Color3.fromRGB(43, 43, 43);
		ScaleType = Enum.ScaleType.Slice;
		SliceCenter = Rect.new(4, 4, 252, 252)
	})

	library.SearchTxt = library:create("TextBox",{
		Parent = library.Search;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Position = UDim2.new(0.0658880398, 0, 0.100000195, 0);
		Size = UDim2.new(0, 232, 0, 31);
		Font = Enum.Font.ArialBold;
		PlaceholderText = "Find a setting";
	        Text = "Find a setting";
		TextColor3 = Color3.fromRGB(185, 185, 185);
		TextSize = 14.000;
		TextXAlignment = Enum.TextXAlignment.Left
	})

	library.SearchIco = library:create("ImageButton",{
		Name = "search";
		Parent = library.Search;
		BackgroundTransparency = 1.000;
		LayoutOrder = 6;
		Position = UDim2.new(0.930501938, 0, 0.317073166, 0);
		Rotation = 90.000;
		Size = UDim2.new(0, 20, 0, 20);
		ZIndex = 2;
		Image = "rbxassetid://3926305904";
		ImageColor3 = Color3.fromRGB(206, 206, 206);
		ImageRectOffset = Vector2.new(964, 324);
		ImageRectSize = Vector2.new(36, 36)
	})

	library.SettingsList = library:create("Frame",{
		Name = "Settings";
		Parent = library.SideBar;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0.0315125212, 2, 0.217000023, 0);
		Size = UDim2.new(0, 257, 0, 488)
	})

	library.Character = library:create("Frame",{
		Name = "Character";
		Parent = library.SideBar;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Size = UDim2.new(0, 259, 0, 91)
	})
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local content, isReady = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	library.AccImage = library:create("ImageLabel",{
		Name = "Selected: account_circle";
		Parent = library.Character;
		BackgroundColor3 = Color3.fromRGB(35, 35, 35);
		Position = UDim2.new(0.0386100374, 0, 0.109987423, 0);
		Size = UDim2.new(0, 70, 0, 70);
		ZIndex = 2;
		Image = content
	})
	
	library.AccCircle = library:create("UICorner",{
		CornerRadius = UDim.new(0, 100);
		Parent = library.AccImage
	})
	
	library.AccImageOutLine = library:create("Frame",{
		Name = "Selected: account_circle";
		Parent = library.Character;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Position = UDim2.new(0.0350000001, 0, 0.100000001, 0);
		Size = UDim2.new(0, 72, 0, 72);
	})
	
	library.AccCircleOutLine = library:create("UICorner",{
		CornerRadius = UDim.new(0, 100);
		Parent = library.AccImageOutLine
	})

	library.GuiTitle = library:create("TextLabel",{
		Name = "Title";
		Parent = library.Character;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0.336779714, 0, 0.220521033, 0);
		Size = UDim2.new(0, 187, 0, 20);
		Font = Enum.Font.ArialBold;
		Text = library.title;
		TextColor3 = Color3.fromRGB(255, 255, 255);
		TextSize = 24.000;
		TextXAlignment = Enum.TextXAlignment.Left
	})

	library.GuiDescription = library:create("TextButton",{
		Name = "Description";
		Parent = library.Character;
		Active = false;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0, 87, 0, 45);
		Selectable = false;
		Size = UDim2.new(0, 181, 0, 35);
		Font = Enum.Font.ArialBold;
		Text = library.description;
		TextColor3 = Color3.fromRGB(216, 216, 216);
		TextSize = 14.000;
		TextXAlignment = Enum.TextXAlignment.Left;
		TextYAlignment = Enum.TextYAlignment.Top
	})


    if not isfolder("H3x") then makefolder("H3x") end
    if not isfolder("H3x/Modules") then makefolder("H3x/Modules") end
    if not isfolder("H3x/Config") then makefolder("H3x/Config") end
    if not isfile("H3x/Config/UISettings.txt") then writefile("H3x/Config/UISettings.txt", "P") end
    key = (readfile("H3x/Config/UISettings.txt"))

	local toggle = true
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode[key] then
            if game:GetService("UserInputService"):GetFocusedTextBox() == nil then
                if toggle == false then
                    toggle = true
                    library.Holder.Visible = true;
                else
                    toggle = false
    				library.Holder.Visible = false;
                end
            end
        end
    end)

	spawn(function()
		while wait() do
			local finish = "discord.gg/mxbqfEjKSP"
			for i = 1, #finish do
				library.GuiDescription.Text = library.description.."\n"..string.sub(finish, 1, i)
				wait(0.1) --This is the speed of the text
			end
			wait(3)
		end
	end)

	local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
	local inputService = game:GetService('UserInputService');
	local heartbeat    = game:GetService("RunService").Heartbeat;
	-- // credits to Ririchi / Inori for this cute drag function :)
		local s, event = pcall(function()
			return library.Holder.MouseEnter
		end)

		if s then
			library.Holder.Active = true;

			event:connect(function()
			local input = library.Holder.InputBegan:connect(function(key)
					if key.UserInputType == Enum.UserInputType.MouseButton1 then
					local objectPosition = Vector2.new(mouse.X - library.Holder.AbsolutePosition.X, mouse.Y - library.Holder.AbsolutePosition.Y);
						while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							pcall(function()
							library.Holder:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X, 0, mouse.Y - objectPosition.Y + game:GetService("GuiService"):GetGuiInset().Y), 'Out', 'Linear', 0.1, true);
							end)
						end
					end
				end)

				local leave;
			leave = library.Holder.MouseLeave:connect(function()
					input:disconnect();
					leave:disconnect();
				end)
			end)
		end
end

function library:Tab(name,image,IRO,IRS)
    IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
    IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
    image = image or "rbxassetid://3926305904";

	local Window = {};

	Window.Holder = library:create("Frame",{
		Name = name;
		Parent = library.Settings;
		BackgroundColor3 = Color3.fromRGB(40, 40, 40);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Visible = false;
		Position = UDim2.new(0, 0, 0, 0);
		Size = UDim2.new(1, 0, 1, 0);
		ZIndex = 2
	})

	Window.SubCatagories = library:create("Frame",{
		Name = "SubCatagories";
		Parent = Window.Holder;
		BackgroundColor3 = Color3.fromRGB(35, 35, 35);
		BackgroundTransparency = 1.000;
		BorderColor3 = Color3.fromRGB(27, 42, 53);
		BorderSizePixel = 0;
		Size = UDim2.new(1, 0, 1, 0);
		ZIndex = 2
	})

	Window.SubTitle = library:create("TextButton",{
		Name = "SubTitle";
		Parent = Window.SubCatagories;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0.129430577, 0, 0.0340000018, 0);
		Size = UDim2.new(0, 682, 0, 44);
		Visible = false;
		Font = Enum.Font.ArialBold;
		Text = "> ";
		TextColor3 = Color3.fromRGB(203, 203, 203);
		TextSize = 20.000;
		TextXAlignment = Enum.TextXAlignment.Left
	})

	Window.Container = library:create("ScrollingFrame",{
		Name = "Container";
		Parent = Window.Holder;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0.0240384266, 0, 0.105030529, 0);
		Selectable = false;
		Size = UDim2.new(1, -20, 0.898000002, 0);
		ScrollBarThickness = 0
	})

	Window.ContainerList = library:create("UIListLayout",{
		Parent = Window.Container;
		SortOrder = Enum.SortOrder.LayoutOrder;
		Padding = UDim.new(0, 5);
	})

	Window.Title = library:create("TextButton",{
		Name = "Title";
		Parent = Window.Holder;
		Active = false;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0.0240384266, 0, 0.0337078646, 0);
		Selectable = false;
		Size = UDim2.new(0, 138, 0, 44);
		Font = Enum.Font.ArialBold;
		Text = name;
		TextColor3 = Color3.fromRGB(255, 255, 255);
		TextSize = 24.000;
		TextXAlignment = Enum.TextXAlignment.Left
	})

	Window.SideTabList = library:create("UIListLayout",{
		Parent = library.SettingsList;
		HorizontalAlignment = Enum.HorizontalAlignment.Right;
		SortOrder = Enum.SortOrder.LayoutOrder;
		Padding = UDim.new(0, 4)
	})

	Window.SideTab = library:create("ImageButton",{
		Name = name;
		Parent = library.SettingsList;
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Size = UDim2.new(1, 0, 0, 35);
		Image = "rbxassetid://2790382281";
		ImageColor3 = Color3.fromRGB(35, 35, 35);
		ScaleType = Enum.ScaleType.Slice;
		SliceCenter = Rect.new(4, 4, 252, 252)
	})

	Window.SideTabName = library:create("TextLabel",{
		Name = "Name";
		Parent = Window.SideTab;
		AnchorPoint = Vector2.new(0, 0.5);
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0.180583671, 0, 0.5, 0);
		Size = UDim2.new(0, 210, 0, 23);
		Font = Enum.Font.SourceSansBold;
		Text = name;
		TextColor3 = Color3.fromRGB(255, 255, 255);
		TextSize = 16.000;
		TextStrokeTransparency = 0.300;
		TextXAlignment = Enum.TextXAlignment.Left
	})

	Window.SideTabSide = library:create("ImageLabel",{
		Name = "Side";
		Parent = Window.SideTab;
		Active = true;
		AnchorPoint = Vector2.new(0, 0.5);
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		Position = UDim2.new(0, 0, 0.5, 0);
		Selectable = true;
		Size = UDim2.new(0, 4, 0.5, 0);
		Visible = false;
		Image = "rbxassetid://2790382281";
		ImageColor3 = Color3.fromRGB(107, 153, 182);
		ScaleType = Enum.ScaleType.Slice;
		SliceCenter = Rect.new(4, 4, 252, 252)
	})

	Window.SideTabImg = library:create("ImageLabel",{
		Name = "Img";
		Parent = Window.SideTab;
		Active = true;
		AnchorPoint = Vector2.new(0, 0.5);
		BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		BackgroundTransparency = 1.000;
		BorderSizePixel = 0;
		Position = UDim2.new(0, 13, 0, 16);
		Selectable = true;
		Size = UDim2.new(0, 20, 0, 20);
		Image = image;
		ImageRectOffset = IRO;
		ImageRectSize = IRS;
		ScaleType = Enum.ScaleType.Fit
	})

	local held = false;
	Window.SideTab.MouseButton1Down:Connect(function()
		held = true;
		tween(Window.SideTab,0.2,{ImageColor3 = Color3.fromRGB(170,170,170)})
	end)
	Window.SideTab.MouseButton1Up:Connect(function()
		if held then
			library.active = name
			if Window.SideTabSide.Visible == true then
			else
				Window.SideTabSide.Visible = true;
				tween(Window.SideTab,0.2,{ImageColor3 = Color3.fromRGB(45, 45, 45)});
				tween(Window.Holder,0.3,{Position=UDim2.new(0,0,-1.25,0)});
				for herp,ies in pairs(library.SettingsList:GetChildren()) do
					if ies:IsA("ImageButton") and ies.Name ~= name then
						ies.Side.Visible = false;
						ies.ImageColor3 = Color3.fromRGB(35, 35, 35);
					end
				end
				for i,v in pairs(library.Settings:GetChildren()) do
					if v ~= Window.Holder then
						v.Visible = false;
						for i,cat in pairs(v["SubCatagories"]:GetChildren()) do
							if cat:IsA("ScrollingFrame") then
								cat.Visible = false;
							end
						end
						v["Container"].Visible = true;
						v["SubCatagories"]["SubTitle"].Visible = false;
						v["Title"].TextColor3 = Color3.fromRGB(255, 255, 255);
					else
						v.Visible = true;
					end
				end
				wait(0.3);
				tween(Window.Holder,0.3,{Position=UDim2.new(0,0,0,0)});
			end
		end
	end)
	Window.SideTab.MouseEnter:Connect(function()
		tween(Window.SideTab,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
	end)
	Window.SideTab.MouseLeave:Connect(function()
		held = false;
		if Window.SideTabSide.Visible == true then
			tween(Window.SideTab,0.2,{ImageColor3 = Color3.fromRGB(45, 45, 45)});
		else
			tween(Window.SideTab,0.2,{ImageColor3 = Color3.fromRGB(35, 35, 35)});
		end
	end)

	function Window:Button(name,description,image,clicktext,IRO,IRS,callback)
		IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
		image = image or "rbxassetid://3926305904";
		callback = callback or function() end;

		local button = {};

		button.Main = library:create("ImageButton",{
			Name = "Button";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 0, 1, 1);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		button.Press = library:create("ImageButton",{
			Name = "Press";
			Parent = button.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.79400003, 0, 0.5, 0);
			Size = UDim2.new(0.170000002, 0, 0, 30);
			ZIndex = 2;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		button.PressOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = button.Press;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		button.PressText = library:create("TextLabel",{
			Name = "BTNText";
			Parent = button.Press;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 3;
			Font = Enum.Font.ArialBold;
			Text = clicktext;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 16.000
		})

		button.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = button.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
			Size = UDim2.new(0, 591, 0, 20);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		button.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = button.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
			Size = UDim2.new(0, 710, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		button.Image = library:create("ImageLabel",{
			Name = "img";
			Parent = button.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = IRO;
			ImageRectSize = IRS
		})

		local held = false;
		button.Main.MouseButton1Down:Connect(function()
			held = true;
			tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
		end)
		button.Main.MouseButton1Up:Connect(function()
			if held then
				tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				library:ripple(button.PressOutline)
				callback()
			end
		end)
		button.Main.MouseEnter:Connect(function()
			tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
		end)
		button.Main.MouseLeave:Connect(function()
			held = false;
			tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
		end)

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y + 10);

		return button;
	end

	function Window:Switch(name,description,image,default,IRO,IRS,callback)
        IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
		image = image or "rbxassetid://3926305904";
		default = default or false;
		callback = callback or function() end;

		local switch = {value = default}

		switch.Main = library:create("ImageButton",{
			Name = "Switch";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 0, 1, 1);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		switch.Click = library:create("ImageButton",{
			Name = "Switchy";
			Parent = switch.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 715, 0.5, 0);
			Size = UDim2.new(0, 45, 0, 20);
			ZIndex = 2;
			Image = "rbxassetid://3570695787";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(100, 100, 100, 100);
			SliceScale = 0.120
		})

		switch.ClickOut = library:create("ImageButton",{
			Name = "Outline";
			Parent = switch.Click;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			BorderSizePixel = 0;
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://3570695787";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(100, 100, 100, 100);
			SliceScale = 0.120
		})

		switch.ClickCircle = library:create("ImageButton",{
			Name = "Circle";
			Parent = switch.Click;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			BorderSizePixel = 0;
			Position = UDim2.new(0.0700000003, 0, 0.504000008, 0);
			Size = UDim2.new(0, 15, 0, 15);
			ZIndex = 3;
			Image = "rbxassetid://3570695787";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(100, 100, 100, 100);
			SliceScale = 0.120
		})

		switch.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = switch.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 39);
			Size = UDim2.new(0, 591, 0, 20);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		switch.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = switch.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 4);
			Size = UDim2.new(0, 710, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		switch.Image = library:create("ImageLabel",{
			Name = "img";
			Parent = switch.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = IRO;
			ImageRectSize = IRS
		})

		switch.SwitchText = library:create("TextLabel",{
			Name = "SwitchText";
			Parent = switch.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 599, 0, 19);
			Size = UDim2.new(0, 184, 0, 26);
			ZIndex = 3;
			Font = Enum.Font.ArialBold;
			Text = "Off";
			TextColor3 = Color3.fromRGB(170, 170, 170);
			TextSize = 16.000
		})

		function switch:Set(state)
			if state == false then
				tween(switch.Click,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				tween(switch.ClickCircle,0.3,{ImageColor3 = Color3.fromRGB(170, 170, 170), Position = UDim2.new(0.07, 0,0.5, 0)});
				switch.SwitchText.Text = "Off";
			else
				tween(switch.Click,0.3,{ImageColor3 = Color3.fromRGB(170, 170, 170)});
				tween(switch.ClickCircle,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43), Position = UDim2.new(0.6, 0,0.5, 0)});
				switch.SwitchText.Text = "On";
			end
			callback(state);
			switch.value = state
		end

		switch:Set(switch.value)

		local held = false;
		switch.Main.MouseButton1Down:Connect(function()
			held = true;
			tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
		end)
		switch.Main.MouseButton1Up:Connect(function()
			if held then
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				switch:Set(not switch.value)
			end
		end)
		switch.Click.MouseButton1Down:Connect(function()
			held = true;
			tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
		end)
		switch.Click.MouseButton1Up:Connect(function()
			if held then
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				switch:Set(not switch.value)
			end
		end)
		switch.ClickCircle.MouseButton1Down:Connect(function()
			held = true;
			tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
		end)
		switch.ClickCircle.MouseButton1Up:Connect(function()
			if held then
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				switch:Set(not switch.value)
			end
		end)
		switch.Main.MouseEnter:Connect(function()
			tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
		end)
		switch.Main.MouseLeave:Connect(function()
			held = false;
			tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
		end)

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return switch;
	end

	function Window:Box(name,description,image,default,callback)
		image = image or "rbxassetid://3926305904";
		default = default or "Text";
		callback = callback or function() end;

		local box = {};

		box.Main = library:create("ImageButton",{
			Name = "Box";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0.0239664223, 0, 0.138730273, 0);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		box.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = box.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		box.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = box.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		box.Image = library:create("ImageLabel",{
			Name = "img";
			Parent = box.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = "rbxassetid://3926305904";
			ImageRectOffset = Vector2.new(124, 484);
			ImageRectSize = Vector2.new(36, 36)
		})

		box.Press = library:create("ImageButton",{
			Name = "Press";
			Parent = box.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 760, 0.5, 0);
			Size = UDim2.new(0, -90, 0, 30);
			ZIndex = 2;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		box.PressOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = box.Press;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		box.PressText = library:create("TextBox",{
			Name = "BTNText";
			Parent = box.Press;
			Active = false;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 4;
			Font = Enum.Font.ArialBold;
			Text = default;
			ClipsDescendants = true;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 16.000
		})

		function box:Set(text)
			box.PressText.Text = text;
			box.Press.Size = UDim2.new(0,-box.PressText.TextBounds.X-8,0,30);
			callback(text)
		end

		box:Set(default)

		local UserInputService = game:GetService("UserInputService");
		local holding = false;

		box.PressText:GetPropertyChangedSignal("Text"):connect(function()
			if -box.PressText.TextBounds.X-8 > -323 then
				box.Press.Size = UDim2.new(0,-box.PressText.TextBounds.X-8,0,30)
			else
				box.Press.Size = UDim2.new(0,-315,0,30)
			end
		end)

		box.Main.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				box.PressText:CaptureFocus();
			end
		end)

		box.Press.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				box.PressText:CaptureFocus();
			end
		end)

		UserInputService.InputEnded:connect(function(input)
			if input.KeyCode.Name == "Enter" then
				box.PressText:ReleaseFocus();
				callback(box.PressText.Text)
			end
		end)

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return box;
	end

	function Window:Bind(name,description,image,default,IRO,IRS,callback)
        	IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
		image = image or "rbxassetid://3926305904";
		default = default or Enum.KeyCode.Period;
		callback = callback or function() end;

		local bind = {binding = false; value = default};

		bind.Main = library:create("ImageButton",{
			Name = "Bind";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0.0239664223, 0, 0.138730273, 0);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		bind.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = bind.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		bind.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = bind.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		bind.Image = library:create("ImageLabel",{
			Name = "img";
			Parent = bind.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = IRO;
			ImageRectSize = IRS
		})

		bind.Press = library:create("ImageButton",{
			Name = "Press";
			Parent = bind.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 760, 0, 32);
			Size = UDim2.new(0, -75, 0, 30);
			ZIndex = 2;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		bind.PressOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = bind.Press;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		bind.BindText = library:create("TextLabel",{
			Name = "BTNText";
			Parent = bind.Press;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 3;
			Font = Enum.Font.ArialBold;
			Text = default.Name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 16.000
		})

		function bind:Set(key)
			if not key then
				bind.value = nil
				bind.BindText.Text = tostring("[ ".."None".." ]")
				bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
			else
				if key.Name:sub(1,11) == "MouseButton" then
					bind.BindText.Text = tostring("[ ".."MB"..key.Name:sub(12).." ]")
				else
					bind.BindText.Text = tostring("[ "..key.Name.." ]")
				end
				bind.value = key
				bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
				callback(bind.value)
			end
		end

		bind:Set(default)

		local UserInputService = game:GetService("UserInputService");

		bind.binding = false;
		local holding = false;
		local bindname = "";

		bind.Main.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				bind.BindText.Text = "..."
				bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
			end
		end)

		bind.Main.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if bind.value ~= nil then
					bind:Set(nil)
				else
					bind.binding = true
				end
			end
		end)

		bind.Press.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				bind.BindText.Text = "..."
				bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
			end
		end)

		bind.Press.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if bind.value ~= nil then
					bind:Set(nil)
				else
					bind.binding = true
				end
			end
		end)

		local a = tick()

		UserInputService.InputBegan:connect(function(input)
			if bind.binding then
				if table.find({Enum.KeyCode.Backspace, Enum.KeyCode.Escape}, input.KeyCode) then
					bind:Set(nil)
					bind.binding = false
				elseif input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
					bind:Set(input.KeyCode)
					bind.binding = false
				elseif input.UserInputType and table.find({Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}, input.UserInputType) then
					bind:Set(input.UserInputType)
					bind.binding = false
				end
			elseif input.KeyCode == bind.value or input.UserInputType == bind.value then
				callback(true)
			end
		end)

		UserInputService.InputEnded:connect(function(input)
			if input.KeyCode.Name == bindname then
				holding = false
			end
			if input.UserInputType.Name == bindname then
				holding = false
			end
			if not bind.binding and input.KeyCode == bind.value or input.UserInputType == bind.value then
				callback(false)
			end
		end)

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return bind;
	end

	function Window:Slider(name,description,image,min,default,max,IRO,IRS,callback)
        IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
		image = image or "rbxassetid://3926305904";
		min = min or 0;
		default = default or 50;
		max = max or 100;
		callback = callback or function() end;

		local slider = {value = default};

		slider.Main = library:create("ImageButton",{
			Name = "Slider";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0.0239664223, 0, 0.138730273, 0);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		slider.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = slider.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		slider.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = slider.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		slider.Image = library:create("ImageLabel",{
			Name = "img";
			Parent = slider.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = IRO;
			ImageRectSize = IRS
		})

		slider.Bar = library:create("ImageButton",{
			Name = "Bar";
			Parent = slider.Main;
			BackgroundColor3 = Color3.fromRGB(35, 35, 35);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0.640720844, 0, 0.46929884, 0);
			Size = UDim2.new(0, 248, 0, 4);
			Image = "rbxassetid://2790371148";
			ImageColor3 = Color3.fromRGB(165, 165, 165);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(32, 32, 224, 224)
		})

		slider.Fill = library:create("Frame",{
			Name = "sliderfill";
			Parent = slider.Bar;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Size = UDim2.new(1, 0, 1, 0)
		})

		slider.Dot = library:create("Frame",{
			Name = "Dot";
			Parent = slider.Fill;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(1, -10, 0.5, 0);
			Size = UDim2.new(0, 20, 0, 20)
		})

		slider.Inner = library:create("ImageButton",{
			Name = "Inner";
			Parent = slider.Dot;
			BackgroundColor3 = Color3.fromRGB(35, 35, 35);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 5, 0, 5);
			Size = UDim2.new(0, 10, 0, 10);
			ZIndex = 2;
			Image = "rbxassetid://2790371148";
			ImageColor3 = Color3.fromRGB(165, 165, 165);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(32, 32, 224, 224)
		})

		slider.Outer = library:create("ImageButton",{
			Name = "Outer";
			Parent = slider.Dot;
			BackgroundColor3 = Color3.fromRGB(35, 35, 35);
			BackgroundTransparency = 1.000;
			Size = UDim2.new(0, 20, 0, 20);
			Image = "rbxassetid://2790371148";
			ImageColor3 = Color3.fromRGB(98, 98, 98);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(32, 32, 224, 224)
		})

		slider.TextValue = library:create("TextBox",{
			Name = "Number Value";
			Parent = slider.Main;
			Active = false;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0.563451767, 0, 0.119402982, 0);
			Selectable = false;
			Size = UDim2.new(0, 60, 0, 50);
			Font = Enum.Font.SourceSansBold;
			Text = tostring(default);
			TextColor3 = Color3.fromRGB(171, 171, 171);
			TextSize = 20.000
		})

		local function round(num, bracket)
			bracket = bracket or 1
			return math.floor(num/bracket + math.sign(num) * 0.5) * bracket
		end
		local value = default;

		local UserInputService = game:GetService("UserInputService");

		local function updateValue()
			value = round(value*max, 1) -- float)
			if value > max then
				value = max
			end
			if value < min then
				value = min
			end
			slider.Dot.Position = UDim2.new(1- math.clamp((max-value)/(max-min),0, 0.99),-10,0.5,0)
			slider.TextValue.Text = value
			callback(value)
		end

		local function updateSlider(input)
			local relativePos = input.Position.X- slider.Bar.AbsolutePosition.X
			if input.Position.X < slider.Bar.AbsolutePosition.X then
				relativePos = 0
			end
			if relativePos > slider.Bar.AbsoluteSize.X then
				relativePos = slider.Bar.AbsoluteSize.X
			end
			value = relativePos/slider.Bar.AbsoluteSize.X
			updateValue()
		end

		local sliding = false;
		local modifying = false;

		slider.Bar.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = true
				updateSlider(input)
			end
		end)
		slider.Inner.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = true
				updateSlider(input)
			end
		end)
		slider.Outer.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = true
				updateSlider(input)
			end
		end)
		slider.Main.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = true
				updateSlider(input)
			end
		end)

		slider.Main.MouseEnter:Connect(function()
			tween(slider.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
		end)
		slider.Main.MouseLeave:Connect(function()
			tween(slider.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
		end)

		slider.TextValue.FocusLost:connect(function()
			value = (tonumber(slider.TextValue.Text) or 0) / max
			updateValue()
			callback(value)
		end)

		slider.Bar.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = false
				callback(value)
			end
		end)
		slider.Inner.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = false
				callback(value)
			end
		end)
		slider.Outer.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = false
				callback(value)
			end
		end)
		slider.Main.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				sliding = false
				callback(value)
			end
		end)

		UserInputService.InputChanged:connect(function(input)
			if modifying then
				if input == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Space then
					slider.TextValue:ReleaseFocus()
				end
			end
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				if sliding then
					updateSlider(input)
				end
			end
		end)

		function slider:Set(num)
			value = num/max
			updateValue()
		end

		slider:Set(default)

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return slider;
	end

	function Window:Text(text)

		local txt = {}

		txt.Main = library:create("TextLabel",{
			Name = "Text";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.70247072, 0);
			Size = UDim2.new(0, 788, 0, 24);
			Font = Enum.Font.ArialBold;
			Text = text;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000
		})

		function txt:Set(val)
			txt.Main.Text = val;
		end

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return txt;

	end

	function Window:Dropdown(name,description,image,default,list,callback)
		image = image or "rbxassetid://3926305904";
		list = list  or {"List","Not","Set"};
		default = default or list[1];
		callback = callback or function() end;

		local dropdown = {};

		dropdown.Main = library:create("ImageButton",{
			Name = "DropDown";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 0, 1, 1);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		dropdown.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = dropdown.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 4);
			Size = UDim2.new(0, 710, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		dropdown.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = dropdown.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 39);
			Size = UDim2.new(0, 591, 0, 20);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		dropdown.Image = library:create("ImageLabel",{
			Name = "img";
			Parent = dropdown.Drop;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0, 16, 0, 16);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = Vector2.new(124, 484);
			ImageRectSize = Vector2.new(36, 36)
		})

		dropdown.Drop = library:create("ImageButton",{
			Name = "Drop";
			Parent = dropdown.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 508, 0.5, 0);
			Size = UDim2.new(0, 250, 0, 30);
			ZIndex = 2;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(55, 55, 55);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		dropdown.DropOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = dropdown.Drop;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(58, 58, 58);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		dropdown.DropText = library:create("TextLabel",{
			Name = "DropText";
			Parent = dropdown.Drop;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0.0447894856, 0, 0, 0);
			Size = UDim2.new(0.955210507, 0, 1, 0);
			ZIndex = 3;
			Font = Enum.Font.ArialBold;
			Text = default;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 16.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		dropdown.DropIco = library:create("ImageButton",{
			Name = "dropIco";
			Parent = dropdown.Drop;
			Active = false;
			BackgroundTransparency = 1.000;
			Position = UDim2.new(1, -25, 0.16, 0);
			Size = UDim2.new(0, 20, 0, 20);
			ZIndex = 2;
			Image = "rbxassetid://3926305904";
			ImageColor3 = Color3.fromRGB(184, 184, 184);
			ImageRectOffset = Vector2.new(564, 284);
			ImageRectSize = Vector2.new(36, 36)
		})

		dropdown.Dropping = library:create("ImageLabel",{
			Name = "Dropping";
			Parent = dropdown.Drop;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 1, 0);
			Size = UDim2.new(1, 0, 0, 0);
			ZIndex = 4;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(55, 55, 55);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		dropdown.DroppingOutline = library:create("ImageLabel",{
			Name = "Outline";
			Parent = dropdown.Dropping;
			Active = true;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Selectable = true;
			Size = UDim2.new(1, 2, 1, 2);
			ZIndex = 3;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(58, 58, 58);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		dropdown.List = library:create("ScrollingFrame",{
			Name = "List";
			Parent = dropdown.Dropping;
			Active = true;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Size = UDim2.new(1, 0, 1, 0);
			CanvasSize = UDim2.new(1,0,1,0);
			ZIndex = 3;
			ScrollBarThickness = 0;
		})

		dropdown.DroppingList = library:create("UIListLayout",{
			Parent = dropdown.List;
			HorizontalAlignment = Enum.HorizontalAlignment.Center;
			SortOrder = Enum.SortOrder.LayoutOrder;
			Padding = UDim.new(0, 4)
		})

		dropdown.DroppingPadding = library:create("UIPadding",{
			Parent = dropdown.List;
			PaddingTop = UDim.new(0, 2)
		})

		function dropdown:Set(value)
			dropdown.DropText.Text = value
			callback(value)
			local Side = Instance.new("ImageLabel")
			dropdown.List[value].ImageColor3 = Color3.fromRGB(85,85,85)
			Side.Name = "Side"
			Side.Parent = dropdown.List[value]
			Side.Active = true
			Side.AnchorPoint = Vector2.new(0, 0.5)
			Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Side.BackgroundTransparency = 1.000
			Side.Position = UDim2.new(0, 0, 0.5, 0)
			Side.Selectable = true
			Side.ZIndex = 5
			Side.Size = UDim2.new(0, 4, 0.5, 0)
			Side.Image = "rbxassetid://2790382281"
			Side.ImageColor3 = Color3.fromRGB(164, 163, 159)
			Side.ScaleType = Enum.ScaleType.Slice
			Side.SliceCenter = Rect.new(4, 4, 252, 252)
		end

		function dropdown:refresh(tbl)
			for i,v in pairs(dropdown.List:GetChildren()) do
				if v:IsA("ImageButton") then
					v:Destroy();
				end
			end
			for i,v in pairs(tbl) do
				local Press = Instance.new("ImageButton")
				local BTNText = Instance.new("TextLabel")

				Press.Name = v
				Press.Parent = dropdown.List
				Press.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Press.BackgroundTransparency = 1.000
				Press.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Press.Size = UDim2.new(1, -4, 0, 25)
				Press.ZIndex = 5
				Press.Image = "rbxassetid://2790382281"
				Press.ImageColor3 = Color3.fromRGB(55, 55, 55)
				Press.ScaleType = Enum.ScaleType.Slice
				Press.SliceCenter = Rect.new(4, 4, 252, 252)

				BTNText.Name = "BTNText"
				BTNText.Parent = Press
				BTNText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BTNText.BackgroundTransparency = 1.000
				BTNText.Size = UDim2.new(1, 0, 1, 0)
				BTNText.ZIndex = 5
				BTNText.Font = Enum.Font.ArialBold
				BTNText.Text = v
				BTNText.TextColor3 = Color3.fromRGB(255, 255, 255)
				BTNText.TextSize = 16.000

				if v == default then
					local Side = Instance.new("ImageLabel")
					Press.ImageColor3 = Color3.fromRGB(85,85,85)
					Side.Name = "Side"
					Side.Parent = Press
					Side.Active = true
					Side.AnchorPoint = Vector2.new(0, 0.5)
					Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Side.BackgroundTransparency = 1.000
					Side.Position = UDim2.new(0, 0, 0.5, 0)
					Side.Selectable = true
					Side.ZIndex = 5
					Side.Size = UDim2.new(0, 4, 0.5, 0)
					Side.Image = "rbxassetid://2790382281"
					Side.ImageColor3 = Color3.fromRGB(164, 163, 159)
					Side.ScaleType = Enum.ScaleType.Slice
					Side.SliceCenter = Rect.new(4, 4, 252, 252)
				end

				Press.MouseEnter:Connect(function()
					tween(Press,0.3,{ImageColor3 = Color3.fromRGB(70,70,70)})
				end)

				Press.MouseLeave:Connect(function()
					if v ~= default then
						tween(Press,0.3,{ImageColor3 = Color3.fromRGB(55, 55, 55)})
					end
				end)

				Press.MouseButton1Click:Connect(function()
					library:ripple(Press)
					default = v
					for i,v in pairs(dropdown.List:GetChildren()) do if v:IsA("ImageButton") and v:FindFirstChild("Side") then
							v:FindFirstChild("Side"):Destroy(); v.ImageColor3 = Color3.fromRGB(55,55,55);
					end end
					dropdown:Set(v)
					tween(dropdown.Dropping,0.3,{Size = UDim2.new(1,0,0,0)})
					tween(dropdown.DropIco,0.3,{Rotation=0});
					tween(Press,0.3,{ImageColor3 = Color3.fromRGB(85, 85, 85)})
				end)

			end

			tween(dropdown.Dropping,0.3,{Size = UDim2.new(1,0,0,0)})
		end

		dropdown:refresh(list)

		dropdown.Drop.MouseEnter:Connect(function()
			tween(dropdown.Drop,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
		end)
		dropdown.Drop.MouseLeave:Connect(function()
			tween(dropdown.Drop,0.2,{ImageColor3 = Color3.fromRGB(55, 55, 55)});
		end)
		dropdown.Drop.MouseButton1Click:Connect(function()
			local numents = 0
			for i,v in pairs(dropdown.List:GetChildren()) do
				if v:IsA("ImageButton") then
					numents = numents + 1
				end
			end
			if dropdown.Dropping.Size.Y.Offset == 0 then
				tween(dropdown.DropIco,0.3,{Rotation=-90});
				if numents >= 4 then
					tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 100)})
					tween(dropdown.List,0.3,{CanvasSize=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
				else
					tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
				end
			else
				tween(dropdown.DropIco,0.3,{Rotation=0});
				tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 0)})
			end
		end)

		dropdown.Main.MouseEnter:Connect(function()
			tween(dropdown.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
		end)
		dropdown.Main.MouseLeave:Connect(function()
			tween(dropdown.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
		end)
		dropdown.Main.MouseButton1Click:Connect(function()
			local numents = 0
			for i,v in pairs(dropdown.List:GetChildren()) do
				if v:IsA("ImageButton") then
					numents = numents + 1
				end
			end
			if dropdown.Dropping.Size.Y.Offset == 0 then
				tween(dropdown.DropIco,0.3,{Rotation=-90});
				if numents >= 4 then
					tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 100)})
					tween(dropdown.List,0.3,{CanvasSize=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
				else
					tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
				end
			else
				tween(dropdown.DropIco,0.3,{Rotation=0});
				tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 0)})
			end
		end)

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return dropdown;
	end

	function Window:ColorPicker(name,description,image,default,callback)
		image = image or "rbxassetid://3926305904";
		default = default or Color3.fromRGB(255,0,0);
		callback = callback or function() end;

		local colorpicker = {value = default};

		local function hsv(newr,newg,newb)
			local cmax = math.max(newr,newg,newb)
			local cmin = math.min(newr,newg,newb)
			local diff = cmax - cmin
			--// hue
			local h = 0
			if cmax == 0 and cmin == 0  then
				h = 0
			else
				if cmax == newr then
					h = (60 * ((newg-newb)/diff)+360)%360
				elseif cmax == newg then
					h = (60 * ((newb-newr)/diff)+120)%360
				elseif cmax == newb then
					h = (60 * ((newr-newg)/diff)+240)%360
				end
			end
			--// sat
			local s = 0
			if cmax == 0 then
				s = 0
			else
				s = (diff/cmax)*100
			end
			--// value
			local v = cmax*100
			return h,s,v
		end

		local HexadecimalValues = {
			-- Decimal to Hex
			[10] = "A",
			[11] = "B",
			[12] = "C",
			[13] = "D",
			[14] = "E",
			[15] = "F",
		}

		local function DecimalToHex(decimal)
			local hex = ""
			local integer, remainder

			while true do
				integer = math.modf(decimal / 16)
				remainder = decimal % 16
				decimal = integer

				hex = hex .. (HexadecimalValues[remainder] or remainder)

				if integer == 0 then
					break
				end
			end

			if #hex == 1 then
				return "0" .. hex
			end

			return hex:reverse()
		end

		local function RGBToHex(r, g, b)
			return "#" .. DecimalToHex(r) .. DecimalToHex(g) .. DecimalToHex(b)
		end

		local r = ((colorpicker.value).R)*255
		local g = ((colorpicker.value).G)*255
		local b = ((colorpicker.value).B)*255
		local h,s,v = hsv(r,g,b)
		local hx = RGBToHex(r,g,b)
		colorpicker.Main = library:create("ImageButton",{
			Name = name;
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 0, 0.327104658, 1);
			Size = UDim2.new(0, 788, 0, 214);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Press = library:create("ImageButton",{
			Name = "Press";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 731, 0, 33);
			Size = UDim2.new(0, 30, 0, 30);
			ZIndex = 2;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Outline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.Press;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = colorpicker.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 39);
			Size = UDim2.new(0, 591, 0, 20);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		colorpicker.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = colorpicker.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 4);
			Size = UDim2.new(0, 710, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.Image = library:create("ImageButton",{
			Name = "img";
			Parent = colorpicker.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0, 16, 0, 16);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = Vector2.new(124, 484);
			ImageRectSize = Vector2.new(36, 36)
		})

		colorpicker.B = library:create("TextLabel",{
			Name = "Blue";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 249, 0, 173);
			Selectable = true;
			Size = UDim2.new(0, 171, 0, 45);
			ZIndex = 5;
			Font = Enum.Font.SourceSansSemibold;
			Text = "Blue";
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 19.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.BVal = library:create("ImageButton",{
			Name = "Value";
			Parent = colorpicker.B;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.555555582, 0, 0.137931034, 0);
			Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
			ZIndex = 5;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.BSub = library:create("TextBox",{
			Name = "Sub";
			Parent = colorpicker.BVal;
			Active = false;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.5, 0);
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 6;
			Font = Enum.Font.Arial;
			Text = tostring(r);
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 16.000
		})

		colorpicker.BOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.BVal;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.G = library:create("TextLabel",{
			Name = "Green";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 249, 0, 128);
			Size = UDim2.new(0, 171, 0, 45);
			ZIndex = 5;
			Font = Enum.Font.SourceSansSemibold;
			Text = "Green";
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 19.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.GVal = library:create("ImageButton",{
			Name = "Value";
			Parent = colorpicker.G;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.555555582, 0, 0.137931034, 0);
			Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
			ZIndex = 5;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.GSub = library:create("TextBox",{
			Name = "Sub";
			Parent = colorpicker.GVal;
			Active = false;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.5, 0);
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 6;
			Font = Enum.Font.Arial;
			Text = tostring(g);
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 16.000
		})

		colorpicker.GOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.GVal;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Hex = library:create("TextLabel",{
			Name = "Hex";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 420, 0, 179);
			Selectable = true;
			Size = UDim2.new(0, 108, 0, 29);
			ZIndex = 5;
			Font = Enum.Font.SourceSansSemibold;
			Text = "Hex";
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 19.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.HexVal = library:create("ImageButton",{
			Name = "Value";
			Parent = colorpicker.Hex;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.342592597, 0, 0.137931034, 0);
			Size = UDim2.new(0.601851881, 0, 0.896551728, 0);
			ZIndex = 5;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.HexSub = library:create("TextBox",{
			Name = "Sub";
			Parent = colorpicker.HexVal;
			Active = false;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.5, 0);
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 6;
			Font = Enum.Font.Arial;
			Text = hx;
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 14.000
		})

		colorpicker.HexOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.HexSub;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Hue = library:create("TextLabel",{
			Name = "Hue";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 49, 0, 83);
			Size = UDim2.new(0, 171, 0, 45);
			ZIndex = 5;
			Font = Enum.Font.SourceSansSemibold;
			Text = "Hue";
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 19.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.HueVal = library:create("ImageButton",{
			Name = "Value";
			Parent = colorpicker.Hue;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.481481493, 0, 0.137931034, 0);
			Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
			ZIndex = 5;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.HueSub = library:create("TextBox",{
			Name = "Sub";
			Parent = colorpicker.HueVal;
			Active = false;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.5, 0);
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 6;
			Font = Enum.Font.Arial;
			Text = h;
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 16.000
		})

		colorpicker.HueOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.HueVal;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.R = library:create("TextLabel",{
			Name = "Red";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 249, 0, 83);
			Selectable = true;
			Size = UDim2.new(0, 171, 0, 45);
			ZIndex = 5;
			Font = Enum.Font.SourceSansSemibold;
			Text = "Red";
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 19.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.RVal = library:create("ImageButton",{
			Name = "Value";
			Parent = colorpicker.R;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.555555582, 0, 0.137931034, 0);
			Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
			ZIndex = 5;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.RSub = library:create("TextBox",{
			Name = "Sub";
			Parent = colorpicker.RVal;
			Active = false;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.5, 0);
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 6;
			Font = Enum.Font.Arial;
			Text = r;
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 16.000
		})

		colorpicker.ROutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.RVal;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Sat = library:create("TextLabel",{
			Name = "Sat";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 49, 0, 128);
			Size = UDim2.new(0, 171, 0, 45);
			ZIndex = 5;
			Font = Enum.Font.SourceSansSemibold;
			Text = "Sat";
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 19.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.SatVal = library:create("ImageButton",{
			Name = "Value";
			Parent = colorpicker.Sat;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.481481493, 0, 0.137931034, 0);
			Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
			ZIndex = 5;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.SatSub = library:create("TextBox",{
			Name = "Sub";
			Parent = colorpicker.SatVal;
			Active = false;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.5, 0);
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 6;
			Font = Enum.Font.Arial;
			Text = s;
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 16.000
		})

		colorpicker.SatOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.SatVal;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Value = library:create("TextLabel",{
			Name = "Value";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 49, 0, 173);
			Size = UDim2.new(0, 171, 0, 45);
			ZIndex = 5;
			Font = Enum.Font.SourceSansSemibold;
			Text = "Value";
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 19.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		colorpicker.ValVal = library:create("ImageButton",{
			Name = "Value";
			Parent = colorpicker.Value;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.481481493, 0, 0.137931034, 0);
			Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
			ZIndex = 5;
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.ValSub = library:create("TextBox",{
			Name = "Sub";
			Parent = colorpicker.ValVal;
			Active = false;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 0, 0.5, 0);
			Selectable = false;
			Size = UDim2.new(1, 0, 1, 0);
			ZIndex = 6;
			Font = Enum.Font.Arial;
			Text = v;
			TextColor3 = Color3.fromRGB(152, 152, 152);
			TextSize = 16.000
		})

		colorpicker.ValOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.ValVal;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.Dark = library:create("TextButton",{
			Name = "DarknessBar";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BorderSizePixel = 0;
			ClipsDescendants = true;
			Position = UDim2.new(0, 707, 0, 127);
			Size = UDim2.new(0.0380204059, 0, 0, 137);
			AutoButtonColor = false;
			Font = Enum.Font.SourceSans;
			Text = "";
			TextColor3 = Color3.fromRGB(0, 0, 0);
			TextSize = 14.000
		})

		colorpicker.DarkGrad = library:create("UIGradient",{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(r, g, b)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))};
			Rotation = -90;
			Parent = colorpicker.Dark
		})

		colorpicker.DarkDisplay = library:create("Frame",{
			Name = "Display";
			Parent = colorpicker.Dark;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 0, 0);
			BorderColor3 = Color3.fromRGB(0, 0, 0);
			BorderSizePixel = 2;
			Position = UDim2.new(0.5, 0, v, -1);
			Size = UDim2.new(1, 0, 0, 1)
		})

		colorpicker.Gradient = library:create("ImageButton",{
			Name = "RGB";
			Parent = colorpicker.Main;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BorderColor3 = Color3.fromRGB(40, 40, 40);
			BorderSizePixel = 0;
			Position = UDim2.new(0, 601, 0, 127);
			Size = UDim2.new(0, 135, 0, 135);
			ZIndex = 4;
			Image = "rbxassetid://1433361550";
			SliceCenter = Rect.new(10, 10, 90, 90)
		})

		colorpicker.RGBCursor = library:create("ImageLabel",{
			Name = "Cursor";
			Parent = colorpicker.Gradient;
			BackgroundColor3 = Color3.fromRGB(157, 55, 63);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(0, 0, 0);
			BorderSizePixel = 0;
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(0, 4, 0, 4);
			ZIndex = 9;
			Image = "rbxassetid://3570695787";
			ImageColor3 = Color3.fromRGB(157, 55, 63);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(100, 100, 100, 100)
		})

		colorpicker.RGBOutline = library:create("ImageButton",{
			Name = "Outline";
			Parent = colorpicker.Gradient;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://2790382281";
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		colorpicker.RGBOutlineGrad = library:create("UIGradient",{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))};
			Rotation = 90;
			Parent = colorpicker.RGBOutline
		})


		local Players = game:GetService("Players")
		local TextService = game:GetService("TextService")
		local UserInputService = game:GetService("UserInputService")

		--- Player ---
		local Player = Players.LocalPlayer
		local Mouse = Player:GetMouse()

		--- Data ---
		local Down = false

		--- Definitions ---
		local Abs = math.abs
		local Clamp = math.clamp
		local Floor = math.floor

		local Tonumber = tonumber

		--- Functions ---
		local function UpdateCursorPosition(h, s)
			local gradientSize = colorpicker.Gradient.AbsoluteSize
			local sizeScale = 360 / gradientSize.X
			colorpicker.RGBCursor.Position = UDim2.new(0, gradientSize.X - (tonumber(h) * 360) / sizeScale, 0, (gradientSize.Y - (tonumber(s) * 360) / sizeScale))
		end

		local function InBounds()
			local mousePosition = Vector2.new(Mouse.X, Mouse.Y)
			local gradientPosition = colorpicker.Gradient.AbsolutePosition
			local gradientSize = colorpicker.Gradient.AbsoluteSize

			return (mousePosition.X < (gradientPosition.X + gradientSize.X) and mousePosition.X > gradientPosition.X) and (mousePosition.Y < (gradientPosition.Y + gradientSize.Y) and mousePosition.Y > gradientPosition.Y)
		end

		local function SanitizeNumber(value, rgbValue, isHue)
			if value then
				value = (value ~= value and 0) or (Tonumber(value) or 0)

				if isHue then
					return Clamp(value, 0, 360)
				else
					return Clamp(value, 0, (rgbValue and 255 or 1))
				end
			end
		end

		local function UpdateColorWithRGB()
			local color = Color3.fromRGB(Tonumber(colorpicker.RSub.Text), Tonumber(colorpicker.GSub.Text), Tonumber(colorpicker.BSub.Text))
			colorpicker.Press.ImageColor3 = color
			local gradientSize = colorpicker.Gradient.AbsoluteSize
			local sizeScale = 360 / gradientSize.X
			local h,s,v = hsv(color.R,color.G,color.B)
			colorpicker.RGBCursor.Position = UDim2.new(0, gradientSize.X - (tonumber(h) * 360) / sizeScale, 0, (gradientSize.Y - (tonumber(s) * 360) / sizeScale))
			colorpicker.HueSub.Text = h; colorpicker.SatSub.Text = s; colorpicker.ValSub.Text = v;
			colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,v,0)
			return color
		end

		local function UpdateColorWithHSV()
			local color = Color3.fromHSV((Tonumber(colorpicker.HueSub.Text) or 0) / 360, Tonumber(colorpicker.SatSub.Text) or 1, Tonumber(colorpicker.ValSub.Text) or 1)
			colorpicker.Press.ImageColor3 = color
			local gradientSize = colorpicker.Gradient.AbsoluteSize
			local sizeScale = 360 / gradientSize.X
			local color = Color3.fromRGB(Tonumber(colorpicker.RSub.Text), Tonumber(colorpicker.GSub.Text), Tonumber(colorpicker.BSub.Text))
			local h,s,v = hsv(color.R,color.G,color.B)
			colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,v,0)
			colorpicker.RGBCursor.Position = UDim2.new(0, gradientSize.X - (tonumber(h) * 360) / sizeScale, 0, (gradientSize.Y - (tonumber(s) * 360) / sizeScale))
			return color
		end

		local function UpdateFillIns(color)
			if color then
				local h, s, v = hsv(color.r,color.g,color.b)
				local r, g, b = Floor(color.r * 255 + 0.5), Floor(color.g * 255 + 0.5), Floor(color.b * 255 + 0.5)

				colorpicker.HueSub.Text = Floor(h + 0.5)
				colorpicker.SatSub.Text = Floor(s + 0.5)
				colorpicker.ValSub.Text = Floor(v * 1000 + 0.5) / 1000

				colorpicker.RSub.Text = r
				colorpicker.GSub.Text = g
				colorpicker.BSub.Text = b

				colorpicker.HexSub.Text = RGBToHex(r, g, b)
				UpdateCursorPosition(h, s)
			end
		end

		local function inBounds(frame)
			local x,y = Mouse.X - frame.AbsolutePosition.X,Mouse.Y - frame.AbsolutePosition.Y
			local maxX,maxY = frame.AbsoluteSize.X,frame.AbsoluteSize.Y
			if x >= 0 and y >= 0 and x <= maxX and y <= maxY then
				return x/maxX,y/maxY
			end
		end

		local x,y = inBounds(colorpicker.Dark)
		if x and y then
			colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,y,0)
			colorpicker.ValSub.Text = tostring(1 - y)
			UpdateColorWithHSV()
		end

		local function GetColor()
			if InBounds() then
				local gradientSize = colorpicker.Gradient.AbsoluteSize
				UserInputService.MouseIconEnabled = false

				local sizeScale = 360 / gradientSize.X
				local offset = Vector2.new(Mouse.X, Mouse.Y+10) - (colorpicker.Gradient.AbsolutePosition + gradientSize / 2)

				local hue = Abs((offset.X * sizeScale - 180) / 360)
				local saturation = Abs((offset.Y * sizeScale - 180) / 360)
				local color = Color3.fromHSV(hue, saturation, 1)

				colorpicker.Press.ImageColor3 = color
				colorpicker.RGBCursor.Position = UDim2.new(0, Clamp(offset.X + gradientSize.X / 2, 0, gradientSize.X), 0, Clamp(offset.Y + gradientSize.Y / 2, 0, gradientSize.Y))

				return color
			else
				Down = false
			end

			UserInputService.MouseIconEnabled = true
			return nil
		end

		--- Execution ---
		colorpicker.Gradient.MouseButton1Down:Connect(function()
			UpdateFillIns(GetColor())
			Down = true
		end)

		Mouse.Move:Connect(function()
			if Down then
				UpdateFillIns(GetColor())
			else
				UserInputService.MouseIconEnabled = true
			end
		end)

		colorpicker.Gradient.MouseButton1Up:Connect(function()
			Down = false
		end)

		do -- Fill In Events
			local R = colorpicker.RSub
			local G = colorpicker.GSub
			local B = colorpicker.BSub

			local H = colorpicker.HueSub
			local S = colorpicker.SatSub
			local V = colorpicker.ValSub

			local Hex = colorpicker.HexSub

			do -- RGB
				R:GetPropertyChangedSignal("Text"):Connect(function()
					local text = R.Text

					if #text ~= 0 then
						if tonumber(text) > 255 then text = 255 end if tonumber(text) < 0 then text = 0 end
						R.Text = SanitizeNumber(text, true)
						UpdateFillIns(UpdateColorWithRGB())
					end
				end)

				G:GetPropertyChangedSignal("Text"):Connect(function()
					local text = G.Text

					if #text ~= 0 then
						if tonumber(text) > 255 then text = 255 end if tonumber(text) < 0 then text = 0 end
						G.Text = SanitizeNumber(text, true)
						UpdateFillIns(UpdateColorWithRGB())
					end
				end)

				B:GetPropertyChangedSignal("Text"):Connect(function()
					local text = B.Text

					if #text ~= 0 then
						if tonumber(text) > 255 then text = 255 end if tonumber(text) < 0 then text = 0 end
						B.Text = SanitizeNumber(text, true)
						UpdateFillIns(UpdateColorWithRGB())
					end
				end)
			end

			do -- HSV
				H.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local text = H.Text

						if #text ~= 0 then
							if tonumber(text) > 239 then text = 239 end if tonumber(text) < 0 then text = 0 end
							H.Text = SanitizeNumber(text, false, true)
							UpdateFillIns(UpdateColorWithHSV())
						end
					end
				end)

				S.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local text = S.Text

						if #text ~= 0 then
							if tonumber(text) > 1 then text = 1 end if tonumber(text) < 0 then text = 0 end
							S.Text = SanitizeNumber(text, false)
							UpdateFillIns(UpdateColorWithHSV())
						end
					end
				end)

				V.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local text = V.Text

						if #text ~= 0 then
							if tonumber(text) > 1 then text = 1 end if tonumber(text) < 0 then text = 0 end
							V.Text = SanitizeNumber(text, false)
							UpdateFillIns(UpdateColorWithHSV())
							colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,text,0)
						end
					end
				end)
			end

			Hex:GetPropertyChangedSignal("Text"):Connect(function()
				local text = Hex.Text

				if #text ~= 0 then
					local index = 0
					local s, e = text:find("#")

					text = text:gsub("#", function()
						index = index + 1

						if s == 1 then
							return index == 1 and "#" or ""
						else
							return ""
						end
					end)

					if text:find("#") ~= 1 then
						text = "#" .. text
					end

					Hex.Text = text
				end
			end)

			Hex.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					local function HexToRGB(hex)
						hex = hex:sub(2):upper()

						if #hex == 3 then
							local f, s, t = hex:sub(1, 1), hex:sub(2, 2), hex:sub(3, 3)
							return hex, tonumber(f .. f, 16), tonumber(s .. s, 16), tonumber(t .. t, 16)
						elseif #hex == 6 then
							return hex, tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
						elseif #hex ~= 3 and #hex < 6 then
							hex = hex .. string.rep("0", 6 - #hex)
							return hex, tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
						end
					end
					local hex, r, g, b = HexToRGB(Hex.Text)
					local h, s, v = Color3.toHSV(Color3.fromRGB(r, g, b))

					Hex.Text = hex
					UpdateFillIns(Color3.fromRGB(r, g, b))
				end
			end)
		end

		colorpicker.Main.MouseEnter:Connect(function()
			tween(colorpicker.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
		end)
		colorpicker.Main.MouseLeave:Connect(function()
			tween(colorpicker.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
		end)

		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return colorpicker;
	end

	function Window:Section(name,description,image,IRO,IRS)
		IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
		image = image or "rbxassetid://3926305904";

		local section = {};

		section.SectionHolder = library:create("Frame",{
			Name = "SectionHolder";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.0000;
			BorderSizePixel = 0;
			ClipsDescendants = true;
			Position = UDim2.new(0, 0, 0.253818899, 0);
			Size = UDim2.new(0, 788, 0, 67)
		})

		section.Main = library:create("ImageButton",{
			Name = "Section";
			Parent = section.SectionHolder;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		section.Image = library:create("ImageButton",{
			Name = "img";
			Parent = section.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = IRO;
			ImageRectSize = IRS
		})

		section.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = section.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 4);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		section.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = section.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 39);
			Size = UDim2.new(0, 376, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		section.Open = library:create("ImageButton",{
			Name = "Open";
			Parent = section.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0, 751, 0, 19);
			Rotation = 180.000;
			Size = UDim2.new(0, 26, 0, 26);
			ZIndex = 2;
			Image = "http://www.roblox.com/asset/?id=1902936388"
		})

		section.Holder = library:create("ImageButton",{
			Name = "Holder";
			Parent = section.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 0, 1, 1);
			Size = UDim2.new(1, 0, 0, 53);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		section.Held = library:create("Frame",{
			Name = "Held";
			Parent = section.Holder;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Size = UDim2.new(1, 0, 1, 0)
		})

		section.HeldList = library:create("UIListLayout",{
			Parent = section.Held;
			SortOrder = Enum.SortOrder.LayoutOrder;
			Padding = UDim.new(0, 1)
		})
		
		function section:Switch(name,description,image,default,IRO,IRS,callback)
        IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
		image = image or "rbxassetid://3926305904";
		default = default or false;
		callback = callback or function() end;

		local switch = {value = default}

		switch.Main = library:create("ImageButton",{
			Name = "Switch";
			Parent = section.Held;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 0, 1, 1);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		switch.Click = library:create("ImageButton",{
			Name = "Switchy";
			Parent = switch.Main;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			Position = UDim2.new(0, 715, 0.5, 0);
			Size = UDim2.new(0, 45, 0, 20);
			ZIndex = 2;
			Image = "rbxassetid://3570695787";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(100, 100, 100, 100);
			SliceScale = 0.120
		})

		switch.ClickOut = library:create("ImageButton",{
			Name = "Outline";
			Parent = switch.Click;
			AnchorPoint = Vector2.new(0.5, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			BorderSizePixel = 0;
			Position = UDim2.new(0.5, 0, 0.5, 0);
			Size = UDim2.new(1, 2, 1, 2);
			Image = "rbxassetid://3570695787";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(100, 100, 100, 100);
			SliceScale = 0.120
		})

		switch.ClickCircle = library:create("ImageButton",{
			Name = "Circle";
			Parent = switch.Click;
			AnchorPoint = Vector2.new(0, 0.5);
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderColor3 = Color3.fromRGB(27, 42, 53);
			BorderSizePixel = 0;
			Position = UDim2.new(0.0700000003, 0, 0.504000008, 0);
			Size = UDim2.new(0, 15, 0, 15);
			ZIndex = 3;
			Image = "rbxassetid://3570695787";
			ImageColor3 = Color3.fromRGB(170, 170, 170);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(100, 100, 100, 100);
			SliceScale = 0.120
		})

		switch.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = switch.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 39);
			Size = UDim2.new(0, 591, 0, 20);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		switch.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = switch.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 4);
			Size = UDim2.new(0, 710, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		switch.Image = library:create("ImageLabel",{
			Name = "img";
			Parent = switch.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = IRO;
			ImageRectSize = IRS
		})

		switch.SwitchText = library:create("TextLabel",{
			Name = "SwitchText";
			Parent = switch.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0, 599, 0, 19);
			Size = UDim2.new(0, 184, 0, 26);
			ZIndex = 3;
			Font = Enum.Font.ArialBold;
			Text = "Off";
			TextColor3 = Color3.fromRGB(170, 170, 170);
			TextSize = 16.000
		})

		function switch:Set(state)
				if state == false then
					tween(switch.Click,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					tween(switch.ClickCircle,0.3,{ImageColor3 = Color3.fromRGB(170, 170, 170), Position = UDim2.new(0.07, 0,0.5, 0)});
					switch.SwitchText.Text = "Off";
				else
					tween(switch.Click,0.3,{ImageColor3 = Color3.fromRGB(170, 170, 170)});
					tween(switch.ClickCircle,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43), Position = UDim2.new(0.6, 0,0.5, 0)});
					switch.SwitchText.Text = "On";
				end
				callback(state);
				switch.value = state
			end

			switch:Set(switch.value)

			local held = false;
			switch.Main.MouseButton1Down:Connect(function()
				held = true;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.Main.MouseButton1Up:Connect(function()
				if held then
					tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					switch:Set(not switch.value)
				end
			end)
			switch.Click.MouseButton1Down:Connect(function()
				held = true;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.Click.MouseButton1Up:Connect(function()
				if held then
					tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					switch:Set(not switch.value)
				end
			end)
			switch.ClickCircle.MouseButton1Down:Connect(function()
				held = true;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.ClickCircle.MouseButton1Up:Connect(function()
				if held then
					tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					switch:Set(not switch.value)
				end
			end)
			switch.Main.MouseEnter:Connect(function()
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.Main.MouseLeave:Connect(function()
				held = false;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)

			Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

			return switch;
		end

		function section:Button(name,clicktext,callback)
			callback = callback or function() end;

			local button = {};

			button.Main = library:create("ImageButton",{
				Name = "Button";
				Parent = section.Held;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 0, 1, 1);
				Size = UDim2.new(1, 0, 0, 53);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			button.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = button.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 16, 0, 8);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 15.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			button.Press = library:create("ImageButton",{
				Name = "Press";
				Parent = button.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 625, 0, 11);
				Size = UDim2.new(0, 133, 0, 30);
				ZIndex = 2;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			button.Outline = library:create("ImageButton",{
				Name = "Outline";
				Parent = button.Press;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			button.BTNText = library:create("TextLabel",{
				Name = "BTNText";
				Parent = button.Press;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 3;
				Font = Enum.Font.ArialBold;
				Text = clicktext;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 16.000
			})

			local held = false;
			button.Main.MouseButton1Down:Connect(function()
				held = true;
				tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			button.Main.MouseButton1Up:Connect(function()
				if held then
					tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					library:ripple(button.Outline)
					callback()
				end
			end)
			button.Main.MouseEnter:Connect(function()
				tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
			end)
			button.Main.MouseLeave:Connect(function()
				held = false;
				tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)

			Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

			return button;
		end
		
		function section:Text(text,align)
			align = align or Enum.TextXAlignment.Center
			
			local txt = {}

			txt.Main = library:create("TextLabel",{
				Name = "Text";
				Parent = section.Held;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.70247072, 0);
				TextXAlignment = align;
				Size = UDim2.new(0, 788, 0, 24);
				Font = Enum.Font.ArialBold;
				Text = text;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000
			})

			function txt:Set(val)
				txt.Main.Text = val;
			end

			Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

			return txt;

		end

		function section:Toggle(name,default,callback)
			default = default or false;
			callback = callback or function() end;

			local toggle = {value = default}

			toggle.Main = library:create("ImageButton",{
				Name = "Toggle";
				Parent = section.Held;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 0, 1, 1);
				Size = UDim2.new(0, 788, 0, 53);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				ClipsDescendants = true;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			toggle.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = toggle.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0709927827, 0, 0.13491787, 0);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 15.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			toggle.Box = library:create("ImageButton",{
				Name = "Box";
				Parent = toggle.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 20, 0, 13);
				Size = UDim2.new(0, 23, 0, 23);
				ZIndex = 2;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			toggle.Check = library:create("ImageButton",{
				Name = "Check";
				Parent = toggle.Box;
				Active = false;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 11, 0, 11);
				Selectable = false;
				Size = UDim2.new(0.6, 0, 0.6, 0);
				Visible = true;
				ImageTransparency = 1;
				ZIndex = 3;
				Image = "http://www.roblox.com/asset/?id=1489284025"
			})

			toggle.Outline = library:create("ImageButton",{
				Name = "Outline";
				Parent = toggle.Box;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 12, 0, 11);
				Size = UDim2.new(0, 25, 0, 25);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			function toggle:Set(value)
				toggle.value = value
				if value then
					tween(toggle.Check,0.2,{ImageTransparency = 0});
					callback(true)
				else
					tween(toggle.Check,0.2,{ImageTransparency = 1});
					callback(false)
				end
			end

			local held = false;
			toggle.Main.MouseButton1Down:Connect(function()
				held = true;
				tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			toggle.Main.MouseButton1Up:Connect(function()
				if held then
					tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					toggle:Set(not toggle.value)
				end
			end)
			toggle.Main.MouseEnter:Connect(function()
				tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
			end)
			toggle.Main.MouseLeave:Connect(function()
				held = false;
				tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)

			Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

			return toggle;
		end

		local held = false;
		section.Main.MouseButton1Down:Connect(function()
			held = true;
			tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(170,170,170)})
		end)
		
		section.Main.MouseButton1Up:Connect(function()
			if held then
				tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				if section.Open.Rotation == 180 then
					tween(section.SectionHolder,0.3,{Size = UDim2.new(0, 788, 0, section.HeldList.AbsoluteContentSize.Y+67)})
					wait(0.35)
					tween(Window.Container,0.3,{CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y + 10)})
					tween(section.Open,0.3,{Rotation = 0})
				else
					tween(section.SectionHolder,0.3,{Size = UDim2.new(0, 788, 0, 67)})
					wait(0.35)
					tween(Window.Container,0.3,{CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y + 10)})
					tween(section.Open,0.3,{Rotation = 180})
				end
				held = false;
			end
		end)
		
		section.Main.MouseEnter:Connect(function()
			tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
		end)
		section.Main.MouseLeave:Connect(function()
			tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			held = false;
		end)
		
		Window.Container.CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y);

		return section;

	end

	function Window:SubTab(name,description,image,IRO,IRS)
		IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
		image = image or "rbxassetid://3926305904";

		local Sub = {};

		Sub.SubTab = library:create("ScrollingFrame",{
			Name = "SubTab";
			Parent = Window.SubCatagories;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0.0240000002, 0, 0.104999997, 0);
			CanvasSize = UDim2.new(0,0,0,0);
			Selectable = false;
			Size = UDim2.new(0.976000011, 0, 0.898000002, 0);
			Visible = false
		})

		Sub.SubTabList = library:create("UIListLayout",{
			Parent = Sub.SubTab;
			SortOrder = Enum.SortOrder.LayoutOrder;
			Padding = UDim.new(0, 4)
		})

		Sub.Main = library:create("ImageButton",{
			Name = "SubTab";
			Parent = Window.Container;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			Position = UDim2.new(0.0239664223, 0, 0.0793402195, 0);
			Size = UDim2.new(0, 788, 0, 67);
			Image = "rbxassetid://2790382281";
			ImageColor3 = Color3.fromRGB(43, 43, 43);
			ScaleType = Enum.ScaleType.Slice;
			SliceCenter = Rect.new(4, 4, 252, 252)
		})

		Sub.Title = library:create("TextLabel",{
			Name = "Title";
			Parent = Sub.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 4);
			Size = UDim2.new(0, 710, 0, 35);
			Font = Enum.Font.ArialBold;
			Text = name;
			TextColor3 = Color3.fromRGB(255, 255, 255);
			TextSize = 17.000;
			TextXAlignment = Enum.TextXAlignment.Left
		})

		Sub.Description = library:create("TextLabel",{
			Name = "Description";
			Parent = Sub.Main;
			BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			BackgroundTransparency = 1.000;
			BorderSizePixel = 0;
			Position = UDim2.new(0, 67, 0, 39);
			Size = UDim2.new(0, 591, 0, 20);
			Font = Enum.Font.ArialBold;
			Text = description;
			TextColor3 = Color3.fromRGB(216, 216, 216);
			TextSize = 14.000;
			TextXAlignment = Enum.TextXAlignment.Left;
			TextYAlignment = Enum.TextYAlignment.Top
		})

		Sub.Image = library:create("ImageButton",{
			Name = "img";
			Parent = Sub.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0, 16, 0, 16);
			Size = UDim2.new(0, 32, 0, 32);
			ZIndex = 2;
			Image = image;
			ImageRectOffset = IRO;
			ImageRectSize = IRS
		})

		Sub.Open = library:create("ImageButton",{
			Name = "Open";
			Parent = Sub.Main;
			BackgroundTransparency = 1.000;
			LayoutOrder = 15;
			Position = UDim2.new(0, 751, 0, 19);
			Rotation = 90.000;
			Size = UDim2.new(0, 26, 0, 26);
			ZIndex = 2;
			Image = "http://www.roblox.com/asset/?id=1902936388"
		})

		local held = false;
		Sub.Main.MouseButton1Down:Connect(function()
			held = true;
			tween(Sub.Main,0.2,{ImageColor3 = Color3.fromRGB(170,170,170)})
		end)
		Sub.Main.MouseButton1Up:Connect(function()
			if held then
				tween(Sub.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				Sub.SubTab.Visible = true;
				Window.Container.Visible = false;
				Window.SubTitle.Text = "> "..name
				local bounds = game:GetService('TextService'):GetTextSize(Window.Title.Text, 24, Enum.Font.ArialBold, Vector2.new(math.huge, math.huge)).X+8
				Window.SubTitle.Position = UDim2.new(0,bounds+20,0.0340000018,0)
				Window.SubTitle.Visible = true;
				Window.Title.TextColor3 = Color3.fromRGB(175,175,175);
				Window.Title.MouseEnter:Connect(function()
					if Window.SubTitle.Visible then
						tween(Window.Title,0.3,{TextColor3 = Color3.fromRGB(215,215,215)});
					else
						Window.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					end
				end);
				Window.Title.MouseLeave:Connect(function()
					if Window.SubTitle.Visible then
						tween(Window.Title,0.3,{TextColor3 = Color3.fromRGB(175,175,175)});
					else
						Window.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					end
				end)
				Window.Title.MouseButton1Click:Connect(function()
					Sub.SubTab.Visible = false;
					Window.Container.Visible = true;
					Window.SubTitle.Visible = false;
					Window.Title.TextColor3 = Color3.fromRGB(255, 255, 255);
				end)
			end
		end)
		Sub.Main.MouseEnter:Connect(function()
			tween(Sub.Main,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
		end)
		Sub.Main.MouseLeave:Connect(function()
			held = false;
			tween(Sub.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
		end)

		function Sub:Button(name,description,image,clicktext,IRO,IRS,callback)
            IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		    IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
			image = image or "rbxassetid://3926305904";
			callback = callback or function() end;

			local button = {};

			button.Main = library:create("ImageButton",{
				Name = "Button";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 0, 1, 1);
				Size = UDim2.new(0, 788, 0, 67);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			button.Press = library:create("ImageButton",{
				Name = "Press";
				Parent = button.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.79400003, 0, 0.5, 0);
				Size = UDim2.new(0.170000002, 0, 0, 30);
				ZIndex = 2;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			button.PressOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = button.Press;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			button.PressText = library:create("TextLabel",{
				Name = "BTNText";
				Parent = button.Press;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 3;
				Font = Enum.Font.ArialBold;
				Text = clicktext;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 16.000
			})

			button.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = button.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
				Size = UDim2.new(0, 591, 0, 20);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			button.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = button.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
				Size = UDim2.new(0, 710, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			button.Image = library:create("ImageLabel",{
				Name = "img";
				Parent = button.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = image;
				ImageRectOffset = IRO;
				ImageRectSize = IRS
			})

			local held = false;
			button.Main.MouseButton1Down:Connect(function()
				held = true;
				tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			button.Main.MouseButton1Up:Connect(function()
				if held then
					tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					library:ripple(button.PressOutline)
					callback()
				end
			end)
			button.Main.MouseEnter:Connect(function()
				tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
			end)
			button.Main.MouseLeave:Connect(function()
				held = false;
				tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)

			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return button;
		end

		function Sub:Switch(name,description,image,default,IRO,IRS,callback)
            IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		    IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
			image = image or "rbxassetid://3926305904";
			default = default or false;
			callback = callback or function() end;

			local switch = {value = default}

			switch.Main = library:create("ImageButton",{
				Name = "Switch";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 0, 1, 1);
				Size = UDim2.new(0, 788, 0, 67);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			switch.Click = library:create("ImageButton",{
				Name = "Switchy";
				Parent = switch.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 715, 0.5, 0);
				Size = UDim2.new(0, 45, 0, 20);
				ZIndex = 2;
				Image = "rbxassetid://3570695787";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(100, 100, 100, 100);
				SliceScale = 0.120
			})

			switch.ClickOut = library:create("ImageButton",{
				Name = "Outline";
				Parent = switch.Click;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://3570695787";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(100, 100, 100, 100);
				SliceScale = 0.120
			})

			switch.ClickCircle = library:create("ImageButton",{
				Name = "Circle";
				Parent = switch.Click;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				BorderSizePixel = 0;
				Position = UDim2.new(0.0700000003, 0, 0.504000008, 0);
				Size = UDim2.new(0, 15, 0, 15);
				ZIndex = 3;
				Image = "rbxassetid://3570695787";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(100, 100, 100, 100);
				SliceScale = 0.120
			})

			switch.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = switch.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 39);
				Size = UDim2.new(0, 591, 0, 20);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			switch.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = switch.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 4);
				Size = UDim2.new(0, 710, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			switch.Image = library:create("ImageLabel",{
				Name = "img";
				Parent = switch.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = image;
				ImageRectOffset = IRO;
				ImageRectSize = IRS
			})

			switch.SwitchText = library:create("TextLabel",{
				Name = "SwitchText";
				Parent = switch.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 599, 0, 19);
				Size = UDim2.new(0, 184, 0, 26);
				ZIndex = 3;
				Font = Enum.Font.ArialBold;
				Text = "Off";
				TextColor3 = Color3.fromRGB(170, 170, 170);
				TextSize = 16.000
			})

			function switch:Set(state)
				if state == false then
					tween(switch.Click,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					tween(switch.ClickCircle,0.3,{ImageColor3 = Color3.fromRGB(170, 170, 170), Position = UDim2.new(0.07, 0,0.5, 0)});
					switch.SwitchText.Text = "Off";
				else
					tween(switch.Click,0.3,{ImageColor3 = Color3.fromRGB(170, 170, 170)});
					tween(switch.ClickCircle,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43), Position = UDim2.new(0.6, 0,0.5, 0)});
					switch.SwitchText.Text = "On";
				end
				callback(state);
				switch.value = state
			end

			switch:Set(switch.value)

			local held = false;
			switch.Main.MouseButton1Down:Connect(function()
				held = true;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.Main.MouseButton1Up:Connect(function()
				if held then
					tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					switch:Set(not switch.value)
				end
			end)
			switch.Click.MouseButton1Down:Connect(function()
				held = true;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.Click.MouseButton1Up:Connect(function()
				if held then
					tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					switch:Set(not switch.value)
				end
			end)
			switch.ClickCircle.MouseButton1Down:Connect(function()
				held = true;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.ClickCircle.MouseButton1Up:Connect(function()
				if held then
					tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					switch:Set(not switch.value)
				end
			end)
			switch.Main.MouseEnter:Connect(function()
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			switch.Main.MouseLeave:Connect(function()
				held = false;
				tween(switch.Main,0.3,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return switch;
		end

		function Sub:Box(name,description,image,default,callback)
			image = image or "rbxassetid://3926305904";
			default = default or "Text";
			callback = callback or function() end;

			local box = {};

			box.Main = library:create("ImageButton",{
				Name = "Box";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0.0239664223, 0, 0.138730273, 0);
				Size = UDim2.new(0, 788, 0, 67);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			box.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = box.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			box.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = box.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			box.Image = library:create("ImageLabel",{
				Name = "img";
				Parent = box.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = "rbxassetid://3926305904";
				ImageRectOffset = Vector2.new(124, 484);
				ImageRectSize = Vector2.new(36, 36)
			})

			box.Press = library:create("ImageButton",{
				Name = "Press";
				Parent = box.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 760, 0.5, 0);
				Size = UDim2.new(0, -90, 0, 30);
				ZIndex = 2;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			box.PressOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = box.Press;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			box.PressText = library:create("TextBox",{
				Name = "BTNText";
				Parent = box.Press;
				Active = false;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 4;
				Font = Enum.Font.ArialBold;
				Text = default;
				ClipsDescendants = true;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 16.000
			})

			function box:Set(text)
				box.PressText.Text = text;
				box.Press.Size = UDim2.new(0,-box.PressText.TextBounds.X-8,0,30);
				callback(text)
			end

			box:Set(default)

			local UserInputService = game:GetService("UserInputService");
			local holding = false;

			box.PressText:GetPropertyChangedSignal("Text"):connect(function()
				if -box.PressText.TextBounds.X-8 > -323 then
					box.Press.Size = UDim2.new(0,-box.PressText.TextBounds.X-8,0,30)
				else
					box.Press.Size = UDim2.new(0,-315,0,30)
				end
			end)

			box.Main.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					box.PressText:CaptureFocus();
				end
			end)

			box.Press.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					box.PressText:CaptureFocus();
				end
			end)

			UserInputService.InputEnded:connect(function(input)
				if input.KeyCode.Name == "Enter" then
					box.PressText:ReleaseFocus();
					callback(box.PressText.Text)
				end
			end)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return box;
		end

		function Sub:Bind(name,description,image,default,IRO,IRS,callback)
            IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		    IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
			image = image or "rbxassetid://3926305904";
			default = default or Enum.KeyCode.Period;
			callback = callback or function() end;

			local bind = {binding = false; value = default};

			bind.Main = library:create("ImageButton",{
				Name = "Bind";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0.0239664223, 0, 0.138730273, 0);
				Size = UDim2.new(0, 788, 0, 67);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			bind.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = bind.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			bind.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = bind.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			bind.Image = library:create("ImageLabel",{
				Name = "img";
				Parent = bind.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = "rbxassetid://3926305904";
				ImageRectOffset = IRO;
				ImageRectSize = IRS
			})

			bind.Press = library:create("ImageButton",{
				Name = "Press";
				Parent = bind.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 760, 0, 32);
				Size = UDim2.new(0, -75, 0, 30);
				ZIndex = 2;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			bind.PressOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = bind.Press;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			bind.BindText = library:create("TextLabel",{
				Name = "BTNText";
				Parent = bind.Press;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 3;
				Font = Enum.Font.ArialBold;
				Text = default.Name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 16.000
			})

			function bind:Set(key)
				if not key then
					bind.value = nil
					bind.BindText.Text = tostring("[ ".."None".." ]")
					bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
				else
					if key.Name:sub(1,11) == "MouseButton" then
						bind.BindText.Text = tostring("[ ".."MB"..key.Name:sub(12).." ]")
					else
						bind.BindText.Text = tostring("[ "..key.Name.." ]")
					end
					bind.value = key
					bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
					callback(bind.value)
				end
			end

			bind:Set(default)

			local UserInputService = game:GetService("UserInputService");

			bind.binding = false;
			local holding = false;
			local bindname = "";

			bind.Main.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					bind.BindText.Text = "..."
					bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
				end
			end)

			bind.Main.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if bind.value ~= nil then
						bind:Set(nil)
					else
						bind.binding = true
					end
				end
			end)

			bind.Press.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					bind.BindText.Text = "..."
					bind.Press.Size = UDim2.new(0,-bind.BindText.TextBounds.X-8,0,30)
				end
			end)

			bind.Press.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if bind.value ~= nil then
						bind:Set(nil)
					else
						bind.binding = true
					end
				end
			end)

			local a = tick()

			UserInputService.InputBegan:connect(function(input)
				if bind.binding then
					if table.find({Enum.KeyCode.Backspace, Enum.KeyCode.Escape}, input.KeyCode) then
						bind:Set(nil)
						bind.binding = false
					elseif input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
						bind:Set(input.KeyCode)
						bind.binding = false
					elseif input.UserInputType and table.find({Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}, input.UserInputType) then
						bind:Set(input.UserInputType)
						bind.binding = false
					end
				elseif input.KeyCode == bind.value or input.UserInputType == bind.value then
					callback(true)
				end
			end)

			UserInputService.InputEnded:connect(function(input)
				if input.KeyCode.Name == bindname then
					holding = false
				end
				if input.UserInputType.Name == bindname then
					holding = false
				end
				if not bind.binding and input.KeyCode == bind.value or input.UserInputType == bind.value then
					callback(false)
				end
			end)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return bind;
		end

		function Sub:Slider(name,description,image,min,default,max,IRO,IRS,callback)
            IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
		    IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
			image = image or "rbxassetid://3926305904";
			min = min or 0;
			default = default or 50;
			max = max or 100;
			callback = callback or function() end;

			local slider = {value = default};

			slider.Main = library:create("ImageButton",{
				Name = "Slider";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0.0239664223, 0, 0.138730273, 0);
				Size = UDim2.new(0, 788, 0, 67);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			slider.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = slider.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.0738516301, 0);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			slider.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = slider.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0.0862212181, 0, 0.587748051, 0);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			slider.Image = library:create("ImageLabel",{
				Name = "img";
				Parent = slider.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = image;
				ImageRectOffset = IRO;
				ImageRectSize = IRS
			})

			slider.Bar = library:create("ImageButton",{
				Name = "Bar";
				Parent = slider.Main;
				BackgroundColor3 = Color3.fromRGB(35, 35, 35);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0.640720844, 0, 0.46929884, 0);
				Size = UDim2.new(0, 248, 0, 4);
				Image = "rbxassetid://2790371148";
				ImageColor3 = Color3.fromRGB(165, 165, 165);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(32, 32, 224, 224)
			})

			slider.Fill = library:create("Frame",{
				Name = "sliderfill";
				Parent = slider.Bar;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Size = UDim2.new(1, 0, 1, 0)
			})

			slider.Dot = library:create("Frame",{
				Name = "Dot";
				Parent = slider.Fill;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(1, -10, 0.5, 0);
				Size = UDim2.new(0, 20, 0, 20)
			})

			slider.Inner = library:create("ImageButton",{
				Name = "Inner";
				Parent = slider.Dot;
				BackgroundColor3 = Color3.fromRGB(35, 35, 35);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 5, 0, 5);
				Size = UDim2.new(0, 10, 0, 10);
				ZIndex = 2;
				Image = "rbxassetid://2790371148";
				ImageColor3 = Color3.fromRGB(165, 165, 165);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(32, 32, 224, 224)
			})

			slider.Outer = library:create("ImageButton",{
				Name = "Outer";
				Parent = slider.Dot;
				BackgroundColor3 = Color3.fromRGB(35, 35, 35);
				BackgroundTransparency = 1.000;
				Size = UDim2.new(0, 20, 0, 20);
				Image = "rbxassetid://2790371148";
				ImageColor3 = Color3.fromRGB(98, 98, 98);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(32, 32, 224, 224)
			})

			slider.TextValue = library:create("TextBox",{
				Name = "Number Value";
				Parent = slider.Main;
				Active = false;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0.563451767, 0, 0.119402982, 0);
				Selectable = false;
				Size = UDim2.new(0, 60, 0, 50);
				Font = Enum.Font.SourceSansBold;
				Text = tostring(default);
				TextColor3 = Color3.fromRGB(171, 171, 171);
				TextSize = 20.000
			})

			local function round(num, bracket)
				bracket = bracket or 1
				return math.floor(num/bracket + math.sign(num) * 0.5) * bracket
			end
			local value = default;

			local UserInputService = game:GetService("UserInputService");

			local function updateValue()
				value = round(value*max, 1) -- float)
				if value > max then
					value = max
				end
				if value < min then
					value = min
				end
				slider.Dot.Position = UDim2.new(1- math.clamp((max-value)/(max-min),0, 0.99),-10,0.5,0)
				slider.TextValue.Text = value
				callback(value)
			end

			local function updateSlider(input)
				local relativePos = input.Position.X- slider.Bar.AbsolutePosition.X
				if input.Position.X < slider.Bar.AbsolutePosition.X then
					relativePos = 0
				end
				if relativePos > slider.Bar.AbsoluteSize.X then
					relativePos = slider.Bar.AbsoluteSize.X
				end
				value = relativePos/slider.Bar.AbsoluteSize.X
				updateValue()
			end

			local sliding = false;
			local modifying = false;

			slider.Bar.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = true
					updateSlider(input)
				end
			end)
			slider.Inner.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = true
					updateSlider(input)
				end
			end)
			slider.Outer.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = true
					updateSlider(input)
				end
			end)
			slider.Main.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = true
					updateSlider(input)
				end
			end)

			slider.Main.MouseEnter:Connect(function()
				tween(slider.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
			end)
			slider.Main.MouseLeave:Connect(function()
				tween(slider.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)

			slider.TextValue.FocusLost:connect(function()
				value = (tonumber(slider.TextValue.Text) or 0) / max
				updateValue()
				callback(value)
			end)

			slider.Bar.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = false
					callback(value)
				end
			end)
			slider.Inner.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = false
					callback(value)
				end
			end)
			slider.Outer.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = false
					callback(value)
				end
			end)
			slider.Main.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = false
					callback(value)
				end
			end)

			UserInputService.InputChanged:connect(function(input)
				if modifying then
					if input == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Space then
						slider.TextValue:ReleaseFocus()
					end
				end
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if sliding then
						updateSlider(input)
					end
				end
			end)

			function slider:Set(num)
				value = num/max
				updateValue()
			end

			slider:Set(default)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return slider;
		end

		function Sub:Text(text,align)
			align = align or Enum.TextXAlignment.Center
			
			local txt = {}

			txt.Main = library:create("TextLabel",{
				Name = "Text";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.70247072, 0);
				TextXAlignment = align;
				Size = UDim2.new(0, 788, 0, 24);
				Font = Enum.Font.ArialBold;
				Text = text;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000
			})

			function txt:Set(val)
				txt.Main.Text = val;
			end


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return txt;

		end

		function Sub:Dropdown(name,description,image,default,list,callback)
			image = image or "rbxassetid://3926305904";
			list = list  or {"List","Not","Set"};
			default = default or list[1];
			callback = callback or function() end;

			local dropdown = {};

			dropdown.Main = library:create("ImageButton",{
				Name = "DropDown";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 0, 1, 1);
				Size = UDim2.new(0, 788, 0, 67);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			dropdown.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = dropdown.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 4);
				Size = UDim2.new(0, 710, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			dropdown.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = dropdown.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 39);
				Size = UDim2.new(0, 591, 0, 20);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			dropdown.Image = library:create("ImageLabel",{
				Name = "img";
				Parent = dropdown.Drop;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0, 16, 0, 16);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = image;
				ImageRectOffset = Vector2.new(124, 484);
				ImageRectSize = Vector2.new(36, 36)
			})

			dropdown.Drop = library:create("ImageButton",{
				Name = "Drop";
				Parent = dropdown.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 508, 0.5, 0);
				Size = UDim2.new(0, 250, 0, 30);
				ZIndex = 2;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(55, 55, 55);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			dropdown.DropOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = dropdown.Drop;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(58, 58, 58);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			dropdown.DropText = library:create("TextLabel",{
				Name = "DropText";
				Parent = dropdown.Drop;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0.0447894856, 0, 0, 0);
				Size = UDim2.new(0.955210507, 0, 1, 0);
				ZIndex = 3;
				Font = Enum.Font.ArialBold;
				Text = default;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 16.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			dropdown.DropIco = library:create("ImageButton",{
				Name = "dropIco";
				Parent = dropdown.Drop;
				Active = false;
				BackgroundTransparency = 1.000;
				Position = UDim2.new(1, -25, 0.16, 0);
				Size = UDim2.new(0, 20, 0, 20);
				ZIndex = 2;
				Image = "rbxassetid://3926305904";
				ImageColor3 = Color3.fromRGB(184, 184, 184);
				ImageRectOffset = Vector2.new(564, 284);
				ImageRectSize = Vector2.new(36, 36)
			})

			dropdown.Dropping = library:create("ImageLabel",{
				Name = "Dropping";
				Parent = dropdown.Drop;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 1, 0);
				Size = UDim2.new(1, 0, 0, 0);
				ZIndex = 4;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(55, 55, 55);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			dropdown.DroppingOutline = library:create("ImageLabel",{
				Name = "Outline";
				Parent = dropdown.Dropping;
				Active = true;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Selectable = true;
				Size = UDim2.new(1, 2, 1, 2);
				ZIndex = 3;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(58, 58, 58);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			dropdown.List = library:create("ScrollingFrame",{
				Name = "List";
				Parent = dropdown.Dropping;
				Active = true;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Size = UDim2.new(1, 0, 1, 0);
				CanvasSize = UDim2.new(1,0,1,0);
				ZIndex = 3;
				ScrollBarThickness = 0;
			})

			dropdown.DroppingList = library:create("UIListLayout",{
				Parent = dropdown.List;
				HorizontalAlignment = Enum.HorizontalAlignment.Center;
				SortOrder = Enum.SortOrder.LayoutOrder;
				Padding = UDim.new(0, 4)
			})

			dropdown.DroppingPadding = library:create("UIPadding",{
				Parent = dropdown.List;
				PaddingTop = UDim.new(0, 2)
			})

			function dropdown:Set(value)
				dropdown.DropText.Text = value
				callback(value)
				local Side = Instance.new("ImageLabel")
				dropdown.List[value].ImageColor3 = Color3.fromRGB(85,85,85)
				Side.Name = "Side"
				Side.Parent = dropdown.List[value]
				Side.Active = true
				Side.AnchorPoint = Vector2.new(0, 0.5)
				Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Side.BackgroundTransparency = 1.000
				Side.Position = UDim2.new(0, 0, 0.5, 0)
				Side.Selectable = true
				Side.ZIndex = 5
				Side.Size = UDim2.new(0, 4, 0.5, 0)
				Side.Image = "rbxassetid://2790382281"
				Side.ImageColor3 = Color3.fromRGB(164, 163, 159)
				Side.ScaleType = Enum.ScaleType.Slice
				Side.SliceCenter = Rect.new(4, 4, 252, 252)
			end

			function dropdown:refresh(tbl)
				for i,v in pairs(dropdown.List:GetChildren()) do
					if v:IsA("ImageButton") then
						v:Destroy();
					end
				end
				for i,v in pairs(tbl) do
					local Press = Instance.new("ImageButton")
					local BTNText = Instance.new("TextLabel")

					Press.Name = v
					Press.Parent = dropdown.List
					Press.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Press.BackgroundTransparency = 1.000
					Press.BorderColor3 = Color3.fromRGB(27, 42, 53)
					Press.Size = UDim2.new(1, -4, 0, 25)
					Press.ZIndex = 5
					Press.Image = "rbxassetid://2790382281"
					Press.ImageColor3 = Color3.fromRGB(55, 55, 55)
					Press.ScaleType = Enum.ScaleType.Slice
					Press.SliceCenter = Rect.new(4, 4, 252, 252)

					BTNText.Name = "BTNText"
					BTNText.Parent = Press
					BTNText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BTNText.BackgroundTransparency = 1.000
					BTNText.Size = UDim2.new(1, 0, 1, 0)
					BTNText.ZIndex = 5
					BTNText.Font = Enum.Font.ArialBold
					BTNText.Text = v
					BTNText.TextColor3 = Color3.fromRGB(255, 255, 255)
					BTNText.TextSize = 16.000

					if v == default then
						local Side = Instance.new("ImageLabel")
						Press.ImageColor3 = Color3.fromRGB(85,85,85)
						Side.Name = "Side"
						Side.Parent = Press
						Side.Active = true
						Side.AnchorPoint = Vector2.new(0, 0.5)
						Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Side.BackgroundTransparency = 1.000
						Side.Position = UDim2.new(0, 0, 0.5, 0)
						Side.Selectable = true
						Side.ZIndex = 5
						Side.Size = UDim2.new(0, 4, 0.5, 0)
						Side.Image = "rbxassetid://2790382281"
						Side.ImageColor3 = Color3.fromRGB(164, 163, 159)
						Side.ScaleType = Enum.ScaleType.Slice
						Side.SliceCenter = Rect.new(4, 4, 252, 252)
					end

					Press.MouseEnter:Connect(function()
						tween(Press,0.3,{ImageColor3 = Color3.fromRGB(70,70,70)})
					end)

					Press.MouseLeave:Connect(function()
						if v ~= default then
							tween(Press,0.3,{ImageColor3 = Color3.fromRGB(55, 55, 55)})
						end
					end)

					Press.MouseButton1Click:Connect(function()
						library:ripple(Press)
						default = v
						for i,v in pairs(dropdown.List:GetChildren()) do if v:IsA("ImageButton") and v:FindFirstChild("Side") then
								v:FindFirstChild("Side"):Destroy(); v.ImageColor3 = Color3.fromRGB(55,55,55);
							end end
						dropdown:Set(v)
						tween(dropdown.Dropping,0.3,{Size = UDim2.new(1,0,0,0)})
						tween(dropdown.DropIco,0.3,{Rotation=0});
						tween(Press,0.3,{ImageColor3 = Color3.fromRGB(85, 85, 85)})
					end)

				end

				tween(dropdown.Dropping,0.3,{Size = UDim2.new(1,0,0,0)})
			end

			dropdown:refresh(list)

			dropdown.Drop.MouseEnter:Connect(function()
				tween(dropdown.Drop,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
			end)
			dropdown.Drop.MouseLeave:Connect(function()
				tween(dropdown.Drop,0.2,{ImageColor3 = Color3.fromRGB(55, 55, 55)});
			end)
			dropdown.Drop.MouseButton1Click:Connect(function()
				local numents = 0
				for i,v in pairs(dropdown.List:GetChildren()) do
					if v:IsA("ImageButton") then
						numents = numents + 1
					end
				end
				if dropdown.Dropping.Size.Y.Offset == 0 then
					tween(dropdown.DropIco,0.3,{Rotation=-90});
					if numents >= 4 then
						tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 100)})
						tween(dropdown.List,0.3,{CanvasSize=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
					else
						tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
					end
				else
					tween(dropdown.DropIco,0.3,{Rotation=0});
					tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 0)})
				end
			end)

			dropdown.Main.MouseEnter:Connect(function()
				tween(dropdown.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
			end)
			dropdown.Main.MouseLeave:Connect(function()
				tween(dropdown.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)
			dropdown.Main.MouseButton1Click:Connect(function()
				local numents = 0
				for i,v in pairs(dropdown.List:GetChildren()) do
					if v:IsA("ImageButton") then
						numents = numents + 1
					end
				end
				if dropdown.Dropping.Size.Y.Offset == 0 then
					tween(dropdown.DropIco,0.3,{Rotation=-90});
					if numents >= 4 then
						tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 100)})
						tween(dropdown.List,0.3,{CanvasSize=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
					else
						tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, dropdown.DroppingList.AbsoluteContentSize.Y + 4)})
					end
				else
					tween(dropdown.DropIco,0.3,{Rotation=0});
					tween(dropdown.Dropping,0.3,{Size=UDim2.new(1, 0, 0, 0)})
				end
			end)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return dropdown;
		end

		function Sub:ColorPicker(name,description,image,default,callback)
			image = image or "rbxassetid://3926305904";
			default = default or Color3.fromRGB(255,0,0);
			callback = callback or function() end;

			local colorpicker = {value = default};

			local function hsv(newr,newg,newb)
				local cmax = math.max(newr,newg,newb)
				local cmin = math.min(newr,newg,newb)
				local diff = cmax - cmin
				--// hue
				local h = 0
				if cmax == 0 and cmin == 0  then
					h = 0
				else
					if cmax == newr then
						h = (60 * ((newg-newb)/diff)+360)%360
					elseif cmax == newg then
						h = (60 * ((newb-newr)/diff)+120)%360
					elseif cmax == newb then
						h = (60 * ((newr-newg)/diff)+240)%360
					end
				end
				--// sat
				local s = 0
				if cmax == 0 then
					s = 0
				else
					s = (diff/cmax)*100
				end
				--// value
				local v = cmax
				return h,s,v
			end

			local HexadecimalValues = {
				-- Decimal to Hex
				[10] = "A",
				[11] = "B",
				[12] = "C",
				[13] = "D",
				[14] = "E",
				[15] = "F",
			}

			local function DecimalToHex(decimal)
				local hex = ""
				local integer, remainder

				while true do
					integer = math.modf(decimal / 16)
					remainder = decimal % 16
					decimal = integer

					hex = hex .. (HexadecimalValues[remainder] or remainder)

					if integer == 0 then
						break
					end
				end

				if #hex == 1 then
					return "0" .. hex
				end

				return hex:reverse()
			end

			local function RGBToHex(r, g, b)
				return "#" .. DecimalToHex(r) .. DecimalToHex(g) .. DecimalToHex(b)
			end

			local r = math.floor(((colorpicker.value).R)*255)
			local g = math.floor(((colorpicker.value).G)*255)
			local b = math.floor(((colorpicker.value).B)*255)
			local h,s,v = hsv(r,g,b)
			local hx = RGBToHex(r,g,b)
			colorpicker.Main = library:create("ImageButton",{
				Name = name;
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 0, 0.327104658, 1);
				Size = UDim2.new(0, 788, 0, 214);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Press = library:create("ImageButton",{
				Name = "Press";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 731, 0, 33);
				Size = UDim2.new(0, 30, 0, 30);
				ZIndex = 2;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Outline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.Press;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = colorpicker.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 39);
				Size = UDim2.new(0, 591, 0, 20);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			colorpicker.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = colorpicker.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 4);
				Size = UDim2.new(0, 710, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.Image = library:create("ImageButton",{
				Name = "img";
				Parent = colorpicker.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0, 16, 0, 16);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = image;
				ImageRectOffset = Vector2.new(124, 484);
				ImageRectSize = Vector2.new(36, 36)
			})

			colorpicker.B = library:create("TextLabel",{
				Name = "Blue";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 249, 0, 173);
				Selectable = true;
				Size = UDim2.new(0, 171, 0, 45);
				ZIndex = 5;
				Font = Enum.Font.SourceSansSemibold;
				Text = "Blue";
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 19.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.BVal = library:create("ImageButton",{
				Name = "Value";
				Parent = colorpicker.B;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.555555582, 0, 0.137931034, 0);
				Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
				ZIndex = 5;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.BSub = library:create("TextBox",{
				Name = "Sub";
				Parent = colorpicker.BVal;
				Active = false;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.5, 0);
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 6;
				Font = Enum.Font.Arial;
				Text = tostring(math.floor(b));
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 16.000
			})

			colorpicker.BOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.BVal;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.G = library:create("TextLabel",{
				Name = "Green";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 249, 0, 128);
				Size = UDim2.new(0, 171, 0, 45);
				ZIndex = 5;
				Font = Enum.Font.SourceSansSemibold;
				Text = "Green";
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 19.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.GVal = library:create("ImageButton",{
				Name = "Value";
				Parent = colorpicker.G;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.555555582, 0, 0.137931034, 0);
				Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
				ZIndex = 5;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.GSub = library:create("TextBox",{
				Name = "Sub";
				Parent = colorpicker.GVal;
				Active = false;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.5, 0);
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 6;
				Font = Enum.Font.Arial;
				Text = tostring(math.floor(g));
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 16.000
			})

			colorpicker.GOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.GVal;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Hex = library:create("TextLabel",{
				Name = "Hex";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 420, 0, 179);
				Selectable = true;
				Size = UDim2.new(0, 108, 0, 29);
				ZIndex = 5;
				Font = Enum.Font.SourceSansSemibold;
				Text = "Hex";
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 19.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.HexVal = library:create("ImageButton",{
				Name = "Value";
				Parent = colorpicker.Hex;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.342592597, 0, 0.137931034, 0);
				Size = UDim2.new(0.601851881, 0, 0.896551728, 0);
				ZIndex = 5;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.HexSub = library:create("TextBox",{
				Name = "Sub";
				Parent = colorpicker.HexVal;
				Active = false;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.5, 0);
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 6;
				Font = Enum.Font.Arial;
				Text = hx;
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 14.000
			})

			colorpicker.HexOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.HexSub;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Hue = library:create("TextLabel",{
				Name = "Hue";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 49, 0, 83);
				Size = UDim2.new(0, 171, 0, 45);
				ZIndex = 5;
				Font = Enum.Font.SourceSansSemibold;
				Text = "Hue";
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 19.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.HueVal = library:create("ImageButton",{
				Name = "Value";
				Parent = colorpicker.Hue;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.481481493, 0, 0.137931034, 0);
				Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
				ZIndex = 5;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.HueSub = library:create("TextBox",{
				Name = "Sub";
				Parent = colorpicker.HueVal;
				Active = false;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.5, 0);
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 6;
				Font = Enum.Font.Arial;
				Text = tostring(math.floor(tonumber(h)));
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 16.000
			})

			colorpicker.HueOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.HueVal;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.R = library:create("TextLabel",{
				Name = "Red";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 249, 0, 83);
				Selectable = true;
				Size = UDim2.new(0, 171, 0, 45);
				ZIndex = 5;
				Font = Enum.Font.SourceSansSemibold;
				Text = "Red";
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 19.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.RVal = library:create("ImageButton",{
				Name = "Value";
				Parent = colorpicker.R;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.555555582, 0, 0.137931034, 0);
				Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
				ZIndex = 5;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.RSub = library:create("TextBox",{
				Name = "Sub";
				Parent = colorpicker.RVal;
				Active = false;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.5, 0);
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 6;
				Font = Enum.Font.Arial;
				Text = tostring(math.floor(r));
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 16.000
			})

			colorpicker.ROutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.RVal;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Sat = library:create("TextLabel",{
				Name = "Sat";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 49, 0, 128);
				Size = UDim2.new(0, 171, 0, 45);
				ZIndex = 5;
				Font = Enum.Font.SourceSansSemibold;
				Text = "Sat";
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 19.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.SatVal = library:create("ImageButton",{
				Name = "Value";
				Parent = colorpicker.Sat;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.481481493, 0, 0.137931034, 0);
				Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
				ZIndex = 5;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.SatSub = library:create("TextBox",{
				Name = "Sub";
				Parent = colorpicker.SatVal;
				Active = false;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.5, 0);
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 6;
				Font = Enum.Font.Arial;
				Text = tostring(math.floor(tonumber(s)));
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 16.000
			})

			colorpicker.SatOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.SatVal;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Value = library:create("TextLabel",{
				Name = "Value";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 49, 0, 173);
				Size = UDim2.new(0, 171, 0, 45);
				ZIndex = 5;
				Font = Enum.Font.SourceSansSemibold;
				Text = "Value";
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 19.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			colorpicker.ValVal = library:create("ImageButton",{
				Name = "Value";
				Parent = colorpicker.Value;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.481481493, 0, 0.137931034, 0);
				Size = UDim2.new(0.388888896, 0, 0.896551728, 0);
				ZIndex = 5;
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.ValSub = library:create("TextBox",{
				Name = "Sub";
				Parent = colorpicker.ValVal;
				Active = false;
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Position = UDim2.new(0, 0, 0.5, 0);
				Selectable = false;
				Size = UDim2.new(1, 0, 1, 0);
				ZIndex = 6;
				Font = Enum.Font.Arial;
				Text = tostring(math.floor(tonumber(v)));
				TextColor3 = Color3.fromRGB(152, 152, 152);
				TextSize = 16.000
			})

			colorpicker.ValOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.ValVal;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(170, 170, 170);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.Dark = library:create("TextButton",{
				Name = "DarknessBar";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BorderSizePixel = 0;
				ClipsDescendants = true;
				Position = UDim2.new(0, 707, 0, 127);
				Size = UDim2.new(0.0380204059, 0, 0, 137);
				AutoButtonColor = false;
				Font = Enum.Font.SourceSans;
				Text = "";
				TextColor3 = Color3.fromRGB(0, 0, 0);
				TextSize = 14.000
			})

			colorpicker.DarkGrad = library:create("UIGradient",{
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(r, g, b)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))};
				Rotation = -90;
				Parent = colorpicker.Dark
			})

			colorpicker.DarkDisplay = library:create("Frame",{
				Name = "Display";
				Parent = colorpicker.Dark;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				BorderColor3 = Color3.fromRGB(0, 0, 0);
				BorderSizePixel = 2;
				Position = UDim2.new(0.5, 0, v, -1);
				Size = UDim2.new(1, 0, 0, 1)
			})

			colorpicker.Gradient = library:create("ImageButton",{
				Name = "RGB";
				Parent = colorpicker.Main;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BorderColor3 = Color3.fromRGB(40, 40, 40);
				BorderSizePixel = 0;
				Position = UDim2.new(0, 601, 0, 127);
				Size = UDim2.new(0, 135, 0, 135);
				ZIndex = 4;
				Image = "rbxassetid://1433361550";
				SliceCenter = Rect.new(10, 10, 90, 90)
			})

			colorpicker.RGBCursor = library:create("ImageLabel",{
				Name = "Cursor";
				Parent = colorpicker.Gradient;
				BackgroundColor3 = Color3.fromRGB(157, 55, 63);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(0, 0, 0);
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(0, 4, 0, 4);
				ZIndex = 9;
				Image = "rbxassetid://3570695787";
				ImageColor3 = Color3.fromRGB(157, 55, 63);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(100, 100, 100, 100)
			})

			colorpicker.RGBOutline = library:create("ImageButton",{
				Name = "Outline";
				Parent = colorpicker.Gradient;
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0.5, 0, 0.5, 0);
				Size = UDim2.new(1, 2, 1, 2);
				Image = "rbxassetid://2790382281";
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			colorpicker.RGBOutlineGrad = library:create("UIGradient",{
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))};
				Rotation = 90;
				Parent = colorpicker.RGBOutline
			})


			local Players = game:GetService("Players")
			local TextService = game:GetService("TextService")
			local UserInputService = game:GetService("UserInputService")

			--- Player ---
			local Player = Players.LocalPlayer
			local Mouse = Player:GetMouse()

			--- Data ---
			local Down = false

			--- Definitions ---
			local Abs = math.abs
			local Clamp = math.clamp
			local Floor = math.floor

			local Tonumber = tonumber

			--- Functions ---
			local function UpdateCursorPosition(h, s)
				local gradientSize = colorpicker.Gradient.AbsoluteSize
				local sizeScale = 360 / gradientSize.X
				colorpicker.RGBCursor.Position = UDim2.new(0, gradientSize.X - (tonumber(h) * 360) / sizeScale, 0, (gradientSize.Y - (tonumber(s) * 360) / sizeScale))
			end

			local function InBounds()
				local mousePosition = Vector2.new(Mouse.X, Mouse.Y)
				local gradientPosition = colorpicker.Gradient.AbsolutePosition
				local gradientSize = colorpicker.Gradient.AbsoluteSize

				return (mousePosition.X < (gradientPosition.X + gradientSize.X) and mousePosition.X > gradientPosition.X) and (mousePosition.Y < (gradientPosition.Y + gradientSize.Y) and mousePosition.Y > gradientPosition.Y)
			end

			local function SanitizeNumber(value, rgbValue, isHue)
				if value then
					value = (value ~= value and 0) or (Tonumber(value) or 0)

					if isHue then
						return Clamp(value, 0, 360)
					else
						return Clamp(value, 0, (rgbValue and 255 or 1))
					end
				end
			end

			local function UpdateColorWithRGB()
				local color = Color3.fromRGB(Tonumber(colorpicker.RSub.Text), Tonumber(colorpicker.GSub.Text), Tonumber(colorpicker.BSub.Text))
				colorpicker.Press.ImageColor3 = color
				local gradientSize = colorpicker.Gradient.AbsoluteSize
				local sizeScale = 360 / gradientSize.X
				local h,s,v = hsv(color.R,color.G,color.B)
				colorpicker.RGBCursor.Position = UDim2.new(0, gradientSize.X - (tonumber(h) * 360) / sizeScale, 0, (gradientSize.Y - (tonumber(s) * 360) / sizeScale))
				colorpicker.HueSub.Text = h; colorpicker.SatSub.Text = s; colorpicker.ValSub.Text = v;
				colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,v,0)
				return color
			end

			local function UpdateColorWithHSV()
				local color = Color3.fromHSV((Tonumber(colorpicker.HueSub.Text) or 0) / 360, Tonumber(colorpicker.SatSub.Text) or 1, Tonumber(colorpicker.ValSub.Text) or 1)
				colorpicker.Press.ImageColor3 = color
				local gradientSize = colorpicker.Gradient.AbsoluteSize
				local sizeScale = 360 / gradientSize.X
				local color = Color3.fromRGB(Tonumber(colorpicker.RSub.Text), Tonumber(colorpicker.GSub.Text), Tonumber(colorpicker.BSub.Text))
				local h,s,v = hsv(color.R,color.G,color.B)
				colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,v,0)
				colorpicker.RGBCursor.Position = UDim2.new(0, gradientSize.X - (tonumber(h) * 360) / sizeScale, 0, (gradientSize.Y - (tonumber(s) * 360) / sizeScale))
				return color
			end

			local function UpdateFillIns(color)
				if color then
					local h, s, v = hsv(color.r,color.g,color.b)
					local r, g, b = Floor(color.r * 255 + 0.5), Floor(color.g * 255 + 0.5), Floor(color.b * 255 + 0.5)

					colorpicker.HueSub.Text = Floor(h + 0.5)
					colorpicker.SatSub.Text = Floor(s + 0.5)
					colorpicker.ValSub.Text = Floor(v * 1000 + 0.5) / 1000

					colorpicker.RSub.Text = r
					colorpicker.GSub.Text = g
					colorpicker.BSub.Text = b

					colorpicker.HexSub.Text = RGBToHex(r, g, b)
					UpdateCursorPosition(h, s)
				end
			end

			local function inBounds(frame)
				local x,y = Mouse.X - frame.AbsolutePosition.X,Mouse.Y - frame.AbsolutePosition.Y
				local maxX,maxY = frame.AbsoluteSize.X,frame.AbsoluteSize.Y
				if x >= 0 and y >= 0 and x <= maxX and y <= maxY then
					return x/maxX,y/maxY
				end
			end

			local x,y = inBounds(colorpicker.Dark)
			if x and y then
				colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,y,0)
				colorpicker.ValSub.Text = tostring(1 - y)
				UpdateColorWithHSV()
			end

			local function GetColor()
				if InBounds() then
					local gradientSize = colorpicker.Gradient.AbsoluteSize
					UserInputService.MouseIconEnabled = false

					local sizeScale = 360 / gradientSize.X
					local offset = Vector2.new(Mouse.X, Mouse.Y+10) - (colorpicker.Gradient.AbsolutePosition + gradientSize / 2)

					local hue = Abs((offset.X * sizeScale - 180) / 360)
					local saturation = Abs((offset.Y * sizeScale - 180) / 360)
					local color = Color3.fromHSV(hue, saturation, 1)

					colorpicker.Press.ImageColor3 = color
					colorpicker.RGBCursor.Position = UDim2.new(0, Clamp(offset.X + gradientSize.X / 2, 0, gradientSize.X), 0, Clamp(offset.Y + gradientSize.Y / 2, 0, gradientSize.Y))

					return color
				else
					Down = false
				end

				UserInputService.MouseIconEnabled = true
				return nil
			end

			--- Execution ---
			colorpicker.Gradient.MouseButton1Down:Connect(function()
				UpdateFillIns(GetColor())
				Down = true
			end)

			Mouse.Move:Connect(function()
				if Down then
					UpdateFillIns(GetColor())
				else
					UserInputService.MouseIconEnabled = true
				end
			end)

			colorpicker.Gradient.MouseButton1Up:Connect(function()
				Down = false
			end)

			do -- Fill In Events
				local R = colorpicker.RSub
				local G = colorpicker.GSub
				local B = colorpicker.BSub

				local H = colorpicker.HueSub
				local S = colorpicker.SatSub
				local V = colorpicker.ValSub

				local Hex = colorpicker.HexSub

				do -- RGB
					R:GetPropertyChangedSignal("Text"):Connect(function()
						local text = R.Text

						if #text ~= 0 then
							if tonumber(text) > 255 then text = 255 end if tonumber(text) < 0 then text = 0 end
							R.Text = SanitizeNumber(text, true)
							UpdateFillIns(UpdateColorWithRGB())
						end
					end)

					G:GetPropertyChangedSignal("Text"):Connect(function()
						local text = G.Text

						if #text ~= 0 then
							if tonumber(text) > 255 then text = 255 end if tonumber(text) < 0 then text = 0 end
							G.Text = SanitizeNumber(text, true)
							UpdateFillIns(UpdateColorWithRGB())
						end
					end)

					B:GetPropertyChangedSignal("Text"):Connect(function()
						local text = B.Text

						if #text ~= 0 then
							if tonumber(text) > 255 then text = 255 end if tonumber(text) < 0 then text = 0 end
							B.Text = SanitizeNumber(text, true)
							UpdateFillIns(UpdateColorWithRGB())
						end
					end)
				end

				do -- HSV
					H.FocusLost:Connect(function(enterPressed)
						if enterPressed then
							local text = H.Text

							if #text ~= 0 then
								if tonumber(text) > 239 then text = 239 end if tonumber(text) < 0 then text = 0 end
								H.Text = SanitizeNumber(text, false, true)
								UpdateFillIns(UpdateColorWithHSV())
							end
						end
					end)

					S.FocusLost:Connect(function(enterPressed)
						if enterPressed then
							local text = S.Text

							if #text ~= 0 then
								if tonumber(text) > 1 then text = 1 end if tonumber(text) < 0 then text = 0 end
								S.Text = SanitizeNumber(text, false)
								UpdateFillIns(UpdateColorWithHSV())
							end
						end
					end)

					V.FocusLost:Connect(function(enterPressed)
						if enterPressed then
							local text = V.Text

							if #text ~= 0 then
								if tonumber(text) > 1 then text = 1 end if tonumber(text) < 0 then text = 0 end
								V.Text = SanitizeNumber(text, false)
								UpdateFillIns(UpdateColorWithHSV())
								colorpicker.Dark:WaitForChild("Display").Position = UDim2.new(0.5,0,text,0)
							end
						end
					end)
				end

				Hex:GetPropertyChangedSignal("Text"):Connect(function()
					local text = Hex.Text

					if #text ~= 0 then
						local index = 0
						local s, e = text:find("#")

						text = text:gsub("#", function()
							index = index + 1

							if s == 1 then
								return index == 1 and "#" or ""
							else
								return ""
							end
						end)

						if text:find("#") ~= 1 then
							text = "#" .. text
						end

						Hex.Text = text
					end
				end)

				Hex.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local function HexToRGB(hex)
							hex = hex:sub(2):upper()

							if #hex == 3 then
								local f, s, t = hex:sub(1, 1), hex:sub(2, 2), hex:sub(3, 3)
								return hex, tonumber(f .. f, 16), tonumber(s .. s, 16), tonumber(t .. t, 16)
							elseif #hex == 6 then
								return hex, tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
							elseif #hex ~= 3 and #hex < 6 then
								hex = hex .. string.rep("0", 6 - #hex)
								return hex, tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
							end
						end
						local hex, r, g, b = HexToRGB(Hex.Text)
						local h, s, v = Color3.toHSV(Color3.fromRGB(r, g, b))

						Hex.Text = hex
						UpdateFillIns(Color3.fromRGB(r, g, b))
					end
				end)
			end

			colorpicker.Main.MouseEnter:Connect(function()
				tween(colorpicker.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
			end)
			colorpicker.Main.MouseLeave:Connect(function()
				tween(colorpicker.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
			end)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return colorpicker;
		end

		function Sub:Section(name,description,image,IRO,IRS)
			IRO = Vector2.new(IRO:match("(.+), (.+)")) or Vector2.new(0, 0);
			IRS = Vector2.new(IRS:match("(.+), (.+)")) or Vector2.new(0, 0);
			image = image or "rbxassetid://3926305904";

			local section = {};

			section.SectionHolder = library:create("Frame",{
				Name = "SectionHolder";
				Parent = Sub.SubTab;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.0000;
				BorderSizePixel = 0;
				ClipsDescendants = true;
				Position = UDim2.new(0, 0, 0.253818899, 0);
				Size = UDim2.new(0, 788, 0, 67)
			})

			section.Main = library:create("ImageButton",{
				Name = "Section";
				Parent = section.SectionHolder;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Size = UDim2.new(0, 788, 0, 67);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			section.Image = library:create("ImageButton",{
				Name = "img";
				Parent = section.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0.0215736032, 0, 0.25373134, 0);
				Size = UDim2.new(0, 32, 0, 32);
				ZIndex = 2;
				Image = image;
				ImageRectOffset = IRO;
				ImageRectSize = IRS
			})

			section.Title = library:create("TextLabel",{
				Name = "Title";
				Parent = section.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 4);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = name;
				TextColor3 = Color3.fromRGB(255, 255, 255);
				TextSize = 17.000;
				TextXAlignment = Enum.TextXAlignment.Left
			})

			section.Description = library:create("TextLabel",{
				Name = "Description";
				Parent = section.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderSizePixel = 0;
				Position = UDim2.new(0, 67, 0, 39);
				Size = UDim2.new(0, 376, 0, 35);
				Font = Enum.Font.ArialBold;
				Text = description;
				TextColor3 = Color3.fromRGB(216, 216, 216);
				TextSize = 14.000;
				TextXAlignment = Enum.TextXAlignment.Left;
				TextYAlignment = Enum.TextYAlignment.Top
			})

			section.Open = library:create("ImageButton",{
				Name = "Open";
				Parent = section.Main;
				BackgroundTransparency = 1.000;
				LayoutOrder = 15;
				Position = UDim2.new(0, 751, 0, 19);
				Rotation = 180.000;
				Size = UDim2.new(0, 26, 0, 26);
				ZIndex = 2;
				Image = "http://www.roblox.com/asset/?id=1902936388"
			})

			section.Holder = library:create("ImageButton",{
				Name = "Holder";
				Parent = section.Main;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				BorderColor3 = Color3.fromRGB(27, 42, 53);
				Position = UDim2.new(0, 0, 1, 1);
				Size = UDim2.new(1, 0, 0, 53);
				Image = "rbxassetid://2790382281";
				ImageColor3 = Color3.fromRGB(43, 43, 43);
				ScaleType = Enum.ScaleType.Slice;
				SliceCenter = Rect.new(4, 4, 252, 252)
			})

			section.Held = library:create("Frame",{
				Name = "Held";
				Parent = section.Holder;
				BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				BackgroundTransparency = 1.000;
				Size = UDim2.new(1, 0, 1, 0)
			})

			section.HeldList = library:create("UIListLayout",{
				Parent = section.Held;
				SortOrder = Enum.SortOrder.LayoutOrder;
				Padding = UDim.new(0, 3);
				VerticalAlignment = Enum.VerticalAlignment.Center
			})

			function section:Button(name,clicktext,callback)
				callback = callback or function() end;

				local button = {};

				button.Main = library:create("ImageButton",{
					Name = "Button";
					Parent = section.Held;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderColor3 = Color3.fromRGB(27, 42, 53);
					Position = UDim2.new(0, 0, 1, 1);
					Size = UDim2.new(1, 0, 0, 53);
					Image = "rbxassetid://2790382281";
					ImageColor3 = Color3.fromRGB(43, 43, 43);
					ScaleType = Enum.ScaleType.Slice;
					SliceCenter = Rect.new(4, 4, 252, 252)
				})

				button.Title = library:create("TextLabel",{
					Name = "Title";
					Parent = button.Main;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderSizePixel = 0;
					Position = UDim2.new(0, 16, 0, 8);
					Size = UDim2.new(0, 376, 0, 35);
					Font = Enum.Font.ArialBold;
					Text = name;
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextSize = 15.000;
					TextXAlignment = Enum.TextXAlignment.Left
				})

				button.Press = library:create("ImageButton",{
					Name = "Press";
					Parent = button.Main;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderColor3 = Color3.fromRGB(27, 42, 53);
					Position = UDim2.new(0, 625, 0, 11);
					Size = UDim2.new(0, 133, 0, 30);
					ZIndex = 2;
					Image = "rbxassetid://2790382281";
					ImageColor3 = Color3.fromRGB(43, 43, 43);
					ScaleType = Enum.ScaleType.Slice;
					SliceCenter = Rect.new(4, 4, 252, 252)
				})

				button.Outline = library:create("ImageButton",{
					Name = "Outline";
					Parent = button.Press;
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderColor3 = Color3.fromRGB(27, 42, 53);
					Position = UDim2.new(0.5, 0, 0.5, 0);
					Size = UDim2.new(1, 2, 1, 2);
					Image = "rbxassetid://2790382281";
					ImageColor3 = Color3.fromRGB(170, 170, 170);
					ScaleType = Enum.ScaleType.Slice;
					SliceCenter = Rect.new(4, 4, 252, 252)
				})

				button.BTNText = library:create("TextLabel",{
					Name = "BTNText";
					Parent = button.Press;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					Size = UDim2.new(1, 0, 1, 0);
					ZIndex = 3;
					Font = Enum.Font.ArialBold;
					Text = clicktext;
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextSize = 16.000
				})

				local held = false;
				button.Main.MouseButton1Down:Connect(function()
					held = true;
					tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
				end)
				button.Main.MouseButton1Up:Connect(function()
					if held then
						tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
						library:ripple(button.Outline)
						callback()
					end
				end)
				button.Main.MouseEnter:Connect(function()
					tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
				end)
				button.Main.MouseLeave:Connect(function()
					held = false;
					tween(button.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				end)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

				return button;
			end
			
			function section:Text(text,align)
				align = align or Enum.TextXAlignment.Center
				
				local txt = {}

				txt.Main = library:create("TextLabel",{
					Name = "Text";
					Parent = section.Held;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					Position = UDim2.new(0, 0, 0.70247072, 0);
					TextXAlignment = align;
					Size = UDim2.new(0, 788, 0, 24);
					Font = Enum.Font.ArialBold;
					Text = text;
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextSize = 17.000
				})

				function txt:Set(val)
					txt.Main.Text = val;
				end
				section.Holder.Size = UDim2.new(0,788,0,section.HeldList.AbsoluteContentSize.Y+8);

			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);
				return txt;
			end

			function section:Toggle(name,default,callback)
				default = default or false;
				callback = callback or function() end;

				local toggle = {value = default}

				toggle.Main = library:create("ImageButton",{
					Name = "Toggle";
					Parent = section.Held;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderColor3 = Color3.fromRGB(27, 42, 53);
					Position = UDim2.new(0, 0, 1, 1);
					Size = UDim2.new(0, 788, 0, 53);
					Image = "rbxassetid://2790382281";
					ImageColor3 = Color3.fromRGB(43, 43, 43);
					ScaleType = Enum.ScaleType.Slice;
					ClipsDescendants = true;
					SliceCenter = Rect.new(4, 4, 252, 252)
				})

				toggle.Description = library:create("TextLabel",{
					Name = "Description";
					Parent = toggle.Main;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderSizePixel = 0;
					Position = UDim2.new(0.0709927827, 0, 0.13491787, 0);
					Size = UDim2.new(0, 376, 0, 35);
					Font = Enum.Font.ArialBold;
					Text = name;
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextSize = 15.000;
					TextXAlignment = Enum.TextXAlignment.Left
				})

				toggle.Box = library:create("ImageButton",{
					Name = "Box";
					Parent = toggle.Main;
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderColor3 = Color3.fromRGB(27, 42, 53);
					Position = UDim2.new(0, 20, 0, 13);
					Size = UDim2.new(0, 23, 0, 23);
					ZIndex = 2;
					Image = "rbxassetid://2790382281";
					ImageColor3 = Color3.fromRGB(43, 43, 43);
					ScaleType = Enum.ScaleType.Slice;
					SliceCenter = Rect.new(4, 4, 252, 252)
				})

				toggle.Check = library:create("ImageButton",{
					Name = "Check";
					Parent = toggle.Box;
					Active = false;
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					Position = UDim2.new(0, 11, 0, 11);
					Selectable = false;
					Size = UDim2.new(0.6, 0, 0.6, 0);
					Visible = true;
					ImageTransparency = 1;
					ZIndex = 3;
					Image = "http://www.roblox.com/asset/?id=1489284025"
				})

				toggle.Outline = library:create("ImageButton",{
					Name = "Outline";
					Parent = toggle.Box;
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					BackgroundTransparency = 1.000;
					BorderColor3 = Color3.fromRGB(27, 42, 53);
					Position = UDim2.new(0, 12, 0, 11);
					Size = UDim2.new(0, 25, 0, 25);
					Image = "rbxassetid://2790382281";
					ImageColor3 = Color3.fromRGB(170, 170, 170);
					ScaleType = Enum.ScaleType.Slice;
					SliceCenter = Rect.new(4, 4, 252, 252)
				})

				function toggle:Set(value)
					toggle.value = value
					if value then
						tween(toggle.Check,0.2,{ImageTransparency = 0});
						callback(true)
					else
						tween(toggle.Check,0.2,{ImageTransparency = 1});
						callback(false)
					end
				end

				local held = false;
				toggle.Main.MouseButton1Down:Connect(function()
					held = true;
					tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(100,100,100)})
				end)
				toggle.Main.MouseButton1Up:Connect(function()
					if held then
						tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
						toggle:Set(not toggle.value)
					end
				end)
				toggle.Main.MouseEnter:Connect(function()
					tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
				end)
				toggle.Main.MouseLeave:Connect(function()
					held = false;
					tween(toggle.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				end)


			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

				return toggle;
			end

			local held = false;
			section.Main.MouseButton1Down:Connect(function()
				held = true;
				tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(170,170,170)})
			end)
			section.Main.MouseButton1Up:Connect(function()
				if held then
					tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
					if section.Open.Rotation == 180 then
						tween(section.SectionHolder,0.3,{Size = UDim2.new(0, 788, 0, section.HeldList.AbsoluteContentSize.Y+77)})
						tween(Sub.SubTab,0.3,{CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y)})
						tween(section.Open,0.3,{Rotation = 0})
					else
						tween(section.SectionHolder,0.3,{Size = UDim2.new(0, 788, 0, 67)})
						tween(Window.Container,0.3,{CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y)})
						tween(Sub.SubTab,0.3,{CanvasSize = UDim2.new(0,0,0,Window.ContainerList.AbsoluteContentSize.Y)})
						tween(section.Open,0.3,{Rotation = 180})
					end
					held = false;
				end
			end)
			section.Main.MouseEnter:Connect(function()
				tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(63,63,63)})
			end)
			section.Main.MouseLeave:Connect(function()
				tween(section.Main,0.2,{ImageColor3 = Color3.fromRGB(43, 43, 43)});
				held = false;
			end)

			Sub.SubTab.CanvasSize = UDim2.new(0,0,0,Sub.SubTabList.AbsoluteContentSize.Y);

			return section;

		end

		return Sub;

	end

	function Window:Activate()
		Window.SideTab.ImageColor3 = Color3.fromRGB(45, 45, 45);
		Window.Holder.Visible = true;
		Window.SideTabSide.Visible = true;
		library.active = name
	end
	return Window;
end

local Size = workspace.CurrentCamera.ViewportSize - Vector2.new(5,30)
local lasty = 40;
local texts = {};
function library:List(name,enabled)
	local Lister = {}

    Lister.text = Drawing.new("Text");
    Lister.text.Text = name;
	Lister.text.Size = 20;
	Lister.text.Center = false;
	Lister.text.Outline = true;
	Lister.text.Color = Color3.fromRGB(170,170,170);
	Lister.text.Font = 2;
	Lister.text.Visible = enabled;
	Lister.text.Position = Vector2.new(Size.X - Lister.text.TextBounds.X, lasty + Lister.text.TextBounds.Y);

    Lister.side = Drawing.new("Line");
	Lister.side.Thickness = 2;
	Lister.side.From = Vector2.new(Size.X - Lister.text.TextBounds.X - 4,(lasty+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y);
	Lister.side.To = Vector2.new(Size.X - Lister.text.TextBounds.X - 4,(lasty+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y*2);
	Lister.side.Visible = enabled;

    Lister.bottom = Drawing.new("Line");
	Lister.bottom.Thickness = 2;
	Lister.bottom.From = Vector2.new(Size.X - Lister.text.TextBounds.X - 4,(lasty+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y*2);
	Lister.bottom.To = Vector2.new(Size.X,(40+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y*2);
	Lister.bottom.Visible = enabled;

	table.insert(texts,Lister);

	local n = {};

	for i,v in pairs(texts) do
	 if v.text.Visible then
	  table.insert(n,v);
	 end
	end

	  table.sort(n,function(a,b) return a.text.TextBounds.X+4 > b.text.TextBounds.X+4 end)
    lasty = 40;
    for i,v in pairs(n) do
     v.text.Position = Vector2.new(Size.X - v.text.TextBounds.X, lasty + v.text.TextBounds.Y);
     v.side.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)));
	 v.side.To = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
	 v.bottom.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
	 if n[i+1] ~= nil then
	  v.bottom.To = Vector2.new(Size.X - n[i+1].text.TextBounds.X - 4,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
     else
      v.bottom.To = Vector2.new(Size.X,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
     end
     lasty = lasty + v.text.TextBounds.Y
    end

	function Lister:Set(arg)
		local old;
		if type(arg) == "boolean" then
			old = Lister.text.Visible;
			Lister.text.Visible = arg;
			Lister.side.Visible = arg;
			Lister.bottom.Visible=arg;
		else
			old = Lister.text.Text;
			Lister.text.Text = arg;
		end

		if type(old) == "boolean" then if Lister.text.Visible == old then return elseif Lister.text.Text == old then return end end

		local n = {};

    	for i,v in pairs(texts) do
    	 if v.text.Visible then
    	  table.insert(n,v);
    	 end
    	end

    	table.sort(n,function(a,b) return a.text.TextBounds.X+4 > b.text.TextBounds.X+4 end)
        lasty = 40;
        for i,v in pairs(n) do
         v.text.Position = Vector2.new(Size.X - v.text.TextBounds.X, lasty + v.text.TextBounds.Y);
         v.side.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)));
    	 v.side.To = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
    	 v.bottom.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
    	 if n[i+1] ~= nil then
    	  v.bottom.To = Vector2.new(Size.X - n[i+1].text.TextBounds.X - 4,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
         else
          v.bottom.To = Vector2.new(Size.X,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
         end
         lasty = lasty + v.text.TextBounds.Y
        end
	end

	return Lister;
end
return library;
