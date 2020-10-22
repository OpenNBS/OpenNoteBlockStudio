function instrument_change(ins) {
	var fn, newfn;
	fn = string(get_open_filename_ext("Supported sounds (*.ogg;*.wav;*.mp3)|*.ogg;*.wav;*.mp3", "", sounds_directory, "Load sound file"))
	if (file_exists_lib(fn)) {
		if (string_count(sounds_directory, fn) > 0) {
			// Sound is already in the Sounds folder or in a subfolder
			newfn = fn;
		} else {
			// Sound is elsewhere, copy to root of Sounds folder
			newfn = sounds_directory + filename_name(fn);
			files_copy_lib(fn, newfn)
		}
		if (string_copy(ins.name, 0, 19) == "Custom instrument #") {
			ins.name = filename_change_ext(filename_name(newfn), "")
			text_exists[ds_list_find_index(instrument_list, ins) + 5] = 0
		}
	    changed = true
	    with (ins) {
	        filename = string_delete(newfn, 1, string_length(sounds_directory))
			filename = string_replace_all(filename, "\\", "/")
	        if (loaded)
	            instrument_free()
	        instrument_load()
	    }
	}
}