surface.CreateFont( "Shit", {
	font = "Arial", 
	extended = false,
	size = 30.6,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

local Frame = vgui.Create( "DFrame" )
Frame:SetTitle( " " )
Frame:SetSize( 400,460 )
Frame:Center()			
Frame:MakePopup()
Frame:ShowCloseButton(false)
Frame.Paint = function( self, w, h ) 

	draw.RoundedBox( 20, 0, 0, w, h, Color( 48,51,54, 255 ) )
	draw.RoundedBox( 20, 0, 240, w, h-240, Color( 35,39,42, 255 ) )
end
	
local html = vgui.Create("DHTML", Frame)
html:SetSize( 373,290 )
html:SetPos( 13, 0 )
html:OpenURL("http://mememarket.co.uk/rain/")
html:SetMouseInputEnabled(false)
html.Paint = function( self, w, h ) 
end

local DLabel = vgui.Create( "DLabel", Frame ) 
DLabel:SetSize( 400,500 )
DLabel:SetText( " " )
DLabel.Paint = function( self, w, h ) 

	draw.RoundedBox( 0, 0, 240, w, h-400, Color( 35,39,42, 255 ) )
end

local Button = vgui.Create("DButton", Frame)
Button:SetText( "x" )
Button:SetFont( "DermaLarge" )
Button:SetTextColor( Color(255,255,255) )
Button:SetPos( 360, 0 )
Button:SetSize( 40, 40 )
Button.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
end
Button.DoClick = function()
	Frame:Close()
end

local header = vgui.Create( "DLabel", Frame )
header:SetPos( 20, 230 )
header:SetSize( 300, 100 )
header:SetTextColor( Color(255,255,255) )
header:SetFont( "DermaLarge" )
header:SetText( "Dark Mode" )

local text = vgui.Create( "DLabel", Frame )
text:SetPos( 20, 270 )
text:SetSize( 360, 100 )
text:SetTextColor( Color(128,128,128) )
text:SetFont( "GModToolHelp" )
text:SetText( "Dark mode will change all colours into a darker hue" )

local text2 = vgui.Create( "DLabel", Frame )
text2:SetPos( 20, 290 )
text2:SetSize( 360, 100 )
text2:SetTextColor( Color(128,128,128) )
text2:SetFont( "GModToolHelp" )
text2:SetText( "to make it easier on the eyes at night" )

local header2 = vgui.Create( "DLabel", Frame )
header2:SetPos( 20, 320 )
header2:SetSize( 360, 100 )
header2:SetTextColor( Color(220,220,220) )
header2:SetFont( "Shit" )
header2:SetText( "Do you want to use dark mode?" )

local Button2 = vgui.Create("DButton", Frame)
Button2:SetText( "Yes" )
Button2:SetFont( "DermaLarge" )
Button2:SetTextColor( Color(255,255,255) )
Button2:SetPos( 20, 400 )
Button2:SetSize( 150, 40 )
Button2.Paint = function( self, w, h )
	draw.RoundedBox( 20, 0, 0, w, h, Color( 0, 140, 0, 255 ) )
end
Button2.DoClick = function()
	Frame:Close() -- Yes Button
end

local Button3 = vgui.Create("DButton", Frame)
Button3:SetText( "No" )
Button3:SetFont( "DermaLarge" )
Button3:SetTextColor( Color(255,255,255) )
Button3:SetPos( 230, 400 )
Button3:SetSize( 150, 40 )
Button3.Paint = function( self, w, h )
	draw.RoundedBox( 20, 0, 0, w, h, Color( 140, 0, 0, 255 ) )
end
Button3.DoClick = function()
	Frame:Close() 
end
