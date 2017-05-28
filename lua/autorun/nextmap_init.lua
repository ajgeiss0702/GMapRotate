AddCSLuaFile( "nextmap/cl_nextmap.lua" )

if SERVER then
    include("nextmap/sv_nextmap.lua")
    include("nextmap/sv_config.lua")
end

if CLIENT then
    include("nextmap/cl_nextmap.lua")
end