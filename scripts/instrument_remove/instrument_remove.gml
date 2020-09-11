function instrument_remove(ins) {
	for (a = 0; a <= enda; a += 1) {
		if (colamount[a] > 0) {
			for (b = colfirst[a]; b <= collast[a]; b += 1) {
			    if (song_exists[a, b] && song_ins[a, b] = ins) {
					remove_block(a, b)
				}
			}
		}
	}
	
	with (ins) {
		instrument_free()
		ds_list_delete_value(other.instrument_list, ins)
		instance_destroy()
	}
	
	// Reset text boxes to update the instrument name
	for (var i = ds_list_find_index(instrument_list, ins); i <= ds_list_size(instrument_list); i++) {
		text_exists[5 + i] = -1
	}
	
	user_instruments--
	changed = 1
}