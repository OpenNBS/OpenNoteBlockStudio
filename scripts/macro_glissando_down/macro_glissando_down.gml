// macro_glissando_down()
var str, total_vals, val, decr
str = selection_code
if (selected = 0) return 0
arr_data = selection_to_array(str)
total_vals = string_count("|", str)
val = 0
decr = 0
show_debug_message(string_count("-1", str))
//for (var i = 0; i < total_vals; i++;) {show_debug_message(arr_data[i])}
while (val < total_vals) {
	val += 3
	if arr_data[val] > 0 {
	arr_data[real(val)] = real(arr_data[real(val)]) + real(decr)
	} else arr_data[val] = 1
	val += 4
	while arr_data[val] != -1 {
		val += 2
		if arr_data[val] > 0 {
		arr_data[real(val)] = real(arr_data[real(val)]) + real(decr)
		} else arr_data[val] = 1
		val += 4
	}
	val ++
	decr --
}
str = array_to_selection(arr_data, total_vals)
selection_load(selection_x,selection_y,str,true)
if(!keyboard_check(vk_shift)) selection_place(false)
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
