function draw_radiobox() {
	// draw_radiobox(x, y, expression, str, tip[, locked])
	var xx, yy, expression, str, tip, m, lock;
	xx = argument[0]
	yy = argument[1]
	expression = argument[2]
	str = argument[3]
	tip = argument[4]
	lock = 0
	if (argument_count > 5)
	    lock = argument[5]
	if (tip != "") popup_set_window(xx, yy, 12 + string_width_dynamic(str) + 8, 12, tip)
	if (lock = 1) {
	    draw_sprite(spr_radiobox, 4 + expression + 6 * theme + 6 * (theme = 3) * fdark, xx, yy)
	    draw_set_color(make_color_rgb(204, 204, 204))
	    if (theme) {
	        draw_set_color(c_white)
	        draw_text_dynamic(xx + 19, yy, str)
	        draw_set_color(8421504)
	    }
	    draw_text_dynamic(xx + 18, yy - 1, str)
	    draw_theme_color()
	} else {
	    m = mouse_rectangle(xx, yy, 12 + string_width_dynamic(str) + 8, 12)
	    if (w_isdragging > 0) m = 0
	    if (m) m += mouse_check_button(mb_left)
	    draw_sprite(spr_radiobox, m + 6 * theme + 6 * (theme = 3) * fdark, xx, yy)
	    if (expression) draw_sprite_ext(spr_radiobox, 3 + 6 * theme, xx, yy, 1, 1, 0, accent[5] * (theme = 3) - !(theme = 3), draw_get_alpha())
	    draw_text_dynamic(xx + 18, yy - 1, str)
		if (m && mouse_check_button_released(mb_left) && windowsound && theme = 3 && instance_exists(obj_menu)) play_sound(soundinvoke, 45, 100, 50, 0)
	    return (m && mouse_check_button_released(mb_left)) * (!instance_exists(obj_menu))
	}



}
