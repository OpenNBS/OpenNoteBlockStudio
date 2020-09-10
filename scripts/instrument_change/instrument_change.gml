function instrument_change(ins) {
	var fn, newfn;
	fn = string(get_open_filename_ext("Supported sounds (*.ogg;*.wav;*.mp3)|*.ogg;*.wav;*.mp3", "", sounds_directory, "Load sound file"))
	if (file_exists_lib(fn)) {
	    var newfn = sounds_directory + filename_name(fn);
	    files_copy_lib(fn, newfn)
		if (string_copy(ins.name, 0, 19) == "Custom instrument #") {
			ins.name = filename_change_ext(filename_name(fn), "")
			text_exists[ds_list_find_index(instrument_list, ins) + 5] = 0
		}
	    changed = true
	    with (ins) {
	        filename = filename_name(newfn)
	        if (loaded)
	            instrument_free()
	        instrument_load()
	    }
	}
}