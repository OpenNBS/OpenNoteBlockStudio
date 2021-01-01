function calculate_locked_layers() {
	// calculate_locked_layers()
	// populates the 'lockedlayer' array for every layer in the song

	for (c = 0; c <= endb; c += 1) {
	    lockedlayer[c] = 0
	    if (solostr != "") {
	        if (string_count("|" + string(c) + "|", solostr) = 0) {
	            lockedlayer[c] = 1
	        } else if (layerlock[c] = 1) {
	            lockedlayer[c] = 1
	        }
	    } else if (c < endb2) {
	        if (layerlock[c] = 1) {
	            lockedlayer[c] = 1
	        }
	    }
	}


}
