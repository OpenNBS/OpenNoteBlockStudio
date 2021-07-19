function control_step() {
	update_window()
	if (presence && obj_presence.ready) {
		if (RUN_FROM_IDE != 1) np_setpresence(condstr(totalblocks > 0, string_format_thousands(totalblocks) + " note" + condstr(totalblocks > 1, "s") + " placed"), "Debugging", "note", "")
		else np_setpresence(condstr(totalblocks > 0, string_format_thousands(totalblocks) + " note" + condstr(totalblocks > 1, "s") + condstr(!isplayer, " placed")), condstr((filename = "" || filename = "-player") && !isplayer, "Unsaved song") + condstr(filename != "" && filename != "-player" && !isplayer, "Editing ") + condstr(((filename != "" && filename != "-player") || midiname != "") && isplayer, "Listening to ") + condstr(filename != "-player", filename_name(filename)) + condstr((filename = "" || filename = "-player") && midiname != "" && isplayer, midiname), "note", "")
	} else {
		np_clearpresence()
	}
}
