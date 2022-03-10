function load_followalong_song() {
	// load_song(fn [, backup])
	var fn, file_ext, f, str
	fn = argument[0]
	if (confirm() < 0) return 0
	if (fn = "") {
	    fn = string(get_open_filename_ext("Mp3 Files (*.mp3)|*.mp3|Wav Files (*.wav)|*.wav|Ogg Files (*.ogg)|*.ogg|Mp4 Files (*.mp4)|*.mp4", "", songfolder, condstr(language != 1, "Load song", "打开歌曲")))
	}
	if (fn = "" || !file_exists_lib(fn)) return 0


	reset()
	file_ext = filename_ext(fn)
	if (file_ext = ".mp3" || file_ext = ".wav" || file_ext = ".ogg") {
		file = file_bin_open(fn,0);
	    size = file_bin_size(file);

	    for(var i = 0; i < size; i++;)
	    {
	        buffer_write(audio_buff, buffer_u8, file_bin_read_byte(file));
	    }
	    file_bin_close(file);

	    audio = audio_create_buffer_sound(audio_buff, buffer_s16, 48000, 0, size, audio_stereo);
	    audio_play_sound(audio, 1, true);
		
		
		
		
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
	if (file_ext = ".mp4") {
		//mp4 things
	    return 1
	}
	if (file_ext = ".wav") {
		//wav things
	    return 1
	}


}
