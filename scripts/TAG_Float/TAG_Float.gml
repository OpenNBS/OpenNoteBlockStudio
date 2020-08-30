function TAG_Float(argument0, argument1) {
	// TAG_Float(name, value)
	var name, value, a;
	name = argument0
	value = argument1
	buffer_write_byte(5)
	buffer_write_string_short_be(name)
	buffer_write_float_be(value)



}
