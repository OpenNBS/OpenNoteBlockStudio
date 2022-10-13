function macro_vibrato() {
	// macro_vibrato()
	var str, total_vals, val, decr
	str = songs[song].selection_code
	if (songs[song].selected = 0) return 0
	arr_data = selection_to_array(str)
	total_vals = string_count("|", str)
	val = 0
	decr = 100/string_count("-1", str)
	//for (var i = 0; i < total_vals; i++;) {show_debug_message(arr_data[i])}
	while (val < total_vals) {
		// First column 100
		val += 6
		arr_data[val] = 40
		val ++
		while arr_data[val] != -1 {
			val = val + 5
			arr_data[val] = 40
			val ++
		}
		// Second column 50
		val += 7
		if val >= total_vals break
		arr_data[val] = 0
		val ++
		while arr_data[val] != -1 {
			val = val + 5
			arr_data[val] = 0
			val ++
		}
		// Third column 25
		val += 7
		if val >= total_vals break
		arr_data[val] = -40
		val ++
		while arr_data[val] != -1 {
			val = val + 5
			arr_data[val] = -40
			val ++
		}
		val += 7
		if val >= total_vals break
		arr_data[val] = 0
		val ++
		while arr_data[val] != -1 {
			val = val + 5
			arr_data[val] = 0
			val ++
		}
		val ++
	}
	str = array_to_selection(arr_data, total_vals)
	selection_load(songs[song].selection_x,songs[song].selection_y,str,true)
	if(!keyboard_check(vk_alt)) selection_place(false)



}
