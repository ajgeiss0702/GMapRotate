--[[


Auto Map rotator
Made by ajgeiss0702 for AstroGmod GuessWho













((--------------------------------------------------------------------------------))
 | Do not change anything below this line (unless you know what you are doing!)   |
((--------------------------------------------------------------------------------]]












if SERVER then --Checks to make sure it is server who is running this; will just throw errors on client

--Getting Config
--local AMR_maps = AMR_maps
local AnnounceTime = AMR_AnnounceTime
local debug = AMR_debug
if debug then
	print("[GMR DEBUG] sv_nextmap.lua is running!")
end
if debug then
	print("[GMR DEBUG] maps: " .. tostring(AMR_maps) .. ", announcetime: " .. tostring(AnnounceTime) .. ", debug: " .. tostring(debug))
end

--[[
if debug then
	print("[GMR DEBUG] ")
end
]]


--[[check AMR_maps (WIP)
local mapcheck = file.Find("maps/*.bsp", "GAME")
local mapvalid = false
for i,v in maps do
	
	
	
end]]

util.AddNetworkString( "AnnNextMap" )
local players = player.GetAll()


local function ajnotify(string)
	
	--for k, ply in pairs( players ) do
	
	net.Start( "AnnNextMap" )
		net.WriteString( string )
	net.Broadcast()

	--end
	
--he he 69
end


	local curmap = game.GetMap()
	local nextmap = "NoneYet"
	local found = false
local function nextmappick()
	if debug then
		print("[DEBUG] Current map is " .. curmap)
	end
	found = false
	for i=1, 100 do
		
		if AMR_maps[i] == nil then
			else if curmap == AMR_maps[i] then
				if debug then
					print("[DEBUG] Next map should be " .. AMR_maps[i+1])
				end
				if AMR_maps[i+1] == nil then
					RunConsoleCommand("nextlevel", AMR_maps[1])
					nextmap = AMR_maps[1]
					found = true
					--PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap)
					----[[
					
					ajnotify("Next map is" .. nextmap)

					
					--]]--
					
					
					
					
					
					
					
					mapchanging = 1
				else
					RunConsoleCommand("nextlevel", AMR_maps[i+1])
					nextmap = AMR_maps[i+1]
					found = true
					--PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap)
					ajnotify("Next map is" .. nextmap)
				end
			end
		end
		local nextlevel = GetConVar("nextlevel")
		--print("Next level: " .. nextlevel:GetString())
	--[[	if nextlevel:GetString() == nextmap then else
			nextmappick()
			if nextlevel:GetString() == nextmap then else
				print("Here is the source: " .. nextlevel:GetString())
				RunConsoleCommand("nextlevel", nextmap)
				print (" ")
				print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR")
				print("ERROR                               ERROR")
				print("ERROR    This should not happen!    ERROR")
				print("ERROR    Report this to aj NOW!     ERROR")
				print("ERROR    This is a problem with     ERROR")
				print("ERROR    the map rotator addon.     ERROR")
				print("ERROR                               ERROR")
				print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR")
				print (" ")
			end
		end--]]
		--print(AMR_maps[i])
		
		
		
		
		
	end
	if found then else
	RunConsoleCommand("nextlevel", AMR_maps[1])
			nextmap = AMR_maps[1]
	end
	
end

nextmappick()	
	
local function spawn( ply )
	--PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap )
	ajnotify("Next map is" .. nextmap)
end
hook.Add( "PlayerInitialSpawn", "SpawnNextMapAlert", spawn )


function mapannounce ()
	nextmappick()
	if debug then
		print("[DEBUG] The next map will be " .. nextmap )
	end
	--ajnotify("Next map is" .. nextmap)
	
end

timer.Create( "ServerAnnouncer", AnnounceTime, 0, function()  mapannounce() end )


hook.Add( "PlayerSay", "CustomCommands", function( ply, text, public )
	text = string.lower( text ) -- ignores cases
	if ( text == "!nextmap" ) then
		if debug then
			print("[GMR DEBUG] Command ran!")
		end
		ply:ChatPrint( "The next map will be " .. nextmap )
		ajnotify("Next map is" .. nextmap)

		return ""
	end 
	--)

end )




--Timed rotator
if AMR_TimedRotate then
	if debug then
		print("[GMR DEBUG] TimedRotate enabled!")
	end
	local timerotate_stime = AMR_TimedRotate_time*60
	timer.Simple(timerotate_stime-60, function() 
	ajnotify("Map changing to "..nextmap.." in 1 minute")
	)
	timer.Simple(timerotate_stime-30, function() 
	ajnotify("Map changing to "..nextmap.." in 30 seconds")
	)
	timer.Simple(timerotate_stime-15, function() 
	ajnotify("Map changing to "..nextmap.." in 15 seconds")
	)
	timer.Simple(timerotate_stime-10, function() 
	ajnotify("Map changing to "..nextmap.." in 10 seconds")
	)
	timer.Simple(timerotate_stime-5, function() 
	ajnotify("Map changing to "..nextmap.." in 5 seconds")
	)
	timer.Simple(timerotate_stime-4, function() 
	ajnotify("Map changing to "..nextmap.." in 4 seconds")
	)
	timer.Simple(timerotate_stime-3, function() 
	ajnotify("Map changing to "..nextmap.." in 3 seconds")
	)
	timer.Simple(timerotate_stime-2, function() 
	ajnotify("Map changing to "..nextmap.." in 2 seconds")
	)
	timer.Simple(timerotate_stime-1, function() 
	ajnotify("Map changing to "..nextmap.." in 1 seconds")
	)
	timer.Simple(timerotate_stime, function() 
	ajnotify("Map changing to "..nextmap.." now")
	nextmappick()
	RunConsoleCommand("changelevel", nextmap)
	)
	
end











end







