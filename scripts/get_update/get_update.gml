// get_update()
// Attempts to download a newer version if one is available
// status:
// 1 - receiving packets (download in progress)
// 0 - success (download complete)

if (async_load[? "id"] == update_download) {
	var http_status = async_load[? "http_status"]
	var status = async_load[? "status"]
    if (status == 1) {
		downloaded_size = async_load[? "sizeDownloaded"]
		total_size = async_load[? "contentLength"]
	} else if (status == 0) {
		// Download was interrupted, may have been successful or not (if connection was interrupted)
		update = 5
	}
}