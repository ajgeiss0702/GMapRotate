--[[




Thanks to crazyscouter for this! From here: https://github.com/crazyscouter/Report-System/blob/master/report/lua/autorun/server/sv_version.lua



]]
timer.Simple(30, function()

	print(" ")
	print(" ")
	hook.Add("Initialize", "CheckAMRVersion", function()
		local url = "https://raw.githubusercontent.com/ajgeiss0702/GMapRotate/master/version.txt";
		http.Fetch( url,
			function( body, len, headers, code )
				print("github ver: " .. tostring(string.Trim(body)))
				if (string.Trim(body) == AMR_ver) then return; end
				if (AMR_ver > string.Trim(body)) then return; end
				print(" ")
				print("(============================VERSION================================)");
				print("GMapRotate is out of date! Download the latest version here:");
				print("https://github.com/ajgeiss0702/GMapRotate");
				print("New version:", body);
				print("Your version: ", AMR_ver);
				print("(============================VERSION================================)");
				print(" ")
			end,
			function( error )
				print(error)
			end
			);
		print("local ver: " .. AMR_ver)
		print(" ")
		print(" ")
		
	end)
	
end)

--Timer.Simple(5, CheckAMRVersionFunc() end)