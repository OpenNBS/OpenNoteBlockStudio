function selection_load(argument0, argument1, argument2, argument3) {
	// selection_load(x, y, code, undo)
	// Loads the selection from the string.
	var xx, yy, str, ca, cb, val, h;
	xx = argument0
	yy = argument1
	str = argument2
	selection_place(argument3)
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
	        selection_exists[ca, cb] = 1
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        selection_ins[ca, cb] = instrument_list[| val]
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        selection_key[ca, cb] = val
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
			selection_vel[ca, cb] = val
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
			selection_pan[ca, cb] = val
	        val = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
			selection_pit[ca, cb] = val
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
