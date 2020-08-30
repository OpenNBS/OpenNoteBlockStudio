function dat_writefile(argument0, argument1) {
	// dat_writefile(str, path)
	// writes file to path

	var str, path, file

	str = argument0
	path = argument1

	file = buffer_create(string_length(str), buffer_fixed, 1)
	buffer_write(file, buffer_text, str)
	buffer_export(file, path)
	buffer_delete(file)


}
