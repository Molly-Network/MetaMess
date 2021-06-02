--[[
⠈⡀⠁⠂⢀⢀⠁⠐⠂⡀⠄⠠⠄⠐⠄⠂⠈⠁⠂⡀⠠⠈⠄⠁⠈⠂⡀⠈⠂⠁⠠⠁⠁⠁⡀⠐⡀⠐⠁⠈⠈⢀⢀⠠⠈⢀⠁⠠⠂⠠⠐⠐⠐⠂⠁⡀⠐⠁⠈⠠⠈⠂⡀⠂⡀⠂⢀⠂⡀⠄⠄⠠⢀⠈⠄
⠄⢀⡀⡀⠈⠄⠂⠠⡀⠈⠠⠠⠁⠁⠂⢀⠄⠁⠄⠁⠐⠠⠂⠁⠠⠂⠈⡀⡀⠄⠂⠐⠐⠠⠐⡀⠈⠁⠂⠈⡀⢀⠁⡀⢀⠂⠠⠠⡀⠄⢀⣴⣶⣿⣶⡀⠄⠠⢀⣴⣾⣿⣷⣄⠄⠂⠁⠄⡀⠂⠄⡀⠁⠐⠐
⠁⠂⡀⠂⠄⣠⣤⣶⣴⣶⣄⠐⡀⠐⢀⣠⣴⣶⣶⣶⣄⠐⠁⢀⠁⣠⣴⣶⣴⣶⣤⡀⡀⠐⠂⠂⠁⠐⠄⠄⠐⠈⠂⠈⠄⡀⠂⠈⡀⢰⣿⡿⠉⢹⣿⣧⠐⢀⣾⣿⠋⠙⣿⣯⠈⠁⠂⢀⢀⢀⡀⠂⠐⠠⠠
⠄⠁⠠⣠⣾⣿⠿⠿⢿⣿⣿⡇⢀⣰⣿⣿⠿⠿⢿⣿⣿⡆⡀⣠⣿⣿⠿⠿⣿⣿⣿⣷⠠⠈⠐⢀⠄⠠⠠⠠⠁⠄⠂⠐⠄⠄⠂⠠⢠⣿⣿⠁⠁⢸⣿⡿⢀⣾⣿⡇⠂⠂⣿⣿⠠⢀⡀⠐⠂⠄⢀⡀⠄⠁⡀
⠂⢀⢰⣟⠟⠁⡀⠁⢸⣿⣻⡇⣼⣿⠋⢀⠄⠐⠈⣿⣿⡇⣰⣿⠟⠁⠐⠄⢸⣿⣿⣿⠁⠂⢀⠂⡀⢀⢀⠄⠁⠄⠂⢀⠂⡀⡀⢀⣿⣿⡏⠄⠈⣼⣿⡇⣼⣻⡿⠐⠈⢸⣿⡟⠂⠁⠐⠄⠄⠁⠂⠐⠄⠄⠂
⠄⠠⠄⠁⡀⡀⢀⠄⣸⣿⣿⣸⡿⠃⠄⢀⠠⢀⢰⣿⣿⣷⣿⠃⡀⠁⡀⠈⢸⣿⣿⡟⠈⠄⠠⠁⡀⠠⠂⠠⠠⠄⠂⠐⠂⡀⠈⢸⣿⣿⠁⡀⢀⣿⡿⢠⣿⣿⡇⠐⠁⣾⣿⠃⡀⠄⠁⢀⠠⠠⢀⠂⠄⠄⠠
⠂⠁⠁⡀⠄⠈⠂⠁⣻⣿⣿⣿⠃⢀⠄⠄⠄⠠⢸⣿⣿⣿⠇⠂⠐⠠⠠⠄⣿⣿⣿⠇⠈⠁⠐⠂⠐⠁⠈⡀⠐⠐⠈⠁⠐⠐⠐⣾⣿⣿⢀⢀⣾⣿⠃⣸⣿⣿⡀⡀⣸⣿⠏⠠⡀⠁⠈⡀⠂⠠⢀⢀⡀⠂⠄
⠐⢀⢀⠈⠈⠂⠠⢠⣿⣿⢿⡏⠈⠁⠠⡀⠄⠠⣼⣿⣿⡟⠁⠠⠁⠂⠂⢸⣿⣿⡿⠐⠐⠐⠄⡀⣠⣴⣾⣿⣿⣷⣦⡀⢀⢀⢠⣿⣿⡇⠂⣼⡿⠃⠁⣿⣿⢿⠁⣰⣿⠏⢀⠐⣴⣿⣿⠐⠈⠠⣾⣿⡇⠁⠂
⢀⠁⠐⠐⠂⢀⠐⢸⣿⣿⣿⠁⢀⠐⠠⠈⠂⢰⣿⣿⣿⠃⠂⠄⠐⠐⠐⣿⣿⣿⡇⠁⠈⡀⢀⣼⣿⣿⠟⠉⣽⣿⣿⣿⡀⠐⢸⣿⣿⣇⣾⣿⠃⠈⠂⣿⣿⣏⣴⣿⠏⡀⠄⢸⣿⣿⠇⢀⠂⣸⣿⣿⠇⠄⢀
⢀⠂⢀⢀⠂⠐⠄⣿⣿⣿⡇⡀⠐⠐⠈⠠⠂⣸⣿⣿⡟⠠⢀⢀⠄⠂⢀⣿⣿⣿⢀⠐⠐⠐⢰⣿⣿⡏⠈⠈⠹⣿⣿⣿⣷⣶⣾⣿⣿⣿⡿⠁⠐⠈⠠⣿⣿⣿⣿⠋⠠⠂⡀⣾⣿⣿⠐⠁⢠⣿⣿⣿⠠⠂⢀
⠂⠐⠂⠠⢀⡀⢀⣿⣿⣿⠂⠂⢀⠄⠁⠄⡀⣿⣿⣿⡇⠈⠐⠁⠂⠠⢸⣿⣾⣿⠂⠄⠄⠈⢰⣿⣿⣇⢀⢀⠁⢸⣿⣿⠛⠛⠙⣿⣿⣟⠐⡀⠄⠠⣠⣿⣿⣾⠁⠄⡀⠂⢀⣷⣿⣿⠐⣠⣾⣿⣿⡏⠠⠁⡀
⠐⠁⡀⠁⠐⠐⢸⣿⣿⣿⠁⠠⠈⠈⡀⠐⢰⣿⣿⣿⠁⠄⠁⠁⠂⢀⠈⢿⣿⣿⣷⣦⣴⣾⣿⣿⣿⣿⣦⣤⣴⣿⡿⠏⠈⠄⠄⢻⣿⣿⣦⣤⣤⣾⣿⠿⣿⣿⣧⣤⣤⣶⣿⣿⣿⣿⣾⣿⢋⣿⣿⠇⢀⠠⠐
⠁⠄⠈⠄⠂⠠⠘⠿⠽⠇⠂⠁⠐⠄⠁⠈⠈⠿⠿⠟⠐⠠⢀⠈⡀⠠⠁⠈⠙⠿⠿⠿⠯⠛⠁⠠⠙⠻⠿⠽⠿⠋⠁⠄⠁⡀⢀⠐⠙⠿⠿⠿⠟⠛⠁⠂⠈⠹⠿⠿⠿⠛⠁⠈⠻⠿⠟⠁⣸⣿⣿⡀⠐⢀⠁
⠂⠄⡀⡀⠁⠄⠐⡀⠁⠂⠁⠄⠂⡀⠁⡀⠄⢀⠁⠐⢀⠂⠁⠁⠠⠈⠂⠠⠈⡀⠄⠄⢀⠄⠁⠁⠂⠁⠈⠐⠠⡀⠁⠐⡀⠂⡀⢀⢀⢀⠄⠠⠁⡀⡀⢀⠈⢀⠂⠁⠂⢀⠄⠁⡀⢀⣴⣿⣿⣿⡇⠂⡀⡀⠈
⡀⠂⠁⠁⢀⠁⠐⠁⠈⡀⠠⡀⠈⢀⠐⠈⠈⠁⡀⠁⠐⢀⢀⠄⠐⠠⠠⢀⣀⡀⠂⠐⣀⡀⡀⠠⠁⠠⢀⠂⠁⠐⢀⠄⠈⠈⢀⠄⠐⢀⠂⠁⠈⠐⣠⠄⠁⡀⠠⠠⠠⠂⠐⢀⣴⣿⠟⢩⣿⣿⠁⡀⢀⠄⠈
⢀⢀⠐⠠⠂⠈⠈⢀⡀⠐⠁⠐⡀⠐⢀⠁⠄⠐⠈⠈⠐⢀⠈⠐⢀⠐⠂⢀⡿⢷⡄⢸⡇⢀⡤⢤⡄⢤⣿⠄⣤⢀⣠⡄⢠⡄⢠⡤⢤⡄⢀⣤⣤⢀⣿⢀⡤⠐⡀⠄⡀⠐⣰⣿⡿⠁⠁⣾⣿⡇⡀⡀⠐⡀⠂
⠂⠂⠈⠠⠈⡀⠈⠂⠂⠄⢀⠂⠠⠁⠠⠁⠠⠄⡀⠐⡀⠐⠈⢀⠄⠂⠈⢸⡇⠈⢷⣾⠃⢾⡗⢚⠁⢸⡇⠠⢹⣰⠋⣧⡞⡀⣿⡀⣸⡇⣸⡏⠠⢸⡟⣿⡀⠈⠐⠁⢀⢠⣿⣟⡀⢀⣸⣿⡟⠂⠈⠐⠄⠐⠁
⠂⢀⠈⠄⠄⠈⢀⢀⠄⠠⠁⠐⢀⠐⠄⠂⠁⠐⠈⠁⠈⠁⠄⠄⠐⡀⠐⠉⢀⢀⠈⠉⠈⠈⠉⠉⢀⠈⠉⠈⠈⠁⡀⠉⠈⡀⠈⠉⠁⠠⠉⠂⡀⠉⠁⠈⠁⠐⠐⠄⠄⠘⣿⡿⣦⣾⣿⠟⠠⠠⢀⠄⠠⠂⠠
⢀⠄⡀⠈⠂⢀⠄⠄⠠⠂⠐⠐⠁⠈⠄⠁⠠⠁⠐⡀⠄⠄⠄⠠⡀⠄⡀⠠⠂⠐⠄⠈⠂⢀⠄⠈⠠⢀⢀⠈⠁⠂⡀⢀⡀⢀⡀⡀⠁⢀⠂⠐⠂⠂⠈⠈⠁⠐⠈⡀⡀⠐⠈⠙⠛⠋⠁⠂⠐⠈⠠⠈⠂⠄⢀
⢀⠈⡀⠁⠂⢀⡀⠂⠂⠈⠄⢀⠠⠄⡀⠠⠄⠁⡀⡀⠐⢀⢀⠈⡀⡀⠠⠈⢀⠁⠄⠄⢀⠈⠁⢀⠠⠠⠈⠈⠄⠐⡀⠠⠐⠂⠠⠐⠈⠐⠐⢀⠁⠂⢀⠈⠂⡀⢀⠈⠈⠄⠂⠠⢀⠂⡀⠠⠂⠂⠐⠂⠠⡀⠠
MetaHelper 0.2 - MetaEPS
]]--

-- Checks if espdata exists if not it creates one

if file.IsDir("espdata","DATA") then
	else
		file.CreateDir("espdata")
end

--[[
==================================================
       __                 ____                 __
      / /________  ____  / __ \___  ____ _____/ /
 __  / / ___/ __ \/ __ \/ /_/ / _ \/ __ `/ __  / 
/ /_/ (__  ) /_/ / / / / _, _/  __/ /_/ / /_/ /  
\____/____/\____/_/ /_/_/ |_|\___/\__,_/\__,_/   

==================================================
]]--

local RockCopper = {}
local RockSilver = {}
local RockGold = {}
local OreCopper = {}
local OreSilver = {}
local OreGold = {}
local OrePlatinum = {}
local Coins = {}
local Xen = {}

-- Reads json files and conversts to tabels
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
	local JSONDataEsp = file.Read("espdata/esptick.json")

	RockCopper = util.JSONToTable(JSONDataCopperRock)
	RockSilver = util.JSONToTable(JSONDataSilverRock)
	RockGold = util.JSONToTable(JSONDataGoldRock)
	OreCopper = util.JSONToTable(JSONDataCopperOre)
	OreSilver = util.JSONToTable(JSONDataSilverOre)
	OreGold = util.JSONToTable(JSONDataGoldOre)
	OrePlatinum = util.JSONToTable(JSONDataPlatinumOre)
	Coins = util.JSONToTable(JSONDataCoins)
	Xen = util.JSONToTable(JSONDataXen)
	ESPCheck = util.JSONToTable(JSONDataEsp)

end


ReadStoreData()
function ESP_Settings(frame)

-- sets curretn table

local currenttable = RockCopper

-- legecy values
local offsetxval = 40
local offsetyval = 6
local colourbox = Color(255,120,0,100)
local boxcorner = 5
local boxw = 80
local boxh = 15

--[[
=====================================================
    ______                 _____      __            
   / ____/_  ______  _____/ ___/___  / /___  ______ 
  / /_  / / / / __ \/ ___/\__ \/ _ \/ __/ / / / __ \
 / __/ / /_/ / / / / /__ ___/ /  __/ /_/ /_/ / /_/ /
/_/    \__,_/_/ /_/\___//____/\___/\__/\__,_/ .___/ 
                                           /_/      
=====================================================
]]--

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
	
	return panel
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
	
	return panel
end

-- checkbox function
local function imagecheckbox(parent,textcheck)
	local RulePanel = parent:Add( "DPanel" )
	RulePanel:Dock( TOP )
	RulePanel:DockMargin( 0, 1, 0, 0 )

	local ImageCheckBox = RulePanel:Add( "DCheckBox" )
	ImageCheckBox:SetWidth( 24 )
	ImageCheckBox:Dock( LEFT )

	local DLabel = RulePanel:Add( "DLabel" )
	DLabel:SetText( textcheck )
	DLabel:Dock( FILL )
	DLabel:DockMargin( 5, 0, 0, 0 )
	DLabel:SetTextColor( Color( 0, 0, 0 ) )
	
	return ImageCheckBox
end

-- vertical devied setup
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

--[[
================================
    ______      __  _ __       
   / ____/___  / /_(_) /___  __
  / __/ / __ \/ __/ / __/ / / /
 / /___/ / / / /_/ / /_/ /_/ / 
/_____/_/ /_/\__/_/\__/\__, /  
                      /____/   
================================
]]--
selecttitlehead(layout," Pick entity" )

entitycombo = layout:Add("DComboBox")
entitycombo:SetValue("Select entity")
entitycombo:AddChoice("Rock")
entitycombo:AddChoice("Ore")
entitycombo:AddChoice("Xen")
entitycombo:AddChoice("Coins")

--[[
================================
    ____             _ __       
   / __ \____ ______(_) /___  __
  / /_/ / __ `/ ___/ / __/ / / /
 / _, _/ /_/ / /  / / /_/ /_/ / 
/_/ |_|\__,_/_/  /_/\__/\__, /  
                       /____/   
================================
]]--

selecttitle(layout," Pick rarity")
raritycombo = layout:Add("DComboBox")

--[[
================================
   ______      __          
  / ____/___  / /___  _____
 / /   / __ \/ / __ \/ ___/
/ /___/ /_/ / / /_/ / /    
\____/\____/_/\____/_/     
                           
================================
]]--
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

--[[
================================
  ______          __ 
 /_  __/__  _  __/ /_
  / / / _ \| |/_/ __/
 / / /  __/>  </ /_  
/_/  \___/_/|_|\__/  

================================
]]--

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

--[[
================================
    ____            
   / __ )____  _  __
  / __  / __ \| |/_/
 / /_/ / /_/ />  <  
/_____/\____/_/|_|  

================================
]]--

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

--[[
================================
   _____                
  / ___/____ __   _____ 
  \__ \/ __ `/ | / / _ \
 ___/ / /_/ /| |/ /  __/
/____/\__,_/ |___/\___/ 

================================
]]--

savepanel = view:Add("DPanel")
savepanel:Dock(BOTTOM)
savepanel.Paint = function(self,w,h)
end


savebutton = vgui.Create("DButton",savepanel)
savebutton:SetText("Save changes")
savebutton:SetWidth(100)
savebutton:Dock(RIGHT)
savebutton:DockPadding(0,0,10,10)

local savetext = vgui.Create("DLabel", savepanel)
savetext:SetText("DONT FORGET TO SAVE")
savetext:SetFont("GModNotify")
savetext:SetWidth(210)
savetext:SetTextColor(Color(255,0,0))
savetext:Dock(RIGHT)

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

savetext:SetTextColor(Color(0,255,0))
end

--[[
================================
    __  ___          __     __
   /  |/  /___  ____/ /__  / /
  / /|_/ / __ \/ __  / _ \/ / 
 / /  / / /_/ / /_/ /  __/ /  
/_/  /_/\____/\__,_/\___/_/   

================================
]]--

local icon = vgui.Create( "DModelPanel", view )
icon:Dock(FILL)
icon:SetModel( "models/props_wasteland/rockgranite02a.mdl" )
icon:SetColor(currenttable.RockColor)
icon:SetLookAt(Vector(10,0,0))
icon:SetFOV(120)

--[[
======================================================
   ______                __          __              
  / ____/___  ____ ___  / /_  ____  / /_  ____  _  __
 / /   / __ \/ __ `__ \/ __ \/ __ \/ __ \/ __ \| |/_/
/ /___/ /_/ / / / / / / /_/ / /_/ / /_/ / /_/ />  <  
\____/\____/_/ /_/ /_/_.___/\____/_.___/\____/_/|_|  

======================================================
]]--


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
		icon:SetFOV(120)
		currenttable = Coins
	elseif value == "Ore" then
		icon:SetModel( "models/props_combine/breenbust_chunk05.mdl" )
		icon:SetFOV(30)
		icon:SetLookAt(Vector(5,0,0))
		raritycombo:Clear()
		currenttable = OreCopper
		addoptions(raritycombo,true)
	elseif value == "Xen" then
		icon:SetModel( "models/props_wasteland/rockgranite02a.mdl" )
		raritycombo:Clear()
		raritycombo:SetValue("No value avalable")
		icon:SetFOV(120)
		currenttable = Xen
	else 
		icon:SetModel( "models/props_wasteland/rockgranite02a.mdl" )
		icon:SetFOV(120)
		raritycombo:Clear()
		icon:SetFOV(120)
		currenttable = RockCopper
		addoptions(raritycombo,false)	
	end
	seteverything()
end

raritycombo.OnSelect = function( self, index, value )
	if entitycombo:GetValue() == "Rock" then
		if value == "Gold" then
			currenttable = RockGold
		elseif value == "Silver" then
			currenttable = RockSilver
		else
			currenttable = RockCopper
	end
	elseif entitycombo:GetValue() == "Ore" then
		if value == "Gold" then
			currenttable = OreGold
		elseif value == "Silver" then
			currenttable = OreSilver
			seteverything()
		elseif value == "Platinum" then
			currenttable = OrePlatinum
		else
			currenttable = OreCopper
	end
	end
	seteverything()
end

--[[
=========================================
    ___________ ____     ____            
   / ____/ ___// __ \   / __ )____  _  __
  / __/  \__ \/ /_/ /  / __  / __ \| |/_/
 / /___ ___/ / ____/  / /_/ / /_/ />  <  
/_____//____/_/      /_____/\____/_/|_|  

=========================================
]]--

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


--[[
===============================================
    ___________ ____  ____                   __
   / ____/ ___// __ \/ __ \____ _____  ___  / /
  / __/  \__ \/ /_/ / /_/ / __ `/ __ \/ _ \/ / 
 / /___ ___/ / ____/ ____/ /_/ / / / /  __/ /  
/_____//____/_/   /_/    \__,_/_/ /_/\___/_/   

===============================================
]]--

local checkpanel = view:Add("DPanel")
checkpanel:SetSize(200,147)
checkpanel:SetPos(10,310)
checkpanel.Paint = function(self,w,h)
	draw.RoundedBox(5,0,0,w,h,Color(45,45,45))
end


local checktitle = selecttitlehead(checkpanel, "  Enable ESP")
checktitle:Dock(TOP)

local removehook = vgui.Create("DButton", checkpanel)
	removehook:SetText("Kill ESP")
	removehook:Dock(BOTTOM)



-- ==============================================
--    ____             __      ___________ ____ 
--   / __ \____  _____/ /__   / ____/ ___// __ \
--  / /_/ / __ \/ ___/ //_/  / __/  \__ \/ /_/ /
-- / _, _/ /_/ / /__/ ,<    / /___ ___/ / ____/ 
--/_/ |_|\____/\___/_/|_|  /_____//____/_/      
-- 
-- ==============================================

local function rockesp() 
hook.Add( "HUDPaint", "RockESP", function()

	-- Get a list of all rocks and draw a marker on screen for each rock.
	for _, rock in ipairs( ents.FindByClass( "mining_rock" ) ) do

		-- Rock location hooking
		local rockpoint = rock:GetPos() + rock:OBBCenter() -- Gets the position of the entity, specifically the center.
		local rockdata2D = rockpoint:ToScreen() -- Gets the position of the entity on your screen.
		local rockrarity = rock:GetRarity() -- Get's rocks rarity.
		local rocksize = rock:GetSize() -- Get's how many layers the rock has.

		if rockrarity == 0 then
				draw.RoundedBox(RockCopper.BoxCorners,rockdata2D.x-RockCopper.OffsetX, rockdata2D.y-RockCopper.OffsetY, RockCopper.BoxWidth, RockCopper.BoxHight, RockCopper.BoxColor)
				draw.SimpleText( "Copper - Size:" .. rocksize, RockCopper.Font, rockdata2D.x, rockdata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif rockrarity == 1 then
				draw.RoundedBox(RockSilver.BoxCorners,rockdata2D.x-RockSilver.OffsetX, rockdata2D.y-RockSilver.OffsetY, RockSilver.BoxWidth, RockSilver.BoxHight, RockSilver.BoxColor)
				draw.SimpleText( "Silver - Size:" .. rocksize, RockSilver.Font, rockdata2D.x, rockdata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif rockrarity == 2 then
				draw.RoundedBox(RockGold.BoxCorners,rockdata2D.x-RockGold.OffsetX, rockdata2D.y-RockGold.OffsetY, RockGold.BoxWidth, RockGold.BoxHight, RockGold.BoxColor)
				draw.SimpleText( "Gold - Size:" .. rocksize, RockGold.Font, rockdata2D.x, rockdata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )		
		end	

	end

end )
end


-- ==============================================
--   ____               ___________ ____ 
--  / __ \________     / ____/ ___// __ \
-- / / / / ___/ _ \   / __/  \__ \/ /_/ /
--/ /_/ / /  /  __/  / /___ ___/ / ____/ 
--\____/_/   \___/  /_____//____/_/      
--
-- ==============================================

local function oreesp() 
hook.Add( "HUDPaint", "OreESP", function()

	-- Get a list of all ores and draw a marker on screen for each ore.
	for _, ore in ipairs( ents.FindByClass( "mining_ore" ) ) do

		-- ore location hooking
		local orepoint = ore:GetPos() + ore:OBBCenter() -- Gets the position of the entity, specifically the center.
		local oredata2D = orepoint:ToScreen() -- Gets the position of the entity on your screen.
		local orerarity = ore:GetRarity() -- Get's ores rarity.

		if orerarity == 0 then
				draw.RoundedBox(OreCopper.BoxCorners,oredata2D.x-OreCopper.OffsetX, oredata2D.y-OreCopper.OffsetY, OreCopper.BoxWidth, OreCopper.BoxHight, OreCopper.BoxColor)
				draw.SimpleText( "Copper - Pickup", OreCopper.Font, oredata2D.x, oredata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif orerarity == 1 then
				draw.RoundedBox(OreSilver.BoxCorners,oredata2D.x-OreSilver.OffsetX, oredata2D.y-OreSilver.OffsetY, OreSilver.BoxWidth, OreSilver.BoxHight, OreSilver.BoxColor)
				draw.SimpleText( "Silver - Pickup", OreSilver.Font, oredata2D.x, oredata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		elseif orerarity == 2 then
				draw.RoundedBox(OreGold.BoxCorners,oredata2D.x-OreGold.OffsetX, oredata2D.y-OreGold.OffsetY, OreGold.BoxWidth, OreGold.BoxHight, OreGold.BoxColor)
				draw.SimpleText( "Gold - Pickup", OreGold.Font, oredata2D.x, oredata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
		elseif orerarity == 3 then
				draw.RoundedBox(OrePlatinum.BoxCorners,oredata2D.x-OrePlatinum.OffsetX, oredata2D.y-OrePlatinum.OffsetY, OrePlatinum.BoxWidth, OrePlatinum.BoxHight, OrePlatinum.BoxColor)
				draw.SimpleText( "Platinum - Pickup", OrePlatinum.Font, oredata2D.x, oredata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end	

	end

end )
end


-- ==============================================
--   _  __              ___________ ____ 
--  | |/ /__  ____     / ____/ ___// __ \
--  |   / _ \/ __ \   / __/  \__ \/ /_/ /
-- /   /  __/ / / /  / /___ ___/ / ____/ 
--/_/|_\___/_/ /_/  /_____//____/_/      
--                                         
-- ==============================================

local function xenesp() 
hook.Add( "HUDPaint", "XenESP", function()

	-- Get a list of all coins and draw a marker on screen for each coin.
	for _, xen in ipairs( ents.FindByClass( "mining_xen_crystal" ) ) do

		-- coin location hooking
		local xenpoint = xen:GetPos() + xen:OBBCenter() -- Gets the position of the entity, specifically the center.
		local xendata2D = xenpoint:ToScreen() -- Gets the position of the entity on your screen.
		local rainbow = HSVToColor(( CurTime()*20)%360,1,1)

		draw.RoundedBox(Xen.BoxCorners,xendata2D.x-Xen.OffsetX, xendata2D.y-Xen.OffsetY, Xen.BoxWidth, Xen.BoxHight, Xen.BoxColor)
		draw.SimpleText( "Xen Crystal", Xen.Font, xendata2D.x, xendata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
end )
end

-- ==============================================
--   ______      _          ___________ ____ 
--  / ____/___  (_)___     / ____/ ___// __ \
-- / /   / __ \/ / __ \   / __/  \__ \/ /_/ /
--/ /___/ /_/ / / / / /  / /___ ___/ / ____/ 
--\____/\____/_/_/ /_/  /_____//____/_/      
--
-- ==============================================

local function coinesp() 
hook.Add( "HUDPaint", "CoinESP", function()

	-- Get a list of all coins and draw a marker on screen for each coin.
	for _, coin in ipairs( ents.FindByClass( "coin" ) ) do

		-- coin location hooking
		local coinpoint = coin:GetPos() + coin:OBBCenter() -- Gets the position of the entity, specifically the center.
		local coindata2D = coinpoint:ToScreen() -- Gets the position of the entity on your screen.
		local coinvalue = coin:GetValue() -- Get's coins value.

		draw.RoundedBox(Coins.BoxCorners,coindata2D.x-Coins.OffsetX, coindata2D.y-Coins.OffsetY, Coins.BoxWidth, Coins.BoxHight, Coins.BoxColor)
		draw.SimpleText( "Coin - Value:" .. coinvalue, Coins.Font, coindata2D.x, coindata2D.y, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
end )
end


--[[
=============================================
    ___________ ____  ______                
   / ____/ ___// __ \/ ____/_  ______  _____
  / __/  \__ \/ /_/ / /_  / / / / __ \/ ___/
 / /___ ___/ / ____/ __/ / /_/ / / / / /__  
/_____//____/_/   /_/    \__,_/_/ /_/\___/  

=============================================
]]--

if ESPCheck.rockcheck then
	rockesp()
elseif ESPCheck.orecheck then
	oreesp()
elseif ESPCheck.xencheck then
	xenesp()
elseif ESPCheck.coincheck then
	coinesp()
end


local rocktick = imagecheckbox(checkpanel,"Rock")
local oretick = imagecheckbox(checkpanel,"Ore")
local xentick = imagecheckbox(checkpanel,"Xen")
local cointick = imagecheckbox(checkpanel,"Coin")

local function espticksave()
	local espcon = util.TableToJSON(ESPCheck)
	file.Write("espdata/esptick.json", espcon)
end 


rocktick:SetChecked(ESPCheck.rockcheck)
oretick:SetChecked(ESPCheck.orecheck)
xentick:SetChecked(ESPCheck.xencheck)
cointick:SetChecked(ESPCheck.coincheck)

function rocktick:OnChange(val)
if val then
	rockesp()
	ESPCheck.rockcheck = true
elseif val == false then
	hook.Remove("HUDPaint", "RockESP")
	ESPCheck.rockcheck = false
end
espticksave()
end


function oretick:OnChange(val)
if val then
	oreesp()
	ESPCheck.orecheck = true
else
	hook.Remove("HUDPaint", "OreESP")
	ESPCheck.orecheck = false
end
espticksave()
end

function xentick:OnChange(val)
if val then
	xenesp()
	ESPCheck.xencheck = true
else
	hook.Remove("HUDPaint", "XenESP")
	ESPCheck.xencheck = false
end
espticksave()
end

function cointick:OnChange(val)
if val then
	coinesp()
	ESPCheck.coincheck = true
else
	hook.Remove("HUDPaint", "CoinESP")
	ESPCheck.coincheck = false
end
espticksave()
end
	
removehook.DoClick  = function()
	rocktick:SetChecked(false)
	oretick:SetChecked(false)
	xentick:SetChecked(false)
	cointick:SetChecked(false)
	ESPCheck.coincheck = false
	ESPCheck.xencheck = false
	ESPCheck.orecheck = false
	ESPCheck.rockcheck = false
	hook.Remove("HUDPaint", "CoinESP")
	hook.Remove("HUDPaint", "XenESP")
	hook.Remove("HUDPaint", "OreESP")
	hook.Remove("HUDPaint", "RockESP")
	espticksave()
end
end

-- Hello from DuckDuckGo, DM @[Molly]Sherm#3332 if you having any trouble or found any bugs