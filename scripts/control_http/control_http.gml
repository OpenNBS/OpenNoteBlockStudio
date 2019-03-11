// control_http()
// Handles the update checking
// update values:
// -1: unable to check for update
// 1: update found
// 2: up to date

if (async_load[? "id"] = update_http) {
    update_http = -1
    if (async_load[? "http_status"] = 200) {
        var res = async_load[? "result"];
        if (is_string(res)) {
			res = json_decode(res)
			if(res[?"tag_name"] != undefined){ 
				var newVersion = string_replace(res[?"tag_name"],"v","")
				if (string_count(".", newVersion) = 2) {
					if (newVersion = version) {
					  update = 2
					} else {
						if (question("Version " + newVersion + " is available! Do you want to download it?", "Update available!")) open_url(link_download)
						update = 1
					}
				}
			}else
			   update = -1
        }else
		   update = -1
    } else
        update = -1
}
