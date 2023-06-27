function window_unset_darkmode() {
	// window_unset_darkmode()

	EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));

	if (os_type = os_windows) {
		
		return external_call(lib_window_unset_darkmode, window_handle())
	}


}
