function buffer_write_string_int(argument0) {
	// buffer_write_string_int(string)
	// Writes a string to the buffer.

	var str, len, char;
	str = argument0

	len = string_length(str)
	buffer_write_int(len)
	for (var p = 0; p < len; p++) {
		char = ord(string_char_at(str, p + 1))
		if (char < 128 || save_version < 6) {
			buffer_write_byte(char)
		} else if (char < 2048) {
			buffer_write_byte(floor(char / 64) + 192)
			buffer_write_byte(char - floor(char / 64) * 64 + 128)
		} else if (char < 65536) {
			buffer_write_byte(floor(char / 4096) + 224)
			buffer_write_byte(floor(char / 64) - floor(char / 4096) * 64 + 128)
			buffer_write_byte(char - floor(char / 64) * 64 - floor(char / 4096) * 4096 + 128)
		} else if (char < 2097152) {
			buffer_write_byte(floor(char / 262144) + 240)
			buffer_write_byte(floor(char / 4096) - floor(char / 262144) * 4096 + 128)
			buffer_write_byte(floor(char / 64) - floor(char / 4096) * 64 - floor(char / 262144) * 4096 + 128)
			buffer_write_byte(char - floor(char / 64) * 64 - floor(char / 4096) * 4096 - floor(char / 262144) * 262144 + 128)
		}
	}


}
