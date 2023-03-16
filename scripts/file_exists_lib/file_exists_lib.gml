function file_exists_lib(argument0) {
	// file_exists_lib(file)

	if (argument0 = "")
	    return 0

	return external_call(lib_file_exists, argument0)
	//return file_exists(argument0)



}
