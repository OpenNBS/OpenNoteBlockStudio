// swap_text_edit(id1, id2)
// swaps the contents of two text edit boxes

var id1, id2, tempstr
id1 = argument0
id2 = argument1
tempstr = ""

// Initialize text
if (!text_exists[id1]) {
	text_exists[id1] = 1
	text_str[id1] = ""
	text_laststr[id1] = "-"
}
if (!text_exists[id2]) {
	text_exists[id2] = 1
	text_str[id2] = ""
	text_laststr[id2] = "-"
}

tempstr = text_str[id1]
text_str[id1] = text_str[id2]
text_str[id2] = tempstr