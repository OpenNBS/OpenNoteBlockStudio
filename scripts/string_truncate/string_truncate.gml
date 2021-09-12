function string_truncate(argument0, argument1) {
	// string_truncate(str, maxwidth)
	// Truncates a string to maxwidth and adds ellipses (...) at the end or start

	var str, maxwidth, truncate_start
	str = argument0
	maxwidth = argument1
	truncate_start = false
	if (argument_count > 2) {
		truncate_start = argument[2]
	}
	
	if (string_width_dynamic(str) > maxwidth) {
		if (truncate_start) {
			return "..." + string_maxwidth(str, maxwidth, true)
		} else {
			return string_maxwidth(str, maxwidth) + "..."
		}
	}
	return str
}
