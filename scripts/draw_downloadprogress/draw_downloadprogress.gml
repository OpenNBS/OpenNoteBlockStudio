function draw_downloadprogress(caption, desc, downloaded_bytes, total_bytes) {
	// Draw window
	var x1 = floor(rw / 2 - 150)
	var y1 = floor(rh / 2 - 50)
	draw_theme_color()
	draw_window(x1, y1, x1 + 300, y1 + 100)
	draw_theme_font(font_main_bold)
	draw_text_dynamic(x1 + 16, y1 + 16, caption)
	draw_theme_font(font_main)
	draw_set_halign(fa_center)
	draw_text_dynamic(floor(rw / 2), y1 + 40, desc)
	
	// Draw progress bar
	var percent_downloaded = downloaded_bytes / total_bytes
	var percent_downloaded_str = string(round(percent_downloaded * 100)) + "%"
	
	if (theme = 3) {
		draw_theme_color()
		draw_line(x1 + 30, y1 + 77, x1 + 270, y1 + 77)
		draw_set_color(accent[5])
		draw_set_alpha(0.5)
		draw_rectangle(x1 + 30, y1 + 77 - 1, x1 + 30 + percent_downloaded * 240, y1 + 77 + 1, 0)
		draw_set_alpha(1)
		draw_rectangle(x1 + 30 + 1, y1 + 77 - 1, x1 + 30 + clamp(percent_downloaded * 240, 1, 239), y1 + 77 + 1, 0)
		draw_rectangle(x1 + 30, y1 + 77, x1 + 30 + percent_downloaded * 240, y1 + 77, 0)
		draw_theme_color()
	} else {
		draw_set_color(10512464)
		draw_rectangle(x1 + 30, y1 + 60, x1 + 30 + percent_downloaded * 240, y1 + 80, 0)
		draw_theme_color()
		draw_rectangle(x1 + 30, y1 + 60, x1 + 270, y1 + 80, 1)
	}
	if (percent_downloaded > 0.5) draw_set_color(c_white)
	
	// Draw text
	var downloaded_size = downloaded_bytes / 1024
	var total_size = total_bytes / 1024
	var decimal_digits = 0;
	var size_unit = "KB";
	
	// If size > 1 MB, show in MB
	if (total_size >= 1024) {
		downloaded_size = downloaded_size / 1024
		total_size = total_size / 1024
		decimal_digits = 2;
		size_unit = "MB";
	}
	
	var downloaded_size_str, total_size_str;
	if (total_bytes <= 0) {
		downloaded_size_str = "-.--"
		total_size_str = "-.--"
	} else {
		downloaded_size_str = format_size(downloaded_size)
		total_size_str = format_size(total_size)
	}
	var text = downloaded_size_str + "/" + total_size_str + " " + size_unit + " (" + percent_downloaded_str + ")"
	
	if (theme = 3 && !fdark) draw_set_color(0)
	draw_text_dynamic(floor(rw / 2), y1 + 65 - 5 * (theme = 3), text)
	draw_theme_color()
	draw_set_halign(fa_left)
}


function format_size(size) {
	var decimal_digits = 2;
	if (size >= 10) decimal_digits = 1;
	if (size >= 100) decimal_digits = 0;
	
	return string_format(size, 0, decimal_digits);
}