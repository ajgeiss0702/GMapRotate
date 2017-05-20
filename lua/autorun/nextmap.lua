--[[


Auto Map rotator



]]--

if SERVER then --Ignore this


--The maps, it is not limited to just 2, you can have more or less (but not 1 because then this would be useless)
--All maps names should have quotes around them, and commas after the ending quotes
--Here is my example I use for my guesswho server:
local maps = {"gm_1950s_town", "gm_arena_submerge", "gm_metro_plaza", "gm_gwpark"}
--MAKE SURE TO PUT YOUR DEFAULT MAP IN HERE, or else it will not work (It does not have to be the first one, but should be in there)
--local maps = {"gm_construct", "gm_flatgrass"}


--Amount of time, in seconds, it will announce to the players what the next map will be
local AnnounceTime = 180


--Should console debug messages be on? Before reporting problems, turn this on to make sure you just didn't type the map wrong
--When using this, check to be sure that the current map is the right one, and that the next map is the right one
--In the future, I will add checking to make sure the maps exist, but for now, you have to do it manually

local debug = false








--[[
--------------------------------------------------------------------------------
Do not change anything below this line (unless you know what you are doing!)
--------------------------------------------------------------------------------
]]--
local mapchanging = 0
local players = player.GetAll()




	local curmap = game.GetMap()
	local nextmap = "NoneYet"
	local found = false
local function nextmappick()
	if debug then
		print("[DEBUG] Current map is " .. curmap)
	end
	found = false
	for i=1, 100 do
		
		if maps[i] == nil then
			else if curmap == maps[i] then
				if debug then
					print("[DEBUG] Next map should be " .. maps[i+1])
				end
				if maps[i+1] == nil then
					RunConsoleCommand("nextlevel", maps[1])
					nextmap = maps[1]
					found = true
					PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap)
					--[[
					
					for k, v in pairs( player.GetAll() ) do
						print( v:Nick() )
					end

					
					]]--
					mapchanging = 1
				else
					RunConsoleCommand("nextlevel", maps[i+1])
					nextmap = maps[i+1]
					found = true
					PrintMessage( HUD_PRINTTALK, "The next map will be " .. nextmap)
					mapchanging = 1
				end
			end
		end
		local nextlevel = GetConVar("nextlevel")
		--print("Next level: " .. nextlevel:GetString())
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
		--print(maps[i])
	end
	if found then else
	RunConsoleCommand("nextlevel",maps[1])
			nextmap = maps[1]
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

end