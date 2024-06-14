function save_song_zip() {
	var fn, tempdir, ins, src, dst, count;
	
	if (language != 1) fn = string(get_save_filename_ext("ZIP archive (*.zip)|*.zip", condstr(filename == "", "", filename_change_ext(filename, ".zip")), "", "Save song with custom sounds"));
	else fn = string(get_save_filename_ext("ZIP archive (*.zip)|*.zip", condstr(filename == "", "", filename_change_ext(filename, ".zip")), "", "TRANSLATE"));
	if (fn = "") return 0;
	
	tempdir = data_directory + "Temp\\";
	if (directory_exists_lib(tempdir)) {
		directory_delete_lib(tempdir);
	}
	directory_create_lib(tempdir);
	
	// Save instruments
	count = 0;
	for (var i = first_custom_index; i <= ds_list_size(instrument_list) - 1; i++) {
		show_debug_message(string(i) + " " + string(ds_list_size(instrument_list)));
		ins = ds_list_find_value(instrument_list, i);
		if (ins.filename != "") {
			src = sounds_directory + ins.filename;
			dst = tempdir + "sounds\\" + ins.filename;
			if (!file_exists_lib(src)) {
				continue;
			}
			show_debug_message(filename_dir(dst));
			if (!directory_exists_lib(filename_dir(dst))) {
				directory_create_lib(filename_dir(dst));
			}
			files_copy_lib(src, dst);
			count++;
		}
	}
	
	// Save song
	save_song(tempdir + "song.nbs", true);
	
	ExecuteShell("7za a -tzip \"" + fn + "\" \"" + data_directory + "Temp\\*\"", true, true);
	
	if (!file_exists_lib(fn)) {
		if (language != 1) message("The song could not be saved!", "Error");
		else message("TRANSLATE");
	} else {
		if (language != 1) set_msg("Song saved");
		else set_msg("歌曲已保存");
	}

	directory_delete_lib(tempdir);
	
	// if (language != 1) message(string(count) + " instrument" + condstr(count > 1, "s were", " was") + " saved!", "Pack instruments");
	// else message(string(count) + "个音色已保存！", "导出音色");
}