function string_maxwidth(argument0, argument1) {
	// string_maxwidth(str, w)
	var str, nstr, maxw, w, c, truncate_start;
	str = argument0
	maxw = argument1
	truncate_start = false
	if (argument_count > 2) {
		truncate_start = argument[2]
	}
	w = 0
	nstr = ""
	if (truncate_start) {
		for (c = string_length(str); c >= 1; c -= 1) {
			w += string_width_dynamic(string_char_at(str, c))
			if (string_char_at(str, c) = "\n") w = 0
			if (w > maxw) break
			nstr = string_char_at(str, c) + nstr
		}
	} else {
		for (c = 1; c <= string_length(str); c += 1) {
		    w += string_width_dynamic(string_char_at(str, c))
		    if (string_char_at(str, c) = "\n") w = 0
		    if (w > maxw) break
		    nstr += string_char_at(str, c)
		}
	}
	return nstr



}
