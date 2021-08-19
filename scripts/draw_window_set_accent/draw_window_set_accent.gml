function draw_window_set_accent() {
	// draw_window_set_accent()
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	var x1, y1, e, dhsv, dr, dg, db, err
	curs = cr_default
	text_exists[0] = 0
	x1 = floor(rw / 2 - 140)
	y1 = floor(rh / 2 - 220) + windowoffset
	draw_window(x1, y1, x1 + 280, y1 + 440)
	draw_theme_font(font_main_bold)
	if (language != 1) draw_text_dynamic(x1 + 8, y1 + 8, "Set accent color")
	else draw_text_dynamic(x1 + 8, y1 + 8, "设置主题颜色")
	if (windowopen = 0) {
		r = accent1
		g = accent2
		b = accent3
		hsv = scr_RGBtoHSB(r, g, b)
		text_str[60] = string(r)
		text_str[61] = string(g)
		text_str[62] = string(b)
	}
	dhsv = scr_HSBtoRGB(hsv[0], hsv[1], hsv[2])
	err = 0
	draw_theme_font(font_main)
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
	}
	draw_sprite(spr_hsv, 0, x1 + 20, y1 + 43)
	draw_sprite_ext(spr_value, 0, x1 + 20, y1 + 43 + 225 + 10, 1, 1, 0, make_color_hsv((hsv[0] / 360) * 255, hsv[1] * 2.55, 255), draw_get_alpha())
	draw_set_color(make_color_rgb(r, g, b))
	draw_roundrect(x1 + 20 + 187 + 10, y1 + 42, x1 + 260, y1 + 42 + 112, 0)
	draw_set_color(accent[3])
	draw_roundrect(x1 + 20 + 187 + 10, y1 + 42 + 113, x1 + 260, y1 + 42 + 113 + 112, 0)
	draw_theme_color()
	draw_sprite(spr_radiobox, 18, x1 + 20 + floor(187 * (hsv[0] / 360)) - 5, y1 + 43 + 225 - floor(225 * (hsv[1] / 100)) - 5)
	draw_sprite(spr_radiobox, 21, x1 + 20 + floor(232 * (hsv[2] / 100)), y1 + 43 + 225 + 10 - 2)
	if (mouse_check_button(mb_left)) {
		if ((mouse_rectangle(x1 + 20, y1 + 43, 187, 225) && nocdrag = 0 && vdrag = 0) || hsdrag = 1) {
			hsv[0] = 360 - ((187 - (mouse_x - x1 - 20) + (mouse_x - x1 - 20) * (mouse_x < x1 + 20 || mouse_x >= x1 + 20 + 187) - 187 * (mouse_x >= x1 + 20 + 187)) / 187) * 360
			hsv[1] = ((225 - (mouse_y - y1 - 43) + (mouse_y - y1 - 43) * (mouse_y < y1 + 43 || mouse_y > y1 + 43 + 225) - 225 * (mouse_y > y1 + 43 + 225)) / 225) * 100
			dhsv = scr_HSBtoRGB(hsv[0], hsv[1], hsv[2])
			r = dhsv[0]
			g = dhsv[1]
			b = dhsv[2]
			text_str[60] = string(r)
			text_str[61] = string(g)
			text_str[62] = string(b)
			hsdrag = 1
		} else if ((mouse_rectangle(x1 + 20, y1 + 43 + 225 + 10, 240, 8) && nocdrag = 0 && hsdrag = 0) || vdrag = 1) {
			hsv[2] = 100 - ((240 - (mouse_x - x1 - 20) + (mouse_x - x1 - 20) * (mouse_x < x1 + 20 || mouse_x >= x1 + 20 + 240) - 240 * (mouse_x >= x1 + 20 + 240)) / 240) * 100
			dhsv = scr_HSBtoRGB(hsv[0], hsv[1], hsv[2])
			r = dhsv[0]
			g = dhsv[1]
			b = dhsv[2]
			text_str[60] = string(r)
			text_str[61] = string(g)
			text_str[62] = string(b)
			vdrag = 1
		} else if (hsdrag = 0 && vdrag = 0) {
			nocdrag = 1
		}
	} else {
		hsdrag = 0
		vdrag = 0
		nocdrag = 0
	}
	draw_theme_font(font_main)
	draw_set_halign(fa_center)
	draw_set_color(make_color_rgb(r, g, b))
	draw_rectangle(x1 + 20, y1 + 43 + 225 + 10 + 20, x1 + 141, y1 + 43 + 225 + 10 + 20 + 20, 0)
	draw_set_color(c_white)
	if (language != 1) draw_text_dynamic(x1 + 20 + 60, y1 + 43 + 225 + 10 + 20 + 4, "Preview")
	else draw_text_dynamic(x1 + 20 + 60, y1 + 43 + 225 + 10 + 20 + 4, "预览")
	draw_set_color(make_color_hsv((hsv[0] / 360) * 255, hsv[1] * 2.55, hsv[2] * 2.55 - hsv[2] * 2.55 * 0.5 * (hsv[1] >= 50) + hsv[2] * 2.55 * (hsv[1] < 50)))
	draw_rectangle(x1 + 142, y1 + 43 + 225 + 10 + 20, x1 + 260, y1 + 43 + 225 + 10 + 20 + 20, 0)
	draw_set_color(make_color_rgb(r, g, b))
	if (language != 1) draw_text_dynamic(x1 + 142 + 60, y1 + 43 + 225 + 10 + 20 + 4, "Preview")
	else draw_text_dynamic(x1 + 142 + 60, y1 + 43 + 225 + 10 + 20 + 4, "预览")
	draw_set_color(make_color_rgb(9, 9, 9))
	draw_rectangle(x1 + 20, y1 + 43 + 225 + 10 + 20 + 21, x1 + 141, y1 + 43 + 225 + 10 + 20 + 20 + 21, 0)
	draw_set_color(make_color_rgb(r, g, b))
	if (language != 1) draw_text_dynamic(x1 + 20 + 60, y1 + 43 + 225 + 10 + 20 + 4 + 21, "Preview")
	else draw_text_dynamic(x1 + 20 + 60, y1 + 43 + 225 + 10 + 20 + 4 + 21, "预览")
	draw_set_color(make_color_rgb(221, 221, 221))
	draw_rectangle(x1 + 142, y1 + 43 + 225 + 10 + 20 + 21, x1 + 260, y1 + 43 + 225 + 10 + 20 + 20 + 21, 0)
	draw_set_color(make_color_rgb(r, g, b))
	if (language != 1) draw_text_dynamic(x1 + 142 + 60, y1 + 43 + 225 + 10 + 20 + 4 + 21, "Preview")
	else draw_text_dynamic(x1 + 142 + 60, y1 + 43 + 225 + 10 + 20 + 4 + 21, "预览")
	draw_theme_color()
	draw_set_halign(fa_left)
	if (language != 1) draw_areaheader(x1 + 10, y1 + 353, 220, 35, "RGB color")
	else draw_areaheader(x1 + 10, y1 + 353, 220, 35, "RGB调色")

	if (language != 1) {
	dr = draw_textarea(60, x1 + 20, y1 + 360, 71, 25, string(r), "Set red amount.")
	dg = draw_textarea(61, x1 + 20 + 85, y1 + 360, 71, 25, string(g), "Set green amount.")
	db = draw_textarea(62, x1 + 20 + 170, y1 + 360, 71, 25, string(b), "Set blue amount.")
	} else {
	dr = draw_textarea(60, x1 + 20, y1 + 360, 71, 25, string(r), "设置红色值。")
	dg = draw_textarea(61, x1 + 20 + 85, y1 + 360, 71, 25, string(g), "设置绿色值。")
	db = draw_textarea(62, x1 + 20 + 170, y1 + 360, 71, 25, string(b), "设置蓝色值。")
	}
	if (dr != "" && dg != "" && db != "") {
		try {
			dr = real(dr)
			dg = real(dg)
			db = real(db)
		}
		catch(e) {
			err = 1
		}
		finally {
			if (!err) {
				r = dr
				g = dg
				b = db
				if (text_focus) hsv = scr_RGBtoHSB(r, g, b)
			}
		}
	}

	draw_theme_color()
	if (draw_button2(x1 + 10, y1 + 408, 72, condstr(language != 1, "OK", "确定")) && windowopen = 1) {
		try {
			accent1 = real(r)
			accent2 = real(g)
			accent3 = real(b)
			draw_accent_init()
			windowclose = 1
		}
		catch(e) {
			if (language != 1) message("Please enter a valid number!", "Set accent color")
			else message("请输入一个有效的数字！", "设置主题颜色")
		}
	}
	if (language != 1) {
	if (draw_button2(x1 + 104, y1 + 408, 72, "Cancel")) {windowclose = 1}
	if (draw_button2(x1 + 198, y1 + 408, 72, "Use default") && wmenu = 0) {
	    if (question("Are you sure?", "Confirm")) {
			accent1 = 0
			accent2 = 120
			accent3 = 215
			draw_accent_init()
			windowclose = 1
		}
	}
	} else {
	if (draw_button2(x1 + 104, y1 + 408, 72, "取消")) {windowclose = 1}
	if (draw_button2(x1 + 198, y1 + 408, 72, "使用默认值") && wmenu = 0) {
	    if (question("你确定吗？", "确定")) {
			accent1 = 0
			accent2 = 120
			accent3 = 215
			draw_accent_init()
			windowclose = 1
		}
	}
	}
	window_set_cursor(curs)
	if (array_length(text_mouseover) = 0) window_set_cursor(cr_default)
}
