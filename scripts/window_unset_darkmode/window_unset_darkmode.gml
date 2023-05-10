function window_unset_darkmode() {
	// window_unset_darkmode()

	if (os_type = os_windows) {
		EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));
		return external_call(lib_window_unset_darkmode, window_handle())
	}


}
