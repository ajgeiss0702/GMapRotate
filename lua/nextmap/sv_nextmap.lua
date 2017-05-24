--[[


Auto Map rotator
Made by ajgeiss0702 for AstroGmod GuessWho













((--------------------------------------------------------------------------------))
 | Do not change anything below this line (unless you know what you are doing!)   |
((--------------------------------------------------------------------------------]]












--if SERVER then --Ignore this

--Getting Config
local mr_AMR_maps = AMR_maps
local AnnounceTime = AMR_AnnounceTime
local debug = AMR_debug

--print("maps: " .. tostring(AMR_maps) .. ", announcetime: " .. tostring(AnnounceTime) .. ", debug: " .. tostring(debug))




--check AMR_maps
local mapcheck = file.Find("AMR_maps/*.bsp", "GAME")
local mapvalid = false
--for i,v in AMR_maps do
	
	
	
--end

util.AddNetworkString( "AnnNextMap" )
local players = player.GetAll()


local function notifyNextMap(nxtmap)
	
	--for k, ply in pairs( players ) do
	
	net.Start( "AnnNextMap" )
		net.WriteString( nxtmap )
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
		
		if mr_AMR_maps[i] == nil then
			else if curmap == AMR_maps[i] then
				if debug then
					print("[DEBUG] Next map should be " .. AMR_maps[i+1])
				end
				if mr_AMR_maps[i+1] == nil then
					RunConsoleCommand("nextlevel", mr_AMR_maps[1])
					nextmap = mr_AMR_maps[1]
					found = true
					PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap)
					----[[
					
					notifyNextMap(nextmap)

					
					--]]--
					
					
					
					
					
					
					
					mapchanging = 1
				else
					RunConsoleCommand("nextlevel", mr_AMR_maps[i+1])
					nextmap = mr_AMR_maps[i+1]
					found = true
					PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap)
					notifyNextMap(nextmap)
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
	RunConsoleCommand("nextlevel", mr_AMR_maps[1])
			nextmap = AMR_maps[1]
	end
	
end

nextmappick()	
	
local function spawn( ply )
	--sleep(10)
	PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap )
end
hook.Add( "PlayerInitialSpawn", "some_unique_name", spawn )


function mapannounce ()
	nextmappick()
	if debug then
		print("[DEBUG] The next map will be " .. nextmap )
	end
	
end

timer.Create( "ServerAnnouncer", AnnounceTime, 0, function()  mapannounce() end )


hook.Add( "PlayerSay", "CustomCommands", function( ply, text, public )
	text = string.lower( text ) -- Make the chat message entirely lowercase
	
	
	if ( text == "!nextmap" ) then
		ply:ChatPrint( "The next map will be " .. nextmap )
		notifyNextMap(nextmap)

		return ""
	end 
	--)

end )


