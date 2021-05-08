-- ______________________
--< Text Bubble GUI v1.2 >
-- ----------------------
--        \   ^__^
--         \  (oo)\_______
--            (__)\       )\/\
--                ||----w |
--                ||     ||

function TEXT_BUBBLE()
	
	local SaveAs = "newfile.txt"

--=======================================================================================================================
--HTML panel cration to interface with Ace editor can be put in a diffrent file and called I think this is form easy chat
--=======================================================================================================================
	local PANEL = {}
	PANEL.URL = "https://mememarket.co.uk/textbubble"
	PANEL.COMPILE = "C"

	local javascript_escape_replacements =
	{
		["\\"] = "\\\\",
		["\0"] = "\\0" ,
		["\b"] = "\\b" ,
		["\t"] = "\\t" ,
		["\n"] = "\\n" ,
		["\v"] = "\\v" ,
		["\f"] = "\\f" ,
		["\r"] = "\\r" ,
		["\""] = "\\\"",
		["\'"] = "\\\'",
	}

	function PANEL:Init()
		self.Code = ""
		self:StartHTML()
		if file.Exists("SavedBubbles", "DATA") == false then -- This "if" statement should be in its own initialization hook
			file.CreateDir("SavedBubbles")
			file.CreateDir("SavedBubbles/Samples")
		end
	end
	
	function PANEL:ClearCode()
		self.Code = ""
		self:CallJS('SetContent("' .. "" .. '");')
	end

	function PANEL:StartHTML()
		self.HTML = self:Add("DHTML")

		self:AddJavascriptCallback("OnReady")
		self:AddJavascriptCallback("OnCode")
		self:AddJavascriptCallback("OnLog")

		self.HTML:OpenURL(self.URL)
		
		self.HTML:RequestFocus()
		self.Code = ""
		self.HTML:Call('SetContent("' .. "" .. '");')
	end

	function PANEL:ReloadHTML()
		self.HTML:OpenURL(self.URL)
	end

	function PANEL:JavascriptSafe(str)
		str = str:gsub(".",javascript_escape_replacements)
		str = str:gsub("\226\128\168","\\\226\128\168")
		str = str:gsub("\226\128\169","\\\226\128\169")
		return str
	end

	function PANEL:CallJS(JS)
		self.HTML:Call(JS)
	end

	function PANEL:AddJavascriptCallback(name)
		local func = self[name]

		self.HTML:AddFunction("gmodinterface",name,function(...)
			func(self,HTML,...)
		end)
	end
	
	function PANEL:OnCode(_,code)
		self.NextValidate = CurTime() + 0.2
		self.Code = code
	end

	function PANEL:OnLog(_,...)
		Msg("executer: ")
		print(...)
	end

	function PANEL:SetCode(code)
		self.Code = code
		self:CallJS('SetContent("' .. self:JavascriptSafe(code) .. '");')
	end
	
	function PANEL:OnReady()
		self:ClearCode()
	end

	function PANEL:GetCode()
		return self.Code
	end


	function PANEL:GotoLine(num)
		self:CallJS("GotoLine('" .. num .. "')")
	end


	function PANEL:PerformLayout(w,h)
		self.HTML:SetSize(w,h)
	end


	vgui.Register("editor",PANEL,"EditablePanel")
-- End of panel creation some functions are not-needed but have been left in
-- The only functions beening used are GetCode and SetCode
-- Could make a paramiter to set the site but its fine for now. Also maybe a parmiter to witch betwwen code and text.

--===============================================
--VGUI Derma frame creation
--===============================================
	local frame = vgui.Create("DFrame")
	frame:SetSize(900,550)
	frame:SetTitle("Text Bubble GUI - New file")
	frame:Center()
	frame:MakePopup()
	frame:SetSizable( true )

	local editor = vgui.Create('editor', frame) -- Call to create ace editor

	local files = vgui.Create('wire_expression2_browser', frame) -- Used E2 file browser as re-coding functionality was pointless, will probably chnage some options on the right click menu
	files:Setup("savedbubbles")-- set data folder 
	files.OnFileOpen = function(panel, listfile) -- panle function un-used
		editor:SetCode(file.Read(listfile, "DATA"))
		frame:SetTitle("Text Bubble GUI - " .. files:GetFileName())
	end
	
	local function TextInput(savetype,title) -- Text input window function needs to be here cuz references editor in code
		local frame = vgui.Create( "DFrame" )
		frame:SetSize( 300, 75 )
		frame:SetTitle(title)
		frame:Center()
		frame:MakePopup()

		local DLabel = vgui.Create( "DLabel", frame )
		DLabel:SetText( "Type the file name below and press ENTER." )
		DLabel:SizeToContents() 
		DLabel:Dock(TOP)

		local TextEntry = vgui.Create( "DTextEntry", frame )
		TextEntry:SetSize(0,25)
		TextEntry:Dock(FILL)
		TextEntry.OnEnter = function( self )
			if savetype == s then 
			local code = editor:GetCode()
			file.Write( "SavedBubbles/".. self:GetValue() ..".txt", code ) -- Save as
			files:UpdateFolders()
			frame:Close()
			else
			file.Write( "SavedBubbles/".. self:GetValue() ..".txt" ) -- New file 
			files:UpdateFolders()
			frame:Close()
			end
		end
	end
	
	local div = vgui.Create( "DHorizontalDivider", frame ) -- combines the file browser and ace editor
	div:Dock( FILL )
	div:SetLeft( files )
	div:SetRight( editor )
	div:SetDividerWidth( 4 )
	div:SetLeftMin( 100 )
	div:SetRightMin( 100 )
	div:SetLeftWidth( 150 )

	local panel = vgui.Create( "DPanel" , frame)-- footer with controls will probably move some to a menubar for a cleaner look
	panel:Dock(BOTTOM)
	panel:DockMargin(0, 5, 0, 0)
	panel.Paint = function(self,w,h) --blanks the DPanel
	end

	local enter = vgui.Create( "DButton" , panel ) -- Button that sets "textsend" to the text on the editor
	enter:Dock(RIGHT)
	enter:SetText("Set text")
	enter.DoClick = function()
		local code = editor:GetCode()
		textsend = code
	end

	local DComboBox = vgui.Create( "DComboBox", panel ) -- Need to set a better default value as it doesn't set the text if you havent selected a mode
	DComboBox:SetPos( 5, 30 )
	DComboBox:Dock(LEFT)
	DComboBox:SetSize( 150, 20 )
	DComboBox:SetValue( "Mode" )
	DComboBox:AddChoice( "Only on when typing" )
	DComboBox:AddChoice( "Always on" )
	DComboBox.OnSelect = function( self, index, value )
		if index == 2 then
       		hook.Add("Think", "COH_OVERWRITE", function() coh.StartChat(true) coh.SendTypedMessage(textsend) end)
		else
			hook.Add("Think", "COH_OVERWRITE", function() coh.SendTypedMessage(textsend) end)
		end
	end
	
	local MenuBar = vgui.Create( "DMenuBar", frame ) -- menu bar copyed from wiki
	MenuBar:DockMargin( 0,0,0,5 ) --corrects MenuBar pos

	local M1 = MenuBar:AddMenu( "File" )
	M1:AddOption("New", function() TextInput(n,"Save As") end):SetIcon("icon16/page_white_go.png") -- New file 
	M1:AddOption("Save", function() 
		if files:GetFileName() == nil then -- save functction checks is theres a file loaded if not open save as
			TextInput(s,"Save As")
		else
			local code = editor:GetCode()
			file.Write(files:GetFileName(),code) 
		end
		end):SetIcon("icon16/folder_go.png")
	M1:AddOption("Save As", function() TextInput(s,"Save As") end):SetIcon("icon16/folder_go.png") -- Save as

	local M2 = MenuBar:AddMenu("Edit")
	M2:AddOption("Clear", function() editor:ClearCode() end) -- clears the editor window
	M2:AddOption("Disable", function() hook.Remove("Think", "COH_OVERWRITE") end) -- kills "COH_OVERWRITE" hook

	local M3 = MenuBar:AddMenu("Help")
	M3:AddOption("About", function()  gui.OpenURL("https://github.com/Molly-Network/MetaMess") end) -- link to github
end

concommand.Add("text_bubble_gui", TEXT_BUBBLE) -- Adds a con command that runs this trash code the command is "text_bubble_gui". might add a chat command

-- Hello from DuckDuckGo, DM @[Molly]Sherm#3332 me if you having any trouble or found any bugs
