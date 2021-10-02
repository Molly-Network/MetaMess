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

--HalloweenEPS
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

local function assblast(hookname,entname,text,color)
	hook.Add( "HUDPaint", hookname, function()

		-- Get a list of all rocks and draw a marker on screen for each rock.
		for _, rock in ipairs( ents.FindByClass( entname ) ) do

			-- Rock location hooking
			local rockpoint = rock:GetPos() + rock:OBBCenter() -- Gets the position of the entity, specifically the center.
			local rockdata2D = rockpoint:ToScreen() -- Gets the position of the entity on your screen.
					local width, height = surface.GetTextSize( text )
					draw.RoundedBox(4,rockdata2D.x-width/2-7, rockdata2D.y-height/2, width+14, height+2, color)
					draw.SimpleText( text,"Default", rockdata2D.x, rockdata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )		
		end
	end )
end




	local HalloweenEPS = vgui.Create( "DFrame" )
	HalloweenEPS:SetTitle( " " )
	HalloweenEPS:SetSize( 300,175 )
	HalloweenEPS:Center()
	HalloweenEPS:MakePopup()
	HalloweenEPS:ShowCloseButton(false)
	HalloweenEPS.Paint = Win98Frame
	
	local Close = vgui.Create("DButton", HalloweenEPS)
	Close:SetText( "r" )
	Close:SetTextColor( Color(0,0,0) )
	Close:SetPos( HalloweenEPS:GetWide()-22,6)
	Close:SetSize( 16, 16 )
	Close:SetFont("Marlett")
	Close.Paint = Win98Button
	
	Close.DoClick = function()
	HalloweenEPS:Hide()
	end
	
	
	local title = vgui.Create( "DLabel", HalloweenEPS )
	title:SetTextColor( Color(255,255,255) )
	title:SetPos( 8, 4 )
	title:SetSize(HalloweenEPS:GetWide(),20)
	title:SetFont("Trebuchet18")
	title:SetText( "Meta Halloween ESP" )
	title:SetWrap(true)
	
	
	local Trash = {
		[1] = false,
		[2] = false
	}
	
	
	local Candy = HalloweenEPS:Add( "DCheckBoxLabel" )
	Candy:SetPos( 100, 40 )
	Candy:SetText("Candys")
	Candy:SetTextColor( Color(0,0,0))
	Candy:SetValue( false )
	Candy:SetFont("Trebuchet18")
	Candy:SizeToContents()
	
	
	local Pumpkin = HalloweenEPS:Add( "DCheckBoxLabel" )
	Pumpkin:SetPos( 100, 70 )
	Pumpkin:SetText("Pumpkins")
	Pumpkin:SetTextColor( Color(0,0,0))
	Pumpkin:SetValue( false )
	Pumpkin:SetFont("Trebuchet18")
	Pumpkin:SizeToContents()
	Pumpkin:GetChecked()
	
	local MegaPumpkin = HalloweenEPS:Add( "DCheckBoxLabel" )
	MegaPumpkin:SetPos( 100, 100 )
	MegaPumpkin:SetText("Mega Pumpkins")
	MegaPumpkin:SetTextColor( Color(0,0,0))
	MegaPumpkin:SetValue( false )
	MegaPumpkin:SetFont("Trebuchet18")
	MegaPumpkin:SizeToContents()
	MegaPumpkin:GetChecked()
	
	local img_text = vgui.Create("DImage", HalloweenEPS)
	img_text:SetPos(20, 50)
	img_text:SetSize(60, 60)
	img_text:SetImage("icon16/computer_delete.png")
	
	
	local Button2 = vgui.Create("DButton", HalloweenEPS)
	Button2:SetText( "Enable All" )
	Button2:SetTextColor( Color(0,0,0) )
	Button2:SetPos( HalloweenEPS:GetWide()-85, HalloweenEPS:GetTall()-40 )
	Button2:SetSize( 75, 30 )
	Button2:SetFont("Trebuchet18")
	Button2.Paint = Win98Button
	
	
	Button2.DoClick = function(self,ply)
	Candy:SetValue(true)
	Pumpkin:SetValue(true)
	MegaPumpkin:SetValue(true)
	end
	
	local Button3 = vgui.Create("DButton", HalloweenEPS)
	Button3:SetText( "Disable All" )
	Button3:SetTextColor( Color(0,0,0) )
	Button3:SetPos( HalloweenEPS:GetWide()-165, HalloweenEPS:GetTall()-40 )
	Button3:SetSize( 75, 30 )
	Button3:SetFont("Trebuchet18")
	Button3.Paint = Win98Button
	
	
	Button3.DoClick = function(self,ply)
	Candy:SetValue(false)
	Pumpkin:SetValue(false)
	MegaPumpkin:SetValue(false)
	end
	
	function Candy:OnChange( val )
		if val then
			assblast("CandyESP","sent_candy","Candy",Color(255,255,255, 100))
		else
			hook.Remove("HUDPaint","CandyESP")
		end
	end
	
	function Pumpkin:OnChange( val )
		if val then
			assblast("PumpkinESP","hwn_pumpkin","Pumpkin",Color(255, 128, 0, 100))
		else
			hook.Remove("HUDPaint","PumpkinESP")
		end
	end
	
	function MegaPumpkin:OnChange( val )
		if val then
			assblast("MegaPumpkinESP","sent_cdy_box","Mega Pumpkin",Color(255, 0, 0, 100))
		else
			hook.Remove("HUDPaint","MegaPumpkinESP")
		end
	end
	
	HalloweenEPS:Hide()
	
concommand.Add("halloween_esp", function()
	HalloweenEPS:Show()
end)