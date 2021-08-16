function draw_window_preferences_f() {
	// draw_window_preferences_f()
	var x1, y1, a, b, c, as, nsel, str;
	draw_set_alpha(windowalpha)
	curs = cr_default
	nsel = -1
	x1 = floor(rw / 2 - 250)
	y1 = floor(rh / 2 - 255) + windowoffset
	draw_window(x1, y1, x1 + 500, y1 + 510)
	draw_set_color(15132390)
	draw_rectangle(x1+1,y1+30,x1+498,y1+69,0) //48
	draw_set_color(c_black)
	draw_set_font(fnt_wslui)
	draw_text(x1 + 10, y1 + 9, "Preferences")
	b = 40
	str[0] = "General"
	str[1] = "Appearance"
	str[2] = "Usability"
	str[3] = "Playback"
	if (mouse_rectangle(x1, y1 + 30, 40, 40)) {
		draw_set_color(13487565)
		if (mouse_check_button(mb_left)) draw_set_color(12105912)
		draw_rectangle(x1 + 1, y1 + 30, x1 + 39, y1 + 69, 0)
		if (mouse_check_button_released(mb_left && windowopen = 1)) {
			windowclose = 1
		}
	}
	draw_sprite(spr_back, 0, x1 + 12, y1 + 30 + 12)
	draw_set_font(fnt_wslui_med)
	for (a = 0; a < 4; a += 1) {
		draw_set_color(c_black)
	    c = mouse_rectangle(x1 + b, y1 + 28 + 21 - 19, string_width(str[a]) + 12, 18 + 21)
		
		if (mouse_check_button(mb_left) && c) {
			draw_sprite(spr_tabbuttons_f, 6, x1 + b, y1 + 28 + 21 - 19)
			draw_sprite_ext(spr_tabbuttons_f, 7, x1 + b + 2, y1 + 28 + 21 - 19, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
			draw_sprite(spr_tabbuttons_f, 8, x1 + b + string_width(str[a]) + 10, y1 + 28 + 21 - 19)	
		} else {
			draw_sprite(spr_tabbuttons_f, 0 + 3 * c, x1 + b, y1 + 28 + 21 - 19)
			draw_sprite_ext(spr_tabbuttons_f, 1 + 3 * c, x1 + b + 2, y1 + 28 + 21 - 19, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
			draw_sprite(spr_tabbuttons_f, 2 + 3 * c, x1 + b + string_width(str[a]) + 10, y1 + 28 + 21 - 19)	
		}
	    if (selected_tab = a) {
			draw_set_color(14120960)
	        draw_line(x1 + b + 5, y1 + 30 + 21 + 18 - 6, x1 + b + 5 + string_width(str[a]), y1 + 30 + 21 + 18 - 6)
	        draw_line(x1 + b + 5, y1 + 30 + 21 + 19 - 6, x1 + b + 5 + string_width(str[a]), y1 + 30 + 21 + 19 - 6)
			draw_set_color(c_black)
	    }
	    draw_text(x1 + b + 6, y1 + 30 + 21 - 8, str[a])
	    if (mouse_check_button_released(mb_left) && c) nsel = a
	    b += string_width(str[a]) + 12
	}
	//draw_set_color(c_white)
	//draw_set_color(make_color_rgb(137, 140, 149))
	//draw_set_color(c_white)
	//draw_roundrect(x1 + stabx, y1 + 26 + 22, x1 + stabx + stabw, y1 + 26 + 25 + 22, 0)
	//draw_set_color(make_color_rgb(137, 140, 149))
	//draw_set_color(c_white)
	//draw_rectangle(x1 + stabx + 1, y1 + 46 + 22, x1 + stabx + stabw - 1, y1 + 47 + 22, 0)
	//draw_theme_color()
	//draw_text(x1 + stabx + 8, y1 + 28 + 22, str[selected_tab])
	draw_set_color(make_color_rgb(213, 223, 229))
	if (nsel > -1) selected_tab = nsel
	selected_tab += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	if (selected_tab < 0) selected_tab = 3
	if (selected_tab > 3) selected_tab = 0
	draw_theme_color()
	if (selected_tab = 0) {
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 74 + 22, 218, 65, "Startup")
		draw_set_font(fnt_wslui)
	    //if (draw_switch(x1 + 40, y1 + 90 + 22, show_welcome, "Show greeting window", "Whether to show the greeting window\nwhen the program is opened.")) show_welcome=!show_welcome
	    if (RUN_FROM_IDE != 1) {
		//	draw_switch(x1 + 40, y1 + 110 + 22, check_update, "Check for updates", "This option is disabled because\nyou're running from the IDE.", 1)
		} else {
		//	if (draw_switch(x1 + 40, y1 + 110 + 22, check_update, "Check for updates", "Whether to check for any updates\nwhen the program is opened.")) check_update=!check_update
		}
	
		// Auto-saving
		draw_set_font(fnt_wslui_info_med)
		draw_areaheader(x1 + 258, y1 + 74 + 22, 220, 65, "Auto-saving")
		draw_set_font(fnt_wslui)
		as = autosavemins
		//if (draw_switch(x1 + 276, y1 + 90 + 22, autosave, "Enable auto-saving", "Whether the song should automatically\nbe saved every now and then.")) autosave=!autosave
		if (as != autosave) {
		    changed = 1
		    if (autosave = 0) tonextsave = 0
		    if (autosave = 1) tonextsave = autosavemins
		}
		if (autosave = 0) {
		    draw_set_color(c_gray)
		    draw_text(x1 + 306, y1 + 110 + 22, "Interval:       minute" + condstr(autosavemins > 1, "s"))
			draw_text(x1 + 355, y1 + 110 + 22, autosavemins)
		    draw_theme_color()
		} else {
			draw_text(x1 + 306, y1 + 110 + 22, "Interval:       minute" + condstr(autosavemins > 1, "s"))
			as = autosavemins
			autosavemins = median(1, draw_dragvalue(2, x1 + 355, y1 + 110 + 22, autosavemins, 1), 60)
			if (autosavemins != a) {changed = 1 tonextsave = autosavemins}
		}
		popup_set_window(x1 + 306, y1 + 110 + 22, 180, 16, "The amount of minutes between each auto-save.")
	
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 164 + 22, 218, 120, "Theme")
		draw_set_font(fnt_wslui)
	    if (draw_radiobox(x1 + 40, y1 + 164 + 16 + 22, theme == 0, "Aqua", "Use the aqua theme.")) {theme = 0 change_theme()}
		if (draw_radiobox(x1 + 40, y1 + 164 + 16 + 20 + 22, theme == 2, "Dark", "Use the dark theme.")) {theme = 2 change_theme()}
	    if (draw_radiobox(x1 + 40, y1 + 164 + 16 + 20 + 20 + 22, theme == 1, "90s", "Use the 90s theme.")) {theme = 1 change_theme()}
	    if (draw_radiobox(x1 + 40, y1 + 164 + 16 + 20 + 20 + 20 + 22, theme == 3, "Fluent", "Use the fluent theme.")) {theme = 3 change_theme()}
		//if (draw_switch(x1 + 40, y1 + 164 + 16 + 20 + 20 + 20 + 25 + 22, blackout, "Blackout mode", "Makes the workspace background solid black, so you can\nkey it out in your video editor when recording the screen.")) blackout = !blackout
	    draw_areaheader(x1+258,y1+164 + 22,220,60,"Max frame rate (experimental)")
		draw_set_font(fnt_wslui)
	    if (draw_radiobox(x1+274,y1+164+16 + 22,refreshrate == 0,"30FPS","Run the program at 30FPS.")) {
	        game_set_speed(30,gamespeed_fps)
			refreshrate=0
	    }
	    if (draw_radiobox(x1+274,y1+164+16+20 + 22,refreshrate == 1,"60FPS","Run the program at 60FPS.")) {
	        game_set_speed(60,gamespeed_fps)
			refreshrate=1
	    }
		if (draw_radiobox(x1+274+64-6,y1+164+16 + 22,refreshrate == 2,"120FPS","Run the program at 120FPS.")) {
			game_set_speed(120,gamespeed_fps)
			refreshrate=2
		}
		if (draw_radiobox(x1+274+64-6,y1+164+16+20 + 22,refreshrate == 3,"144FPS","Run the program at 144FPS.")) {
			game_set_speed(144,gamespeed_fps)
			refreshrate=3
		}
		if (draw_radiobox(x1+274+128-6,y1+164+16+10 + 22,refreshrate == 4,"Unlimited","Run the program with unlimited FPS.\nMay cause very high CPU usage. Use this option with caution!")) {
			game_set_speed(114514,gamespeed_fps)
			refreshrate=4
		}

		draw_set_font(fnt_wslui_info_med)
		draw_areaheader(x1 + 258, y1 + 240 + 22, 220, 44, "Window")
		draw_set_font(fnt_wslui)
		draw_text(x1 + 276, y1 + 256 + 22, "Scale:             %")
		window_scale = median(50, draw_dragvalue(19, x1 + 322, y1 + 256 + 22, window_scale * 100, (1/power(window_scale, 3)) ), 400) / 100
		if (draw_button2(x1 + 394, y1 + 251 + 22, 72, "Reset", (window_scale == 1))) {
			window_scale = 1
		}
		draw_set_color(c_black)
		
		draw_text(x1 + 22, y1 + 290 + 22, "Song folder: " + string_truncate(songfolder, 360))
	    popup_set_window(x1 + 22, y1 + 290 + 22, 430, 18, songfolder)
	    if (draw_button2(x1 + 22, y1 + 306 + 22, 76, "Open", 0, 1)) {
	        if (!directory_exists_lib(songfolder)) {
	            message("The indicated folder doesn't exist!", "Error")
	        } else {
	            open_url(songfolder)
	        }
	    }
	    if (draw_button2(x1 + 22 + 84, y1 + 306 + 22, 76, "Change", 0, 1)) {
	        message("Select the directory where saving/loading should be opened in.", "")
	        a = string(get_save_filename_ext("", "Select song folder", songfolder, "Song folder"))
	        if (a != "") songfolder = filename_dir(a)
	    }
	    if (draw_button2(x1 + 22 + 84 + 84, y1 + 306 + 22, 96, "Use default", 0, 1)) songfolder = songs_directory
	
		draw_text(x1 + 22, y1 + 340 + 22, "Pattern folder: " + string_truncate(patternfolder, 360))
	    popup_set_window(x1 + 22, y1 + 340 + 22, 430, 18, patternfolder)
	    if (draw_button2(x1 + 22, y1 + 356 + 22, 76, "Open", 0, 1)) {
	        if (!directory_exists_lib(patternfolder)) {
	            message("The indicated folder doesn't exist!", "Error")
	        } else {
	            open_url(patternfolder)
	        }
	    }
	    if (draw_button2(x1 + 22 + 84, y1 + 356 + 22, 76, "Change", 0, 1)) {
	        message("Select the directory where patterns can be imported/exported to.", "")
	        a = string(get_save_filename_ext("", "Select patterns folder", patternfolder, "Pattern folder"))
	        if (a != "") patternfolder = filename_dir(a)
	    }
	    if (draw_button2(x1 + 22 + 84 + 84, y1 + 356 + 22, 96, "Use default", 0, 1)) patternfolder = pattern_directory
	} else if (selected_tab = 1) {
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 74 + 22, 456, 196, "Note blocks")
		draw_set_font(fnt_wslui)
	    if (draw_checkbox(x1 + 40, y1 + 90 + 22, use_colors, "Use colored note blocks", "If the instruments should be identified with\ndifferent colors.")) use_colors=!use_colors
	    if (draw_checkbox(x1 + 40, y1 + 110 + 22, use_icons, "Show instrument icons", "If the instruments should be identified with\ntheir respective icons.")) use_icons=!use_icons
		if (draw_checkbox(x1 + 40, y1 + 130 + 22, use_shapes, "Use different shapes for each instrument", "If the instruments should be identified\nwith different shapes.")) use_shapes=!use_shapes
	    if (draw_checkbox(x1 + 40, y1 + 160 + 22, show_numbers, "Show key numbers", "Whether to show the amount of right-clicks required\nfor each note block.")) show_numbers=!show_numbers
	    if (draw_checkbox(x1 + 40, y1 + 180 + 22, show_octaves, "Show octave numbers", "Whether the number of the octave the note block\nis in should be shown.")) show_octaves=!show_octaves
	    if (draw_checkbox(x1 + 40, y1 + 200 + 22, show_incompatible, "Highlight incompatible note blocks", "Whether to show a red outline on note blocks with\ncustom instruments or outside the 2 octave range.")) show_incompatible=!show_incompatible
		if (draw_checkbox(x1 + 40, y1 + 220 + 22, fade, "No fading", "Disables transparency animations on note block sprites")) fade = !fade
		if (draw_checkbox(x1 + 40, y1 + 240 + 22, show_layers, "Show layer boxes", "Whether the layer boxes should be\nshown to the right of the workspace.")) show_layers = !show_layers
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 294 + 22, 456, 171, "Piano")
		draw_set_font(fnt_wslui)
	    //if (draw_switch(x1 + 40, y1 + 310 + 22, show_piano, "Enable piano", "Whether the piano should be visible.")) show_piano = !show_piano
		if (draw_checkbox(x1 + 40, y1 + 355 + 22, show_keynames, "Show key names", "If the names of the keys should be shown.")) show_keynames=!show_keynames
	    if (draw_checkbox(x1 + 40, y1 + 375 + 22, show_keynumbers, "Show key numbers", "Whether to show the amount of right-clicks required\non each key inside the 2 octave range.")) show_keynumbers=!show_keynumbers
	    if (draw_checkbox(x1 + 40, y1 + 395 + 22, show_keyboard, "Show keyboard shortcuts", "Show the keyboard shortcuts of the keys.")) show_keyboard=!show_keyboard
	    if (draw_checkbox(x1 + 40, y1 + 415 + 22, show_notechart, "Show note chart when hovering over keys", "Whether to show a note chart\nwhen hovering over the keys.")) show_notechart=!show_notechart
	    if (draw_checkbox(x1 + 40, y1 + 435 + 22, show_outofrange, "Highlight out-of-range keys", "Whether to show a red tint on keys\noutside of the 2 octave range.")) show_outofrange=!show_outofrange
	    if (!show_piano) draw_set_color(c_gray)
		draw_text(x1 + 70, y1 + 330 + 22, "Keys to show:")
		if (show_piano) {
			keysmax = median(20, draw_dragvalue(4, x1 + 150, y1 + 330 + 22, keysmax, 2), 50)
		} else {
			draw_text(x1 + 150, y1 + 330 + 22, keysmax)
		}
		draw_theme_color()
	    popup_set_window(x1 + 180, y1 + 275 + 22, 150, 21, "The amount of keys to show. A high number may\nslow down the program on old computers.")
	} else if (selected_tab = 2) {
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 74 + 22, 456, 120, "Mouse wheel")
		draw_set_font(fnt_wslui)
	    if (draw_radiobox(x1 + 40, y1 + 90 + 22, mousewheel = 0, "Use mouse wheel to scroll through the song", "Use the mouse wheel to scroll through\nthe song horizontally or vertically.")) mousewheel = 0
	    if (draw_radiobox(x1 + 40, y1 + 110 + 22, mousewheel = 1, "Use mouse wheel to change instrument", "Use the mouse wheel to toggle between\nthe available instruments.")) mousewheel = 1
	    if (draw_radiobox(x1 + 40, y1 + 130 + 22, mousewheel = 2, "Use mouse wheel to change key", "Use the mouse wheel to toggle\nbetween the keys on the piano.")) mousewheel = 2
	    if (draw_checkbox(x1 + 40, y1 + 158 + 22, changepitch, "Change note properties when scrolling over notes", "Whether scrolling when hovering over a note should change its key,\nvelocity, panning or pitch, according to the currently selected edit mode.")) changepitch=!changepitch
		//draw_text(x1 + 40, y1 + 178, "Tip: Hold Shift while scrolling over a note to change a whole octave,\nor fine-tune its velocity, panning or pitch.")
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 220 + 22, 456, 105, "Piano")
		draw_set_font(fnt_wslui)
	    if (draw_checkbox(x1 + 40, y1 + 236 + 22, select_lastpressed, "Set selected key to pressed one", "If the selected key should be set\nto the one pressed using the keyboard.")) select_lastpressed=!select_lastpressed
	    draw_text(x1 + 40, y1 + 270 + 22, "Right-click on keys to change their shortcuts.")
	    if (draw_button2(x1 + 40, y1 + 290 + 22, 160, "Reset key shortcuts", 0, 1)) {
	        if (question("Are you sure?", "Confirm")) init_keys()
	    }
		draw_set_font(fnt_wslui_info_med)
		draw_areaheader(x1 + 22, y1 + 290 + 62 + 22, 456, 65, "Discord")
		draw_set_font(fnt_wslui)
		//if (draw_switch(x1 + 40, y1 + 290 + 62 + 16 + 22, presence, "Enable Discord Rich Presence", "Displays info about your current\nsong in your Discord profile.")) {
		    presence = !presence
			if (presence = 1) {
				np_setpresence_timestamps(date_current_datetime(), 0, false);
			}
	} else if (selected_tab = 3) {
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 74 + 22, 456, 125, "Marker")
		draw_set_font(fnt_wslui)
	    if (draw_checkbox(x1 + 40, y1 + 90 + 22, marker_follow, "Follow marker when playing", "Automatically scroll along with the\nmarker when playing the song.")) marker_follow=!marker_follow
	    if (draw_radiobox(x1 + 70, y1 + 110 + 22, marker_pagebypage, "Page by page", "Scroll with the marker every page.", !marker_follow)) marker_pagebypage = 1
	    if (draw_radiobox(x1 + 70, y1 + 130 + 22, !marker_pagebypage, "Tick by tick", "Scroll with the marker every tick.", !marker_follow)) marker_pagebypage = 0
	    if (draw_checkbox(x1 + 40, y1 + 150 + 22, marker_start, "Start playing in section", "Whether to always start playing\nat the start of the active section.")) marker_start=!marker_start
	    if (draw_checkbox(x1 + 40, y1 + 170 + 22, marker_end, "Stop playing after section", "Whether to stop playing when the\nmarker passes the active section.")) marker_end=!marker_end
		draw_set_font(fnt_wslui_info_med)
	    draw_areaheader(x1 + 22, y1 + 224 + 22, 218, 100, "Playing")
		draw_set_font(fnt_wslui)
	    if (draw_checkbox(x1 + 32, y1 + 224 + 16 + 22, realvolume, "Show layer volumes", "Whether to show the volume of layers.")) realvolume=!realvolume
		if (draw_checkbox(x1 + 32, y1 + 244 + 16 + 22, realstereo, "Disable stereo", "Disables stereo playback.")) realstereo = !realstereo
		if (draw_checkbox(x1 + 32, y1 + 264 + 16 + 22, looptobarend, "Loop to bar end", "Loops to the end of the bar/measure.")) looptobarend = !looptobarend
		if (draw_checkbox(x1 + 32, y1 + 284 + 16 + 22, show_soundcount, "Show number of active sounds", "Displays the number of sounds that are\ncurrently playing in the status bar.")) show_soundcount = !show_soundcount
		if (draw_checkbox(x1 + 32, y1 + 304 + 16 + 22, channelstoggle, "More audio channels", "Increase the amount of sounds that can\nplay at once.")) channelstoggle = !channelstoggle
		draw_set_font(fnt_wslui_info_med)
		draw_areaheader(x1 + 233 + 22, y1 + 224 + 22, 223, 60, "Tempo unit")
		draw_set_font(fnt_wslui)
		if (draw_radiobox(x1 + 233 + 32, y1 + 224 + 16 + 22, !use_bpm, "Ticks per second (t/s)", "Display song tempos in ticks per second.")) use_bpm = 0
		if (draw_radiobox(x1 + 233 + 32, y1 + 244 + 16 + 22, use_bpm, "Beats per minute (BPM)", "Display song tempos in beats per minute.")) use_bpm = 1
	}
	//if (draw_button2(x1 + 420, y1 + 478, 72, "OK")) {
	//	window = 0
	//	window_set_cursor(curs)
	//	save_settings()
	//	selected_tab = 0
	//}
}
