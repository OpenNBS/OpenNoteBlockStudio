function draw_window_instruments() {
	// draw_window_instruments()
	var x1, y1, a, b, c, str, menun, menua, menub, prev;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	menun = -1
	x1 = floor(rw / 2 - 275)
	y1 = floor(rh / 2 - 175) + windowoffset
	draw_window(x1, y1, x1 + 550, y1 + 350)
	draw_theme_font(font_main_bold)
	draw_text(x1 + 10, y1 + 8, "Instrument Settings")
	draw_theme_font(font_main)
	draw_text(x1 + 12, y1 + 31, "These settings only apply to this song. To import the settings from another\nsong, click \"Import\". The sound files must be located in the \"Sounds\" folder.")
	draw_set_color(c_white)
	if(theme = 2) draw_set_color(c_dark)
	if (fdark && theme = 3) draw_set_color(2829099)
	draw_rectangle(x1 + 12, y1 + 66, x1 + 535, y1 + 310, 0)
	if (!theme) {
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 12, y1 + 66, x1 + 535, y1 + 310, 1)
	} else {
	    if (theme != 3) draw_area(x1 + 11, y1 + 65, x1 + 535, y1 + 312)
	    else draw_area(x1 + 11, y1 + 67, x1 + 535, y1 + 312)
	}
	if (draw_button2(x1 + 455, y1 + 9, 80, "Import", 0, 1)) load_instruments("")
	if (draw_button2(x1 + 455, y1 + 36, 80, "Open Folder", 0, 1)) open_url(sounds_directory)
	// Tabs
	draw_window(x1 + 13 + 194 + 160 + 80, y1 + 67, x1 + 14 + 194 + 160 + 80 + 88 - 1, y1 + 67 + 20, 1)
	popup_set_window(x1 + 13 + 194 + 160 + 80 - 1, y1 + 67, 88, 20, "Whether notes of this type should be\npressed when the marker reaches them.")
	draw_text(x1 + 18 + 194 + 160 + 80 - 1, y1 + 70, "Press")
	draw_window(x1 + 13 + 194 + 160, y1 + 67, x1 + 14 + 194 + 160 + 80, y1 + 67 + 20, 1)
	popup_set_window(x1 + 13 + 194 + 160, y1 + 67, 80, 20, "The default key pitch of the sound file.")
	draw_text(x1 + 18 + 194 + 160, y1 + 70, "Pitch")
	draw_window(x1 + 13 + 194, y1 + 67, x1 + 14 + 194 + 160, y1 + 67 + 20, 1)
	popup_set_window(x1 + 13 + 194, y1 + 67, 160, 20, "The sound file of this instrument.")
	draw_text(x1 + 18 + 194, y1 + 70, "Sound")
	draw_window(x1 + 13 - 2, y1 + 67, x1 + 14 + 194, y1 + 67 + 20, 1)
	popup_set_window(x1 + 13 - 2, y1 + 67, 194, 20, "The name of this instrument.")
	draw_text(x1 + 18 - 2, y1 + 70, "Name")
	
	var sounds = 0;
	for (var i = first_custom_index; i <= ds_list_size(instrument_list) - 1; i++) {
		var ins = ds_list_find_value(instrument_list, i)
		if (ins.filename != "" && ins.loaded) {
			sounds++
		}
	}
	if (draw_button2(x1 + 12, y1 + 318, 86, "Export sounds", (user_instruments == 0 || sounds == 0))) pack_instruments()
	c = 0
	if (draw_button2(x1 + 110, y1 + 318, 80, "Add", user_instruments >= 240) && wmenu = 0) {
	    changed = true
	    insselect = ds_list_size(instrument_list)
	    ds_list_add(instrument_list, new_instrument("Custom instrument #" + string(user_instruments + 1), "", true))
	    c = 1
	}
	var userselect = -1;
	if (insselect > -1 && instrument_list[| insselect].user)
	    userselect = instrument_list[| insselect]
	if (draw_button2(x1 + 194, y1 + 318, 80, "Remove", userselect < 0) && wmenu = 0) {
		if ((userselect.num_blocks == 0) || (message_yesnocancel("This will remove " + string(userselect.num_blocks) + " block" + condstr(userselect.num_blocks > 1, "s") + " using this instrument and cannot be undone. Confirm?", "Warning"))) {
			instrument_remove(userselect)
			insselect = min(ds_list_size(instrument_list) - 1, insselect)
			if (instrument = userselect)
				instrument = instrument_list[| 0]
			c = 1
		}
	}
	if (draw_button2(x1 + 278, y1 + 318, 80, "Shift up", (userselect < 0) || (user_instruments <= 1) || (insselect == first_custom_index)) && wmenu = 0) {
		insselect -= 1
		instrument_swap(userselect, instrument_list[| insselect])
		c = 1
	}
	if (draw_button2(x1 + 362, y1 + 318, 80, "Shift down", (userselect < 0) || (user_instruments <= 1) || (insselect == ds_list_size(instrument_list) - 1) && wmenu = 0)) {
		insselect += 1
		instrument_swap(userselect, instrument_list[| insselect])
		c = 1
	}
	if (draw_button2(x1 + 456, y1 + 318, 80, "OK") && wmenu = 0 && (windowopen = 1 || theme != 3)) {
		windowclose = 1
		if (save_version < 5 && user_instruments > 18) {
			show_message("This song contains more than 18 instruments and cannot be saved in version " + string(save_version) + ". The save version will be changed to " + string(nbs_version) + ".")
			save_version = nbs_version
		}
		save_settings()
	}
	if (mouse_check_button_pressed(mb_left)) {
	    insedit = -1
	}
	if (mouse_check_button_released(mb_left) && c = 0) {
	    if (!mouse_rectangle(x1 + 14, y1 + 88, 476, min(ds_list_size(instrument_list) * 20, 220)) && (!mouse_rectangle(x1 + 14, y1 + 318, 476, 24))) {
			insselect = -1
		}
	}
	// Instruments
	for (a = 0; a <= 10; a += 1) {
	    b = floor(sb_val[3]) + a
	    if (b >= ds_list_size(instrument_list)) break
	    var ins = instrument_list[| b];
	    if (insselect = b) {
	        draw_set_color(10512468)
	        draw_rectangle(x1 + 14, y1 + 106 + 20 * a - 20, x1 + 520, y1 + 106 + 20 * a, 0)
	    }
	    draw_set_color(12632256)
	    draw_line(x1 + 14, y1 + 106 + 20 * a, x1 + 520, y1 + 106 + 20 * a)
	    draw_set_color(make_color_rgb(120, 120, 120))
	    if (ins.user) draw_theme_color()
	    if (insselect = b) draw_set_color(c_white)
	    // INS NAME
		prev = ins.name
	    ins.name = draw_text_edit(60 + b, ins.name, x1 + 18, y1 + 90 + 20 * a, 178, 20, 1, b < first_custom_index)
		if (ins.name != prev) changed = 1
	    // INS SOUND
	    draw_set_color(make_color_rgb(120, 120, 120))
	    if (ins.user) {draw_theme_color()}
	    if (!ins.loaded) draw_set_color(c_red)
	    if (insselect = b) draw_set_color(c_white)
	    draw_text(x1 + 18 + 194, y1 + 90 + 20 * a, condstr(ins.filename = "", "None") + string_truncate(ins.filename, 144, true))
	    if (ins.filename = "") popup_set_window(x1 + 14 + 194, y1 + 88 + 20 * a, 160, 20, "No sound file has been selected\nfor this instrument.")
	    else if (!ins.loaded) popup_set_window(x1 + 14 + 194, y1 + 88 + 20 * a, 160, 20, "This sound file could not be found.")
	    if (mouse_rectangle(x1 + 14 + 194, y1 + 88 + 20 * a, 160, 20) && insselect = b && wmenu = 0) {
	        if (mouse_check_button_pressed(mb_left)) {
	            if (ins.user) {
					instrument_change(ins)
	            } else {
	                message("The sound file for this instrument cannot be changed.", "Error")
	            }
	        }
	        if (ins.user) curs = cr_handpoint
	    }
	    // INS KEY
	    draw_set_color(make_color_rgb(120, 120, 120))
	    if (ins.user) {draw_theme_color()}
	    if (insselect = b) draw_set_color(c_white)
	    if (ins.user) {
	        if (draw_abutton(x1 + 18 + 194 + 216, y1 + 88 + 20 * a) && wmenu = 0) {
	            var key, oct;
	            str = ""
	            key = 0
	            oct = 0
	            str += "Octave 0|\\|"
	            while (1) {
	                str += check(ins.key = key) + get_keyname(key, 1) + "|"
	                key += 1
	                if (key = 88) break
	                if ((key - 3) mod 12 = 0) {
	                    oct += 1
	                    str += "/|Octave " + string(oct) + "|\\|"
	                }
	            }
	            str += "/"
	            menu = show_menu_ext("instruments_pitch", x1 + 18 + 194 + 155, y1 + 106 + 20 * a, str)
	            menu.menub = b
	        }
	    }
	    draw_text(x1 + 18 + 194 + 160, y1 + 90 + 20 * a, get_keyname(ins.key, 1))
	    // INS PRESS
	    draw_theme_color()
	    if (insselect = b) draw_set_color(c_white)
	    if (draw_abutton(x1 + 18 + 194 + 175 + 112, y1 + 88 + 20 * a) && wmenu = 0) {
	        menu = show_menu_ext("instruments_press", x1 + 18 + 194 + 235, y1 + 106 + 20 * a, check(ins.press) + "Yes|" + check(!ins.press) + "No")
	        menu.menub = b
	    }
	    draw_text(x1 + 18 + 194 + 160 + 80, y1 + 90 + 20 * a, test(ins.press, "Yes", "No"))
	    if (mouse_rectangle(x1 + 14, y1 + 88 + 20 * a, 460, 20) && wmenu = 0) {
	        if (mouse_check_button_pressed(mb_left)) {
	            insselect = b
	        }
	    }
	}
	if (wmenu = 1 && !mouse_check_button(mb_left)) wmenu = 0
	draw_set_color(12632256)
	draw_line(x1 + 13 + 194, y1 + 87, x1 + 13 + 194, y1 + 86 + 20 * a)
	draw_line(x1 + 13 + 194 + 160, y1 + 87, x1 + 13 + 194 + 160, y1 + 86 + 20 * a)
	draw_line(x1 + 13 + 194 + 160 + 80, y1 + 87, x1 + 13 + 194 + 160 + 80, y1 + 86 + 20 * a)
	draw_scrollbar(insscrollbar, x1 + 14 + 194 + 160 + 80 + 70, y1 + 88, 21, 9, ds_list_size(instrument_list) - 2, 0, 1)
	window_set_cursor(curs)
	window_set_cursor(cr_default)
	
}
