function open_url(argument0) {
	// open_url(url)

	var escapedfolder = argument0;
	escapedfolder = string_replace_all(escapedfolder, "\"", "\\\"");
	if (os_type = os_windows) execute_shell("cmd", "explorer \"" + escapedfolder + "\"");
	else if (os_type = os_macosx) execute_shell("open", "\"" + escapedfolder + "\"");
	else if (os_type = os_linux) execute_shell("xdg-open", "\"" + escapedfolder + "\"");

}
