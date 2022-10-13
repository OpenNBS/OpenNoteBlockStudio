function select_all(argument0, argument1) {
	// select_all(instrument, not)
	// Deselects all and selects all notes with the given instrument. -1 to select all.
	var inst, a, b, ins, key, n, x1, y1, str, vel, pan, pit;
	inst = argument0
	n = argument1
	x1 = songs[song].selection_x
	y1 = songs[song].selection_y
	str = songs[song].selection_code
	if (songs[song].selected > 0) selection_place(1)
	if (songs[song].totalblocks = 0) return 0
	if (inst > -1 && !n && inst.num_blocks = 0)
	    return 0
	if (songs[song].enda > songs[song].selection_arraylength) { // New length
	    for (a = songs[song].selection_arraylength + 1; a <= songs[song].enda; a += 1) {
	        songs[song].selection_colfirst[a] = -1
	        songs[song].selection_collast[a] = -1
	        for (b = 0; b <= songs[song].selection_arrayheight; b += 1) {
	            songs[song].selection_exists[a, b] = 0
	        }
	    }
	    songs[song].selection_arraylength = songs[song].enda
	}
	if (songs[song].endb > songs[song].selection_arrayheight) { // New height
	    for (a = 0; a <= songs[song].selection_arraylength; a += 1) {
	        for (b = songs[song].selection_arrayheight + 1; b <= songs[song].endb; b += 1) {
	            songs[song].selection_exists[a, b] = 0
	        }
	    }
	    songs[song].selection_arrayheight = songs[song].endb
	}
	for (a = 0; a <= songs[song].enda; a += 1) {
	    if (songs[song].colamount[a] > 0) {
	        for (b = songs[song].colfirst[a]; b <= songs[song].collast[a]; b += 1) {
	            if (songs[song].song_exists[a, b]) {
	                ins = songs[song].song_ins[a, b]
	                key = songs[song].song_key[a, b]
	                vel = songs[song].song_vel[a, b]
	                pan = songs[song].song_pan[a, b]
	                pit = songs[song].song_pit[a, b]
	                if (((ins = inst || inst = -1) && n = 0) || (ins != inst && n = 1)) {
	                    songs[song].selection_exists[a, b] = 1
	                    songs[song].selection_ins[a, b] = ins
	                    songs[song].selection_key[a, b] = key
	                    songs[song].selection_vel[a, b] = vel
	                    songs[song].selection_pan[a, b] = pan
	                    songs[song].selection_pit[a, b] = pit
	                    songs[song].selection_played[a, b] = 0
	                    if (songs[song].selection_colfirst[a] = -1) songs[song].selection_colfirst[a] = b
	                    songs[song].selection_collast[a] = max(songs[song].selection_collast[a], b)
	                    songs[song].selected += 1
	                    remove_block_select(a, b)
	                }
	            }
	        }
	    }
	}
	songs[song].selection_x = 0
	songs[song].selection_y = 0
	songs[song].selection_l = songs[song].enda + 1
	songs[song].selection_h = songs[song].endb + 1
	selection_trim()
	selection_code_update()
	history_set(h_select, songs[song].selection_x, songs[song].selection_y, songs[song].selection_code, x1, y1, str)



}
