function buffer_pos_char(argument0, argument1, argument2){
	// Find the position of a character in a text buffer, optionally from a start position.
	// Return the buffer length if not found.
	
	var buffer = argument0
	var buffer_size = argument1
	var char = argument2
	if (is_string(char)) {
		char = ord(char)
	}
	var pos = 0
	if (argument_count == 4) {
		pos = argument[3]
	}
	
	while (pos < buffer_size && buffer_peek(buffer, pos, buffer_u8) != char) {
		pos++
	}
	return pos
}