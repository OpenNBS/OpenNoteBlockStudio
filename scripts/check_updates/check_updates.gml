function check_updates() {
	// check_updates()
	// Handles the update checking
	// update values:
	// -1: unable to check for update
	// 0: checking
	// 1: update found
	// 2: up to date
	// 4: downloading update

	
	var release = -1
	try {
		if (async_load[? "id"] = update_http) {
		    update_http = -1
		    if (async_load[? "http_status"] = 200) {
		        var res = async_load[? "result"];
				res = json_parse(res)
				// Iterate array of releases and get the first (latest) release OR pre-release
				for (var i = 0; i < array_length(res); i++) {
					if (check_prerelease || !res[i].prerelease) {
						release = res[i];
						break
					}
				}
			}
		}
		if (release != -1) {
			var new_version = string_replace(release.tag_name, "v", "")
			if (new_version == version) {
				update = 2
			} else {
				if (question("Version " + new_version + " is available! Do you want to download it?", "Update available!")) {
					var download_url = release.assets[0].browser_download_url
					update_download = http_get_file(download_url, update_file)
					update = 4
				} else {
					update = 1
				}
			}
		}
	} catch (e) {
		log("Update check failed: " + e.message + e.longMessage)
		update = -1
	}
}
