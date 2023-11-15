/// @description  control_end()
/// @function  control_end
function control_end() {
	
	if (!destroy_self) {
		if (!isplayer) backup_clear()
		for (var i = array_length(songs) - 1; i >= 0; i--) {
			set_song(i)
			if (os_type != os_macosx) confirm(1)
			else save_unsaved()
			close_song(i, 1, 1)
		}
	
		save_settings()
	}

}
