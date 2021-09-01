function set_msg(str, time, xx, yy){
	msgcontent = string(str)
	msgstart = current_time
	msgtime = !is_undefined(time) ? time : 1.0 // Duration (in seconds)
	msgx = !is_undefined(xx) ? xx : rw
	msgy = !is_undefined(yy) ? yy : rh * 0.8
	msgalpha = 1
	showmsg = 1
}