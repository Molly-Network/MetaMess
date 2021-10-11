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

local URL = "Google.com"

	local WebSkybox = vgui.Create( "DFrame" )
	WebSkybox:SetTitle( " " )
	WebSkybox:SetSize( 900,475 )
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
	Text:SetSize(900-275,30)
	Text:SetPos(100,5)
	
	local Status = vgui.Create( "DLabel", ButtonPanel)
	Status:SetSize(90,20)
	Status:SetPos(5,10)
	Status:SetText("  Material Not Set")
	Status:SetTextColor(Color(255,255,255))
	Status.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,StatusColor)
	end
	
	local Search = vgui.Create("DButton", ButtonPanel)
	Search:SetText( "Search" )
	Search:SetTextColor( Color(0,0,0) )
	Search:SetPos( 900-170,5 )
	Search:SetSize( 75, 30 )
	Search:SetFont("Trebuchet18")
	Search.Paint = Win98Button
	Search.DoClick = function()
		WebPanel:OpenURL(Text:GetValue())
		print(Text:GetValue())
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
		fuckcunt:SetSize(7680,4320)
		
		-- Load the wiki page
		fuckcunt:OpenURL(Text:GetValue())
		
		-- Hide the panel
		fuckcunt:SetAlpha(0)
		fuckcunt:SetMouseInputEnabled(false)
		
		hook.Add("Think","MatCheck",function() 
			if(fuckcunt && fuckcunt:GetHTMLMaterial()) then
				StatusColor = Color(0,255,0)
				Status:SetText("  Material Ready")
				hook.Remove("Think","MatCheck")
			end
		end)
		function fuckcunt:ConsoleMessage(msg) end
	end
	
	local Set = vgui.Create("DButton", ButtonPanel)
	Set:SetText( "Set Skybox" )
	Set:SetTextColor( Color(0,0,0) )
	Set:SetPos( 900-90,5 )
	Set:SetSize( 75, 30 )
	Set:SetFont("Trebuchet18")
	Set.Paint = Win98Button
	Set.DoClick = function()
		if(fuckcunt && fuckcunt:GetHTMLMaterial()) then
			print("Mat Set")
			local html_mat = fuckcunt:GetHTMLMaterial()
			local scale_x, scale_y = 0.9375, 0.4
			local matdata =
			{
				["$basetexture"]=html_mat:GetName(),
				["$nocull"]="1",
				["$basetexturetransform"]="center 0 0.1175 scale "..scale_x.." "..scale_y.." rotate 0 translate 0 0",
				["$model"]=1
			}
			local uid = string.Replace(html_mat:GetName(), "__vgui_texture_", "")
			eatshit = CreateMaterial("WebMaterial_"..uid, "VertexLitGeneric", matdata)
			fuckcunt:Remove()
		end
		render.ModelMaterialOverride(nil)
		hook.Add("PostDraw2DSkyBox", "Quaddrawer", function()
			render.OverrideDepthEnable( true, false )
			render.SetLightingMode(2)
		
			cam.Start3D(Vector(0, 0, 0), EyeAngles())
				render.SetMaterial(eatshit)
				render.DrawSphere( Vector(0,0,0), 27000, 30, 30, Color( 0, 0, 0 ) )
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
	
	local function NumberInput(parent,text2)
		local Panel = vgui.Create("DPanel",parent)
		Panel:Dock(TOP)
		Panel:DockMargin(0,0,0,5)
		Panel.Paint = nil
		
		local Lable = vgui.Create("DLabel",Panel)
		Lable:SetText("  " .. text2)
		Lable:SetTextColor(Color(0,0,0))
		Lable:SetSize(100,0)
		Lable:Dock(LEFT)
		
		local Entry = vgui.Create("DTextEntry",Panel)
		Entry:SetNumeric(true)
		Entry:Dock(FILL)
		
		return Entry
	end
	
	NumberInput(ControlPanel,"Screen Scale X")
	NumberInput(ControlPanel,"Screen Scale Y")
	NumberInput(ControlPanel,"Material Scale X")
	NumberInput(ControlPanel,"Material Scale Y")
	NumberInput(ControlPanel,"Render Resolution")
	NumberInput(ControlPanel,"Render Resolution")
	
	
	
