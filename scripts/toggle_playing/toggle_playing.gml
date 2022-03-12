function toggle_playing(argument0) {
	// toggle_playing(cols)
	var xx, a, b, c, d, e;
	playing=!playing
	toggle_followalong(playing,marker_pos/tempo)
	if (playing = 1) {
	    if (marker_pos = enda + argument0) marker_pos = 0
	    if (marker_start && section_exists) marker_pos = section_start
	    if (marker_follow = 1) {
	        if (marker_pagebypage = 1 && (starta + argument0 - 2 < marker_pos || starta > marker_pos)) {
	            starta = median(0, marker_pos - 1, enda)
	            sb_val[scrollbarh] = starta
	        }
	        if (marker_pagebypage = 0) {
	            starta = median(0, marker_pos - floor(argument0 / 2), enda)
	            sb_val[scrollbarh] = starta
	        }
	    }
	    marker_prevpos = marker_pos
	    metronome_played = -1
	    // PLAY COL
	    xx = floor(marker_pos)
	    if (xx <= enda) {
	        if (colamount[xx] > 0) {
	            for (b = colfirst[xx]; b <= collast[xx]; b += 1) {
	                if (song_exists[xx, b]) {
	                    a = 1
						e = 0
						if (b < endb2) {
							c = (layervol[b] / 100 ) * song_vel[xx, b]
							if layerstereo[b] = 100 {
								d = song_pan[xx, b]
							} else d = (layerstereo[b] + song_pan[xx, b]) / 2
							e = song_pit[xx, b]
						}
	                    if (solostr != "") {
	                        if (string_count("|" + string(b) + "|", solostr) = 0) {
	                            a = 0
	                        } else if (layerlock[b] = 1) {
	                            a = 0
	                        }
	                    } else if (b < endb2) {
	                        if (layerlock[b] = 1) {
	                            a = 0
	                        }
	                    }
	                    if (a) {
	                        if (song_ins[xx, b].loaded) play_sound(song_ins[xx, b], song_key[xx, b], c , d, e)
	                        if (song_ins[xx, b].press) key_played[song_key[xx, b]] = current_time
	                        song_played[xx, b] = current_time
							
	                    }
	                }
	            }
	        }
	    }
	}



}
