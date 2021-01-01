function buffer_write_string_short_be(argument0) {
	// buffer_write_string_short_be(string)
	// Writes a string to the buffer.

	var str, len;
	str = argument0

	len = string_length(str)
	buffer_write_short_be(len)
	for (var p = 0; p < len; p++)
	    buffer_write_byte(ord(string_char_at(str, p + 1)))



}
