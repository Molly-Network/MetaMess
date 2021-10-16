-- Windows 98 Skin
-- Button
function Win98Button( self, w, h )
	if (self:IsDown()) then
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0,0,0, 250 ) )
		draw.RoundedBox( 0, 2, 2, w-2, h-2, Color( 192,192,192, 250 ) )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawOutlinedRect( 1, 1, w-2, h-2, 1 )
		surface.SetDrawColor( 128,128,128, 255 )
		surface.DrawOutlinedRect( 1, 1, w, h, 1)
		surface.SetDrawColor(223,223,223, 255 )
		surface.DrawOutlinedRect( -1, -1, w+1, h+1, 1 )
	elseif(self:IsHovered()) then
		draw.RoundedBox( 0, 1, 1, w-1, h-1, Color( 223,223,223, 250 ) )
		draw.RoundedBox( 0, 2, 2, w-3, h-3, Color( 192,192,192, 250 ) )
		surface.SetDrawColor( 128,128,128, 255 )
		surface.DrawOutlinedRect( 2, 2, w-4, h-4, 1 )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawOutlinedRect( 2,2, w-1, h-1, 1 )
		surface.SetDrawColor( 0,0,0, 255 )
		surface.DrawOutlinedRect( -3, -3, w+2, h+2, 1 )
		surface.SetDrawColor( 0,0,0, 255 )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	else
	 	draw.RoundedBox( 0, 0, 0, w, h, Color( 223,223,223, 250 ) )
		draw.RoundedBox( 0, 2, 2, w-2, h-2, Color( 192,192,192, 250 ) )
		surface.SetDrawColor( 128,128,128, 255 )
		surface.DrawOutlinedRect( 1, 1, w-2, h-2, 1 )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawOutlinedRect( 1, 1, w, h, 1 )
		surface.SetDrawColor( 0,0,0, 255 )
		surface.DrawOutlinedRect( -1, -1, w+1, h+1, 1 )
	end
	if self:IsEnabled() == false then
		self:SetTextColor(Color(128,128,128))
	end
end

--WebSkybox
function Win98Frame( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 192,192,192, 255 ) )
	draw.RoundedBox( 0, 4, 4, w-8, 20, Color( 0,0,128, 255 ) )
	
	surface.SetDrawColor( 128,128,128, 255 )
	surface.DrawOutlinedRect( 1, 1, w-2, h-2, 1 )

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawOutlinedRect( 1, 1, w, h, 1)
	
	surface.SetDrawColor( 0,0,0, 255 )
	surface.DrawOutlinedRect( -1, -1, w+1, h+1, 1)
end


local StatusColor = Color(255,0,0)

if file.Exists("skybox_editor", "DATA") == false then
	file.CreateDir("skybox_editor")
	file.Write( "skybox_editor/blank.json" )
end

local Values = {
	ScreenScaleXValue = 0.9375,
	ScreenScaleYValue = 0.465,
	MaterialPositionX = 0,
	MaterialPositionY = 0.06,
}

local SavedData = {
	ResolutionX = 7680,
	ResolutionY = 4320,
	URL = "https://cdn.eso.org/images/large/aca-dawn-pano2-ext.jpg"
	}

concommand.Add("web_skybox",function()
	local WebSkybox = vgui.Create( "DFrame" )
	WebSkybox:SetTitle( " " )
	WebSkybox:SetSize( 1000,600 )
	WebSkybox:Center()
	WebSkybox:MakePopup()
	WebSkybox:ShowCloseButton(false)
	WebSkybox.Paint = Win98Frame
	
	local Close = vgui.Create("DButton", WebSkybox)
	Close:SetText( "r" )
	Close:SetTextColor( Color(0,0,0) )
	Close:SetPos( WebSkybox:GetWide()-22,6)
	Close:SetSize( 16, 16 )
	Close:SetFont("Marlett")
	Close.Paint = Win98Button
	
	Close.DoClick = function()
	WebSkybox:Remove()
	end
	
	local title = vgui.Create( "DLabel", WebSkybox )
	title:SetTextColor( Color(255,255,255) )
	title:SetPos( 8, 4 )
	title:SetSize(WebSkybox:GetWide(),20)
	title:SetFont("Trebuchet18")
	title:SetText( "[Web]Skybox" )
	title:SetWrap(true)
	
	local WebPanel = vgui.Create("DHTML", WebSkybox)
	WebPanel:Dock(FILL)
	WebPanel:DockMargin(0,0,5,0)
	
	
	local ButtonPanel = vgui.Create("DPanel", WebSkybox)
	ButtonPanel:Dock(BOTTOM)
	ButtonPanel:SetSize(0,40)
	ButtonPanel.Paint = nil
	
	local Text =  vgui.Create( "DTextEntry", ButtonPanel)
	Text:SetPlaceholderText( "Entry URL" )
	Text:SetSize(1000-275,30)
	Text:SetPos(100,5)
	
	local Status = vgui.Create( "DLabel", ButtonPanel)
	Status:SetSize(90,20)
	Status:SetPos(5,10)
	Status:SetText("  Material Not Set")
	Status:SetTextColor(Color(255,255,255))
	Status.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,StatusColor)
	end
	
	local Set = vgui.Create("DButton", ButtonPanel)
	Set:SetText( "Set Skybox" )
	Set:SetTextColor( Color(0,0,0) )
	Set:SetPos( 1000-90,5 )
	Set:SetSize( 75, 30 )
	Set:SetFont("Trebuchet18")
	Set:SetEnabled(false)
	Set.Paint = Win98Button
	
	local Search = vgui.Create("DButton", ButtonPanel)
	Search:SetText( "Search" )
	Search:SetTextColor( Color(0,0,0) )
	Search:SetPos( 1000-170,5 )
	Search:SetSize( 75, 30 )
	Search:SetFont("Trebuchet18")
	Search.Paint = Win98Button
	Search.DoClick = function()
		Set:SetEnabled(true)
		WebPanel:OpenURL(Text:GetValue())
		WebSkybox:Refresh()
		StatusColor = Color(0,0,255)
		Status:SetText("  Material Loading")
		
		eatshit = Material( "vgui/wave.png")
		fuckcunt = nil

		if(fuckcunt) then
			fuckcunt:Remove()
			fuckcunt = nil
		end
		-- Create a web page panel and fill the entire screen
		fuckcunt = vgui.Create("DHTML")
		fuckcunt:SetSize(SavedData.ResolutionX,SavedData.ResolutionY)
		
		-- Load the wiki page
		fuckcunt:OpenURL(Text:GetValue())
		
		-- Hide the panel
		fuckcunt:SetAlpha(0)
		fuckcunt:SetMouseInputEnabled(false)
		
		hook.Add("Think","MatCheck",function() 
			if(fuckcunt && fuckcunt:GetHTMLMaterial()) then
				StatusColor = Color(0,255,0)
				Set:SetTextColor(Color(0,0,0))
				Status:SetText("  Material Ready")
				hook.Remove("Think","MatCheck")
			end
		end)
		function fuckcunt:ConsoleMessage(msg) end
	end
	
	Set.DoClick = function()
		if(fuckcunt && fuckcunt:GetHTMLMaterial()) then
			local html_mat = fuckcunt:GetHTMLMaterial()
			local matdata =
			{
				["$basetexture"]=html_mat:GetName(),
				["$nocull"]="1",
				["$basetexturetransform"]="center "..Values.MaterialPositionX.." "..Values.MaterialPositionY.." scale "..Values.ScreenScaleXValue.." "..Values.ScreenScaleYValue.." rotate 0 translate 0 0",
				["$model"]=1
			}
			local uid = string.Replace(html_mat:GetName(), "__vgui_texture_", "")
			eatshit = CreateMaterial("WebMaterial_"..uid, "VertexLitGeneric", matdata)
			fuckcunt:Remove()
			Set:SetEnabled(false)
		end
		render.ModelMaterialOverride(nil)
		hook.Add("PostDraw2DSkyBox", "Quaddrawer", function()
			render.OverrideDepthEnable( true, false )
			render.SetLightingMode(2)
		
			cam.Start3D(Vector(0, 0, 0), EyeAngles())
				render.SetMaterial(eatshit)
				render.DrawSphere( Vector(0,0,0), 10000, 30, 30, Color( 0, 0, 0 ) )
			cam.End3D()
		
			render.OverrideDepthEnable( false, false )
			render.SetLightingMode(0)
		end)
	end
	
	local ControlPanel = vgui.Create("DPanel", WebPanel)
	ControlPanel:Dock(LEFT)
	ControlPanel:SetSize(200,0)
	ControlPanel.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(135,206,235,100))
	end
	
	local function NumberInput(parent,text2,text)
		local Panel = vgui.Create("DPanel",parent)
		Panel:Dock(TOP)
		Panel:DockMargin(0,5,0,0)
		Panel.Paint = nil
		
		local Lable = vgui.Create("DLabel",Panel)
		Lable:SetText("  " .. text2)
		Lable:SetTextColor(Color(0,0,0))
		Lable:SetSize(110,0)
		Lable:Dock(LEFT)
		
		local Entry = vgui.Create("DTextEntry",Panel)
		Entry:SetNumeric(true)
		Entry:Dock(FILL)
		Entry:DockMargin(0,0,5,0)
		Entry:SetText(text)
		
		local Button = vgui.Create("DButton",Panel)
		Button:Dock(RIGHT)
		Button:SetText("SET")
		Button:SetSize(30,0)
		Button.DoClick = function()
			text = Entry:GetValue()
		end
		
		return Entry
	end
	
	local ResolutionX = NumberInput(ControlPanel,"Resolution X",SavedData.ResolutionX)
	local ResolutionY = NumberInput(ControlPanel,"Resolution Y",SavedData.ResolutionY)
	
	local files = vgui.Create('wire_expression2_browser', ControlPanel)
	files:Setup("skybox_editor")
	files.OnFileOpen = function(panel, listfile)
		local JSONData = file.Read(listfile)
		SavedData = util.JSONToTable(JSONData)
		ResolutionX:SetValue(SavedData.ResolutionX)
		ResolutionY:SetValue(SavedData.ResolutionY)
		Text:SetValue(SavedData.URL)
		title:SetText( "[Web]Skybox - " .. files:GetFileName())
	end
	files:Dock(FILL)
	files:DockMargin(0,5,0,0)
	
	local function Save(bruh)
			SavedData.ResolutionX = ResolutionX:GetValue()
			SavedData.ResolutionY = ResolutionY:GetValue()
			SavedData.URL = Text:GetValue()
			local temp = util.TableToJSON(SavedData)
			PrintTable(SavedData)
			file.Write(bruh, temp )
	end
	
	local function TextInput(savetype,title) 
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
			Save("skybox_editor/".. self:GetValue() ..".json")
			files:UpdateFolders()
			frame:Close()
			else
			file.Write( "skybox_editor/".. self:GetValue() ..".json" )
			files:UpdateFolders()
			frame:Close()
			end
		end
	end
	
	
	local MenuBar = vgui.Create( "DMenuBar", WebSkybox )
	MenuBar:DockMargin( 0,-5,0,0 )

	local M1 = MenuBar:AddMenu( "File" )
	
	M1:AddOption("Save", function() 
		if files:GetFileName() == nil then
			TextInput(s,"Save As")
		else 
			Save(files:GetFileName())
		end
	end):SetIcon("icon16/folder_go.png")
		
	M1:AddOption("Save As", function() TextInput(s,"Save As") end):SetIcon("icon16/folder_go.png") -- Save as

	local M3 = MenuBar:AddMenu("Help")
	M3:AddOption("About", function()  gui.OpenURL("https://github.com/Molly-Network/MetaMess") end) -- link to github
end)
