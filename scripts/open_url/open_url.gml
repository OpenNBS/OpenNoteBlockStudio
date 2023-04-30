function open_url(argument0) {
	// open_url(url)

	//external_call(lib_open_url, argument0)
	if (os_type = os_windows) ExecuteShell("explorer \"" + argument0 + "\"", false)
	else url_open(argument0)



}
