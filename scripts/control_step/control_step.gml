function control_step() {
	update_window()
	if (os_version > 393217){
	if (enda = 0) {
		window_noprogress(window_handle())
	} else {
		if (playing) window_normal(window_handle())
		else window_paused(window_handle())
		window_value(window_handle(), marker_pos, enda)
	}
	}
	if (presence && obj_presence.ready) {
		if (RUN_FROM_IDE != 1) np_setpresence(condstr(totalblocks > 0, string_format_thousands(totalblocks) + " note" + condstr(totalblocks > 1, "s") + " placed"), "Debugging", "note", "")
		else np_setpresence(condstr(totalblocks > 0, string_format_thousands(totalblocks) + " note" + condstr(totalblocks > 1, "s") + condstr(!isplayer, " placed")), condstr((filename = "" || filename = "-player") && !isplayer, "Unsaved song") + condstr(filename != "" && filename != "-player" && !isplayer, "Editing ") + condstr(((filename != "" && filename != "-player") || midiname != "") && isplayer, "Listening to ") + condstr(filename != "-player", filename_name(filename)) + condstr((filename = "" || filename = "-player") && midiname != "" && isplayer, midiname), "note", "")
	} else {
		np_clearpresence()
	}
}
