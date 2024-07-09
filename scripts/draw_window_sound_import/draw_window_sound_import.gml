function draw_window_sound_import() {

	// Boilerplate
	windowanim = 1;
	if (theme = 3) draw_set_alpha(windowalpha);
	var x1, y1, a, n;
	
	// Window frame
	var width = 480;
	var height = 320;
	var startx = floor((rw - width) / 2);
	var starty = floor((rh - height) / 2) + windowoffset;
	var x1 = startx;
	var y1 = starty;
	draw_window(x1, y1, x1 + width, y1 + height);
	startx += 8;
	x1 = startx;
	y1 += 8;
	
	// Title
	draw_theme_font(font_main_bold)
	draw_text_dynamic(x1, y1, ((language == 0) ? "Import sounds" : "TRANSLATE"));
	draw_theme_font(font_main)
	
	// Info text
	x1 = startx;
	y1 += 20;
	draw_text_dynamic(
		x1, y1,
		"This assistant will help you extract sound files from your Minecraft: Java Edition" + "\n" +
		"installation." + "\n" +
		"Before continuing, ensure you have launched the version you want from the" + "\n" +
		"Minecraft Launcher." + "\n" +
		"Select a version from the list, and then click 'Import' to look for sounds!"
	)
	
	// Minecraft installation path
	x1 = startx;
	y1 += 100;
	draw_text_dynamic(x1, y1, "1. Set your Minecraft installation path:");
	x1 += 16;
	y1 += 20;
	draw_text_dynamic(x1, y1, string_truncate(mc_install_path, 280, true));
	x1 += 300;
	
	// Change button
	y1 -= 4
	if (draw_button2(x1, y1, 72, "Change", false, true)) {
		var fn = string(get_save_filename_ext("", "Select Minecraft installation directory", mc_install_path, "Minecraft installation directory"));
		if (fn != "") mc_install_path = filename_dir(fn);
		update_asset_index_menu();
	}
	x1 += 76;
	
	// Use default button
	if (draw_button2(x1, y1, 72, "Use default", false, true)) {
		mc_install_path = mc_default_path;
		update_asset_index_menu();
	}
	y1 += 4
	
	// Asset index select menu
	x1 = startx;
	y1 += 40;
	draw_text_dynamic(x1, y1, "2. Select the asset list to copy sounds from:");
	x1 += 16;
	y1 += 20;
	y1 += 1;
	draw_area(x1, y1, x1 + 100, y1 + 20);
	draw_text_dynamic(x1 + 4, y1 + 4, sound_import_selected_asset_index);
	if (draw_abutton(x1 + 100 - 16, y1 + 1, sound_import_menu_str == "")) {
		show_debug_message(sound_import_menu_str);
		menu = show_menu_ext("sound_import_asset_index", x1, y1, sound_import_menu_str);
	}
	y1 -= 1;
	x1 += 110;
	
	// Copy sounds button
	var is_locked = sound_import_selected_asset_index == "";
	if (draw_button2(x1, y1, 112, "Get sounds", is_locked, false)) {
		load_asset_index(true);
	}
	
	x1 = startx;
	y1 += 30;
	
	// Status text
	x1 += 16;
	draw_theme_font(font_main_bold);
	draw_theme_color();
	
	// 0 = idle; 1 = copying; 2 = copying done
	if (sound_import_status == 2) {
		if (theme == 3 && fdark || theme == 2) draw_set_color(c_lime);
		else draw_set_color(c_green);
		draw_text_dynamic(x1, y1, string(sound_import_asset_index_count) + " sounds have been copied!");
	} else if (sound_import_status == 1) {
		draw_text_dynamic(x1, y1, "Copying sounds... please wait!");
	} else {
		if (sound_import_asset_index_count > 0) {
			draw_text_dynamic(x1, y1, string(sound_import_asset_index_count) + " sounds located!");
		} else {
			draw_set_color(c_red);
			draw_text_dynamic(x1, y1, "No sounds located! Check your Minecraft installation path.");
		}
	}
	draw_theme_color();
	draw_theme_font(font_main);
	
	// Instrument settings button
	x1 = startx + 12;
	y1 = starty + height - 20 - 12;
	if (draw_button2(x1, y1, 120, "Instrument settings...", false, true)) {
		window = w_instruments;
	}
	// Sounds folder button
	x1 += 120 + 12;
	if (draw_button2(x1, y1, 120, "Open sounds folder", false, true)) {
		open_url(sounds_directory);
	}
	
	// OK button
	x1 = startx + width - 72 - 8 - 12;
	if (draw_button2(x1, y1, 72, "OK", false, false)) {
		sound_import_status = 0;
		window = 0;
	}
}
