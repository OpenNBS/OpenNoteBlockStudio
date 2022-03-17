function draw_icon() {
	// draw_icon(i, xx, yy, str[, locked[, pressed]])
	var i, a, xx, yy, str, locked, pressed, iswindow;
	i = argument[0]
	xx = argument[1]
	yy = argument[2]
	str = argument[3]
	locked = 0
	pressed = 0
	iswindow = 0
	if (argument_count > 4)
	    locked = argument[4]
	if (argument_count > 5)
	    pressed = argument[5]
	if (argument_count > 6)
		iswindow = argument[6]
	if (window = 0) popup_set(xx, yy, 25, 25, str)
	else if (iswindow) popup_set_window(xx, yy, 25, 25, str)
	a = (mouse_rectangle(xx, yy, 25, 25) && (window = 0 || iswindow) && locked = 0 && sb_drag = -1)
	a += ((mouse_check_button(mb_left) || mouse_check_button_released(mb_left)) && a)
	if (pressed = 1) {
	    draw_sprite(spr_frame1, 2 + 3 * theme + (fdark && theme = 3) * 3 - (a = 1) * (theme = 3), xx, yy)
		if (theme = 3) draw_sprite_ext(spr_tabsel, 1, xx + 5, yy + 23, 1, 1, 0, accent[4], (!dropmode) + dropalpha * (dropmode))
	} else {
	    draw_sprite(spr_frame1, a + 3 * theme + (fdark && theme = 3) * 3, xx, yy)
	}
	if (theme != 3) {
	draw_sprite(spr_icons, i - locked, xx + (a = 2 || pressed = 1), yy + (a = 2 || pressed = 1))
	} else {
	if (!fdark) draw_sprite_ext(spr_icons_f, i - locked, xx + 25 * 0.1 * (a = 2), yy + 23 * 0.1 * (a = 2), 1 - 0.2 * (a = 2), 1 - 0.2 * (a = 2), 0, -1, (!dropmode) + dropalpha * (dropmode))
	else draw_sprite_ext(spr_icons_d, i - locked, xx + 25 * 0.1 * (a = 2), yy + 23 * 0.1 * (a = 2), 1 - 0.2 * (a = 2), 1 - 0.2 * (a = 2), 0, -1, (!dropmode) + dropalpha * (dropmode))
	}
	// Repeat trigger when holding fast-forward and rewind
	if (i = 7 || i = 8) return (a = 2)
	return (a && mouse_check_button_released(mb_left) && aa = 0)



}
