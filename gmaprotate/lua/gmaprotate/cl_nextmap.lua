--[[


Auto Map rotator
Made by ajgeiss0702 for AstroGmod GuessWho













((--------------------------------------------------------------------------------))
 | Do not change anything below this line (unless you know what you are doing!)   |
((--------------------------------------------------------------------------------]]


if CLIENT then


net.Receive( "AnnNextMap", function()
	local string = net.ReadString()
	notification.AddLegacy( string, NOTIFY_GENERIC, 3 )
	surface.PlaySound( "buttons/button15.wav" )
	Msg( string .. "\n" )
end )

net.Receive( "NextMapCD", function()
	local string = net.ReadString()
	notification.AddLegacy( string, NOTIFY_GENERIC, 1 )
	surface.PlaySound( "buttons/button15.wav" )
	Msg( string .. "\n" )
end )

end



