function selection_code_update() {
	// selection_code_update()
	// Updates the selection code
	var a, b, ca, cb;

	if (selected = 0) return 0
	ca = 0
	var str_buffer = buffer_create(16, buffer_grow, 1);
	for (a = 0; a < selection_l; a += 1) {
	    if (selection_colfirst[a] > -1) {
			buffer_write(str_buffer, buffer_text, string(ca))
			buffer_write(str_buffer, buffer_text, "|")
	        ca = 0
	        cb = 0
	        for (b = 0; b < selection_h; b += 1) {
	            if (selection_exists[a, b]) {
					buffer_write(str_buffer, buffer_text, string(cb))
					buffer_write(str_buffer, buffer_text, "|")
	                cb = 0
					buffer_write(str_buffer, buffer_text, string(ds_list_find_index(instrument_list, selection_ins[a, b])))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(selection_key[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(selection_vel[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(selection_pan[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
					buffer_write(str_buffer, buffer_text, string(selection_pit[a, b]))
					buffer_write(str_buffer, buffer_text, "|")
	            }
	            cb += 1
	            if (b = selection_h - 1) {
					buffer_write(str_buffer, buffer_text, "-1|")
	            }
	        }
	    }
	    ca += 1
	}

	buffer_seek(str_buffer, buffer_seek_start, 0)
	selection_code = buffer_read(str_buffer, buffer_string)
	buffer_delete(str_buffer)
}
