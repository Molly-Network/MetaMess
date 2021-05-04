-- ==============================================
--    ____             __      ___________ ____ 
--   / __ \____  _____/ /__   / ____/ ___// __ \
--  / /_/ / __ \/ ___/ //_/  / __/  \__ \/ /_/ /
-- / _, _/ /_/ / /__/ ,<    / /___ ___/ / ____/ 
--/_/ |_|\____/\___/_/|_|  /_____//____/_/      
-- 
-- ==============================================

hook.Add( "HUDPaint", "RockESP", function()

	-- Get a list of all rocks and draw a marker on screen for each rock.
	for _, rock in ipairs( ents.FindByClass( "mining_rock" ) ) do

		-- Rock location hooking
		local rockpoint = rock:GetPos() + rock:OBBCenter() -- Gets the position of the entity, specifically the center.
		local rockdata2D = rockpoint:ToScreen() -- Gets the position of the entity on your screen.
		local rockrarity = rock:GetRarity() -- Get's rocks rarity.
		local rocksize = rock:GetSize() -- Get's how many layers the rock has.

		if rockrarity == 0 then
				draw.RoundedBox(4,rockdata2D.x-40, rockdata2D.y-6, 80, 15, Color(255,120,0,100))
				draw.SimpleText( "Copper - Size:" .. rocksize, "Default", rockdata2D.x, rockdata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif rockrarity == 1 then
				draw.RoundedBox(4,rockdata2D.x-40, rockdata2D.y-6, 80, 15, Color(255,255,255,100))
				draw.SimpleText( "Silver - Size:" .. rocksize, "Default", rockdata2D.x, rockdata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif rockrarity == 2 then
				draw.RoundedBox(4,rockdata2D.x-40, rockdata2D.y-6, 80, 15, Color(255,255,0,100))
				draw.SimpleText( "Gold - Size:" .. rocksize, "Default", rockdata2D.x, rockdata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )			
		end	

	end


end )


-- ==============================================
--   ____               ___________ ____ 
--  / __ \________     / ____/ ___// __ \
-- / / / / ___/ _ \   / __/  \__ \/ /_/ /
--/ /_/ / /  /  __/  / /___ ___/ / ____/ 
--\____/_/   \___/  /_____//____/_/      
--
-- ==============================================

hook.Add( "HUDPaint", "OreESP", function()

	-- Get a list of all ores and draw a marker on screen for each ore.
	for _, ore in ipairs( ents.FindByClass( "mining_ore" ) ) do

		-- ore location hooking
		local orepoint = ore:GetPos() + ore:OBBCenter() -- Gets the position of the entity, specifically the center.
		local oredata2D = orepoint:ToScreen() -- Gets the position of the entity on your screen.
		local orerarity = ore:GetRarity() -- Get's ores rarity.

		if orerarity == 0 then
				draw.RoundedBox(4,oredata2D.x-40, oredata2D.y-6, 80, 15, Color(255,120,0,30))
				draw.SimpleText( "Copper Pickup", "Default", oredata2D.x, oredata2D.y, Color( 0,0,0,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif orerarity == 1 then
				draw.RoundedBox(4,oredata2D.x-40, oredata2D.y-6, 80, 15, Color(255,255,255,30))
				draw.SimpleText( "Silver Pickup", "Default", oredata2D.x, oredata2D.y, Color( 0,0,0,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif orerarity == 2 then
				draw.RoundedBox(4,oredata2D.x-40, oredata2D.y-6, 80, 15, Color(255,255,0,30))
				draw.SimpleText( "Gold Pickup", "Default", oredata2D.x, oredata2D.y, Color( 0,0,0,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )		
		elseif orerarity == 3 then
				draw.RoundedBox(4,oredata2D.x-40, oredata2D.y-6, 80, 15, Color(255,255,255,30))
				draw.SimpleText( "Plat Pickup", "Default", oredata2D.x, oredata2D.y, Color( 0,0,0,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
		end	

	end

end )


-- ==============================================
--   _  __              ___________ ____ 
--  | |/ /__  ____     / ____/ ___// __ \
--  |   / _ \/ __ \   / __/  \__ \/ /_/ /
-- /   /  __/ / / /  / /___ ___/ / ____/ 
--/_/|_\___/_/ /_/  /_____//____/_/      
--                                         
-- ==============================================

hook.Add( "HUDPaint", "CoinESP", function()

	-- Get a list of all coins and draw a marker on screen for each coin.
	for _, coin in ipairs( ents.FindByClass( "mining_xen_crystal" ) ) do

		-- coin location hooking
		local coinpoint = coin:GetPos() + coin:OBBCenter() -- Gets the position of the entity, specifically the center.
		local coindata2D = coinpoint:ToScreen() -- Gets the position of the entity on your screen.
		local rainbow = HSVToColor(( CurTime()*20)%360,1,1)

--.. coinvalue

		draw.RoundedBox(4,coindata2D.x-40, coindata2D.y-6, 80, 15, rainbow)
		draw.SimpleText( "Xen Crystal " , "Default", coindata2D.x, coindata2D.y, Color( 0,0,0,100 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
end )

-- ==============================================
--   ______      _          ___________ ____ 
--  / ____/___  (_)___     / ____/ ___// __ \
-- / /   / __ \/ / __ \   / __/  \__ \/ /_/ /
--/ /___/ /_/ / / / / /  / /___ ___/ / ____/ 
--\____/\____/_/_/ /_/  /_____//____/_/      
--
-- ==============================================

-- BROKEN IDK SHIT SCUFFED

hook.Add( "HUDPaint", "CoinESP", function()

	-- Get a list of all coins and draw a marker on screen for each coin.
	for _, coin in ipairs( ents.FindByClass( "coins" ) ) do

		-- coin location hooking
		local coinpoint = coin:GetPos() + coin:OBBCenter() -- Gets the position of the entity, specifically the center.
		local coindata2D = coinpoint:ToScreen() -- Gets the position of the entity on your screen.
		local coinvalue = coin:GetValue() -- Get's coins rarity.
		local rainbow = HSVToColor(( CurTime()*20)%360,1,1)

		draw.RoundedBox(4,coindata2D.x-40, coindata2D.y-6, 80, 15, rainbow)
		draw.SimpleText( "Val - " .. coinvalue, "Default", coindata2D.x, coindata2D.y, Color( 0,0,0,100 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
end )
