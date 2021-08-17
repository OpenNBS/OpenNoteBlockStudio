function string_word_wrap(argument0, argument1) {
	// string_word_wrap(str, wid)
	var str, wid;
	str = argument0
	wid = argument1

	var pos, insertpos, linewid, ch;
	pos = 1
	insertpos = -1
	linewid = 0
	while (pos <= string_length(str)) {
	    ch = string_char_at(str, pos)
	    if (ch = "\n") linewid = 0
	    linewid += string_width_dynamic(ch)
	    if (linewid >= wid) {
	        if (insertpos = -1) {
	            str = string_insert("\n", str, pos)
	            linewid = 0
	        } else {
	            str = string_insert("\n", str, insertpos)
	            linewid = string_width_dynamic(string_copy(str, insertpos, pos - insertpos + 1))
	            insertpos = -1
	        }
	    }
	    if (ch = " " || ch = " - ") insertpos = pos + 1
	    pos += string_length(ch)
	}
	return str



}
