function action_cut() {
	// action_cut()
	selection_copied = songs[song].selection_code
	selection_delete(false)
	clipboard = selection_copied
	songs[song].changed = 1

}
