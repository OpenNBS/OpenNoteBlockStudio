function draw_msg(){
	draw_set_alpha(msgalpha)
	var x1, x2, y1, y2, str, fnt;
	str = msgcontent
	fnt = currentfont
	draw_theme_font(font_info_med_bold)
	x1 = (msgx + (rw + 1) * (msgx = -1) - string_width_dynamic(str)) / 2
	x2 = (msgx + (rw + 1) * (msgx = -1) + string_width_dynamic(str)) / 2
	y1 = msgy + (rh * 0.8 + 1) * (msgy = -1)
	y2 = msgy + (rh * 0.8 + 1) * (msgy = -1) - 20
	draw_set_color(7368816)
	if (theme = 3 && msgalpha >= 0.5 && acrylic) draw_surface_blur(application_surface, x1 - 10, y1 - 30, x2 - x1 + 20, 40, 0.5)
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
		draw_set_alpha(msgalpha * (0.6 + 0.4 * !acrylic))
		draw_roundrect(x1 - 10, y1 + 10, x2 + 10, y2 - 10, 0)
		draw_set_alpha(msgalpha)
		draw_set_color(7368816)
		draw_roundrect(x1 - 10, y1 + 10, x2 + 10, y2 - 10, 1)
	}
	if (theme = 3 && acrylic) draw_acrylic_texture(x1 - 10, y1 - 30, x2 - x1 + 20, 40)
	draw_theme_color()
	draw_text_dynamic(x1, y1 - 10 - string_height(str) / 2, str)
	if (current_time - msgstart >= (msgtime * 1000)){
		if (msgalpha > 0) {
			msgalpha -= 1/7.5 * (30 / room_speed) * (1 / currspeed)
		} else {
			msgalpha = 0
			showmsg = 0
		}
	}
	draw_theme_font(fnt)
	draw_set_alpha(1)
}