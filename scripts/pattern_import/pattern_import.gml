// selection_import()
// Can successfully read and store all the below into the arrays/variables, but can't seem to display or place the imported selection.
var str, a, b, fn, file_ext, nw, temp_colfirst, temp_enda, temp_endb, temp_collast, temp_exists, temp_ins, temp_key, temp_vel, temp_pan, temp_pit, temp_played, byte1, byte2;
fn = argument0
str = selection_code
if (fn = "") {
    if (!directory_exists_lib(songfolder)) songfolder = songs_directory
    fn = string(get_open_filename_ext("Note Block Pattern (*.nbp)|*.nbp", "", songfolder, "Load pattern"))
}
if (fn = "" || !file_exists_lib(fn)) return 0

file_ext = filename_ext(fn)
if (file_ext != ".nbp") {message("Error: This file is not a pattern.", "Error") return 0}
if (file_ext = ".nbp") {
	buffer = buffer_import(fn)
	
	song_pat_version = buffer_read_byte()
	show_debug_message("song_pat_version " + string(song_pat_version))
	enda = buffer_read_short()
	show_debug_message("enda " + string(enda))
	endb = buffer_read_short()
	show_debug_message("endb " + string(endb))
	selection_l = buffer_read_short()
	show_debug_message("selection_l " + string(selection_l))
	if song_pat_version < pat_version message("Warning: You are opening an older NBP file. Saving this file will make it incompatible with older Note Block Studio versions.","Warning")
	if song_pat_version > pat_version message("Warning: You are opening an NBP file created in a later version of Note Block Studio. It may crash when opening.","Warning")
/*
	if (enda > selection_arraylength) { // New length
	    for (a = selection_arraylength + 1; a <= enda; a += 1) {
	        selection_colfirst[a] = -1
	        selection_collast[a] = -1
	        for (b = 0; b <= selection_arrayheight; b += 1) {
	            selection_exists[a, b] = 0
	        }
	    }
	    selection_arraylength = enda
	}
	if (endb > selection_arrayheight) { // New height
	    for (a = 0; a <= selection_arraylength; a += 1) {
	        for (b = selection_arrayheight + 1; b <= endb; b += 1) {
	            selection_exists[a, b] = 0
	        }
	    }
	    selection_arrayheight = endb
	}
	*/
	
	for (a = 0; a < selection_l; a += 1) {
		temp_colfirst[a] = buffer_read_byte_signed()
	    selection_colfirst[a] = temp_colfirst[a]
		show_debug_message("selection_colfirst " + string(a) + " " + string(selection_colfirst[a]))
		temp_collast[a] = buffer_read_byte_signed()
	    selection_collast[a] = temp_collast[a]
		show_debug_message("selection_collast " + string(a) + " " + string(selection_collast[a]))
	    if (temp_colfirst[a] > -1) {
	        for (b = temp_colfirst[a] ;b <= temp_collast[a] ;b += 1) {
			temp_exists[a, b] = buffer_read_byte()
	            if (temp_exists[a, b]) {
	                selection_exists[a, b] = 1
					show_debug_message("selection_exists " + string(a) + " " + string(b) + " " + string(selection_exists[a, b]))
	                selection_ins[a, b] = buffer_read_byte() // Bug. It's a hack to place the 100002 back into ins.
					selection_ins[a, b] = buffer_read_byte()
					selection_ins[a, b] = 100002
					show_debug_message("selection_ins " + string(a) + " " + string(b) + " " + string(selection_ins[a, b]))
	                selection_key[a, b] = buffer_read_byte()
					show_debug_message("selection_key " + string(a) + " " + string(b) + " " + string(selection_key[a, b]))
	                selection_vel[a, b] = buffer_read_byte()
					show_debug_message("selection_vel " + string(a) + " " + string(b) + " " + string(selection_vel[a, b]))
	                selection_pan[a, b] = buffer_read_byte()
					show_debug_message("selection_pan " + string(a) + " " + string(b) + " " + string(selection_pan[a, b]))
	                selection_pit[a, b] = buffer_read_byte()
					show_debug_message("selection_pit " + string(a) + " " + string(b) + " " + string(selection_pit[a, b]))
	                selection_played[a, b] = buffer_read_byte()
					show_debug_message("selection_played " + string(a) + " " + string(b) + " " + string(selection_played[a, b]))
	            }
	        }
	    }
	}
	selection_code_update()
	selection_place(0)
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
}