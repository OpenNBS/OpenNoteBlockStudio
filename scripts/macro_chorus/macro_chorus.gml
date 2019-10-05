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
	arr_data[val] += 5
	val ++
	if arr_data[val] = -1 {
		message("There must be exactly two layers worth of note blocks in every applicable tick!", "Error")
		return 1
	}
	val += 4
	arr_data[val] = 60
	val++
	arr_data[val] += -5
	val += 2
}
str = array_to_selection(arr_data, total_vals)
selection_load(selection_x,selection_y,str,true)
if(!keyboard_check(vk_shift)) selection_place(false)
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)