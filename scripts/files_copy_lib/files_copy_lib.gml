function files_copy_lib(argument0, argument1) {
	// file_copy_lib(source, dest)

	if (argument0 = argument1)
	    return 0

	return external_call(lib_file_copy, argument0, argument1)


}
