--[[


Auto Map rotator
Made by ajgeiss0702 for AstroGmod GuessWho













((--------------------------------------------------------------------------------))
 | Do not change anything below this line (unless you know what you are doing!)   |
((--------------------------------------------------------------------------------]]





net.Receive( "AnnNextMap", function()
	local nextmap = net.ReadString()
	local nm_msg = "Next map is " .. nextmap
	notification.AddLegacy( nm_msg, NOTIFY_GENERIC, 3 )
	surface.PlaySound( "buttons/button15.wav" )
	Msg( nm_msg .. "\n" )
end )



