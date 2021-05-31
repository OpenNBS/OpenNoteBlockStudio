function control_step() {
	update_window()
	np_setpresence(condstr(filename = "", "Unsaved song") + filename_name(filename), time_str(marker_pos / tempo) + " / " + time_str(enda / tempo), "note", "");

}
