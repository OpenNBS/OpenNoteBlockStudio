// buffer_read_string_byte(length)
// Reads x amount of bytes and converts to string.

var str = "";
repeat (argument0)
    str += chr(buffer_read_byte())
return str
