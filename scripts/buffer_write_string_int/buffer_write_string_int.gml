function buffer_write_string_int(argument0) {
	// buffer_write_string_int(string)
	// Writes a string to the buffer.
	// NOTE: Multi-byte characters aren't saved properly! This is only kept for backwards compatibility.

	var str, len;
	str = argument0

	len = string_length(str)
	buffer_write_int(len)
	for (var p = 0; p < len; p++)
	    buffer_write_byte(ord(string_char_at(str, p + 1)))
}