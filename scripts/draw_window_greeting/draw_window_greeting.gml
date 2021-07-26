function draw_window_greeting() {
	// draw_window_greeting()
	var x1, y1, a, b, c, d, e, m;
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	x1 = floor(rw / 2 - 350)
	y1 = floor(rh / 2 - 210)
	draw_window(x1, y1, x1 + 700, y1 + 430)
	draw_sprite_ext(spr_logo, 0, x1 + 64, y1 + 50, 0.55, 0.55, 0, c_white, draw_get_alpha())
	draw_theme_font(font_info_med_bold)
	draw_text_center(x1 + 132, y1 + 213, "Open Note Block Studio")
	draw_theme_font(font_main_bold)
	if (RUN_FROM_IDE != 1) {
		draw_text_center(x1 + 132, y1 + 248, "Running from the GameMaker IDE.")
	} else if (snapshot) {
		draw_text_center(x1 + 132, y1 + 248, "Snapshot version.")
	} else if (check_update) {
	    if (update = -1) {
	        draw_set_color(c_red)
	        draw_text_center(x1 + 132, y1 + 248, "Could not check for updates")
	    }
	    if (update = 0) {
	        //draw_set_color(c_gray)
	        draw_text_center(x1 + 132, y1 + 248, "Checking for updates...")
	    }
	    if (update = 1) {
	        draw_set_color(33023)
	        draw_text_center(x1 + 132, y1 + 248, "There is an update available!")
	    }
	    if (update = 2) {
	        draw_set_color(c_green)
			if (theme == 2) draw_set_color(c_lime)
	        draw_text_center(x1 + 132, y1 + 248, "You are using the latest version!")
	    }
	    if (update = 3) {
	        draw_set_color(c_lime)
	        draw_text_center(x1 + 132, y1 + 248, "Successfully updated!")
	    }
	} else {
	    draw_set_color(c_red)
	    draw_text_center(x1 + 132, y1 + 248, "Update checking disabled by user")
	}
	draw_theme_font(font_main)
	draw_theme_color()
	if (RUN_FROM_IDE != 1) {
		draw_text_center(x1 + 132, y1 + 233, "Version Local Release")
	} else {
		draw_text_center(x1 + 132, y1 + 233, "Version " + version + " - Released " + version_date)
	}
	draw_text_center(x1 + 132, y1 + 280, "Open source Minecraft Note Block Studio")
	draw_set_color(make_color_rgb(62, 144, 255))
	draw_text_url(x1 + 132, y1 + 296, "opennbs.org", "https://git.io/fjQH3")
	draw_theme_color()
	draw_text_center(x1 + 132, y1 + 340, "Original created by David Norgren")
	draw_text_url(x1 + 132, y1 + 356, "stuffbydavid.com", "https://www.stuffbydavid.com")
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
	draw_text(x1 + 290, y1 + 20, "What do you want to do?")

	b = x1 + 300
	c = y1 + 48
	if (!isplayer) {
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	if (theme != 3) {
	draw_sprite(spr_bigicons, 0, b + (a > 1), c + (a > 1))
	} else {
	if (!fdark) draw_sprite(spr_bigicons_f, 0, b + (a > 1), c + (a > 1))
	else draw_sprite(spr_bigicons_d, 0, b + (a > 1), c + (a > 1))
	}
	draw_text(b + 48 + (a > 1), c + 9 + (a > 1), "Create a new song")
	if (a = 2 && mouse_check_button_released(mb_left) && windowopen = 1) {
		if (windowsound && theme = 3) play_sound(soundgoback, 45, 100, 100, 0)
		windowclose = 1
	}

	c += 44
	}
	b = x1 + 300
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	if (theme != 3) {
	draw_sprite(spr_bigicons, 1, b + (a > 1), c + (a > 1))
	} else {
	if (!fdark) draw_sprite(spr_bigicons_f, 1, b + (a > 1), c + (a > 1))
	else draw_sprite(spr_bigicons_d, 1, b + (a > 1), c + (a > 1))
	}
	draw_text(b + 48 + (a > 1), c + 9 + (a > 1), "Load a song")
	if (a = 2 && mouse_check_button_released(mb_left)) {
		if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
		windowalpha = 0
		windowclose = 0
		windowopen = 0
	    load_song("")
	    return 1
	}
	b = x1 + 320
	for (a = 0; a < 11; a += 1) {
	    if (recent_song[a] = "") break
	    if (a = 0) {
	        c += 36
	        draw_text(b - 20, c, "Recent songs:")
	        c += 16
	    }

	    popup_set_window(b, c, 320, 16, recent_song[a])
	    m = mouse_rectangle(b, c, 320, 16)
	    m += m && mouse_check_button(mb_left)
	    if (m > 0 && mouse_check_button_released(mb_left)) {
			if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
	        if (!file_exists_lib(recent_song[a])) {
	            message("Could not find file:\n" + recent_song[a], "Error")
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
	            load_song(recent_song[a])
	        }
	    }
	    draw_sprite(spr_frame5, theme * 3 + m + 3 * (fdark && theme = 3), b, c)
	    draw_text(b + 2 + (m = 2), c + 1 + (m = 2), string_truncate(filename_name(recent_song[a]), 220))
	    draw_set_halign(fa_right)
	    draw_text(b + 316 + (m = 2), c + 1 + (m = 2), seconds_to_str(floor(date_second_span(recent_song_time[a], date_current_datetime()))))
	    draw_set_halign(fa_left)
	    c += 16
	}
	c += 10
	if (recent_song[0] = "")
	 c += 34
	b = x1 + 300
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	if (theme != 3) {
	draw_sprite(spr_bigicons, 2, b + (a > 1), c + (a > 1))
	} else {
	if (!fdark) draw_sprite(spr_bigicons_f, 2, b + (a > 1), c + (a > 1))
	else draw_sprite(spr_bigicons_d, 2, b + (a > 1), c + (a > 1))
	}
	draw_text(b + 48 + (a > 1), c + 9 + (a > 1), "Generate song out of MIDI file")
	if (a = 2 && mouse_check_button_released(mb_left)) {
		if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
		windowalpha = 0
		windowclose = 0
		windowopen = 0
		open_midi("")
	}

	b = x1 + 300
	c += 44
	a = mouse_rectangle(b, c, 224, 32)
	a += (a && (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)))
	draw_sprite(spr_frame2, a + 3 * theme + 3 * (fdark && theme = 3), b, c)
	if (theme != 3) {
	draw_sprite(spr_bigicons, 6, b + (a > 1), c + (a > 1))
	} else {
	if (!fdark) draw_sprite(spr_bigicons_f, 6, b + (a > 1), c + (a > 1))
	else draw_sprite(spr_bigicons_d, 6, b + (a > 1), c + (a > 1))
	}
	draw_text(b + 48 + (a > 1), c + 9 + (a > 1), "Watch tutorial videos")
	if (a = 2 && mouse_check_button_released(mb_left)) {
		if (windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
		open_url("http://www.youtube.com/playlist?list=PL7EA4F0D271DA6E86")
	}

	window_set_cursor(curs)
	window_set_cursor(cr_default)
	if (windowopen = 0 && theme = 3) {
		if (windowalpha < 1) {
			if (refreshrate = 0) windowalpha += 1/3.75
			else if (refreshrate = 1) windowalpha += 1/7.5
			else if (refreshrate = 2) windowalpha += 1/15
			else if (refreshrate = 3) windowalpha += 1/18
			else windowalpha += 1/20
		} else {
			windowalpha = 1
			windowopen = 1
		}
	}
	if(theme = 3) {
		if (windowclose = 1) {
			if (windowalpha > 0) {
				if (refreshrate = 0) windowalpha -= 1/3.75
				else if (refreshrate = 1) windowalpha -= 1/7.5
				else if (refreshrate = 2) windowalpha -= 1/15
				else if (refreshrate = 3) windowalpha -= 1/18
				else windowalpha -= 1/20
			} else {
				windowalpha = 0
				windowclose = 0
				windowopen = 0
				window = 0
				window_set_cursor(curs)
				save_settings()
			}
		}
	} else {
		if (windowclose = 1) {
			windowclose = 0
			window = 0
		}
	}
	if (theme != 3) {
		windowopen = 1
		windowalpha = 1
	}
	draw_set_alpha(1)


}
