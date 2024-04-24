function select_all(argument0, argument1) {
	// select_all(instrument, not)
	// Deselects all and selects all notes with the given instrument. -1 to select all.
	var inst, a, b, ins, key, n, x1, y1, str, vel, pan, pit;
	inst = argument0
	n = argument1
	x1 = selection_x
	y1 = selection_y
	str = selection_code
	if (selected > 0) selection_place(1)
	if (totalblocks = 0) return 0
	if (inst > -1 && !n && inst.num_blocks = 0)
	    return 0

	selection_extend_length()
	selection_extend_height()
	
	for (a = 0; a <= enda; a += 1) {
	    if (colamount[a] > 0) {
	        for (b = colfirst[a]; b <= collast[a]; b += 1) {
	            if (song_exists[a, b]) {
	                ins = song_ins[a, b]
	                key = song_key[a, b]
	                vel = song_vel[a, b]
	                pan = song_pan[a, b]
	                pit = song_pit[a, b]
	                if (((ins = inst || inst = -1) && n = 0) || (ins != inst && n = 1)) {
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
	history_set(h_select, selection_x, selection_y, selection_code, x1, y1, str)



}
