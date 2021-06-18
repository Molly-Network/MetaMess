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

--Frame
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

local Frame = vgui.Create( "DFrame" )
Frame:SetTitle( " " )
Frame:SetSize( 300,175 )
Frame:Center()
Frame:MakePopup()
Frame:ShowCloseButton(false)
Frame.Paint = Win98Frame

local Close = vgui.Create("DButton", Frame)
Close:SetText( "r" )
Close:SetTextColor( Color(0,0,0) )
Close:SetPos( Frame:GetWide()-22,6)
Close:SetSize( 16, 16 )
Close:SetFont("Marlett")
Close.Paint = Win98Button

Close.DoClick = function()
Frame:Close()
end

local title = vgui.Create( "DLabel", Frame )
title:SetTextColor( Color(255,255,255) )
title:SetPos( 8, 4 )
title:SetSize(Frame:GetWide(),20)
title:SetFont("Trebuchet18")
title:SetText( "Shut Down Windows" )
title:SetWrap(true)

local Trash = {
	[1] = false,
	[2] = false
}

local DiconnectCheck = Frame:Add( "DCheckBoxLabel" )
DiconnectCheck:SetPos( 100, 40 )
DiconnectCheck:SetText("Disconnect from the server?")
DiconnectCheck:SetTextColor( Color(0,0,0))
DiconnectCheck:SetValue( false )
DiconnectCheck:SetFont("Trebuchet18")
DiconnectCheck:SizeToContents()

local QuitCheck = Frame:Add( "DCheckBoxLabel" )
QuitCheck:SetPos( 100, 70 )
QuitCheck:SetText("Quit Garry's Mod?")
QuitCheck:SetTextColor( Color(0,0,0))
QuitCheck:SetValue( false )
QuitCheck:SetFont("Trebuchet18")
QuitCheck:SizeToContents()
QuitCheck:GetChecked()

local TextEntry = vgui.Create( "DTextEntry", Frame )
TextEntry:SetPos( 100, 95 )
TextEntry:SetSize( 190, 25 )
TextEntry:SetValue( "Leave message." )
TextEntry:SetUpdateOnType(true)
TextEntry:SetFont("Trebuchet18")
TextEntry:SetDisabled(true)

function DiconnectCheck:OnChange( val )
	if val then
		TextEntry:SetDisabled(false)
		QuitCheck:SetValue(false)
		Trash[1] = true
		PrintTable(Trash[1])
	else
		Trash[1] = false
		PrintTable(Trash[1])
		TextEntry:SetDisabled(true)
	end
end

function QuitCheck:OnChange( val )
	if val then
		DiconnectCheck:SetValue(false)
		Trash[2] = true
		PrintTable(Trash[2])
	else
		Trash[2] = false
		PrintTable(Trash[2])
	end
end

TextEntry.OnEnter = function( self )
end

local img_text = vgui.Create("DImage", Frame)
img_text:SetPos(20, 50)
img_text:SetSize(60, 60)
img_text:SetImage("icon16/computer_delete.png")

local Button = vgui.Create("DButton", Frame)
Button:SetText( "Cancel" )
Button:SetTextColor( Color(0,0,0) )
Button:SetPos( Frame:GetWide()-85, Frame:GetTall()-40 )
Button:SetSize( 75, 30 )
Button:SetFont("Trebuchet18")
Button.Paint = Win98Button
Button.DoClick = function()
Frame:Close()
end

local Button2 = vgui.Create("DButton", Frame)
Button2:SetText( "OK" )
Button2:SetTextColor( Color(0,0,0) )
Button2:SetPos( Frame:GetWide()-165, Frame:GetTall()-40 )
Button2:SetSize( 75, 30 )
Button2:SetFont("Trebuchet18")
Button2.Paint = Win98Button

Button2.DoClick = function(self,ply)
	if (Trash[1] == true) then
		LocalPlayer():ConCommand("aowl exit "   .. TextEntry:GetValue()) -- exits the game 
	elseif(Trash[2] == true) then
		Entity(0):DrawModel() -- crashes you game 
	end
end
