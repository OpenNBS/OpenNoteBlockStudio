function load_followalong_song() {
	// load_song(fn [, backup])
	var fn, file_ext, f, str
	fn = argument[0]
	if (fn = "") {
	    fn = string(get_open_filename_ext("Mp3 Files (*.mp3)|*.mp3|Wav Files (*.wav)|*.wav|Ogg Files (*.ogg)|*.ogg", "", songfolder, condstr(language != 1, "Load song", "打开歌曲")))
	}
	if (fn = "" || !file_exists_lib(fn)) return 0

	file_ext = filename_ext(fn)
	if (file_ext = ".mp3" || file_ext = ".wav" || file_ext = ".ogg") {
		var ret = audio_file_decode(fn, temp_file);
		if (ret < 0) {
		    if (language != 1) message("Couldn't load the file " + fn + "! Error: " + string(ret), "Error")
		    else message("找不到文件" + fn + "！错误代码：" + string(ret), "错误")
		    return 0
		}

		log("buffer_load")
		sound_buffer_temp = buffer_load(temp_file)
		sound_buffer = buffer_create(buffer_get_size(sound_buffer_temp), buffer_fixed, 2)
		buffer_copy(sound_buffer_temp, 0, buffer_get_size(sound_buffer_temp), sound_buffer, 0)
		global.followalongSound = audio_create_buffer_sound(sound_buffer, buffer_s16, 44100, 0, buffer_get_size(sound_buffer), audio_stereo)
		buffer_delete(sound_buffer_temp)
		//audio_play_sound(followalongSound, 1, false);
	
	
	//	file = file_bin_open(fn,0);
	//    size = file_bin_size(file);
	//	audio_buff = buffer_create(size, buffer_u8, 1);

	//    for(var i = 0; i < size; i++;)
	//    {
	//        buffer_write(audio_buff, buffer_u8, file_bin_read_byte(file));
	//    }
	//    file_bin_close(file);

	//    audio = audio_create_buffer_sound(audio_buff, buffer_u8, 44100, 0, size, audio_mono);
	//    audio_play_sound(audio, 1, true);
		
		
		
		
		//file = file_bin_open(fn,0);
	    //var size = file_bin_size(file);
	    //var gameTransfer = buffer_create(1024, buffer_u8, 1);
	    //for(var i=0;i<size;i+=1;){
	    //    buffer_write(gameTransfer,buffer_u8,file_bin_read_byte(file));
	    //}
	    //result = audio_create_buffer_sound(gameTransfer,buffer_u8,44100,0,size,audio_stereo);
		//show_debug_message(size);
		//audio_play_sound(result, 10, false);
		
	    //file_bin_close(file)
	    return 1
	}
	return 0
}
