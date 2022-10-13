function region_code_get(argument0, argument1, argument2, argument3) {
	// region_code_get(x1, y1, x2, y2)
	// Fetches the code of the specified region.
	var x1, y1, x2, y2, str, a, b, ca, cb, am;
	x1 = argument0
	y1 = argument1
	x2 = argument2
	y2 = argument3
	str = ""
	ca = 0
	am = 0
	for (a = x1; a < x2; a += 1) {
	    if (a <= songs[song].enda) {
	        if (songs[song].colamount[a] > 0) {
	            str += string(ca) + "|"
	            ca = 0
	            cb = 0
	            for (b = y1; b < y2; b += 1) {
	                if (b >= songs[song].colfirst[a] && b <= songs[song].collast[a]) {
	                    if (songs[song].song_exists[a, b]) {
	                        str += string(cb) + "|"
	                        cb = 0
	                        str += string(ds_list_find_index(songs[song].instrument_list, songs[song].song_ins[a, b])) + "|"
	                        str += string(songs[song].song_key[a, b]) + "|"
	                        str += string(songs[song].song_vel[a, b]) + "|"
	                        str += string(songs[song].song_pan[a, b]) + "|"
	                        str += string(songs[song].song_pit[a, b]) + "|"
	                        am += 1
	                    }
	                }
	                cb += 1
	            }
	            str += "-1|"
	        }
	    }
	    ca += 1
	}
	if (am = 0) str = ""
	return str



}
