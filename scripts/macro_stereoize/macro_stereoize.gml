// macro_stereoize()
var str, total_vals, val,
str = selection_code
if (selected = 0) return 0
data = selection_to_array(str)
total_vals = string_count("|", str)
val = 0
for (var i = 0; i < total_vals; i++;) {show_debug_message(data[i])}
while (val < total_vals) {
	// First column panned left
	val += 5
	data[val] = 0
	val += 2
	while data[val] != -1 {
		val += 4
		data[val] = 0
		val += 2
	}
	// Second column panned right
	val += 6
	data[val] = 200
	val += 2
	if val >= total_vals break
	while data[val] != -1 {
		val += 4
		data[val] = 200
		val += 2
	}
	val ++
}
str = array_to_selection(data, total_vals)
selection_load(selection_x,selection_y,str,true)
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
