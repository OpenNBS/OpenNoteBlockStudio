function region_code_get(argument0, argument1, argument2, argument3) {
	// region_code_get(x1, y1, x2, y2)
	// Fetches the code of the specified region.z
	//show_debug_message("region_code_get")
	var x1, y1, x2, y2, str, a, b, ca, cb, am;
	x1 = argument0
	y1 = argument1
	x2 = argument2
	y2 = argument3
	
	var _colamount = colamount
	var _colfirst = colfirst
	var _collast = collast
	var _song_exists = song_exists
	var _song_ins = song_ins
	var _song_key = song_key
	var _song_vel = song_vel
	var _song_pan = song_pan
	var _song_pit = song_pit

	ca = 0
	am = 0
	var str_buffer = buffer_create(16, buffer_grow, 1);
	for (a = x1; a < x2; a += 1) {
	    if (a <= enda) {
	        if (_colamount[a] > 0) {
				buffer_write(str_buffer, buffer_text, string(ca))
				buffer_write(str_buffer, buffer_text, "|")
	            ca = 0
	            cb = 0
	            for (b = y1; b < y2; b += 1) {
	                if (b >= _colfirst[a] && b <= _collast[a]) {
	                    if (_song_exists[a, b]) {
							buffer_write(str_buffer, buffer_text, string(cb))
							buffer_write(str_buffer, buffer_text, "|")
	                        cb = 0
							buffer_write(str_buffer, buffer_text, string(ds_list_find_index(instrument_list, _song_ins[a, b])))
							buffer_write(str_buffer, buffer_text, "|")
	                        buffer_write(str_buffer, buffer_text, string(_song_key[a, b]))
							buffer_write(str_buffer, buffer_text, "|")
							buffer_write(str_buffer, buffer_text, string(_song_vel[a, b]))
							buffer_write(str_buffer, buffer_text, "|")
							buffer_write(str_buffer, buffer_text, string(_song_pan[a, b]))
							buffer_write(str_buffer, buffer_text, "|")
							buffer_write(str_buffer, buffer_text, string(_song_pit[a, b]))
							buffer_write(str_buffer, buffer_text, "|")
	                        am += 1
	                    }
	                }
	                cb += 1
	            }
	            buffer_write(str_buffer, buffer_text, "-1|")
	        }
	    }
	    ca += 1
	}
	if (am == 0) {
		str = ""
	} else {
		buffer_seek(str_buffer, buffer_seek_start, 0)
		str = try_compress_selection(buffer_read(str_buffer, buffer_string))
	}
	buffer_delete(str_buffer)
	//show_debug_message(str)
	return str

}
