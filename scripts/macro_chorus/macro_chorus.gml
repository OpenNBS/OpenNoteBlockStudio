function macro_chorus() {
	// macro_chorus()
	var str, total_vals, val;
	str = selection_code
	arr_data = selection_to_array(str)
	window = 0
	total_vals = string_count("|", str)
	val = 0
	while (val < total_vals) {
		val += 5
		arr_data[val] = 140
		val ++
		arr_data[real(val)] = real(arr_data[real(val)]) + real(5)
		val ++
		if arr_data[val] = -1 {
			if (language != 1) message("There must be exactly two layers worth of note blocks in every applicable tick!", "Error")
			else message("应用的每刻内必须有两层方块！", "错误")
			return 1
		}
		val += 4
		arr_data[val] = 60
		val++
		arr_data[real(val)] = real(arr_data[real(val)]) + real(-5)
		val += 2
	}
	str = array_to_selection(arr_data, total_vals)
	selection_load(selection_x,selection_y,str,true)
	if(!keyboard_check(vk_alt)) selection_place(false)


}
