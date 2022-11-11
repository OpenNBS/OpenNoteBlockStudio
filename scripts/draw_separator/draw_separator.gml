function draw_separator(argument0, argument1) {
	// draw_separator(x, y)
	var xx, yy;
	xx = argument0
	yy = argument1
	draw_set_color(8421504)
	if (!fdark || theme != 3) draw_line(xx - 1, yy, xx - 1, yy + 18)
	draw_set_color(c_white)
	if (fdark || theme != 3) draw_line(xx - (fdark && theme = 3), yy, xx - (fdark && theme = 3), yy + 18)



}
