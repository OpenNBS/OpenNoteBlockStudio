function TAG_String(argument0, argument1) {
	// TAG_String(name, value)
	var name, value;
	name = argument0
	value = argument1
	buffer_write_byte(8)
	buffer_write_string_short_be(name)
	buffer_write_string_short_be(value)



}
