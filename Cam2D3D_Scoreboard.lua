surface.CreateFont("MollyHeader", {
	font = "Segoe UI Black",
	extended = false,
	size = 100,
	weight = 500,
})

surface.CreateFont("MollyInfo", {
	font = "Segoe UI Black",
	extended = false,
	size = 90,
	weight = 500,
})

surface.CreateFont("MollySubheader", {
	font = "Segoe UI Semilight",
	extended = false,
	size = 50,
	weight = 500,
})

surface.CreateFont("MollyPlayer", {
	font = "Segoe UI Semilight",
	extended = false,
	size = 40,
	weight = 500,
})

surface.CreateFont("MollyGraph", {
	font = "Segoe UI Semilight",
	extended = false,
	size = 20,
	weight = 500,
})

-- Colors
local ColorBlue = Color(0, 123, 255, 255)
local ColorLightBlue = Color(24, 147, 240, 255)
local ColorRed = Color(220, 53, 69, 255)
local ColorLightRed = Color(230, 60, 69, 255)
local ColorGreen = Color(32, 201, 151, 255)
local ColorWhite = Color(255, 255, 255, 255)
local ColorOffGrey = Color(126, 130, 153, 255)
local ColorPurple = Color(137, 80, 252, 255)
local ColorLightBlack = Color(48, 48, 48, 255)
local ColorBlack = Color(32, 32, 32, 255)
local ColorBlueGrey = Color(63, 66, 84, 255)
local ColorTrueBlack = Color(0, 0, 0, 255)
local ColorDarkBlack = Color(24, 24, 24, 255)
local ColorPureBlack = Color(0, 0, 0, 255)
local FPSGraph = {}
local PingGraph = {}
local ServerFPSGraph = {}

table.insert(FPSGraph, {
	OldFPS = math.Round(1 / FrameTime()),
	NewFPS = math.Round(1 / FrameTime())
})

table.insert(ServerFPSGraph, {
	OldFPS = math.Round(1 / engine.ServerFrameTime()),
	NewFPS = math.Round(1 / engine.ServerFrameTime())
})

table.insert(PingGraph, {
	OldPing = LocalPlayer():Ping(),
	NewPing = LocalPlayer():Ping()
})

-- use this to move to build cam.Start3D2D(Vector(-4222.841797 ,2720.114746 ,-13200.968750),Angle(0,45,90),0.1)
local delay = 0
local num = 1
local SavedMAXFPS = 0
local SavedMinFPS = 300
local PingDelay = 0
local PingNum = 1

local function Format_Numbers(coin)
	if coin > 1e15 then
		coin = math.floor(coin / 1e15) .. " Q"
	elseif coin > 1e12 then
		coin = math.floor(coin / 1e12) .. " T"
	elseif coin > 1e9 then
		coin = math.floor(coin / 1e9) .. " B"
	elseif coin > 1000000 then
		coin = math.floor(coin / 1000000) .. " M"
	end

	return coin
end

local function FormatTime(time)
	local value = string.FormattedTime(time)

	return value.h .. ":" .. value.m .. ":" .. value.s
end

hook.Add("Think", "FPS Check", function()
	if SavedMAXFPS < math.Round(1 / FrameTime()) then
		SavedMAXFPS = math.Round(1 / FrameTime())
	end

	if SavedMinFPS > math.Round(1 / FrameTime()) then
		SavedMinFPS = math.Round(1 / FrameTime())
	end
end)

local CoinIcon = Material("icon16/coins.png")
local DevIcon = Material("meta/meta_logo.png")
local ClockIcon = Material("icon16/time.png")
local TrustedIcon = Material("icon16/award_star_silver_1.png")

hook.Add("Think", "CurTimeDelay", function()
	if CurTime() < delay then return end

	if num >= 133 then
		table.remove(FPSGraph, 1)
		table.remove(ServerFPSGraph, 1)
		num = 132
	end

	if PingNum >= 62 then
		table.remove(PingGraph, 1)
		PingNum = 61
	end

	if num == 0 then
		table.insert(FPSGraph, {
			OldFPS = math.Round(1 / FrameTime()),
			NewFPS = math.Round(1 / FrameTime())
		})

		table.insert(ServerFPSGraph, {
			OldFPS = math.Round(1 / engine.ServerFrameTime()),
			NewFPS = math.Round(1 / engine.ServerFrameTime())
		})

		num = 1
	elseif num ~= 0 then
		table.insert(FPSGraph, {
			OldFPS = FPSGraph[num].NewFPS,
			NewFPS = math.Round(1 / FrameTime())
		})

		table.insert(ServerFPSGraph, {
			OldFPS = ServerFPSGraph[num].NewFPS,
			NewFPS = math.Round(1 / engine.ServerFrameTime())
		})
	end

	--PrintTable(FPSGraph)
	delay = CurTime() + 0.02
	num = num + 1
end)

hook.Add("Think", "PingDelay", function()
	if CurTime() < PingDelay then return end

	if PingNum == 0 then
		table.insert(PingGraph, {
			OldPing = LocalPlayer():Ping(),
			NewPing = LocalPlayer():Ping()
		})

		PingNum = 1
	elseif PingNum ~= 0 then
		if LocalPlayer():Ping() >= 300 then
			table.insert(PingGraph, {
				OldPing = PingGraph[PingNum].NewPing,
				NewPing = 300
			})
		else
			table.insert(PingGraph, {
				OldPing = PingGraph[PingNum].NewPing,
				NewPing = LocalPlayer():Ping()
			})
		end
	end

	PingDelay = CurTime() + 2
	PingNum = PingNum + 1
end)

hook.Add("PostDrawOpaqueRenderables", "infoboard", function()
	cam.Start3D2D(Vector(-4250.841797, 2680.114746, -13110.968710), Angle(0, 45, 90), 0.1)
	--cam.Start3D2D(Vector(10810.13671875, 6178.03125, -13154.008789063),Angle(0,180,90),0.1)
	draw.RoundedBox(15, 0, 0, 3000, 1450, ColorBlack)
	surface.SetTextColor(ColorPurple)
	surface.SetTextPos(20, -10)
	surface.SetFont("MollyHeader")
	surface.DrawText(GetHostName())
	draw.SimpleText("Map: " .. game.GetMap(), "MollySubheader", 2950, 1400, Color(255, 128, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	draw.RoundedBox(15, 1550, 100, 1400, 600, ColorDarkBlack)
	draw.RoundedBox(15, 1550, 770, 675, 600, ColorDarkBlack)
	draw.RoundedBox(15, 2275, 770, 675, 600, ColorDarkBlack)
	draw.SimpleText("Client FPS: " .. math.Round(1 / FrameTime()), "MollySubheader", 1595, 729, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.RoundedBox(10, 1550, 710, 40, 40, ColorGreen)
	draw.SimpleText("Server FPS: " .. math.Round(1 / engine.ServerFrameTime()), "MollySubheader", 1895, 729, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.RoundedBox(10, 1850, 710, 40, 40, ColorBlue)
	draw.SimpleText("Ping: " .. LocalPlayer():Ping(), "MollySubheader", 1595, 1399, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.RoundedBox(10, 1550, 1380, 40, 40, ColorPurple)

	for i = 1, 14 do
		surface.SetDrawColor(ColorBlack)
		surface.DrawLine(1550, 100 + i * 40, 2950, 100 + i * 40)
		surface.DrawLine(1550, 770 + i * 40, 2225, 770 + i * 40)
	end

	for i = 1, 15 do
		draw.SimpleText(320 - i * 20, "MollyGraph", 2940, 80 + i * 40, ColorBlueGrey, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		draw.SimpleText(320 - i * 20, "MollyGraph", 2215, 750 + i * 40, ColorBlueGrey, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end

	for i = 1, PingNum do
		surface.SetDrawColor(ColorPurple)
		--surface.DrawRect(1550 + 12*i ,1370 , 10 , -PingGraph[i].PingTrash*2)
		surface.DrawLine(1540 + 10 * i, 1370 - PingGraph[i].OldPing * 2, 1550 + 10 * i, 1370 - PingGraph[i].NewPing * 2)
	end

	for i = 1, num do
		if FPSGraph[i].NewFPS <= 20 then
			surface.SetDrawColor(ColorRed)
		elseif FPSGraph[i].NewFPS <= 40 then
			surface.SetDrawColor(Color(255, 128, 0))
		else
			surface.SetDrawColor(ColorGreen)
		end

		surface.DrawLine(1540 + 10 * i, 700 - FPSGraph[i].OldFPS * 2, 1550 + 10 * i, 700 - FPSGraph[i].NewFPS * 2)
		surface.SetDrawColor(ColorBlue)
		surface.DrawLine(1540 + 10 * i, 700 - ServerFPSGraph[i].OldFPS * 2, 1550 + 10 * i, 700 - ServerFPSGraph[i].NewFPS * 2)
	end

	draw.SimpleText("Update: 20ms", "MollyPlayer", 1570, 100, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText("Min FPS: " .. SavedMinFPS .. "  Max FPS: " .. SavedMAXFPS, "MollyPlayer", 1570, 140, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText("Update: 2s", "MollyPlayer", 1570, 770, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(FPSGraph[num].NewFPS, "MollyPlayer", 1555 + 10 * num, 680 - FPSGraph[num].NewFPS * 2, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(ServerFPSGraph[num].NewFPS, "MollyPlayer", 1555 + 10 * num, 680 - ServerFPSGraph[num].NewFPS * 2, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(LocalPlayer():Ping(), "MollyPlayer", 1555 + 10 * PingNum, 1350 - PingGraph[PingNum].NewPing * 2, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	draw.SimpleText(LocalPlayer():Ping(), "MollyPlayer", 1555 + 10 * PingNum, 1350 - PingGraph[PingNum].NewPing * 2, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

	draw.RoundedBox(15, 2295, 790, 200, 170, ColorGreen)
	draw.SimpleText("Player Props", "MollyPlayer", 2395, 810, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(LocalPlayer():GetCountSummed(), "MollyInfo", 2395, 880, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.RoundedBox(15, 2515, 790, 200, 170, ColorLightBlue)
	draw.SimpleText("Moving Entities", "MollyPlayer", 2615, 810, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(SrvInfo.GetInfo("Moving"), "MollyInfo", 2615, 880, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.RoundedBox(15, 2735, 790, 200, 170, ColorLightBlue)
	draw.SimpleText("Shared Entities", "MollyPlayer", 2835, 810, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(SrvInfo.GetInfo("SHEntities"), "MollyInfo", 2835, 880, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.RoundedBox(15, 2295, 983, 200, 170, ColorLightBlue)
	draw.SimpleText("Server Entities", "MollyPlayer", 2395, 1003, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(SrvInfo.GetInfo("Entities"), "MollyInfo", 2395, 1073, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.RoundedBox(15, 2515, 983, 420, 170, ColorLightBlue)
	draw.SimpleText("Server Uptime", "MollyPlayer", 2725, 1003, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(FormatTime(SrvInfo.GetInfo("SysTime")), "MollyInfo", 2725, 1073, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.RoundedBox(15, 2295, 1180, 310, 170, ColorLightBlue)
	draw.SimpleText("Map Uptime", "MollyPlayer", 2450, 1200, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(FormatTime(CurTime()), "MollyInfo", 2450, 1270, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.RoundedBox(15, 2625, 1180, 310, 170, ColorGreen)
	draw.SimpleText("Your Uptime", "MollyPlayer", 2780, 1200, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText(FormatTime(SysTime()), "MollyInfo", 2780, 1270, ColorWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	-- The shit above needs to get dumped into a single function to reduse the bess by like half 
	for i, v in ipairs(player.GetAll()) do
		if i >= 30 then
			if i == 30 then
				draw.RoundedBox(10, 10, 55 + i * 45, 1530, 41, ColorDarkBlack)
				draw.SimpleText("Too many players ...", "MollySubheader", 20, 48 + i * 45, ColorWhite, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			end
		else
			local text = string.gsub(v:Nick(), "%<.-%>", "")
			draw.RoundedBox(10, 10, 55 + i * 45, 1530, 41, ColorDarkBlack)
			surface.SetDrawColor(17, 17, 17, 100)
			surface.DrawRect(1237, 55 + i * 45, 150, 41)
			if LocalPlayer():IsFriend(v) then
				draw.SimpleText(text, "MollySubheader", 20, 48 + i * 45, ColorGreen, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			else
				draw.SimpleText(text, "MollySubheader", 20, 48 + i * 45, team.GetColor(v:Team()), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			end
			surface.SetFont("MollySubheader")
			draw.SimpleText(Format_Numbers(v:GetCoins()), "MollyPlayer", 1490, 53 + i * 45, ColorWhite, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.SetMaterial(CoinIcon)
			surface.DrawTexturedRect(1500, 60 + i * 45, 30, 30)
			draw.SimpleText(string.FormattedTime(v:GetUTime()).h .. " h", "MollyPlayer", 1340, 53 + i * 45, ColorWhite, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
			surface.SetMaterial(ClockIcon)
			surface.DrawTexturedRect(1350, 60 + i * 45, 30, 30)

			if v:IsAdmin() then
				surface.SetMaterial(DevIcon)
				surface.DrawTexturedRect(1195, 60 + i * 45, 30, 30)
				draw.SimpleText("Developer", "MollyPlayer", 1190, 53 + i * 45, ColorWhite, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
			elseif aowl.CheckUserGroupLevel(v, "trusted") then
				surface.SetMaterial(TrustedIcon)
				surface.DrawTexturedRect(1195, 60 + i * 45, 30, 30)
				draw.SimpleText("Trusted", "MollyPlayer", 1190, 53 + i * 45, ColorWhite, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
			end
		end
	end

	cam.End3D2D()
end)
