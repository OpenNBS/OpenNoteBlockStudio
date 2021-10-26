function load_text(argument0) {
	// load_text(filename)
	// Loads a text file into a string.

	if (file_exists(argument0)) {

	    var file, str

	    file = file_text_open_read(argument0)
	    str = ""

	    while (!file_text_eof(file)) {
	        str += file_text_readln(file)
	    }

	    file_text_close(file)
	
		return str

	} else {
	
		return 0

	}


}
