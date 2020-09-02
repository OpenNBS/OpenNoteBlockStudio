function draw_icon() {
	// draw_icon(i, xx, yy, str[, locked[, pressed]])
	var i, a, xx, yy, str, locked, pressed;
	i = argument[0]
	xx = argument[1]
	yy = argument[2]
	str = argument[3]
	locked = 0
	pressed = 0
	if (argument_count > 4)
	    locked = argument[4]
	if (argument_count > 5)
	    pressed = argument[5]
	popup_set(xx, yy, 25, 25, str)
	a = (mouse_rectangle(xx, yy, 25, 25) && (window = 0) && locked = 0 && sb_drag = -1)
	a += ((mouse_check_button(mb_left) || mouse_check_button_released(mb_left)) && a)
	if (pressed = 1) {
	    draw_sprite(spr_frame1, 2 + 3 * theme, xx, yy)
	} else {
	    draw_sprite(spr_frame1, a + 3 * theme, xx, yy)
	}
	draw_sprite(spr_icons, i - locked, xx + (a = 2 || pressed = 1), yy + (a = 2 || pressed = 1))
	// Repeat trigger when holding fast-forward and rewind
	if (i = 7 || i = 8) return (a = 2)
	return (a && mouse_check_button_released(mb_left))



}
