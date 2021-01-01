function array_to_selection(argument0, argument1) {
	// array_to_selection(data, total_vals)
	var array = argument0
	var total_vals = argument1
	var str = ""
	for (var i = 0; i < total_vals; i++;) {
		str += string(string(array[i]) + "|")
	}
	// show_debug_message(str)
	return str


}
