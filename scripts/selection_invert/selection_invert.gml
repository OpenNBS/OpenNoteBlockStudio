function selection_invert() {
	// invert_selection()
	// Inverts the selection.
	var a, b, ins, key, d, x1, y1, x2, y2, temp_exists, xx, yy, str, vel, pan, pit;
	if (selected = 0 && totalblocks = 0) return 0
	if (selected > 0 && totalblocks = 0) {
	    selection_place(0)
	    return 0
	}
	if (selected = 0) {
	    select_all(-1, 0)
	    return 0
	}
	if (enda > selection_arraylength) { // New length
	    for (a = selection_arraylength + 1; a <= enda; a += 1) {
	        selection_colfirst[a] = -1
	        selection_collast[a] = -1
	        for (b = 0; b <= selection_arrayheight; b += 1) {
	            selection_exists[a, b] = 0
	        }
	    }
	    selection_arraylength = enda
	}
	if (endb > selection_arrayheight) { // New height
	    for (a = 0; a <= selection_arraylength; a += 1) {
	        for (b = selection_arrayheight + 1; b <= endb; b += 1) {
	            selection_exists[a, b] = 0
	        }
	    }
	    selection_arrayheight = endb
	}
	xx = selection_x
	yy = selection_y
	str = selection_code

	x1 = selection_x
	y1 = selection_y
	x2 = selection_x + selection_l
	y2 = selection_y + selection_h
	for (a = 0; a < selection_l; a += 1) {
	    for (b = 0; b < selection_h; b += 1) {
	        temp_exists[a, b] = 0
	        if (b >= selection_colfirst[a] && b <= selection_collast[a]) temp_exists[a, b] = selection_exists[a, b]
	    }
	}
	selection_place(1)
	for (a = 0; a <= enda; a += 1) {
	    if (colamount[a] > 0) {
	        for (b = colfirst[a]; b <= collast[a]; b += 1) {
	            if (song_exists[a, b]) {
	                ins = song_ins[a, b]
	                key = song_key[a, b]
	                vel = song_vel[a, b]
	                pan = song_pan[a, b]
	                pit = song_pit[a, b]
	                d = 0
	                if (a >= x1 && b >= y1 && a < x2 && b < y2) {
	                    d = temp_exists[a - x1, b - y1]
	                }
	                if (d = 0) {
	                    selection_exists[a, b] = 1
	                    selection_ins[a, b] = ins
	                    selection_key[a, b] = key
	                    selection_vel[a, b] = vel
	                    selection_pan[a, b] = pan
	                    selection_pit[a, b] = pit
	                    selection_played[a, b] = 0
	                    if (selection_colfirst[a] = -1) selection_colfirst[a] = b
	                    selection_collast[a] = max(selection_collast[a], b)
	                    selected += 1
	                    remove_block_select(a, b)
	                }
	            }
	        }
	    }
	}
	selection_x = 0
	selection_y = 0
	selection_l = enda + 1
	selection_h = endb + 1
	selection_trim()
	selection_code_update()
	history_set(h_select, selection_x, selection_y, selection_code, xx, yy, str)



}
