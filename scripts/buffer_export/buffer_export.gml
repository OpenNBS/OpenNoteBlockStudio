function buffer_export(argument0, argument1) {
	// buffer_export(buffer, fn)

	file_delete(temp_file)
	buffer_save(argument0, temp_file)
	file_copy(temp_file, argument1)



}
