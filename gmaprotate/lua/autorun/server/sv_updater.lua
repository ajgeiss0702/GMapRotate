--[[




Thanks to crazyscouter for this! From here: https://github.com/crazyscouter/Report-System/blob/master/report/lua/autorun/server/sv_version.lua



]]
local function chkgmrver()
	timer.Simple(5, function()
		local url = "https://raw.githubusercontent.com/ajgeiss0702/GMapRotate/master/gmaprotate/do_not_change/version.txt";
		http.Fetch( url,
			function( body, len, headers, code )
				local gitver = tonumber(string.Trim(body))
				if debug then
					--print("[GMR DEBUG] github ver: " .. tostring(string.Trim(body)))
				end
				if (gitver == tonumber(AMR_ver)) then return; end
				if (tonumber(AMR_ver) > gitver) then return; end
				print(" ")
				print(" ")
				print(" ")
				print(" ")
				print("(============================VERSION================================)");
				print("GMapRotate is out of date! Download the latest version here:");
				print("https://github.com/ajgeiss0702/GMapRotate");
				print("New version:", body);
				print("Your version: ", AMR_ver);
				print("(============================VERSION================================)");
				print(" ")
				print(" ")
				print(" ")
				print(" ")
			end,
			function( error )
				print(error)
			end
			);
			if debug then
				--print("[GMR DEBUG] local ver: " .. AMR_ver)
			end
		--print(" ")
		--print(" ")
		--print(" ")
		
	end)
end
hook.Add("InitPostEntity", "CheckAMRVersion", chkgmrver)

timer.Simple(55, chkgmrver)

chkgmrver()
--]]