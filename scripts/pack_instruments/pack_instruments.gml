// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pack_instruments() {
	var fn, tempdir, ins, src, dst, count;
	show_debug_message(song_name)
	if (language != 1) fn = string(get_save_filename_ext("ZIP archive (*.zip)|*.zip", condstr(filename == "", "", filename_change_ext(filename, "") + " - ") + "Instruments.zip", "", "Pack instruments to ZIP file"));
	else fn = string(get_save_filename_ext("ZIP archive (*.zip)|*.zip", condstr(filename == "", "", filename_change_ext(filename, "") + " - ") + "Instruments.zip", "", "导出音色至ZIP文件"));
	if (fn = "") return 0;
	
	tempdir = data_directory + "Temp\\";
	if (directory_exists(tempdir)) {
		directory_destroy(tempdir);
	}
	directory_create(tempdir);
	
	count = 0;
	for (var i = first_custom_index; i <= ds_list_size(instrument_list) - 1; i++) {
		show_debug_message(string(i) + " " + string(ds_list_size(instrument_list)))
		ins = ds_list_find_value(instrument_list, i);
		if (ins.filename != "") {
			src = sounds_directory + ins.filename;
			dst = tempdir + ins.filename;
			if (!file_exists(src)) {
				continue;
			}
			show_debug_message(filename_dir(dst))
			if (!directory_exists(filename_dir(dst))) {
				directory_create(filename_dir(dst))
			}
			file_copy(src, dst);
			count++;
		}
	}
	
	if (os_type = os_windows) ExecuteShell("7za a -tzip \"" + fn + "\" \"" + data_directory + "Temp\\*\"", true, true)
	directory_destroy(tempdir);
	if (language != 1) message(string(count) + " instrument" + condstr(count > 1, "s were", " was") + " saved!", "Pack instruments");
	else message(string(count) + "个音色已保存！", "导出音色");
	
}