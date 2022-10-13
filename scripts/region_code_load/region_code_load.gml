function region_code_load(argument0, argument1, argument2) {
	// region_code_load(x, y, code)
	// Loads the specified code into the x, y position.
	var xx, yy, str, ca, cb, val, ins, key, vel, pan, pit;
	xx = argument0
	yy = argument1
	str = argument2
	if (str = "") return 0
	ca = 0
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
	        ins = songs[song].instrument_list[| real(string_copy(str, 1, string_pos("|", str) - 1))]
	        str = string_delete(str, 1, string_pos("|", str))
	        key = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        vel = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        pan = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        pit = real(string_copy(str, 1, string_pos("|", str) - 1))
	        str = string_delete(str, 1, string_pos("|", str))
	        add_block(xx + ca, yy + cb, ins, key, vel, pan, pit)
	    }
	}



}
