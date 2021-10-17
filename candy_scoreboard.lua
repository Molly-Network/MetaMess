-- Fonts

surface.CreateFont("MollyHeader", {
	font = "Segoe UI Black", 
	extended = false,
	size = 100,
	weight = 500,
})

surface.CreateFont("MollySubheader", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 50,
	weight = 500,
})

-- Colors

local ColorWhite = Color(255, 255, 255, 255)
local ColorPurple = Color(137, 80, 252, 255)
local ColorBlack = Color(32,32,32, 220)
local bruh = CandyTable.GetScoreboard()

-- places scoreboard at build cam.Start3D2D(Vector(-4222.841797 ,2720.114746 ,-13200.968750),Angle(0,45,90),0.1)

hook.Add("PostDrawOpaqueRenderables","222", function()
	cam.Start3D2D(Vector(-10763.968750, -8447, 9468),Angle(0,90,90),0.1) --next to alex
		draw.RoundedBox(15,0,0,500,500,ColorBlack)
		
		surface.SetTextColor(ColorPurple)
		surface.SetTextPos(20,-10)
		surface.SetFont("MollyHeader")
		surface.DrawText("Candy")
		
		surface.SetTextColor(Color(255, 128, 0))
		surface.SetTextPos(20,65)
		surface.SetFont("MollySubheader")
		surface.DrawText("Scoreboard")

		for k, v in pairs( bruh ) do
			if v[3] == true then end
			draw.SimpleText( v[1], "MollySubheader", 490,90+k*45, ColorWhite,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER )
			local Markup = ec_markup.AdvancedParse(v[2], {
				nick = true,
				default_color = Color(0,0,0),
				default_font = "MollySubheader",
				shadow_intensity = 0,
			})
			Markup:SetPos(20,70+k*45)
			Markup:Draw()	
		end
		
	cam.End3D2D()
end)
