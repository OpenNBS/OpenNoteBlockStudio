function close_song(){
	var sid = argument[0]
	var nonew = 0
	var noconfirm = 0
	if (argument_count > 1) {
		nonew = argument[1]
	}
	if (argument_count > 2) {
		noconfirm = argument[2]
	}
	if (!nonew) {
		song = sid
		if (confirm() < 0 && !noconfirm) return 0
	}
	for (var i = 0; i < ds_list_size(songs[sid].instrument_list); i++)
	with (songs[sid].instrument_list[| i]) {instrument_free(); instance_destroy()}
	instance_destroy(songs[sid])
	array_delete(songs, sid, 1)
	if (song >= sid) song--
	if (array_length(songs) = 0 && (!nonew || noconfirm)) {
		new_song()
	}
}