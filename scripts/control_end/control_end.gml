/// @description  control_end()
/// @function  control_end
function control_end() {

	for (var i = array_length(songs) - 1; i >= 0; i--) {
		set_song(i)
		confirm(1)
		close_song(i, 1, 1)
	}
	
	save_settings()
	backup_clear()


}
