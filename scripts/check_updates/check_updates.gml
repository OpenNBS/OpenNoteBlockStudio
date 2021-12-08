function check_updates() {
	// check_updates()
	// Handles the update checking
	// update values:
	// -1: unable to check for update
	// 0: checking
	// 1: update found
	// 2: up to date
	// 4: downloading update

	if (async_load[? "id"] = update_http) {
		
		// CHECK RECEIVED DATA:
		// show_debug_message(async_load[? "result"])
		// show_debug_message(async_load[? "status"])
		// show_debug_message(async_load[? "http_status"])
		
		var status = async_load[? "status"];
		
		if (status == -1) { // error
			update = -1
			return;
		}
		
		else if (status == 0) { // success
			
			if (async_load[? "http_status"] != 200) { // other status codes (403 - rate limit, etc.)
				update = -1;
				return;
			}
			
			else {
				update_http = -1;
			
			    var res = async_load[? "result"];
				res = json_parse(res);

				var release = -1;
				if (check_prerelease) {
					// Iterate array of releases and get the first (latest) release OR pre-release
					for (var i = 0; i < array_length(res); i++) {
						if (check_prerelease || !res[i].prerelease) {
							release = res[i];
							break;
						}
					}
				} else {
					release = res;
				}
			
				if (release != -1) {
					var new_version = string_replace(release.tag_name, "v", "");
					if (new_version == version) {
						update = 2;
					} else {
						if (question("Version " + new_version + " is available! Do you want to download it?", "Update available!")) {
							var download_url = release.assets[0].browser_download_url;
							update_download = http_get_file(download_url, update_file);
							update = 4;
						} else {
							update = 1;
						}
					}
				} else update = -1;
			
			}
		}
	}
}
