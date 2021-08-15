// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pack_instruments() {
	var fn, tempdir, ins, src, dst, count;
	show_debug_message(song_name)
	fn = string(get_save_filename_ext("ZIP archive (*.zip)|*.zip", condstr(filename == "", "", filename_change_ext(filename, "") + " - ") + "Instruments.zip", "", "Pack instruments to ZIP file"));
	fn = fn + condstr(filename_ext(fn) != ".zip", ".zip")
	if (fn = "") return 0;
	
	tempdir = data_directory + "Temp\\";
	if (directory_exists_lib(tempdir)) {
		directory_delete_lib(tempdir);
	}
	directory_create_lib(tempdir);
	
	count = 0;
	for (var i = first_custom_index; i <= ds_list_size(instrument_list) - 1; i++) {
		show_debug_message(string(i) + " " + string(ds_list_size(instrument_list)))
		ins = ds_list_find_value(instrument_list, i);
		if (ins.filename != "") {
			src = sounds_directory + ins.filename;
			dst = tempdir + ins.filename;
			if (!file_exists_lib(src)) {
				continue;
			}
			show_debug_message(filename_dir(dst))
			if (!directory_exists_lib(filename_dir(dst))) {
				directory_create_lib(filename_dir(dst))
			}
			files_copy_lib(src, dst);
			count++;
		}
	}
	
	ExecuteShell("7za a -tzip \"" + fn + "\" \"" + data_directory + "Temp\\*\"", true, true)
	directory_delete_lib(tempdir);
	message(string(count) + " instrument" + condstr(count > 1, "s were", " was") + " saved!", "Pack instruments");
	
}