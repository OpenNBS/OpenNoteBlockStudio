function add_to_recent(argument0) {
	// add_to_recent(fn)
	var a, b, fn;
	fn = argument0
	for (a = 0; a < 10; a += 1) {
	    if (recent_song[a] = fn) {
	        for (b = a; b < 10; b += 1) {
	            recent_song[b] = recent_song[b + 1]
	            recent_song_time[b] = recent_song_time[b + 1]
	        }
	    }
	}
	for (a = 10; a > 0; a -= 1) {
	    recent_song[a] = recent_song[a - 1]
	    recent_song_time[a] = recent_song_time[a - 1]
	}
	recent_song[a] = fn
	recent_song_time[a] = date_current_datetime()



}
