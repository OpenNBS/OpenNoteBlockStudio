function selection_code_update() {
	// selection_code_update()
	// Updates the selection code
	var str, a, b, ca, cb;
	str = ""
	if (songs[song].selected = 0) return 0
	ca = 0
	for (a = 0; a < songs[song].selection_l; a += 1) {
	    if (songs[song].selection_colfirst[a] > -1) {
	        str += string(ca) + "|"
	        ca = 0
	        cb = 0
	        for (b = 0; b < songs[song].selection_h; b += 1) {
	            if (songs[song].selection_exists[a, b]) {
	                str += string(cb) + "|"
	                cb = 0
	                str += string(ds_list_find_index(songs[song].instrument_list, songs[song].selection_ins[a, b])) + "|"
	                str += string(songs[song].selection_key[a, b]) + "|"
	                str += string(songs[song].selection_vel[a, b]) + "|"
	                str += string(songs[song].selection_pan[a, b]) + "|"
	                str += string(songs[song].selection_pit[a, b]) + "|"
	            }
	            cb += 1
	            if (b = songs[song].selection_h - 1) {
	                str += "-1|"
	            }
	        }
	    }
	    ca += 1
	}
	songs[song].selection_code = str



}
