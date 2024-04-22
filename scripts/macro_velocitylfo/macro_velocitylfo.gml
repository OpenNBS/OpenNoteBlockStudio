function macro_velocitylfo() {
	// macro_velocitylfo()
	var str, total_vals, val, decr
	str = selection_code
	if (selected = 0) return 0
	var arr_data = selection_to_array_ext()
	total_vals = array_length(arr_data)
	val = 0
	decr = 100/macro_column_count(arr_data)
	//for (var i = 0; i < total_vals; i++;) {show_debug_message(arr_data[i])}
	while (val < total_vals) {
		// First column 100
		val += 4
		arr_data[val] = 100
		val ++
		if arr_data[val] = 0 {
			arr_data[val] = 100 // Center Panning if Stereoized
		}
		val += 2
		while arr_data[val] != -1 {
			val = val + 3
			arr_data[val] = 100
			val ++
			if arr_data[val] = 0 {
				arr_data[val] = 100 // Center Panning if Stereoized
			}
			val += 2
		}
		// Second column 50
		val += 5
		if val >= total_vals break
		arr_data[val] = 50
		val += 3
		while arr_data[val] != -1 {
			val = val + 3
			arr_data[val] = 50
			val += 3
		}
		// Third column 25
		val += 5
		if val >= total_vals break
		arr_data[val] = 25
		val += 3
		while arr_data[val] != -1 {
			val += 3
			arr_data[val] = 25
			val += 3
		}
		// Fourth column 10
		val += 5
		if val >= total_vals break
		arr_data[val] = 50
		val += 3
		while arr_data[val] != -1 {
			val += 3
			arr_data[val] = 50
			val += 3
		}
		val ++
	}
	var new_str = array_to_selection(arr_data, total_vals)
	selection_load_ext(selection_x, selection_y, new_str)
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
	if(!keyboard_check(vk_alt)) selection_place(false)



}
