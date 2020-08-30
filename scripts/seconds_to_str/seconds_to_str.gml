function seconds_to_str(argument0) {
	// seconds_to_str(s)
	c = argument0
	if (c < 60) {
	    str = string(c) + " second" + condstr(c != 1, "s") + " ago"
	} else if (c < 60 * 60) {
	    c = floor(c / 60)
	    str = string(c) + " minute" + condstr(c != 1, "s") + " ago"
	} else if (c < 60 * 60 * 24) {
	    c = floor(c / (60 * 60))
	    str = string(c) + " hour" + condstr(c != 1, "s") + " ago"
	} else if (c < 60 * 60 * 24 * 7) {
	    c = floor(c / (60 * 60 * 24))
	    str = string(c) + " day" + condstr(c != 1, "s") + " ago"
	} else if (c < 60 * 60 * 24 * 31) {
	    c = floor(c / (60 * 60 * 24 * 7))
	    str = string(c) + " week" + condstr(c != 1, "s") + " ago"
	} else if (c < 60 * 60 * 24 * 31 * 12) {
	    c = floor(c / (60 * 60 * 24 * 31))
	    str = string(c) + " month" + condstr(c != 1, "s") + " ago"
	} else {
	    c = floor(c / (60 * 60 * 24 * 31 * 12))
	    str = string(c) + " year" + condstr(c != 1, "s") + " ago"
	}

	return str



}
