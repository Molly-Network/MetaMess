function TEXT_BUBBLE()

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
	frame:SetTitle("Set text bubble")
	frame:Center()
	frame:MakePopup()
	frame:SetSizable( true )

	local editor = vgui.Create('editor', frame) -- Call to create ace editor

	local files = vgui.Create('wire_expression2_browser', frame) -- Used E2 file browser as re-coding functionality was pointless, will probably chnage some options on the right click menu
	files:Setup("savedbubbles")-- set data folder 
	files.OnFileOpen = function(panel, listfile)
		editor:SetCode(file.Read(listfile, "DATA"))-- panle function un-used
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
	panel.Paint = function(self,w,h)--blanks the DPanel
	end

	local clear = vgui.Create("DButton", panel) -- Disable button, removes the hook "COH_OVERWRITE"
	clear:Dock(RIGHT)
	clear:SetText("Disable")
	clear.DoClick = function()
		hook.Remove("Think", "COH_OVERWRITE")
	end

	local savefile = vgui.Create("DButton", panel) -- Saves current editor text to file, will probably add a save to current file option 
	savefile:Dock(RIGHT)
	savefile:SetText("Save to file")
	savefile.DoClick= function() -- opens a text box to type a name, idk messy could do it better 

		local frame = vgui.Create( "DFrame" )
		frame:SetSize( 300, 75 )
		frame:SetTitle("Save bubble")
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
			local code = editor:GetCode()	-- file saving code
			file.Write( "SavedBubbles/".. self:GetValue() ..".txt", code )
			files:UpdateFolders()
			frame:Close()
		end
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

end

concommand.Add("text_bubble_gui", TEXT_BUBBLE) -- Adds a con command that runs this trash code the command is "text_bubble_gui". might add a chat command

-- this code sucks ass 
