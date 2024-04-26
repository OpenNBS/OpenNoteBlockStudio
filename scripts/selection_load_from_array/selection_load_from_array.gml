function selection_load_from_array(xx, yy, array){
	// Load a selection code array to the selection data arrays
	
	var ca, cb, h;
	var length = array_length(array)
	if (length == 0) return 0
	ca = 0
	h = 0
	
	var at = 0
	
	while(at < length) {
	    ca += array[at++]
	    cb = 0
	    while (1) {
			var val = array[at++]
	        if (val == -1) break
	        cb += val
			remove_block_select(xx + ca, yy + cb)
	        selection_exists[ca, cb] = 1
			selection_ins[ca, cb] = instrument_list[| array[at++] ]
			selection_key[ca, cb] = array[at++]
			selection_vel[ca, cb] = array[at++]
			selection_pan[ca, cb] = array[at++]
			selection_pit[ca, cb] = array[at++]
			selected += 1
			if (selection_colfirst[ca] = -1) selection_colfirst[ca] = cb
			selection_collast[ca] = cb
			h = max(h, cb)
	    }
	}

	selection_x = xx
	selection_y = yy
	selection_l = ca + 1
	selection_h = h + 1
	selection_code_update()
}