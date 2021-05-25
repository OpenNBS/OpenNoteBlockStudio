function action_cut() {
	// action_cut()
	selection_copied = selection_code
	selection_delete(false)
	clipboard = selection_copied
	changed = 1

}
