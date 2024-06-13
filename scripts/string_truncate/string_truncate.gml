function string_truncate(str, maxwidth, truncate_start = false) {
	// string_truncate(str, maxwidth)
	// Truncates a string to maxwidth and adds ellipses (...) at the end or start
	
	if (string_width_dynamic(str) > maxwidth) {
		if (truncate_start) {
			return "..." + string_maxwidth(str, maxwidth, true)
		} else {
			return string_maxwidth(str, maxwidth) + "..."
		}
	}
	return str
}
