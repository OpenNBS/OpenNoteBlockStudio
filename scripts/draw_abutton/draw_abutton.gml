function draw_abutton(argument0, argument1, lock=false) {
	// draw_abutton(x, y)
	var xx, yy, m;
	xx = argument0
	yy = argument1
	m = !lock && mouse_rectangle(xx, yy, 17, 18) && sb_drag = -1 && w_isdragging = 0
	if (m) m += mouse_check_button(mb_left)
	if (hires && theme = 3) draw_sprite_ext(spr_button_arrow_hires, m + 3 * (fdark && theme = 3), xx, yy, 0.25, 0.25, 0, -1, draw_get_alpha())
	else draw_sprite(spr_button_arrow, m + 3 * theme + 3 * (fdark && theme = 3), xx, yy)
	if (!lock) return (m && mouse_check_button_released(mb_left))



}
