//dat_getpath(opath)
//sanitize path input by removing consecutive slashes, slashes at beginning/end of path, and special characters

var opath = argument0
var path = ""
var char
var previouschar = ""

opath = string_replace_all(string_lower(opath), " ", "_")

if opath != "" {
	for (i = 1; i <= string_length(opath)+1; i++) {
		char = string_char_at(opath, i)
		if ((char = "_") || (char = "/" && previouschar != "/" && i > 1) || (string_lettersdigits(char) = char)) {
			path += char
		}
		previouschar = char
	}
	if (string_char_at(path, string_length(path)) = "/") path = string_copy(path, 1, string_length(path)-1)
}
return path