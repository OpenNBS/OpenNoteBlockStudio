function open_url(argument0) {
	// open_url(url)

	if (os_type = os_windows) external_call(lib_open_url, argument0)
	else return url_open(argument0)



}
