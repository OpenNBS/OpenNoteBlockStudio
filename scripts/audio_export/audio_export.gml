function mp3_export() {
	// mp3_export()

	var fn, err, a, b;
	
	// Report missing instruments
	var missing_str = ""
	for (var i = 0; i < ds_list_size(instrument_list); i++) {
		var ins = instrument_list[| i]
		if (!ins.loaded && ins.filename != "" && ins.num_blocks > 0) {
			missing_str += ins.filename + "\n"
		}
	}
	if (missing_str != "") {
		if (!question("Some sounds could be not be loaded and will be missing from the exported track:\n\n" + missing_str + "\nWould you like to export anyway?", "Audio export")) {
			return 0
		}
	}
	
	var output_format = audio_exp_format
	var output_ext = "." + string_lower(output_format)
	
	fn = string(get_save_filename_ext(output_format + " files (*" + output_ext + ")|*" + output_ext, filename_new_ext(filename, "") + output_ext, filename_path(filename), condstr(language != 1, "Export audio track", "")))
	if (fn = "") return 0

	save_song(temp_file, true);
	
	var args = [temp_file, fn]
	var kwargs = {
		default_sound_path: sounds_directory,
		custom_sound_path: sounds_directory,
		ignore_missing_instruments: true,
		format: string_lower(output_format),
		sample_rate: audio_exp_sample_rate,
		channels: audio_exp_channels,
		exclude_locked_layers: !audio_exp_include_locked
	}
	
	try {
		var result = python_call_function("audio_export", "main", args, kwargs);
	} catch (e) {
		if (language != 1) show_message("An error occurred while exporting the song:\n\n" + e)
		else show_message("导出歌曲时发生错误：\n\n" + e)
		return -1;
	}

	if (language != 1) {if (question("Track saved! Do you want to open it?", "Audio Export")) open_url(fn)}
	else {if (question("MP3 已保存！现在打开吗？", "导出 MP3")) open_url(fn)}



}
