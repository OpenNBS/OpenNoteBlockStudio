function macro_replacekey() {
	// macro_replacekey()
	// Replaces all notes with the first note in the selection. Good for batch chord and tremolo edits.
	var str, total_vals, val, key
	str = selection_code
	if (selected = 0) return 0
	var arr_data = selection_to_array(str)
	total_vals = array_length(arr_data)
	val = 0
	key = arr_data[3]
	//show_debug_message(string_count("-1", str))
	//for (var i = 0; i < total_vals; i++;) {show_debug_message(arr_data[i])}
	while (val < total_vals) {
		val += 3
		arr_data[val] = key
		val += 4
		while arr_data[val] != -1 {
			val += 2
			arr_data[val] = key
			val += 4
		}
		val ++
	}
	var new_str = array_to_selection(arr_data, total_vals)
	selection_load_ext(selection_x, selection_y, new_str)
	history_set(h_selectchange, selection_x, selection_y, try_compress_selection(selection_code), selection_x, selection_y, try_compress_selection(str))
	selection_code_update()



}
