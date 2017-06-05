--[[




Thanks to crazyscouter for this! From here: https://github.com/crazyscouter/Report-System/blob/master/report/lua/autorun/server/sv_version.lua



]]
hook.Add("Initialize", "CheckStockVersion", function()
	local url = "https://raw.githubusercontent.com/ajgeiss0702/GMapRotate/master/version.txt";
	http.Fetch( url,
		function( body, len, headers, code )
			if (string.Trim(body) == AMR-ver) then return; end
			if (AMR-ver > string.Trim(body)) then return; end
			print("(============================VERSION=======================================)");
			print("Your GMapRotate is out of date! Download the latest version here:");
			print("https://github.com/ajgeiss0702/GMapRotate");
			print("New version:", body);
			print("Your version: ", AMR-ver);
			print("(============================VERSION=======================================)");
				
		end,
		function( error )
			print(error)
		end
		);
	print("local ver: " .. AMR-ver)
	print("github ver: " .. body)
end)