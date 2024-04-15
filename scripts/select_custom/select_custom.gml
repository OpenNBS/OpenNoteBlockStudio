function select_custom() {
	// select_custom()
	// Selects all the note blocks with custom instruments.
	var a, b, str, ins, key, vel, pan, pit;
	str = selection_code
	if (selected > 0) selection_place(1)
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
	    for (a = 0 ;a <= selection_arraylength; a += 1) {
	        for (b = selection_arrayheight + 1; b <= endb; b += 1) {
	            selection_exists[a, b] = 0
	        }
	    }
	    selection_arrayheight = endb
	}
	for (a = 0; a <= enda; a += 1) {
	    if (colamount[a] > 0) {
	        for (b = colfirst[a]; b <= collast[a]; b += 1) {
	            if (song_exists[a, b]) {
	                ins = song_ins[a, b]
	                key = song_key[a, b]
	                vel = song_vel[a, b]
	                pan = song_pan[a, b]
	                pit = song_pit[a, b]
	                if (ins.user) {
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
	starta = selection_x
	sb_val[0] = starta
	history_set(h_select, selection_x, selection_y, try_compress_selection(selection_code), 0, 0, try_compress_selection(str))



}
