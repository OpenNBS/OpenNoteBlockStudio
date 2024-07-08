function selection_load(argument0, argument1, argument2, argument3) {
	// selection_load(x, y, code, undo)
	// Loads the selection from the string.
	var xx, yy, str, ca, cb, val, h;
	xx = argument0
	yy = argument1
	str = try_decompress_selection(argument2)
	selection_place(argument3)
	if (str = "") return 0
	ca = 0
	h = 0
	
	var str_len = string_length(str)
	var str_buffer = string_buffer_create(str)
	var val_buffer = buffer_create(1, buffer_grow, 1)
	
	var pipe_pos = buffer_pos_char(str_buffer, str_len, "|")
	var prev_pipe_pos = -1
	do {
		val = real(buffer_substr_copy(str_buffer, prev_pipe_pos + 1, pipe_pos - prev_pipe_pos - 1, val_buffer))
		prev_pipe_pos = pipe_pos
	    ca += val
	    cb = 0
	    while (1) {
	        pipe_pos = buffer_pos_char(str_buffer, str_len, "|", pipe_pos + 1)
			val = real(buffer_substr_copy(str_buffer, prev_pipe_pos + 1, pipe_pos - prev_pipe_pos - 1, val_buffer))
			prev_pipe_pos = pipe_pos
	        if (val == -1) break
	        cb += val
	        selection_exists[ca, cb] = 1
	        pipe_pos = buffer_pos_char(str_buffer, str_len, "|", pipe_pos + 1)
			val = real(buffer_substr_copy(str_buffer, prev_pipe_pos + 1, pipe_pos - prev_pipe_pos - 1, val_buffer))
			prev_pipe_pos = pipe_pos
	        selection_ins[ca, cb] = instrument_list[| val]
	        pipe_pos = buffer_pos_char(str_buffer, str_len, "|", pipe_pos + 1)
			val = real(buffer_substr_copy(str_buffer, prev_pipe_pos + 1, pipe_pos - prev_pipe_pos - 1, val_buffer))
			prev_pipe_pos = pipe_pos
	        selection_key[ca, cb] = val
	        pipe_pos = buffer_pos_char(str_buffer, str_len, "|", pipe_pos + 1)
			val = real(buffer_substr_copy(str_buffer, prev_pipe_pos + 1, pipe_pos - prev_pipe_pos - 1, val_buffer))
			prev_pipe_pos = pipe_pos
			selection_vel[ca, cb] = val
	        pipe_pos = buffer_pos_char(str_buffer, str_len, "|", pipe_pos + 1)
			val = real(buffer_substr_copy(str_buffer, prev_pipe_pos + 1, pipe_pos - prev_pipe_pos - 1, val_buffer))
			prev_pipe_pos = pipe_pos
			selection_pan[ca, cb] = val
	        pipe_pos = buffer_pos_char(str_buffer, str_len, "|", pipe_pos + 1)
			val = real(buffer_substr_copy(str_buffer, prev_pipe_pos + 1, pipe_pos - prev_pipe_pos - 1, val_buffer))
			prev_pipe_pos = pipe_pos
			selection_pit[ca, cb] = val
	        selected += 1
	        if (selection_colfirst[ca] = -1) selection_colfirst[ca] = cb
	        selection_collast[ca] = cb
	        h = max(h, cb)
	    }
		pipe_pos = buffer_pos_char(str_buffer, str_len, "|", pipe_pos + 1)
	} until (pipe_pos >= str_len)
	buffer_delete(str_buffer)
	buffer_delete(val_buffer)
	
	selection_x = xx
	selection_y = yy
	selection_l = ca + 1
	selection_h = h + 1
	selection_code_update()
}
