function string_lastline(argument0, argument1) {
	// string_lastline(str, newline)
	// Returns with the contents on the last line of the given string.
	var str, nstr;
	str = argument0
	newl = argument1

	while (string_count(newl, str) > 0) str = string_delete(str, 1, string_pos(newl, str))

	return str;



}
