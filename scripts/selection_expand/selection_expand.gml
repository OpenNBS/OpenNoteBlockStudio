function selection_expand() {
	// selection_expand()
	var str, nw, temp_colfirst, temp_collast, temp_exists, temp_ins, temp_key, temp_vel, temp_pan, temp_pit, temp_played, sa;
	str = selection_code
	if (selected = 0) return 0
	nw = selection_l * 2
	if (nw > selection_arraylength) { // New length
	    for (a = selection_arraylength + 1; a <= nw; a += 1) {
	        selection_colfirst[a] = -1
	        selection_collast[a] = -1
	        for (b = 0; b <= selection_arrayheight; b += 1) {
	            selection_exists[a, b] = 0
	        }
	    }
	    selection_arraylength = nw
	}
	for (a = 0; a < selection_l; a += 1) {
	    if (selection_colfirst[a] > -1) {
	        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
	            if (selection_exists[a, b]) {
	                temp_exists[a, b] = 1
	                temp_ins[a, b] = selection_ins[a, b]
	                temp_key[a, b] = selection_key[a, b]
	                temp_vel[a, b] = selection_vel[a, b]
	                temp_pan[a, b] = selection_pan[a, b]
	                temp_pit[a, b] = selection_pit[a, b]
	                temp_played[a, b] = selection_played[a, b]
	                selection_exists[a, b] = 0
	                selection_ins[a, b] = 0
	                selection_key[a, b] = 0
	                selection_vel[a, b] = 0
	                selection_pan[a, b] = 0
	                selection_pit[a, b] = 0
	                selection_played[a, b] = 0
	            } else {
	                temp_exists[a, b] = 0
	            }
	        }
	    }
	    temp_colfirst[a] = selection_colfirst[a]
	    temp_collast[a] = selection_collast[a]
	    selection_colfirst[a] = -1
	    selection_collast[a] = -1
	}
	for (a = 0; a < selection_l; a += 1) {
	    sa = a * 2
	    if (temp_colfirst[a] > -1) {
	        for (b = temp_colfirst[a] ;b <= temp_collast[a] ;b += 1) {
	            if (temp_exists[a, b]) {
	                selection_exists[sa, b] = 1
	                selection_ins[sa, b] = temp_ins[a, b]
	                selection_key[sa, b] = temp_key[a, b]
	                selection_vel[sa, b] = temp_vel[a, b]
	                selection_pan[sa, b] = temp_pan[a, b]
	                selection_pit[sa, b] = temp_pit[a, b]
	                selection_played[sa, b] = temp_played[a, b]
	            }
	        }
	        selection_colfirst[sa] = temp_colfirst[a]
	        selection_collast[sa] = temp_collast[a]
	    } else {
	        selection_colfirst[sa] = -1
	        selection_collast[sa] = -1
	    }
	}
	selection_l = nw
	selection_code_update()
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)



}
