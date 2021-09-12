function draw_window_clip_editor() {
	// draw_window_clip_editor()
	var x1, y1; 
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	x1 = floor(rw / 2 - 220)
	y1 = floor(rh / 2 - 215) + windowoffset
	draw_window(x1, y1, x1 + 440, y1 + 430)
	draw_theme_font(font_main_bold)
	if (language != 1) draw_text_dynamic(x1 + 8, y1 + 8, "Secret Clipboard Editor")
	else draw_text_dynamic(x1 + 8, y1 + 8, "隐藏剪贴板编辑器")
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 1)
	}
	draw_theme_color()
	if (language != 1) draw_areaheader(x1 + 22, y1 + 48, 396, 330, "Clipboard")
	else draw_areaheader(x1 + 22, y1 + 48, 396, 330, "剪贴板")
	draw_theme_color()
	//text_exists[59] = 0
	selection_copied = draw_text_edit(59, selection_copied, x1 + 32, y1 + 23 * 3, 370, 300, 0, 0) 

	if (draw_button2(x1 + 320, y1 + 398, 72, condstr(language != 1, "OK", "确定")) && (windowopen = 1 || theme != 3)) {
		windowclose = 1
	}
	window_set_cursor(curs)
	if (array_length(text_mouseover) = 0) window_set_cursor(cr_default)
}
