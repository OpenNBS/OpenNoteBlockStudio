// string_truncate(str, maxwidth)
// Truncates a string to maxwidth and adds ellipses (...) at the end

var str, maxwidth
str = argument0
maxwidth = argument1

if (string_width(str) > maxwidth) {
	return string_maxwidth(str, maxwidth) + "..."
}
return str