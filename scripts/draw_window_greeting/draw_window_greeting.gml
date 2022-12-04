function draw_window_greeting() {
	// draw_window_greeting()
	var x1, y1, a, b, c, d, e, m;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	x1 = floor(rw / 2 - 350)
	y1 = floor(rh / 2 - 210) + windowoffset
	draw_window(x1, y1, x1 + 700, y1 + 430)
	draw_sprite_ext(spr_logo, window_icon, x1 + 64, y1 + 50, 1, 1, 0, c_white, draw_get_alpha())
	draw_theme_font(font_info_med_bold)
	draw_text_center(x1 + 132, y1 + 213, "Open Note Block Studio")
	draw_theme_font(font_main_bold)
	var dev_label_offset = (is_prerelease) ? 15 : 0
	if (RUN_FROM_IDE != 1) {
		if (language != 1) draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "Running from the GameMaker IDE.")
		else draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "在 IDE 中运行")	
	} else if (check_update) {
		if (update_success) {
	        draw_set_color(c_lime)
			if (language != 1) draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "Successfully updated!")
	        else draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "更新成功！")
	    } else {
		    if (update = -1) {
		        draw_set_color(c_red)
				if (language != 1) draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "Could not check for updates")
		        else draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "检查更新失败")
		    }
		    else if (update = 0) {
		        //draw_set_color(c_gray)
				if (language != 1) draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "Checking for updates...")
		        else draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "正在检查更新……")
		    }
		    else if (update = 1) {
		        draw_set_color(33023)
				if (language != 1) draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "There is an update available!")
		        else draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "有新版本！")
		    }
		    else if (update = 2) {
		        draw_set_color(c_green)
				if (theme == 2) draw_set_color(c_lime)
				if (language != 1) draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "You are using the latest version!")
		        else draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "已为最新版本！")
		    }
		}
	} else {
	    draw_set_color(c_red)
		if (language != 1) draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "Update checking disabled by user")
	    else draw_text_center(x1 + 132, y1 + 248 + dev_label_offset, "检查更新未开启")
	}
	draw_theme_font(font_main)
	draw_theme_color()
	if (RUN_FROM_IDE != 1) {
		if (language != 1) draw_text_center(x1 + 132, y1 + 233, "Version Local Release")
		else draw_text_center(x1 + 132, y1 + 233, "本地版本")
	} else {
		if (language != 1) draw_text_center(x1 + 132, y1 + 233, "Version " + version + " - Released " + version_date)
		else draw_text_center(x1 + 132, y1 + 233, "版本 " + version + " - 发布于 " + version_date)
	}
	if (is_prerelease) {
		if (language != 1) draw_text_center(x1 + 132, y1 + 248, "(Development version)")
		else draw_text_center(x1 + 132, y1 + 248, "（开发版本）")
	}
	if (language != 1) draw_text_center(x1 + 132, y1 + 280 + dev_label_offset, "An open-source Minecraft music maker")
	else draw_text_center(x1 + 132, y1 + 280 + dev_label_offset, "一个开源的 Minecraft 音乐制作软件")
	draw_set_color(make_color_rgb(62, 144, 255))
	draw_text_url(x1 + 132, y1 + 296 + dev_label_offset, "opennbs.org", link_website)
	draw_theme_color()
	//if (language != 1) draw_text_center(x1 + 132, y1 + 340 + dev_label_offset, "Original created by David Norgren")
	//else draw_text_center(x1 + 132, y1 + 340 + dev_label_offset, "原作者 David Norgren")
	//draw_text_url(x1 + 132, y1 + 356 + dev_label_offset, "stuffbydavid.com", "https://www.stuffbydavid.com")
	if (language != 1) draw_text_center(x1 + 132, y1 + 340 + dev_label_offset, "Want to connect with us?")
	else draw_text_center(x1 + 132, y1 + 340 + dev_label_offset, "想要和我们交流？")
	if (language != 1) draw_text_url(x1 + 132, y1 + 356 + dev_label_offset, "Join our Discord community!", link_discord)
	else draw_text_url(x1 + 132, y1 + 356 + dev_label_offset, "加入我们的 Discord 社区吧！", link_discord)
	draw_set_color(c_white)
	if (fdark && theme = 3) draw_set_color(0)
	draw_line(x1 + 270, y1 + 24, x1 + 270, y1 + 396)
	draw_set_alpha(0.25)
	if (theme = 3) draw_set_alpha(0.25 * windowalpha)
	draw_theme_color()
	draw_line(x1 + 269, y1 + 24, x1 + 269, y1 + 396)
	draw_set_alpha(1)
	if (theme = 3) draw_set_alpha(windowalpha)
	draw_theme_color()
	if (language != 1) draw_text_dynamic(x1 + 290, y1 + 20, "What do you want to do?")
	else draw_text_dynamic(x1 + 290, y1 + 20, "要做什么？")

	b = x1 + 300
	c = y1 + 48
	if (!isplayer) {
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	if (!hires || theme != 3) draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	else draw_sprite_ext(spr_frame2_hires, a + 3 * fdark, b, c, 0.25, 0.25, 0, -1, draw_get_alpha())
	if (theme != 3) {
		draw_sprite(spr_bigicons, 0, b + (a > 1), c + (a > 1))
	} else {
		if (!hires) {
			if (!fdark) draw_sprite(spr_bigicons_f, 0, b + (a > 1), c + (a > 1))
			else draw_sprite(spr_bigicons_d, 0, b + (a > 1), c + (a > 1))
		} else {
			if (!fdark) draw_sprite_ext(spr_bigicons_f_hires, 0, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
			else draw_sprite_ext(spr_bigicons_d_hires, 0, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
		}
	}
	if (language != 1) draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "Create a new song")
	else draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "创建歌曲")
	if (a = 2 && mouse_check_button_released(mb_left) && (windowopen = 1 || theme != 3)) {
		if (windowsound && theme = 3) play_sound(soundgoback, 45, 100, 100, 0)
		windowclose = 1
	}

	c += 44
	}
	b = x1 + 300
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	if (!hires || theme != 3) draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	else draw_sprite_ext(spr_frame2_hires, a + 3 * fdark, b, c, 0.25, 0.25, 0, -1, draw_get_alpha())
	if (theme != 3) {
		draw_sprite(spr_bigicons, 1, b + (a > 1), c + (a > 1))
	} else {
		if (!hires) {
			if (!fdark) draw_sprite(spr_bigicons_f, 1, b + (a > 1), c + (a > 1))
			else draw_sprite(spr_bigicons_d, 1, b + (a > 1), c + (a > 1))
		} else {
			if (!fdark) draw_sprite_ext(spr_bigicons_f_hires, 1, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
			else draw_sprite_ext(spr_bigicons_d_hires, 1, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
		}
	}
	if (language != 1) draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "Load a song")
	else draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "打开歌曲")
	if (a = 2 && mouse_check_button_released(mb_left)) {
		if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
		windowalpha = 0
		windowclose = 0
		windowopen = 0
	    load_song("", 0, 1)
	    return 1
	}
	b = x1 + 320
	for (a = 0; a < 11; a += 1) {
	    if (recent_song[a] = "") break
	    if (a = 0) {
	        c += 36
	        if (language != 1) draw_text_dynamic(b - 20, c, "Recent songs:")
	        else draw_text_dynamic(b - 20, c, "最近歌曲：")
	        c += 16
	    }

	    popup_set_window(b, c, 320, 16, recent_song[a])
	    m = mouse_rectangle(b, c, 320, 16)
	    m += m && mouse_check_button(mb_left)
	    if (m > 0 && mouse_check_button_released(mb_left)) {
			if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
	        if (!file_exists_lib(recent_song[a])) {
	            if (language != 1) message("Could not find file:\n" + recent_song[a], "Error")
	            else message("找不到文件：\n" + recent_song[a], "错误")
	            for (d = 0; d < 10; d += 1) {
	                if (recent_song[d] = recent_song[a]) {
	                    for (e = d; e < 10; e += 1) {
	                        recent_song[e] = recent_song[e + 1]
	                        recent_song_time[e] = recent_song_time[e + 1]
	                    }
	                }
	            }
	            recent_song[10] = ""
	            recent_song_time[10] = 0
	        } else {
				windowalpha = 0
				windowclose = 0
				windowopen = 0
	            load_song(recent_song[a], 0, 1)
	        }
	    }
	    if (!hires || theme != 3) draw_sprite(spr_frame5, theme * 3 + m + 3 * (fdark && theme = 3), b, c)
	    else draw_sprite_ext(spr_frame5_hires, m + 3 * fdark, b, c, 0.25, 0.25, 0, -1, draw_get_alpha())
	    draw_text_dynamic(b + 2 + (m = 2), c + 1 + (m = 2), string_truncate(filename_name(recent_song[a]), 220), true)
	    draw_set_halign(fa_right)
	    draw_text_dynamic(b + 316 + (m = 2), c + 1 + (m = 2), seconds_to_str(floor(date_second_span(recent_song_time[a], date_current_datetime()))))
	    draw_set_halign(fa_left)
	    c += 16
	}
	c += 10
	if (recent_song[0] = "")
	 c += 34
	b = x1 + 300
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	if (!hires || theme != 3) draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	else draw_sprite_ext(spr_frame2_hires, a + 3 * fdark, b, c, 0.25, 0.25, 0, -1, draw_get_alpha())
	if (theme != 3) {
		draw_sprite(spr_bigicons, 2, b + (a > 1), c + (a > 1))
	} else {
		if (!hires) {
			if (!fdark) draw_sprite(spr_bigicons_f, 2, b + (a > 1), c + (a > 1))
			else draw_sprite(spr_bigicons_d, 2, b + (a > 1), c + (a > 1))
		} else {
			if (!fdark) draw_sprite_ext(spr_bigicons_f_hires, 2, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
			else draw_sprite_ext(spr_bigicons_d_hires, 2, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
		}
	}
	if (language != 1) draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "Generate song out of MIDI file")
	else draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "从 MIDI 文件生成")
	if (a = 2 && mouse_check_button_released(mb_left)) {
		if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
		windowalpha = 0
		windowclose = 0
		windowopen = 0
		open_midi("", 1)
	}

	b = x1 + 300
	c += 44
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	if (!hires || theme != 3) draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	else draw_sprite_ext(spr_frame2_hires, a + 3 * fdark, b, c, 0.25, 0.25, 0, -1, draw_get_alpha())
	if (theme != 3) {
		draw_sprite(spr_bigicons, 6, b + (a > 1), c + (a > 1))
	} else {
		if (!hires) {
			if (!fdark) draw_sprite(spr_bigicons_f, 6, b + (a > 1), c + (a > 1))
			else draw_sprite(spr_bigicons_d, 6, b + (a > 1), c + (a > 1))
		} else {
			if (!fdark) draw_sprite_ext(spr_bigicons_f_hires, 6, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
			else draw_sprite_ext(spr_bigicons_d_hires, 6, b + (a > 1), c + (a > 1), 0.25, 0.25, 0, -1, draw_get_alpha())
		}
	}
	if (language != 1) draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "Watch tutorial videos")
	else draw_text_dynamic(b + 48 + (a > 1), c + 9 + (a > 1), "教程视频")
	if (a = 2 && mouse_check_button_released(mb_left)) {
		if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
		if (language != 1) open_url("http://www.youtube.com/playlist?list=PL7EA4F0D271DA6E86")
		else open_url("https://www.bilibili.com/video/BV1Mx411a76p")
	}

	if (display_mouse_get_x() - window_get_x() >= 0 && display_mouse_get_y() - window_get_y() >= 0 && display_mouse_get_x() - window_get_x() < 0 + window_width && display_mouse_get_y() - window_get_y() < 0 + window_height) {
		window_set_cursor(curs)
		if (array_length(text_mouseover) = 0) window_set_cursor(cr_default)
	}
	if (!isplayer) if (draw_icon(4, x1 + 700 - 40, y1 + 430 - 40, condstr(language != 1, "Player Mode", "播放器模式"), 0, 0, 1)) {
		isplayer = 1 //Go into player mode if button is pressed in the greeting screen
		//window_set_size(floor(800 * window_scale), floor(500 * window_scale))
		if (!port_taken) network_destroy(server_socket)
		else network_destroy(client_socket)
		window_setnormal()
	}
}
