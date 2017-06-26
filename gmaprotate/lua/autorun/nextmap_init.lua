--[[print(" ")
print(" ")
print(" ")
print(" ")
print("GMapRotate init is running!")
print(" ")
print(" ")
print(" ")
print(" ")
print(" ") ]]
AddCSLuaFile( "gmaprotate/cl_nextmap.lua" )

if SERVER then
	include("sv_gmr_config.lua")
    include("gmaprotate/sv_nextmap.lua")
end

if CLIENT then
    include("gmaprotate/cl_nextmap.lua")
end