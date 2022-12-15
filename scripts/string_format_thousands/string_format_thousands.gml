function string_format_thousands(argument0) {
	// string_format_auto(number)
	// Adds thousands separators to a numeric string.
	var input = string(argument0);
	var str = "";
	var count = 0;
	var length = string_length(input);
	if (length > 3) {
		for (var i = length; i > 0; i--) {
			count++;
			if (str != "" && count % 3 == 0 && count != length) {
				str = "," + string_copy(input, i, 1) + str;
			} else {
				str = string_copy(input, i, 1) + str;
			}
		}
		return str;
	}
	return input;
}
