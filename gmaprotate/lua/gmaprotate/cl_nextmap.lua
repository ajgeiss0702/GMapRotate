--[[


Auto Map rotator
Made by ajgeiss0702 for AstroGmod GuessWho













((--------------------------------------------------------------------------------))
 | Do not change anything below this line (unless you know what you are doing!)   |
((--------------------------------------------------------------------------------]]


if CLIENT then
	
	
	
	
	local NextMap = { }
	
	function NextMap:Init()
		self:SetSize(100, 100)
		self:Center()
	end
	
	function PANEL:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
		draw.DrawText("Map will change in " .. GMR_recvString .. " seconds!")
	end
	
	vgui.Register( "MyFirstPanel", PANEL, "Panel" )
	
	
	
	
	net.Receive( "OpenMapGui", function()
		GMR_recvString = net.ReadString()
		local pnl = vgui.Create( "MyFirstPanel", parentpanel )
	end )
	
	
	
	
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



