function remove_block_manual(argument0, argument1) {
	// remove_block_manual(x, y)
	var xx, yy, ins, key, a, b, vel, pan, pit, ani;
	xx = argument0
	yy = argument1

	if (song_exists[xx, yy] = 0) return 0
	song_exists[xx, yy] = 0
	ins = song_ins[xx, yy]
	key = song_key[xx, yy]
	vel = song_vel[xx, yy]
	pan = song_pan[xx, yy]
	pit = song_pit[xx, yy]
	ins.num_blocks--
	if (song_key[xx, yy] < 33 || song_key[xx, yy] > 57) block_outside -= 1
	if (ins.user) block_custom -= 1
	if (song_pit[xx, yy] != 0) block_pitched -= 1
	song_ins[xx, yy] = 0
	song_key[xx, yy] = 0
	song_vel[xx, yy] = 0
	song_pan[xx, yy] = 0
	song_pit[xx, yy] = 0
	song_played[xx, yy] = 0
	song_added[xx, yy] = 0
	colamount[xx] -= 1
	rowamount[yy] -= 1
	totalblocks -= 1
	work_remove += 1
	if (colamount[xx] = 0) {
	    if (enda = xx) {
	        for (a = xx; a >= 0; a -= 1) {
	            enda = a
	            if (colamount[a] > 0) break
	        }
	    }
	}
	if (rowamount[yy] = 0) {
	    if (endb = yy) {
	        for (b = yy; b >= 0; b -= 1) {
	            endb = b
	            if (rowamount[b] > 0) break
	        }
	    }
	}
	if (colfirst[xx] = yy) {
	    colfirst[xx] = -1
	    for (a = 0; a <= collast[xx]; a += 1) {
	        if (song_exists[xx, a]) {
	            colfirst[xx] = a
	            break
	        }
	    }
	}
	if (collast[xx] = yy) {
	    collast[xx] = -1
	    for (a = yy; a >= 0; a -= 1) {
	        if (song_exists[xx, a]) {
	            collast[xx] = a
	            break
	        }
	    }
	}
	history_set(h_removeblock, xx, yy, ins, key, vel, pan, pit)
	if (theme = 3 && remove_effect) {
		ani = create(obj_removeeff)
		ani.xn = xx - starta
		ani.yn = yy - startb
	}
	changed = 1



}
