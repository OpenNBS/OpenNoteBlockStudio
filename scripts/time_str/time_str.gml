function time_str(argument0) {
	// time_str(sec)
	var sec, msec, mi, hr;
	sec = argument0
	msec = floor(sec * 1000) mod 1000
	mi = floor(sec / 60) mod 60
	hr = floor(sec / 3600) mod 60
	sec = floor(sec) mod 60
	return condstr(hr < 10, "0") + string(hr) + ":"+
	       condstr(mi < 10, "0") + string(mi) + ":"+
	       condstr(sec < 10, "0") + string(sec) + ";"+
	       condstr(msec < 100, "0") + condstr(msec < 10, "0") + string(msec)



}
