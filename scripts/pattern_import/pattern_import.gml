function pattern_import() {
	// selection_import()
	// Can successfully read and store all the below into the arrays/variables, but can't seem to display or place the imported selection.
	var a, b, fn, file_ext, nw, temp_colfirst, temp_enda, temp_endb, temp_collast, temp_exists, temp_ins, temp_key, temp_vel, temp_pan, temp_pit, temp_played, byte1, byte2, temp_str, selection_l_temp;
	fn = ""
	if (selected != 0) return 0
	if (fn = "") {
	    if (!directory_exists_lib(patternfolder)) patternfolder = pattern_directory
	    fn = string(get_open_filename_ext("Note Block Pattern (*.nbp)|*.nbp", "", patternfolder, "Load pattern"))
	}
	if (fn = "" || !file_exists_lib(fn)) return 0

	file_ext = filename_ext(fn)
	if (file_ext != ".nbp") {message("Error: This file is not a pattern.", "Error") return 0}
	if (file_ext = ".nbp") {
		buffer = buffer_import(fn)
	
		song_pat_version = buffer_read_byte()
	//	show_debug_message("song_pat_version " + string(song_pat_version))
		var pat_length = buffer_read_short()
	//	show_debug_message("enda " + string(pat_length))
		var pat_height = buffer_read_short()
	//	show_debug_message("endb " + string(pat_height))
		selection_l_temp = selection_l
		selection_l = buffer_read_short()
	//	show_debug_message("selection_l " + string(selection_l))
		if (song_pat_version < pat_version && show_oldwarning) message("Warning: You are opening an older NBP file. Saving this file will make it incompatible with older Note Block Studio versions.","Warning")
		if song_pat_version > pat_version message("Warning: You are opening an NBP file created in a later version of Note Block Studio. It may crash when opening.","Warning")
		temp_str = buffer_read_string()
		if check_custom_instrument(temp_str) = 0 {
		//	show_debug_message("selection_code " + string(selection_copied))
			selection_copied = temp_str
			if (pat_length > selection_arraylength) { // New length
			    for (a = selection_arraylength + 1; a <= pat_length; a += 1) {
			        selection_colfirst[a] = -1
			        selection_collast[a] = -1
			        for (b = 0; b <= selection_arrayheight; b += 1) {
			            selection_exists[a, b] = 0
			        }
			    }
			    selection_arraylength = pat_length
			}
	
			if (pat_height > selection_arrayheight) { // New height
			    for (a = 0; a <= selection_arraylength; a += 1) {
			        for (b = selection_arrayheight + 1; b <= pat_height; b += 1) {
			            selection_exists[a, b] = 0
			        }
			    }
			    selection_arrayheight = pat_height
			}
	
			for (a = 0; a < selection_l; a += 1) {
				temp_colfirst[a] = buffer_read_byte_signed()
			    selection_colfirst[a] = temp_colfirst[a]
		//		show_debug_message("selection_colfirst " + string(a) + " " + string(selection_colfirst[a]))
				temp_collast[a] = buffer_read_byte_signed()
			    selection_collast[a] = temp_collast[a]
		//		show_debug_message("selection_collast " + string(a) + " " + string(selection_collast[a]))
			}
			selection_load(0,0, selection_copied, false)
		} else {
			selection_l = selection_l_temp
			message("There are more custom instruments in the pattern than what is loaded in the song!", "Error")
			return -1
		}
	}


}
