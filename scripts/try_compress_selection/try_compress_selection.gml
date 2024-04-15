function try_compress_selection(argument0){
	// Compress a selection code and return the base64 representation of the compressed data.
	// Return the original string if either the compression fails or
	// the compressed data is larger than the original string.

	var str = argument0

	var str_len = string_length(argument0)
	if (str_len < 16) {
		return str
	}
	var ret = str
	var str_buffer = string_buffer_create(argument0)
	var compress_buffer = buffer_compress(str_buffer, 0, str_len)
	if (compress_buffer != -1) {
		var base64_str = buffer_base64_encode(compress_buffer, 0, buffer_get_size(compress_buffer))
		if (string_length(base64_str) < str_len) {
			ret = base64_str
		}
	} else {
		show_debug_message("Cannot compress buffer")
	}
	if (compress_buffer != -1) {
		buffer_delete(compress_buffer)
	}
	buffer_delete(str_buffer)
	
	return ret
}