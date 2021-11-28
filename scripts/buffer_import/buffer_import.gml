function buffer_import(argument0) {
	// buffer_import(fn)

	files_delete(temp_file)
	files_copy(argument0, temp_file)
	return buffer_load(temp_file)



}
