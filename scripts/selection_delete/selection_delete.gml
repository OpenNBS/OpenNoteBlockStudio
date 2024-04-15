function selection_delete(argument0) {
	// selection_delete(undo)
	// Deletes the selection and the blocks in it.
	var a, b, ani, totalcols, totalrows;
	if (!fullscreen && show_layers) {
		totalcols = floor((rw - 8 - 270) / 32)
	} else {
		totalcols = floor(rw / 32) + 1
	}
	totalrows = floor((rh - rhval) / 32)
	changed = 1
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
					if (theme = 3 && remove_effect && selection_x + a >= starta && selection_x + a < starta + totalcols && selection_y + b >= startb && selection_y + b < startb + totalrows) {
						ani = create(obj_removeeff)
						ani.xn = selection_x + a - starta
						ani.yn = selection_y + b - startb
					}
	            }
	        }
	        selection_colfirst[a] = -1
	        selection_collast[a] = -1
	    }
	}
	selected = 0
	if (!argument0) history_set(h_selectchange, 0, 0, "", selection_x, selection_y, try_compress_selection(selection_code))
	selection_code = ""
	selection_x = 0
	selection_y = 0
	selection_l = 0
	selection_h = 0
	update_songsize()



}
