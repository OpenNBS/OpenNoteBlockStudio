function draw_msg(){
	draw_set_alpha(msgalpha)
	var x1, x2, y1, y2, str;
	str = msgcontent
	draw_theme_font(font_info_med_bold)
	x1 = (window_width - string_width(str)) / 2
	x2 = (window_width + string_width(str)) / 2
	y1 = window_height * 0.8
	y2 = window_height * 0.8 - 20
	draw_set_color(7368816)
	if (theme = 3) draw_roundrect(x1 - 10, y1 + 10, x2 + 10, y2 - 10, 1)
	draw_set_color(15790320)
	if (theme = 1) draw_set_color(13160660)
	if (theme = 2) draw_set_color(c_dark)
	if (theme = 3 && !fdark) draw_set_color(15987699)
	if (theme = 3 && fdark) draw_set_color(2105376)
	if (theme != 3) {
		draw_area(x1 - 10, y1 + 10, x2 + 10, y2 - 10)
		draw_rectangle(x1 + 2 - 10, y1 + 10, x2 - 3 + 10, y2 - 1 - 10, 0)
	} else {
		draw_roundrect(x1 - 10, y1 + 10, x2 + 10, y2 - 10, 0)
		draw_set_color(7368816)
		draw_roundrect(x1 - 10, y1 + 10, x2 + 10, y2 - 10, 1)
	}
	draw_theme_color()
	draw_text(x1, y1 - 10 - string_height(str) / 2, str)
	if (current_time - msgstart >= 1000){
		if (msgalpha > 0) {
			if (refreshrate = 0) msgalpha -= 1/7.5
			else if (refreshrate = 1) msgalpha -= 1/15
			else if (refreshrate = 2) msgalpha -= 1/30
			else if (refreshrate = 3) msgalpha -= 1/36
			else msgalpha -= 1/40
		} else {
			msgalpha = 0
			showmsg = 0
		}
	}
	draw_set_alpha(1)
}