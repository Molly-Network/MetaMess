-- Font setup
surface.CreateFont("MollyHeader", {
	font = "Segoe UI Black", 
	extended = false,
	size = 40,
	weight = 500,
})

surface.CreateFont("MollySubheader", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 23,
	weight = 500,
})

surface.CreateFont("MollyButton", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 24,
	weight = 500,
})

surface.CreateFont("MollyHeader2", {
	font = "Segoe UI Bold", 
	extended = false,
	size = 35,
	weight = 500,
})

-- Colors
local ColorBlue = Color(0, 123, 255, 255)
local ColorLightBlue = Color(24, 147, 240, 255)	
local ColorRed = Color(220, 53, 69, 255)
local ColorLightRed = Color(230, 60, 69, 255)
local ColorGreen = Color(32, 201, 151, 255)
local ColorWhite = Color(255, 255, 255, 255)
local ColorOffGrey = Color(126, 130, 153, 255)

-- Default values 
local Version = "1.0.0"
local TimeStamp = "Sussy Edition"
local GUITitle = "Title GUI"
local Titles = {}
local EditMode = false
local ActiveLine = nil

-- save to table function
local function SaveTable(filename)
	local temp = util.TableToJSON( Titles )
	file.Write("meta_titles/" .. filename, temp)
end

-- read table function
local function ReadTable(filename)
	temp = file.Read( "meta_titles/" .. filename, "DATA" )
	Titles = util.JSONToTable( temp )
end

-- Checks if defulte file is in data folder, if not creates the file
if file.Exists( "meta_titles/autoload.json", "DATA" ) == false then
	file.CreateDir( "meta_titles" )
	SaveTable("autoload.json")
end

ReadTable("autoload.json")

-- used for animation
local function inQuad(fraction, beginning, change)
	return change * (fraction ^ 2) + beginning
end

-- Custom icon buttons
local function StyleButton(Perent,Icon,Text,ColorNormal,ColorHovered)
	local StyleButton = vgui.Create("DButton",Perent)
	StyleButton:SetSize(128,52)
	StyleButton:SetText("")
	StyleButton.Paint = function(self,w,h)
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
		surface.DrawTexturedRect(10,10,32,32)
		--Text
		draw.SimpleText(Text,"MollyButton",w-48,h/2,ColorWhite,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	return StyleButton
end

-- Custom text entry
local function StyleTextEntry(Perent,Width,Placeholder)
	local Base = vgui.Create("DPanel",Perent)
	Base:SetSize(Width,52)
	Base.Paint = function(self,w,h)
		draw.RoundedBox(10,0,0,w,h,Color(37, 37, 37, 255))
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
	Notification:SetSize(LoginPanelW, 55)
	Notification:SetPos(0, LoginPanelH-55)
	Notification.Paint = function ( self,w,h )
		draw.RoundedBoxEx(10, 90, 0, w-180, 55, color,true,true,false,false)
		draw.DrawText(text, "MollyButton", w/2, h/2-13, ColorWhite, TEXT_ALIGN_CENTER)
	end

	local AnimationUp = Derma_Anim("EaseInQuadUp", Notification , function(pnl, anim, delta, data)
		pnl:SetPos(0, inQuad(delta, LoginPanelH, -55))
	end)

	local AnimationDown = Derma_Anim("EaseInQuadDown", Notification , function(pnl, anim, delta, data)
	pnl:SetPos(0, inQuad(delta, LoginPanelH-55, LoginPanelH))
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
	Frame:SetSize(560,92)
	Frame:Center()
	Frame:SetTitle(" ")
	Frame:ShowCloseButton(false)
	Frame:MakePopup()
	Frame.Paint = function(self,w,h)
		draw.RoundedBox(10, 0, 0, w, h, Color(32, 32, 32, 255))
	end
	
	local Text,Body = StyleTextEntry(Frame,245,"Filename")
	Body:SetPos(15,20)
	local Sussy = Text:GetValue()
	
	local Save = StyleButton(Frame,Material("icon16/page_go.png"),"Save",Color(26, 26, 26, 255),ColorBlue)
	Save:SetPos(274,20)
	
	local Close = StyleButton(Frame,Material("icon16/cancel.png"),"Close",Color(26, 26, 26, 255),ColorRed)
	Close:SetPos(413,20)
	Close.DoClick = function()
		Frame:Close()
	end
	
	return Save,Text,Frame
end

-- allows a user to add a title using commands, wont allow to set delay
concommand.Add("title_add",function(ply, cmd, args)
	table.insert( Titles, {[1] = table.concat(args),[2] = 1} )
	SaveTable("autoload.json")
end)

-- creates con command to open the frame
concommand.Add("title_gui",function()
	-- added to prevent bug 
	EditMode = false
	
	-- Main frame
	local Frame = vgui.Create("DFrame")
	Frame:SetSize(1120,680)
	Frame:Center()
	Frame:MakePopup()
	Frame:SetTitle(" ")
	Frame:ShowCloseButton(false)
	Frame.Paint = function ( self,w,h )
	
		surface.SetFont("MollySubheader")
	
		local VersionLength = surface.GetTextSize("Version ") + surface.GetTextSize(Version)
	
		-- Background
		draw.RoundedBoxEx(10, 0, 0, w/2, h, Color(26, 26, 26, 255), true, false, true, false)
		draw.RoundedBoxEx(10, w/2, 0, w/2, h, Color(37, 37, 37, 255), false, true, false, true)
	
		-- Header text
		surface.SetFont("MollyHeader")
		surface.SetTextColor(ColorWhite)
		surface.SetTextPos(30, 15)
		surface.DrawText(GUITitle)
	
		-- Version subheader
		surface.SetFont("MollySubheader")
		surface.SetTextColor(ColorBlue)
		surface.SetTextPos(30, 52)
		surface.DrawText("Version " .. Version)
	
		-- Timestamp subheader
		surface.SetFont("MollySubheader")
		surface.SetTextColor(Color(63, 66, 84, 255))
		surface.SetTextPos(35 + VersionLength, 52)
		surface.DrawText(TimeStamp)
	end
	
	local FrameW,FrameH = Frame:GetSize()
	
	-- Main panel for DListView
	local Image = vgui.Create("DPanel", Frame)
	Image:SetSize(FrameW/2-50, FrameH-170)
	Image:SetPos(25, 85)
	Image.Paint = function(self,w,h)
		draw.RoundedBox(10, 0,0,w,h, Color(37, 37, 37, 255))
	end
	
	-- DListView 
	local TitleList = vgui.Create( "DListView", Image )
	TitleList:Dock(FILL)
	local Position = TitleList:AddColumn("Position")
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
	
	TitleList.Columns[2].Header.Paint = function(self,w,h)
		if (self:IsDown()) then
			draw.RoundedBoxEx(10,1,0,w,h,ColorBlue)
		elseif(self:IsHovered()) then
			draw.RoundedBoxEx(10,1,0,w,h,ColorOffGrey)
		else
			draw.RoundedBoxEx(10,1,0,w,h,ColorBlue)
		end
	end
	
	TitleList.Columns[3].Header.Paint = function(self,w,h)
		if (self:IsDown()) then
			draw.RoundedBoxEx(10,1,0,w,h,ColorBlue,false,true)
		elseif(self:IsHovered()) then
			draw.RoundedBoxEx(10,1,0,w,h,ColorOffGrey,false,true)
		else
			draw.RoundedBoxEx(10,1,0,w-2,h,ColorBlue,false,true)
		end
	end
	
	-- title refresh function [Delets and readds the title to DlistView] 
	local function TitleListRefresh()
		TitleList:Clear()
		for k,v in ipairs(Titles) do
			TitleList:AddLine(k,v[1],v[2])
			for i=1,3 do
				TitleList.Lines[k].Columns[i]:SetTextColor(ColorWhite)
			end
		end
	end
	
	TitleListRefresh()

	-- main panle of the right	
	local LoginPanel = vgui.Create("DPanel", Frame)
	LoginPanel:SetSize(FrameW/2, FrameH)
	LoginPanel:SetPos(FrameW/2, 00)
	LoginPanel.Paint = function (self,w,h)
		if EditMode then
		draw.DrawText("Editing Line " .. ActiveLine, "MollyHeader2", w-30, 15, ColorWhite, TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		draw.DrawText("Use the options to edit the title", "MollyButton", w-30, 48, ColorOffGrey, TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		else
		draw.DrawText("Add a Title", "MollyHeader2", w-30, 15, ColorWhite, TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		draw.DrawText("Use the options to create a title", "MollyButton", w-30, 48, ColorOffGrey, TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		end
		
	end
	
	local LoginPanelW,LoginPanelH = LoginPanel:GetSize()
	
	-- creates the panle on the right
	local EditPanel = vgui.Create("DPanel", LoginPanel)
	EditPanel:SetSize(LoginPanelW-50, LoginPanelH-170)
	EditPanel:SetPos(25, 85)
	EditPanel.Paint = function(self,w,h)
		draw.RoundedBox(10, 0,0,w,h, Color(26, 26, 26, 255))
		draw.RoundedBox(10, 25,h-77,w-50,52, Color(37,37,37, 255))
	end
	
	local EditPanelW,EditPanelH = EditPanel:GetSize()
	
	-- Text entry [used to set the title text]
	local TextEntry,TextMain = StyleTextEntry(EditPanel,EditPanelW-50,"Title Text")
	TextMain:SetPos(25,25)
	
	-- Delay entry [locked to numerical used to input delay] 
	local DelayEntry,DelayMain = StyleTextEntry(EditPanel,EditPanelW-193,"Delay [Seconds]")
	DelayMain:SetPos(25,92)
	DelayEntry:SetNumeric(true)
	
	-- Color mixer
	local ColorMixer = vgui.Create("DColorMixer",EditPanel)
	ColorMixer:SetAlphaBar(false) 	
	ColorMixer:SetSize(EditPanelW-50,255)
	ColorMixer:SetPos(25,159)
	
	--  Color button [Adds a color tag to the end of the text entry ]
	local ColorSelect = StyleButton(EditPanel,Material("icon16/color_wheel.png"),"Colour",Color(37, 37, 37, 255),ColorBlue)
	ColorSelect:SetPos(EditPanelW-153,92)
	ColorSelect.DoClick = function()
		TextEntry:SetValue(TextEntry:GetValue() .. "<color=" .. ColorMixer:GetColor().r .. "," .. ColorMixer:GetColor().g .. "," .. ColorMixer:GetColor().b .. ">")
	end
	
	-- Example draw [Uses easychat markup to show the user what the title would look like ingame]
	local ExamplePanel = vgui.Create("DPanel",EditPanel)
	ExamplePanel:SetSize(EditPanelW-50,52)
	ExamplePanel:SetPos(10,EditPanelH-72)
	ExamplePanel.Paint = function(self,w,h)
			local Markup = ec_markup.AdvancedParse(TextEntry:GetValue(), {
			default_color = Color(255,255,255),
			default_font = "MollyHeader2",
			shadow_intensity = 0,
		})
	
		Markup:SetPos(30,h-50)
		Markup:Draw()
	end
	
	-- Clear function [resets all values and saves the current table to file]
	local function ClearForm()
		DelayEntry:SetValue("")
		TextEntry:SetValue("")
		TitleListRefresh()
		EditMode = false
		SaveTable("autoload.json")
	end
	
	-- Edit function [Gets selected line and set the delay and text forms, also enables edit mode]
	local function EditTitle(ID,Line)
		ActiveLine = Line
		EditMode = true
		TextEntry:SetValue(Titles[Line][1])
		DelayEntry:SetValue(Titles[Line][2])
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
	MainMenu:SetSize(FrameW/2-50,52)
	MainMenu:SetPos(25, FrameH-69)
	MainMenu.Paint = nil
	
	-- Save as button [Allows the user to save the current table to a diffrent file, opens frame to input filename] 
	local Save = StyleButton(MainMenu,Material("icon16/disk.png"),"Save As",Color(37, 37, 37, 255),ColorBlue)
	Save:Dock(LEFT)
	Save:DockMargin(0,0,10,0)
	Save.DoClick = function()
		local SButton,SText,SFrame = TextPopup()
		SButton.DoClick = function()
			SaveTable( string.Replace( string.lower( SText:GetValue() ), " ", "_" ) ..".json")
			MollyNote(LoginPanel, "Saved to " .. string.Replace( string.lower( SText:GetValue() ), " ", "_" ) ..".json",ColorGreen )
			SFrame:Close()
		end
	end

	-- Creates a frame with a dtree [Uses e2 file broswer as the base with modded Search and update panels ]	
	local function LoadPanel()
		
		local Frame = vgui.Create("DFrame")
		Frame:SetSize(560,600)
		Frame:Center()
		Frame:SetTitle(" ")
		Frame:ShowCloseButton(false)
		Frame:MakePopup()
		Frame.Paint = function(self,w,h)
			draw.RoundedBox(10, 0, 0, w, h, Color(32, 32, 32, 255))
		end
		
		local Files = vgui.Create('wire_expression2_browser', Frame)
		Files:Setup("meta_titles")-- set data folder 
		Files:Dock(FILL)
		Files.Folders.Paint = function(self,w,h)
			draw.RoundedBox(10, 0, 0, w, h, Color(27,27,27, 255))
		end
		Files.Folders:DockMargin(15,0,9,0)

		Files.OnFileOpen = function(panel, listfile) -- panle function un-used
			if  listfile ~= nil then
				Titles = util.JSONToTable( file.Read(listfile, "DATA") )
				MollyNote(LoginPanel, "Loaded " .. listfile ,ColorGreen )
				SaveTable("autoload.json")
				ClearForm()
				Frame:Close()
			end
		end
		
		local Menu = vgui.Create("DPanel",Frame)
		Menu:Dock(BOTTOM)
		Menu:SetSize(560,92)
		Menu.Paint = function(self,w,h)
			draw.RoundedBox(10, 0, 0, w, h, Color(32, 32, 32, 255))
		end
		
		local Text,Body = StyleTextEntry(Menu,245,"Search...")
		Body:SetPos(15,20)
		
		local Save = StyleButton(Menu,Material("icon16/arrow_refresh.png"),"Update",Color(26, 26, 26, 255),ColorBlue)
		Save:SetPos(274,20)
		Save.DoClick = function()
			Files:UpdateFolders()
		end
		
		local Close = StyleButton(Menu,Material("icon16/cancel.png"),"Close",Color(26, 26, 26, 255),ColorRed)
		Close:SetPos(413,20)
		Close.DoClick = function()
			Frame:Close()
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
	local Load = StyleButton(MainMenu,Material("icon16/drive_go.png"),"Load",Color(37, 37, 37, 255),ColorBlue)
	Load:Dock(LEFT)
	Load.DoClick = function()
		LoadPanel()
	end
	
	-- Clear button [Emptys form and table also epm]
	local Clear = StyleButton(MainMenu,Material("icon16/cross.png"),"Clear",Color(37, 37, 37, 255),ColorRed)
	Clear:Dock(RIGHT)
	Clear.DoClick = function()
		table.Empty( Titles )
		TitleList:Clear()
		SaveTable("autoload.json")
		ClearForm()
		MollyNote(LoginPanel, "Table Cleared",ColorBlue )
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
	
		Menu:AddSpacer()
	
		local Edit = Menu:AddOption( "Edit" , function() EditTitle(ID,Line) end)
		Edit:SetIcon( "icon16/page_edit.png" )
		
		local Delete = Menu:AddOption( "Delete" , function() 
			table.remove( Titles, Line) 
			ClearForm() end)
		Delete:SetIcon( "icon16/delete.png" )
		
		Menu:Open()
	end
	
	-- Header Panel [Holds the add and delete buttons]
	local HeaderMenu = vgui.Create("DPanel",LoginPanel)
	HeaderMenu:SetSize(LoginPanelW-50,52)
	HeaderMenu:SetPos(25,20)
	HeaderMenu.Paint = nil
	
	-- Add button [Clear form and resets edit staus to allow the user to add a new title]
	local Add = StyleButton(HeaderMenu,Material("icon16/add.png"),"New",Color(26, 26, 26, 255),ColorGreen)
	Add:Dock(LEFT)
	Add:DockMargin(0,0,10,0)
	Add.DoClick = function()
		EditMode = false
		ClearForm()
	end
	
	-- Delete button [Deletes the current title being edited]
	local Delete = StyleButton(HeaderMenu,Material("icon16/delete.png"),"Delete",Color(26, 26, 26, 255),ColorRed)
	Delete:Dock(LEFT)
	Delete.DoClick = function()
		if EditMode then
			table.remove( Titles, ActiveLine)
			ClearForm() 
			MollyNote(LoginPanel, "Title Deleted",ColorBlue )
		else
			MollyNote(LoginPanel, "No Title Selected",ColorRed )
		end
	end
	
	-- Footer panel [Houses the close, save and clear bttons]
	local FooterMenu = vgui.Create("DPanel",LoginPanel)
	FooterMenu:SetSize(LoginPanelW-50,52)
	FooterMenu:SetPos(25,LoginPanelH-69)
	FooterMenu.Paint = nil
	
	-- Save changes button [Will push the form values to the table]
	local SetChanges = StyleButton(FooterMenu,Material("icon16/page_go.png"),"Save",Color(26, 26, 26, 255),ColorBlue)
	SetChanges:Dock(LEFT)
	SetChanges.DoClick = function()
		
		if DelayEntry:GetValue() == "" or TextEntry:GetValue() == "" then
			MollyNote(LoginPanel, "Invalid Input",ColorRed )
		else
			if EditMode then 
				table.remove( Titles, ActiveLine) 
				table.insert( Titles,ActiveLine, {[1] = TextEntry:GetValue(),[2] = DelayEntry:GetValue()} )
			else
				table.insert( Titles, {[1] = TextEntry:GetValue(),[2] = DelayEntry:GetValue()} )
			end
			
			MollyNote(LoginPanel, "Added/Edited",ColorGreen )
			ClearForm()
			EditMode = false
		end
	end
	
	-- Close button [Closes main frame]
	local Close = StyleButton(FooterMenu,Material("icon16/cancel.png"),"Close",Color(26, 26, 26, 255),ColorRed)
	Close:Dock(RIGHT)
	Close:DockMargin(10,0,0,0)
	Close.DoClick = function()
		Frame:Close()
	end
	
	-- Clear form button [Clears current settings form form, also resets edit status]
	local ClearChanges = StyleButton(FooterMenu,Material("icon16/cross.png"),"Clear",Color(26, 26, 26, 255),ColorRed)
	ClearChanges:Dock(RIGHT)
	ClearChanges.DoClick = function()
		ClearForm()
	end
end)

-- Context menu icon setup
local icon = "icon16/textfield_rename.png"
icon = file.Exists("materials/"..icon,'GAME') and icon or "icon64/playermodel.png"

list.Set(
	"DesktopWindows",
	"Ttile GUI",
	{
		title = "Ttile GUI",
		icon = icon,
		init = function(icn, pnl)
			pnl:Remove()
			LocalPlayer():ConCommand("title_gui")
		end
	}
)

if IsValid(g_ContextMenu) and CreateContextMenu then
	CreateContextMenu()
end