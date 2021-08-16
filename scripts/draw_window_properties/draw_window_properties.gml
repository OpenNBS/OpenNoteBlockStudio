function draw_window_properties() {
	// draw_window_properties()
	var x1, y1, a; 
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	text_exists[0] = 0
	x1 = floor(rw / 2 - 220)
	y1 = floor(rh / 2 - 200) + windowoffset
	draw_window(x1, y1, x1 + 440, y1 + 400)
	draw_theme_font(font_main_bold)
	draw_text(x1 + 8, y1 + 8, "Song Properties")
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 359, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 359, 1)
	}
	draw_areaheader(x1 + 22, y1 + 48, 396, 200, "Information")

	draw_text(x1 + 32, y1 + 67, "Song name:")
	a = song_name
	song_name = draw_inputbox(1, x1 + 158, y1 + 64, 240, song_name, "The name of the song.")
	if (song_name = "") {
	    draw_set_color(c_gray)
	    draw_text(x1 + 161, y1 + 68, "Untitled song")
	    draw_theme_color()
	}
	if (a != song_name) changed = 1

	draw_text(x1 + 32, y1 + 67 + 23, "Song author:")
	a = song_author
	song_author = draw_inputbox(2, x1 + 158, y1 + 64 + 23, 240, song_author, "The name of the creator of the song.")
	if (a != song_author) changed = 1

	draw_text(x1 + 32, y1 + 67 + 23 * 2, "Original song author:")
	a = song_orauthor
	song_orauthor = draw_inputbox(3, x1 + 158, y1 + 64 + 23 * 2, 240, song_orauthor, "The name of the creator of the original song\n(Leave empty if you composed the song yourself.)")
	if (a != song_orauthor) changed = 1

	draw_text(x1 + 32, y1 + 67 + 23 * 3, "Description:")
	a = song_desc
	song_desc = draw_textarea(4, x1 + 158, y1 + 64 + 23 * 3, 240, 100, song_desc, "Enter a description for your song.")
	if (a != song_desc) changed = 1

	draw_theme_color()
	draw_areaheader(x1 + 22, y1 + 268, 396, 85, "Playback")

	draw_text(x1 + 37, y1 + 285, "Time signature:")
	a = timesignature
	timesignature = median(2, draw_dragvalue(3, x1 + 135, y1 + 285, timesignature, 1), 8)
	if (a != timesignature) changed = 1
	draw_text(x1 + 135 + string_width(string(timesignature)), y1 + 285, " / 4")
	popup_set_window(x1 + 37, y1 + 283, 110, 18, "The time signature of the song.")

	a = loop
	if (draw_checkbox(x1 + 232, y1 + 285, loop, "Enable looping", "Whether to loop this song back to"+br+"the start at the end of playback.", false, true)) loop=!loop
	if (a != loop) changed = 1
	if (!loop) draw_set_color(c_gray)
	draw_text(x1 + 232, y1 + 305, "Loop start tick:")
	a = loopstart
	if (loop) {
		loopstart = median(0, draw_dragvalue(7, x1 + 320, y1 + 305, loopstart, 0.5), obj_controller.enda)
	} else {
		draw_text(x1 + 320, y1 + 305, loopstart)
	}
	if (a != loopstart) changed = 1

	draw_text(x1 + 232, y1 + 325, "Times to loop:")
	a = loopmax
	if (loop) {
		loopmax = median(0, draw_dragvalue(13, x1 + 320, y1 + 325, loopmax, 0.5), 10)
	} else {
		draw_text(x1 + 320, y1 + 325, loopmax)
	}
	if (loopmax = 0) draw_text(x1 + 340, y1 + 325, "(infinite)")
	if (a != loopmax) changed = 1
	timestoloop = loopmax
	draw_theme_color()

	if (draw_button2(x1 + 430 - 72, y1 + 366, 72, "OK") && (windowopen = 1 || theme != 3)) {windowclose = 1}
	window_set_cursor(curs)
	window_set_cursor(cr_default)
}
