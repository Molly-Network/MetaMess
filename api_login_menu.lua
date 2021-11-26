-- Font setup
surface.CreateFont("MollyHeader", {
	font = "Segoe UI Black", 
	extended = false,
	size = 40,
	weight = 500,
})

surface.CreateFont("MollySubheader", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 23,
	weight = 500,
})

surface.CreateFont("MollyButton", {
	font = "Segoe UI Semilight", 
	extended = false,
	size = 24,
	weight = 500,
})

surface.CreateFont("MollyHeader2", {
	font = "Segoe UI Bold", 
	extended = false,
	size = 35,
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

-- Default values 
local Version = "1.0.0"
local TimeStamp = "[10/9/21]"
local GUITitle = "Molly Menu"
local URLName = "https://i.imgur.com/u1voDOH.png"

local function inQuad(fraction, beginning, change)
	return change * (fraction ^ 2) + beginning
end

local Frame = vgui.Create("DFrame")
Frame:SetSize(ScrW()-800, ScrH()-400)
Frame:Center()
Frame:MakePopup()
Frame:SetTitle(" ")
Frame:ShowCloseButton(false)
Frame.Paint = function ( self,w,h )

	surface.SetFont("MollySubheader")

	local VersionLength = surface.GetTextSize("Version ") + surface.GetTextSize(Version)

	-- Background
	draw.RoundedBoxEx(10, 0, 0, w/2, h, Color(26, 26, 26, 255), true, false, true, false)
	draw.RoundedBoxEx(10, w/2, 0, w/2, h, Color(37, 37, 37, 255), false, true, false, true)

	-- Header text
	surface.SetFont("MollyHeader")
	surface.SetTextColor(ColorWhite)
	surface.SetTextPos(30, 15)
	surface.DrawText(GUITitle)

	-- Version subheader
	surface.SetFont("MollySubheader")
	surface.SetTextColor(ColorBlue)
	surface.SetTextPos(30, 52)
	surface.DrawText("Version " .. Version)

	-- Timestamp subheader
	surface.SetFont("MollySubheader")
	surface.SetTextColor(Color(63, 66, 84, 255))
	surface.SetTextPos(35 + VersionLength, 52)
	surface.DrawText(TimeStamp)

	-- Temp Shit
	--draw.RoundedBox(0, 0, h/2, w, 1, Color(255, 0, 0, 255))
	--draw.RoundedBox(0, w/2+w/4, 0, 1, h, Color(255, 0, 0, 255))
end

local FrameW,FrameH = Frame:GetSize()

local Image = vgui.Create("DHTML", Frame)
Image:SetSize(FrameW/2, FrameH)
Image:SetPos(0, 10)
Image:SetHTML([[
	<style>
		div {
		  position: relative;
		  width: 100%;
		  height: 100%;
		}
		img {
		  position: absolute;
		  top: 0;
		  left: 0;
		  bottom: 0;
		  right: 0;
		  width: auto; /* to keep proportions */
		  height: auto; /* to keep proportions */
		  max-width: 100%; /* not to stand out from div */
		  max-height: 100%; /* not to stand out from div */
		  margin: auto auto 0; /* position to bottom and center */
		}
    </style>
    <div>
    	<img src=]] .. URLName .. [[>
    </div>
    ]])

local LoginPanel = vgui.Create("DPanel", Frame)
LoginPanel:SetSize(FrameW/2, FrameH)
LoginPanel:SetPos(FrameW/2, 00)
LoginPanel.Paint = function (self,w,h)
	draw.RoundedBox(10, 90, h/2-65, w-180, 55, Color(54, 54, 54, 255))
	draw.RoundedBox(10, 90, h/2+10, w-180, 55, Color(54, 54, 54, 255))
	draw.DrawText("Login To " .. GUITitle, "MollyHeader2", w/2, h/2-135, ColorWhite, TEXT_ALIGN_CENTER)
	draw.DrawText("Enter your details to login to your account", "MollyButton", w/2, h/2-100, ColorOffGrey, TEXT_ALIGN_CENTER)
	
end



local LoginPanelW,LoginPanelH = LoginPanel:GetSize()

local function MollyNote( text,color )
	local Notification = vgui.Create("DPanel", LoginPanel)
	Notification:SetSize(LoginPanelW, 55)
	Notification:SetPos(0, LoginPanelH-55)
	Notification.Paint = function ( self,w,h )
		draw.RoundedBoxEx(10, 90, 0, w-180, 55, color,true,true,false,false)
		draw.DrawText(text, "MollyButton", w/2, h/2-13, ColorWhite, TEXT_ALIGN_CENTER)
	end

	local AnimationUp = Derma_Anim("EaseInQuadUp", Notification , function(pnl, anim, delta, data)
		pnl:SetPos(0, inQuad(delta, LoginPanelH, -55))
	end)

	local AnimationDown = Derma_Anim("EaseInQuadDown", Notification , function(pnl, anim, delta, data)
	pnl:SetPos(0, inQuad(delta, LoginPanelH-55, LoginPanelH))
	end)

	AnimationUp:Start(1)
	timer.Simple(2, function() AnimationDown:Start(2) end)
	Notification.Think = function(self)
		if AnimationUp:Active() then
			AnimationUp:Run()
		end
		if AnimationDown:Active() then
			AnimationDown:Run()
		end
	end
end



local CloseButton = vgui.Create("DButton", LoginPanel)
CloseButton:SetSize(100, 40)
CloseButton:SetPos(LoginPanelW/2+20, LoginPanelH/2+80)
CloseButton:SetText("Close")
CloseButton:SetFont("MollyButton")
CloseButton:SetTextColor(ColorWhite)
CloseButton.DoClick = function ()
	Frame:Close()
end
CloseButton.Paint = function ( self,w,h )
	if self:IsDown() then
		draw.RoundedBox(10, 1, 1, w-2, h-2, ColorRed)
	elseif self:IsHovered() then
		draw.RoundedBox(10, 0, 0, w, h, ColorLightRed)
	else 
		draw.RoundedBox(10, 0, 0, w, h, ColorRed)
	end
end

local Username = vgui.Create("DTextEntry", LoginPanel)
Username:SetPos(110, LoginPanelH/2-63)
Username:SetSize(LoginPanelW-220, 50)
Username:SetFont("MollySubheader")
Username:SetTextColor(ColorWhite)
Username:SetPlaceholderText("Username")
Username:SetPlaceholderColor(ColorOffGrey)
Username:SetPaintBackground( false )
Username:SetCursorColor(ColorBlue)

local Licence = vgui.Create("DTextEntry", LoginPanel)
Licence:SetPos(110, LoginPanelH/2+12)
Licence:SetSize(LoginPanelW-220, 50)
Licence:SetFont("MollySubheader")
Licence:SetTextColor(ColorWhite)
Licence:SetPlaceholderText("Licence Key")
Licence:SetPlaceholderColor(ColorOffGrey)
Licence:SetPaintBackground( false )
Licence:SetCursorColor(ColorBlue)

local LoginButton = vgui.Create("DButton", LoginPanel)
LoginButton:SetSize(100, 40)
LoginButton:SetPos(LoginPanelW/2-120, LoginPanelH/2+80)
LoginButton:SetText("Login")
LoginButton:SetFont("MollyButton")
LoginButton:SetTextColor(ColorWhite)
LoginButton.DoClick = function ()
	http.Post( "https://molly.network/applications/nexus/interface/licenses/?check", { key = Licence:GetValue(), identifier = Username:GetValue(), usage_id = "1" },
		function( body, length, headers, code )
			if body == '{"status":"ACTIVE","uses":1,"max_uses":1}' then
				MollyNote("Welcome " .. Username:GetValue(),ColorGreen)
				timer.Simple(3, function()
					print("Shit Activated")
					Frame:Close()
				end)				
			elseif body == '{"errorCode":"BAD_USAGE_ID","errorMessage":303}' then
				http.Post( "https://molly.network/applications/nexus/interface/licenses/?activate", { key = Licence:GetValue(), identifier = Username:GetValue() },
					function( body, length, headers, code )
						if body == '{"response":"OKAY","usage_id":1}' then
							MollyNote("Key Activated",ColorBlue)
						else
							MollyNote( "Something has gone very wrong, you should never see this print",ColorRed )
						end
					end
				)
			elseif body == "" then
				MollyNote( "Server is Down",ColorRed )
			elseif body == '{"errorCode":"BAD_IP","errorMessage":304}' then
				MollyNote( "Bad IP, Contact support",ColorRed )
			else
				MollyNote( "Bad Username or Licence",ColorRed )
			end
		end
	)
	--Frame:Close()
end

LoginButton.Paint = function ( self,w,h )
	if self:IsDown() then
		draw.RoundedBox(10, 1, 1, w-2, h-2, ColorBlue)
	elseif self:IsHovered() then
		draw.RoundedBox(10, 0, 0, w, h, ColorLightBlue)
	else 
		draw.RoundedBox(10, 0, 0, w, h, ColorBlue)
	end
end
