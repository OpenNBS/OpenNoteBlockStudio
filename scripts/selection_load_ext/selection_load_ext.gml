function selection_load_ext(argument0, argument1, argument2) {
	// selection_load_ext(x, y, code)
	// Loads the selection from the string, and also removes any blocks underneath them.
	var xx, yy, str, ca, cb, val, h;
	xx = argument0
	yy = argument1
	str = argument2
	if (str = "") return 0
	ca = 0
	h = 0
	while (str != "") {
	    val = real(string_copy(str, 1, string_pos("|", str) - 1))
	    str = string_delete(str, 1, string_pos("|", str))
	    ca += val
	    cb = 0
	    while (1) {
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        if (val = -1) break
	        cb += val
	        remove_block_select(xx + ca, yy + cb)
	        songs[song].selection_exists[ca, cb] = 1
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        songs[song].selection_ins[ca, cb] = songs[song].instrument_list[| val]
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        songs[song].selection_key[ca, cb] = val
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        songs[song].selection_vel[ca, cb] = val
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        songs[song].selection_pan[ca, cb] = val
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        songs[song].selection_pit[ca, cb] = val
	        songs[song].selected += 1
	        if (songs[song].selection_colfirst[ca] = -1) songs[song].selection_colfirst[ca] = cb
	        songs[song].selection_collast[ca] = cb
	        h = max(h, cb)
	    }
	}
	songs[song].selection_x = xx
	songs[song].selection_y = yy
	songs[song].selection_l = ca + 1
	songs[song].selection_h = h + 1
	selection_code_update()



}
