function draw_window_set_accent() {
	// draw_window_set_accent()
	if (theme = 3) draw_set_alpha(windowalpha)
	var x1, y1, r, g, b, e
	curs = cr_default
	text_exists[0] = 0
	x1 = floor(rw / 2 - 120)
	y1 = floor(rh / 2 - 80)
	draw_window(x1, y1, x1 + 240, y1 + 130)
	draw_theme_font(font_main_bold)
	draw_text(x1 + 8, y1 + 8, "Set accent color")
	r = accent1
	g = accent2
	b = accent3
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
	}
	draw_areaheader(x1 + 10, y1 + 43, 220, 35, "RGB color")

	r = draw_textarea(60, x1 + 15, y1 + 50, 71, 25, string(r), "Set red amount.")
	g = draw_textarea(61, x1 + 15 + 71, y1 + 50, 71, 25, string(g), "Set green amount.")
	b = draw_textarea(62, x1 + 15 + 71 + 71, y1 + 50, 71, 25, string(b), "Set blue amount.")

	draw_theme_color()
	if (draw_button2(x1 + 10, y1 + 98, 60, "OK") && windowopen = 1) {
		try {
			accent1 = real(r)
			accent2 = real(g)
			accent3 = real(b)
			draw_accent_init()
			windowclose = 1
		}
		catch(e) {
			message("Please enter a valid number!", "Set accent color")
		}
	}
	if (draw_button2(x1 + 72, y1 + 98, 60, "Cancel")) {windowclose = 1}
	if (draw_button2(x1 + 158, y1 + 98, 72, "Use default") && wmenu = 0) {
	    if (question("Are you sure?", "Confirm")) {
			accent1 = 0
			accent2 = 120
			accent3 = 215
			draw_accent_init()
			windowclose = 1
		}
	}
	window_set_cursor(curs)
	window_set_cursor(cr_default)
	if (windowopen = 0 && theme = 3) {
		if (windowalpha < 1) {
			if (refreshrate = 0) windowalpha += 1/3.75
			else if (refreshrate = 1) windowalpha += 1/7.5
			else if (refreshrate = 2) windowalpha += 1/15
			else if (refreshrate = 3) windowalpha += 1/18
			else windowalpha += 1/20
		} else {
			windowalpha = 1
			windowopen = 1
		}
	}
	if(theme = 3) {
		if (windowclose = 1) {
			if (windowalpha > 0) {
				if (refreshrate = 0) windowalpha -= 1/3.75
				else if (refreshrate = 1) windowalpha -= 1/7.5
				else if (refreshrate = 2) windowalpha -= 1/15
				else if (refreshrate = 3) windowalpha -= 1/18
				else windowalpha -= 1/20
			} else {
				windowalpha = 0
				windowclose = 0
				windowopen = 0
				window = 0
				window_set_cursor(curs)
				save_settings()
			}
		}
	} else {
		if (windowclose = 1) {
			windowclose = 0
			window = 0
		}
	}
	draw_set_alpha(1)

}
