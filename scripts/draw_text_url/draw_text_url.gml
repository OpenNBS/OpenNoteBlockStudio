function draw_text_url(argument0, argument1, argument2, argument3) {
	// draw_text_url(x, y, text, url)
	// Draws a piece of text that opens a URL when clicked

	var xx, yy, text, url, width

	xx = argument0
	yy = argument1
	text = argument2
	url = argument3
	width = string_width(text)

	draw_set_color(make_color_rgb(62, 144, 255))
	draw_text_center(xx, yy, text)
	draw_line(xx - floor(width/2) - 1, yy + 12, xx + ceil(width/2) - 1, yy + 13)
	draw_theme_color()

	if (mouse_rectangle(xx - width/2, yy, width, 12)) {
	    curs = cr_handpoint
	    if (mouse_check_button_pressed(mb_left))
	        open_url(url)
	}



}
