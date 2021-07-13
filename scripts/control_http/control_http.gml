function control_http() {
	// control_http()
	// Handles the check for updates, then attempts to download it if one is available
	
	if (RUN_FROM_IDE != 1 || snapshot = 1) {
		
	} else {
	check_updates()
	get_update()
	}


}
