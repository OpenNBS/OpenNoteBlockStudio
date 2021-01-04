function draw_window_save_options() {
	// draw_window_save_options()
	var x1, y1, min_version;
	curs = cr_default
	text_exists[0] = 0
	x1 = floor(window_width / 2 - 72)
	y1 = floor(window_height / 2 - 90)
	draw_window(x1, y1, x1 + 140, y1 + 162)
	draw_set_font(fnt_mainbold)
	draw_text(x1 + 8, y1 + 8, "Save options")
	draw_set_font(fnt_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 132, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 132, 1)
	}
	draw_theme_color()
	
	min_version = 0
	if (user_instruments > 18) {
		min_version = 5
	}
	save_version = max(save_version, min_version)

	if (draw_radiobox(x1 + 15, y1 + 35, save_version = 5, "v5", "Increases custom instrument limit\nAllows custom sounds in subfolders", min_version > 5)) save_version = nbs_version
	if (draw_radiobox(x1 + 15, y1 + 50, save_version = 4, "v4", "Includes note velocity/pan/pitch and looping", min_version > 4)) save_version = 4
	if (draw_radiobox(x1 + 15, y1 + 65, save_version = 3, "v3", "Includes song length", min_version > 3)) save_version = 3
	if (draw_radiobox(x1 + 15, y1 + 80, save_version = 2, "v2", "Includes layer panning", min_version > 2)) save_version = 2
	if (draw_radiobox(x1 + 15, y1 + 95, save_version = 1, "v1", "Includes custom instrument index", min_version > 1)) save_version = 1
	if (draw_radiobox(x1 + 15, y1 + 110, save_version = 0, "Classic", "Doesn't have any of the above, but works on all versions.", min_version > 0)) save_version = 0

	if (draw_button2(x1 + 40, y1 + 135, 60, "OK")) {
		if save_version != nbs_version question("Some of the song's data will be lost if you save in a previous version! Are you sure?", "Confirm")
		changed = 1
		window = 0
		}
	window_set_cursor(curs)


}
