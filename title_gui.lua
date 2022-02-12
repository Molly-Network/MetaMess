-- Font setup
surface.CreateFont("MollyHeader", {
	font = "Segoe UI Black", 
	extended = false,
	size = 32,
	weight = 500,
})

surface.CreateFont("MollySubheader", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 20,
	weight = 500,
})

surface.CreateFont("MollyButton", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 20,
	weight = 500,
})

surface.CreateFont("MollyHeader2", {
	font = "Segoe UI Bold", 
	extended = false,
	size = 30,
	weight = 500,
})

surface.CreateFont("MollySmallButton", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 16,
	weight = 500,
})

-- Colors
local ColorBlue = Color(0, 123, 255, 255)
local ColorRed = Color(220, 53, 69, 255)
local ColorGreen = Color(32, 201, 151, 255)
local ColorWhite = Color(255, 255, 255, 255)
local ColorOffGrey = Color(126, 130, 153, 255)
local ColorDarkRed = Color(255,0,0,100)
local ColorDark = Color(32, 32, 32, 255)
local ColorExtraDark = Color(26, 26, 26, 255)
local ColorLightDark = Color(37, 37, 37, 255)

-- Default values 
local Version = "2.0.0"
local TimeStamp = "Sussy Edition"
local GUITitle = "Title GUI"
local mark = {}
local lastText = ""
local ColorCache = Color(255,192,203)
local Titles = {}
local EditMode = false
local ActiveLine = nil
local DefaultTime = 4
local Info = [[
Heres some info to get you started on your title adventrue

1. Right click on the list items for options.
2. Double clicking list items will set them to edit mode.
3. You can delete items by right clicking on them and pressing 
delete or you could edit them then press the "Delete" button.
4. You can add a color by pressing on the colored square and
selecting a color, then pressing the "Colour" Button
5. You can load and save multiple title sets incase you want
more than one set of titles.

Stay Sussy - DuckDuckGo x Henke
]] 

-- save to table function
local function SaveTable(filename)
	local temp = util.TableToJSON( Titles )
	file.Write(filename, temp)
end

-- read table function
local function ReadTable(filename)
	temp = file.Read( "meta_titles_cache/" .. filename, "DATA" )
	Titles = util.JSONToTable( temp )
end

-- used for animation
local function inQuad(fraction, beginning, change)
	return change * (fraction ^ 2) + beginning
end

-- Custom icon buttons
local function StyleButton(Perent,Icon,Text,ColorNormal,ColorHovered)
	local Button = vgui.Create("DButton",Perent)
	Button:SetSize(110,42)
	Button:SetText("")
	Button.Paint = function(self,w,h)
		-- Background
		if (self:IsDown()) then
			draw.RoundedBox(10,0,0,w,h,ColorNormal)
		elseif(self:IsHovered()) then
			draw.RoundedBox(10,1,1,w-2,h-2,ColorHovered)
		else
			draw.RoundedBox(10,0,0,w,h,ColorNormal)
		end
		-- Icon
		surface.SetDrawColor(ColorWhite)
		surface.SetMaterial(Icon)
		surface.DrawTexturedRect(9,9,24,24)
		--Text
		draw.SimpleText(Text,"MollyButton",w-40,h/2,ColorWhite,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	return Button
end

-- Info and close buttons
local function SmallButton(Perent,Text,ColorNormal,ColorHovered)
	local ButtonMain = vgui.Create("DButton",Perent)
	ButtonMain:SetSize(17,16)
	ButtonMain:SetText("")
	ButtonMain.Paint = function(self,w,h)
		-- Background
		if (self:IsDown()) then
			draw.RoundedBox(4,0,0,w,h,ColorNormal)
		elseif(self:IsHovered()) then
			draw.RoundedBox(4,0,0,w,h,ColorHovered)
		else
			draw.RoundedBox(4,0,0,w,h,ColorNormal)
		end
		--Text
		draw.SimpleText(Text,"MollySmallButton",w/2,h/2,ColorWhite,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	return ButtonMain
end

-- Custom text entry
local function StyleTextEntry(Perent,Width,Placeholder)
	local Base = vgui.Create("DPanel",Perent)
	Base:SetSize(Width,42)
	Base.Paint = function(self,w,h)
		draw.RoundedBox(10,0,0,w,h,ColorLightDark)
	end
	
	local x,y =Base:GetSize()
	
	local TextEntry = vgui.Create("DTextEntry",Base)
	TextEntry:SetSkin("Default")
	TextEntry:SetSize(x-20,y-20)
	TextEntry:SetPos(10,9)
	TextEntry:SetPlaceholderText(Placeholder)
	TextEntry:SetFont("MollySubheader")
	TextEntry:SetTextColor(ColorWhite)
	TextEntry:SetPlaceholderColor(ColorOffGrey)
	TextEntry:SetPaintBackground( false )
	TextEntry:SetCursorColor(ColorBlue)
	
	return TextEntry,Base
end

-- Little animated notifications
local function MollyNote(parent, text,color )
	local LoginPanelW,LoginPanelH = parent:GetSize()
	local Notification = vgui.Create("DPanel", parent)
	Notification:SetMouseInputEnabled(false)
	Notification:SetPos(90, LoginPanelH-55)
	Notification:SetSize(LoginPanelW-180, 55)
	Notification.Paint = function ( self,w,h )
		draw.RoundedBoxEx(10, 0, 0, w, 55, color,true,true,false,false)
		draw.DrawText(text, "MollyButton", w/2, h/2-13, ColorWhite, TEXT_ALIGN_CENTER)
	end

	local AnimationUp = Derma_Anim("EaseInQuadUp", Notification , function(pnl, anim, delta, data)
		pnl:SetPos(90, inQuad(delta, LoginPanelH, -55))
	end)

	local AnimationDown = Derma_Anim("EaseInQuadDown", Notification , function(pnl, anim, delta, data)
	pnl:SetPos(90, inQuad(delta, LoginPanelH-55, LoginPanelH))
	end)

	AnimationUp:Start(1)
	timer.Simple(2, function() AnimationDown:Start(2) end)
	Notification.Think = function(self)
		if AnimationUp:Active() then
			AnimationUp:Run()
		end
		if AnimationDown:Active() then
			AnimationDown:Run()
		end
	end
end

-- Text input function [Creates frame for save as function to get file name]
local function TextPopup()
	local Frame = vgui.Create("DFrame")
	Frame:SetSize(370,82)
	Frame:Center()
	Frame:SetTitle(" ")
	Frame:ShowCloseButton(false)
	Frame:MakePopup()
	Frame.Paint = function(self,w,h)
		draw.RoundedBox(10, 0, 0, w, h, ColorDark)
	end
	
	local Text,Body = StyleTextEntry(Frame,245,"Filename")
	Body:SetPos(6,32)
	
	local Save = StyleButton(Frame,Material("icon16/page_go.png"),"Save",ColorExtraDark,ColorBlue)
	Save:SetPos(255,32)
	
	local Close = SmallButton(Frame,"X",ColorRed,ColorDarkRed)
	Close:SetPos(Frame:GetWide()-24,6)
	Close.DoClick = function()
		Frame:Close()
	end
	
	return Save,Text,Frame
end

-- Popup to make sure the user wants to get rid of there titles
local function ConfirmPopup()
	local Frame = vgui.Create("DFrame")
	Frame:SetSize(272,77)
	Frame:Center()
	Frame:SetTitle(" ")
	Frame:ShowCloseButton(false)
	Frame:MakePopup()
	Frame.Paint = function(self,w,h)
		draw.RoundedBox(10, 0, 0, w, h, ColorDark)
		surface.SetFont("MollyHeader2")
		surface.SetTextColor(ColorWhite)
		surface.SetTextPos(6,31)
		surface.DrawText("Clear all titles?")
	end
	
	local Yes = StyleButton(Frame,Material("icon16/tick.png"),"Yes",ColorExtraDark,ColorBlue)
	Yes:SetPos(156,27)
	
	local Close = SmallButton(Frame,"X",ColorRed,ColorDarkRed)
	Close:SetPos(Frame:GetWide()-24,6)
	Close.DoClick = function()
		Frame:Close()
	end
	
	return Yes,Frame
end

CreateClientConVar( "title_gui_size_w", 800,true,false,"Set Width of title gui",715)
local ConWidth =  GetConVar( "title_gui_size_w" )
CreateClientConVar( "title_gui_size_h", 550,true,false,"Set Hight of title gui",300)
local ConHight =  GetConVar( "title_gui_size_h" )

-- allows a user to add a title using commands, wont allow to set delay
concommand.Add("title_add",function(ply, cmd, args,test)
		ReadTable("autoload.json")
		table.insert( Titles, {[1] = test,[2] = 4} )
		SaveTable("meta_titles_cache/autoload.json")
		hook.Run("Title_Updated", Titles)
		print("Added title: " .. test)
end)

-- creates con command to open the frame
concommand.Add("title_gui",function()
	-- Checks if defulte file is in data folder, if not creates the file
	if file.Exists( "meta_titles_cache/autoload.json", "DATA" ) == false then
		file.CreateDir( "meta_titles" )
		file.CreateDir( "meta_titles_cache" )
		SaveTable("meta_titles_cache/autoload.json")
	end

	ReadTable("autoload.json")

	-- added to prevent bug 
	EditMode = false

	-- Main frame
	local Frame = vgui.Create("DFrame")
	Frame:SetSize(ConWidth:GetInt(),ConHight:GetInt())
	Frame:Center()
	Frame:MakePopup()
	Frame:SetTitle(" ")
	Frame:ShowCloseButton(false)
	Frame:SetSizable(true)
	Frame.Paint = function ( self,w,h )
	
		surface.SetFont("MollySubheader")
	
		local VersionLength = surface.GetTextSize("Version ") + surface.GetTextSize(Version)
	
		-- Background
		draw.RoundedBoxEx(10, 0, 0, w/2, h, ColorExtraDark, true, false, true, false)
		draw.RoundedBoxEx(10, w/2, 0, w/2, h, ColorLightDark, false, true, false, true)
	
		-- Header text
		surface.SetFont("MollyHeader")
		surface.SetTextColor(ColorWhite)
		surface.SetTextPos(10, 6)
		surface.DrawText(GUITitle)
	
		-- Version subheader
		surface.SetFont("MollySubheader")
		surface.SetTextColor(ColorBlue)
		surface.SetTextPos(10, 32)
		surface.DrawText("Version " .. Version)
	
		-- Timestamp subheader
		surface.SetFont("MollySubheader")
		surface.SetTextColor(Color(63, 66, 84, 255))
		surface.SetTextPos(15 + VersionLength, 32)
		surface.DrawText(TimeStamp)
	end
	
	local FrameW,FrameH = Frame:GetSize()

	-- Main panel for DListView
	local Image = vgui.Create("DPanel", Frame)
	Image:SetSize(FrameW/2-20, FrameH-110)
	Image:SetPos(10, 55)
	Image.Paint = function(self,w,h)
		draw.RoundedBox(10, 0,0,w,h, ColorLightDark)
	end
	
	-- DListView 
	local TitleList = vgui.Create( "DListView", Image )
	TitleList:Dock(FILL)
	TitleList:DockMargin(0,0,-1,0)
	TitleList:SetMultiSelect(false)
	TitleList:AddColumn("Position")
	TitleList:AddColumn("Text")
	TitleList:AddColumn("Delay")
	TitleList.Paint = nil
	
	-- for loop to set text color for the coloms
	for i=1,3 do
		TitleList.Columns[i].Header:SetTextColor(ColorWhite)
	end
	
	-- DListView header paint [have to use 3 diffrent ones as each one uses a diffrent type of rounded box]
	TitleList.Columns[1].Header.Paint = function(self,w,h)
		if (self:IsDown()) then
			draw.RoundedBoxEx(10,1,0,w,h,ColorBlue,true)
		elseif(self:IsHovered()) then
			draw.RoundedBoxEx(10,1,0,w,h,ColorOffGrey,true)
		else
			draw.RoundedBoxEx(10,1,0,w,h,ColorBlue,true)
		end
	end

	TitleList.Columns[2]:SetWidth( 250 )
	TitleList.Columns[2].Header.Paint = function(self,w,h)
		if (self:IsDown()) then
		    surface.SetDrawColor(ColorBlue)
		    surface.DrawRect(1,0, w,h)
		elseif(self:IsHovered()) then
			surface.SetDrawColor(ColorOffGrey)
			surface.DrawRect(1,0, w,h)
		else
			surface.SetDrawColor(ColorBlue)
			surface.DrawRect(1,0, w,h)
		end
	end
	
	TitleList.Columns[3].Header.Paint = function(self,w,h)
		if (self:IsDown()) then
			draw.RoundedBoxEx(10,1,0,w-1,h,ColorBlue,false,true)
		elseif(self:IsHovered()) then
			draw.RoundedBoxEx(10,1,0,w-1,h,ColorOffGrey,false,true)
		else
			draw.RoundedBoxEx(10,1,0,w-1,h,ColorBlue,false,true)
		end
	end
	
	-- title refresh function [Delets and reads the title to DlistView] 
	local function TitleListRefresh()
		TitleList:Clear()
		for k,v in ipairs(Titles) do
			TitleList:AddLine(k,v[1],v[2])
			TitleList.Lines[k]:SetTooltip(TitleList.Lines[k].Columns[2]:GetValue())
			for i=1,3 do
				TitleList.Lines[k].Columns[i]:SetTextColor(ColorWhite)
			end
		end
	end
	
	TitleListRefresh()

	-- main panle of the right	
	local LoginPanel = vgui.Create("DPanel", Frame)
	LoginPanel:SetSize(FrameW/2, FrameH-10)
	LoginPanel:SetPos(FrameW/2, 10)
	LoginPanel.Paint = function (self,w,h)
		if EditMode then
		draw.DrawText("Editing Line " .. ActiveLine, "MollyHeader2", 10, -4, ColorWhite)
		draw.DrawText("Use the options to edit the title", "MollyButton", 10, 22, ColorOffGrey)
		else
		draw.DrawText("Add a Title", "MollyHeader2", 10, -4, ColorWhite)
		draw.DrawText("Use the options to create a title", "MollyButton", 10, 22, ColorOffGrey)
		end
	end

	local Close = SmallButton(Frame,"X",ColorRed,ColorDarkRed)
	Close:SetPos(FrameW-24,6)
	Close.DoClick = function()
		Frame:Close()
	end
	
	-- Information button [Opens a frame with information on how to use the panel]
	local InfoButton = SmallButton(Frame,"?",ColorBlue,Color(80,150,255,100))
	InfoButton:SetPos(FrameW-44,6)
	InfoButton.DoClick = function()
		local Frame = vgui.Create("DFrame")
		Frame:SetSize(450,350)
		Frame:Center()
		Frame:SetTitle(" ")
		Frame:ShowCloseButton(false)
		Frame:MakePopup()
		Frame.Paint = function(self,w,h)
			draw.RoundedBox(10, 0, 0, w, h, ColorDark)

			surface.SetFont("MollyHeader")
			surface.SetTextColor(ColorWhite)
			surface.SetTextPos(10, 6)
			surface.DrawText("Information")
	
			surface.SetFont("MollySubheader")
			surface.SetTextColor(ColorBlue)
			surface.SetTextPos(10, 30)
			surface.DrawText("Now less useful!")
		end
		
		local DLabel = vgui.Create( "DLabel", Frame )
		DLabel:SetFont("MollyButton")
		DLabel:SetTextColor(ColorWhite)
		DLabel:SetText(Info)
		DLabel:Dock(FILL)
		DLabel:DockMargin(8,30,0,0)

		local Close = SmallButton(Frame,"X",ColorRed,ColorDarkRed)
		Close:SetPos(Frame:GetWide()-24,6)
		Close.DoClick = function()
			Frame:Close()
		end

	end

	local LoginPanelW,LoginPanelH = LoginPanel:GetSize()
	
	-- creates the panle on the right
	local EditPanel = vgui.Create("DPanel", LoginPanel)
	EditPanel:SetSize(LoginPanelW-20, LoginPanelH-100)
	EditPanel:SetPos(10, 45)
	EditPanel.Paint = function(self,w,h)
		draw.RoundedBox(10, 0,0,w,h, ColorExtraDark)
		draw.RoundedBox(10, 6,h/2+25,w-12,h/2-30, Color(37,37,37, 255))
	end
	
	local EditPanelW,EditPanelH = EditPanel:GetSize()
	
	local CaretPos = nil
	-- Text entry [used to set the title text]
	local TextEntry,TextMain = StyleTextEntry(EditPanel,EditPanelW-12,"Title Text")
	TextMain:SetPos(6,6)
	TextMain:SetSize(EditPanelW-12,EditPanelH/2-31)
	local XEntry,YEntry = TextMain:GetSize()
	TextEntry:SetSize(XEntry-20,YEntry-20)
	TextEntry:SetMultiline(true)
	TextEntry.OnLoseFocus = function( self )
		CaretPos = self:GetCaretPos()
	end
	
	-- Delay entry [locked to numerical used to input delay] 
	local DelayEntry,DelayMain = StyleTextEntry(EditPanel,EditPanelW-126,"Delay [Seconds]")
	DelayMain:SetPos(6,EditPanelH/2-21)
	DelayEntry:SetNumeric(true)
	DelayEntry:SetValue(tostring(DefaultTime))
	
	--  Color button [Adds a color tag to the end of the text entry ]
	local ColorSelect = StyleButton(EditPanel)
	ColorSelect:SetPos(EditPanelW-116,EditPanelH/2-21)
	ColorSelect.Paint = function(self,w,h)
		-- Background
		if (self:IsDown()) then
			draw.RoundedBox(5,0,0,w,h,ColorLightDark)
		elseif(self:IsHovered()) then
			draw.RoundedBox(10,1,1,w-2,h-2,ColorBlue)
		else
			draw.RoundedBox(10,0,0,w,h,ColorLightDark)
		end
		draw.SimpleText("Colour","MollyButton",w-40,h/2,ColorWhite,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end

	local ColorPicker = vgui.Create("DButton",ColorSelect)
	ColorPicker:SetSize(24,24)
	ColorPicker:SetPos(9,9)
	ColorPicker:SetText("")
	ColorPicker.Paint = function (self,w,h)
		draw.RoundedBox(5,0,0,w,h,ColorCache)
	end

	ColorPicker.DoClick = function()
		Menu = DermaMenu()
		Menu.Paint = nil

		local ColorMixerBase = vgui.Create("DPanel",Menu)
		ColorMixerBase:SetSize(200,200)
		ColorMixerBase.Paint = function(self,w,h)
			draw.RoundedBox(10,0,0,w,h,Color(25, 25, 25, 255))
		end

		local Mixer = vgui.Create("DColorMixer", ColorMixerBase)
		Mixer:Dock(FILL)
		Mixer:DockMargin(10,10,10,10)
		Mixer:SetPalette(false)
		Mixer:SetAlphaBar(false)	
		Mixer:SetColor(ColorCache)
		Mixer.WangsPanel:Dock(BOTTOM)
		Mixer.WangsPanel:DockMargin( 0, 0, 0, 0 )
		Mixer.txtR:Dock(LEFT)
		Mixer.txtR:DockMargin( 0, 4, 4, 0 )
		Mixer.txtR:SetSize(57,0)
		Mixer.txtG:Dock(LEFT)
		Mixer.txtG:DockMargin( 0, 4, 4, 0 )
		Mixer.txtG:SetSize(57,0)
		Mixer.txtB:Dock(LEFT)
		Mixer.txtB:DockMargin( 0, 4, 0, 0 )
		Mixer.txtB:SetSize(58,0)

		Mixer.ValueChanged = function()
			local ColorVal = Mixer:GetColor()
			ColorCache = ColorVal
		end

		Menu:AddPanel(ColorMixerBase)
		Menu:Open()
	end	

	ColorSelect.DoClick = function()
		local temp = TextEntry:GetValue()
		local left = string.Left(temp, CaretPos)
		TextEntry:SetValue(left .. "<c=" .. bit.tohex(ColorCache.r,2) .. bit.tohex(ColorCache.g,2).. bit.tohex(ColorCache.b,2) .. ">" .. string.Replace(temp, left, ""))
		TextEntry:RequestFocus()
		TextEntry:SetCaretPos(string.len(TextEntry:GetValue()))
	end
	
	-- Example draw [Uses markup to show the user what the title would look like ingame]
	local ExamplePanel = vgui.Create("DPanel",EditPanel)
	ExamplePanel:SetSize(EditPanelW-30,EditPanelH/2-30)
	ExamplePanel:SetPos(15,EditPanelH/2+25)
	ExamplePanel.Paint = function(self,w,h)
		local txt = TextEntry:GetValue()
	    if not mark[txt] then

	        mark[lastText] = nil
	        lastText = txt

	        mark[txt] = meta_markup.AdvancedParse(txt, {
				default_color = ColorWhite ,
	            default_font = "MollyHeader2",
				no_shadow = true,
				maxwidth = w-5,
	        })
	    end

	    surface.SetDrawColor(ColorWhite)
	    surface.SetTextColor(ColorWhite)

	    mark[txt]:Draw(1,0)
	end
	
	-- Clear function [resets all values and saves the current table to file]
	local function ClearForm()
		DelayEntry:SetValue(tostring(DefaultTime))
		TextEntry:SetValue("")
		TitleListRefresh()
		EditMode = false
		TitleList.VBar:SetScroll(99999)
		SaveTable("meta_titles_cache/autoload.json")
	end
	
	-- Edit function [Gets selected line and set the delay and text forms, also enables edit mode]
	local function EditTitle(ID,Line)
		ActiveLine = Line
		EditMode = true
		TextEntry:SetValue(Titles[Line][1])
		DelayEntry:SetValue(Titles[Line][2])
	end

	local function CopyTitle(ID,Line)
		SetClipboardText( Titles[Line][1] )
	end
	
	-- Move function [Moves the selected titles postion]
	local function MoveTitle(Current,Wanted)
		if Wanted > #Titles or Wanted < 1  then
			MollyNote(LoginPanel, "Invalid Position",ColorRed )
		else
			table.insert( Titles,Wanted, table.remove( Titles, Current))
		end
	end
	
	-- Menu panel [Houses saveas,load and clear buttons]
	local MainMenu = vgui.Create("DPanel", Frame)
	MainMenu:SetSize(FrameW/2-20,42)
	MainMenu:SetPos(10, FrameH-50)
	MainMenu.Paint = nil
	
	-- Save as button [Allows the user to save the current table to a diffrent file, opens frame to input filename] 
	local Save = StyleButton(MainMenu,Material("icon16/disk.png"),"Save As",ColorLightDark,ColorBlue)
	Save:Dock(LEFT)
	Save:DockMargin(0,0,4,0)
	Save.DoClick = function()
		local SButton,SText,SFrame = TextPopup()
		SButton.DoClick = function()
			SaveTable( "meta_titles/" .. string.Replace( string.lower( SText:GetValue() ), " ", "_" ) ..".json")
			MollyNote(LoginPanel, "Saved to " .. string.Replace( string.lower( SText:GetValue() ), " ", "_" ) ..".json",ColorGreen )
			SFrame:Close()
		end
	end

	-- Creates a frame with a dtree [Uses e2 file broswer as the base with modded Search and update panels ]	
	local function LoadPanel()
		
		local Frame = vgui.Create("DFrame")
		Frame:SetSize(400,350)
		Frame:Center()
		Frame:SetTitle(" ")
		Frame:ShowCloseButton(false)
		Frame:MakePopup()
		Frame.Paint = function(self,w,h)
			draw.RoundedBox(10, 0, 0, w, h, ColorDark)
		end

		local Close = SmallButton(Frame,"X",ColorRed,ColorDarkRed)
		Close:SetPos(Frame:GetWide()-24,6)
		Close.DoClick = function()

			Frame:Close()
		end
		
		local Files = vgui.Create("wire_expression2_browser", Frame)
		Files:Setup("meta_titles")
		Files:Dock(FILL)
		Files.Folders.Paint = function(self,w,h)
			draw.RoundedBox(10, 0, 0, w, h, Color(27,27,27, 255))
		end
		Files.Folders:DockMargin(3,0,2,0)

		Files.OnFileOpen = function(panel, listfile) -- panle function un-used
			if  listfile ~= nil then
				Titles = util.JSONToTable( file.Read(listfile, "DATA") )
				MollyNote(LoginPanel, "Loaded " .. listfile ,ColorGreen )
				SaveTable("meta_titles_cache/autoload.json")
				ClearForm()
				Frame:Close()
			end
		end
		
		local Menu = vgui.Create("DPanel",Frame)
		Menu:Dock(BOTTOM)
		Menu:DockMargin(4,4,4,0)
		Menu:SetSize(560,44)
		Menu.Paint = function(self,w,h)
			draw.RoundedBox(10, 0, 0, w, h, ColorDark)
		end
		
		local Text,Body = StyleTextEntry(Menu,269,"Search...")
		Body:SetPos(0,0)
		
		local Save = StyleButton(Menu,Material("icon16/arrow_refresh.png"),"Update",ColorExtraDark,ColorBlue)
		Save:SetPos(274,0)
		Save.DoClick = function()
			Files:UpdateFolders()
		end
		
		Text.OnEnter = function()
			local String = Text:GetValue()
			if String ~= "" then
				Files:StartSearch( string.Replace( string.lower( String ), " ", "_" ) )
			else
				timer.Remove( "wire_expression2_search" )
				Files:UpdateFolders()
			end
		end
		
		Files.SearchBox:Remove()
		Files.Update:Remove()
	end
	
	-- Load button [Opens the panel above]
	local Load = StyleButton(MainMenu,Material("icon16/drive_go.png"),"Load",ColorLightDark,ColorBlue)
	Load:Dock(LEFT)
	Load.DoClick = function()
		LoadPanel()
	end
	
	-- Clear button [Emptys form and table also epm]
	local Clear = StyleButton(MainMenu,Material("icon16/cross.png"),"Clear",ColorLightDark,ColorRed)
	Clear:Dock(RIGHT)
	Clear.DoClick = function()
		local Yes,BaseFrame = ConfirmPopup()
		Yes.DoClick = function()
			table.Empty( Titles )
			TitleList:Clear()
			SaveTable("meta_titles_cache/autoload.json")
			ClearForm()
			MollyNote(LoginPanel, "Table Cleared",ColorBlue )
			BaseFrame:Close()
		end
	end
	
	-- DListView double click check [Pushes the curent title to the form, also enables edit mode ]
	TitleList.DoDoubleClick = function(ID,Line)
		EditTitle(ID,Line)
	end
	
	-- DListView right click check [Makes a menu allowing the player to edit,delete and move the seleted title]
	TitleList.OnRowRightClick = function(ID,Line)
		local Menu = DermaMenu()
		
		local Up = Menu:AddOption( "Move Up" ,function() 
		MoveTitle(Line,Line-1) 
		ClearForm() end)
		Up:SetIcon( "icon16/arrow_up.png" )
		
		local Down = Menu:AddOption( "Move Down", function() 
		MoveTitle(Line,Line+1) 
		ClearForm() end)
		Down:SetIcon( "icon16/arrow_down.png" )

		local UpToTop = Menu:AddOption( "Move Top" ,function() 
			MoveTitle(Line,1) 
			ClearForm() end)
		UpToTop:SetIcon( "icon16/arrow_up.png" )

		local DownToBottom = Menu:AddOption( "Move Bottom", function() 
			table.insert( Titles, table.remove( Titles, Line))
			ClearForm() end)
		DownToBottom:SetIcon( "icon16/arrow_down.png" )
	
		Menu:AddSpacer()
	
		local Copy = Menu:AddOption( "Copy" , function() CopyTitle(ID,Line) end)
		Copy:SetIcon( "icon16/page_copy.png" )
		
		local Edit = Menu:AddOption( "Edit" , function() EditTitle(ID,Line) end)
		Edit:SetIcon( "icon16/page_edit.png" )
		
		local Delete = Menu:AddOption( "Delete" , function() 
			table.remove( Titles, Line) 
			ClearForm() end)
		Delete:SetIcon( "icon16/delete.png" )
		
		Menu:Open()
	end

	-- Footer panel [Houses the close, save and clear bttons]
	local FooterMenu = vgui.Create("DPanel",LoginPanel)
	FooterMenu:SetSize(LoginPanelW-20,42)
	FooterMenu:SetPos(10, LoginPanelH-50)
	
	FooterMenu.Paint = nil

	local function SaveFunc()
		if DelayEntry:GetValue() == "" or TextEntry:GetValue() == "" then
			MollyNote(LoginPanel, "Invalid Input",ColorRed )
		else
			if tonumber(DelayEntry:GetValue()) < 0 then
				MollyNote(LoginPanel, "Delay lower than 0",ColorRed )
			else
				if EditMode then 
					table.remove( Titles, ActiveLine) 
					table.insert( Titles,ActiveLine, {[1] = TextEntry:GetValue(),[2] = DelayEntry:GetValue()} )
					DefaultTime = DelayEntry:GetValue()
				else
					table.insert( Titles, {[1] = TextEntry:GetValue(),[2] = DelayEntry:GetValue()} )
					DefaultTime = DelayEntry:GetValue()
				end
				MollyNote(LoginPanel, "Added/Edited",ColorGreen )
				ClearForm()
				EditMode = false
			end
		end
	end
	
	-- Save changes button [Will push the form values to the table]
	local SetChanges = StyleButton(FooterMenu,Material("icon16/page_go.png"),"Save",ColorExtraDark,ColorBlue)
	SetChanges:Dock(LEFT)
	SetChanges.DoClick = function()
		SaveFunc()
	end
	SetChanges.Paint = function(self,w,h)
		-- Background
		if (self:IsDown()) then
			draw.RoundedBox(10,0,0,w,h,ColorExtraDark)
		elseif(self:IsHovered()) then
			draw.RoundedBox(10,1,1,w-2,h-2,ColorBlue)
		else
			draw.RoundedBox(10,0,0,w,h,ColorExtraDark)
		end
		-- Icon
		surface.SetDrawColor(ColorWhite)
		surface.SetMaterial(Material("icon16/page_go.png"))
		surface.DrawTexturedRect(9,9,24,24)
		--Text
		if EditMode then
			draw.SimpleText("Edit","MollyButton",w-40,h/2,ColorWhite,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		else
			draw.SimpleText("Add","MollyButton",w-40,h/2,ColorWhite,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		end
	end

	DelayEntry.OnEnter = function(self)
		SaveFunc()
	end
	
	-- Delete button [Deletes the current title being edited]
	local Delete = StyleButton(FooterMenu,Material("icon16/delete.png"),"Delete",ColorExtraDark,ColorRed)
	Delete:Dock(RIGHT)
	Delete:DockMargin(4,0,0,0)
	Delete.DoClick = function()
		if EditMode then
			table.remove( Titles, ActiveLine)
			ClearForm() 
			MollyNote(LoginPanel, "Title Deleted",ColorBlue )
		else
			MollyNote(LoginPanel, "No Title Selected",ColorRed )
		end
	end
	
	-- Clear form button [Clears current settings form form, also resets edit status]
	local ClearChanges = StyleButton(FooterMenu,Material("icon16/cross.png"),"Clear",ColorExtraDark,ColorRed)
	ClearChanges:Dock(RIGHT)
	ClearChanges.DoClick = function()
		ClearForm()
	end

	Frame.OnClose = function()
		hook.Run("Title_Updated", Titles)
	end
end)

-- Context menu icon setup
local icon = "icon16/tab_edit.png"
icon = file.Exists("materials/"..icon,'GAME') and icon or "icon64/playermodel.png"

list.Set(
	"DesktopWindows",
	"Ttile GUI",
	{
		title = "Title GUI",
		icon = icon,
		init = function(icn, pnl)
			pnl:Remove()
			LocalPlayer():ConCommand("title_gui")
		end
	}
)