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

local fancytext = 0 -- enable easychat names- redueses fps by like 20

-- use this to move to build cam.Start3D2D(Vector(-4222.841797 ,2720.114746 ,-13200.968750),Angle(0,45,90),0.1)

hook.Add("PostDrawOpaqueRenderables","222", function()
	cam.Start3D2D(Vector(-10763.968750, -8447, 9468),Angle(0,90,90),0.1)
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
			if k == 9 then -- wont show your own name as metas tables odd and sometims just dosent show your own score
				else
				draw.SimpleText( v[1], "MollySubheader", 490,90+k*45, ColorWhite,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER )

				if fancytext == 1 then
					local Markup = ec_markup.AdvancedParse(v[2], {
						nick = true,
						default_color = Color(255,255,255),
						default_font = "MollySubheader",
						shadow_intensity = 0,
					})
					Markup:SetPos(20,70+k*45)
					Markup:Draw()
				else
					local text = string.gsub( v[2], "%<.-%>", "" )
					draw.SimpleText( text, "MollySubheader", 20,90+k*45, ColorWhite,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER )
				end
			end
		end
	cam.End3D2D()
end)
