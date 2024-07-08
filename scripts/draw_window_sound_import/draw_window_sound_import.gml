function draw_window_sound_import() {

	// Boilerplate
	windowanim = 1;
	if (theme = 3) draw_set_alpha(windowalpha);
	var x1, y1, a, n;
	
	// Window frame
	var width = 400;
	var height = 300;
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
		"This assistant will help you extract sound files from your Minecraft:" + "\n" +
		"Java Edition installation." + "\n" +
		"Before continuing, ensure you have launched the version you want from " + "\n" +
		"the Minecraft Launcher!" + "\n" +
		"Click 'Find asset lists' to look for the available asset lists, select one" + "\n" +
		"from the list, and then click 'Import' to look for sounds!"
	)
	
	// Minecraft installation path
	x1 = startx;
	y1 += 120;
	draw_text_dynamic(x1, y1, "1. Set your Minecraft installation path:");
	y1 += 20;
	draw_text_dynamic(x1, y1, mc_install_path);
	x1 += 300;
	
	// Change button
	y1 -= 4
	if (draw_button2(x1, y1, 72, "Change", false, true)) {
		var fn = string(get_save_filename_ext("", "Select Minecraft installation directory", mc_install_path, "Minecraft installation directory"));
		if (fn != "") mc_install_path = filename_dir(fn);
	}
	x1 += 76;
	
	// Use default button
	if (draw_button2(x1, y1, 72, "Use default", false, true)) {
		mc_install_path = mc_default_path
	}
	y1 += 4
	
	// Import sounds button
	x1 = startx;
	y1 += 30;
	draw_text_dynamic(x1, y1, "2. Search for available asset lists:");
	y1 += 20;
	if (draw_button2(x1, y1, 112, "Find asset lists", false, true)) {
		sound_import_asset_indexes = find_asset_indexes();
		show_debug_message(sound_import_asset_indexes);
		
		// Create menu
		for (var i = 0; i < array_length(sound_import_asset_indexes); i++) {
			sound_import_menu_str += check(sound_import_asset_index_select = i);
			sound_import_menu_str += sound_import_asset_indexes[i] + "|";
		}
		sound_import_menu_str = string_delete(sound_import_menu_str, string_length(sound_import_menu_str), 1)
		
	}
	
	// Asset index select menu
	x1 = startx;
	y1 += 30;
	draw_text_dynamic(x1, y1, "3. Select the asset list to copy sounds from:");
	y1 += 20;
	draw_area(x1, y1, x1 + 140, y1 + 16);
	if (draw_abutton(x1, y1)) {
		show_debug_message(sound_import_menu_str);
		menu = show_menu_ext("sound_import_asset_index", x1, y1, sound_import_menu_str);
	}
	x1 += 144
	
	// Located sounds count
	if (sound_import_asset_index_count > -1) {
		draw_text_dynamic(x1, y1, sound_import_asset_index_count + " sounds located!")
	}
	
	// Copy sounds button
	if (draw_button2(x1, y1, 112, "Get sounds", false, true)) {
		asset_indexes = load_asset_index(sound_import_asset_index_select, copy = true)
	}
	
	x1 = startx;
	y1 += 30;

	
	

}