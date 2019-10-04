// macro_fadein()
var str, total_vals, val, decr, inc
str = selection_code
if (selected = 0) return 0
data = selection_to_array(str)
total_vals = string_count("|", str)
val = 0
decr = 100/string_count("-1", str)
inc = decr
show_debug_message(string_count("-1", str))
//for (var i = 0; i < total_vals; i++;) {show_debug_message(data[i])}
while (val < total_vals) {
	val += 4
	data[val] = 0+decr
	val += 3
	while data[val] != -1 {
		val += 3
		data[val] = 0+decr
		val += 3
	}
	decr = decr + inc
	val ++
}
str = array_to_selection(data, total_vals)
selection_load(selection_x,selection_y,str,true)
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
