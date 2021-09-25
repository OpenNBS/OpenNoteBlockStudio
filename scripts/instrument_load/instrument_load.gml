function instrument_load() {
	// instrument_load()

	var fn = sounds_directory + filename;
	fn = string_replace_all(fn, "/", "\\");

	log("Load instrument", fn)

	if (filename = "" || !file_exists_lib(fn))
	    return false

	log("audio_file_decode")
	var ret = audio_file_decode(fn, temp_file);
	if (ret < 0) {
	    if (language != 1) message("Couldn't load the file " + fn + "! Error: " + string(ret), "Error")
	    else message("找不到文件" + fn + "！错误代码：" + string(ret), "错误")
	    return 0
	}

	log("buffer_load")
	sound_buffer = buffer_load(temp_file)
	sound = audio_create_buffer_sound(sound_buffer, buffer_s16, 44100, 0, buffer_get_size(sound_buffer), audio_stereo)

	loaded = true

	return true



}
