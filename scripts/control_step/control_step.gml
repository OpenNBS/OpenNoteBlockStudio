function control_step() {
	update_window()
	if (os_version > 393217 && os_type = os_windows){
	if (songs[song].enda = 0 || !taskbar) {
		window_noprogress(window_handle())
	} else {
		if (playing) window_normal(window_handle())
		else window_paused(window_handle())
		window_value(window_handle(), songs[song].marker_pos, songs[song].enda)
	}
	}
	if (current_time - pingtime >= 1000){
	if (presence && obj_presence.ready) {
		if (RUN_FROM_IDE != 1) np_setpresence(condstr(songs[song].totalblocks > 0, string_format_thousands(songs[song].totalblocks) + " note" + condstr(songs[song].totalblocks > 1, "s") + " placed"), "Debugging", condstr(window_icon, "note", "noteflat"), "")
		else np_setpresence(condstr(songs[song].totalblocks > 0, string_format_thousands(songs[song].totalblocks) + " note" + condstr(songs[song].totalblocks > 1, "s") + condstr(!isplayer, " placed")), condstr((songs[song].filename = "" || songs[song].filename = "-player") && !isplayer, "Unsaved song") + condstr(songs[song].filename != "" && songs[song].filename != "-player" && !isplayer, "Editing ") + condstr(((songs[song].filename != "" && songs[song].filename != "-player") || songs[song].midiname != "") && isplayer, "Listening to ") + condstr(songs[song].filename != "-player", filename_name(songs[song].filename)) + condstr((songs[song].filename = "" || songs[song].filename = "-player") && songs[song].midiname != "" && isplayer, songs[song].midiname), condstr(window_icon, "note", "noteflat"), "")
	} else {
		np_clearpresence()
	}
	pingtime = current_time
	}
	if (window_icon != last_icon) {
		icon_time = current_time
		icon_display = 1
	}
	if (current_time - icon_time >= 1000 && icon_time != -1) {
		icon_display = 0
		icon_time = -1
	}
	last_icon = window_icon
}
