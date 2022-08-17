function draw_macroicon(argument0, argument1, argument2, argument3, argument4, argument5) {
	// draw_icon(i, xx, yy, str, locked, pressed)
	var i, a, xx, yy, str, locked, pressed, color;
	i = argument0
	xx = argument1
	yy = argument2
	str = argument3
	locked = argument4
	pressed = argument5
	color = c_black
	if (theme = 2 || (fdark && theme = 3)) color = c_white

	popup_set(xx, yy, 16, 16, str)
	a = (mouse_rectangle(xx, yy, 16, 16) && window = 0 && locked = 0 && sb_drag = -1)
	a += ((mouse_check_button(mb_left) || mouse_check_button_released(mb_left)) && a)
	if (pressed = 1) {
	    draw_sprite(spr_frame4, 2 + 3 * theme + 3 * (fdark && theme = 3), xx, yy)
	} else {
	    draw_sprite(spr_frame4, a + 3 * theme + 3 * (fdark && theme = 3), xx, yy)
	}
	if (!hires || theme != 3) draw_sprite_ext(spr_macroicons, i - locked, xx + (a = 2 || pressed = 1), yy + (a = 2 || pressed = 1), 1, 1, 0, color, 0.7)
	else draw_sprite_ext(spr_macroicons_hires, i - locked, xx + (a = 2 || pressed = 1), yy + (a = 2 || pressed = 1), 0.25, 0.25, 0, color, 0.7)
	return (a && mouse_check_button_released(mb_left))


}
