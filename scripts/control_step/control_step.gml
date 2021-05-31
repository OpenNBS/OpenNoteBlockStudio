function control_step() {
	update_window()
	if (presence = 1) {
		if (presencems = 1) np_setpresence(condstr(filename = "", "Unsaved song") + filename_name(filename), time_str(marker_pos / tempo) + " / " + time_str(enda / tempo), "note", "");
		else np_setpresence(condstr(filename = "", "Unsaved song") + filename_name(filename), string_copy(time_str(marker_pos / tempo), 0, 8) + " / " + string_copy(time_str(enda / tempo), 0, 8), "note", "");
	} else {
		np_clearpresence()
	}
}
