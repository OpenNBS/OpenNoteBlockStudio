function buffer_read_string_int() {
	// buffer_read_string_int()
	// Reads a string consisting of an int, then that many utf - 8 characters.

	var str = "";
	var len = buffer_read_int();
	repeat (len)
	    str += chr(buffer_read_byte())
	return str



}
