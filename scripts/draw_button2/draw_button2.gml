function draw_button2() {
	// draw_button2(x, y, w, str[, lock])
	var xx, yy, w, str, lock, m, clr, a;
	xx = argument[0]
	yy = argument[1]
	w = argument[2]
	str = argument[3]
	lock = 0
	a = 0
	if (argument_count > 4)
	    lock = argument[4]
	if (argument_count > 5)
	    a = argument[5]
	m = 0
	clr = draw_get_color()
	if (lock = 1) {
		if (theme != 3){
	    draw_sprite_ext(spr_button, 10 + 6 * theme, xx, yy, w / 3, 1, 0, -1, 1)
	    draw_sprite(spr_button, 9 + 6 * theme, xx, yy)
	    draw_sprite(spr_button, 11 + 6 * theme, xx + w - 3, yy)
	    draw_set_color(10526880)
		} else {
		if (fdark) {
			draw_sprite_ext(spr_button, 46 + 24, xx + 3, yy, w / 3 - 2, 1, 0, -1, draw_get_alpha())
			draw_sprite(spr_button, 45 + 24, xx, yy)
			draw_sprite(spr_button, 47 + 24, xx + w - 3, yy)
		} else {
			draw_sprite_ext(spr_button, 46 + 12 * a, xx + 3, yy, w / 3 - 2, 1, 0, -1, draw_get_alpha())
			draw_sprite(spr_button, 45 + 12 * a, xx, yy)
			draw_sprite(spr_button, 47 + 12 * a, xx + w - 3, yy)
		}
		draw_set_color(8355711)
		}
	} else {
	    m = mouse_rectangle(xx, yy, w, 23) && w_isdragging = 0
	    if (m) m += mouse_check_button(mb_left)
		if (m && mouse_check_button_released(mb_left) && windowsound && theme = 3) play_sound(soundinvoke, 45, 100, 50, 0)
		if (theme != 3){
	    draw_sprite_ext(spr_button, 1 + m * 3 + 12 * theme, xx, yy, w / 3, 1, 0, -1, 1)
		} else {
		if (!fdark) draw_sprite_ext(spr_button, 1 + m * 3 + 12 * theme + 12 * a, xx + 3, yy, w / 3 - 2, 1, 0, accent[5 - m] * !a - a, draw_get_alpha())
		else draw_sprite_ext(spr_button, 1 + m * 3 + 12 * theme + 24 * a, xx + 3, yy, w / 3 - 2, 1, 0, accent[5 - m] * !a - a, draw_get_alpha())
		}
		if (fdark) {
			draw_sprite_ext(spr_button, m * 3 + 12 * theme + 24 * a * (theme = 3), xx, yy, 1, 1, 0, accent[5 - m] * (!a && theme = 3) - (a || theme != 3), draw_get_alpha())
			draw_sprite_ext(spr_button, 2 + m * 3 + 12 * theme + 24 * a * (theme = 3), xx + w - 3, yy, 1, 1, 0, accent[5 - m] * (!a && theme = 3) - (a || theme != 3), draw_get_alpha())
		} else {
			draw_sprite_ext(spr_button, m * 3 + 12 * theme + 12 * a * (theme = 3), xx, yy, 1, 1, 0, accent[5 - m] * (!a && theme = 3) - (a || theme != 3), draw_get_alpha())
			draw_sprite_ext(spr_button, 2 + m * 3 + 12 * theme + 12 * a * (theme = 3), xx + w - 3, yy, 1, 1, 0, accent[5 - m] * (!a && theme = 3) - (a || theme != 3), draw_get_alpha())
		}
	    draw_theme_color()
	}
	draw_set_halign(fa_center)
	if (lock && (theme = 2 || theme = 1)) {
	    draw_set_color(c_white)
	    draw_text(xx + w / 2 + (m = 2) + 1, yy + 4 + (m = 2) + 1, str)
	    draw_set_color(10526880)
	}
	if (theme = 3 && lock = 0 && a = 0) if (!fdark) draw_set_color(c_white) else draw_set_color(0)
	draw_text(xx + w / 2 + (m = 2), yy + 4 + (m = 2), str)
	if (theme = 3) draw_set_color(clr)
	draw_set_halign(fa_left)
	return (m && mouse_check_button_released(mb_left))


}
