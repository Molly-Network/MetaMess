local ColorDarkBlack = Color(24,24,24, 150)
local ColorBlack = Color(32,32,32, 100)
local ColorGreen = Color(32, 201, 151, 255)
local ColorBlue = Color(0, 123, 255, 255)
local ColorRed = Color(220, 53, 69, 255)
local ColorOrange = Color(255, 128, 0)

surface.CreateFont("MollyPlayer", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 16,
	weight = 500,
})

local h = 330
local w = 550
local posw = ScrW()-w-10
local posh = ScrH()-h-100

FPSGraph = {}
PingGraph = {}
ServerFPSGraph = {}
table.insert(FPSGraph,{OldFPS = math.Round(( 1 / FrameTime() )),NewFPS = math.Round(( 1 / FrameTime() ))})
table.insert(ServerFPSGraph,{OldFPS = math.Round(( 1 / engine.ServerFrameTime() )),NewFPS = math.Round(( 1 / engine.ServerFrameTime() ))})
table.insert(PingGraph,{OldPing = LocalPlayer():Ping() ,NewPing = LocalPlayer():Ping() })
-- use this to move to build cam.Start3D2D(Vector(-4222.841797 ,2720.114746 ,-13200.968750),Angle(0,45,90),0.1)

local delay = 0
local num = 1

local SavedMAXFPS = 0
local SavedMinFPS = 300

local PingDelay = 0
local PingNum = 1

hook.Add( "Think", "CurTimeDelay", function()
    if CurTime() < delay then return end
    if num == 0 then
        table.insert(FPSGraph,{OldFPS = math.Round(( 1 / FrameTime() )),NewFPS = math.Round(( 1 / FrameTime() ))})
        table.insert(ServerFPSGraph,{OldFPS = math.Round(( 1 / engine.ServerFrameTime() )),NewFPS = math.Round(( 1 / engine.ServerFrameTime() ))})
        num = 1
    elseif num ~= 0 then
        table.insert(FPSGraph,{OldFPS = FPSGraph[num].NewFPS,NewFPS = math.Round(( 1 / FrameTime() ))})
        table.insert(ServerFPSGraph,{OldFPS = ServerFPSGraph[num].NewFPS,NewFPS = math.Round(( 1 / engine.ServerFrameTime() ))})
    end
    
    --PrintTable(FPSGraph)
    delay = CurTime() + 0.02
    num = num + 1
end)

hook.Add( "Think", "Num", function()
if num >= 110 then 
    table.Empty(FPSGraph)
    table.Empty(ServerFPSGraph)
        table.insert(FPSGraph,{OldFPS = math.Round(( 1 / FrameTime() )),NewFPS = math.Round(( 1 / FrameTime() ))})
        table.insert(ServerFPSGraph,{OldFPS = math.Round(( 1 / engine.ServerFrameTime() )),NewFPS = math.Round(( 1 / engine.ServerFrameTime() ))})
        num = 1
        SavedMAXFPS = 0
        SavedMinFPS = 300
    end
    
    if PingNum  >= 65 then
        table.Empty(PingGraph)
        table.insert(PingGraph,{OldPing = LocalPlayer():Ping() ,NewPing = LocalPlayer():Ping() })
        PingNum = 1
    end
end)

hook.Add("Think","FPS Check", function()
    if  SavedMAXFPS < math.Round(( 1 / FrameTime() )) then
        SavedMAXFPS = math.Round(( 1 / FrameTime() ))
    end
    if  SavedMinFPS > math.Round(( 1 / FrameTime() )) then
        SavedMinFPS = math.Round(( 1 / FrameTime() ))
    end
end)

hook.Add( "HUDPaint", "Sussy", function()
    draw.RoundedBox(10,posw,posh,w,h-30,ColorDarkBlack)

    draw.RoundedBox(5,posw,posh+h-25,20,20,ColorGreen)
    draw.RoundedBox(5,posw+140,posh+h-25,20,20,ColorBlue)
    draw.SimpleText( "Min FPS: " .. SavedMinFPS .. "  Max FPS: "  .. SavedMAXFPS, "MollyPlayer", posw+5,posh+2,ColorWhite,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP )
	draw.SimpleText( "ClientSide FPS: " .. math.Round(( 1 / FrameTime() )), "MollyPlayer", posw+25,posh+h-15,ColorWhite,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER )
	draw.SimpleText( "ServerSide FPS: "  ..  math.Round(( 1 / engine.ServerFrameTime() )), "MollyPlayer", posw+165,posh+h-15,ColorWhite,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER )
	
    for i = 1, 14 do
        surface.SetDrawColor(ColorBlack)
        surface.DrawLine(posw,posh + i*20,posw+w,posh + i*20)
    end

    for i = 1, num do
        if FPSGraph[i].NewFPS <= 20 then
        surface.SetDrawColor(ColorRed)
        
        elseif FPSGraph[i].NewFPS <= 40 then
            surface.SetDrawColor(ColorOrange)
        else
        surface.SetDrawColor(ColorGreen)
        end
        surface.DrawLine(posw-5+5*i,posh+h-30-FPSGraph[i].OldFPS,posw+5*i,posh+h-30-FPSGraph[i].NewFPS)
        
        surface.SetDrawColor(ColorBlue)
        surface.DrawLine(posw-5+5*i,posh+h-30-ServerFPSGraph[i].OldFPS,posw+5*i,posh+h-30-ServerFPSGraph[i].NewFPS)
        
    end

end)
