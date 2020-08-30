function string_digits_symbol(argument0, argument1) {
	// string_digits_symbol(str, symbol)
	// Filters string keeping only digits and an additional character of choice

	var str, symbol, nstr, char

	str = argument0
	symbol = argument1
	nstr = ""

	str = string_replace_all(string_lower(str), " ", "_")
	for (i = 1; i <= string_length(str); i++) {
		char = string_char_at(str, i)
		if ((char = symbol) || (char = string_digits(char))) {
			nstr += char
		}
	}
	return nstr


}
