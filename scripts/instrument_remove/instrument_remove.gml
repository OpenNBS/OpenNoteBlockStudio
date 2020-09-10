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
	changed = 1
	with (ins) {
		instrument_free()
		ds_list_delete_value(other.instrument_list, ins)
		instance_destroy()
	}
	insselect = min(ds_list_size(instrument_list) - 1, insselect)
	if (instrument = ins)
		instrument = instrument_list[| 0]
	user_instruments--
}