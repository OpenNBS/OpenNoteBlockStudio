function buffer_export(argument0, argument1) {
	// buffer_export(buffer, fn)

	files_delete(temp_file)
	buffer_save(argument0, temp_file)
	files_copy(temp_file, argument1)



}
