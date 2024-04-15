function buffer_substr_copy(argument0, argument1, argument2, argument3){
	// Copy a sub-string from a buffer to a text buffer and return the extracted string
	
	var buffer = argument0
	var pos = argument1
	var size = argument2
	var text_buffer = argument3
	
	buffer_resize(text_buffer, size)
	buffer_copy(buffer, pos, size, text_buffer, 0)
	var str = buffer_read(text_buffer, buffer_string)
	buffer_seek(text_buffer, buffer_seek_start, 0)
	return str
}