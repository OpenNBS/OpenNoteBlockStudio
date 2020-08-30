function get_update() {
	// get_update()
	// Attempts to download a newer version if one is available
	// status:
	// 1 - receiving packets (download in progress)
	// 0 - success (download complete)

	if (async_load[? "id"] == update_download) {
		var status = async_load[? "status"]
	    if (status == 1) {
			downloaded_size = async_load[? "sizeDownloaded"]
			total_size = async_load[? "contentLength"]
		} else if (status == 0) {
			// Download was interrupted, may have been successful or not (if connection was interrupted)
			update = 5
			if (file_get_size(update_file) == total_size) {
				show_message("Download complete! Click OK to begin installing the update.")
				// At this point, the game is paused until the user dismisses the message
				ExecuteShell("\"" + update_file + "\"", false, true)
				game_end()
			} else {
				if (question("Failed to download update. Do you want to open the Note Block Studio website and update manually?", "Failed")) {
					open_url(link_download)
				}
			window = w_greeting
			update_download = -1
			update = 1
			}
		}
	}


}
