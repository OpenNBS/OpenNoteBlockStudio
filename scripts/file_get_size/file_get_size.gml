function file_get_size(argument0) {
	// file_get_size(path)
	// Returns the size of a file, in bytes.

	var path, file, size
	path = argument0
	if (file_exists(path)) {
		file = file_bin_open(path, 0)
		size = file_bin_size(file)
		file_bin_close(file)
		return size
	}
	return 0



}
