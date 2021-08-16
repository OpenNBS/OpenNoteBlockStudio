function draw_window_preferences() {
	// draw_window_preferences()
	var x1, y1, a, b, c, as, stabx, stabw, nsel, str;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	nsel = -1
	x1 = floor(rw / 2 - 250)
	y1 = floor(rh / 2 - 255 + isplayer * 50) + windowoffset
	draw_window(x1, y1, x1 + 500, y1 + 510 - isplayer * 100)
	if (theme = 3){
	draw_set_color(15132390)
	if (fdark) draw_set_color(1513239)
	// draw_rectangle(x1+1,y1+30,x1+498,y1+69,0) //48
	draw_set_color(c_black)
	if (fdark) draw_set_color(c_white)
	}
	draw_set_font(fnt_mainbold)
		if (theme = 3) draw_theme_font(font_main)
	if (language != 1) draw_text_dynamic(x1 + 8 + (theme = 3) * 2, y1 + 8 + (theme = 3), "Preferences")
	else draw_text_dynamic(x1 + 8 + (theme = 3) * 2, y1 + 8 + (theme = 3), "首选项")
	draw_set_font(fnt_main)
		if (theme = 3) draw_theme_font(font_main)
	b = 8 + (theme = 3) * 32
	if (language != 1) {
	str[0] = "General"
	if (!isplayer) {
	str[1] = "Appearance"
	str[2] = "Usability"
	str[3] = "Playback"
	}
	} else {
	str[0] = "通用"
	if (!isplayer) {
	str[1] = "外观"
	str[2] = "访问"
	str[3] = "播放"
	}
	}
	if (theme = 3) {
		c = (mouse_check_button(mb_left))
		if (mouse_rectangle(x1, y1 + 30, 40, 40)) {
			draw_set_color(15395562)
			if (fdark) draw_set_color(4539717)
			if (c) {
				draw_set_color(15658734)
				if (fdark) draw_set_color(5789784)
			}
			draw_roundrect(x1 + 1, y1 + 31, x1 + 41, y1 + 67, 0)
			if (mouse_check_button_released(mb_left) && windowopen = 1) {
				if (windowsound && theme = 3) play_sound(soundgoback, 45, 100, 100, 0)
				windowclose = 1
			}
		}
		draw_sprite(spr_back, fdark + 2 * (c && mouse_rectangle(x1, y1 + 30, 40, 40)), x1 + 14, y1 + 30 + 12)
	}
	if (theme = 1) {
	    draw_window(x1 + 4, y1 + 45, x1 + 496, y1 + 474 - isplayer * 100)
	}
	if (theme != 3) {
	for (a = 0; a < array_length(str); a += 1) {
	    c = mouse_rectangle(x1 + b, y1 + 28, string_width(str[a]) + 12, 18)
	    if (selected_tab = a) {
	        stabx = b - 2
	        stabw = string_width(str[a]) + 15
	    } else {
			draw_sprite(spr_tabbuttons, 0 + 3 * c + 6 * theme, x1 + b, y1 + 28)
			draw_sprite_ext(spr_tabbuttons, 1 + 3 * c + 6 * theme, x1 + b + 2, y1 + 28, string_width(str[a]) / 2 + 4, 1, 0, -1, draw_get_alpha())
			draw_sprite(spr_tabbuttons, 2 + 3 * c + 6 * theme, x1 + b + string_width(str[a]) + 10, y1 + 28)	
	        draw_text_dynamic(x1 + b + 6, y1 + 30, str[a])
	    }
	    if (mouse_check_button_pressed(mb_left) && c) nsel = a
	    b += string_width(str[a]) + 12
	}
	if (theme = 0 || theme = 2 || theme = 3) {
	    draw_set_color(c_white)
		if(theme = 2) draw_set_color(c_dark)
	    if (theme != 3) draw_rectangle(x1 + 6, y1 + 46, x1 + 494, y1 + 472 - isplayer * 100, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    if (theme != 3) draw_rectangle(x1 + 6, y1 + 46, x1 + 494, y1 + 472 - isplayer * 100, 1)
	    draw_set_color(c_white)
		if(theme = 2 || (fdark && theme = 3)) draw_set_color(c_dark)
	    if (theme = 3) {
			draw_roundrect(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 25, 0)
		} else {
			draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 0)
		}
	    draw_set_color(make_color_rgb(137, 140, 149))
	    if (theme != 3) draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 1)
	    draw_set_color(c_white)
		if(theme = 2 || (fdark && theme = 3)) draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx + 1, y1 + 46, x1 + stabx + stabw - 1, y1 + 47, 0)
	    draw_theme_color()
	    draw_text_dynamic(x1 + stabx + 8, y1 + 28, str[selected_tab])
	    draw_set_color(make_color_rgb(213, 223, 229))
	    if(theme = 0) draw_roundrect(x1 + 10, y1 + 50, x1 + 490, y1 + 468 - isplayer * 100, 1)
	}else{
	    draw_sprite(spr_tabbuttons, 24, x1 + stabx - 1, y1 + 26)
	    draw_sprite_ext(spr_tabbuttons, 25, x1 + stabx + 1, y1 + 26, stabw / 2 - 1, 1, 0, -1, 1)
	    draw_sprite(spr_tabbuttons, 26, x1 + stabx + stabw - 1, y1 + 26)
	    draw_text_dynamic(x1 + stabx + 8, y1 + 28, str[selected_tab])
	}
	} else {
	draw_theme_font(font_med)
	for (a = 0; a < array_length(str); a += 1) {
		draw_set_color(c_black)
		if (fdark) draw_set_color(c_white)
	    c = mouse_rectangle(x1 + b, y1 + 28 + 21 - 19, string_width(str[a]) + 12, 18 + 21)
	    if (selected_tab = a) {
			draw_set_color(accent[7])
			if (fdark) draw_set_color(accent[8])
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 8, y1 + 30 + 21 + 18 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 8, y1 + 30 + 21 + 18 - 6)
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 8, y1 + 30 + 21 + 20 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 8, y1 + 30 + 21 + 20 - 6)
			draw_set_color(accent[6])
			if (fdark) draw_set_color(accent[2])
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 7, y1 + 30 + 21 + 18 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 7, y1 + 30 + 21 + 18 - 6)
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 8, y1 + 30 + 21 + 19 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 8, y1 + 30 + 21 + 19 - 6)
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 7, y1 + 30 + 21 + 20 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 7, y1 + 30 + 21 + 20 - 6)
			draw_set_color(accent[4])
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 6, y1 + 30 + 21 + 18 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 6, y1 + 30 + 21 + 18 - 6)
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 7, y1 + 30 + 21 + 19 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 7, y1 + 30 + 21 + 19 - 6)
	        draw_line(x1 + b + 5 + string_width(str[a]) / 2 - 6, y1 + 30 + 21 + 20 - 6, x1 + b + 5 + string_width(str[a]) / 2 + 6, y1 + 30 + 21 + 20 - 6)
			draw_set_color(c_black)
			if (fdark) draw_set_color(c_white)
	    }
		if (mouse_check_button(mb_left) && c) {
			// draw_sprite(spr_tabbuttons_f, 6 + 9 * fdark, x1 + b, y1 + 28 + 21 - 19)
			// draw_sprite_ext(spr_tabbuttons_f, 7 + 9 * fdark, x1 + b + 2, y1 + 28 + 21 - 19, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
			// draw_sprite(spr_tabbuttons_f, 8 + 9 * fdark, x1 + b + string_width(str[a]) + 10, y1 + 28 + 21 - 19)	
			draw_set_color(7631988)
			if (fdark) draw_set_color(11579568)
			if (selected_tab = a) draw_set_color(10000536)
			if (selected_tab = a && fdark) draw_set_color(10724259)
		} else if (c) {
			// draw_sprite(spr_tabbuttons_f, 0 + 3 * c + 9 * fdark, x1 + b, y1 + 28 + 21 - 19)
			// draw_sprite_ext(spr_tabbuttons_f, 1 + 3 * c + 9 * fdark, x1 + b + 2, y1 + 28 + 21 - 19, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
			// draw_sprite(spr_tabbuttons_f, 2 + 3 * c + 9 * fdark, x1 + b + string_width(str[a]) + 10, y1 + 28 + 21 - 19)	
			if (selected_tab = a) draw_set_color(7631988)
			if (selected_tab = a && fdark) draw_set_color(11579568)
		}
	    draw_text_dynamic(x1 + b + 6, y1 + 30 + 21 - 8, str[a])
	    if (mouse_check_button_released(mb_left) && c) nsel = a
	    b += string_width(str[a]) + 12
	}
	}
	if (nsel > -1) selected_tab = nsel
	selected_tab += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	if (selected_tab < 0) selected_tab = 3
	if (selected_tab > 3) selected_tab = 0
	draw_theme_color()
	if (selected_tab = 0) {
		if (theme = 3) draw_theme_font(font_info_med)
	    if (language != 1) draw_areaheader(x1 + 22, y1 + 74 + (theme = 3) * 22, 218, 65, "Startup")
	    else draw_areaheader(x1 + 22, y1 + 74 + (theme = 3) * 22, 218, 65, "启动")
		if (theme = 3) draw_theme_font(font_main)
		if (language != 1) {
			if (draw_checkbox(x1 + 40, y1 + 90 + (theme = 3) * 22, show_welcome, "Show greeting window", "Whether to show the greeting window\nwhen the program is opened.", false, true)) show_welcome=!show_welcome
		} else { 
			if (draw_checkbox(x1 + 40, y1 + 90 + (theme = 3) * 22, show_welcome, "显示欢迎界面", "打开软件时是否显示欢迎界面。", false, true)) show_welcome=!show_welcome
		}
		if (language != 1) {
	    if (RUN_FROM_IDE != 1) {
			draw_checkbox(x1 + 40, y1 + 110 + (theme = 3) * 22, check_update, "Check for updates", "This option is disabled because\nyou're running from the IDE.", true, true)
		} else {
			if (draw_checkbox(x1 + 40, y1 + 110 + (theme = 3) * 22, check_update, "Check for updates", "Whether to check for any updates\nwhen the program is opened.", false, true)) check_update=!check_update
		}	
		} else {
		if (RUN_FROM_IDE != 1) {
			draw_checkbox(x1 + 40, y1 + 110 + (theme = 3) * 22, check_update, "检查更新", "由于在IDE内运行，此选项已禁用。", true, true)
		} else {
			if (draw_checkbox(x1 + 40, y1 + 110 + (theme = 3) * 22, check_update, "检查更新", "打开软件时是否检查更新。", false, true)) check_update=!check_update
		}	
		}
		// Auto-saving
		if (!isplayer) {
		if (theme = 3) draw_theme_font(font_info_med)
		if (language != 1) draw_areaheader(x1 + 258, y1 + 74 + (theme = 3) * 22, 220, 65, "Auto-saving")
		else draw_areaheader(x1 + 258, y1 + 74 + (theme = 3) * 22, 220, 65, "自动保存")
		if (theme = 3) draw_theme_font(font_main)
		as = autosave
		if (language != 1) {if (draw_checkbox(x1 + 276, y1 + 90 + (theme = 3) * 22, autosave, "Enable auto-saving", "Whether the song should automatically\nbe saved every now and then.", false, true)) autosave=!autosave}
		else {if (draw_checkbox(x1 + 276, y1 + 90 + (theme = 3) * 22, autosave, "启用自动保存", "歌曲是否每过一段时间自动保存一次。", false, true)) autosave=!autosave}
		if (as != autosave) {
		    changed = 1
		    if (autosave = 0) tonextsave = 0
		    if (autosave = 1) tonextsave = autosavemins
		}
		if (autosave = 0) {
		    draw_set_color(c_gray)
		    if (language != 1) draw_text_dynamic(x1 + 306, y1 + 110 + (theme = 3) * 22, "Interval:       minute" + condstr(autosavemins > 1, "s"))
		    else draw_text_dynamic(x1 + 306, y1 + 110 + (theme = 3) * 22, "间隔:            分钟")
			draw_text_dynamic(x1 + 355, y1 + 110 + (theme = 3) * 22, autosavemins)
		    draw_theme_color()
		} else {
			if (language != 1) draw_text_dynamic(x1 + 306, y1 + 110 + (theme = 3) * 22, "Interval:       minute" + condstr(autosavemins > 1, "s"))
		    else draw_text_dynamic(x1 + 306, y1 + 110 + (theme = 3) * 22, "间隔:            分钟")
			as = autosavemins
			autosavemins = median(1, draw_dragvalue(2, x1 + 355, y1 + 110 + (theme = 3) * 22, autosavemins, 1), 60)
			if (autosavemins != a) {changed = 1 tonextsave = autosavemins}
		}
		if (language != 1) popup_set_window(x1 + 306, y1 + 110 + (theme = 3) * 22, 180, 16, "The amount of minutes between each auto-save.")
		else popup_set_window(x1 + 306, y1 + 110 + (theme = 3) * 22, 180, 16, "自动保存中间的间隔。")
		}
	
		if (theme = 3) draw_theme_font(font_info_med)
	    if (language != 1) draw_areaheader(x1 + 22, y1 + 164 + (theme = 3) * 22, 218, 120, "Theme")
	    else draw_areaheader(x1 + 22, y1 + 164 + (theme = 3) * 22, 218, 120, "主题")
		if (theme = 3) draw_theme_font(font_main)
		draw_area(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 5, x1 + 140, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 5)
		if (draw_abutton(x1 + 140 - 17, y1 + 164 + 17 + (theme = 3) * 22 + 5) && wmenu = 0) {
	        if (language != 1) menu = show_menu_ext("theme", x1 + 40, y1 + 164 + 16 + 21 + (theme = 3) * 22 + 5, check(theme = 0) + "Aqua|" + check(theme = 2) + "Dark|" + check(theme = 1) + "90s|" + check(theme = 3) + "Fluent")
	        else menu = show_menu_ext("theme", x1 + 40, y1 + 164 + 16 + 21 + (theme = 3) * 22 + 5, check(theme = 0) + "经典|" + check(theme = 2) + "暗黑|" + check(theme = 1) + "复古|" + check(theme = 3) + "Fluent")
	    }
		if (language != 1) {if (theme = 3) popup_set_window(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 5, 100, 20, "Press Ctrl + Shift + M in the main screen to set accent color.")}
		else {if (theme = 3) popup_set_window(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 5, 100, 20, "在主界面按 Ctrl + Shift + M 设定主题颜色。")}
	    if (language != 1) draw_text_dynamic(x1 + 43, y1 + 164 + 19 + (theme = 3) * 22 + 5, condstr(theme = 0, "Aqua") + condstr(theme = 2, "Dark") + condstr(theme = 1, "90s") + condstr(theme = 3, "Fluent"))
	    else draw_text_dynamic(x1 + 43, y1 + 164 + 19 + (theme = 3) * 22 + 5, condstr(theme = 0, "经典") + condstr(theme = 2, "暗黑") + condstr(theme = 1, "复古") + condstr(theme = 3, "Fluent"))
	    //if (draw_radiobox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16, theme == 0, "Aqua", "Use the aqua theme.")) {theme = 0 change_theme()}
		//if (draw_radiobox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20, theme == 2, "Dark", "Use the dark theme.")) {theme = 2 change_theme()}
	    //if (draw_radiobox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 20, theme == 1, "90s", "Use the 90s theme.")) {theme = 1 change_theme()}
	    //if (draw_radiobox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 20 + 20, theme == 3, "Fluent", "Use the fluent theme.")) {theme = 3 change_theme()}
		if (language != 1) {
		if (!isplayer) if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 20 + 20 + 25, blackout, "Blackout mode", "Makes the workspace background solid black, so you can\nkey it out in your video editor when recording the screen.", false, true)) blackout = !blackout
		if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 20 + 25, windowsound, "Navigation sound", "Activate sound when navigating in the Fluent theme.", (theme != 3), true)) windowsound = !windowsound
		if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 25, fdark, "Dark mode", "The dark color mode for the Fluent theme.", (theme != 3), true)) fdark = !fdark
		} else {
		if (!isplayer) if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 20 + 20 + 25, blackout, "全黑模式", "使背景变为纯黑色，用于剪辑时扣掉。", false, true)) blackout = !blackout
		if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 20 + 25, windowsound, "界面音效", "在Fluent主题时的界面音效。", (theme != 3), true)) windowsound = !windowsound
		if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 25, fdark, "暗色模式", "Fluent主题的暗色模式。", (theme != 3), true)) fdark = !fdark
		}
		//if (theme = 3) draw_text_dynamic(x1 + 40 + 100, y1 + (theme = 3) * 22 + 164 + 15, "Color")
		//if (theme = 3) {
		//	if (draw_radiobox(x1 + 40 + 100, y1 + (theme = 3) * 22 + 164 + 16 + 20, !fdark, "Light", "Use the light mode.")) fdark = 0
		//	if (draw_radiobox(x1 + 40 + 100, y1 + (theme = 3) * 22 + 164 + 16 + 20 + 20, fdark, "Dark", "Use the dark mode.")) fdark = 1
		//}
		if (theme = 3) draw_theme_font(font_info_med)
	    if (language != 1) draw_areaheader(x1+258,y1+164 + (theme = 3) * 22,220,60,"Max frame rate (experimental)")
	    else draw_areaheader(x1+258,y1+164 + (theme = 3) * 22,220,60,"帧率限制（实验性功能）")
		if (theme = 3) draw_theme_font(font_main)
		draw_area(x1 + 274, y1 + 164 + 16 + (theme = 3) * 22 + 5, x1 + 374, y1 + 164 + 16 + 20 + (theme = 3) * 22 + 5)
		if (draw_abutton(x1 + 374 - 17, y1 + 164 + 17 + (theme = 3) * 22 + 5) && wmenu = 0) {
	        if (language != 1) menu = show_menu_ext("refreshrate", x1 + 274, y1 + 164 + 16 + 21 + (theme = 3) * 22 + 5, check(refreshrate = 0) + "30FPS|" + check(refreshrate = 1) + "60FPS|" + check(refreshrate = 2) + "120FPS|" + check(refreshrate = 3) + "144FPS|" + check(refreshrate = 4) + "Unlimited")
	        else menu = show_menu_ext("refreshrate", x1 + 274, y1 + 164 + 16 + 21 + (theme = 3) * 22 + 5, check(refreshrate = 0) + "30帧|" + check(refreshrate = 1) + "60帧|" + check(refreshrate = 2) + "120帧|" + check(refreshrate = 3) + "144帧|" + check(refreshrate = 4) + "无限")
	    }
	    if (language != 1) draw_text_dynamic(x1 + 277, y1 + 164 + 19 + (theme = 3) * 22 + 5, condstr(refreshrate = 0, "30FPS") + condstr(refreshrate = 1, "60FPS") + condstr(refreshrate = 2, "120FPS") + condstr(refreshrate = 3, "144FPS") + condstr(refreshrate = 4, "Unlimited"))
	    else draw_text_dynamic(x1 + 277, y1 + 164 + 19 + (theme = 3) * 22 + 5, condstr(refreshrate = 0, "30帧") + condstr(refreshrate = 1, "60帧") + condstr(refreshrate = 2, "120帧") + condstr(refreshrate = 3, "144帧") + condstr(refreshrate = 4, "无限"))
		if (wmenu = 1 && !mouse_check_button(mb_left)) wmenu = 0
	    //if (draw_radiobox(x1+274,y1+164+16 + (theme = 3) * 22,refreshrate == 0,"30FPS","Run the program at 30FPS.")) {
	    //    game_set_speed(30,gamespeed_fps)
		//	refreshrate=0
	    //}
	    //if (draw_radiobox(x1+274,y1+164+16+20 + (theme = 3) * 22,refreshrate == 1,"60FPS","Run the program at 60FPS.")) {
	    //    game_set_speed(60,gamespeed_fps)
		//	refreshrate=1
	    //}
		//if (draw_radiobox(x1+274+64-6,y1+164+16 + (theme = 3) * 22,refreshrate == 2,"120FPS","Run the program at 120FPS.")) {
		//	game_set_speed(120,gamespeed_fps)
		//	refreshrate=2
		//}
		//if (draw_radiobox(x1+274+64-6,y1+164+16+20 + (theme = 3) * 22,refreshrate == 3,"144FPS","Run the program at 144FPS.")) {
		//	game_set_speed(144,gamespeed_fps)
		//	refreshrate=3
		//}
		//if (draw_radiobox(x1+274+128-6,y1+164+16+10 + (theme = 3) * 22,refreshrate == 4,"Unlimited","Run the program with unlimited FPS.\nMay cause very high CPU usage. Use this option with caution!")) {
		//	game_set_speed(114514,gamespeed_fps)
		//	refreshrate=4
		//}

		if (theme = 3) draw_theme_font(font_info_med)
		if (language != 1) draw_areaheader(x1 + 258, y1 + 240 + (theme = 3) * 22, 220, 44, "Window")
		else draw_areaheader(x1 + 258, y1 + 240 + (theme = 3) * 22, 220, 44, "窗口")
		if (theme = 3) draw_theme_font(font_main)
		if (language != 1) draw_text_dynamic(x1 + 276, y1 + 256 + (theme = 3) * 22, "Scale:             %")
		else draw_text_dynamic(x1 + 276, y1 + 256 + (theme = 3) * 22, "缩放:              %")
		window_scale = median(50, draw_dragvalue(19, x1 + 322, y1 + 256 + (theme = 3) * 22, window_scale * 100, (1/power(window_scale, 2)) ), 400) / 100
		if (language != 1) {
		if (draw_button2(x1 + 394, y1 + 251 + (theme = 3) * 22, 72, "Reset", (window_scale == get_default_window_scale()))) {
			window_scale = get_default_window_scale()
		}
		} else {
		if (draw_button2(x1 + 394, y1 + 251 + (theme = 3) * 22, 72, "重置", (window_scale == get_default_window_scale()))) {
			window_scale = get_default_window_scale()
		}
		}
		if (theme != 3 || (theme != 2 && !fdark)) draw_set_color(c_black)
		else draw_set_color(c_white)
		
		if (!isplayer) {
		if (theme = 3) draw_theme_font(font_info_med)
		if (language != 1) draw_areaheader(x1 + 22, y1 + 309 + (theme = 3) * 22, 456, 145, "Songs")
		else draw_areaheader(x1 + 22, y1 + 309 + (theme = 3) * 22, 456, 145, "歌曲")
		if (theme = 3) draw_theme_font(font_main)
		if (language != 1) {
		if (draw_checkbox(x1 + 40, y1 + 325 + (theme = 3) * 22, show_oldwarning, "Show warning when opening older songs", "Whether to show a warning when opening a song\nsaved in an older version of Note Block Studio.", false, true)) show_oldwarning = !show_oldwarning
		draw_text_dynamic(x1 + 40, y1 + 355 + (theme = 3) * 22, "Song folder: " + string_truncate(songfolder, 340))
	    popup_set_window(x1 + 40, y1 + 355 + (theme = 3) * 22, 430, 18, songfolder)
	    if (draw_button2(x1 + 40, y1 + 371 + (theme = 3) * 22, 76, "Open", 0, 1)) {
	        if (!directory_exists_lib(songfolder)) {
	            message("The indicated folder doesn't exist!", "Error")
	        } else {
	            open_url(songfolder)
	        }
	    }
	    if (draw_button2(x1 + 40 + 84, y1 + 371 + (theme = 3) * 22, 76, "Change", 0, 1)) {
	        message("Select the directory where saving/loading should be opened in.", "")
	        a = string(get_save_filename_ext("", "Select song folder", songfolder, "Song folder"))
	        if (a != "") songfolder = filename_dir(a)
	    }
	    if (draw_button2(x1 + 40 + 84 + 84, y1 + 371 + (theme = 3) * 22, 96, "Use default", 0, 1)) songfolder = songs_directory
	
		draw_text_dynamic(x1 + 40, y1 + 405 + (theme = 3) * 22, "Pattern folder: " + string_truncate(patternfolder, 340))
	    popup_set_window(x1 + 40, y1 + 405 + (theme = 3) * 22, 430, 18, patternfolder)
	    if (draw_button2(x1 + 40, y1 + 421 + (theme = 3) * 22, 76, "Open", 0, 1)) {
	        if (!directory_exists_lib(patternfolder)) {
	            message("The indicated folder doesn't exist!", "Error")
	        } else {
	            open_url(patternfolder)
	        }
	    }
	    if (draw_button2(x1 + 40 + 84, y1 + 421 + (theme = 3) * 22, 76, "Change", 0, 1)) {
	        message("Select the directory where patterns can be imported/exported to.", "")
	        a = string(get_save_filename_ext("", "Select patterns folder", patternfolder, "Pattern folder"))
	        if (a != "") patternfolder = filename_dir(a)
	    }
	    if (draw_button2(x1 + 40 + 84 + 84, y1 + 421 + (theme = 3) * 22, 96, "Use default", 0, 1)) patternfolder = pattern_directory
		} else {
		if (draw_checkbox(x1 + 40, y1 + 325 + (theme = 3) * 22, show_oldwarning, "打开旧版格式时提示", "打开在旧版Note Block Studio中保存的文件时是否显示警告。", false, true)) show_oldwarning = !show_oldwarning
		draw_text_dynamic(x1 + 40, y1 + 355 + (theme = 3) * 22, "歌曲路径: " + string_truncate(songfolder, 340))
	    popup_set_window(x1 + 40, y1 + 355 + (theme = 3) * 22, 430, 18, songfolder)
	    if (draw_button2(x1 + 40, y1 + 371 + (theme = 3) * 22, 76, "打开", 0, 1)) {
	        if (!directory_exists_lib(songfolder)) {
	            message("该路径不存在！", "错误")
	        } else {
	            open_url(songfolder)
	        }
	    }
	    if (draw_button2(x1 + 40 + 84, y1 + 371 + (theme = 3) * 22, 76, "修改", 0, 1)) {
	        message("选择保存和打开的文件夹", "")
	        a = string(get_save_filename_ext("", "选择歌曲文件夹", songfolder, "歌曲文件夹"))
	        if (a != "") songfolder = filename_dir(a)
	    }
	    if (draw_button2(x1 + 40 + 84 + 84, y1 + 371 + (theme = 3) * 22, 96, "还原默认", 0, 1)) songfolder = songs_directory
	
		draw_text_dynamic(x1 + 40, y1 + 405 + (theme = 3) * 22, "片段路径: " + string_truncate(patternfolder, 340))
	    popup_set_window(x1 + 40, y1 + 405 + (theme = 3) * 22, 430, 18, patternfolder)
	    if (draw_button2(x1 + 40, y1 + 421 + (theme = 3) * 22, 76, "打开", 0, 1)) {
	        if (!directory_exists_lib(patternfolder)) {
	            message("该路径不存在！", "错误")
	        } else {
	            open_url(patternfolder)
	        }
	    }
	    if (draw_button2(x1 + 40 + 84, y1 + 421 + (theme = 3) * 22, 76, "修改", 0, 1)) {
	        message("选择导出和导入片段的文件夹", "")
	        a = string(get_save_filename_ext("", "选择片段文件夹", patternfolder, "片段文件夹"))
	        if (a != "") patternfolder = filename_dir(a)
	    }
	    if (draw_button2(x1 + 40 + 84 + 84, y1 + 421 + (theme = 3) * 22, 96, "还原默认", 0, 1)) patternfolder = pattern_directory
		}
		}
	} else if (selected_tab = 1) {
		if (theme = 3) draw_theme_font(font_info_med)
	    draw_areaheader(x1 + 22, y1 + 74 + (theme = 3) * 22, 456, 196, "Note blocks")
		if (theme = 3) draw_theme_font(font_main)
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 90, use_colors, "Use colored note blocks", "If the instruments should be identified with\ndifferent colors.")) use_colors=!use_colors
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 110, use_icons, "Show instrument icons", "If the instruments should be identified with\ntheir respective icons.")) use_icons=!use_icons
		if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 130, use_shapes, "Use different shapes for each instrument", "If the instruments should be identified\nwith different shapes.")) use_shapes=!use_shapes
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 160, show_numbers, "Show key numbers", "Whether to show the amount of right-clicks required\nfor each note block.")) show_numbers=!show_numbers
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 180, show_octaves, "Show octave numbers", "Whether the number of the octave the note block\nis in should be shown.")) show_octaves=!show_octaves
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 200, show_incompatible, "Highlight incompatible note blocks", "Whether to show a red outline on note blocks with\ncustom instruments or outside the 2 octave range.")) show_incompatible=!show_incompatible
		if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 220, fade, "No fading", "Disables transparency animations on note block sprites")) fade = !fade
		if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 240, show_layers, "Show layer boxes", "Whether the layer boxes should be\nshown to the right of the workspace.")) show_layers = !show_layers
		if (theme = 3) draw_theme_font(font_info_med)
	    draw_areaheader(x1 + 22, y1 + 294 + (theme = 3) * 22, 456, 171, "Piano")
		if (theme = 3) draw_theme_font(font_main)
		if (draw_checkbox(x1 + 40, y1 + 310 + (theme = 3) * 22, show_piano, "Enable piano", "Whether the piano should be visible.", false, true)) show_piano = !show_piano
		if (draw_checkbox(x1 + 40, y1 + 355 + (theme = 3) * 22, show_keynames, "Show key names", "If the names of the keys should be shown.")) show_keynames=!show_keynames
	    if (draw_checkbox(x1 + 40, y1 + 375 + (theme = 3) * 22, show_keynumbers, "Show key numbers", "Whether to show the amount of right-clicks required\non each key inside the 2 octave range.")) show_keynumbers=!show_keynumbers
	    if (draw_checkbox(x1 + 40, y1 + 395 + (theme = 3) * 22, show_keyboard, "Show keyboard shortcuts", "Show the keyboard shortcuts of the keys.")) show_keyboard=!show_keyboard
	    if (draw_checkbox(x1 + 40, y1 + 415 + (theme = 3) * 22, show_notechart, "Show note chart when hovering over keys", "Whether to show a note chart\nwhen hovering over the keys.")) show_notechart=!show_notechart
	    if (draw_checkbox(x1 + 40, y1 + 435 + (theme = 3) * 22, show_outofrange, "Highlight out-of-range keys", "Whether to show a red tint on keys\noutside of the 2 octave range.")) show_outofrange=!show_outofrange
	    if (!show_piano) draw_set_color(c_gray)
		draw_text_dynamic(x1 + 70, y1 + 330 + (theme = 3) * 22, "Keys to show:")
		if (show_piano) {
			keysmax = median(20, draw_dragvalue(4, x1 + 150, y1 + 330 + (theme = 3) * 22, keysmax, 2), 50)
		} else {
			draw_text_dynamic(x1 + 150, y1 + 330 + (theme = 3) * 22, keysmax)
		}
		draw_theme_color()
	    popup_set_window(x1 + 180, y1 + 275 + (theme = 3) * 22, 150, 21, "The amount of keys to show. A high number may\nslow down the program on old computers.")
	} else if (selected_tab = 2) {
		if (theme = 3) draw_theme_font(font_info_med)
	    draw_areaheader(x1 + 22, y1 + 74 + (theme = 3) * 22, 456, 120, "Mouse wheel")
		if (theme = 3) draw_theme_font(font_main)
	    if (draw_radiobox(x1 + 40, y1 + 90 + (theme = 3) * 22, mousewheel = 0, "Use mouse wheel to scroll through the song", "Use the mouse wheel to scroll through\nthe song horizontally or vertically.")) mousewheel = 0
	    if (draw_radiobox(x1 + 40, y1 + 110 + (theme = 3) * 22, mousewheel = 1, "Use mouse wheel to change instrument", "Use the mouse wheel to toggle between\nthe available instruments.")) mousewheel = 1
	    if (draw_radiobox(x1 + 40, y1 + 130 + (theme = 3) * 22, mousewheel = 2, "Use mouse wheel to change key", "Use the mouse wheel to toggle\nbetween the keys on the piano.")) mousewheel = 2
	    if (draw_checkbox(x1 + 40, y1 + 158 + (theme = 3) * 22, changepitch, "Change note properties when scrolling over notes", "Whether scrolling when hovering over a note should change its key,\nvelocity, panning or pitch, according to the currently selected edit mode.")) changepitch=!changepitch
		//draw_text_dynamic(x1 + 40, y1 + 178, "Tip: Hold Shift while scrolling over a note to change a whole octave,\nor fine-tune its velocity, panning or pitch.")
		if (theme = 3) draw_theme_font(font_info_med)
	    draw_areaheader(x1 + 22, y1 + 220 + (theme = 3) * 22, 456, 105, "Piano")
		if (theme = 3) draw_theme_font(font_main)
	    if (draw_checkbox(x1 + 40, y1 + 236 + (theme = 3) * 22, select_lastpressed, "Set selected key to pressed one", "If the selected key should be set\nto the one pressed using the keyboard.")) select_lastpressed=!select_lastpressed
	    draw_text_dynamic(x1 + 40, y1 + 270 + (theme = 3) * 22, "Right-click on keys to change their shortcuts.")
	    if (draw_button2(x1 + 40, y1 + 290 + (theme = 3) * 22, 160, "Reset key shortcuts")) {
	        if (question("Are you sure?", "Confirm")) init_keys()
	    }
		if (theme = 3) draw_theme_font(font_info_med)
		draw_areaheader(x1 + 22, y1 + 290 + 62 + (theme = 3) * 22, 456, 65, "Discord")
		if (theme = 3) draw_theme_font(font_main)
		if (draw_checkbox(x1 + 40, y1 + 290 + 62 + 16 + (theme = 3) * 22, presence, "Enable Discord Rich Presence", "Displays info about your current\nsong in your Discord profile.", 0, 1)) {
		    presence = !presence
			if (presence = 1) {
				np_setpresence_timestamps(date_current_datetime(), 0, false);
			}
		}
	} else if (selected_tab = 3) {
		if (theme = 3) draw_theme_font(font_info_med)
	    draw_areaheader(x1 + 22, y1 + 74 + (theme = 3) * 22, 456, 125, "Marker")
		if (theme = 3) draw_theme_font(font_main)
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 90, marker_follow, "Follow marker when playing", "Automatically scroll along with the\nmarker when playing the song.")) marker_follow=!marker_follow
	    if (draw_radiobox(x1 + 70, y1 + (theme = 3) * 22 + 110, marker_pagebypage, "Page by page", "Scroll with the marker every page.", !marker_follow)) marker_pagebypage = 1
	    if (draw_radiobox(x1 + 70, y1 + (theme = 3) * 22 + 130, !marker_pagebypage, "Tick by tick", "Scroll with the marker every tick.", !marker_follow)) marker_pagebypage = 0
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 150, marker_start, "Start playing in section", "Whether to always start playing\nat the start of the active section.")) marker_start=!marker_start
	    if (draw_checkbox(x1 + 40, y1 + (theme = 3) * 22 + 170, marker_end, "Stop playing after section", "Whether to stop playing when the\nmarker passes the active section.")) marker_end=!marker_end
		if (theme = 3) draw_theme_font(font_info_med)
	    draw_areaheader(x1 + 22, y1 + 224 + (theme = 3) * 22, 218, 120, "Playing")
		if (theme = 3) draw_theme_font(font_main)
	    if (draw_checkbox(x1 + 32, y1 + 224 + 16 + (theme = 3) * 22, realvolume, "Show layer volumes", "Whether to show the volume of layers.")) realvolume=!realvolume
		if (draw_checkbox(x1 + 32, y1 + 244 + 16 + (theme = 3) * 22, realstereo, "Disable stereo", "Disables stereo playback.")) realstereo = !realstereo
		if (draw_checkbox(x1 + 32, y1 + 264 + 16 + (theme = 3) * 22, looptobarend, "Loop to bar end", "Loops to the end of the bar/measure.")) looptobarend = !looptobarend
		if (draw_checkbox(x1 + 32, y1 + 284 + 16 + (theme = 3) * 22, show_soundcount, "Show number of active sounds", "Displays the number of sounds that are\ncurrently playing in the status bar.")) show_soundcount = !show_soundcount
		if (draw_checkbox(x1 + 32, y1 + 304 + 16 + (theme = 3) * 22, channelstoggle, "More audio channels", "Increase the amount of sounds that can\nplay at once.")) channelstoggle = !channelstoggle
		if (theme = 3) draw_theme_font(font_info_med)
		draw_areaheader(x1 + 233 + 22, y1 + 224 + (theme = 3) * 22, 223, 60, "Tempo unit")
		if (theme = 3) draw_theme_font(font_main)
		if (draw_radiobox(x1 + 233 + 32, y1 + 224 + 16 + (theme = 3) * 22, !use_bpm, "Ticks per second (t/s)", "Display song tempos in ticks per second.")) use_bpm = 0
		if (draw_radiobox(x1 + 233 + 32, y1 + 244 + 16 + (theme = 3) * 22, use_bpm, "Beats per minute (BPM)", "Display song tempos in beats per minute.")) use_bpm = 1
	}
	if (draw_button2(x1 + 420, y1 + 478 - isplayer * 100, 72, "OK")) {
		if (theme != 3) {
			window = 0
			window_set_cursor(curs)
			save_settings()
		} else {
			if (windowopen = 1) windowclose = 1
		}
	}
}
