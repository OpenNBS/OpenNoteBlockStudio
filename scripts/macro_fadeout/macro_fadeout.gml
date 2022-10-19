function macro_fadeout() {
	// macro_fadeout()
	var str, total_vals, val, decr, inc, maxdecr
	str = selection_code
	if (selected = 0) return 0
	arr_data = selection_to_array(str)
	total_vals = string_count("|", str)
	val = 0
	// Check top-left note block's velocity value, calculate fade out from that.
	maxdecr = arr_data[4]
	decr = maxdecr/string_count("-1", str)
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
	str = array_to_selection(arr_data, total_vals)
	selection_load(selection_x,selection_y,str,true)
	if(!keyboard_check(vk_alt)) selection_place(false)


}
