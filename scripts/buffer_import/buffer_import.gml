function buffer_import(argument0) {
	// buffer_import(fn)

	file_delete(temp_file)
	file_copy(argument0, temp_file)
	return buffer_load(temp_file)



}
