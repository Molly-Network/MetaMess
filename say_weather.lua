--[[ This is using wttr.in to get the weather and format it
check out their github if you're intersted https://github.com/chubin/wttr.in
]]

-- Default and temp values

local Weather_Site = 'https://wttr.in/Birmingham?0'
local DefualtWeather = "London"
local WeatherText = ""
local TempString = {}

-- Table of formulas, each entry has a explanation and example of what it dose 

local Format_Table = {
	Location = "%l+", 					-- Location [London]
	Wind = "%w+", 						-- Wind direction and speed [↗8km/h]
	Humidity = "%h+",					-- Humidity [91%]
	Space = "+",						-- Blank space [ ]
	Colon = ":+",						-- Colon [:]
	Icon = "%c+",						-- Weather condition Icon [☀]
	Temperature = "%t+",					-- Temperature (Actual) [+3°C]
	Weather_condition = "%C+",				-- Weather condition textual name [Clear]
	Temperature_feel = "%f+",				-- Temperature (Feels Like) [+1°C]
	Moon_phase = "%m+",					-- Moon phase [🌓]
	Moon_day = "%M+",					-- Moon_day [6]
	Precipitation = "%p+",					-- Precipitation (mm/3 hours) [0.0mm]
	Pressure = "%P+",					-- Pressure (hPa) [1008hPa]
	Dawn = "%D+",						-- Dawn* [07:35:49]
	Sunrise = "%S+",					-- Sunrise* [08:17:08]
	Sunset = "%s+",						-- Sunset* [16:14:26]
	Zenith = "%z+", 					-- Zenith* [12:15:24]
	Dusk = "%d+",						-- Dusk* [16:55:45]
	Current_time = "%T+", 					-- Current time* [22:58:12+0000]
	Local_timezone = "%Z+"					-- Local timezone [Europe/London]
	-- (*times are shown in the local timezone)	                   
}

-- Function gets the body of the site and sets it as a string value

function GetSite()
	http.Fetch(  Weather_Site,
	function( body, length, headers, code )
		WeatherText = string.gsub(body,"️","")
		WeatherText = [[
		]] .. WeatherText
		hook.Add("Think", "Weather", function() coh.StartChat(true) coh.SendTypedMessage(WeatherText) end)
	end)
end

--[[ 
Location has to go first after that any commands form the table can be used. 
normal text can be use aslong as the start with a ? [?Test_Text].
Insted of spaces we use + or the command "Space".
Console commands have a character limit of 128.
Example command: say_weather Moon Location Colon Icon Temperature ?Wind_Speed+ Colon Wind ?|+Humidity+ Colon Humidity
]]

concommand.Add("say_weather", function( ply, cmd, args )
	for k,v in ipairs(args) do 
		if k ~= 1 then
			if string.StartWith(v,'?') then
				TempString[#TempString+1] = string.sub(v, 2 ) 
			else
				TempString[#TempString+1] = Format_Table[v]
			end
		end
	end
	Weather_Site = "https://wttr.in/" .. args[1] .. "?format=" .. table.concat(TempString)
	GetSite()
	timer.Simple(1.5,function() 
		LocalPlayer():Say(WeatherText)
	end)
	table.Empty(TempString)
end)

--[[ 
Displays Location,Temp,Wind and Humidity. Only takes one argument
Example command: say_weather_wh Moon
]]

concommand.Add("say_weather_wh", function( ply, cmd, args )
	Weather_Site = "https://wttr.in/" .. args[1] .. "?format=%l+:+%c+%t+Wind_Speed+:+%w+|+Humidity+:+%h+"
	GetSite()
	timer.Simple(1.5,function() 
		LocalPlayer():Say(WeatherText)
	end)
end)                                                                              
