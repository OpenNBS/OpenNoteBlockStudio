function array_to_selection(argument0, argument1) {
	// array_to_selection(data, total_vals)
	var array = argument0
	var total_vals = argument1

	var str_buffer = buffer_create(16, buffer_grow, 1);
	for (var i = 0; i < total_vals; i++;) {
		buffer_write(str_buffer, buffer_text, string(array[i]))
		buffer_write(str_buffer, buffer_text, "|")
	}

	buffer_seek(str_buffer, buffer_seek_start, 0)
	var str = buffer_read(str_buffer, buffer_string)
	buffer_delete(str_buffer)
	
	return str
}
