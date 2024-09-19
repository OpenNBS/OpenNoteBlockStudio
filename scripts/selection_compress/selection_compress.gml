function selection_compress() {
	// selection_compress()
	var a, b, str, nw, nh, na, nb, temp_colfirst, temp_collast, temp_exists, temp_ins, temp_key, temp_vel, temp_pan, temp_pit, temp_played;
	str = selection_code
	if (selected = 0 || selection_l = 1) return 0
	nw = 0
	nh = 0
	for (a = 0; a < selection_l; a += 1) {
	    temp_colfirst[a] = -1
	    temp_collast[a] = -1
	    if (selection_colfirst[a] > -1) {
	        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
	            if (selection_exists[a, b]) {
	                na = a
	                nb = b
	                if (a == 0) { // First column, don't change anything
	                } else {
						na = floor(a / 2)
						while (nb <= temp_collast[na]) { // Check if taken
	                        if (temp_exists[na, nb] == 0) break
	                        nb += 1
	                    }
					}
	                temp_exists[na, nb] = 1
	                temp_ins[na, nb] = selection_ins[a, b]
	                temp_key[na, nb] = selection_key[a, b]
	                temp_vel[na, nb] = selection_vel[a, b]
	                temp_pan[na, nb] = selection_pan[a, b]
	                temp_pit[na, nb] = selection_pit[a, b]
	                temp_played[na, nb] = selection_played[a, b]
					selection_exists[a, b] = 0
	                selection_ins[a, b] = 0
	                selection_key[a, b] = 0
	                selection_vel[a, b] = 0
	                selection_pan[a, b] = 0
	                selection_pit[a, b] = 0
	                selection_played[a, b] = 0
					
					if (temp_colfirst[na] == -1) {
						temp_colfirst[na] = nb
					} else { // A shifted note can be the first note in the new column
						temp_colfirst[na] = min(temp_colfirst[na], nb)
					}
	                temp_collast[na] = max(temp_collast[na], nb)
	                nw = max(nw, na)
	                nh = max(nh, nb)
	            } else {
	                temp_exists[a, b] = 0
	            }
	        }
	    }
	    selection_colfirst[a] = -1
	    selection_collast[a] = -1
	}
	selection_extend_height(nh + 1) // Fix #44
	for (a = 0; a <= nw; a += 1) {
	    if (temp_colfirst[a] > -1) {
	        for (b = temp_colfirst[a]; b <= temp_collast[a]; b += 1) {
	            if (temp_exists[a, b]) {
	                selection_exists[a, b] = 1
	                selection_ins[a, b] = temp_ins[a, b]
	                selection_key[a, b] = temp_key[a, b]
	                selection_vel[a, b] = temp_vel[a, b]
	                selection_pan[a, b] = temp_pan[a, b]
	                selection_pit[a, b] = temp_pit[a, b]
	                selection_played[a, b] = temp_played[a, b]
	            }
	        }
	        selection_colfirst[a] = temp_colfirst[a]
	        selection_collast[a] = temp_collast[a]
	    } else {
	        selection_colfirst[a] = -1
	        selection_collast[a] = -1
	    }
	}
	selection_l = nw + 1
	selection_h = nh + 1
	selection_code_update()
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)



}
