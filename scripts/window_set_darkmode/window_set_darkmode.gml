function window_set_darkmode() {
	// window_set_darkmode()

	if (os_type = os_windows) {
		EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(0));
		return external_call(lib_window_set_darkmode, window_handle())
	}


}
