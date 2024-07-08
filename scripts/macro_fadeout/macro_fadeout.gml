function macro_fadeout() {
	// macro_fadeout()
	var str, total_vals, val, decr, inc, maxdecr
	str = selection_code
	if (selected = 0) return 0
	var arr_data = selection_to_array_ext()
	total_vals = array_length(arr_data)
	val = 0
	// Check top-left note block's velocity value, calculate fade out from that.
	maxdecr = arr_data[4]
	decr = maxdecr/macro_column_count(arr_data)
	inc = decr
	//show_debug_message(string_count("-1", str))
	//for (var i = 0; i < total_vals; i++;) {show_debug_message(arr_data[i])}
	while (val < total_vals) {
		val += 4
		arr_data[val] = maxdecr-decr
		val += 3
		while arr_data[val] != -1 {
			val += 3
			arr_data[val] = maxdecr-decr
			val += 3
		}
		decr = decr + inc
		val ++
	}
	selection_load_from_array(selection_x, selection_y, arr_data)
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
	if(!keyboard_check(vk_alt)) selection_place(false)


}
