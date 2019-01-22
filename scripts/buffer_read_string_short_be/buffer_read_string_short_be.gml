// buffer_read_string_short_be()
// Reads a string consisting of a big endian short, then that many utf - 8 characters.

var str = "";
repeat (buffer_read_short_be())
    str += chr(buffer_read_byte())
return str
