function draw_window_mp3_export() {
	// draw_window_mp3_export()
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	var x1, y1
	curs = cr_default
	x1 = floor(rw / 2 - 125)
	y1 = floor(rh / 2 - 135) + windowoffset
	draw_window(x1, y1, x1 + 250, y1 + 270)
	draw_theme_font(font_main_bold)
	if (language != 1) draw_text_dynamic(x1 + 8, y1 + 8, "MP3 Export")
	else draw_text_dynamic(x1 + 8, y1 + 8, "导出MP3")
	draw_theme_font(font_main)

	if (theme != 3){
	draw_sprite(spr_mp3_exp, sch_exp_layout, x1 + 20, y1)
	} else {
	draw_sprite(spr_mp3_exp_f, fdark, x1 + 20, y1)
	}

	if (language != 1) {
	//Locked layers
	if (draw_checkbox(x1 + 16, y1 + 190, mp3_includelocked, "Include locked layers", "Whether to export locked layers in the MP3.", false, true)) mp3_includelocked= !mp3_includelocked
 
	//Submit button
	if (draw_button2(x1 + 165, y1 + 238, 72, "Export", false)) mp3_export()

	if (draw_button2(x1 + 10, y1 + 238, 72, "Cancel", false) && (windowopen = 1 || theme != 3)) {
		windowclose = 1
	}
	} else {
	if (draw_checkbox(x1 + 16, y1 + 190, mp3_includelocked, "包括已静音的层", "是否在MP3内包括已静音的层。", false, true)) mp3_includelocked= !mp3_includelocked
 
	if (draw_button2(x1 + 165, y1 + 238, 72, "导出", false)) mp3_export()

	if (draw_button2(x1 + 10, y1 + 238, 72, "取消", false) && (windowopen = 1 || theme != 3)) {
		windowclose = 1
	}
	}
	if (array_length(text_mouseover) = 0) window_set_cursor(cr_default)
}
