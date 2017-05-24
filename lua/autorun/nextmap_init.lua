if SERVER then
	include("nextmap/sv_nextmap.lua")
	include("nextmap/sv_config.lua")
else
	AddCSLuaFile( "nextmap/cl_nextmap.lua" )
	include("nextmap/cl_nextmap.lua")
end