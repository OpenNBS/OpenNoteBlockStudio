function draw_window_set_tempo() {
	// draw_window_set_tempo()
	var x1, y1, tempoo
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

	tempoo = draw_textarea(57, x1 + 15, y1 + 50, 113, 25, string(tempoo), "Will always floor to integer.") 

	draw_theme_color()
	if (draw_button2(x1 + 10, y1 + 98, 60, "OK")) {
	window = 0
	if (use_bpm) tempo = floor(tempoo) / 15
	else tempo = tempoo
	}
	if (draw_button2(x1 + 70, y1 + 98, 60, "Cancel")) {window = 0}
	window_set_cursor(curs)


}
