function draw_window_about() {
	// draw_window_stats()
	var x1, y1, a;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	x1 = floor(rw / 2 - 290)
	y1 = floor(rh / 2 - 200) + windowoffset
	draw_window(x1, y1, x1 + 580, y1 + 400)
	draw_theme_font(font_main)
	if (language != 1) draw_text_dynamic(x1 + 8, y1 + 8, "About")
	else draw_text_dynamic(x1 + 8, y1 + 8, "关于")
	draw_sprite_ext(spr_logo, 0, x1 + 86, y1 + 50, 0.55, 0.55, 0, c_white, draw_get_alpha())
	draw_set_halign(fa_center)
	draw_theme_font(font_info_med_bold)
	draw_text_dynamic(x1 + 150, y1 + 200, "Open Note Block Studio")
	draw_theme_font(font_main)
	if (language != 1) {
	if (RUN_FROM_IDE != 1){
		draw_text_dynamic(x1 + 150, y1 + 217, "Version Local Release" + "\n\nThis program is a continuation of\n Minecraft Note Block Studio, \ncreated by David Norgren. \n\nThis product is not affiliated with\nMojang Studios, Microsoft Studios\nor the game Minecraft.")
	} else {
		draw_text_dynamic(x1 + 150, y1 + 217, "Version " + version + " - Released " + version_date + "\n\nThis program is a continuation of\n Minecraft Note Block Studio, \ncreated by David Norgren. \n\nThis product is not affiliated with\nMojang Studios, Microsoft Studios\nor the game Minecraft.")
	}
	} else {
	if (RUN_FROM_IDE != 1){
		draw_text_dynamic(x1 + 150, y1 + 217, "本地版本" + "\n\n本程序是 Minecraft Note Block Studio 的延续版本\n原作者 David Norgren\n\n本产品与 Mojang Studios、\nMicrosoft Studios 以及\n游戏 Minecraft 无任何关联。")
	} else {
		draw_text_dynamic(x1 + 150, y1 + 217, "版本" + version + " - 发布于" + version_date + "\n\n本程序是 Minecraft Note Block Studio 的延续版本\n原作者 David Norgren\n\n本产品与 Mojang Studios、\nMicrosoft Studios 以及\n游戏 Minecraft 无任何关联。")
	}
	}
	draw_set_halign(fa_left)
	
	// Credits box
	var xx, yy, w, n, fullstr, str, strb, strurl;
	fullstr = creditsstr;
	xx = x1 + 300
	yy = y1 + 40
	w = 260
	draw_area(xx, yy, xx + w, yy + 305)
	n = string_count("\n", fullstr)
	for (a = 0; a < n; a += 1) {
	    str[a] = string_copy(fullstr, 1, string_pos("\n", fullstr) - 1)
	    strb[a] = 0
		strurl[a] = ""
	    if (string_char_at(str[a], 1) = "*") { // Title
			strb[a] = 1
			str[a] = string_delete(str[a], 1, 1);
		}
		if (string_pos("|", str[a]) > 0) { // Hyperlink
			var split = string_pos("|", str[a])
			strurl[a] = string_copy(str[a], split + 1, string_length(str[a]) - split)
			str[a] = string_copy(str[a], 1, split - 1)
		}
	    fullstr = string_delete(fullstr, 1, string_pos("\n", fullstr))
	}
	for (a = sb_val[credits_scrollbar]; a < sb_val[credits_scrollbar] + 18; a += 1) {
	    if (a >= n) break
		
		var xx2 = xx + (w/2)
		var yy2 = yy + 9 + 16 * (a - sb_val[credits_scrollbar])
		
	    if (strb[a]) {
			draw_theme_font(font_main_bold)
		} else {
			draw_theme_font(font_main)
		}
		draw_set_halign(fa_center)
		
		if (strurl[a] != "") {
			draw_text_url(xx2, yy2, str[a], strurl[a])
		} else {
			draw_text(xx2, yy2, str[a])
		}
	}
	draw_theme_font(font_main) 
	draw_scrollbar(credits_scrollbar, xx + w - 17, yy + 1, 15, 18, n, 0, 1)
	draw_set_halign(fa_left)
	// End credits box

	if (draw_button2(x1 + 332, y1 + 370, 72, "OK", false) && (windowopen = 1 || theme != 3)) {
		windowclose = 1
	}
	if (array_length(text_mouseover) = 0) window_set_cursor(cr_default)
}
