--values that need to come form a db or some shit idk yet cant do it on client side
	
-- ------>To do<-------
-- Add shadows with mats to shop and products
-- Get mysql integration for token tracking and safty
-- Add better icons [Current ones are fucking scuffed]
-- Maybe add custom fonts or just use cratefont [Current ones look like shit tbh]
-- Clean up the code just its a patchwork of shit 

-- Done shit
-- Dynamic headers
-- Dynamic store widgets
-- Draw for header
-- Make a custom scroller bar
-- Edit or remove original derma frame

	
TokensCount = 2644 -- db
Name = "fuckass" -- hook that im too lazy to do rn also could get of db 
JoinDate = "1/1/2021" -- get this sghit of db 
Playtime = "426" -- Probably ganna use Utime or something maybe just make a custoom thing that links to a db
Metric = "Hours" -- uselees as thes metric will onlt chnage for 60mins max
Title = "Tocken Store v1.0 [Extra sucffed beta version]"



local frame = vgui.Create("DFrame") -- fame needs textures
frame:SetSize(800,650)
frame:Center()
frame:MakePopup()
frame:SetTitle(" ")
frame.Paint = function(self,w,h)
	draw.RoundedBoxEx(10,0,0,w,h,Color(35,35,35),true,true,false,false)
	draw.RoundedBoxEx(10,0,0,w,30,Color(24,24,24),true,true,false,false)
	draw.DrawText(Title,"GModNotify",w/2,5,Color(46,204,113),TEXT_ALIGN_CENTER)
end
frame:ShowCloseButton(false)

local pan1 = vgui.Create("DPanel", frame)
pan1:Dock(TOP)
pan1:SetSize(0,100)
pan1.Paint = function(self,w,h)
	draw.RoundedBox(0,0,0,w,h,Color(35,35,35))
	draw.RoundedBox(20,15,15,w-30,h-20,Color(24,24,24))
	draw.RoundedBox(20,w/2-45,15,w/2+30,h-20,Color(46,204,113))
	draw.RoundedBox(0,w/2-45,15,45,h-20,Color(24,24,24))
	--surface.DrawTexturedRectRotated(20,100,w-30,20,0)
	--surface.SetMaterial(Material("vgui/gradient_down"))
end

local Close = vgui.Create("DButton", frame)
	Close:SetSize(25,25)
	Close:SetText(" ")
	Close:SetPos(frame:GetWide()-30,0)
	Close.DoClick = function()
	frame:Close()
	end
	Close.Paint = function(self, w, h)
		if (self:IsDown()) then
		draw.RoundedBox(100,5,5,17,17,Color(179, 0, 0))
		elseif(self:IsHovered()) then
		draw.RoundedBox(100,5,5,17,17,Color(255, 0, 0))
		else
		draw.RoundedBox(100,5,5,17,17,Color(230, 0, 0))
		end
	end
	

	local Avatar = vgui.Create( "AvatarImage", pan1 )
	Avatar:SetSize( 64, 64 )
	Avatar:SetPos( 33, 24 )
	Avatar:SetPlayer( LocalPlayer(), 64 )
	
local NameText = vgui.Create( "DLabel", pan1 )
NameText:SetText( Name )
NameText:SetSize(250,40)
NameText:SetPos(105,15)
NameText:SetFont("ScoreboardDefaultTitle")
NameText:SetColor(Color(242,242,242))

local DateText = vgui.Create( "DLabel", pan1 )
DateText:SetText( JoinDate )
DateText:SetSize(250,40)
DateText:SetPos(105,40)
DateText:SetFont("GModNotify")
DateText:SetColor(Color(242,242,242))

local TimeText = vgui.Create( "DLabel", pan1 )
TimeText:SetText( Playtime .." " .. Metric )
TimeText:SetSize(250,40)
TimeText:SetPos(105,60)
TimeText:SetFont("GModNotify")
TimeText:SetColor(Color(242,242,242))

local Tokens = vgui.Create( "DLabel", pan1 )
Tokens:SetText( "Tokens: ".. TokensCount)
Tokens:SetSize(500,50)
Tokens:SetPos(335,30)
Tokens:SetFont("GModToolScreen")
Tokens:SetColor(Color(242,242,242))
Tokens:SetContentAlignment(5)

local storelist = vgui.Create( "DScrollPanel", frame )
storelist:Dock(FILL)
storelist.Paint = function(self,w,h)
	draw.RoundedBox(0,0,0,w,h,Color(35,35,35))
end

    local scrollbar = storelist:GetVBar()
    scrollbar:SetHideButtons(true)

    function scrollbar:Paint()
    end

    function scrollbar.btnGrip:Paint(w, h)
	draw.RoundedBox(100,3,0,w-5,h,Color(46,204,113))
    end

--StoreHeaders( pairname ,text ,width ,hight )
local function Store(text)
	tab = storelist
    local Header = tab:Add("DLabel")
	Header:SetText( text )
	Header:SetSize(w,30)
	Header:SetFont("DermaLarge")
	Header:Dock(TOP)
	Header:DockMargin(15, 10, 0, 0)
	Header:SetColor(Color(242,242,242))
	local Line = tab:Add("DPanel")
	Line:Dock(TOP)
	Line:DockMargin(0, 10, 0, 0)
	Line.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,3,Color(24,24,24))
	end
	
	Grid = tab:Add( "DIconLayout" )
	Grid:Dock(TOP)
	Grid:DockMargin(15, 0, 0, 0)
	Grid:SetSpaceY( 30 )
	Grid:SetSpaceX( 50 )
		return Grid
	
end

--Product()
local function Product(tab,name,description,price,icon)
	local Body = tab:Add("DPanel")
	Body:SetSize(350,100)
	Body.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(24,24,24))
		draw.RoundedBox(100,10,15,70,70,Color(35,35,35))
		draw.RoundedBox(0,230,0,3,h,Color(35,35,35))
	end
	
	Icon = Body:Add("DImage")
	Icon:SetPos(20,24)
	Icon:SetSize(50,50)
	Icon:SetImage(icon)
	
	local TitleText = Body:Add( "DLabel" )
	TitleText:SetText( name )
	TitleText:SetSize(250,40)
	TitleText:SetPos(90,5)
	TitleText:SetFont("ScoreboardDefault")
	TitleText:SetColor(Color(242,242,242))

	local Description = Body:Add( "DLabel" )
	Description:SetText( description )
	Description:SetSize(140,50)
	Description:SetPos(90,35)
	Description:SetWrap(true)
	Description:SetAutoStretchVertical(true)
	Description:SetColor(Color(200,200,200))

	-- Button

	local BuyButton = Body:Add("DButton")
	BuyButton:SetText(" ")
	BuyButton:SetPos(233,0)
	BuyButton:SetSize(117,100)
	BuyButton.Paint = function(self, w, h)
		if (self:IsDown()) then
		draw.RoundedBox(0,0,0,w,h,Color(24,24,24))
		draw.DrawText("BUY NOW","GModNotify",w/2,60,Color(46,204,113),TEXT_ALIGN_CENTER)
		
		elseif(self:IsHovered()) then
		draw.RoundedBox(0,0,0,w,h,Color(30,30,30))
		draw.DrawText("BUY NOW","GModNotify",w/2,60,Color(204, 255, 204),TEXT_ALIGN_CENTER)
		else
		draw.RoundedBox(0,0,0,w,h,Color(24,24,24))
		draw.DrawText("BUY NOW","GModNotify",w/2,60,Color(200,200,200),TEXT_ALIGN_CENTER)
		end
	end
	
	Tokens = BuyButton:Add( "DLabel" )
	Tokens:SetText( tostring(price) )
	Tokens:SetSize(117,0)
	Tokens:SetPos(0,10)
	Tokens:SetFont("ContentHeader")
	Tokens:SetContentAlignment(5)
	Tokens:SetAutoStretchVertical(true)
	Tokens:SetColor(Color(242,242,242))
	
end

--=================================
--   ______            _____          
--  / ____/___  ____  / __(_)___ _    
-- / /   / __ \/ __ \/ /_/ / __ `/    
--/ /___/ /_/ / / / / __/ / /_/ /     
--\____/\____/_/ /_/_/ /_/\__, /      
--                       /____/       
--=================================

--Rules of the config [Look down of examples]
--local name of category = Store("Title of Category")
--Product(name of category,"title","description",cost,"icon image")

--XP Category
local XP = Store("XP")
Product(XP,"10,000 XP","You will receive 10,000 XP upon purchase.",10,"icon16/flag_green.png")
Product(XP,"50,000 XP","You will receive 50,000 XP upon purchase.",50,"icon16/flag_blue.png")
Product(XP,"100,000 XP","You will receive 100,000 XP upon purchase.",100,"icon16/flag_red.png")
Product(XP,"1,000,000 XP","You will receive 1,000,000 XP upon purchase.",1000,"icon16/flag_yellow.png")

--Crate Category
local Crates = Store("Crates")
Product(Crates,"Vape Crate","Try your luck and see what vape you get.",10,"icon16/package.png")
Product(Crates,"Cash Crate","You will receive cash crate upon purchase.",10,"icon16/package_add.png")
Product(Crates,"Knife Crate","You will receive knife crate upon purchase.",50,"icon16/package_green.png")
Product(Crates,"Perma Crate","You will receive permanent crate upon purchase.",100,"icon16/package_link.png")

--Cash Category
local Cash = Store("Cash")
Product(Cash,"100k Cash","Short on cash go ahead and but this pack.",10,"icon16/coins.png")
Product(Cash,"1M Cash","Short on cash go ahead and but this pack.",90,"icon16/coins_add.png")
Product(Cash,"10M Cash","Short on cash go ahead and but this pack.",800,"icon16/money.png")
Product(Cash,"100M Cash","Short on cash go ahead and but this pack.",7000,"icon16/money_add.png")

--Rank Category
local Ranks = Store("Ranks")
Product(Ranks,"Bronze Rank","Find the perks of this rank on our site",100,"icon16/award_star_bronze_2.png")
Product(Ranks,"Silver Rank","Find the perks of this rank on our site",1000,"icon16/award_star_silver_2.png")
Product(Ranks,"Gold Rank","Find the perks of this rank on our site",10000,"icon16/award_star_gold_2.png")

--If u read this u ultra gay :)
