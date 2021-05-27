function draw_window_set_tempo() {
	// draw_window_set_tempo()
	if (theme = 3) draw_set_alpha(windowalpha)
	var x1, y1, tempoo, e
	curs = cr_default
	text_exists[0] = 0
	x1 = floor(rw / 2 - 80)
	y1 = floor(rh / 2 - 80)
	draw_window(x1, y1, x1 + 140, y1 + 130)
	draw_set_font(fnt_mainbold)
		if (theme = 3) draw_set_font(fnt_wslui_bold)
	draw_text(x1 + 8, y1 + 8, "Set tempo")
	tempoo = ""
	draw_set_font(fnt_main)
		if (theme = 3) draw_set_font(fnt_wslui)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
	}
	if (use_bpm) draw_areaheader(x1 + 10, y1 + 43, 120, 35, "BPM")
	else draw_areaheader(x1 + 10, y1 + 43, 120, 35, "TPS")

	tempoo = draw_textarea(57, x1 + 15, y1 + 50, 113, 25, string(tempoo), "Will always floor to integer if using BPM.") 

	draw_theme_color()
	if (draw_button2(x1 + 10, y1 + 98, 60, "OK")) {
		try {
			if (use_bpm) tempo = floor(tempoo) / 15
			else tempo = floor(real(tempoo) * 100) / 100
			windowclose = 1
		}
		catch(e) {
			message("Please enter a number!\n\n" + string(e), "Set tempo")
		}
	}
	if (draw_button2(x1 + 70, y1 + 98, 60, "Cancel")) {windowclose = 1}
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
