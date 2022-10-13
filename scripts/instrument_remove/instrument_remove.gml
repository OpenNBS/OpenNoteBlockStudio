function instrument_remove(ins) {
	for (a = 0; a <= songs[song].enda; a += 1) {
		if (songs[song].colamount[a] > 0) {
			for (b = songs[song].colfirst[a]; b <= songs[song].collast[a]; b += 1) {
			    if (songs[song].song_exists[a, b] && songs[song].song_ins[a, b] = ins) {
					remove_block(a, b)
				}
			}
		}
	}
	
	with (ins) {
		instrument_free()
		ds_list_delete_value(other.songs[other.song].instrument_list, ins)
		instance_destroy()
	}
	
	// Reset text boxes to update the instrument name
	for (var i = ds_list_find_index(songs[song].instrument_list, ins); i <= ds_list_size(songs[song].instrument_list); i++) {
		text_exists[70 + i] = -1
	}
	
	songs[song].user_instruments--
	songs[song].changed = 1
}