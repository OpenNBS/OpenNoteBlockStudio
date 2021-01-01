function buffer_export(argument0, argument1) {
	// buffer_export(buffer, fn)

	files_delete_lib(temp_file)
	buffer_save(argument0, temp_file)
	files_copy_lib(temp_file, argument1)



}
