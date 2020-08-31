function string_maxwidth(argument0, argument1) {
	// string_maxwidth(str, w)
	var str, nstr, maxw, w, c;
	str = argument0
	maxw = argument1
	w = 0
	nstr = ""
	for (c = 1; c <= string_length(str); c += 1) {
	    w += string_width(string_char_at(str, c))
	    if (string_char_at(str, c) = "\n") w = 0
	    if (w > maxw) break
	    nstr += string_char_at(str, c)
	}
	return nstr



}
