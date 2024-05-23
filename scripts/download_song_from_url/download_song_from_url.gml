function download_song_from_url() {
	// download_song_from_url()
	// Attempts to download a song from a URL
	// status:
	// 1 - receiving packets (download in progress)
	// 0 - success (download complete)

	if (async_load[? "id"] == song_download_data) {
		var status = async_load[? "status"];
	    if (status == 1) {
			song_downloaded_size = async_load[? "sizeDownloaded"];
			song_total_size = async_load[? "contentLength"];
		} else if (status == 0) {
			// Download was interrupted, may have been successful or not (if connection was interrupted)
			song_download_data = -1;
			song_download_status = 0;
			if (song_total_size > 0 && file_get_size(downloaded_song_file) == song_total_size) {
				song_downloaded_size = song_total_size; // prevent freezing under 100%
				load_song(downloaded_song_file);
			} else {
				if (language != 1) {
					show_message("The song could not be downloaded! Please try again with a different song.");
				} else {
					show_message("___");
				}
			}
		}
	}


}
