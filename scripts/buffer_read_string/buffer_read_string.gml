// buffer_read_string(length)

var str = "";
repeat (argument0)
    str += chr(buffer_read_byte())
return str
