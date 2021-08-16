function get_default_window_scale() {
	//  96dpi = 100%
	// 120dpi = 125%
	// ...
	var dpi = display_get_dpi_x();
	return dpi / 96;
}