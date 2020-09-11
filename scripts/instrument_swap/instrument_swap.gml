function instrument_swap(ins1, ins2) {
	var index1, index2;
	index1 = ds_list_find_index(instrument_list, ins1)
	index2 = ds_list_find_index(instrument_list, ins2)

	ds_list_replace(instrument_list, index1, ins2)
	ds_list_replace(instrument_list, index2, ins1)

	text_str[5 + index1] = ins2.name
	text_str[5 + index2] = ins1.name
	text_exists[5 + index1] = 0
	text_exists[5 + index2] = 0
	
	changed = 1
}