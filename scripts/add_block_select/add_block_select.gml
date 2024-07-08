function add_block_select(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	// add_block_select(x, y, ins, key, vel, pan, pit)
	var a, b, c, xx, yy, ins, key, vel, pan, pit;
	xx = argument0
	yy = argument1
	ins = argument2
	key = median(0, argument3, 87)
	vel = argument4
	pan = argument5
	pit = argument6

	// Initialize cells
	if (xx >= arraylength) {
	    for (a = arraylength; a <= xx; a += 1) {
	        colfirst[a] = -1
	        collast[a] = -1
	        colamount[a] = 0
	        for (b = 0; b < max(yy + 1, arrayheight); b += 1) song_exists[a, b] = 0
	    }
	    arraylength = xx + 1
	}
	if (yy >= arrayheight) {
	    for (a = 0; a < arraylength; a += 1) {
	        for (b = arrayheight; b <= yy; b += 1) {
	            rowamount[b] = 0
	            song_exists[a, b] = 0
	        }
	    }
	    arrayheight = yy + 1
	}

	if (song_exists[xx, yy]) remove_block_select(xx, yy)

	// Add block
	song_exists[xx, yy] = 1
	song_ins[@ xx, yy] = ins
	song_key[@ xx, yy] = key
	song_vel[@ xx, yy] = vel
	song_pan[@ xx, yy] = pan
	song_pit[@ xx, yy] = pit
	song_played[@ xx, yy] = 0
	song_added[@ xx, yy] = 0
	colamount[@ xx] += 1
	rowamount[@ yy] += 1
	ins.num_blocks++
	if (key < 33 || key > 57) block_outside += 1
	if (ins.user) block_custom += 1
	if (pit != 0) block_pitched += 1
	totalblocks += 1

	if (colfirst[xx] = -1 || yy < colfirst[xx]) colfirst[@ xx] = yy
	if (yy > collast[xx]) collast[@ xx] = yy

	if (xx >= enda) enda = xx
	if (yy >= endb) endb = yy
	return 1



}
