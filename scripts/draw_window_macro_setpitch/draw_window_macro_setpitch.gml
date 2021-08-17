function draw_window_macro_setpitch() {
	// draw_window_setpanning()
	var x1, y1, a, b, str, total_vals, val, decr, inc;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	text_exists[0] = 0
	if (selected = 0) return 0
	x1 = floor(rw / 2 - 80)
	y1 = floor(rh / 2 - 80) + windowoffset
	draw_window(x1, y1, x1 + 140, y1 + 130)
	draw_theme_font(font_main_bold)
	if (language != 1) draw_text_dynamic(x1 + 8, y1 + 8, "Set note pitch")
	else draw_text_dynamic(x1 + 8, y1 + 8, "设置音高")
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
	}
	if (language != 1) draw_areaheader(x1 + 10, y1 + 53, 120, 35, "Pitch")
	else draw_areaheader(x1 + 10, y1 + 53, 120, 35, "音高")
	setpit = median(-1000, draw_dragvalue(18, x1 + 55, y1 + 65, setpit, 0.1), 1000)

	draw_theme_color()
	if (draw_button2(x1 + 10, y1 + 98, 60, condstr(language != 1, "OK", "确定"))) {
		windowalpha = 0
		windowclose = 0
		windowopen = 0
		str = selection_code
		val = 0
		arr_data = selection_to_array(str)
		window = 0
		total_vals = string_count("|", str)
		val = 0
		while (val < total_vals) {
			val += 6
			arr_data[val] = setpit
			val += 1
			while arr_data[val] != -1 {
				val += 5
				arr_data[val] = setpit
				val += 1
			}
			val ++
		}
		str = array_to_selection(arr_data, total_vals)
		selection_load(selection_x,selection_y,str,true)
		if(!keyboard_check(vk_alt)) selection_place(false)
	}
	if (draw_button2(x1 + 70, y1 + 98, 60, condstr(language !=1, "Cancel", "取消")) && (windowopen = 1 || theme != 3)) {windowclose = 1}
	window_set_cursor(curs)
	window_set_cursor(cr_default)
}
