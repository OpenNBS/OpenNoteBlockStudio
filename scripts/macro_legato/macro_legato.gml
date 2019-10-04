// macro_legato()
var d, c, e, str, total_vals, total_cols, val, replength, colcount;
str = selection_code
if (selected = 0) return 0
arr_temp = selection_to_array(str)
total_vals = string_count("|", str)
//show_debug_message("total vals is "+string(total_vals))
total_cols = string_count("-1", str)
//show_debug_message("total cols is "+string(total_cols))
val = 0
c = 0
colcount = 0
for (d = 0; d < total_cols; d++;) {
	e = 0
	while arr_temp[val] != -1 {
		arr_col[e] = arr_temp[val]
		val++
		e++
	}
	if arr_temp[val] = -1 arr_col[e] = -1
	val++
//	show_debug_message(string(val) + " values processed." )
	e++
//	show_debug_message("arr_col now stores " + string(array_to_selection(arr_col, e)))
	if val >= total_vals { //dump col into arr_data and break
		for (var b = 0; b < e; b++) {
			if b = 0 arr_col[b] = 1
			arr_data[c] = arr_col[b]
			c++
		}
		break
	}
	if arr_temp[val] >= 1 replength = arr_temp[val]
//	show_debug_message("repeat length is " + replength)
	arr_temp[val] = 1
	for (var a = 0; a < replength; a++) {
		for (var b = 0; b < e; b++) {
			if b = 0 arr_col[b] = 1
			arr_data[c] = arr_col[b]
			c++
		}
	}
//	show_debug_message("End loop. arr_data is now " + string(array_to_selection(arr_data, c)))
	colcount++
}
arr_data[0] = 0
//show_debug_message("Out of loop. arr_data has been changed to " + string(array_to_selection(arr_data, c)))
str = array_to_selection(arr_data, c)
selection_load(selection_x,selection_y,str,true)
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
