function TAG_Int(argument0, argument1) {
	// TAG_Int(name, value)
	var name, value;
	name = argument0
	value = argument1
	buffer_write_byte(3)
	buffer_write_string_short_be(name)
	buffer_write_int_be(value)



}
