function instrument_swap(ins1, ins2) {
	var a, b, ins, index1, index2;
	
	index1 = ds_list_find_index(instrument_list, ins1)
	index2 = ds_list_find_index(instrument_list, ins2)
	
	ds_list_replace(instrument_list, index1, ins2)
	ds_list_replace(instrument_list, index2, ins1)
	
	text_str[5 + index1] = ins2.name
	text_str[5 + index2] = ins1.name
	text_exists[5 + index1] = 0
	text_exists[5 + index2] = 0
	
	for (a = 0; a <= enda; a += 1) {
		if (colamount[a] > 0) {
			for (b = colfirst[a]; b <= collast[a]; b += 1) {
			    if (song_exists[a, b]) {
					ins = ds_list_find_index(instrument_list, song_ins[a, b])
					if (ins == index1) {
						song_ins[a, b] = ins2
					}
					else if (ins == index2) {
						song_ins[a, b] = ins1
					}
				}
			}
		}
	}
	
	changed = 1
}