function string_path(argument0) {
	//string_path(str)
	//makes string lowercase, replaces spaces with underscores, and removes special characters

	var str, nstr, char

	str = argument0
	nstr = ""

	str = string_replace_all(string_lower(str), " ", "_")
	for (i = 1; i <= string_length(str); i++) {
		char = string_char_at(str, i)
		if ((char = "_") || (char = string_lettersdigits(char))) {
			nstr += char
		}
	}
	return nstr


}
