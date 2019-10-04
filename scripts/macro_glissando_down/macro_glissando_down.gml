// macro_glissando_down()
var str, total_vals, val, decr
str = selection_code
if (selected = 0) return 0
data = selection_to_array(str)
total_vals = string_count("|", str)
val = 0
decr = 0
show_debug_message(string_count("-1", str))
//for (var i = 0; i < total_vals; i++;) {show_debug_message(data[i])}
while (val < total_vals) {
	val += 3
	data[val] -= decr
	val += 4
	while data[val] != -1 {
		val += 2
		data[val] -= decr
		val += 4
	}
	val ++
	if decr > 0 {
	decr ++
	}
}
str = array_to_selection(data, total_vals)
selection_load(selection_x,selection_y,str,true)
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
