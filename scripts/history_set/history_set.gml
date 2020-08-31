function history_set() {
	// history_set(type, arg0, arg1, arg2, arg3...)
	var a, b;
	if (historypos > 0) {
	    for (a = historypos; a < historylen + 1; a += 1) {
	        for (b = 0; b < 16; b += 1) {
	            history[a - historypos, b] = history[a, b]
	        }
	    }
	    historylen -= historypos
	}
	historylen += 1
	for (a = historylen; a > 0; a -= 1) {
	    for (b = 0; b < 16; b += 1) {
	        history[a, b] = history[a - 1, b]
	    }
	}
	historypos = 0
	history[0, 16] = 0
	for (a = 0; a < argument_count; a += 1) history[0, a] = argument[a]



}
