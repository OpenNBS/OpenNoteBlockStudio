function draw_window_macro_stagger() {
	// draw_window_macro_stagger()
	var x1, y1, a, b, i, pattern, str, total_vals, val, arplen, maxlength, conf;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	text_exists[0] = 0
	if (selected = 0) return 0
	x1 = floor(rw / 2 - 80)
	y1 = floor(rh / 2 - 70) + windowoffset
	draw_window(x1, y1, x1 + 150, y1 + 160)
	draw_theme_color()
	draw_theme_font(font_main_bold)
	draw_text(x1 + 8, y1 + 8, "Stagger")
	draw_set_color(c_red)
	draw_text(x1 + 8, y1 + 23, "(CANNOT BE UNDONE)")
	draw_theme_color()
	pattern = ""
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 11, y1 + 26, x1 + 154, y1 + 102, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 11, y1 + 26, x1 + 154, y1 + 102, 1)
	}
	draw_areaheader(x1 + 15, y1 + 53, 120, 35, "Pattern")

	pattern = draw_textarea(58, x1 + 20, y1 + 60, 113, 25, string(pattern), "Must separate relative keys with pipes.") 
	draw_theme_font(font_main)
	draw_text(x1 + 25, y1 + 92,"This may replace \nlower note blocks!")
	if (draw_button2(x1 + 15, y1 + 128, 60, "OK")) {
		if string_count("|", pattern) = 0 {
			message("Please add pipes ( | ) to separate values!", "Error")
			return -1
		}
		if string_count("-", pattern) != 0 {
			message("Stagger can only extend downwards!", "Error")
			return -1
		}
		windowalpha = 0
		windowclose = 0
		windowopen = 0
		window = 0
		str = selection_code
		arr_data = selection_to_array(str)
		total_vals = string_count("|", str)
		val = 0
		conf = 0
		pattern = string_digits_symbol(pattern, "|")
		pattern = string(pattern + "|")
		arp = selection_to_array(pattern)
		arplen = string_count("|", pattern)

		maxlength = 0;
	
		var patlen = array_length_1d(arp);
		for (i = 0; i < patlen; i++) { // Calculate highest number in given pattern
		    if (arp[i] > arp[maxlength]) {
		        maxlength = i;
		    }
		}
		for (a = 0; a < selection_arraylength; a++) {  // Expand array entries by highest number
		    for (b = 0; b <= arp[maxlength]; b ++) {
		        selection_exists[a, b] = 0
		    }
		}

		selection_arrayheight = arp[maxlength]

		while (val < total_vals) {
			for (i = 0; i < arplen; i++;) {
				val += 1
				arr_data[val] = real(arr_data[val]) + real(arp[i])
				val += 6
				while arr_data[val] != -1 {
					arr_data[val] = real(arr_data[val]) + real(arp[i])
					val += 6
				}
			val ++
			if val >= total_vals break
			}
		if val >= total_vals break
		}
		str = array_to_selection(arr_data, total_vals)
		selection_load(selection_x,selection_y,str,true)
		selection_code_update()
		history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
	}
	if (draw_button2(x1 + 75, y1 + 128, 60, "Cancel") && (windowopen = 1 || theme != 3)) {windowclose = 1}
	window_set_cursor(curs)
	window_set_cursor(cr_default)
}
