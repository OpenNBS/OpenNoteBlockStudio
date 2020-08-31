function draw_abutton(argument0, argument1) {
	// draw_abutton(x, y)
	var xx, yy, m;
	xx = argument0
	yy = argument1
	m = mouse_rectangle(xx, yy, 17, 18) && sb_drag = -1 && w_isdragging = 0
	if (m) m += mouse_check_button(mb_left)
	draw_sprite(spr_button_arrow, m + 3 * theme, xx, yy)
	return (m && mouse_check_button_released(mb_left))



}
