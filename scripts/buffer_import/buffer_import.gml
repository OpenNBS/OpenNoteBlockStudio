function buffer_import(argument0) {
	// buffer_import(fn)

	files_delete_lib(temp_file)
	files_copy_lib(argument0, temp_file)
	return buffer_load(temp_file)



}
