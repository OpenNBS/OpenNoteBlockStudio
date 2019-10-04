// macro_volumelfo()
var str, total_vals, val, decr
str = selection_code
if (selected = 0) return 0
data = selection_to_array(str)
total_vals = string_count("|", str)
val = 0
decr = 100/string_count("-1", str)
for (var i = 0; i < total_vals; i++;) {show_debug_message(data[i])}
while (val < total_vals) {
	// First column 100
	val += 4
	data[val] = 100
	val ++
	if data[val] = 0 {
		data[val] = 100 // Center Panning if Stereoized
	}
	val += 2
	while data[val] != -1 {
		val = val + 3
		data[val] = 100
		val ++
		if data[val] = 0 {
			data[val] = 100 // Center Panning if Stereoized
		}
		val += 2
	}
	// Second column 50
	val += 5
	data[val] = 50
	val += 3
	if val >= total_vals break
	while data[val] != -1 {
		val = val + 3
		data[val] = 50
		val += 3
	}
	// Third column 25
	val += 5
	data[val] = 25
	val += 3
	if val >= total_vals break
	while data[val] != -1 {
		val += 3
		data[val] = 25
		val += 3
	}
	// Fourth column 10
	val += 5
	data[val] = 10
	val += 3
	if val >= total_vals break
	while data[val] != -1 {
		val += 3
		data[val] = 10
		val += 3
	}
	val ++
}
str = array_to_selection(data, total_vals)
selection_load(selection_x,selection_y,str,true)
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
