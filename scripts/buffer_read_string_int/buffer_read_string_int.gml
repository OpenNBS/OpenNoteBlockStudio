function buffer_read_string_int() {
	// buffer_read_string_int()
	// Reads a string consisting of an int, then that many utf - 8 characters.

	var str = "";
	var len = buffer_read_int();
	var char = ""
	repeat (len) {
		char = buffer_read_byte()
		if (char < 128) {
			str += chr(char)
		} else if (char < 224) {
			str += chr((char - 192) * 64 + (buffer_read_byte() - 128))
		} else if (char < 240) {
			str += chr((char - 224) * 4096 + (buffer_read_byte() - 128) * 64 + (buffer_read_byte() - 128))
		} else {
			str += chr((char - 240) * 262144 + (buffer_read_byte() - 128) * 4096 + (buffer_read_byte() - 128) * 64 + (buffer_read_byte() - 128))
		}
	}
	return str



}
