function control_step() {
	update_window()
	if (presence = 1 && obj_presence.ready = true) {
		np_setpresence(condstr(totalblocks != 0, "Total " + string(totalblocks) + " Notes"), condstr(filename = "", "Unsaved song") + condstr(filename != "", "Editing ") + filename_name(filename), "note", "");
	} else {
		np_clearpresence()
	}
}
