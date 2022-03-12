function toggle_followalong(){
	if(!variable_global_exists("followalongPaused")) global.followalongPaused = 0
	
	if(variable_global_exists("followalongSound")){
		if(global.followalongPaused=0){
			var start = argument[0]
			var starttime = argument[1]
			if(!variable_global_exists("followalongPlayingSound")) global.followalongPlayingSound = undefined
			if(!is_undefined(global.followalongPlayingSound)){
				audio_stop_sound(global.followalongPlayingSound);
				global.followalongPlayingSound = undefined;
			}
			if(start = 1){
				global.followalongPlayingSound = audio_play_sound(global.followalongSound,10,false)
				audio_sound_set_track_position(global.followalongPlayingSound, starttime);
			}
		}
	}
}