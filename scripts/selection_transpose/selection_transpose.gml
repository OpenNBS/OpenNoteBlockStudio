function selection_transpose() {
	// selection_transpose()
	var a, b, str, key, am;
	str = selection_code
	if (selected = 0) return 0
	am = 0
	for (a = 0; a < selection_l; a += 1) {
	    if (selection_colfirst[a] > -1) {
	        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
	            if (selection_exists[a, b]) {
	                key = selection_key[a, b]
	                if (key < 33 || key > 57) am += 1
	                while (key < 33) key += 12
	                while (key > 57) key -= 12
	                selection_key[a, b] = key
	            }
	        }
	    }
	}
	message(string(am) + " notes were edited.", "Transpose notes")
	selection_code_update()
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)



}
