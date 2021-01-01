function TAG_Short(argument0, argument1) {
	// TAG_Short(name, value)
	var name, value;
	name = argument0
	value = argument1
	buffer_write_byte(2)
	buffer_write_string_short_be(name)
	buffer_write_short_be(value)



}
