function draw_downloadprogress(argument0, argument1, argument2, argument3) {
	// draw_downloadprogress(caption, desc, downloaded_size, total_size)
	var caption, desc, done, total, done_mb, total_mb, done_text, total_text, text, percent, x1, y1;
	caption = argument0
	desc = argument1
	done = argument2
	total = argument3
	percent = done/total
	done_mb = done/power(1024, 2)
	total_mb = total/power(1024, 2)
	x1 = floor(rw / 2 - 150)
	y1 = floor(rh / 2 - 50)
	draw_theme_color()
	draw_window(x1, y1, x1 + 300, y1 + 100)
	draw_theme_font(font_main_bold)
	draw_text_dynamic(x1 + 16, y1 + 16, caption)
	draw_theme_font(font_main)
	draw_set_halign(fa_center)
	draw_text_dynamic(floor(rw / 2), y1 + 40, desc)
	draw_set_color(10512464)
	draw_rectangle(x1 + 30, y1 + 60, x1 + 30 + percent * 240, y1 + 80, 0)
	draw_theme_color()
	draw_rectangle(x1 + 30, y1 + 60, x1 + 270, y1 + 80, 1)
	if (percent > 0.5) draw_set_color(c_white)
	if (total <= 0) {
		done_text = "-.--"
		total_text = "-.--"
	} else {
		done_text = string_format(done_mb, 0, 2)
		total_text = string_format(total_mb, 0, 2)
	}
	text = done_text + "/" + total_text + " MB (" + string(round(percent * 100)) + "%)"
	draw_text_dynamic(floor(rw / 2), y1 + 65, text)
	draw_set_halign(fa_left)



}
