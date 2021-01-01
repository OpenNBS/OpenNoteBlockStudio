function TAG_List(argument0, argument1, argument2) {
	// TAG_List(name, length, type)
	var name, length, type;
	name = argument0
	length = argument1
	type = argument2
	buffer_write_byte(9)
	buffer_write_string_short_be(name)
	buffer_write_byte(type)
	buffer_write_int_be(length)



}
