function control_http() {
	// control_http()
	// Handles the check for updates, then attempts to download it if one is available
	
	if (check_update) {
		check_updates()
		get_update()
	}
}
