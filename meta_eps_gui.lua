local function ESP_Settings(frame)
end

if file.IsDir("espdata","DATA") then
	else
		file.CreateDir("espdata")
end


local RockCopper = {}
local RockSilver = {}
local RockGold = {}
local OreCopper = {}
local OreSilver = {}
local OreGold = {}
local OrePlatinum = {}
local Coins = {}
local Xen = {}

local function ColorRestore(tablename)
	local oldCol = tablename
	tablename = Color(oldCol.r, oldCol.g, oldCol.b, oldCol.a)
end


function ReadStoreData()

	local JSONDataCopperRock = file.Read("espdata/rockcopper.json")
	local JSONDataSilverRock = file.Read("espdata/rocksilver.json")
	local JSONDataGoldRock = file.Read("espdata/rockgold.json")
	local JSONDataCopperOre = file.Read("espdata/orecopper.json")
	local JSONDataSilverOre = file.Read("espdata/oresilver.json")
	local JSONDataGoldOre = file.Read("espdata/oregold.json")
	local JSONDataPlatinumOre = file.Read("espdata/oreplatinum.json")
	local JSONDataCoins = file.Read("espdata/coins.json")
	local JSONDataXen = file.Read("espdata/xen.json")

	RockCopper = util.JSONToTable(JSONDataCopperRock)
	RockSilver = util.JSONToTable(JSONDataSilverRock)
	RockGold = util.JSONToTable(JSONDataGoldRock)
	OreCopper = util.JSONToTable(JSONDataCopperOre)
	OreSilver = util.JSONToTable(JSONDataSilverOre)
	OreGold = util.JSONToTable(JSONDataGoldOre)
	OrePlatinum = util.JSONToTable(JSONDataPlatinumOre)
	Coins = util.JSONToTable(JSONDataCoins)
	Xen = util.JSONToTable(JSONDataXen)

end


ReadStoreData()

local currenttable = RockCopper

local offsetxval = 40
local offsetyval = 6
local font = "Default"
local colourbox = Color(255,120,0,100)
local boxcorner = 5
local boxw = 80
local boxh = 15



-- number input list item

function labelnw (parent,value,labeltext,buttontext)
	
	local panel = parent:Add("DPanel")
	panel.Paint = function(self,w,h)
	end

	text = vgui.Create("DLabel",panel)
	text:SetText(labeltext)
	text:Dock(FILL)
	
	local button = vgui.Create("DButton",panel)
	button:SetText(buttontext)
	button:Dock(RIGHT)
	
	local wang = vgui.Create("DTextEntry",panel)
	wang:SetValue(value)
	wang:SetNumeric(true)
	wang:SetWidth(40)
	wang:Dock(RIGHT)
	
	return button,wang
end

-- Checkbox with label
function labelcb (parent,value,labeltext)
	
	local panel = parent:Add("DPanel")
	panel.Paint = function(self,w,h)
	end

	text = vgui.Create("DLabel",panel)
	text:SetText(labeltext)
	text:Dock(FILL)
	
	local checkbox = panel:Add( "DCheckBox" )
	checkbox:Dock(RIGHT)
	checkbox:DockMargin(5,5,4,5)
	checkbox:SetValue( value )

	
	return checkbox
	
end

-- Title panle
local function selecttitle(parent,titletext)
	
	local panel = parent:Add("DPanel")
	panel.Paint = function(self,w,h)
	surface.SetDrawColor(159,75,163)
    surface.DrawRect(0,0,w,h)
    surface.SetDrawColor(110,47,109)
    surface.DrawRect(0,h-4,w,4)
	end

	text = vgui.Create("DLabel",panel)
	text:SetText(titletext)
	text:Dock(FILL)
	text:SetTextColor(Color(255,255,255))
end

-- Header
local function selecttitlehead(parent,titletext)
	
	local panel = parent:Add("DPanel")
	panel.Paint = function(self,w,h)
	draw.RoundedBox(7,0,0,w,h,Color(159,75,163))
	surface.SetDrawColor(110,47,109)
    surface.DrawRect(0,h-4,w,4)
	end

	text = vgui.Create("DLabel",panel)
	text:SetText(titletext)
	text:Dock(FILL)
	text:SetTextColor(Color(255,255,255))
end

local frame = vgui.Create( "DFrame" )
frame:SetSize( 900, 500 )
frame:SetTitle("Meta ESP")
frame:Center()
frame:MakePopup()

local selectpanel = vgui.Create("DScrollPanel")

local view = vgui.Create("DPanel")

local div = vgui.Create( "DHorizontalDivider", frame )
div:Dock( FILL )
div:SetLeft( selectpanel )
div:SetRight( view )
div:SetDividerWidth( 4 )
div:SetLeftMin( 200 )
div:SetRightMin( 300 )
div:SetLeftWidth( 250 )

local layout = vgui.Create("DListLayout", selectpanel)
layout:Dock(FILL)
layout:SetPaintBackground(true)
layout:SetBackgroundColor(Color(45,45,45))
layout.Paint = function(self,w,h)
	draw.RoundedBox(7,0,0,w,h,Color(45,45,45))
	surface.SetDrawColor(45,45,45)
    surface.DrawRect(0,h-10,w,10)
end

selecttitlehead(layout," Pick entity" )

entitycombo = layout:Add("DComboBox")
entitycombo:SetValue("Select entity")
entitycombo:AddChoice("Rock")
entitycombo:AddChoice("Ore")
entitycombo:AddChoice("Xen")
entitycombo:AddChoice("Coins")

selecttitle(layout," Pick rarity")

raritycombo = layout:Add("DComboBox")

selecttitle(layout," Color" )



local Mixer = layout:Add("DColorMixer")
Mixer:SetPalette(true)
Mixer:SetAlphaBar(true)
Mixer:SetWangs(true)
Mixer:SetEnabled(true)

local setmixer = layout:Add("DButton")
setmixer:SetText("Set color")
setmixer.DoClick = function()
	currenttable.BoxColor = Mixer:GetColor() 
end

checkbox = labelcb(layout,false," Set to rainbow")

	function checkbox:OnChange(val)
		if val then
		Mixer:SetEnabled(false)
		currenttable.RainbowStatus = true
		currenttable.MixerStatus = false
		hook.Add("Think","RGB", function()
			currenttable.BoxColor = HSVToColor(( CurTime()*20)%360,1,1)
		end)

			else 
		hook.Remove("Think","RGB")
		Mixer:SetEnabled(true)
		currenttable.MixerStatus = true
		currenttable.BoxColor = Mixer:GetColor()
		end
	end

selecttitle(layout," Text settings" )

local fontinput = layout:Add("DPanel")
fontinput.Paint = function(self,w,h)
end
	
fonttext = vgui.Create("DTextEntry",fontinput)
fonttext:SetText(currenttable.Font)
fonttext:Dock(FILL)

fontbutton = vgui.Create("DButton",fontinput)
fontbutton:SetText("Set font")
fontbutton:Dock(RIGHT)
fontbutton.DoClick = function()
	currenttable.Font = fonttext:GetValue()
end

local offxval,offxnw = labelnw(layout,offsetxval," X offset","Set value",true)
offxval.DoClick = function()
	currenttable.OffsetX = tonumber(offxnw:GetValue())
end
local offyval,offynw = labelnw(layout,offsetyval," Y offset","Set value",true)
offyval.DoClick = function()
	currenttable.OffsetY = tonumber(offynw:GetValue())
end


selecttitle(layout," Box settings" )

local boxcorval,corval = labelnw(layout,boxcorner," Corner size","Set value",true)
boxcorval.DoClick = function()
	currenttable.BoxCorners = tonumber(corval:GetValue())
end

local boxwval,boxwnval = labelnw(layout,boxw," Box width","Set value",true)
boxwval.DoClick = function()
	currenttable.BoxWidth = tonumber(boxwnval:GetValue())
end

local boxhval,boxhnw = labelnw(layout,boxh," Box hight","Set value",true)
boxhval.DoClick = function()
	currenttable.BoxHight = tonumber(boxhnw:GetValue())
end

savepanel = view:Add("DPanel")
savepanel:Dock(BOTTOM)
savepanel.Paint = function(self,w,h)
end

savebutton = vgui.Create("DButton",savepanel)
savebutton:SetText("Save changes")
savebutton:SetWidth(100)
savebutton:Dock(RIGHT)
savebutton.DoClick = function()
	
local rockcoppercon = util.TableToJSON(RockCopper)
local rocksilvercon = util.TableToJSON(RockSilver)
local rockgoldcon = util.TableToJSON(RockGold)
local orecoppercon = util.TableToJSON(OreCopper)
local oresilvercon = util.TableToJSON(OreSilver)
local oregoldcon = util.TableToJSON(OreGold)
local oreplatinumcon = util.TableToJSON(OrePlatinum)
local coinscon = util.TableToJSON(Coins)
local xencon = util.TableToJSON(Xen)
	file.Write("espdata/rockcopper.json", rockcoppercon)
	file.Write("espdata/rocksilver.json", rocksilvercon)
	file.Write("espdata/rockgold.json", rockgoldcon)
	file.Write("espdata/orecopper.json", orecoppercon)
	file.Write("espdata/oresilver.json", oresilvercon)
	file.Write("espdata/oreplatinum.json", oreplatinumcon)
	file.Write("espdata/oregold.json", rockgoldcon)
	file.Write("espdata/coins.json", coinscon)
	file.Write("espdata/xen.json", xencon)
	
end

local icon = vgui.Create( "DModelPanel", view )
icon:Dock(FILL)
icon:SetModel( "models/props_wasteland/rockgranite02a.mdl" )
icon:SetColor(currenttable.RockColor)
icon:SetLookAt(Vector(10,0,0))
icon:SetFOV(120)

local function seteverything()
	icon:SetColor(currenttable.RockColor)
	Mixer:SetColor(currenttable.BoxColor)
	fonttext:SetText(currenttable.Font)
	offxnw:SetValue(currenttable.OffsetX)
	offynw:SetValue(currenttable.OffsetY)
	corval:SetValue(currenttable.BoxCorners)
	boxwnval:SetValue(currenttable.BoxWidth)
	boxhnw:SetValue(currenttable.BoxHight)
end

local function addoptions(func,val)
	func:SetValue("Select rarity")
	func:AddChoice("Copper")
	func:AddChoice("Silver")
	func:AddChoice("Gold")
	
	if val then
		func:AddChoice("Platinum")
	end
end

entitycombo.OnSelect = function( self, index, value )
	if value == "Coins" then
		icon:SetModel( "models/props_pipes/pipe03_connector01.mdl" )
		raritycombo:Clear()
		raritycombo:SetValue("No value avalable")
		currenttable = Coins
		seteverything()
	elseif value == "Ore" then
		icon:SetModel( "models/props_combine/breenbust_chunk05.mdl" )
		icon:SetFOV(30)
		icon:SetLookAt(Vector(5,0,0))
		raritycombo:Clear()
		addoptions(raritycombo,true)
	elseif value == "Xen" then
		icon:SetModel( "models/props_wasteland/rockgranite02a.mdl" )
		raritycombo:Clear()
		raritycombo:SetValue("No value avalable")
		currenttable = Xen
		seteverything()
	else 
		icon:SetModel( "models/props_wasteland/rockgranite02a.mdl" )
		icon:SetFOV(120)
		raritycombo:Clear()
		addoptions(raritycombo,false)	
	end
end

raritycombo.OnSelect = function( self, index, value )
	if entitycombo:GetValue() == "Rock" then
		if value == "Gold" then
			currenttable = RockGold
			seteverything()
		elseif value == "Silver" then
			currenttable = RockSilver
			seteverything()
		else
			currenttable = RockCopper
			seteverything()
	end
	elseif entitycombo:GetValue() == "Ore" then
		if value == "Gold" then
			currenttable = OreGold
			seteverything()
		elseif value == "Silver" then
			currenttable = OreSilver
			seteverything()
		elseif value == "Platinum" then
			currenttable = OrePlatinum
			seteverything()
		else
			currenttable = OreCopper
			seteverything()
	end
	end
end




local cover = view:Add("DPanel")
cover:Dock(FILL)
cover:SetPos(0,0)
cover.Paint = function(self,w,h)
	draw.RoundedBox(currenttable.BoxCorners,w/2,h/2,currenttable.BoxWidth,currenttable.BoxHight,currenttable.BoxColor)
	draw.SimpleText( currenttable.Name,currenttable.Font, w/2+currenttable.OffsetX,h/2+currenttable.OffsetY, Color( 0,0,0,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

local esppanel = icon:Add("DPanel")
esppanel:SetSize(200,120)
esppanel:SetPos(10,10)
esppanel.Paint = function(self,w,h)
	draw.RoundedBox(5,0,0,w,h,Color(45,45,45))
	
		draw.RoundedBox(currenttable.BoxCorners,w/2-currenttable.BoxWidth/2,h/2-currenttable.BoxHight/2,currenttable.BoxWidth,currenttable.BoxHight,currenttable.BoxColor)
	draw.SimpleText( currenttable.Name,currenttable.Font, w/2+currenttable.OffsetX-currenttable.BoxWidth/2,h/2+currenttable.OffsetY-currenttable.BoxHight/2, Color( 0,0,0,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end
