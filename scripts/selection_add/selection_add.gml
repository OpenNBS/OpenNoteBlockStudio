function selection_add() {
	// selection_add(x1, y1, x2, y2, copy, undo[, locked])
	// Adds the given area to the selection.
	var x1, y1, x2, y2, al, ah, ac, a, b, am, sa, sb, nx1, ny1, nx2, ny2, copy, lockedlayer, includelocked;
	x1 = min(argument[0], argument[2])
	y1 = min(argument[1], argument[3])
	x2 = max(argument[0], argument[2])
	y2 = max(argument[1], argument[3])
	x1 = max(0, x1)
	y1 = max(0, y1)
	x2 = median(0, x2, enda) + 1
	y2 = median(0, y2, endb) + 1
	copy = argument[4]
	includelocked = 0
	if (argument_count > 6) {
		includelocked = argument[6]
	}
	if (x1 > enda || y1 > endb) return 0
	ac = 0
	nx1 = x2
	ny1 = y2
	nx2 = 0
	ny2 = 0
	for (b = 0; b <= endb; b += 1) {
	    lockedlayer[b] = 0
	    if (solostr != "") {
	        if (string_count("|" + string(b) + "|", solostr) = 0) {
	            lockedlayer[b] = 1
	        } else if (layerlock[b] = 1) {
	            lockedlayer[b] = 1
	        }
	    } else if (b < endb2) {
	        if (layerlock[b] = 1) {
	            lockedlayer[b] = 1
	        }
	    }
	}
	for (a = x1; a < x2; a += 1) {
	    for (b = y1; b < y2; b += 1) {
	        if (lockedlayer[b] = 0 || includelocked) {
	            if (song_exists[a, b]) {
	                nx1 = min(nx1, a)
	                ny1 = min(ny1, b)
	                nx2 = max(nx2, a)
	                ny2 = max(ny2, b)
	                ac += 1
	            }
	        }
	    }
	}
	x1 = nx1
	y1 = ny1
	x2 = nx2 + 1
	y2 = ny2 + 1
	al = x2 - x1
	ah = y2 - y1
	if (ac = 0) return 0 // None selected
	if (selected = 0) { // Create new
	    selection_x = x1
	    selection_y = y1
	    selection_l = al
	    selection_h = ah
		selection_extend_length(al)
		selection_extend_height(ah)
	} else { // Add to existing
	    al = selection_l + max(0, selection_x - x1) + max(0, x2 - (selection_x + selection_l))
	    ah = selection_h + max(0, selection_y - y1) + max(0, y2 - (selection_y + selection_h))
	    selection_extend_length(al)
		selection_extend_height(ah)
	    if (x1 < selection_x || y1 < selection_y) { // Move blocks
	        var temp_colfirst, temp_collast, temp_exists, temp_ins, temp_key, temp_vel, temp_pan, temp_pit, temp_played;
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
	            sa = a + max(0, selection_x - x1)
	            if (temp_colfirst[a] > -1) {
	                for (b = temp_colfirst[a]; b <= temp_collast[a]; b += 1) {
	                    sb = b + max(0, selection_y - y1)
	                    if (temp_exists[a, b]) {
	                        selection_exists[sa, sb] = 1
	                        selection_ins[sa, sb] = temp_ins[a, b]
	                        selection_key[sa, sb] = temp_key[a, b]
	                        selection_vel[sa, sb] = temp_vel[a, b]
	                        selection_pan[sa, sb] = temp_pan[a, b]
	                        selection_pit[sa, sb] = temp_pit[a, b]
	                        selection_played[sa, sb] = temp_played[a, b]
	                    }
	                }
	                selection_colfirst[sa] = temp_colfirst[a] + max(0, selection_y - y1)
	                selection_collast[sa] = temp_collast[a] + max(0, selection_y - y1)
	            } else {
	                selection_colfirst[sa] = -1
	                selection_collast[sa] = -1
	            }
	        }
	    }
	    selection_x = min(selection_x, x1)
	    selection_y = min(selection_y, y1)
	    selection_l = al
	    selection_h = ah
	}
	for (a = x1; a < x2; a += 1) { // Add block to selection 
	    if (colamount[a] > 0) {
	        for (b = max(colfirst[a], y1); b < min(collast[a] + 1, y2); b += 1) {
	            if (lockedlayer[b] = 0 || includelocked) {
	                if (song_exists[a, b]) {
	                    sa = a - selection_x
	                    sb = b - selection_y
	                    if (selection_colfirst[sa] = -1) selection_colfirst[sa] = sb
	                    selection_colfirst[sa] = min(selection_colfirst[sa], sb)
	                    selection_collast[sa] = max(selection_collast[sa], sb)
	                    selection_exists[sa, sb] = 1
	                    selection_ins[sa, sb] = song_ins[a, b]
	                    selection_key[sa, sb] = song_key[a, b]
	                    selection_vel[sa, sb] = song_vel[a, b]
	                    selection_pan[sa, sb] = song_pan[a, b]
	                    selection_pit[sa, sb] = song_pit[a, b]
	                    selection_played[sa, sb] = 0
	                    if (!copy) {
	                        remove_block_select(a, b)
	                    }
	                }
	            }
	        }
	    }
	}
	if (!argument[5]) history_set(h_selectadd, x1, y1, x2, y2, copy)
	selected += ac
	selection_code_update()



}
