function draw_checkbox() {
	// draw_checkbox(x, y, expression, str, tip[, locked])
	var xx, yy, expression, str, tip, m, lock, is_switch, x_offset;
	xx = argument[0]
	yy = argument[1]
	expression = argument[2]
	str = argument[3]
	tip = argument[4]
	lock = 0
	if (argument_count > 5) {
	    lock = argument[5]
	}
	if (theme == 3 && argument_count > 6) {
		is_switch = true;
		x_offset = 31;
	} else {
		is_switch = false;
		x_offset = 18;
	}
	if (tip != "") popup_set_window(xx, yy, 13 + string_width(str) + 8, 13, tip)
	if (lock = 1) {
		if (is_switch) {
			if (!expression) draw_sprite(spr_switch, 6 + 5 * (fdark), xx, yy)
			if (expression) draw_sprite(spr_switch, 7 + 5 * (fdark), xx, yy)
		} else {
			draw_sprite(spr_checkbox, 4 + expression + 6 * theme + 6 * (fdark) * (theme = 3), xx, yy)
			draw_set_color(make_color_rgb(204, 204, 204))
		}
		draw_set_color(make_color_rgb(204, 204, 204))			
		if (theme) {
		    draw_set_color(c_white)
		    draw_text(xx + x_offset + 1, yy, str)
		    draw_set_color(8421504)
		}
		draw_text(xx + x_offset, yy - 1, str)
		draw_theme_color()
	} else {
		m = mouse_rectangle(xx, yy, 26 + string_width(str) + 8, 13)
		if (w_isdragging > 0) m = 0
		if (m) m += mouse_check_button(mb_left)
		if (is_switch) {
			if (!expression) draw_sprite(spr_switch, m + 8 * (fdark), xx, yy)
			if (expression) draw_sprite(spr_switch, m + 3, xx, yy)
		} else {
			draw_sprite(spr_checkbox, m + 6 * theme + 6 * (fdark) * (theme = 3), xx, yy)
			if (expression) draw_sprite(spr_checkbox, 3 + 6 * theme + 6 * (fdark) * (theme = 3), xx, yy)
		}
		draw_text(xx + x_offset, yy - 1, str)
		return (m && mouse_check_button_released(mb_left))
	}
}
