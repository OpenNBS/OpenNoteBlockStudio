function selection_delete(argument0) {
	// selection_delete(undo)
	// Deletes the selection and the blocks in it.
	var a, b;
	if (selected = 0) return 0
	for (a = 0; a < selection_l; a += 1) {
	    if (selection_colfirst[a] > -1) {
	        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
	            if (selection_exists[a, b]) {
	                selection_exists[a, b] = 0
	                selection_ins[a, b] = 0
	                selection_key[a, b] = 0
	                selection_vel[a, b] = 0
	                selection_pan[a, b] = 0
	                selection_pit[a, b] = 0
	                selection_played[a, b] = 0
	            }
	        }
	        selection_colfirst[a] = -1
	        selection_collast[a] = -1
	    }
	}
	selected = 0
	if (!argument0) history_set(h_selectchange, 0, 0, "", selection_x, selection_y, selection_code)
	selection_code = ""
	selection_x = 0
	selection_y = 0
	selection_l = 0
	selection_h = 0
	update_songsize()



}
