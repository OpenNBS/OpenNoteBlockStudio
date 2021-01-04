function draw_window_update() {
	// draw_window_update()
	var x1, y1, a, n, fullstr, str, strb;
	fullstr = load_text(data_directory + "changelog.txt")
	if (fullstr = 0) {
		show_message("Changelist not found!")
		if (window = w_update) {
	        window = w_greeting
	    } else {
	        window = 0
	    }
		return 0
	}
	x1 = floor(window_width / 2 - 250)
	y1 = floor(window_height / 2 - 200)
	draw_window(x1, y1, x1 + 500, y1 + 400)
	draw_set_font(fnt_mainbold)
	if (window = w_update) draw_text(x1 + 8, y1 + 8, "Update")
	else draw_text(x1 + 8, y1 + 8, "Changelist")
	draw_set_font(fnt_main)
	if (window = w_update) draw_text(x1 + 32, y1 + 32, "Thank you for upgrading to version " + version + "!")
	draw_area(x1 + 16, y1 + 58, x1 + 487, y1 + 310)
	n = string_count("\n", fullstr) 
	for (a = 0; a < n; a += 1) {
	    str[a] = string_copy(fullstr, 1, string_pos("\n", fullstr) - 1)
	    strb[a] = 0
	    if (string_char_at(str[a], 1) = "C") strb[a] = 1
	    fullstr = string_delete(fullstr, 1, string_pos("\n", fullstr))
	}
	for (a = sb_val[update_scrollbar]; a < sb_val[update_scrollbar] + 15; a += 1) {
	    if (a >= n) break
	    if (strb[a]) draw_set_font(fnt_mainbold)
	    else draw_set_font(fnt_main)
	    draw_text(x1 + 32, y1 + 64 + 16 * (a - sb_val[update_scrollbar]), str[a])
	}
	draw_set_font(fnt_main)
	draw_scrollbar(update_scrollbar, x1 + 470, y1 + 60, 12, 18, n, 0, 1)
	if (draw_button2(x1 + 220, y1 + 340, 72, "OK")) {
	    if (window = w_update) {
	        window = w_greeting
			save_settings() // Save new version number
	    } else {
	        window = 0
	    }
	}
}
