--[[


Auto Map rotator
Made by ajgeiss0702 for AstroGmod GuessWho




AMR_ before the variables stand for AutoMapRotate (or rotator)
This is to makesure another addon will not be setting the variables.
If another addon is setting these, make an issue on the github page here: https://github.com/ajgeiss0702/GMapRotate/issues



The maps, it is not limited to just 2, you can have more or less (but not 1 because then this would be useless)
All maps names should have quotes around them, and commas after the ending quotes
Here is my example I use for my guesswho server:     ]]
--AMR_maps = {"gm_1950s_town", "gm_arena_submerge", "gm_metro_plaza", "gm_gwpark"}
--[[MAKE SURE TO PUT YOUR DEFAULT MAP IN HERE (the one is your startup script), or else it will not work (It does not have to be the first one, but should be in there)                      ignore this--]]if SERVER then
AMR_maps = {"gm_construct", "gm_flatgrass"}


--Amount of time, in seconds, it will announce to the players what the next map will be
AMR_AnnounceTime = 180


--Should console debug messages be on? Before reporting problems, turn this on to make sure you just didn't type the map wrong
--When using this, check to be sure that the current map is the right one, and that the next map is the right one
--In the future, I will add checking to make sure the maps exist, but for now, you have to do it manually

AMR_debug = false







-- READ=THIS==READ=THIS==READ=THIS==READ=THIS==READ=THIS

--Ignore and DO NOT CHANGE anything after this!

-- READ=THIS==READ=THIS==READ=THIS==READ=THIS==READ=THIS



if file.Exists("gmaprotate/do_not_change/version.txt", "LUA") then
	AMR_ver = file.read("gmaprotate/do_not_change/version.txt", "LUA")
else
	AMR_ver = 0
end
end