function change_theme() {
	// change_theme()

	window_set_color(window_background)

	if (theme == 3 && acrylic && !wpaperexist) {
		wallpaper_init()
	}

}
