--[[print(" ")
print(" ")
print(" ")
print(" ")
print("GMapRotate init is running!")
print(" ")
print(" ")
print(" ")
print(" ") ]]
AddCSLuaFile( "nextmap/cl_nextmap.lua" )

if SERVER then
	include("sv_config.lua")
    include("nextmap/sv_nextmap.lua")
end

if CLIENT then
    include("nextmap/cl_nextmap.lua")
end